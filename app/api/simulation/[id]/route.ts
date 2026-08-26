import { sql } from '@/lib/db';

export async function GET(req: Request, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const configId = parseInt(id, 10);
  if (isNaN(configId)) return Response.json({ error: 'Invalid id' }, { status: 400 });

  const rows = await sql`
    SELECT
      sc.id,
      sc.title,
      sc.description,
      sc.is_active,
      COALESCE(json_agg(
        json_build_object(
          'id', sp.id,
          'part_number', sp.part_number,
          'title', sp.title,
          'question_count', sp.question_count,
          'questions', (
            SELECT COALESCE(json_agg(
              json_build_object(
                'id', q.id,
                'text', q.text,
                'position', q.position,
                'source', q.source,
                'section_id', q.section_id,
                'section_title', s.title,
                'choices', (
                  SELECT COALESCE(json_agg(
                    json_build_object('id', c.id, 'text', c.text, 'position', c.position, 'is_correct', c.is_correct)
                    ORDER BY c.position
                  ), '[]'::json)
                  FROM choices c WHERE c.question_id = q.id
                )
              )
            ), '[]'::json)
            FROM simulation_part_sections sps
            JOIN sections s ON s.id = sps.section_id
            JOIN questions q ON q.section_id = s.id
            WHERE sps.part_id = sp.id
          )
        ) ORDER BY sp.part_number
      ) FILTER (WHERE sp.id IS NOT NULL), '[]'::json) AS parts
    FROM simulation_configs sc
    LEFT JOIN simulation_parts sp ON sp.simulation_id = sc.id
    WHERE sc.id = ${configId}
    GROUP BY sc.id, sc.title, sc.description, sc.is_active
  `;

  if (!rows || rows.length === 0) return Response.json({ error: 'Not found' }, { status: 404 });
  return Response.json(rows[0], { headers: { 'Cache-Control': 'no-store' } });
}
