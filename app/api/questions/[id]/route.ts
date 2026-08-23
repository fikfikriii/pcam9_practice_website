import { sql } from '@/lib/db';

export async function PUT(request: Request, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const body = await request.json();
  const { text, position, source } = body;
  const rows = await sql`
    UPDATE questions SET
      text = COALESCE(${text ?? null}, text),
      position = COALESCE(${position ?? null}, position),
      source = COALESCE(${source ?? null}, source),
      updated_at = NOW()
    WHERE id = ${id}
    RETURNING *
  `;
  if (rows.length === 0) return Response.json({ error: 'not found' }, { status: 404 });
  return Response.json(rows[0]);
}

export async function DELETE(_request: Request, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  await sql`DELETE FROM questions WHERE id = ${id}`;
  return Response.json({ success: true });
}
