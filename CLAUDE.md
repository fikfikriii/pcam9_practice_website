# PCAM 9 OJK — Claude Code Context

## Project overview
Internal exam-practice website for the PCAM 9 (OJK) certification. Next.js 15 App Router, PostgreSQL on Neon, deployed on Vercel. Three user-facing modules: `/quiz` (assessment), `/bank` (question bank), `/admin` (CRUD panel).

## Stack
- **Next.js 15** App Router — all pages are in `app/`, all API routes in `app/api/`
- **`@neondatabase/serverless`** — raw SQL via tagged template literals (`sql\`SELECT ...\``), no ORM
- **Tailwind CSS v3** — used for layout utilities; exact design token values always use inline styles
- **TypeScript** throughout

## File layout
```
app/
  page.tsx                  → redirects / to /quiz
  quiz/page.tsx             → imports QuizPage component
  bank/page.tsx             → imports BankPage component
  admin/page.tsx            → imports AdminPage component
  api/
    quiz/route.ts           → GET: sections + questions + choices (for quiz)
    bank/route.ts           → GET: sections + questions + choices (for bank)
    sections/route.ts       → GET list, POST create
    sections/[id]/route.ts  → PUT, DELETE
    questions/route.ts      → GET ?section_id=, POST (with choices)
    questions/[id]/route.ts → PUT, DELETE
    choices/[id]/route.ts   → PUT (auto-deselects other correct choices), DELETE
components/
  quiz/QuizPage.tsx         → full quiz UI (question, review, results views)
  bank/BankPage.tsx         → question bank browser
  admin/AdminPage.tsx       → section + question + choice CRUD
lib/
  db.ts                     → exports `sql` from @neondatabase/serverless
  types.ts                  → Choice, Question, Section interfaces
migration.sql               → idempotent schema + seed (130 questions)
seeds/                      → incremental SQL seed files (run manually after migration)
  seed_new_questions.sql    → first batch of additional questions
```

## Database
Three tables: `sections` → `questions` → `choices` (cascade deletes).

Key columns to know:
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
