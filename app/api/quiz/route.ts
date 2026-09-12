import { sql } from '@/lib/db';

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const moduleParam = searchParams.get('module');
  const moduleId = moduleParam ? parseInt(moduleParam) : null;

  const rows = moduleId
    ? await sql`
        SELECT s.id, s.title, s.position, s.draw_per_session, s.is_active, s.module_id,
          COALESCE(json_agg(
            json_build_object(
              'id', q.id, 'text', q.text, 'position', q.position, 'section_id', q.section_id, 'source', q.source,
              'choices', (
                SELECT COALESCE(json_agg(
                  json_build_object('id', c.id, 'text', c.text, 'position', c.position, 'is_correct', c.is_correct)
                  ORDER BY c.position
                ), '[]'::json)
                FROM choices c WHERE c.question_id = q.id
              )
            ) ORDER BY q.position
          ) FILTER (WHERE q.id IS NOT NULL), '[]'::json) AS questions
        FROM sections s
        LEFT JOIN questions q ON q.section_id = s.id
        WHERE s.is_active = TRUE AND s.module_id = ${moduleId}
        GROUP BY s.id
        ORDER BY s.position
      `
    : await sql`
        SELECT s.id, s.title, s.position, s.draw_per_session, s.is_active, s.module_id,
          COALESCE(json_agg(
            json_build_object(
              'id', q.id, 'text', q.text, 'position', q.position, 'section_id', q.section_id, 'source', q.source,
              'choices', (
                SELECT COALESCE(json_agg(
                  json_build_object('id', c.id, 'text', c.text, 'position', c.position, 'is_correct', c.is_correct)
                  ORDER BY c.position
                ), '[]'::json)
                FROM choices c WHERE c.question_id = q.id
              )
            ) ORDER BY q.position
          ) FILTER (WHERE q.id IS NOT NULL), '[]'::json) AS questions
        FROM sections s
        LEFT JOIN questions q ON q.section_id = s.id
        WHERE s.is_active = TRUE
        GROUP BY s.id
        ORDER BY s.position
      `;

  return Response.json(rows, { headers: { 'Cache-Control': 'no-store' } });
}
