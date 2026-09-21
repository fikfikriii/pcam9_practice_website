import { unified } from 'unified';
import remarkParse from 'remark-parse';
import remarkGfm from 'remark-gfm';
import remarkRehype from 'remark-rehype';
import rehypeSlug from 'rehype-slug';
import rehypeStringify from 'rehype-stringify';

export interface TocEntry { id: string; title: string; level: number; children: TocEntry[]; }
export interface ProcessedMarkdown { html: string; toc: TocEntry[]; }

function buildToc(markdown: string): TocEntry[] {
  const result: TocEntry[] = [];
  let h2: TocEntry | null = null;
  for (const line of markdown.split('\n')) {
    const m = line.match(/^(#{1,3})\s+(.+)/);
    if (!m) continue;
    const level = m[1].length;
    const title = m[2].trim();
    const id = title.toLowerCase().replace(/[^a-z0-9\s-]/g, '').replace(/\s+/g, '-');
    if (level === 1) { result.push({ id, title, level, children: [] }); h2 = null; }
    else if (level === 2) { h2 = { id, title, level, children: [] }; result.push(h2); }
    else if (level === 3 && h2) { h2.children.push({ id, title, level, children: [] }); }
  }
  return result;
}

// Module-level cache — persists across requests in the same server instance
const cache = new Map<string, ProcessedMarkdown>();

export async function processMarkdown(raw: string): Promise<ProcessedMarkdown> {
  if (cache.has(raw)) return cache.get(raw)!;
  const toc = buildToc(raw);

  // Wrap tables so they scroll on mobile
  const withTableWrap = raw.replace(
    /(<table[\s\S]*?<\/table>)/g,
    '<div class="table-wrapper">$1</div>'
  );

  const file = await unified()
    .use(remarkParse)
    .use(remarkGfm)
    .use(remarkRehype, { allowDangerousHtml: true })
    .use(rehypeSlug)
    .use(rehypeStringify, { allowDangerousHtml: true })
    .process(withTableWrap);

  const result: ProcessedMarkdown = { html: String(file), toc };
  cache.set(raw, result);
  return result;
}
