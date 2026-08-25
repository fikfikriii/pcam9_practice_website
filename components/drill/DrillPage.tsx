'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import type { Section, Question } from '@/lib/types';
import { useMobile } from '@/lib/useMobile';

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

export default function DrillPage() {
  const router = useRouter();
  const isMobile = useMobile();
  const px = isMobile ? 16 : 32;

  const [allSections, setAllSections] = useState<Section[]>([]);
  const [loading, setLoading] = useState(true);

  // Setup state
  const [selectedSectionId, setSelectedSectionId] = useState<number | null>(null);
  const [questionCount, setQuestionCount] = useState(5);

  // Drill state
  const [view, setView] = useState<ViewState>('setup');
  const [drillQuestions, setDrillQuestions] = useState<Question[]>([]);
  const [current, setCurrent] = useState(0);
  const [answers, setAnswers] = useState<Record<number, number>>({});
  const [hoveredOption, setHoveredOption] = useState<number | null>(null);
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const [confirmingSubmit, setConfirmingSubmit] = useState(false);

  useEffect(() => {
    fetch('/api/bank')
      .then((r) => r.json())
      .then((data: Section[]) => {
        const withQuestions = data.filter((s) => s.questions.length > 0);
        setAllSections(withQuestions);
        if (withQuestions.length > 0) setSelectedSectionId(withQuestions[0].id);
        setLoading(false);
      })
      .catch(() => setLoading(false));
  }, []);

  const selectedSection = allSections.find((s) => s.id === selectedSectionId) ?? null;
  const maxCount = selectedSection ? selectedSection.questions.length : 5;
  const clampedCount = Math.min(Math.max(questionCount, 5), maxCount);

  function handleSectionChange(id: number) {
    setSelectedSectionId(id);
    const sec = allSections.find((s) => s.id === id);
    const max = sec ? sec.questions.length : 5;
    setQuestionCount(Math.min(questionCount, max));
  }

  function startDrill() {
    if (!selectedSection) return;
    const shuffled = [...selectedSection.questions].sort(() => Math.random() - 0.5);
    const drawn = shuffled.slice(0, clampedCount);
    drawn.sort((a, b) => a.position - b.position);
    setDrillQuestions(drawn);
    setAnswers({});
    setCurrent(0);
    setView('drill');
  }

  function handleAnswer(choiceId: number) {
    const q = drillQuestions[current];
    if (!q) return;
    setAnswers((prev) => ({ ...prev, [q.id]: choiceId }));
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
    setCurrent(0);
    setView('setup');
    setDrillQuestions([]);
  }

  const total = drillQuestions.length;
  const answeredCount = Object.keys(answers).length;
  const currentQuestion = drillQuestions[current];
  const currentChoiceId = currentQuestion ? answers[currentQuestion.id] : undefined;
  const isFirst = current === 0;
  const isLast = current === total - 1;

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
            <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM 9 OJK</span>
            {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Section Drill</span>}
          </div>
          <button onClick={() => router.push('/')} style={{ ...btnOutline, color: '#1d4ed8', borderColor: '#1d4ed8' }}>Home</button>
        </div>

        <div style={{ flex: 1, display: 'flex', alignItems: 'center', justifyContent: 'center', padding: isMobile ? '40px 20px' : '60px 32px' }}>
          <div style={{ width: '100%', maxWidth: 480 }}>
            <div style={{ fontSize: isMobile ? 22 : 28, fontWeight: 800, marginBottom: 8 }}>Section Drill</div>
            <div style={{ fontSize: 14, color: '#605d5d', marginBottom: 36, lineHeight: 1.6 }}>
              Pick a section and how many questions to practice. All questions are shown one by one.
            </div>

            {/* Section selector */}
            <div style={{ marginBottom: 24 }}>
              <div style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#7d7979', marginBottom: 8 }}>Section</div>
              <select
                value={selectedSectionId ?? ''}
                onChange={(e) => handleSectionChange(Number(e.target.value))}
                style={{ width: '100%', padding: '10px 12px', fontSize: 14, fontWeight: 600, border: '1.5px solid rgba(32,30,29,0.4)', background: '#fff', color: '#201e1d', fontFamily: 'inherit', borderRadius: 0, appearance: 'none', cursor: 'pointer', outline: 'none' }}
              >
                {allSections.map((s) => (
                  <option key={s.id} value={s.id}>
                    {s.title} ({s.questions.length} questions)
                  </option>
                ))}
              </select>
            </div>

            {/* Question count */}
            <div style={{ marginBottom: 36 }}>
              <div style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#7d7979', marginBottom: 8 }}>
                Number of questions — <span style={{ color: '#2F6FED' }}>{clampedCount}</span>
              </div>
              <input
                type="range"
                min={5}
                max={maxCount}
                value={clampedCount}
                onChange={(e) => setQuestionCount(Number(e.target.value))}
                style={{ width: '100%', accentColor: '#2F6FED', cursor: 'pointer' }}
              />
              <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: 4 }}>
                <span style={{ fontSize: 12, color: '#7d7979' }}>5</span>
                <span style={{ fontSize: 12, color: '#7d7979' }}>{maxCount}</span>
              </div>
            </div>

            <button
              onClick={startDrill}
              disabled={!selectedSection}
              style={{ ...btnPrimary, width: '100%', padding: '12px 16px', fontSize: 14, opacity: selectedSection ? 1 : 0.5, cursor: selectedSection ? 'pointer' : 'not-allowed' }}
            >
              Start Drill — {clampedCount} questions
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
        <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
          <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
            <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM 9 OJK</span>
            {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Drill Results</span>}
          </div>
          <div style={{ display: 'flex', gap: 8 }}>
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
        </div>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(5,1fr)', gap: 8 }}>
          {drillQuestions.map((q, idx) => {
            const isAnswered = !!answers[q.id];
            const isCurrent = idx === current;
            let tileBg = '#f8f4f4', tileColor = '#444141', tileBorder = '1px solid rgba(32,30,29,0.4)';
            if (isAnswered) { tileBg = '#15803d'; tileColor = '#fff'; tileBorder = '1px solid transparent'; }
            if (isCurrent) { tileBorder = '2px solid #2F6FED'; }
            return (
              <div key={q.id} onClick={() => goTo(idx)} style={{ width: 40, height: 40, display: 'flex', alignItems: 'center', justifyContent: 'center', background: tileBg, color: tileColor, border: tileBorder, cursor: 'pointer', fontSize: 13, fontWeight: 600 }}>
                {idx + 1}
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
          <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM 9 OJK</span>
          {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Section Drill</span>}
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
            <button onClick={handleSubmit} style={btnOutline}>Submit</button>
          )}
        </div>
      </div>

      {/* Mobile sidebar overlay */}
      {isMobile && sidebarOpen && (
        <div style={{ position: 'fixed', inset: 0, zIndex: 200 }}>
          <div onClick={() => setSidebarOpen(false)} style={{ position: 'absolute', inset: 0, background: 'rgba(32,30,29,0.4)' }} />
          <div style={{ position: 'absolute', top: 0, left: 0, bottom: 0, width: '85%', maxWidth: 320, background: '#f3f2f2', overflowY: 'auto', padding: '20px 18px', borderRight: '2px solid rgba(32,30,29,0.4)' }}>
            <SidebarGrid onClose={() => setSidebarOpen(false)} />
            <div style={{ marginTop: 28, paddingTop: 20, borderTop: '2px solid rgba(32,30,29,0.4)' }}>
              <button onClick={() => { setSidebarOpen(false); handleSubmit(); }} style={{ ...btnPrimary, width: '100%', textAlign: 'center' }}>
                Submit Drill
              </button>
            </div>
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

                  <div style={{ marginBottom: 14 }}>
                    <span style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#1d4ed8' }}>
                      Question {current + 1} of {total}
                    </span>
                  </div>

                  <div style={{ fontSize: isMobile ? 18 : 25, fontWeight: 800, lineHeight: 1.4, marginBottom: 24 }}>
                    {currentQuestion.text}
                  </div>

                  <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
                    {currentQuestion.choices.map((choice) => {
                      const isSelected = currentChoiceId === choice.id;
                      const isHovered = hoveredOption === choice.id && !isSelected;
                      return (
                        <div
                          key={choice.id}
                          onClick={() => handleAnswer(choice.id)}
                          onMouseEnter={() => setHoveredOption(choice.id)}
                          onMouseLeave={() => setHoveredOption(null)}
                          style={{ display: 'flex', alignItems: 'center', gap: 14, padding: isMobile ? '12px 14px' : '16px 18px', cursor: 'pointer', border: isSelected ? '1px solid #2F6FED' : '1px solid transparent', background: isSelected ? '#eaf1fd' : isHovered ? '#eae7e7' : 'transparent' }}
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
                  <button onClick={() => !isFirst && goTo(current - 1)} disabled={isFirst} style={{ ...btnOutline, opacity: isFirst ? 0.45 : 1, cursor: isFirst ? 'not-allowed' : 'pointer' }}>
                    Previous
                  </button>
                  <button onClick={() => { if (!isLast) goTo(current + 1); else handleSubmit(); }} style={btnPrimary}>
                    {isLast ? 'Submit' : 'Next'}
                  </button>
                </div>
              </>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
