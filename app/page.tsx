'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import type { Module } from '@/lib/types';
import { useMobile } from '@/lib/useMobile';

function daysUntil(dateStr: string): number {
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  const target = new Date(dateStr);
  target.setHours(0, 0, 0, 0);
  return Math.round((target.getTime() - today.getTime()) / 86400000);
}

function ExamBadge({ examDate }: { examDate: string }) {
  const days = daysUntil(examDate);
  const date = new Date(examDate).toLocaleDateString('id-ID', { weekday: 'short', day: 'numeric', month: 'short' });

  if (days < 0) {
    return (
      <span style={{ fontSize: 11, fontWeight: 700, color: '#7d7979' }}>
        Ujian: {date} · Selesai
      </span>
    );
  }
  if (days === 0) {
    return (
      <span style={{ fontSize: 11, fontWeight: 700, color: '#b91c1c' }}>
        Ujian: Hari ini
      </span>
    );
  }
  return (
    <span style={{ fontSize: 11, fontWeight: 700, color: days <= 3 ? '#b91c1c' : '#605d5d' }}>
      Ujian: {date} · {days} hari lagi
    </span>
  );
}

const RINGKASAN_LINKS: Record<number, string> = {
  2: 'https://claude.ai/artifact/DUzYXFe26HKDsTrbHE96Fs',
  3: 'https://claude.ai/artifact/DW6UXEcLgJv3No7wQELQjh',
  4: 'https://claude.ai/artifact/WSz7rLkUy99tyfHuPHMHCz',
};

