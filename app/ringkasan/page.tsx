import fs from 'fs';
import path from 'path';
import RingkasanPage from '@/components/ringkasan/RingkasanPage';
import { processMarkdown, type ProcessedMarkdown } from '@/lib/markdownToHtml';

const CONTENT_DIR = path.join(process.cwd(), 'content', 'ringkasan');

const MODULE_CONFIG: Record<number, { id: string; label: string; file: string }[]> = {
  3: [
    { id: 'mr',    label: 'Manajemen Risiko', file: 'modul-3-mr.md' },
    { id: 'cyber', label: 'Cyber Risk',        file: 'modul-3-cyber.md' },
  ],
};

export interface TabData { id: string; label: string; processed: ProcessedMarkdown; }

function readFile(filename: string): string {
  const p = path.join(CONTENT_DIR, filename);
  return fs.existsSync(p) ? fs.readFileSync(p, 'utf-8') : '';
}

export default async function Page({
  searchParams,
}: {
  searchParams: Promise<{ module?: string; tab?: string }>;
}) {
  const { module: mod, tab } = await searchParams;
  const moduleNum = Number(mod) || 3;
  const config = MODULE_CONFIG[moduleNum] ?? [];

  const tabs: TabData[] = await Promise.all(
    config.map(async (t) => ({
      id: t.id,
      label: t.label,
      processed: await processMarkdown(readFile(t.file)),
    }))
  );

  const activeTab = tab && tabs.find((t) => t.id === tab) ? tab : tabs[0]?.id ?? '';

  return (
    <RingkasanPage
      tabs={tabs}
      activeTab={activeTab}
      moduleNum={moduleNum}
      availableModules={Object.keys(MODULE_CONFIG).map(Number)}
    />
  );
}
