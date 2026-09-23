'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import type { Section, Question, QuestionSource, SectionCategory } from '@/lib/types';
import { useMobile } from '@/lib/useMobile';
import DownloadDocsModal from '@/components/shared/DownloadDocsModal';

const btnOutline: React.CSSProperties = {
  background: 'transparent', border: '1.5px solid rgba(32,30,29,0.4)', color: '#201e1d',
  padding: '7px 16px', fontSize: 13, fontWeight: 600, borderRadius: 0,
  cursor: 'pointer', fontFamily: 'inherit', whiteSpace: 'nowrap',
};

const btnPrimary: React.CSSProperties = {
  background: '#2F6FED', border: '1.5px solid #2F6FED', color: '#fff',
  padding: '7px 16px', fontSize: 13, fontWeight: 600, borderRadius: 0,
  cursor: 'pointer', fontFamily: 'inherit', whiteSpace: 'nowrap',
};

type ViewState = 'setup' | 'drill' | 'submitted';
type DrillMode = 'simulasi' | 'belajar';

export default function DrillPage({ moduleId }: { moduleId: number | null }) {
  const router = useRouter();
  const isMobile = useMobile();
  const px = isMobile ? 16 : 32;

  const [allSections, setAllSections] = useState<Section[]>([]);
  const [loading, setLoading] = useState(true);
  const [questionSources, setQuestionSources] = useState<QuestionSource[]>([]);
  const [sectionCategories, setSectionCategories] = useState<SectionCategory[]>([]);

  // Setup state
  const [selectedSectionIds, setSelectedSectionIds] = useState<number[]>([]);
  const [selectedSource, setSelectedSource] = useState<'all' | string>('all');
  const [questionCount, setQuestionCount] = useState(5);
  const [filterOrder, setFilterOrder] = useState<'section-first' | 'source-first'>('section-first');

  // Drill state
  const [view, setView] = useState<ViewState>('setup');
  const [drillQuestions, setDrillQuestions] = useState<Question[]>([]);
  const [current, setCurrent] = useState(0);
  const [mode, setMode] = useState<DrillMode>('simulasi');
  const [answers, setAnswers] = useState<Record<number, number>>({});
  const [confirmed, setConfirmed] = useState<Record<number, boolean>>({});
  const [flagged, setFlagged] = useState<Record<number, boolean>>({});
  const [hoveredOption, setHoveredOption] = useState<number | null>(null);
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const [confirmingSubmit, setConfirmingSubmit] = useState(false);
  const [showDownloadModal, setShowDownloadModal] = useState(false);

  useEffect(() => {
    fetch('/api/question-sources')
      .then((r) => r.json())
      .then((data: QuestionSource[]) => setQuestionSources(data))
      .catch(() => {});
    fetch('/api/section-categories')
      .then((r) => r.json())
      .then((data: SectionCategory[]) => setSectionCategories(data))
      .catch(() => {});
  }, []);

  useEffect(() => {
    fetch(moduleId ? `/api/bank?module=${moduleId}` : '/api/bank')
      .then((r) => r.json())
      .then((data: Section[]) => {
        const withQuestions = data.filter((s) => s.questions.length > 0);
        setAllSections(withQuestions);
        setSelectedSectionIds(withQuestions.map((s) => s.id));
        setLoading(false);
      })
      .catch(() => setLoading(false));
  }, []);

  const selectedSections = allSections.filter((s) => selectedSectionIds.includes(s.id));
  const allQuestionsInSelection = selectedSections.flatMap((s) => s.questions);
  const availableQuestions = selectedSource === 'all'
    ? allQuestionsInSelection
    : allQuestionsInSelection.filter((q) => q.source === selectedSource);

  // source-first: pool from all sections; section-first: pool from selected sections
  const sourcesInPool = filterOrder === 'source-first'
    ? questionSources.filter((s) => allSections.some((sec) => sec.questions.some((q) => q.source === s.id)))
    : questionSources.filter((s) => allQuestionsInSelection.some((q) => q.source === s.id));

  // source-first: only show sections that have the selected source
  const visibleSections = filterOrder === 'source-first' && selectedSource !== 'all'
    ? allSections.filter((s) => s.questions.some((q) => q.source === selectedSource))
    : allSections;

  const maxCount = availableQuestions.length;
  const minCount = Math.min(5, maxCount);
  const clampedCount = Math.min(Math.max(questionCount, minCount), maxCount);

  function handleSectionToggle(id: number) {
    setSelectedSectionIds((prev) => prev.includes(id) ? prev.filter((x) => x !== id) : [...prev, id]);
    if (filterOrder === 'section-first') setSelectedSource('all');
  }

  function handleSourceChange(source: 'all' | string) {
    setSelectedSource(source);
    if (filterOrder === 'source-first') {
      // keep only sections that have the new source
      const eligible = source === 'all'
        ? allSections.map((s) => s.id)
        : allSections.filter((s) => s.questions.some((q) => q.source === source)).map((s) => s.id);
      setSelectedSectionIds(eligible);
      const pool = allSections.filter((s) => eligible.includes(s.id)).flatMap((s) => s.questions);
      const filtered = source === 'all' ? pool : pool.filter((q) => q.source === source);
      setQuestionCount((prev) => Math.min(prev, Math.max(filtered.length, 1)));
    } else {
      const pool = selectedSections.flatMap((s) => s.questions);
      const filtered = source === 'all' ? pool : pool.filter((q) => q.source === source);
      setQuestionCount((prev) => Math.min(prev, Math.max(filtered.length, 1)));
    }
  }

  function handleFilterOrderChange(order: 'section-first' | 'source-first') {
    setFilterOrder(order);
    setSelectedSource('all');
    setSelectedSectionIds(allSections.map((s) => s.id));
  }

  function startDrill() {
    if (availableQuestions.length === 0) return;
    const shuffled = [...availableQuestions].sort(() => Math.random() - 0.5);
    const drawn = shuffled.slice(0, clampedCount);
    drawn.sort((a, b) => a.position - b.position);
    setDrillQuestions(drawn);
    setAnswers({});
    setConfirmed({});
    setFlagged({});
    setCurrent(0);
    setView('drill');
  }

  function handleConfirm() {
    const q = drillQuestions[current];
    if (!q || confirmed[q.id]) return;
    setConfirmed((prev) => ({ ...prev, [q.id]: true }));
  }

  function handleFlag() {
    const q = drillQuestions[current];
    if (!q) return;
    setFlagged((prev) => ({ ...prev, [q.id]: !prev[q.id] }));
  }

  function handleAnswer(choiceId: number) {
    const q = drillQuestions[current];
    if (!q) return;
    if (mode === 'belajar' && confirmed[q.id]) return;
    setAnswers((prev) => ({ ...prev, [q.id]: choiceId }));
    if (mode === 'belajar') {
      setConfirmed((prev) => ({ ...prev, [q.id]: true }));
    }
  }

  function goTo(idx: number) {
    setCurrent(idx);
    setSidebarOpen(false);
  }

  function handleSubmit() {
    const unanswered = total - answeredCount;
    if (unanswered > 0) { setSidebarOpen(false); setConfirmingSubmit(true); return; }
    setView('submitted');
  }

  function confirmSubmit() {
    setConfirmingSubmit(false);
    setView('submitted');
  }

  function handleRestart() {
    setAnswers({});
    setFlagged({});
    setCurrent(0);
    setView('setup');
    setDrillQuestions([]);
  }

  function handleExportPDF() {
    const esc = (s: string) => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
    const moduleLabel = moduleId ? `Modul ${moduleId}` : 'Section Drill';
    const date = new Date().toLocaleDateString('id-ID', { day: 'numeric', month: 'long', year: 'numeric' });

    let html = `<!DOCTYPE html><html><head><meta charset="utf-8">
<title>Drill Results — ${esc(moduleLabel)}</title>
<style>
  * { box-sizing: border-box; }
  body { font-family: Arial, sans-serif; font-size: 13px; color: #201e1d; margin: 40px; line-height: 1.5; }
  h1 { font-size: 18px; margin: 0 0 2px; }
  .meta { font-size: 12px; color: #605d5d; margin-bottom: 24px; }
  .score-wrap { display: flex; align-items: baseline; gap: 16px; margin-bottom: 8px; }
  .score { font-size: 52px; font-weight: bold; line-height: 1; }
  .score-sub { font-size: 14px; color: #605d5d; }
  .bar { height: 4px; background: #2F6FED; margin-bottom: 32px; }
  .question { padding: 10px 0; border-bottom: 1px solid #e5e5e5; display: flex; justify-content: space-between; align-items: flex-start; gap: 12px; }
  .question-body { flex: 1; }
  .qnum { font-size: 11px; color: #7d7979; margin-bottom: 2px; }
  .qtext { font-size: 13px; font-weight: 600; margin-bottom: 5px; line-height: 1.4; }
  .answer { font-size: 12px; color: #444141; }
  .answer.green { color: #15803d; margin-top: 2px; }
  .tag { padding: 2px 8px; font-size: 10px; font-weight: 600; border: 1px solid; white-space: nowrap; flex-shrink: 0; margin-top: 2px; }
  .tag-correct { background: #eafaf1; color: #15803d; border-color: #15803d; }
  .tag-incorrect { background: #fef2f2; color: #b91c1c; border-color: #b91c1c; }
  .tag-unanswered { color: #605d5d; border-color: rgba(0,0,0,0.3); }
  @media print { body { margin: 20px; } }
</style>
</head><body>`;

    html += `<h1>PCAM9 MLE OJK — ${esc(moduleLabel)}</h1>`;
    html += `<div class="meta">Drill Results &middot; ${esc(date)}</div>`;
    html += `<div class="score-wrap"><span class="score">${scorePercent}%</span><span class="score-sub">${scoreCorrect} of ${total} correct</span></div>`;
    html += `<div class="bar"></div>`;

    drillQuestions.forEach((q, idx) => {
      const answeredChoiceId = answers[q.id];
      const answeredChoice = q.choices.find((c) => c.id === answeredChoiceId);
      const correctChoice = q.choices.find((c) => c.is_correct);
      const isCorrect = answeredChoice?.is_correct === true;
      const notAnswered = !answeredChoiceId;

      let tagClass: string, tagText: string;
      if (notAnswered) { tagClass = 'tag-unanswered'; tagText = 'Not answered'; }
      else if (isCorrect) { tagClass = 'tag-correct'; tagText = 'Correct'; }
      else { tagClass = 'tag-incorrect'; tagText = 'Incorrect'; }

      html += `<div class="question">`;
      html += `<div class="question-body">`;
      html += `<div class="qnum">Question ${idx + 1}</div>`;
      html += `<div class="qtext">${esc(q.text)}</div>`;
      html += `<div class="answer">Your answer: ${answeredChoice ? esc(answeredChoice.text) : '&mdash;'}</div>`;
      if (!isCorrect && correctChoice) {
        html += `<div class="answer green">Correct answer: ${esc(correctChoice.text)}</div>`;
      }
      html += `</div><div class="tag ${tagClass}">${tagText}</div></div>`;
    });

    html += `<script>window.onload=function(){window.print();}<\/script></body></html>`;

    const w = window.open('', '_blank');
    if (w) { w.document.write(html); w.document.close(); }
  }

  const total = drillQuestions.length;
  const answeredCount = Object.keys(answers).length;
  const currentQuestion = drillQuestions[current];
  const currentChoiceId = currentQuestion ? answers[currentQuestion.id] : undefined;
  const isFirst = current === 0;
  const isLast = current === total - 1;
  const isCurrentFlagged = currentQuestion ? !!flagged[currentQuestion.id] : false;
  const isCurrentConfirmed = currentQuestion ? !!confirmed[currentQuestion.id] : false;

  const scoreCorrect = drillQuestions.filter((q) => {
    const choiceId = answers[q.id];
    return choiceId && q.choices.find((c) => c.id === choiceId)?.is_correct === true;
  }).length;
  const scorePercent = total > 0 ? Math.round((scoreCorrect / total) * 100) : 0;

  if (loading) {
    return (
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '100vh' }}>
        <span style={{ fontSize: 15, color: '#605d5d' }}>Loading...</span>
      </div>
    );
  }

  // ─── SETUP VIEW ───────────────────────────────────────────────────
  if (view === 'setup') {
    return (
      <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2' }}>
        <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
          <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
            <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM9 MLE OJK</span>
            {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>{moduleId ? `Modul ${moduleId} — Drill` : 'Section Drill'}</span>}
          </div>
          <button onClick={() => router.push('/')} style={{ ...btnOutline, color: '#1d4ed8', borderColor: '#1d4ed8' }}>Home</button>
        </div>

        <div style={{ flex: 1, overflowY: 'auto', padding: isMobile ? '40px 20px 60px' : '60px 32px 80px', display: 'flex', justifyContent: 'center' }}>
          <div style={{ width: '100%', maxWidth: 560 }}>
            <div style={{ fontSize: isMobile ? 22 : 28, fontWeight: 800, marginBottom: 8 }}>{moduleId ? `Modul ${moduleId} — Drill` : 'Section Drill'}</div>
            <div style={{ fontSize: 14, color: '#605d5d', marginBottom: 24, lineHeight: 1.6 }}>
              Pick sections, source, and how many questions to practice.
            </div>

            {/* Filter order toggle */}
            <div style={{ marginBottom: 28 }}>
              <div style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#7d7979', marginBottom: 8 }}>Filter order</div>
              <div style={{ display: 'flex', gap: 0 }}>
                {([['section-first', 'Section → Source'], ['source-first', 'Source → Section']] as const).map(([val, label]) => (
                  <button key={val} onClick={() => handleFilterOrderChange(val)} style={{
                    flex: 1, padding: '8px 12px', fontSize: 12.5, fontWeight: 700, fontFamily: 'inherit', borderRadius: 0, cursor: 'pointer',
                    border: `1.5px solid ${filterOrder === val ? '#2F6FED' : 'rgba(32,30,29,0.2)'}`,
                    background: filterOrder === val ? '#eaf1fd' : '#fff',
                    color: filterOrder === val ? '#2F6FED' : '#605d5d',
                    marginLeft: val === 'source-first' ? -1.5 : 0,
                  }}>
                    {label}
                  </button>
                ))}
              </div>
            </div>

            {/* Source filter block — shown before sections in source-first mode */}
            {filterOrder === 'source-first' && sourcesInPool.length > 0 && (
              <div style={{ marginBottom: 24 }}>
                <div style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#7d7979', marginBottom: 8 }}>Source</div>
                <div style={{ display: 'flex', flexWrap: 'wrap', gap: 6 }}>
                  {(['all', ...sourcesInPool.map((s) => s.id)] as string[]).map((id) => {
                    const label = id === 'all' ? 'All' : (questionSources.find((s) => s.id === id)?.label ?? id);
                    const { color } = SOURCE_COLORS[id] ?? { color: '#374151' };
                    const isActive = selectedSource === id;
                    const activeStyle: React.CSSProperties = id === 'all'
                      ? { background: '#444141', color: '#fff', border: '1.5px solid #444141' }
                      : { background: color, color: '#fff', border: `1.5px solid ${color}` };
                    const baseStyle: React.CSSProperties = { padding: '7px 14px', fontSize: 13, fontWeight: 600, borderRadius: 0, cursor: 'pointer', fontFamily: 'inherit', border: '1.5px solid rgba(32,30,29,0.4)', background: 'transparent', color: '#201e1d' };
                    return (
                      <button key={id} onClick={() => handleSourceChange(id)} style={isActive ? { ...baseStyle, ...activeStyle } : baseStyle}>
                        {label}
                      </button>
                    );
                  })}
                </div>
              </div>
            )}

            {/* Section selector */}
            <div style={{ marginBottom: 24 }}>
              <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 12 }}>
                <div style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#7d7979' }}>
                  Sections <span style={{ color: '#2F6FED', fontWeight: 700 }}>{selectedSectionIds.length}/{visibleSections.length}</span>
                </div>
                <div style={{ display: 'flex', gap: 8 }}>
                  <button
                    onClick={() => setSelectedSectionIds(visibleSections.map((s) => s.id))}
                    style={{ fontSize: 11.5, fontWeight: 600, color: '#2F6FED', background: 'transparent', border: 'none', cursor: 'pointer', padding: 0, fontFamily: 'inherit' }}
                  >All</button>
                  <span style={{ color: '#d7d3d3', fontSize: 11.5 }}>|</span>
                  <button
                    onClick={() => setSelectedSectionIds([])}
                    style={{ fontSize: 11.5, fontWeight: 600, color: '#7d7979', background: 'transparent', border: 'none', cursor: 'pointer', padding: 0, fontFamily: 'inherit' }}
                  >Clear</button>
                </div>
              </div>

              {/* Grouped by category */}
              {sectionCategories.map((cat) => {
                const catSections = visibleSections.filter((s) => s.category_id === cat.id);
                if (catSections.length === 0) return null;
                const allCatSelected = catSections.every((s) => selectedSectionIds.includes(s.id));
                return (
                  <div key={cat.id} style={{ marginBottom: 14 }}>
                    <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 6 }}>
                      <span style={{ fontSize: 11, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.08em', color: '#444141' }}>{cat.label}</span>
                      <button
                        onClick={() => {
                          const ids = catSections.map((s) => s.id);
                          setSelectedSectionIds((prev) => allCatSelected
                            ? prev.filter((x) => !ids.includes(x))
                            : [...prev.filter((x) => !ids.includes(x)), ...ids]);
                        }}
                        style={{ fontSize: 11, fontWeight: 600, color: allCatSelected ? '#b91c1c' : '#2F6FED', background: 'transparent', border: 'none', cursor: 'pointer', padding: 0, fontFamily: 'inherit' }}
                      >{allCatSelected ? 'Deselect' : 'Select all'}</button>
                    </div>
                    <div style={{ display: 'flex', flexDirection: 'column', gap: 5 }}>
                      {catSections.map((s) => {
                        const isActive = selectedSectionIds.includes(s.id);
                        const qCount = filterOrder === 'source-first' && selectedSource !== 'all'
                          ? s.questions.filter((q) => q.source === selectedSource).length
                          : s.questions.length;
                        return (
                          <button
                            key={s.id}
                            onClick={() => handleSectionToggle(s.id)}
                            style={{
                              display: 'flex', alignItems: 'center', justifyContent: 'space-between',
                              padding: '9px 14px', fontSize: 13.5, fontWeight: 600, textAlign: 'left',
                              border: isActive ? '1.5px solid #2F6FED' : '1.5px solid rgba(32,30,29,0.25)',
                              background: isActive ? '#eaf1fd' : '#fff',
                              color: isActive ? '#1d4ed8' : '#444141',
                              borderRadius: 0, cursor: 'pointer', fontFamily: 'inherit', width: '100%', gap: 12,
                            }}
                          >
                            <span style={{ flex: 1, textAlign: 'left' }}>{s.title}</span>
                            <span style={{ fontSize: 11.5, fontWeight: 700, color: isActive ? '#2F6FED' : '#7d7979', whiteSpace: 'nowrap' }}>
                              {qCount} soal
                            </span>
                          </button>
                        );
                      })}
                    </div>
                  </div>
                );
              })}

              {/* Uncategorized sections */}
              {visibleSections.filter((s) => !s.category_id).map((s) => {
                const isActive = selectedSectionIds.includes(s.id);
                const qCount = filterOrder === 'source-first' && selectedSource !== 'all'
                  ? s.questions.filter((q) => q.source === selectedSource).length
                  : s.questions.length;
                return (
                  <button
                    key={s.id}
                    onClick={() => handleSectionToggle(s.id)}
                    style={{
                      display: 'flex', alignItems: 'center', justifyContent: 'space-between',
                      padding: '9px 14px', fontSize: 13.5, fontWeight: 600, textAlign: 'left',
                      border: isActive ? '1.5px solid #2F6FED' : '1.5px solid rgba(32,30,29,0.25)',
                      background: isActive ? '#eaf1fd' : '#fff',
                      color: isActive ? '#1d4ed8' : '#444141',
                      borderRadius: 0, cursor: 'pointer', fontFamily: 'inherit', width: '100%', gap: 12, marginBottom: 5,
                    }}
                  >
                    <span style={{ flex: 1, textAlign: 'left' }}>{s.title}</span>
                    <span style={{ fontSize: 11.5, fontWeight: 700, color: isActive ? '#2F6FED' : '#7d7979', whiteSpace: 'nowrap' }}>
                      {qCount} soal
                    </span>
                  </button>
                );
              })}
            </div>

            {/* Source filter block — shown after sections in section-first mode */}
            {filterOrder === 'section-first' && sourcesInPool.length > 0 && (
              <div style={{ marginBottom: 24 }}>
                <div style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#7d7979', marginBottom: 8 }}>Source</div>
                <div style={{ display: 'flex', flexWrap: 'wrap', gap: 6 }}>
                  {(['all', ...sourcesInPool.map((s) => s.id)] as string[]).map((id) => {
                    const label = id === 'all' ? 'All' : (questionSources.find((s) => s.id === id)?.label ?? id);
                    const { color } = SOURCE_COLORS[id] ?? { color: '#374151' };
                    const isActive = selectedSource === id;
                    const activeStyle: React.CSSProperties = id === 'all'
                      ? { background: '#444141', color: '#fff', border: '1.5px solid #444141' }
                      : { background: color, color: '#fff', border: `1.5px solid ${color}` };
                    const baseStyle: React.CSSProperties = { padding: '7px 14px', fontSize: 13, fontWeight: 600, borderRadius: 0, cursor: 'pointer', fontFamily: 'inherit', border: '1.5px solid rgba(32,30,29,0.4)', background: 'transparent', color: '#201e1d' };
                    return (
                      <button key={id} onClick={() => handleSourceChange(id)} style={isActive ? { ...baseStyle, ...activeStyle } : baseStyle}>
                        {label}
                      </button>
                    );
                  })}
                </div>
              </div>
            )}

            {/* Question count */}
            <div style={{ marginBottom: 36 }}>
              <div style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#7d7979', marginBottom: 8 }}>
                Number of questions — <span style={{ color: '#2F6FED' }}>{availableQuestions.length === 0 ? 0 : clampedCount}</span>
              </div>
              {maxCount > minCount ? (
                <>
                  <input
                    type="range"
                    min={minCount}
                    max={maxCount}
                    value={clampedCount}
                    onChange={(e) => setQuestionCount(Number(e.target.value))}
                    style={{ width: '100%', accentColor: '#2F6FED', cursor: 'pointer' }}
                  />
                  <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: 4 }}>
                    <span style={{ fontSize: 12, color: '#7d7979' }}>{minCount}</span>
                    <span style={{ fontSize: 12, color: '#7d7979' }}>{maxCount}</span>
                  </div>
                </>
              ) : maxCount > 0 ? (
                <div style={{ fontSize: 13, color: '#605d5d' }}>{maxCount} question{maxCount !== 1 ? 's' : ''} available</div>
              ) : null}
            </div>

            {/* Mode selector */}
            <div style={{ marginBottom: 20 }}>
              <div style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#7d7979', marginBottom: 10 }}>Mode</div>
              <div style={{ display: 'flex', gap: 10 }}>
                {(['simulasi', 'belajar'] as DrillMode[]).map((m) => (
                  <button key={m} onClick={() => setMode(m)}
                    style={{ flex: 1, padding: '10px 12px', fontSize: 13, fontWeight: 700, fontFamily: 'inherit', borderRadius: 0, cursor: 'pointer', border: `2px solid ${mode === m ? '#2F6FED' : 'rgba(32,30,29,0.2)'}`, background: mode === m ? '#eaf1fd' : '#fff', color: mode === m ? '#2F6FED' : '#605d5d' }}>
                    {m === 'simulasi' ? 'Simulasi' : 'Belajar'}
                  </button>
                ))}
              </div>
              <div style={{ fontSize: 12, color: '#7d7979', marginTop: 6 }}>
                {mode === 'simulasi' ? 'Jawaban direveal di akhir.' : 'Jawaban langsung muncul tiap soal.'}
              </div>
            </div>

            <button
              onClick={startDrill}
              disabled={availableQuestions.length === 0}
              style={{ ...btnPrimary, width: '100%', padding: '12px 16px', fontSize: 14, opacity: availableQuestions.length > 0 ? 1 : 0.5, cursor: availableQuestions.length > 0 ? 'pointer' : 'not-allowed' }}
            >
              {availableQuestions.length === 0
                ? 'Select at least one section'
                : `Start Drill — ${clampedCount} question${clampedCount !== 1 ? 's' : ''}`}
            </button>
          </div>
        </div>
      </div>
    );
  }

  // ─── SUBMITTED VIEW ──────────────────────────────────────────────
  if (view === 'submitted') {
    return (
      <div style={{ display: 'flex', flexDirection: 'column', height: '100vh', background: '#f3f2f2', overflow: 'hidden' }}>
        <MemePopup score={scorePercent} />
        <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
          <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
            <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM9 MLE OJK</span>
            {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>{moduleId ? `Modul ${moduleId} — Results` : 'Drill Results'}</span>}
          </div>
          <div style={{ display: 'flex', gap: 8 }}>
            <button onClick={handleExportPDF} style={btnOutline}>Export PDF</button>
            <button onClick={handleRestart} style={btnOutline}>New Drill</button>
            <button onClick={() => router.push('/')} style={{ ...btnOutline, color: '#1d4ed8', borderColor: '#1d4ed8' }}>Home</button>
          </div>
        </div>

        <div style={{ flex: 1, overflowY: 'auto', display: 'flex', justifyContent: 'center', padding: isMobile ? '28px 16px 48px' : '44px 32px 60px' }}>
          <div style={{ maxWidth: 760, width: '100%' }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: 20, marginBottom: 16, flexWrap: 'wrap' }}>
              <span style={{ fontSize: isMobile ? 48 : 64, fontWeight: 800, lineHeight: 1 }}>{scorePercent}%</span>
              <span style={{ fontSize: 15, color: '#605d5d' }}>{scoreCorrect} of {total} correct</span>
            </div>
            <div style={{ height: 4, width: '100%', background: '#2F6FED', marginBottom: 28 }} />

            {drillQuestions.map((q, idx) => {
              const answeredChoiceId = answers[q.id];
              const answeredChoice = q.choices.find((c) => c.id === answeredChoiceId);
              const correctChoice = q.choices.find((c) => c.is_correct);
              const isCorrect = answeredChoice?.is_correct === true;
              const notAnswered = !answeredChoiceId;

              let tagStyle: React.CSSProperties;
              let tagText: string;
              if (notAnswered) { tagStyle = { background: 'transparent', color: '#605d5d', border: '1px solid rgba(32,30,29,0.4)' }; tagText = 'Not answered'; }
              else if (isCorrect) { tagStyle = { background: '#eafaf1', color: '#15803d', border: '1px solid #15803d' }; tagText = 'Correct'; }
              else { tagStyle = { background: '#fef2f2', color: '#b91c1c', border: '1px solid #b91c1c' }; tagText = 'Incorrect'; }

              return (
                <div key={q.id} style={{ padding: '14px 0', borderBottom: '1px solid rgba(32,30,29,0.15)', display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', gap: 12 }}>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ fontSize: isMobile ? 13.5 : 15, fontWeight: 600, marginBottom: 5, lineHeight: 1.4 }}>{idx + 1}. {q.text}</div>
                    <div style={{ fontSize: 13, color: '#444141' }}>Your answer: {answeredChoice ? answeredChoice.text : '—'}</div>
                    {!isCorrect && correctChoice && (
                      <div style={{ fontSize: 13, color: '#15803d', marginTop: 2 }}>Correct answer: {correctChoice.text}</div>
                    )}
                  </div>
                  <div style={{ ...tagStyle, padding: '3px 8px', fontSize: 11.5, fontWeight: 600, whiteSpace: 'nowrap', flexShrink: 0 }}>{tagText}</div>
                </div>
              );
            })}
          </div>
        </div>
      </div>
    );
  }

  // ─── DRILL VIEW ───────────────────────────────────────────────────
  const progressPercent = total > 0 ? (answeredCount / total) * 100 : 0;

  // Sidebar content inline
  function SidebarGrid({ onClose }: { onClose?: () => void }) {
    return (
      <>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 14 }}>
          <div style={{ fontSize: 16, fontWeight: 800 }}>Questions</div>
          {onClose && (
            <button onClick={onClose} style={{ background: 'transparent', border: 'none', fontSize: 20, cursor: 'pointer', color: '#201e1d', lineHeight: 1, padding: '0 4px' }}>✕</button>
          )}
        </div>
        <div style={{ display: 'flex', flexWrap: 'wrap', gap: 12, marginBottom: 18, paddingBottom: 18, borderBottom: '2px solid rgba(32,30,29,0.4)' }}>
          {(mode === 'belajar'
            ? [
                { bg: '#f8f4f4', border: '1px solid rgba(32,30,29,0.4)', label: 'Unanswered' },
                { bg: '#15803d', border: 'none', label: 'Benar' },
                { bg: '#b91c1c', border: 'none', label: 'Salah' },
                { bg: '#f8f4f4', border: '2px solid #2F6FED', label: 'Active' },
              ]
            : [
                { bg: '#f8f4f4', border: '1px solid rgba(32,30,29,0.4)', label: 'Unanswered' },
                { bg: '#15803d', border: 'none', label: 'Answered' },
                { bg: '#f8f4f4', border: '2px solid #2F6FED', label: 'Active' },
              ]
          ).map(({ bg, border, label }) => (
            <div key={label} style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
              <div style={{ width: 13, height: 13, background: bg, border, flexShrink: 0 }} />
              <span style={{ fontSize: 11.5, color: '#605d5d' }}>{label}</span>
            </div>
          ))}
          <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
            <div style={{ width: 13, height: 13, background: '#f8f4f4', border: '1px solid rgba(32,30,29,0.4)', flexShrink: 0, position: 'relative' }}>
              <span style={{ position: 'absolute', top: -4, right: -4, width: 7, height: 7, background: '#d97706', borderRadius: '50%', border: '1px solid #f3f2f2', display: 'block' }} />
            </div>
            <span style={{ fontSize: 11.5, color: '#605d5d' }}>Flagged</span>
          </div>
        </div>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(5,1fr)', gap: 8 }}>
          {drillQuestions.map((q, idx) => {
            const isAnswered = !!answers[q.id];
            const isCurrent = idx === current;
            const isFlagged = !!flagged[q.id];
            let tileBg = '#f8f4f4', tileColor = '#444141', tileBorder = '1px solid rgba(32,30,29,0.4)';
            if (isAnswered) {
              if (mode === 'belajar') {
                const isCorrect = q.choices.find((c) => c.id === answers[q.id])?.is_correct === true;
                tileBg = isCorrect ? '#15803d' : '#b91c1c';
              } else {
                tileBg = '#15803d';
              }
              tileColor = '#fff'; tileBorder = '1px solid transparent';
            }
            if (isCurrent) { tileBorder = '2px solid #2F6FED'; }
            return (
              <div key={q.id} onClick={() => goTo(idx)} style={{ width: 40, height: 40, display: 'flex', alignItems: 'center', justifyContent: 'center', background: tileBg, color: tileColor, border: tileBorder, cursor: 'pointer', fontSize: 13, fontWeight: 600, position: 'relative' }}>
                {idx + 1}
                {isFlagged && <span style={{ position: 'absolute', top: -5, right: -5, width: 10, height: 10, background: '#d97706', borderRadius: '50%', border: '1.5px solid #f3f2f2' }} />}
              </div>
            );
          })}
        </div>
      </>
    );
  }

  return (
    <div style={{ display: 'flex', flexDirection: 'column', height: '100vh', background: '#f3f2f2', overflow: 'hidden' }}>
      {/* Header */}
      <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2', gap: 12 }}>
        <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
          <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM9 MLE OJK</span>
          {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>{moduleId ? `Modul ${moduleId} — Drill` : 'Section Drill'}</span>}
        </div>
        <div style={{ display: 'flex', alignItems: 'center', gap: isMobile ? 10 : 20 }}>
          {isMobile ? (
            <span style={{ fontSize: 12.5, fontWeight: 600, color: '#605d5d' }}>{answeredCount}/{total}</span>
          ) : (
            <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-end', gap: 5 }}>
              <span style={{ fontSize: 12.5, fontWeight: 600, color: '#605d5d' }}>{answeredCount}/{total} answered</span>
              <div style={{ width: 150, height: 4, background: '#d7d3d3' }}>
                <div style={{ height: '100%', width: `${progressPercent}%`, background: '#2F6FED' }} />
              </div>
            </div>
          )}
          {isMobile ? (
            <button onClick={() => setSidebarOpen(true)} style={{ ...btnOutline, padding: '7px 12px' }}>≡ Questions</button>
          ) : (
            <div style={{ display: 'flex', gap: 8 }}>
              <button onClick={() => setShowDownloadModal(true)} style={btnOutline}>Download Docs</button>
              <button onClick={handleSubmit} style={btnOutline}>Submit</button>
            </div>
          )}
        </div>
      </div>

      {/* Mobile sidebar overlay */}
      {isMobile && sidebarOpen && (
        <div style={{ position: 'fixed', inset: 0, zIndex: 200 }}>
          <div onClick={() => setSidebarOpen(false)} style={{ position: 'absolute', inset: 0, background: 'rgba(32,30,29,0.4)' }} />
          <div style={{ position: 'absolute', top: 0, left: 0, bottom: 0, width: '85%', maxWidth: 320, background: '#f3f2f2', overflowY: 'auto', padding: '20px 18px', borderRight: '2px solid rgba(32,30,29,0.4)' }}>
            <SidebarGrid onClose={() => setSidebarOpen(false)} />
            {mode === 'simulasi' && (
              <div style={{ marginTop: 28, paddingTop: 20, borderTop: '2px solid rgba(32,30,29,0.4)' }}>
                <button onClick={() => { setSidebarOpen(false); handleSubmit(); }} style={{ ...btnPrimary, width: '100%', textAlign: 'center' }}>
                  Submit Drill
                </button>
              </div>
            )}
          </div>
        </div>
      )}

      {/* Unanswered confirmation bar */}
      {confirmingSubmit && (
        <div style={{ flexShrink: 0, background: '#fffbeb', borderTop: '2px solid #d97706', borderBottom: '2px solid #d97706', padding: `12px ${px}px`, display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: 16, flexWrap: 'wrap' }}>
          <span style={{ fontSize: 13, fontWeight: 600, color: '#92400e' }}>
            {total - answeredCount} question{total - answeredCount > 1 ? 's' : ''} unanswered. Submit anyway?
          </span>
          <div style={{ display: 'flex', gap: 8 }}>
            <button onClick={() => setConfirmingSubmit(false)} style={btnOutline}>Cancel</button>
            <button onClick={confirmSubmit} style={btnPrimary}>Submit</button>
          </div>
        </div>
      )}

      {/* Body */}
      <div style={{ display: 'flex', flex: 1, minHeight: 0 }}>
        {/* Desktop sidebar */}
        {!isMobile && (
          <div style={{ width: 280, flexShrink: 0, borderRight: '2px solid rgba(32,30,29,0.4)', padding: '24px 20px', overflowY: 'auto' }}>
            <SidebarGrid />
          </div>
        )}

        {/* Main pane */}
        <div style={{ flex: 1, overflowY: 'auto', minHeight: 0, display: 'flex', justifyContent: 'center', padding: isMobile ? '24px 16px' : '44px 32px' }}>
          <div style={{ maxWidth: 660, width: '100%' }}>
            {currentQuestion && (
              <>
                <div style={{ background: '#eae9e9', padding: isMobile ? '24px 20px' : '40px 44px' }}>
                  <div style={{ height: 4, width: 64, background: '#2F6FED', marginBottom: 18 }} />

                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', gap: 12, marginBottom: 14, flexWrap: 'wrap' }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: 8, flexWrap: 'wrap' }}>
                      <span style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#1d4ed8' }}>
                        Question {current + 1} of {total}
                      </span>
                      <DrillSourceBadge source={currentQuestion.source} sources={questionSources} />
                    </div>
                    {mode === 'simulasi' && (
                      <button
                        onClick={handleFlag}
                        style={isCurrentFlagged
                          ? { background: '#d97706', border: 'none', color: '#fff', padding: '5px 10px', fontSize: 12, fontWeight: 600, borderRadius: 0, cursor: 'pointer', fontFamily: 'inherit', whiteSpace: 'nowrap' }
                          : { background: 'transparent', border: '1.5px solid rgba(32,30,29,0.4)', color: '#201e1d', padding: '5px 10px', fontSize: 12, fontWeight: 600, borderRadius: 0, cursor: 'pointer', fontFamily: 'inherit', whiteSpace: 'nowrap' }
                        }
                      >
                        {isCurrentFlagged ? 'Flagged ✕' : 'Flag for review'}
                      </button>
                    )}
                  </div>

                  <div style={{ fontSize: isMobile ? 18 : 25, fontWeight: 800, lineHeight: 1.4, marginBottom: 24 }}>
                    {currentQuestion.text}
                  </div>

                  <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
                    {currentQuestion.choices.map((choice) => {
                      const isSelected = currentChoiceId === choice.id;
                      const locked = mode === 'belajar' && isCurrentConfirmed;
                      const isHovered = hoveredOption === choice.id && !isSelected && !locked;
                      let bg = isSelected ? '#eaf1fd' : isHovered ? '#eae7e7' : 'transparent';
                      let border = isSelected ? '1px solid #2F6FED' : '1px solid transparent';
                      let dotColor = isSelected ? '#2F6FED' : '#d7d3d3';
                      if (locked) {
                        if (choice.is_correct) { bg = '#eafaf1'; border = '1px solid #15803d'; dotColor = '#15803d'; }
                        else if (isSelected && !choice.is_correct) { bg = '#fef2f2'; border = '1px solid #b91c1c'; dotColor = '#b91c1c'; }
                        else { bg = 'transparent'; border = '1px solid transparent'; }
                      }
                      return (
                        <div key={choice.id}
                          onClick={() => !locked && handleAnswer(choice.id)}
                          onMouseEnter={() => !locked && setHoveredOption(choice.id)}
                          onMouseLeave={() => setHoveredOption(null)}
                          style={{ display: 'flex', alignItems: 'center', gap: 14, padding: isMobile ? '12px 14px' : '16px 18px', cursor: locked ? 'default' : 'pointer', border, background: bg }}
                        >
                          <div style={{ width: 16, height: 16, borderRadius: '50%', border: `1.5px solid ${dotColor}`, display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0 }}>
                            {(isSelected || (locked && choice.is_correct)) && <div style={{ width: 8, height: 8, background: dotColor, borderRadius: '50%' }} />}
                          </div>
                          <span style={{ fontSize: isMobile ? 14.5 : 15.5, lineHeight: 1.4 }}>{choice.text}</span>
                        </div>
                      );
                    })}
                  </div>

                  {mode === 'belajar' && isCurrentConfirmed && (() => {
                    const correct = currentQuestion.choices.find((c) => c.is_correct);
                    const letter = correct ? String.fromCharCode(64 + correct.position) : '?';
                    const isOk = !!correct && currentChoiceId === correct.id;
                    return (
                      <div style={{ marginTop: 16, padding: '14px 18px', background: isOk ? '#f0fdf4' : '#fffbeb', border: `1px solid ${isOk ? '#15803d' : '#d97706'}` }}>
                        <div style={{ fontSize: 11, fontWeight: 700, color: isOk ? '#15803d' : '#b45309', marginBottom: 6, textTransform: 'uppercase', letterSpacing: '0.07em' }}>
                          {isOk ? 'Benar' : 'Belum Tepat'} · Kunci {letter}
                        </div>
                        <div style={{ fontSize: 13.5, lineHeight: 1.6, color: '#201e1d' }}>
                          {currentQuestion.explanation || `Jawaban yang benar adalah: ${correct?.text ?? '—'}`}
                        </div>
                      </div>
                    );
                  })()}
                </div>

                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginTop: 20 }}>
                  {mode === 'simulasi' ? (
                    <>
                      <button onClick={() => !isFirst && goTo(current - 1)} disabled={isFirst} style={{ ...btnOutline, opacity: isFirst ? 0.45 : 1, cursor: isFirst ? 'not-allowed' : 'pointer' }}>Previous</button>
                      <button onClick={() => { if (!isLast) goTo(current + 1); else handleSubmit(); }} style={btnPrimary}>
                        {isLast ? 'Submit' : 'Next'}
                      </button>
                    </>
                  ) : (
                    <>
                      <button onClick={() => !isFirst && goTo(current - 1)} disabled={isFirst} style={{ ...btnOutline, opacity: isFirst ? 0.45 : 1, cursor: isFirst ? 'not-allowed' : 'pointer' }}>Previous</button>
                      <button
                        onClick={() => { if (!isLast) goTo(current + 1); else setView('submitted'); }}
                        disabled={!isCurrentConfirmed}
                        style={{ ...btnPrimary, opacity: isCurrentConfirmed ? 1 : 0.45, cursor: isCurrentConfirmed ? 'pointer' : 'not-allowed' }}
                      >
                        {isLast ? 'Lihat Hasil' : 'Soal Berikutnya →'}
                      </button>
                    </>
                  )}
                </div>
              </>
            )}
          </div>
        </div>
      </div>
      {showDownloadModal && (
        <DownloadDocsModal
          title={moduleId ? `Modul ${moduleId} — Drill` : 'Section Drill'}
          questions={drillQuestions.map((q) => ({ text: q.text, choices: q.choices.map((c) => ({ text: c.text, is_correct: c.is_correct })) }))}
          onClose={() => setShowDownloadModal(false)}
        />
      )}
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