export default function Home() {
  const isMobile = useMobile();
  const px = isMobile ? 20 : 32;
  const [modules, setModules] = useState<Module[]>([]);

  useEffect(() => {
    fetch('/api/modules')
      .then((r) => r.json())
      .then(setModules)
      .catch(() => {});
  }, []);

  const btnBase: React.CSSProperties = {
    padding: '8px 16px',
    fontSize: 13,
    fontWeight: 700,
    borderRadius: 0,
    cursor: 'pointer',
    fontFamily: 'inherit',
    border: 'none',
    textDecoration: 'none',
    display: 'inline-block',
  };

  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2', fontFamily: 'inherit' }}>
      {/* Header */}
      <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
        <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
          <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM9 MLE OJK</span>
          {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Assessment Practices</span>}
        </div>
      </div>

      {/* Body */}
      <div style={{ flex: 1, padding: isMobile ? '32px 20px 48px' : '48px 32px 64px', maxWidth: 960, width: '100%', margin: '0 auto', boxSizing: 'border-box' }}>

        {/* Module cards */}
        <div style={{ marginBottom: 12 }}>
          <div style={{ fontSize: 11, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.08em', color: '#7d7979', marginBottom: 16 }}>
            Modul Ujian
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: isMobile ? '1fr' : '1fr 1fr', gap: 12 }}>
            {modules.length === 0 ? [1, 2, 3, 4].map((n) => (
              <div key={n} style={{ background: '#eae9e9', border: '2px solid rgba(32,30,29,0.1)', padding: '24px 28px', height: 160 }} />
            )) : modules.map((m) => {
              const hasQuestions = m.question_count > 0;
              return (
                <div key={m.id} style={{ background: '#fff', border: '2px solid rgba(32,30,29,0.2)', padding: '24px 28px', display: 'flex', flexDirection: 'column', gap: 0 }}>
                  {/* Module number chip */}
                  <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 10 }}>
                    <span style={{ fontSize: 11, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.08em', color: '#2F6FED', background: '#eaf1fd', padding: '3px 8px' }}>
                      Modul {m.number}
                    </span>
                    <ExamBadge examDate={m.exam_date} />
                  </div>

                  {/* Title */}
                  <div style={{ fontSize: isMobile ? 16 : 18, fontWeight: 800, lineHeight: 1.3, marginBottom: 8 }}>
                    {m.title}
                  </div>

                  {/* Stats */}
                  <div style={{ fontSize: 12.5, color: '#7d7979', marginBottom: 20 }}>
                    {hasQuestions
                      ? `${m.section_count} section · ${m.question_count} soal tersedia`
                      : 'Belum ada soal'}
                  </div>

                  {/* Action buttons */}
                  <div style={{ display: 'flex', gap: 8, marginTop: 'auto' }}>
                    {hasQuestions ? (
                      <>
                        <Link
                          href={`/quiz?module=${m.number}`}
                          style={{ ...btnBase, background: '#2F6FED', color: '#fff', flex: 1, textAlign: 'center' }}
                        >
                          Quiz
                        </Link>
                        <Link
                          href={`/drill?module=${m.number}`}
                          style={{ ...btnBase, background: 'transparent', color: '#201e1d', border: '1.5px solid rgba(32,30,29,0.35)', flex: 1, textAlign: 'center' }}
                        >
                          Drill
                        </Link>
                      </>
                    ) : (
                      <span style={{ fontSize: 12.5, color: '#b0adad', fontStyle: 'italic' }}>Soal belum tersedia</span>
                    )}
                    {RINGKASAN_LINKS[m.number] && (
                      <a
                        href={RINGKASAN_LINKS[m.number]}
                        target="_blank"
                        rel="noopener noreferrer"
                        style={{ ...btnBase, background: 'transparent', color: '#15803d', border: '1.5px solid #15803d', flex: 1, textAlign: 'center' }}
                      >
                        Ringkasan
                      </a>
                    )}
                  </div>
                </div>
              );
            })}
          </div>

        </div>

        {/* Kuis Aktual */}
        <div style={{ marginTop: 32 }}>
          <div style={{ fontSize: 11, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.08em', color: '#7d7979', marginBottom: 16 }}>
            Kuis Aktual
          </div>
          {modules.length === 0 ? (
            <div style={{ background: '#eae9e9', border: '2px solid rgba(32,30,29,0.1)', height: 160, maxWidth: isMobile ? '100%' : 'calc(50% - 6px)' }} />
          ) : (
            <div style={{ background: '#fff', border: '2px solid rgba(32,30,29,0.2)', padding: '24px 28px', display: 'flex', flexDirection: 'column', gap: 0, maxWidth: isMobile ? '100%' : 'calc(50% - 6px)' }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 10 }}>
                <span style={{ fontSize: 11, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.08em', color: '#b45309', background: '#fffbeb', padding: '3px 8px' }}>OJK LMS</span>
              </div>
              <div style={{ fontSize: isMobile ? 16 : 18, fontWeight: 800, lineHeight: 1.3, marginBottom: 8 }}>
                Kuis Modul 1
              </div>
              <div style={{ fontSize: 12.5, color: '#7d7979', marginBottom: 20 }}>
                273 soal tersedia
              </div>
              <div style={{ marginTop: 'auto' }}>
                <Link href="/lms" style={{ ...btnBase, background: '#2F6FED', color: '#fff', display: 'inline-block', padding: '8px 24px' }}>
                  Lihat Soal
                </Link>
              </div>
            </div>
          )}
        </div>

        {/* Divider */}
        <div style={{ borderTop: '1px solid rgba(32,30,29,0.15)', margin: '32px 0 28px' }} />

        {/* Utility row */}
        <div style={{ fontSize: 11, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.08em', color: '#7d7979', marginBottom: 14 }}>
          Tools
        </div>
        {modules.length === 0 ? (
          <div style={{ display: 'flex', gap: 10 }}>
            <div style={{ width: 130, height: 40, background: '#eae9e9' }} />
            <div style={{ width: 140, height: 40, background: '#eae9e9' }} />
          </div>
        ) : (
          <div style={{ display: 'flex', gap: 10, flexWrap: 'wrap' }}>
            <Link href="/bank" style={{ ...btnBase, background: '#fff', color: '#201e1d', border: '1.5px solid rgba(32,30,29,0.35)', padding: '10px 20px' }}>
              Question Bank
            </Link>
            <span
              style={{ ...btnBase, background: '#c8c6c6', color: '#7d7979', padding: '10px 20px', cursor: 'not-allowed' }}
              title="Coming soon"
            >
              Exam Simulation
            </span>
          </div>
        )}
      </div>

      {/* Footer */}
      <div style={{ padding: `16px ${px}px`, borderTop: '1px solid rgba(32,30,29,0.15)', display: 'flex', justifyContent: 'center' }}>
        <span style={{ fontSize: 12, color: '#7d7979' }}>PCAM9 MLE OJK — Internal Practice Platform</span>
      </div>
    </div>
  );
}
