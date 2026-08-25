# PCAM 9 OJK — Claude Code Context

## Project overview
Internal exam-practice website for the PCAM 9 (OJK) certification. Next.js 15 App Router, PostgreSQL on Neon, deployed on Vercel. Four user-facing modules: `/quiz` (mock exam), `/drill` (section-focused practice), `/bank` (question bank), `/admin` (CRUD panel).

## Stack
- **Next.js 15** App Router — all pages are in `app/`, all API routes in `app/api/`
- **`@neondatabase/serverless`** — raw SQL via tagged template literals (`sql\`SELECT ...\``), no ORM
- **Tailwind CSS v3** — used for layout utilities; exact design token values always use inline styles
- **TypeScript** throughout

## File layout
```
app/
  page.tsx                  → landing page with module cards (Module 1–3 + admin)
  quiz/page.tsx             → imports QuizPage component
  drill/page.tsx            → imports DrillPage component
  bank/page.tsx             → imports BankPage component
  admin/page.tsx            → imports AdminPage component
  api/
    quiz/route.ts           → GET: sections + questions + choices (for quiz)
    bank/route.ts           → GET: sections + questions + choices (for bank + drill)
    sections/route.ts       → GET list, POST create
    sections/[id]/route.ts  → PUT, DELETE
    questions/route.ts      → GET ?section_id=, POST (with choices)
    questions/[id]/route.ts → PUT, DELETE
    choices/[id]/route.ts   → PUT (auto-deselects other correct choices), DELETE
components/
  quiz/QuizPage.tsx         → full quiz UI (question, review, results views)
  drill/DrillPage.tsx       → section drill UI (setup, question, results views)
  bank/BankPage.tsx         → question bank browser
  admin/AdminPage.tsx       → section + question + choice CRUD
lib/
  db.ts                     → exports `sql` from @neondatabase/serverless
  types.ts                  → Choice, Question, Section interfaces
migration.sql               → idempotent schema + seed (130 questions)
seeds/                      → incremental SQL seed files (run manually after migration)
  seed_new_questions.sql    → additional AI-generated questions for existing sections
  seed_data_analytics.sql   → 10 original questions, new 'Data Analytics' section (IAI class materials)
```

## Database
Three tables: `sections` → `questions` → `choices` (cascade deletes).

Key columns to know:
- `sections.is_active` — boolean (default `true`). If `false`, the section is excluded from `/api/quiz` (quiz module) but still visible in `/api/bank` (drill + question bank). Toggled via the Admin panel's Activate/Deactivate button.
- `questions.source` — `'original'` (from class PDFs) or `'additional'` (AI-generated). Default is `'original'`.
- `questions.position` — display order within a section, freely reorderable integer (not auto-increment)
- `choices.is_correct` — boolean; only one per question should be true. The PUT `/api/choices/[id]` endpoint auto-deselects all others when setting one to true.
- User answers are **not** stored in the DB — they live in `localStorage` under key `pcam9-ojk-quiz-progress-v1`

## API patterns
All routes use the `sql` tagged template literal from `lib/db.ts`. The quiz and bank GET routes return a nested JSON structure (sections containing questions containing choices) via a single SQL query using `json_agg` / `json_build_object`. New API routes should follow the same pattern.

## Styling conventions
- **Design tokens as inline styles** — never Tailwind for colors, typography, or spacing that must match the spec exactly
- **Border-radius: 0** everywhere except radio dots and the flag badge (circles)
- **No animations** — state changes are instant
- Key tokens: background `#f3f2f2`, surface `#eae9e9`, primary blue `#2F6FED`, link blue `#1d4ed8`, success green `#15803d`, error red `#b91c1c`, flag amber `#d97706`
- Font: Archivo (loaded via `next/font/google`), weights 400/600/800

## Question source tagging
- `original` = questions from class PDF materials (green badge in UI)
- `additional` = AI-generated questions (blue badge in UI)
- When inserting via admin panel, new questions default to `'additional'`
- When inserting via migration seed, explicitly set `source = 'additional'` for AI questions; omit source for original questions (defaults to `'original'`)

## Env
- `DATABASE_URL` — Neon PostgreSQL connection string, set in `.env.local` locally and in Vercel environment variables for production
- `.env.local` is gitignored — never commit it

## Local scripts
- `npm run dump` — dumps all data (sections, questions, choices) as nested JSON to `dumps/dump_YYYY-MM-DD.json`
  - Reads `DATABASE_URL` from `.env.local`
  - Script lives at `scripts/dump.sh`
  - `dumps/` folder is for local use only — not an API endpoint
- `npm run docs` — generates `docs/questions_YYYY-MM-DD.docx` (questions + options only)
- `npm run docs -- --answers` — same but includes correct answers highlighted in green
  - Script lives at `scripts/generate-docs.mjs`, reads from today's dump file