function MemePopup({ score }: { score: number }) {
  const [visible, setVisible] = useState(true);
  if (!visible) return null;
  const isGood = score >= 70;
  const img = isGood ? '/meme_good.png' : '/meme_bad.png';
  const caption = isGood
    ? score >= 90 ? 'ezz game 😎' : 'siap jd pengawas 🫡'
    : score >= 50 ? 'faaaahhh 😩' : 'nilai apa ini dawg 💀';
  const btn = isGood ? 'Ik fr 😌' : 'mari belajar lagi 😭';
  return (
    <div style={{ position: 'fixed', inset: 0, zIndex: 999, display: 'flex', alignItems: 'center', justifyContent: 'center', background: 'rgba(0,0,0,0.65)' }}>
      <div style={{ background: '#fff', maxWidth: 400, width: '90%', padding: '24px 24px 20px', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
        <img src={img} alt="meme" style={{ width: '100%', display: 'block' }} />
        <div style={{ marginTop: 14, fontSize: 14, fontWeight: 700, textAlign: 'center', lineHeight: 1.5, color: '#201e1d' }}>{caption}</div>
        <button
          onClick={() => setVisible(false)}
          style={{ marginTop: 14, background: '#201e1d', color: '#fff', border: 'none', padding: '9px 28px', fontSize: 13, fontWeight: 700, cursor: 'pointer', fontFamily: 'inherit', letterSpacing: '0.03em' }}
        >
          {btn}
        </button>
      </div>
    </div>
  );
}

function DrillSourceBadge({ source, sources }: { source: string; sources: QuestionSource[] }) {
  const label = sources.find((s) => s.id === source)?.label ?? source;
  const { color, bg } = SOURCE_COLORS[source] ?? { color: '#374151', bg: '#f3f4f6' };
  return (
    <span style={{ fontSize: 10, fontWeight: 700, letterSpacing: '0.05em', textTransform: 'uppercase', padding: '2px 7px', border: `1px solid ${color}`, color, background: bg }}>
      {label}
    </span>
  );
}
