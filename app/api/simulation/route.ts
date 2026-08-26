import { sql } from '@/lib/db';

export async function GET() {
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
          'section_titles', (
            SELECT COALESCE(json_agg(s.title ORDER BY s.position), '[]'::json)
            FROM simulation_part_sections sps
            JOIN sections s ON s.id = sps.section_id
            WHERE sps.part_id = sp.id
          )
        ) ORDER BY sp.part_number
      ) FILTER (WHERE sp.id IS NOT NULL), '[]'::json) AS parts
    FROM simulation_configs sc
    LEFT JOIN simulation_parts sp ON sp.simulation_id = sc.id
    WHERE sc.is_active = TRUE
    GROUP BY sc.id, sc.title, sc.description, sc.is_active
    ORDER BY sc.id
  `;
  return Response.json(rows, { headers: { 'Cache-Control': 'no-store' } });
}
