import { sql } from '@/lib/db';

export async function PUT(request: Request, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const body = await request.json();
  const { title, position, draw_per_session } = body;
  const rows = await sql`
    UPDATE sections SET
      title = COALESCE(${title ?? null}, title),
      position = COALESCE(${position ?? null}, position),
      draw_per_session = COALESCE(${draw_per_session ?? null}, draw_per_session),
      updated_at = NOW()
    WHERE id = ${id}
    RETURNING *
  `;
  if (rows.length === 0) return Response.json({ error: 'not found' }, { status: 404 });
  return Response.json(rows[0]);
}

export async function DELETE(_request: Request, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  await sql`DELETE FROM sections WHERE id = ${id}`;
  return Response.json({ success: true });
}
