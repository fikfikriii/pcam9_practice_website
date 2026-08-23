import { sql } from '@/lib/db';

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const section_id = searchParams.get('section_id');
  if (!section_id) return Response.json({ error: 'section_id is required' }, { status: 400 });

  const rows = await sql`
    SELECT q.id, q.section_id, q.text, q.position, q.source,
      COALESCE(json_agg(
        json_build_object('id', c.id, 'text', c.text, 'position', c.position, 'is_correct', c.is_correct)
        ORDER BY c.position
      ) FILTER (WHERE c.id IS NOT NULL), '[]'::json) AS choices
    FROM questions q
    LEFT JOIN choices c ON c.question_id = q.id
    WHERE q.section_id = ${section_id}
    GROUP BY q.id
    ORDER BY q.position
  `;
  return Response.json(rows);
}

export async function POST(request: Request) {
  const body = await request.json();
  const { section_id, text, position = 0, source = 'additional', choices = [] } = body;
  if (!section_id || !text) return Response.json({ error: 'section_id and text are required' }, { status: 400 });

  const qRows = await sql`
    INSERT INTO questions (section_id, text, position, source)
    VALUES (${section_id}, ${text}, ${position}, ${source})
    RETURNING *
  `;
  const question = qRows[0];

  for (const choice of choices) {
    await sql`
      INSERT INTO choices (question_id, text, position, is_correct)
      VALUES (${question.id}, ${choice.text}, ${choice.position ?? 0}, ${choice.is_correct ?? false})
    `;
  }

  return Response.json(question, { status: 201 });
}
