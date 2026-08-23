import { sql } from '@/lib/db';

export async function GET() {
  const rows = await sql`SELECT * FROM sections ORDER BY position`;
  return Response.json(rows);
}

export async function POST(request: Request) {
  const body = await request.json();
  const { title, position = 0, draw_per_session = 10 } = body;
  if (!title) return Response.json({ error: 'title is required' }, { status: 400 });
  const rows = await sql`
    INSERT INTO sections (title, position, draw_per_session)
    VALUES (${title}, ${position}, ${draw_per_session})
    RETURNING *
  `;
  return Response.json(rows[0], { status: 201 });
}
