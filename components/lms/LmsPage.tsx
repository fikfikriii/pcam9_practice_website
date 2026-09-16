'use client';

import { useState, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import { LMS_QUESTIONS, type LmsQuestion } from '@/lib/lms-questions';
import { useMobile } from '@/lib/useMobile';

const LS_KEY = 'pcam9-ojk-lms-v1';
type View = 'quiz' | 'review' | 'submitted';

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

const SOURCE_STYLE: Record<string, { color: string; bg: string; label: string }> = {
  lms: { color: '#b45309', bg: '#fffbeb', label: 'OJK LMS' },
  pdf: { color: '#b45309', bg: '#fffbeb', label: 'OJK LMS' },
};

function loadSaved(): { answers: Record<number, string>; flagged: Record<number, boolean>; current: number } {
  try {
    const raw = localStorage.getItem(LS_KEY);
    if (raw) return JSON.parse(raw);
  } catch { /* ignore */ }
  return { answers: {}, flagged: {}, current: 0 };
}

function SidebarContent({
  questions, answers, flagged, current, onGoTo, onClose,
}: {
  questions: LmsQuestion[];
  answers: Record<number, string>;
  flagged: Record<number, boolean>;
  current: number;
  onGoTo: (idx: number) => void;
  onClose?: () => void;
}) {
  function renderGroup(label: string, qs: LmsQuestion[]) {
    return (
      <div style={{ marginBottom: 20 }}>
        <div style={{ fontSize: 11, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#7d7979', marginBottom: 10 }}>{label}</div>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(5,1fr)', gap: 8 }}>
          {qs.map((q) => {
            const idx = questions.indexOf(q);
            const isAnswered = !!answers[q.id];
            const isCurrent = idx === current;
            const isFlagged = !!flagged[q.id];
            let bg = '#f8f4f4', color = '#444141', border = '1px solid rgba(32,30,29,0.4)';
            if (isAnswered) { bg = '#15803d'; color = '#fff'; border = '1px solid transparent'; }
            if (isCurrent) { border = '2px solid #2F6FED'; }
            return (
              <div key={q.id} onClick={() => onGoTo(idx)} style={{ width: 40, height: 40, display: 'flex', alignItems: 'center', justifyContent: 'center', background: bg, color, border, cursor: 'pointer', position: 'relative', fontSize: 12, fontWeight: 600 }}>
                {idx + 1}
                {isFlagged && <span style={{ position: 'absolute', top: -5, right: -5, width: 10, height: 10, background: '#d97706', borderRadius: '50%', border: '1.5px solid #f3f2f2' }} />}
              </div>
            );
          })}
        </div>
      </div>
    );
  }

  return (
    <>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 14 }}>
        <div style={{ fontSize: 16, fontWeight: 800 }}>Question List</div>
        {onClose && <button onClick={onClose} style={{ background: 'transparent', border: 'none', fontSize: 20, cursor: 'pointer', color: '#201e1d', lineHeight: 1, padding: '0 4px' }}>✕</button>}
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
        <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
          <div style={{ width: 13, height: 13, background: '#f8f4f4', border: '1px solid rgba(32,30,29,0.4)', flexShrink: 0, position: 'relative' }}>
            <span style={{ position: 'absolute', top: -4, right: -4, width: 7, height: 7, background: '#d97706', borderRadius: '50%', border: '1px solid #f3f2f2', display: 'block' }} />
          </div>
          <span style={{ fontSize: 11.5, color: '#605d5d' }}>Flagged</span>
        </div>
      </div>

      {renderGroup('OJK LMS', questions)}
    </>
  );
}

export default function LmsPage() {
  const router = useRouter();
  const isMobile = useMobile();
  const px = isMobile ? 16 : 32;

  const saved = typeof window !== 'undefined' ? loadSaved() : { answers: {}, flagged: {}, current: 0 };
  const [view, setView] = useState<View>('quiz');
  const [current, setCurrent] = useState(saved.current);
  const [answers, setAnswers] = useState<Record<number, string>>(saved.answers);
  const [flagged, setFlagged] = useState<Record<number, boolean>>(saved.flagged);
  const [hoveredOption, setHoveredOption] = useState<string | null>(null);
  const [sidebarOpen, setSidebarOpen] = useState(false);

  const questions = LMS_QUESTIONS;
  const total = questions.length;
  const answeredCount = Object.keys(answers).length;
  const unansweredCount = total - answeredCount;
  const progressPercent = total > 0 ? (answeredCount / total) * 100 : 0;
  const currentQ = questions[current];

  const persist = useCallback((a: Record<number, string>, f: Record<number, boolean>, c: number) => {
    try { localStorage.setItem(LS_KEY, JSON.stringify({ answers: a, flagged: f, current: c })); } catch { /* ignore */ }
  }, []);

  function handleAnswer(label: string) {
    const newAnswers = { ...answers, [currentQ.id]: label };
    setAnswers(newAnswers);
    persist(newAnswers, flagged, current);
  }

  function handleFlag() {
    const newFlagged = { ...flagged, [currentQ.id]: !flagged[currentQ.id] };
    setFlagged(newFlagged);
    persist(answers, newFlagged, current);
  }

  function goTo(idx: number) {
    setCurrent(idx);
    setSidebarOpen(false);
    persist(answers, flagged, idx);
  }

  function handleRestart() {
    setAnswers({}); setFlagged({}); setCurrent(0); setView('quiz');
    persist({}, {}, 0);
  }

  function handleGoHome() {
    try { localStorage.removeItem(LS_KEY); } catch { /* ignore */ }
    router.push('/');
  }

  const scoreCorrect = questions.filter((q) => answers[q.id] === q.correctLabel).length;
  const scorePercent = total > 0 ? Math.round((scoreCorrect / total) * 100) : 0;
  const isFirst = current === 0;
  const isLast = current === total - 1;
  const isCurrentFlagged = currentQ ? !!flagged[currentQ.id] : false;

  // ── SUBMITTED ────────────────────────────────────────────────────
  if (view === 'submitted') {
    return (
      <div style={{ display: 'flex', flexDirection: 'column', height: '100vh', background: '#f3f2f2', overflow: 'hidden' }}>
        <MemePopup score={scorePercent} />
        <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
          <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
            <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM9 MLE OJK</span>
            {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Kuis Aktual — Results</span>}
          </div>
          <div style={{ display: 'flex', gap: 10 }}>
            <button onClick={handleRestart} style={btnOutline}>Restart</button>
            <button onClick={handleGoHome} style={{ ...btnOutline, color: '#1d4ed8', borderColor: '#1d4ed8' }}>Home</button>
          </div>
        </div>

        <div style={{ flex: 1, overflowY: 'auto', display: 'flex', justifyContent: 'center', padding: isMobile ? '28px 16px 48px' : '44px 32px 60px' }}>
          <div style={{ maxWidth: 760, width: '100%' }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: 20, marginBottom: 16, flexWrap: 'wrap' }}>
              <span style={{ fontSize: isMobile ? 48 : 64, fontWeight: 800, lineHeight: 1 }}>{scorePercent}%</span>
              <span style={{ fontSize: 15, color: '#605d5d' }}>{scoreCorrect} of {total} correct</span>
            </div>
            <div style={{ height: 4, width: '100%', background: '#2F6FED', marginBottom: 28 }} />

            {questions.map((q, idx) => {
              const userAnswer = answers[q.id];
              const isCorrect = userAnswer === q.correctLabel;
              const notAnswered = !userAnswer;
              const correctOption = q.options.find((o) => o.label === q.correctLabel);
              const userOption = q.options.find((o) => o.label === userAnswer);

              let tagStyle: React.CSSProperties;
              let tagText: string;
              if (notAnswered) { tagStyle = { background: 'transparent', color: '#605d5d', border: '1px solid rgba(32,30,29,0.4)' }; tagText = 'Not answered'; }
              else if (isCorrect) { tagStyle = { background: '#eafaf1', color: '#15803d', border: '1px solid #15803d' }; tagText = 'Correct'; }
              else { tagStyle = { background: '#fef2f2', color: '#b91c1c', border: '1px solid #b91c1c' }; tagText = 'Incorrect'; }

              const src = SOURCE_STYLE[q.source] ?? SOURCE_STYLE.lms;

              return (
                <div key={q.id} style={{ padding: '14px 0', borderBottom: '1px solid rgba(32,30,29,0.15)', display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', gap: 12 }}>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 4 }}>
                      <span style={{ fontSize: 11.5, color: '#7d7979' }}>#{idx + 1}</span>
                      <span style={{ fontSize: 10, fontWeight: 700, letterSpacing: '0.05em', textTransform: 'uppercase', padding: '2px 7px', border: `1px solid ${src.color}`, color: src.color, background: src.bg }}>{src.label}</span>
                    </div>
                    <div style={{ fontSize: isMobile ? 13.5 : 15, fontWeight: 600, marginBottom: 5, lineHeight: 1.4 }}>{q.text}</div>
                    <div style={{ fontSize: 13, color: '#444141' }}>Your answer: {userOption ? `${userOption.label} ${userOption.text}` : '—'}</div>
                    {!isCorrect && correctOption && (
                      <div style={{ fontSize: 13, color: '#15803d', marginTop: 2 }}>Correct answer: {correctOption.label} {correctOption.text}</div>
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

  // ── REVIEW ───────────────────────────────────────────────────────
  if (view === 'review') {
    return (
      <div style={{ display: 'flex', flexDirection: 'column', height: '100vh', background: '#f3f2f2', overflow: 'hidden' }}>
        <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
          <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
            <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM9 MLE OJK</span>
            {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Kuis Aktual — Review</span>}
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

            <div style={{ marginTop: 28 }}>
              <div style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#7d7979', marginBottom: 10 }}>All Questions</div>
              <div style={{ display: 'grid', gridTemplateColumns: 'repeat(5,1fr)', gap: 8 }}>
                {questions.map((q, idx) => {
                  const isAnswered = !!answers[q.id];
                  const isCurrent = idx === current;
                  const isFlagged = !!flagged[q.id];
                  let bg = '#f8f4f4', color = '#444141', border = '1px solid rgba(32,30,29,0.4)';
                  if (isAnswered) { bg = '#15803d'; color = '#fff'; border = '1px solid transparent'; }
                  if (isCurrent) { border = '2px solid #2F6FED'; }
                  return (
                    <div key={q.id} onClick={() => { goTo(idx); setView('quiz'); }} style={{ width: 46, height: 46, display: 'flex', alignItems: 'center', justifyContent: 'center', background: bg, color, border, cursor: 'pointer', position: 'relative', fontSize: 13, fontWeight: 600 }}>
                      {idx + 1}
                      {isFlagged && <span style={{ position: 'absolute', top: -5, right: -5, width: 10, height: 10, background: '#d97706', borderRadius: '50%', border: '1.5px solid #f3f2f2' }} />}
                    </div>
                  );
                })}
              </div>
            </div>
          </div>
        </div>

        <div style={{ position: 'sticky', bottom: 0, borderTop: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2', padding: `16px ${px}px`, display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexShrink: 0 }}>
          <button onClick={() => setView('quiz')} style={btnOutline}>Back to Questions</button>
          <button onClick={() => setView('submitted')} style={btnPrimary}>Submit Quiz</button>
        </div>
      </div>
    );
  }

  // ── QUIZ ─────────────────────────────────────────────────────────
  const src = currentQ ? (SOURCE_STYLE[currentQ.source] ?? SOURCE_STYLE.lms) : SOURCE_STYLE.lms;

  return (
    <div style={{ display: 'flex', flexDirection: 'column', height: '100vh', background: '#f3f2f2', overflow: 'hidden' }}>
      {/* Header */}
      <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2', gap: 12 }}>
        <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
          <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM9 MLE OJK</span>
          {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Kuis Aktual</span>}
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
            <button onClick={() => setView('review')} style={btnOutline}>Review &amp; Submit</button>
          )}
        </div>
      </div>

      {/* Mobile sidebar overlay */}
      {isMobile && sidebarOpen && (
        <div style={{ position: 'fixed', inset: 0, zIndex: 200 }}>
          <div onClick={() => setSidebarOpen(false)} style={{ position: 'absolute', inset: 0, background: 'rgba(32,30,29,0.4)' }} />
          <div style={{ position: 'absolute', top: 0, left: 0, bottom: 0, width: '85%', maxWidth: 320, background: '#f3f2f2', overflowY: 'auto', padding: '20px 18px', borderRight: '2px solid rgba(32,30,29,0.4)' }}>
            <SidebarContent questions={questions} answers={answers} flagged={flagged} current={current} onGoTo={goTo} onClose={() => setSidebarOpen(false)} />
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
            <SidebarContent questions={questions} answers={answers} flagged={flagged} current={current} onGoTo={goTo} />
          </div>
        )}

        {/* Main pane */}
        <div style={{ flex: 1, overflowY: 'auto', minHeight: 0, display: 'flex', justifyContent: 'center', padding: isMobile ? '24px 16px' : '44px 32px' }}>
          <div style={{ maxWidth: 660, width: '100%' }}>
            {currentQ && (
              <>
                <div style={{ background: '#eae9e9', padding: isMobile ? '24px 20px' : '40px 44px' }}>
                  <div style={{ height: 4, width: 64, background: '#2F6FED', marginBottom: 18 }} />

                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', gap: 12, marginBottom: 14, flexWrap: 'wrap' }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: 8, flexWrap: 'wrap' }}>
                      <span style={{ fontSize: 12, fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#1d4ed8' }}>
                        Question {current + 1} of {total}
                      </span>
                      <span style={{ fontSize: 10, fontWeight: 700, letterSpacing: '0.05em', textTransform: 'uppercase', padding: '2px 7px', border: `1px solid ${src.color}`, color: src.color, background: src.bg }}>{src.label}</span>
                    </div>
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
                    {currentQ.text}
                  </div>

                  <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
                    {currentQ.options.map((opt) => {
                      const isSelected = answers[currentQ.id] === opt.label;
                      const isHovered = hoveredOption === opt.label && !isSelected;
                      return (
                        <div key={opt.label} onClick={() => handleAnswer(opt.label)} onMouseEnter={() => setHoveredOption(opt.label)} onMouseLeave={() => setHoveredOption(null)}
                          style={{ display: 'flex', alignItems: 'center', gap: 14, padding: isMobile ? '12px 14px' : '16px 18px', cursor: 'pointer', border: isSelected ? '1px solid #2F6FED' : '1px solid transparent', background: isSelected ? '#eaf1fd' : isHovered ? '#eae7e7' : 'transparent' }}
                        >
                          <div style={{ width: 16, height: 16, borderRadius: '50%', border: `1.5px solid ${isSelected ? '#2F6FED' : '#d7d3d3'}`, display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0 }}>
                            {isSelected && <div style={{ width: 8, height: 8, background: '#2F6FED', borderRadius: '50%', boxShadow: '0 0 0 2px #eaf1fd' }} />}
                          </div>
                          <span style={{ fontSize: isMobile ? 14.5 : 15.5, lineHeight: 1.4 }}><strong>{opt.label}</strong> {opt.text}</span>
                        </div>
                      );
                    })}
                  </div>
                </div>

                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginTop: 20 }}>
                  <button onClick={() => current > 0 && goTo(current - 1)} disabled={isFirst} style={{ ...btnOutline, opacity: isFirst ? 0.45 : 1, cursor: isFirst ? 'not-allowed' : 'pointer' }}>
                    Previous
                  </button>
                  <button onClick={() => { if (!isLast) goTo(current + 1); else setView('review'); }} style={btnPrimary}>
                    {isLast ? 'Review & Submit' : 'Next'}
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

function MemePopup({ score }: { score: number }) {
  const [visible, setVisible] = useState(true);
  if (!visible) return null;
  const isGood = score >= 70;
  const img = isGood ? '/meme_good.png' : '/meme_bad.png';
  const caption = isGood
    ? score >= 90 ? 'ezz game 😎' : 'siap jd pengawas 🫡'
    : score >= 50 ? 'faaaahhh 😩' : 'nilai apa ini dawg 💀';
  const btn = isGood ? 'Ik fr 😌' : 'Noted bestie 😭';
  return (
    <div style={{ position: 'fixed', inset: 0, zIndex: 999, display: 'flex', alignItems: 'center', justifyContent: 'center', background: 'rgba(0,0,0,0.65)' }}>
      <div style={{ background: '#fff', maxWidth: 400, width: '90%', padding: '24px 24px 20px', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
        <img src={img} alt="meme" style={{ width: '100%', display: 'block' }} />
        <div style={{ marginTop: 14, fontSize: 14, fontWeight: 700, textAlign: 'center', lineHeight: 1.5, color: '#201e1d' }}>{caption}</div>
        <button onClick={() => setVisible(false)} style={{ marginTop: 14, background: '#201e1d', color: '#fff', border: 'none', padding: '9px 28px', fontSize: 13, fontWeight: 700, cursor: 'pointer', fontFamily: 'inherit', letterSpacing: '0.03em' }}>
          {btn}
        </button>
      </div>
    </div>
  );
}
