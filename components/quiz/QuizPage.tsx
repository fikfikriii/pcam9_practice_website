'use client';

import { useEffect, useState, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import type { Section, Question } from '@/lib/types';
import { useMobile } from '@/lib/useMobile';

const LS_KEY = 'pcam9-ojk-quiz-progress-v1';

type ViewState = 'quiz' | 'review' | 'submitted';

interface SavedProgress {
  answers: Record<number, number>;
  flagged: Record<number, boolean>;
  current: number;
  selectedIds: number[];
}

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

function drawQuestions(sections: Section[]): number[] {
  return sections.flatMap((s) => {
    const shuffled = [...s.questions].sort(() => Math.random() - 0.5);
    const drawn = shuffled.slice(0, s.draw_per_session);
    drawn.sort((a, b) => a.position - b.position);
    return drawn.map((q) => q.id);
  });
}

// ── Sidebar content (shared between desktop fixed panel and mobile overlay) ──
function SidebarContent({
  activeSections, answers, flagged, current, onGoTo, onClose,
}: {
  activeSections: Section[];
  answers: Record<number, number>;
  flagged: Record<number, boolean>;
  current: number;
  onGoTo: (idx: number) => void;
  onClose?: () => void;
}) {
  return (
    <>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 14 }}>
        <div style={{ fontSize: 16, fontWeight: 800 }}>Question List</div>
        {onClose && (
          <button onClick={onClose} style={{ background: 'transparent', border: 'none', fontSize: 20, cursor: 'pointer', color: '#201e1d', lineHeight: 1, padding: '0 4px' }}>✕</button>
        )}
      </div>

      {/* Legend */}
      <div style={{ display: 'flex', flexWrap: 'wrap', gap: 12, marginBottom: 18, paddingBottom: 18, borderBottom: '2px solid rgba(32,30,29,0.4)' }}>
        {[
          { bg: '#f8f4f4', border: '1px solid rgba(32,30,29,0.4)', label: 'Unanswered' },
          { bg: '#15803d', border: 'none', label: 'Answered' },
          { bg: '#f8f4f4', border: '2px solid #2F6FED', label: 'Active' },
        ].map(({ bg, border, label }) => (
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

      {/* Section groups */}
      {activeSections.map((section, sIdx) => {
        const sectionOffset = activeSections.slice(0, sIdx).reduce((acc, s) => acc + s.questions.length, 0);
        return (
          <div key={section.id} style={{ marginTop: sIdx === 0 ? 0 : 16, paddingTop: sIdx === 0 ? 0 : 16, borderTop: sIdx === 0 ? 'none' : '2px solid rgba(32,30,29,0.4)' }}>
            <div style={{ fontSize: 11.5, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#7d7979', marginBottom: 10 }}>
              {section.title}
            </div>
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(5,1fr)', gap: 8 }}>
              {section.questions.map((q, qIdx) => {
                const flatIdx = sectionOffset + qIdx;
                const isAnswered = !!answers[q.id];
                const isCurrent = flatIdx === current;
                const isFlagged = !!flagged[q.id];

                let tileBg = '#f8f4f4', tileColor = '#444141', tileBorder = '1px solid rgba(32,30,29,0.4)';
                if (isAnswered) { tileBg = '#15803d'; tileColor = '#fff'; tileBorder = '1px solid transparent'; }
                if (isCurrent) { tileBorder = '2px solid #2F6FED'; }

                return (
                  <div key={q.id} onClick={() => onGoTo(flatIdx)} style={{ width: 40, height: 40, display: 'flex', alignItems: 'center', justifyContent: 'center', background: tileBg, color: tileColor, border: tileBorder, cursor: 'pointer', position: 'relative', fontSize: 13, fontWeight: 600 }}>
                    {flatIdx + 1}
                    {isFlagged && <span style={{ position: 'absolute', top: -5, right: -5, width: 10, height: 10, background: '#d97706', borderRadius: '50%', border: '1.5px solid #f3f2f2' }} />}
                  </div>
                );
              })}
            </div>
          </div>
        );
      })}
    </>
  );
}

export default function QuizPage() {
  const router = useRouter();
  const isMobile = useMobile();
  const [view, setView] = useState<ViewState>('quiz');
  const [current, setCurrent] = useState(0);
  const [answers, setAnswers] = useState<Record<number, number>>({});
  const [flagged, setFlagged] = useState<Record<number, boolean>>({});
  const [sections, setSections] = useState<Section[]>([]);
  const [drawnIds, setDrawnIds] = useState<number[]>([]);
  const [loading, setLoading] = useState(true);
  const [hoveredOption, setHoveredOption] = useState<number | null>(null);
  const [sidebarOpen, setSidebarOpen] = useState(false);

  const persist = useCallback((a: Record<number, number>, f: Record<number, boolean>, c: number, ids: number[]) => {
    try { localStorage.setItem(LS_KEY, JSON.stringify({ answers: a, flagged: f, current: c, selectedIds: ids })); } catch { /* ignore */ }
  }, []);

  useEffect(() => {
    fetch('/api/quiz')
      .then((r) => r.json())
      .then((data: Section[]) => {
        setSections(data);
        let ids: number[];
        let savedAnswers: Record<number, number> = {};
        let savedFlagged: Record<number, boolean> = {};
        let savedCurrent = 0;
        try {
          const raw = localStorage.getItem(LS_KEY);
          if (raw) {
            const saved: SavedProgress = JSON.parse(raw);
            ids = Array.isArray(saved.selectedIds) && saved.selectedIds.length > 0 ? saved.selectedIds : drawQuestions(data);
            if (saved.answers) savedAnswers = saved.answers;
            if (saved.flagged) savedFlagged = saved.flagged;
            if (typeof saved.current === 'number') savedCurrent = saved.current;
          } else {
            ids = drawQuestions(data);
          }
        } catch { ids = drawQuestions(data); }
        setDrawnIds(ids);
        setAnswers(savedAnswers);
        setFlagged(savedFlagged);
        setCurrent(savedCurrent);
        setLoading(false);
      })
      .catch(() => setLoading(false));
  }, []);

  const idSet = new Set(drawnIds);
  const flatQuestions: Question[] = drawnIds.length > 0
    ? sections.flatMap((s) => s.questions.filter((q) => idSet.has(q.id)))
    : [];
  const activeSections = sections
    .map((s) => ({ ...s, questions: s.questions.filter((q) => idSet.has(q.id)) }))
    .filter((s) => s.questions.length > 0);

  const total = flatQuestions.length;
  const answeredCount = Object.keys(answers).length;
  const unansweredCount = total - answeredCount;
  const progressPercent = total > 0 ? (answeredCount / total) * 100 : 0;
  const currentQuestion = flatQuestions[current];
  const currentSection = activeSections.find((s) => s.questions.some((q) => q.id === currentQuestion?.id));

  function handleAnswer(choiceId: number) {
    if (!currentQuestion) return;
    const newAnswers = { ...answers, [currentQuestion.id]: choiceId };
    setAnswers(newAnswers);
    persist(newAnswers, flagged, current, drawnIds);
  }

  function handleFlag() {
    if (!currentQuestion) return;
    const newFlagged = { ...flagged, [currentQuestion.id]: !flagged[currentQuestion.id] };
    setFlagged(newFlagged);
    persist(answers, newFlagged, current, drawnIds);
  }

  function goTo(idx: number) {
    setCurrent(idx);
    setSidebarOpen(false);
    persist(answers, flagged, idx, drawnIds);
  }

  function handleRestart() {
    const ids = drawQuestions(sections);
    setDrawnIds(ids); setAnswers({}); setFlagged({}); setCurrent(0); setView('quiz');
    persist({}, {}, 0, ids);
  }

  function handleGoHome() {
    try { localStorage.removeItem(LS_KEY); } catch { /* ignore */ }
    router.push('/');
  }

  const scoreCorrect = flatQuestions.filter((q) => {
    const choiceId = answers[q.id];
    return choiceId && q.choices.find((c) => c.id === choiceId)?.is_correct === true;
  }).length;
  const scorePercent = total > 0 ? Math.round((scoreCorrect / total) * 100) : 0;

  const px = isMobile ? 16 : 32;

  if (loading) {
    return (
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '100vh' }}>
        <span style={{ fontSize: 15, color: '#605d5d' }}>Loading quiz...</span>
      </div>
    );
  }

  // ─── SUBMITTED VIEW ──────────────────────────────────────────────
  if (view === 'submitted') {
    return (
      <div style={{ display: 'flex', flexDirection: 'column', height: '100vh', background: '#f3f2f2', overflow: 'hidden' }}>
        <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
          <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
            <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM 9 OJK</span>
            {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Results</span>}
          </div>
          <button onClick={handleGoHome} style={{ ...btnOutline, color: '#1d4ed8', borderColor: '#1d4ed8' }}>Home</button>
        </div>

        <div style={{ flex: 1, overflowY: 'auto', display: 'flex', justifyContent: 'center', padding: isMobile ? '28px 16px 48px' : '44px 32px 60px' }}>
          <div style={{ maxWidth: 760, width: '100%' }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: 20, marginBottom: 16, flexWrap: 'wrap' }}>
              <span style={{ fontSize: isMobile ? 48 : 64, fontWeight: 800, lineHeight: 1 }}>{scorePercent}%</span>
              <span style={{ fontSize: 15, color: '#605d5d' }}>{scoreCorrect} of {total} correct</span>
            </div>
            <div style={{ height: 4, width: '100%', background: '#2F6FED', marginBottom: 28 }} />

            {activeSections.map((section, sIdx) => {
              const offset = activeSections.slice(0, sIdx).reduce((acc, s) => acc + s.questions.length, 0);
              return (
                <div key={section.id} style={{ marginTop: sIdx === 0 ? 0 : 16, paddingTop: sIdx === 0 ? 0 : 16, borderTop: sIdx === 0 ? 'none' : '2px solid rgba(32,30,29,0.4)' }}>
                  <div style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#7d7979', marginBottom: 12 }}>{section.title}</div>
                  {section.questions.map((q, qIdx) => {
                    const flatIdx = offset + qIdx;
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
                          <div style={{ fontSize: isMobile ? 13.5 : 15, fontWeight: 600, marginBottom: 5, lineHeight: 1.4 }}>{flatIdx + 1}. {q.text}</div>
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
              );
            })}
          </div>
        </div>
      </div>
    );
  }

  // ─── REVIEW VIEW ─────────────────────────────────────────────────
  if (view === 'review') {
    return (
      <div style={{ display: 'flex', flexDirection: 'column', height: '100vh', background: '#f3f2f2', overflow: 'hidden' }}>
        <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
          <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
            <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM 9 OJK</span>
            {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Summary before submit</span>}
          </div>
          <button onClick={() => setView('quiz')} style={btnOutline}>Back</button>
        </div>

        <div style={{ flex: 1, overflowY: 'auto', display: 'flex', justifyContent: 'center', padding: isMobile ? '24px 16px' : '40px 32px 24px' }}>
          <div style={{ maxWidth: 820, width: '100%', paddingBottom: 100 }}>
            <div style={{ fontSize: isMobile ? 22 : 26, fontWeight: 800 }}>Answer Summary</div>
            <div style={{ fontSize: 14, color: '#605d5d', marginTop: 8 }}>Review your answers before submitting.</div>

            <div style={{ marginTop: 20, display: 'flex', border: '1px solid rgba(32,30,29,0.4)' }}>
              <div style={{ flex: 1, padding: '16px 20px', borderRight: '1px solid rgba(32,30,29,0.4)' }}>
                <div style={{ fontSize: isMobile ? 24 : 30, fontWeight: 800 }}>{answeredCount}</div>
                <div style={{ fontSize: 13, color: '#605d5d' }}>Answered</div>
              </div>
              <div style={{ flex: 1, padding: '16px 20px', background: unansweredCount > 0 ? '#eaf1fd' : 'transparent' }}>
                <div style={{ fontSize: isMobile ? 24 : 30, fontWeight: 800, color: unansweredCount > 0 ? '#1d4ed8' : '#201e1d' }}>{unansweredCount}</div>
                <div style={{ fontSize: 13, color: '#605d5d' }}>Not answered</div>
              </div>
            </div>

            {activeSections.map((section, sIdx) => {
              const sectionOffset = activeSections.slice(0, sIdx).reduce((acc, s) => acc + s.questions.length, 0);
              return (
                <div key={section.id} style={{ marginTop: sIdx === 0 ? 28 : 14, paddingTop: sIdx === 0 ? 0 : 14, borderTop: sIdx === 0 ? 'none' : '2px solid rgba(32,30,29,0.4)' }}>
                  <div style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#7d7979', marginBottom: 10 }}>{section.title}</div>
                  <div style={{ display: 'grid', gridTemplateColumns: 'repeat(5,1fr)', gap: 8 }}>
                    {section.questions.map((q, qIdx) => {
                      const flatIdx = sectionOffset + qIdx;
                      const isAnswered = !!answers[q.id];
                      const isCurrent = flatIdx === current;
                      const isFlagged = !!flagged[q.id];

                      let tileBg = '#f8f4f4', tileColor = '#444141', tileBorder = '1px solid rgba(32,30,29,0.4)';
                      if (isAnswered) { tileBg = '#15803d'; tileColor = '#fff'; tileBorder = '1px solid transparent'; }
                      if (isCurrent) { tileBorder = '2px solid #2F6FED'; }

                      return (
                        <div key={q.id} onClick={() => { goTo(flatIdx); setView('quiz'); }} style={{ width: 46, height: 46, display: 'flex', alignItems: 'center', justifyContent: 'center', background: tileBg, color: tileColor, border: tileBorder, cursor: 'pointer', position: 'relative', fontSize: 13, fontWeight: 600 }}>
                          {flatIdx + 1}
                          {isFlagged && <span style={{ position: 'absolute', top: -5, right: -5, width: 10, height: 10, background: '#d97706', borderRadius: '50%', border: '1.5px solid #f3f2f2' }} />}
                        </div>
                      );
                    })}
                  </div>
                </div>
              );
            })}
          </div>
        </div>

        <div style={{ position: 'sticky', bottom: 0, borderTop: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2', padding: `16px ${px}px`, display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexShrink: 0 }}>
          <button onClick={() => setView('quiz')} style={btnOutline}>Back to Questions</button>
          <button onClick={() => setView('submitted')} style={btnPrimary}>Submit Quiz</button>
        </div>
      </div>
    );
  }

  // ─── QUIZ VIEW ────────────────────────────────────────────────────
  const isFirst = current === 0;
  const isLast = current === total - 1;
  const currentChoiceId = currentQuestion ? answers[currentQuestion.id] : undefined;
  const isCurrentFlagged = currentQuestion ? !!flagged[currentQuestion.id] : false;

  return (
    <div style={{ display: 'flex', flexDirection: 'column', height: '100vh', background: '#f3f2f2', overflow: 'hidden' }}>
      {/* Header */}
      <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2', gap: 12 }}>
        <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
          <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM 9 OJK</span>
          {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Class Assessment Practice</span>}
        </div>
        <div style={{ display: 'flex', alignItems: 'center', gap: isMobile ? 10 : 20 }}>
          {/* Progress */}
          {isMobile ? (
            <span style={{ fontSize: 12.5, fontWeight: 600, color: '#605d5d' }}>{answeredCount}/{total}</span>
          ) : (
            <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-end', gap: 5 }}>
              <span style={{ fontSize: 12.5, fontWeight: 600, color: '#605d5d' }}>{answeredCount}/{total} answered</span>
              <div style={{ width: 150, height: 4, background: '#d7d3d3' }}>
                <div style={{ height: '100%', width: `${progressPercent}%`, background: '#2F6FED', transition: 'width 0.2s' }} />
              </div>
            </div>
          )}
          {/* On mobile: sidebar toggle; on desktop: Review button */}
          {isMobile ? (
            <button onClick={() => setSidebarOpen(true)} style={{ ...btnOutline, padding: '7px 12px' }}>≡ Questions</button>
          ) : (
            <button onClick={() => setView('review')} style={btnOutline}>Review &amp; Submit</button>
          )}
        </div>
      </div>

      {/* Mobile sidebar overlay */}
      {isMobile && sidebarOpen && (
        <div style={{ position: 'fixed', inset: 0, zIndex: 200 }}>
          {/* Backdrop */}
          <div onClick={() => setSidebarOpen(false)} style={{ position: 'absolute', inset: 0, background: 'rgba(32,30,29,0.4)' }} />
          {/* Panel */}
          <div style={{ position: 'absolute', top: 0, left: 0, bottom: 0, width: '85%', maxWidth: 320, background: '#f3f2f2', overflowY: 'auto', padding: '20px 18px', borderRight: '2px solid rgba(32,30,29,0.4)' }}>
            <SidebarContent
              activeSections={activeSections}
              answers={answers}
              flagged={flagged}
              current={current}
              onGoTo={goTo}
              onClose={() => setSidebarOpen(false)}
            />
            {/* Mobile-only review button at bottom of sidebar */}
            <div style={{ marginTop: 28, paddingTop: 20, borderTop: '2px solid rgba(32,30,29,0.4)' }}>
              <button onClick={() => { setSidebarOpen(false); setView('review'); }} style={{ ...btnPrimary, width: '100%', textAlign: 'center' }}>
                Review &amp; Submit
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Body */}
      <div style={{ display: 'flex', flex: 1, minHeight: 0 }}>
        {/* Desktop sidebar */}
        {!isMobile && (
          <div style={{ width: 300, flexShrink: 0, borderRight: '2px solid rgba(32,30,29,0.4)', padding: '24px 20px', overflowY: 'auto' }}>
            <SidebarContent
              activeSections={activeSections}
              answers={answers}
              flagged={flagged}
              current={current}
              onGoTo={goTo}
            />
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
                    <span style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#1d4ed8' }}>
                      Question {current + 1} · {currentSection?.title}
                    </span>
                    <button
                      onClick={handleFlag}
                      style={isCurrentFlagged
                        ? { background: '#d97706', border: 'none', color: '#fff', padding: '5px 10px', fontSize: 12, fontWeight: 600, borderRadius: 0, cursor: 'pointer', fontFamily: 'inherit', whiteSpace: 'nowrap' }
                        : { background: 'transparent', border: '1.5px solid rgba(32,30,29,0.4)', color: '#201e1d', padding: '5px 10px', fontSize: 12, fontWeight: 600, borderRadius: 0, cursor: 'pointer', fontFamily: 'inherit', whiteSpace: 'nowrap' }
                      }
                    >
                      {isCurrentFlagged ? 'Flagged ✕' : 'Flag for review'}
                    </button>
                  </div>

                  <div style={{ fontSize: isMobile ? 18 : 25, fontWeight: 800, lineHeight: 1.4, marginBottom: 24 }}>
                    {currentQuestion.text}
                  </div>

                  <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
                    {currentQuestion.choices.map((choice) => {
                      const isSelected = currentChoiceId === choice.id;
                      const isHovered = hoveredOption === choice.id && !isSelected;
                      return (
                        <div key={choice.id} onClick={() => handleAnswer(choice.id)} onMouseEnter={() => setHoveredOption(choice.id)} onMouseLeave={() => setHoveredOption(null)}
                          style={{ display: 'flex', alignItems: 'center', gap: 14, padding: isMobile ? '12px 14px' : '16px 18px', cursor: 'pointer', border: isSelected ? '1px solid #2F6FED' : '1px solid transparent', background: isSelected ? '#eaf1fd' : isHovered ? '#eae7e7' : 'transparent', transition: 'background 0.1s' }}
                        >
                          <div style={{ width: 16, height: 16, borderRadius: '50%', border: `1.5px solid ${isSelected ? '#2F6FED' : '#d7d3d3'}`, display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0 }}>
                            {isSelected && <div style={{ width: 8, height: 8, background: '#2F6FED', borderRadius: '50%', boxShadow: '0 0 0 2px #eaf1fd' }} />}
                          </div>
                          <span style={{ fontSize: isMobile ? 14.5 : 15.5, lineHeight: 1.4 }}>{choice.text}</span>
                        </div>
                      );
                    })}
                  </div>
                </div>

                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginTop: 20 }}>
                  <button onClick={() => current > 0 && goTo(current - 1)} disabled={isFirst} style={{ ...btnOutline, opacity: isFirst ? 0.45 : 1, cursor: isFirst ? 'not-allowed' : 'pointer' }}>
                    Previous
                  </button>
                  <button onClick={() => { if (current < total - 1) goTo(current + 1); else setView('review'); }} style={btnPrimary}>
                    {isLast ? 'Review & Submit' : 'Next'}
                  </button>
                </div>
              </>
            )}

            {!currentQuestion && total === 0 && (
              <div style={{ textAlign: 'center', color: '#605d5d', marginTop: 60 }}>
                No questions available. Please check your database.
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
