# PCAM9 MLE OJK — Claude Code Context

## Project overview
Internal exam-practice website for the PCAM9 MLE (OJK) certification. Next.js 15 App Router, PostgreSQL on Neon, deployed on Vercel. Five user-facing pages: `/quiz` (mock exam), `/drill` (multi-section practice with category and source filters), `/bank` (question bank — lazy-loads questions per section), `/simulation` (disabled — button visible but non-functional, format TBD), `/admin` (CRUD panel, URL-only access).

## Stack
- **Next.js 15** App Router — all pages are in `app/`, all API routes in `app/api/`
- **`@neondatabase/serverless`** — raw SQL via tagged template literals (`sql\`SELECT ...\``), no ORM
- **Tailwind CSS v3** — used for layout utilities; exact design token values always use inline styles
- **TypeScript** throughout

## File layout
```
app/
  page.tsx                      → landing page: module cards with exam dates + Quiz/Drill links
  quiz/page.tsx                 → server component; reads ?module= and passes moduleId to QuizPage
  drill/page.tsx                → server component; reads ?module= and passes moduleId to DrillPage
  bank/page.tsx                 → imports BankPage component
  simulation/page.tsx           → imports SimulationPage component
  admin/page.tsx                → imports AdminPage component
  api/
    modules/route.ts            → GET: exam modules with section/question counts
    question-sources/route.ts   → GET: question source types (id + label)
    section-categories/route.ts → GET: section categories (id + label)
    quiz/route.ts               → GET: sections + questions + choices (is_active=TRUE, ?module=N)
    bank/route.ts               → GET: sections + questions + choices (all, ?module=N, or ?section_id=N for single section)
    sections/route.ts           → GET list, POST create
    sections/[id]/route.ts      → PUT, DELETE
    questions/route.ts          → GET ?section_id=, POST (with choices)
    questions/[id]/route.ts     → PUT, DELETE
    choices/[id]/route.ts       → PUT (auto-deselects other correct choices), DELETE
    simulation/route.ts         → GET: list of active simulation configs (with part metadata)
    simulation/[id]/route.ts    → GET: full config with all pooled questions per part
components/
  quiz/QuizPage.tsx             → full quiz UI (question, review, results views)
  drill/DrillPage.tsx           → drill UI: setup (multi-section + source filter), question, results
  bank/BankPage.tsx             → question bank browser; loads section metadata on mount, fetches questions per section on demand; filters: category → section → source
  simulation/SimulationPage.tsx → multi-part exam simulation UI
  admin/AdminPage.tsx           → section + question + choice CRUD
lib/
  db.ts                         → exports `sql` from @neondatabase/serverless
  types.ts                      → Choice, Question, Section, SectionMeta, Module, QuestionSource, SectionCategory
migration.sql                   → idempotent schema + seed + module/category/simulation DDL
seeds/                          → incremental SQL seed files (run manually after migration, one-time)
```

## Database
Nine tables total:
- Core: `sections` → `questions` → `choices` (cascade deletes)
- Simulation: `simulation_configs` → `simulation_parts` → `simulation_part_sections` (cascade deletes)
- Supporting: `modules`, `question_sources`, `section_categories`

### Supporting tables
- `modules` — exam modules: `id`, `number` (UNIQUE), `title`, `exam_date`
- `question_sources` — string PK master table: `id` (e.g. `'original'`), `label` (e.g. `'Original'`)
- `section_categories` — string PK master table: `id` (e.g. `'perbankan'`), `label` (e.g. `'Perbankan'`)

### Simulation tables
- `simulation_configs` — top-level exam config: `id`, `title`, `description`, `is_active`
- `simulation_parts` — parts within a config: `id`, `simulation_id`, `part_number`, `title`, `question_count`
- `simulation_part_sections` — many-to-many join: `part_id`, `section_id`
- The API draws `question_count` questions randomly from all questions in the part's assigned sections
- Session state stored in localStorage under key `pcam9-ojk-simulation-{configId}-v1`
- Sequential locking: user cannot reach Part N+1 until Part N is submitted

### Core tables — key columns
- `sections.is_active` — if `false`, excluded from `/api/quiz` but visible in `/api/bank`. Toggled via Admin panel.
- `sections.module_id` — FK to `modules.id`; assigns a section to an exam module
- `sections.category_id` — FK to `section_categories.id`; groups sections in the Drill setup UI and Question Bank category filter
- `questions.source` — FK to `question_sources.id`. Default `'original'`; admin panel defaults to `'additional'`
- `questions.position` — display order within a section, freely reorderable (not auto-increment)
- `choices.is_correct` — only one true per question. `PUT /api/choices/[id]` auto-deselects all others.
- User answers are **not** stored in the DB — they live in `localStorage`

