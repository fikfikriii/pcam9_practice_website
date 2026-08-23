import { sql } from '@/lib/db';

export async function PUT(request: Request, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const body = await request.json();
  const { text, position, is_correct } = body;

  // If setting is_correct to true, first reset all other choices for this question
  if (is_correct === true) {
    const choiceRows = await sql`SELECT question_id FROM choices WHERE id = ${id}`;
    if (choiceRows.length > 0) {
      const question_id = choiceRows[0].question_id;
      await sql`UPDATE choices SET is_correct = FALSE WHERE question_id = ${question_id}`;
    }
  }

  const rows = await sql`
    UPDATE choices SET
      text = COALESCE(${text ?? null}, text),
      position = COALESCE(${position ?? null}, position),
      is_correct = COALESCE(${is_correct ?? null}, is_correct),
      updated_at = NOW()
    WHERE id = ${id}
    RETURNING *
  `;
  if (rows.length === 0) return Response.json({ error: 'not found' }, { status: 404 });
  return Response.json(rows[0]);
}

export async function DELETE(_request: Request, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  await sql`DELETE FROM choices WHERE id = ${id}`;
  return Response.json({ success: true });
}
