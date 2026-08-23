'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import type { Section } from '@/lib/types';

export default function BankPage() {
  const [sections, setSections] = useState<Section[]>([]);
  const [loading, setLoading] = useState(true);
  const [activeFilter, setActiveFilter] = useState<'all' | number>('all');
  const [sourceFilter, setSourceFilter] = useState<'all' | 'original' | 'additional'>('all');

  useEffect(() => {
    fetch('/api/bank')
      .then((r) => r.json())
      .then((data: Section[]) => {
        setSections(data);
        setLoading(false);
      })
      .catch(() => setLoading(false));
  }, []);

  const totalQuestions = sections.reduce((acc, s) => acc + s.questions.length, 0);

  const filteredSections = (activeFilter === 'all' ? sections : sections.filter((s) => s.id === activeFilter))
    .map((s) => ({
      ...s,
      questions: sourceFilter === 'all' ? s.questions : s.questions.filter((q) => q.source === sourceFilter),
    }))
    .filter((s) => s.questions.length > 0);

  const tabBase: React.CSSProperties = {
    padding: '7px 14px',
    fontSize: 13,
    fontWeight: 600,
    borderRadius: 0,
    cursor: 'pointer',
    fontFamily: 'inherit',
    whiteSpace: 'nowrap',
    border: '1px solid rgba(32,30,29,0.4)',
    background: 'transparent',
    color: '#201e1d',
  };

  const tabActive: React.CSSProperties = {
    ...tabBase,
    background: '#2F6FED',
    color: '#fff',
    border: '1px solid #2F6FED',
  };

  const srcTabActive = (color: string): React.CSSProperties => ({
    ...tabBase,
    background: color,
    color: '#fff',
    border: `1px solid ${color}`,
  });

  if (loading) {
    return (
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '100vh', fontFamily: 'inherit' }}>
        <span style={{ fontSize: 15, color: '#605d5d' }}>Loading question bank...</span>
      </div>
    );
  }

  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2' }}>
      {/* Header */}
      <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '0 32px', borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
        <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
          <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM 9 OJK</span>
          <span style={{ fontSize: 13, color: '#605d5d' }}>Question Bank</span>
        </div>
        <div style={{ display: 'flex', alignItems: 'center', gap: 20 }}>
          <span style={{ fontSize: 12.5, fontWeight: 600, color: '#605d5d' }}>{totalQuestions} questions in bank</span>
          <Link href="/" style={{ fontSize: 13, fontWeight: 700, color: '#1d4ed8', textDecoration: 'none' }}>
            ← Back to Home
          </Link>
        </div>
      </div>

      {/* Section filter tab row */}
      <div style={{ padding: '20px 32px 14px', borderBottom: '1px solid rgba(32,30,29,0.15)', display: 'flex', flexWrap: 'wrap', gap: 8 }}>
        <button onClick={() => setActiveFilter('all')} style={activeFilter === 'all' ? tabActive : tabBase}>
          All ({totalQuestions})
        </button>
        {sections.map((s) => (
          <button key={s.id} onClick={() => setActiveFilter(s.id)} style={activeFilter === s.id ? tabActive : tabBase}>
            {s.title} ({s.questions.length})
          </button>
        ))}
      </div>

      {/* Source filter row */}
      <div style={{ padding: '12px 32px', borderBottom: '2px solid rgba(32,30,29,0.4)', display: 'flex', alignItems: 'center', gap: 8 }}>
        <span style={{ fontSize: 11.5, fontWeight: 600, color: '#7d7979', letterSpacing: '0.05em', textTransform: 'uppercase', marginRight: 4 }}>Source</span>
        <button onClick={() => setSourceFilter('all')} style={sourceFilter === 'all' ? { ...tabBase, background: '#444141', color: '#fff', border: '1px solid #444141' } : tabBase}>
          All sources
        </button>
        <button onClick={() => setSourceFilter('original')} style={sourceFilter === 'original' ? srcTabActive('#15803d') : tabBase}>
          Original
        </button>
        <button onClick={() => setSourceFilter('additional')} style={sourceFilter === 'additional' ? srcTabActive('#2F6FED') : tabBase}>
          Additional
        </button>
      </div>

      {/* Body */}
      <div style={{ display: 'flex', justifyContent: 'center', padding: '36px 32px 60px' }}>
        <div style={{ maxWidth: 860, width: '100%' }}>
          {filteredSections.length === 0 && (
            <div style={{ fontSize: 14, color: '#605d5d', textAlign: 'center', marginTop: 40 }}>
              No questions match the current filters.
            </div>
          )}
          {filteredSections.map((section) => (
            <div key={section.id} style={{ marginBottom: 48 }}>
              {/* Section header row */}
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 16 }}>
                <span style={{ fontSize: 15, fontWeight: 700 }}>{section.title}</span>
                <span style={{ fontSize: 12, color: '#605d5d' }}>
                  {section.questions.length} questions · random draw: {section.draw_per_session} per session
                </span>
              </div>

              {/* Questions */}
              {section.questions.map((q, qIdx) => (
                <div key={q.id} style={{ padding: '20px 0', borderBottom: '1px solid rgba(32,30,29,0.15)' }}>
                  {/* Question label row */}
                  <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 6 }}>
                    <span style={{ fontSize: 11, color: '#7d7979' }}>Question {qIdx + 1}</span>
                    <SourceBadge source={q.source} />
                  </div>
                  <div style={{ fontSize: 16, fontWeight: 600, lineHeight: 1.45, marginBottom: 14 }}>{q.text}</div>
                  <div style={{ display: 'flex', flexDirection: 'column', gap: 6 }}>
                    {q.choices.map((choice) => (
                      <div key={choice.id} style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
                        {/* 8×8px square marker */}
                        <div style={{
                          width: 8, height: 8, flexShrink: 0,
                          background: choice.is_correct ? '#15803d' : '#d7d3d3',
                        }} />
                        <span style={{
                          fontSize: 14,
                          color: choice.is_correct ? '#15803d' : '#444141',
                          fontWeight: choice.is_correct ? 600 : 400,
                        }}>
                          {choice.text}
                          {choice.is_correct && (
                            <span style={{
                              display: 'inline-block',
                              marginLeft: 6,
                              fontSize: 11,
                              background: '#eafaf1',
                              color: '#15803d',
                              border: '1px solid #15803d',
                              padding: '1px 6px',
                            }}>
                              Correct
                            </span>
                          )}
                        </span>
                      </div>
                    ))}
                  </div>
                </div>
              ))}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

function SourceBadge({ source }: { source: 'original' | 'additional' }) {
  const isOriginal = source === 'original';
  return (
    <span style={{
      fontSize: 10,
      fontWeight: 700,
      letterSpacing: '0.05em',
      textTransform: 'uppercase',
      padding: '2px 7px',
      border: `1px solid ${isOriginal ? '#15803d' : '#2F6FED'}`,
      color: isOriginal ? '#15803d' : '#2F6FED',
      background: isOriginal ? '#eafaf1' : '#eaf1fd',
    }}>
      {isOriginal ? 'Original' : 'Additional'}
    </span>
  );
}
