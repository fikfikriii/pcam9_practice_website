import { sql } from '@/lib/db';

export async function GET() {
  const rows = await sql`SELECT id, label FROM question_sources ORDER BY id`;
  return Response.json(rows);
}
