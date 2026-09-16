'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { LMS_QUESTIONS } from '@/lib/lms-questions';
import { useMobile } from '@/lib/useMobile';

export default function LmsPage() {
  const router = useRouter();
  const isMobile = useMobile();
  const px = isMobile ? 16 : 32;
  const [search, setSearch] = useState('');

  const filtered = search.trim()
    ? LMS_QUESTIONS.filter((q) =>
        q.text.toLowerCase().includes(search.toLowerCase()) ||
        q.options.some((o) => o.text.toLowerCase().includes(search.toLowerCase()))
      )
    : LMS_QUESTIONS;

  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2' }}>
      {/* Header */}
      <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
        <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
          <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM9 MLE OJK</span>
          {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Soal Aktual OJK</span>}
        </div>
        <button
          onClick={() => router.push('/')}
          style={{ background: 'transparent', border: '1.5px solid rgba(32,30,29,0.4)', color: '#201e1d', padding: '7px 16px', fontSize: 13, fontWeight: 600, borderRadius: 0, cursor: 'pointer', fontFamily: 'inherit' }}
        >
          Home
        </button>
      </div>

      {/* Search + count */}
      <div style={{ padding: `20px ${px}px 0`, maxWidth: 760, width: '100%', margin: '0 auto', boxSizing: 'border-box' }}>
        <input
          type="text"
          placeholder="Cari soal..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          style={{ width: '100%', padding: '10px 14px', fontSize: 14, border: '1.5px solid rgba(32,30,29,0.3)', borderRadius: 0, background: '#fff', fontFamily: 'inherit', outline: 'none', boxSizing: 'border-box' }}
        />
        <div style={{ fontSize: 12, color: '#7d7979', marginTop: 10 }}>
          {filtered.length} soal{search ? ` ditemukan` : ' tersedia'}
        </div>
      </div>

      {/* Question list */}
      <div style={{ flex: 1, padding: isMobile ? '16px 16px 48px' : '20px 32px 64px', maxWidth: 760, width: '100%', margin: '0 auto', boxSizing: 'border-box' }}>
        {filtered.map((q, idx) => {
          const globalIdx = LMS_QUESTIONS.indexOf(q);
          return (
            <div key={q.id} style={{ background: '#fff', border: '1px solid rgba(32,30,29,0.15)', padding: isMobile ? '18px 16px' : '22px 24px', marginBottom: 12 }}>
              <div style={{ fontSize: 11, fontWeight: 700, color: '#7d7979', marginBottom: 8 }}>#{globalIdx + 1}</div>
              <div style={{ fontSize: isMobile ? 14.5 : 16, fontWeight: 700, lineHeight: 1.5, marginBottom: 16 }}>{q.text}</div>
              <div style={{ display: 'flex', flexDirection: 'column', gap: 6 }}>
                {q.options.map((opt) => {
                  const isCorrect = opt.label === q.correctLabel;
                  return (
                    <div key={opt.label} style={{ display: 'flex', alignItems: 'flex-start', gap: 10, padding: '8px 12px', background: isCorrect ? '#eafaf1' : 'transparent', border: isCorrect ? '1px solid #15803d' : '1px solid rgba(32,30,29,0.12)' }}>
                      <span style={{ fontSize: 13, fontWeight: 700, color: isCorrect ? '#15803d' : '#7d7979', flexShrink: 0, minWidth: 20 }}>{opt.label}</span>
                      <span style={{ fontSize: 13.5, lineHeight: 1.5, color: isCorrect ? '#15803d' : '#201e1d', fontWeight: isCorrect ? 600 : 400 }}>{opt.text}</span>
                      {isCorrect && <span style={{ marginLeft: 'auto', fontSize: 12, fontWeight: 700, color: '#15803d', flexShrink: 0 }}>✓</span>}
                    </div>
                  );
                })}
              </div>
            </div>
          );
        })}

        {filtered.length === 0 && (
          <div style={{ textAlign: 'center', color: '#7d7979', marginTop: 60, fontSize: 14 }}>Tidak ada soal yang ditemukan.</div>
        )}
      </div>
    </div>
  );
}
