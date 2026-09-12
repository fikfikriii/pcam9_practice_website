import { sql } from '@/lib/db';

export async function GET() {
  const rows = await sql`
    SELECT
      m.id, m.number, m.title, m.exam_date::text,
      COUNT(DISTINCT s.id)::int  AS section_count,
      COUNT(q.id)::int           AS question_count
    FROM modules m
    LEFT JOIN sections s ON s.module_id = m.id AND s.is_active = TRUE
    LEFT JOIN questions q ON q.section_id = s.id
    GROUP BY m.id, m.number, m.title, m.exam_date
    ORDER BY m.number
  `;
  return Response.json(rows, { headers: { 'Cache-Control': 'no-store' } });
}