### Exam modules (current)
| Number | Title | Exam date |
|---|---|---|
| 1 | Pendekatan Pengawasan | 2026-09-16 |
| 2 | Kelembagaan, Struktur, Produk & Aktivitas SJK | 2026-09-18 |
| 3 | Manajemen Risiko | 2026-09-22 |
| 4 | Materi Pendukung Pengawasan | 2026-09-25 |

### Section categories (current)
`perbankan`, `pasar_modal`, `inklusi`, `iakd`, `iknb`, `syariah`, `pvml`, `ppdp`
- Full names: Perbankan, Pasar Modal, Inklusi, IAKD (Inovasi Aset Keuangan Digital), IKNB (Industri Keuangan Non-Bank), Syariah, PVML (Perusahaan Pembiayaan/Ventura/Modal & Lainnya), PPDP
- Assigned to Module 1 sections; sections without `category_id` still appear in drill but without a group header
- Used in both Drill setup (group headers) and Question Bank (category filter row)

### Question sources (current)
`original` (Original / green), `additional` (AI / blue), `pcs7` (PCS7 / amber), `pcs8` (PCS8 / purple)

## API patterns
All routes use the `sql` tagged template literal from `lib/db.ts`. The quiz and bank GET routes return nested JSON (sections → questions → choices) via `json_agg` / `json_build_object`. New routes should follow the same pattern.

The quiz and bank routes accept `?module=N` — when present, filter by `s.module_id = (SELECT id FROM modules WHERE number = N)`. The bank route also accepts `?section_id=N` — returns a single section object (not an array) with its questions and choices.

`/api/sections` GET now includes `question_count` via a COUNT JOIN — used by BankPage to show counts in tabs without loading questions. The `SectionMeta` type represents this (same as `Section` but with `question_count: number` instead of `questions: Question[]`).

## Drill setup
DrillPage setup view:
- Fetches `/api/bank?module=N` (or all sections if no module)
- Fetches `/api/question-sources` and `/api/section-categories`
- Sections displayed grouped by `category_id` (category header + toggle buttons per section)
- "Select all / Deselect" per category; global "All / Clear"
- Source filter: buttons for All + each source present in the selected sections' question pool
- Question count slider: reflects pool size across all selected sections × chosen source
- `startDrill` shuffles the combined pool, draws `clampedCount`, then sorts by `position`

## Styling conventions
- **Design tokens as inline styles** — never Tailwind for colors, typography, or spacing that must match the spec exactly
- **Border-radius: 0** everywhere except radio dots and the flag badge (circles)
- **No animations** — state changes are instant
- Key tokens: background `#f3f2f2`, surface `#eae9e9`, primary blue `#2F6FED`, link blue `#1d4ed8`, success green `#15803d`, error red `#b91c1c`, flag amber `#d97706`
- Font: Archivo (loaded via `next/font/google`), weights 400/600/800

## Source badge colors (hardcoded in components)
```ts
const SOURCE_COLORS = {
  original:   { color: '#15803d', bg: '#eafaf1' },
  additional: { color: '#2F6FED', bg: '#eaf1fd' },
  pcs8:       { color: '#6d28d9', bg: '#f5f3ff' },
  pcs7:       { color: '#b45309', bg: '#fffbeb' },
};
```
Labels are fetched from `/api/question-sources` at runtime; colors are hardcoded per component.

## Env
- `DATABASE_URL` — Neon PostgreSQL connection string, set in `.env.local` locally and in Vercel environment variables for production
- `.env.local` is gitignored — never commit it

## Local scripts
- `npm run positions` — prints current sections from DB: section_id, title, section_pos, question_count, max_question_pos, is_active
  - Run this before writing a new seed file to know the correct starting `pos` and next `section_pos`
  - Script lives at `scripts/positions.sh`
- `npm run dump` — dumps all data (sections, questions, choices) as nested JSON to `dumps/dump_YYYY-MM-DD.json`
  - Reads `DATABASE_URL` from `.env.local`
  - Script lives at `scripts/dump.sh`
- `npm run docs` — generates `docs/questions_YYYY-MM-DD.docx` (questions + options only)
- `npm run docs -- --answers` — same but includes correct answers highlighted in green
  - Script lives at `scripts/generate-docs.mjs`, reads from today's dump file
