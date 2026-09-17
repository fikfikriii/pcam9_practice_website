'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';
import type { Section, SectionMeta, QuestionSource, SectionCategory, Module } from '@/lib/types';
import { useMobile } from '@/lib/useMobile';

export default function BankPage() {
  const [sectionMetas, setSectionMetas] = useState<SectionMeta[]>([]);
  const [loadedSections, setLoadedSections] = useState<Record<number, Section>>({});
  const [activeSections, setActiveSections] = useState<number[]>([]);
  const [loadingSections, setLoadingSections] = useState<Set<number>>(new Set());
  const [metaLoading, setMetaLoading] = useState(true);
  const [moduleFilter, setModuleFilter] = useState<'all' | number>('all');
  const [categoryFilter, setCategoryFilter] = useState<'all' | string>('all');
  const [sourceFilter, setSourceFilter] = useState<'all' | string>('all');
  const [modules, setModules] = useState<Module[]>([]);
  const [questionSources, setQuestionSources] = useState<QuestionSource[]>([]);
  const [sectionCategories, setSectionCategories] = useState<SectionCategory[]>([]);
  const isMobile = useMobile();
  const px = isMobile ? 16 : 32;

  useEffect(() => {
    fetch('/api/modules')
      .then((r) => r.json())
      .then((data: Module[]) => setModules(data))
      .catch(() => {});

    fetch('/api/question-sources')
      .then((r) => r.json())
      .then((data: QuestionSource[]) => setQuestionSources(data))
      .catch(() => {});

    fetch('/api/section-categories')
      .then((r) => r.json())
      .then((data: SectionCategory[]) => setSectionCategories(data))
      .catch(() => {});

    fetch('/api/sections')
      .then((r) => r.json())
      .then((data: SectionMeta[]) => {
        setSectionMetas(data);
        setMetaLoading(false);
      })
      .catch(() => setMetaLoading(false));
  }, []);

  function loadSection(id: number) {
    if (loadedSections[id]) return;
    setLoadingSections((prev) => new Set(prev).add(id));
    fetch(`/api/bank?section_id=${id}`)
      .then((r) => r.json())
      .then((data: Section) => {
        setLoadedSections((prev) => ({ ...prev, [id]: data }));
        setLoadingSections((prev) => { const s = new Set(prev); s.delete(id); return s; });
      })
      .catch(() => {
        setLoadingSections((prev) => { const s = new Set(prev); s.delete(id); return s; });
      });
  }

  function selectModule(mod: 'all' | number) {
    setModuleFilter(mod);
    setCategoryFilter('all');
    setActiveSections([]);
    setSourceFilter('all');
  }

  function selectCategory(cat: 'all' | string) {
    setCategoryFilter(cat);
    setActiveSections([]);
    setSourceFilter('all');
  }

  function selectSection(id: number) {
    setSourceFilter('all');
    if (activeSections.includes(id)) {
      setActiveSections((prev) => prev.filter((sid) => sid !== id));
    } else {
      setActiveSections((prev) => [...prev, id]);
      loadSection(id);
    }
  }

  function selectAllInCategory() {
    const ids = visibleSections.map((s) => s.id);
    setActiveSections(ids);
    setSourceFilter('all');
    ids.forEach(loadSection);
  }

  function clearSections() {
    setActiveSections([]);
    setSourceFilter('all');
  }

  const totalQuestions = sectionMetas.reduce((acc, s) => acc + s.question_count, 0);

  const moduleFilteredSections = moduleFilter === 'all'
    ? sectionMetas
    : sectionMetas.filter((s) => s.module_id === moduleFilter);

  const visibleSections = categoryFilter === 'all'
    ? moduleFilteredSections
    : moduleFilteredSections.filter((s) => s.category_id === categoryFilter);

  const allCategorySelected =
    visibleSections.length > 0 && visibleSections.every((s) => activeSections.includes(s.id));

  const sourcesInActiveSections = [...new Set(
    activeSections.flatMap((id) => loadedSections[id]?.questions.map((q) => q.source) ?? [])
  )];

  const tabBase: React.CSSProperties = {
    padding: '6px 12px',
    fontSize: 12.5,
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

  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2' }}>
      {/* Header */}
      <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2', gap: 12 }}>
        <div style={{ display: 'flex', alignItems: 'baseline', gap: 14, minWidth: 0 }}>
          <span style={{ fontSize: 18, fontWeight: 800, whiteSpace: 'nowrap' }}>PCAM9 MLE OJK</span>
          {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Question Bank</span>}
        </div>
        <div style={{ display: 'flex', alignItems: 'center', gap: 12, flexShrink: 0 }}>
          {!isMobile && !metaLoading && (
            <span style={{ fontSize: 12.5, fontWeight: 600, color: '#605d5d' }}>{totalQuestions} questions in bank</span>
          )}
          <Link href="/" style={{ fontSize: 13, fontWeight: 700, color: '#1d4ed8', textDecoration: 'none', whiteSpace: 'nowrap' }}>
            ← Back to Home
          </Link>
        </div>
      </div>

      {/* Module filter row */}
      <div style={{ padding: `10px ${px}px`, borderBottom: '1px solid rgba(32,30,29,0.15)', display: 'flex', alignItems: 'center', gap: 8, flexWrap: 'wrap' }}>
        <span style={{ fontSize: 11, fontWeight: 700, color: '#7d7979', letterSpacing: '0.05em', textTransform: 'uppercase' }}>Modul</span>
        <button onClick={() => selectModule('all')} style={moduleFilter === 'all' ? { ...tabBase, background: '#444141', color: '#fff', border: '1px solid #444141' } : tabBase}>
          All
        </button>
        {modules.map((m) => {
          const isActive = moduleFilter === m.id;
          return (
            <button key={m.id} onClick={() => selectModule(m.id)} style={isActive ? tabActive : tabBase}>
              {isMobile ? `M${m.number}` : `Modul ${m.number}`}
            </button>
          );
        })}
      </div>

      {/* Category filter row */}
      <div style={{ padding: `10px ${px}px`, borderBottom: '1px solid rgba(32,30,29,0.15)', display: 'flex', alignItems: 'center', gap: 8, flexWrap: 'wrap' }}>
        <span style={{ fontSize: 11, fontWeight: 700, color: '#7d7979', letterSpacing: '0.05em', textTransform: 'uppercase' }}>Category</span>
        <button onClick={() => selectCategory('all')} style={categoryFilter === 'all' ? { ...tabBase, background: '#444141', color: '#fff', border: '1px solid #444141' } : tabBase}>
          All
        </button>
        {sectionCategories
          .filter((cat) => moduleFilteredSections.some((s) => s.category_id === cat.id))
          .map((cat) => {
            const isActive = categoryFilter === cat.id;
            return (
              <button
                key={cat.id}
                onClick={() => selectCategory(cat.id)}
                style={isActive ? tabActive : tabBase}
              >
                {cat.label}
              </button>
            );
          })}
      </div>

      {/* Section tab row */}
      <div style={{ padding: `10px ${px}px`, borderBottom: '1px solid rgba(32,30,29,0.15)', display: 'flex', flexWrap: 'wrap', gap: 6, alignItems: 'center' }}>
        {metaLoading ? (
          <span style={{ fontSize: 12.5, color: '#7d7979' }}>Loading sections...</span>
        ) : visibleSections.length === 0 ? (
          <span style={{ fontSize: 12.5, color: '#7d7979' }}>No sections in this category.</span>
        ) : (
          <>
            {categoryFilter !== 'all' && !allCategorySelected && (
              <button onClick={selectAllInCategory} style={{ ...tabBase, background: '#444141', color: '#fff', border: '1px solid #444141' }}>
                Select All
              </button>
            )}
            {activeSections.length > 0 && (
              <button onClick={clearSections} style={{ ...tabBase, color: '#7d7979', borderColor: 'rgba(32,30,29,0.25)' }}>
                Clear
              </button>
            )}
            {visibleSections.map((s) => (
              <button
                key={s.id}
                onClick={() => selectSection(s.id)}
                style={activeSections.includes(s.id) ? tabActive : tabBase}
              >
                {isMobile ? `${s.question_count}` : `${s.title} (${s.question_count})`}
              </button>
            ))}
          </>
        )}
      </div>

      {/* Source filter row */}
      <div style={{ padding: `10px ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', display: 'flex', alignItems: 'center', gap: 8, flexWrap: 'wrap' }}>
        <span style={{ fontSize: 11, fontWeight: 700, color: '#7d7979', letterSpacing: '0.05em', textTransform: 'uppercase' }}>Source</span>
        <button
          onClick={() => setSourceFilter('all')}
          disabled={activeSections.length === 0}
          style={sourceFilter === 'all'
            ? { ...tabBase, background: '#444141', color: '#fff', border: '1px solid #444141' }
            : { ...tabBase, opacity: activeSections.length > 0 ? 1 : 0.4 }}
        >
          All
        </button>
        {questionSources
          .filter((s) => activeSections.length === 0 || sourcesInActiveSections.includes(s.id))
          .map((s) => {
            const { color } = SOURCE_COLORS[s.id] ?? { color: '#374151' };
            const isActive = sourceFilter === s.id;
            return (
              <button
                key={s.id}
                onClick={() => setSourceFilter(s.id)}
                disabled={activeSections.length === 0}
                style={isActive
                  ? { ...tabBase, background: color, color: '#fff', border: `1px solid ${color}` }
                  : { ...tabBase, color, border: `1px solid ${color}`, opacity: activeSections.length > 0 ? 1 : 0.4 }}
              >
                {s.label}
              </button>
            );
          })}
      </div>

      {/* Body */}
      <div style={{ display: 'flex', justifyContent: 'center', padding: isMobile ? '24px 16px 48px' : '36px 32px 60px' }}>
        <div style={{ maxWidth: 860, width: '100%' }}>

          {activeSections.length === 0 && (
            <div style={{ fontSize: 14, color: '#605d5d', textAlign: 'center', marginTop: 60 }}>
              Select a section above to browse questions.
            </div>
          )}

          {activeSections.length > 0 && (() => {
            const selectedVisible = visibleSections.filter((s) => activeSections.includes(s.id));
            return selectedVisible.map((sectionMeta, sectionIdx) => {
              const sectionData = loadedSections[sectionMeta.id];
              const isLoading = loadingSections.has(sectionMeta.id);

              return (
                <div key={sectionMeta.id} style={{ marginBottom: sectionIdx < selectedVisible.length - 1 ? 48 : 0 }}>
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginBottom: 14, flexWrap: 'wrap', gap: 4 }}>
                    <span style={{ fontSize: 15, fontWeight: 700 }}>{sectionMeta.title}</span>
                    {sectionData && (
                      <span style={{ fontSize: 12, color: '#605d5d' }}>
                        {sourceFilter === 'all'
                          ? sectionData.questions.length
                          : sectionData.questions.filter((q) => q.source === sourceFilter).length} questions
                      </span>
                    )}
                  </div>

                  {isLoading && (
                    <div style={{ fontSize: 14, color: '#605d5d', textAlign: 'center', marginTop: 40 }}>
                      Loading questions...
                    </div>
                  )}

                  {sectionData && !isLoading && (() => {
                    const displayedQuestions = sourceFilter === 'all'
                      ? sectionData.questions
                      : sectionData.questions.filter((q) => q.source === sourceFilter);

                    return (
                      <>
                        {displayedQuestions.length === 0 && (
                          <div style={{ fontSize: 14, color: '#605d5d', textAlign: 'center', marginTop: 40 }}>
                            No questions match the current source filter.
                          </div>
                        )}
                        {displayedQuestions.map((q, qIdx) => (
                          <div key={q.id} style={{ padding: '16px 0', borderBottom: '1px solid rgba(32,30,29,0.15)' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 6 }}>
                              <span style={{ fontSize: 11, color: '#7d7979' }}>Question {qIdx + 1}</span>
                              <SourceBadge source={q.source} sources={questionSources} />
                            </div>
                            <div style={{ fontSize: isMobile ? 14.5 : 16, fontWeight: 600, lineHeight: 1.45, marginBottom: 12 }}>{q.text}</div>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: 6 }}>
                              {q.choices.map((choice) => (
                                <div key={choice.id} style={{ display: 'flex', alignItems: 'flex-start', gap: 10 }}>
                                  <div style={{ width: 8, height: 8, flexShrink: 0, marginTop: 4, background: choice.is_correct ? '#15803d' : '#d7d3d3' }} />
                                  <span style={{ fontSize: 13.5, color: choice.is_correct ? '#15803d' : '#444141', fontWeight: choice.is_correct ? 600 : 400 }}>
                                    {choice.text}
                                    {choice.is_correct && (
                                      <span style={{ display: 'inline-block', marginLeft: 6, fontSize: 11, background: '#eafaf1', color: '#15803d', border: '1px solid #15803d', padding: '1px 6px' }}>
                                        Correct
                                      </span>
                                    )}
                                  </span>
                                </div>
                              ))}
                            </div>
                          </div>
                        ))}
                      </>
                    );
                  })()}
                </div>
              );
            });
          })()}
        </div>
      </div>
    </div>
  );
}

const SOURCE_COLORS: Record<string, { color: string; bg: string }> = {
  original:   { color: '#15803d', bg: '#eafaf1' },
  additional: { color: '#2F6FED', bg: '#eaf1fd' },
  pcs8:       { color: '#6d28d9', bg: '#f5f3ff' },
  pcs7:       { color: '#b45309', bg: '#fffbeb' },
  kisi_kisi:  { color: '#0e7490', bg: '#ecfeff' },
};

function SourceBadge({ source, sources }: { source: string; sources: QuestionSource[] }) {
  const label = sources.find((s) => s.id === source)?.label ?? source;
  const { color, bg } = SOURCE_COLORS[source] ?? { color: '#374151', bg: '#f3f4f6' };
  return (
    <span style={{ fontSize: 10, fontWeight: 700, letterSpacing: '0.05em', textTransform: 'uppercase', padding: '2px 7px', border: `1px solid ${color}`, color, background: bg }}>
      {label}
    </span>
  );
}
