'use client';

import { useEffect, useRef, useState } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { useMobile } from '@/lib/useMobile';
import type { TabData } from '@/app/ringkasan/page';
import type { TocEntry } from '@/lib/markdownToHtml';

/* ── TOC ─────────────────────────────────────────────────────── */
function TocItem({ s, activeId, depth = 0 }: { s: TocEntry; activeId: string; depth?: number }) {
  const [open, setOpen] = useState(true);
  const isActive = activeId === s.id;
  const childActive = s.children.some((c) => c.id === activeId);
  return (
    <div>
      <div style={{ display: 'flex', alignItems: 'center' }}>
        <a href={`#${s.id}`} style={{
          flex: 1, fontSize: s.level === 3 ? 11.5 : 12.5, fontWeight: s.level <= 2 ? 700 : 400,
          color: isActive || (childActive && !open) ? '#2F6FED' : '#605d5d',
          textDecoration: 'none', lineHeight: 1.35, display: 'block',
          padding: `${s.level === 2 ? 5 : 3}px 0 ${s.level === 2 ? 5 : 3}px ${depth * 14}px`,
          borderLeft: isActive ? '2px solid #2F6FED' : '2px solid transparent',
        }}>
          {s.title}
        </a>
        {s.children.length > 0 && (
          <button onClick={() => setOpen((v) => !v)}
            style={{ background: 'none', border: 'none', cursor: 'pointer', padding: '2px 6px', color: '#9d9a9a', fontSize: 10, flexShrink: 0 }}>
            {open ? '▾' : '▸'}
          </button>
        )}
      </div>
      {s.children.length > 0 && open && s.children.map((c) => (
        <TocItem key={c.id} s={c} activeId={activeId} depth={depth + 1} />
      ))}
    </div>
  );
}

/* ── Main component ──────────────────────────────────────────── */
interface Props { tabs: TabData[]; activeTab: string; moduleNum: number; availableModules: number[]; }

export default function RingkasanPage({ tabs, activeTab, moduleNum, availableModules }: Props) {
  const isMobile = useMobile();
  const router = useRouter();
  const [currentTab, setCurrentTab] = useState(activeTab);
  const [activeId, setActiveId] = useState('');
  const contentRef = useRef<HTMLDivElement>(null);

  const tab = tabs.find((t) => t.id === currentTab) ?? tabs[0];

  // Scroll spy
  useEffect(() => {
    setActiveId('');
    const observer = new IntersectionObserver(
      (entries) => { for (const e of entries) { if (e.isIntersecting) { setActiveId(e.target.id); break; } } },
      { rootMargin: '-15% 0px -70% 0px' }
    );
    const headings = contentRef.current?.querySelectorAll('h1,h2,h3') ?? [];
    headings.forEach((el) => observer.observe(el));
    return () => observer.disconnect();
  }, [currentTab]);

  const px = isMobile ? 20 : 32;

  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2', fontFamily: 'inherit' }}>
      {/* Header */}
      <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
        <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
          <Link href="/" style={{ fontSize: 18, fontWeight: 800, textDecoration: 'none', color: '#201e1d' }}>PCAM9 MLE OJK</Link>
          <span style={{ fontSize: 13, color: '#605d5d' }}>Ringkasan Materi</span>
        </div>
        <div style={{ display: 'flex', gap: 6 }}>
          {[1, 2, 3, 4].map((n) => {
            const available = availableModules.includes(n);
            const active = n === moduleNum;
            return (
              <button key={n} onClick={() => available && router.push(`/ringkasan?module=${n}`)}
                style={{ padding: '5px 12px', fontSize: 12, fontWeight: 700, fontFamily: 'inherit', border: 'none', cursor: available ? 'pointer' : 'not-allowed', borderRadius: 0, background: active ? '#2F6FED' : available ? '#eae9e9' : '#c8c6c6', color: active ? '#fff' : available ? '#201e1d' : '#9d9a9a' }}
                title={available ? `Modul ${n}` : 'Belum tersedia'}>
                M{n}
              </button>
            );
          })}
        </div>
      </div>

      {/* Sub-tabs */}
      {tabs.length > 1 && (
        <div style={{ borderBottom: '1.5px solid rgba(32,30,29,0.15)', background: '#f3f2f2', padding: `0 ${px}px`, display: 'flex' }}>
          {tabs.map((t) => {
            const active = t.id === currentTab;
            return (
              <button key={t.id} onClick={() => setCurrentTab(t.id)}
                style={{ padding: '12px 20px', fontSize: 13, fontWeight: 700, fontFamily: 'inherit', background: 'none', border: 'none', borderBottom: active ? '2px solid #2F6FED' : '2px solid transparent', color: active ? '#2F6FED' : '#605d5d', cursor: 'pointer', marginBottom: -1.5 }}>
                {t.label}
              </button>
            );
          })}
        </div>
      )}

      {tab?.processed.html ? (
        <div style={{ flex: 1, display: 'flex', maxWidth: 1200, width: '100%', margin: '0 auto', boxSizing: 'border-box' }}>
          {/* Sidebar TOC */}
          {!isMobile && (
            <div style={{ width: 268, flexShrink: 0, padding: '28px 16px 32px 32px', position: 'sticky', top: 0, height: '100vh', overflowY: 'auto', boxSizing: 'border-box', borderRight: '1px solid rgba(32,30,29,0.1)' }}>
              <div style={{ fontSize: 10, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.08em', color: '#7d7979', marginBottom: 10 }}>Daftar Isi</div>
              <nav style={{ display: 'flex', flexDirection: 'column' }}>
                {tab.processed.toc.map((s) => <TocItem key={s.id} s={s} activeId={activeId} />)}
              </nav>
            </div>
          )}

          {/* Content */}
          <div
            ref={contentRef}
            className="ringkasan-content"
            style={{ flex: 1, padding: isMobile ? '32px 20px 64px' : '40px 48px 80px 40px', minWidth: 0 }}
            dangerouslySetInnerHTML={{ __html: tab.processed.html }}
          />
        </div>
      ) : (
        <div style={{ flex: 1, display: 'flex', alignItems: 'center', justifyContent: 'center', flexDirection: 'column', gap: 12 }}>
          <div style={{ fontSize: 16, fontWeight: 700 }}>Ringkasan belum tersedia</div>
          <div style={{ fontSize: 13, color: '#7d7979' }}>Modul {moduleNum} belum memiliki ringkasan materi.</div>
          <Link href="/" style={{ marginTop: 8, fontSize: 13, color: '#2F6FED' }}>← Kembali ke beranda</Link>
        </div>
      )}

      <div style={{ padding: `16px ${px}px`, borderTop: '1px solid rgba(32,30,29,0.15)', display: 'flex', justifyContent: 'center' }}>
        <span style={{ fontSize: 12, color: '#7d7979' }}>PCAM9 MLE OJK — Internal Practice Platform</span>
      </div>
    </div>
  );
}
