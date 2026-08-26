#!/usr/bin/env bash
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

if [ -f "$ROOT/.env.local" ]; then
  export $(grep -v '^#' "$ROOT/.env.local" | xargs)
fi

if [ -z "$DATABASE_URL" ]; then
  echo "Error: DATABASE_URL not set in .env.local" >&2
  exit 1
fi

psql "$DATABASE_URL" -c "
SELECT
  s.id                              AS section_id,
  s.title                           AS section_title,
  s.position                        AS section_pos,
  COUNT(q.id)                       AS question_count,
  COALESCE(MAX(q.position), 0)      AS max_question_pos,
  s.is_active
FROM sections s
LEFT JOIN questions q ON q.section_id = s.id
GROUP BY s.id, s.title, s.position, s.is_active
ORDER BY s.position;
"
