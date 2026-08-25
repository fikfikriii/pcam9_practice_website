#!/usr/bin/env bash
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

# Load DATABASE_URL from .env.local
if [ -f "$ROOT/.env.local" ]; then
  export $(grep -v '^#' "$ROOT/.env.local" | xargs)
fi

if [ -z "$DATABASE_URL" ]; then
  echo "Error: DATABASE_URL not set in .env.local" >&2
  exit 1
fi

mkdir -p "$ROOT/dumps"
OUT="$ROOT/dumps/dump_$(date +%Y-%m-%d).json"

psql "$DATABASE_URL" -t -c "
SELECT json_agg(
  json_build_object(
    'id', s.id, 'title', s.title, 'position', s.position, 'draw_per_session', s.draw_per_session,
    'questions', (
      SELECT COALESCE(json_agg(
        json_build_object(
          'id', q.id, 'text', q.text, 'position', q.position, 'source', q.source,
          'choices', (
            SELECT COALESCE(json_agg(
              json_build_object('id', c.id, 'text', c.text, 'position', c.position, 'is_correct', c.is_correct)
              ORDER BY c.position
            ), '[]'::json)
            FROM choices c WHERE c.question_id = q.id
          )
        ) ORDER BY q.position
      ), '[]'::json)
      FROM questions q WHERE q.section_id = s.id
    )
  ) ORDER BY s.position
)
FROM sections s;
" > "$OUT"

echo "Dumped to $OUT ($(wc -c < "$OUT" | tr -d ' ') bytes)"
