# PCAM 9 OJK — Exam Practice Platform

Internal practice platform for the PCAM 9 (OJK) certification. Questions are organized by exam module and section category.

## Pages

| Path | Description |
|---|---|
| `/` | Landing page — module cards with exam dates, links to Quiz and Drill per module |
| `/quiz` | Mock exam: all sections in a module, one question per screen, flag-for-review, scored results |
| `/drill` | Focused practice: pick sections by category and source filter, configurable question count |
| `/bank` | Question bank: read-only, filterable by section and source, correct answers shown |
| `/simulation` | Full exam simulation: multi-part, sequential locking, drawn randomly from section pools |
| `/admin` | CRUD panel for sections, questions, and choices (accessible via URL only) |

## Exam Modules

| Module | Title | Exam Date |
|---|---|---|
| 1 | Pendekatan Pengawasan | 2026-09-16 |
| 2 | Kelembagaan, Struktur, Produk & Aktivitas SJK | 2026-09-18 |
| 3 | Manajemen Risiko | 2026-09-22 |
| 4 | Materi Pendukung Pengawasan | 2026-09-25 |

## Section Categories (Module 1)

Sections within a module are grouped by category in the Drill setup:

| Category | Sections |
|---|---|
| Perbankan | Aplikasi Perbankan, Pengawasan Bank Berbasis Risiko |
| Pasar Modal | Pengawasan SRO Pasar Modal |
| Inklusi | Inklusi Keuangan |
| IAKD | IAKD (Inovasi Aset Keuangan Digital) |
| IKNB | Layanan Urun Dana |
| Syariah | — |

## Question Sources

Every question is tagged with a source, shown as a colored badge:

| ID | Label | Color |
|---|---|---|
| `original` | Original | Green |
| `additional` | AI | Blue |
| `pcs7` | PCS7 | Amber |
| `pcs8` | PCS8 | Purple |

## Tech Stack

- **Framework**: Next.js 15 (App Router) — deployed on Vercel
- **Database**: PostgreSQL via [Neon](https://neon.tech)
- **DB client**: `@neondatabase/serverless` — raw SQL, no ORM
- **Styling**: Tailwind CSS v3 + inline styles for design token precision
- **Font**: Archivo 400/600/800

## Getting Started

### 1. Clone and install

```bash
git clone <repo-url>
cd practice_website
npm install
```

### 2. Set up environment

Create `.env.local` in the project root:

```
DATABASE_URL=postgresql://...
```

Get the connection string from your [Neon dashboard](https://neon.tech).

### 3. Run the database migration

```bash
export $(grep DATABASE_URL .env.local | xargs) && psql $DATABASE_URL -f migration.sql
```

The migration is idempotent — safe to run multiple times. It creates all tables, seeds the base question set, sets up exam modules, section categories, and simulation config.

### 4. Apply incremental seed files

Additional question batches live in `seeds/`. Run them once per database after the migration:

```bash
export $(grep DATABASE_URL .env.local | xargs)
psql $DATABASE_URL -f seeds/seed_new_questions.sql
psql $DATABASE_URL -f seeds/seed_laporan_keuangan.sql
psql $DATABASE_URL -f seeds/seed_data_analytics.sql
psql $DATABASE_URL -f seeds/seed_iakd_pcs7.sql
psql $DATABASE_URL -f seeds/seed_pbkn.sql
psql $DATABASE_URL -f seeds/seed_ppdp.sql
psql $DATABASE_URL -f seeds/seed_ppdp_pcs7.sql
psql $DATABASE_URL -f seeds/seed_kuis_sertifikasi.sql
psql $DATABASE_URL -f seeds/seed_simulation_config.sql
```

Each seed file is a one-time INSERT — not idempotent. Only run each file once per database.

### 5. Run locally

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000).

## Local Scripts

| Command | Description |
|---|---|
| `npm run positions` | Prints sections from DB: id, title, position, question count, is_active. Run before writing a new seed. |
| `npm run dump` | Dumps all data to `dumps/dump_YYYY-MM-DD.json` |
| `npm run docs` | Generates `docs/questions_YYYY-MM-DD.docx` — questions + options only |
| `npm run docs -- --answers` | Same but with correct answers highlighted |

## API Endpoints

| Method | Path | Description |
|---|---|---|
| GET | `/api/modules` | List of exam modules with section/question counts |
| GET | `/api/question-sources` | List of question source types |
| GET | `/api/section-categories` | List of section categories |
| GET | `/api/quiz` | Sections + questions + choices for quiz (`?module=N`) |
| GET | `/api/bank` | All sections + questions + choices for bank/drill (`?module=N`) |
| GET / POST | `/api/sections` | List or create sections |
| PUT / DELETE | `/api/sections/[id]` | Update or delete a section |
| GET / POST | `/api/questions` | List by `?section_id=` or create with choices |
| PUT / DELETE | `/api/questions/[id]` | Update or delete a question |
| PUT / DELETE | `/api/choices/[id]` | Update or delete a choice |
| GET | `/api/simulation` | List active simulation configs (with part metadata) |
| GET | `/api/simulation/[id]` | Full config with pooled questions per part |

## Database Schema

Six core tables: `sections` → `questions` → `choices` (cascade deletes), plus `simulation_configs` → `simulation_parts` → `simulation_part_sections`.

Supporting tables: `modules`, `question_sources`, `section_categories`.

**Key rules:**
- `sections.is_active` — if false, excluded from `/api/quiz` but visible in `/api/bank`
- `sections.module_id` — assigns a section to an exam module
- `sections.category_id` — groups sections by category within the Drill setup
- `questions.source` — FK to `question_sources`; tagged badge in all views
- `choices.is_correct` — only one true per question; `PUT /api/choices/[id]` auto-deselects others
- User answers are in `localStorage`, not the database

## Design Tokens

| Token | Value | Usage |
|---|---|---|
| Background | `#f3f2f2` | Page background |
| Surface | `#eae9e9` | Question panel |
| Ink | `#201e1d` | Primary text |
| Primary blue | `#2F6FED` | Buttons, active states |
| Link blue | `#1d4ed8` | Links, eyebrow text |
| Selected tint | `#eaf1fd` | Selected option background |
| Success green | `#15803d` | Answered tiles, correct answers |
| Error red | `#b91c1c` | Incorrect answers |
| Flag amber | `#d97706` | Flag badge |
| Divider (structural) | `rgba(32,30,29,0.4)` | 2px borders |
| Divider (hairline) | `rgba(32,30,29,0.15)` | 1px row separators |

- **Border-radius**: 0 everywhere except radio dots and flag badge (circles)
- **Header height**: 68px

## Deployment

1. Push to GitHub
2. Import on [vercel.com](https://vercel.com)
3. Add `DATABASE_URL` in **Settings → Environment Variables**
4. Redeploy
