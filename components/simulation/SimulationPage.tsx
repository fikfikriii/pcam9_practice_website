'use client';

import { useState, useEffect, useMemo } from 'react';
import { useMobile } from '@/lib/useMobile';

// ─── Types ───────────────────────────────────────────────────────────────────

interface Choice {
  id: number;
  text: string;
  position: number;
  is_correct: boolean;
}

interface SimQuestion {
  id: number;
  section_id: number;
  section_title: string;
  text: string;
  position: number;
  source: 'original' | 'additional' | 'references';
  choices: Choice[];
}

interface SimPartSummary {
  id: number;
  part_number: number;
  title: string;
  question_count: number;
  section_titles: string[];
}

interface SimPartFull extends SimPartSummary {
  questions: SimQuestion[];
}

interface SimConfigSummary {
  id: number;
  title: string;
  description: string;
  is_active: boolean;
  parts: SimPartSummary[];
}

interface SimConfigFull {
  id: number;
  title: string;
  description: string;
  is_active: boolean;
  parts: SimPartFull[];
}

interface SimSession {
  configId: number;
  drawnQuestionIds: number[][];
  answers: Record<number, number>;
  flagged: Record<number, boolean>;
  submittedParts: boolean[];
}

type SimView = 'loading' | 'select' | 'overview' | 'exam' | 'part-results' | 'final-results';

// ─── Session helpers ─────────────────────────────────────────────────────────

function sessionKey(configId: number) { return `pcam9-ojk-simulation-${configId}-v1`; }

function saveSession(s: SimSession) {
  try { localStorage.setItem(sessionKey(s.configId), JSON.stringify(s)); } catch {}
}

function loadSession(configId: number): SimSession | null {
  try {
    const raw = localStorage.getItem(sessionKey(configId));
    return raw ? (JSON.parse(raw) as SimSession) : null;
  } catch { return null; }
}

function clearSession(configId: number) {
  try { localStorage.removeItem(sessionKey(configId)); } catch {}
}

function drawFrom(questions: SimQuestion[], count: number): number[] {
  const shuffled = [...questions].sort(() => Math.random() - 0.5);
  return shuffled.slice(0, Math.min(count, questions.length)).map(q => q.id);
}

// ─── Source badge ─────────────────────────────────────────────────────────────

const SOURCE_MAP = {
  original:   { label: 'Original',   bg: '#dcfce7', color: '#15803d', border: '#86efac' },
  additional: { label: 'Additional', bg: '#dbeafe', color: '#1d4ed8', border: '#93c5fd' },
  references: { label: 'References', bg: '#ede9fe', color: '#6d28d9', border: '#c4b5fd' },
};

function SimSourceBadge({ source }: { source: 'original' | 'additional' | 'references' }) {
  const s = SOURCE_MAP[source] ?? SOURCE_MAP.original;
  return (
    <span style={{
      display: 'inline-block', padding: '1px 7px', fontSize: 10, fontWeight: 700,
      letterSpacing: '0.05em', textTransform: 'uppercase',
      background: s.bg, color: s.color, border: `1px solid ${s.border}`, borderRadius: 0,
    }}>
      {s.label}
    </span>
  );
}

// ─── Main component ───────────────────────────────────────────────────────────

export default function SimulationPage() {
  const isMobile = useMobile();
  const px = isMobile ? 20 : 32;

  const [configs, setConfigs] = useState<SimConfigSummary[]>([]);
  const [selectedConfigId, setSelectedConfigId] = useState<number | null>(null);
  const [fullConfig, setFullConfig] = useState<SimConfigFull | null>(null);
  const [session, setSession] = useState<SimSession | null>(null);
  const [existingSession, setExistingSession] = useState<SimSession | null>(null);
  const [view, setView] = useState<SimView>('loading');
  const [currentPartIndex, setCurrentPartIndex] = useState(0);
  const [currentQ, setCurrentQ] = useState(0);
  const [confirmingSubmit, setConfirmingSubmit] = useState(false);
  const [sidebarOpen, setSidebarOpen] = useState(false);
  const [hoveredOption, setHoveredOption] = useState<number | null>(null);

  // Fetch config list
  useEffect(() => {
    fetch('/api/simulation')
      .then(r => r.json())
      .then((data: SimConfigSummary[]) => {
        if (!data || data.length === 0) { setView('select'); return; }
        setConfigs(data);
        if (data.length === 1) {
          setSelectedConfigId(data[0].id);
          const saved = loadSession(data[0].id);
          if (saved) setExistingSession(saved);
          setView('overview');
        } else {
          setView('select');
        }
      })
      .catch(() => setView('select'));
  }, []);

  // Fetch full config when selected
  useEffect(() => {
    if (!selectedConfigId) return;
    fetch(`/api/simulation/${selectedConfigId}`)
      .then(r => r.json())
      .then((data: SimConfigFull) => setFullConfig(data))
      .catch(() => {});
  }, [selectedConfigId]);

  // Derived: drawn questions per part
  const drawnQuestions = useMemo((): SimQuestion[][] => {
    if (!fullConfig || !session) return [];
    return session.drawnQuestionIds.map((ids, partIdx) => {
      const part = fullConfig.parts[partIdx];
      if (!part) return [];
      const qMap = new Map(part.questions.map(q => [q.id, q]));
      return ids.map(id => qMap.get(id)!).filter(Boolean).sort((a, b) => a.position - b.position);
    });
  }, [fullConfig, session]);

  const currentPartQuestions = drawnQuestions[currentPartIndex] ?? [];
  const currentQuestion = currentPartQuestions[currentQ] ?? null;
  const isPartSubmitted = session?.submittedParts[currentPartIndex] ?? false;

  function startExam(resume?: SimSession) {
    if (!fullConfig) return;
    let sess: SimSession;
    if (resume) {
      sess = resume;
    } else {
      const drawnIds = fullConfig.parts.map(p => drawFrom(p.questions, p.question_count));
      sess = {
        configId: fullConfig.id,
        drawnQuestionIds: drawnIds,
        answers: {},
        flagged: {},
        submittedParts: fullConfig.parts.map(() => false),
      };
    }
    setSession(sess);
    saveSession(sess);
    const firstIncomplete = sess.submittedParts.findIndex(s => !s);
    if (firstIncomplete === -1) {
      setView('final-results');
    } else {
      setCurrentPartIndex(firstIncomplete);
      setCurrentQ(0);
      setConfirmingSubmit(false);
      setSidebarOpen(false);
      setView('exam');
    }
  }

  function handleAnswer(questionId: number, choiceId: number) {
    if (!session || isPartSubmitted) return;
    const next = { ...session, answers: { ...session.answers, [questionId]: choiceId } };
    setSession(next);
    saveSession(next);
  }

  function handleFlag(questionId: number) {
    if (!session) return;
    const next = { ...session, flagged: { ...session.flagged, [questionId]: !session.flagged[questionId] } };
    setSession(next);
    saveSession(next);
  }

  function handleSubmitPart() {
    if (!session || !fullConfig) return;
    const unanswered = currentPartQuestions.filter(q => !session.answers[q.id]).length;
    if (unanswered > 0 && !confirmingSubmit) { setConfirmingSubmit(true); return; }
    const newSubmitted = [...session.submittedParts];
    newSubmitted[currentPartIndex] = true;
    const next = { ...session, submittedParts: newSubmitted };
    setSession(next);
    saveSession(next);
    setConfirmingSubmit(false);
    if (currentPartIndex === fullConfig.parts.length - 1) {
      setView('final-results');
    } else {
      setView('part-results');
    }
  }

  function handleContinue() {
    const nextPart = currentPartIndex + 1;
    setCurrentPartIndex(nextPart);
    setCurrentQ(0);
    setConfirmingSubmit(false);
    setSidebarOpen(false);
    setView('exam');
  }

  function handleRestart() {
    if (!fullConfig) return;
    clearSession(fullConfig.id);
    setSession(null);
    setExistingSession(null);
    setConfirmingSubmit(false);
    setView('overview');
  }

  function calcScore(partIdx: number) {
    if (!session) return { correct: 0, total: 0 };
    const qs = drawnQuestions[partIdx] ?? [];
    let correct = 0;
    for (const q of qs) {
      const picked = session.answers[q.id];
      if (picked && q.choices.find(c => c.id === picked && c.is_correct)) correct++;
    }
    return { correct, total: qs.length };
  }

  // ─── Header ────────────────────────────────────────────────────────────────

  const header = (subtitle?: string) => (
    <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
      <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
        <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM 9 OJK</span>
        {!isMobile && subtitle && <span style={{ fontSize: 13, color: '#605d5d' }}>{subtitle}</span>}
      </div>
      {isMobile && subtitle && <span style={{ fontSize: 12, color: '#605d5d' }}>{subtitle}</span>}
    </div>
  );

  // ─── Loading ────────────────────────────────────────────────────────────────

  if (view === 'loading') {
    return (
      <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2' }}>
        {header()}
        <div style={{ flex: 1, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
          <span style={{ fontSize: 14, color: '#7d7979' }}>Loading simulation...</span>
        </div>
      </div>
    );
  }

  // ─── Select (multiple configs) ──────────────────────────────────────────────

  if (view === 'select' && configs.length > 1) {
    return (
      <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2' }}>
        {header('Exam Simulation')}
        <div style={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', padding: isMobile ? '40px 20px' : '60px 32px' }}>
          <div style={{ width: '100%', maxWidth: 600 }}>
            <div style={{ fontSize: 20, fontWeight: 800, marginBottom: 8 }}>Choose Simulation</div>
            <div style={{ fontSize: 14, color: '#605d5d', marginBottom: 32 }}>Select an exam simulation to begin.</div>
            <div style={{ display: 'flex', flexDirection: 'column', gap: 12 }}>
              {configs.map(cfg => (
                <button key={cfg.id} onClick={() => { setSelectedConfigId(cfg.id); const saved = loadSession(cfg.id); if (saved) setExistingSession(saved); setView('overview'); }}
                  style={{ background: '#fff', border: '2px solid rgba(32,30,29,0.4)', padding: '20px 24px', textAlign: 'left', cursor: 'pointer', width: '100%' }}>
                  <div style={{ fontSize: 16, fontWeight: 700, marginBottom: 6 }}>{cfg.title}</div>
                  <div style={{ fontSize: 13, color: '#605d5d', marginBottom: 12 }}>{cfg.description}</div>
                  <div style={{ display: 'flex', gap: 16, flexWrap: 'wrap' }}>
                    {cfg.parts.map(p => (
                      <span key={p.id} style={{ fontSize: 12, color: '#7d7979' }}>
                        Part {p.part_number}: {p.question_count}q
                      </span>
                    ))}
                  </div>
                </button>
              ))}
            </div>
          </div>
        </div>
      </div>
    );
  }

  // ─── Overview ───────────────────────────────────────────────────────────────

  if (view === 'overview') {
    const cfg = configs[0];
    const totalQ = cfg?.parts.reduce((s, p) => s + p.question_count, 0) ?? 0;
    return (
      <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2' }}>
        {header('Exam Simulation')}
        <div style={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', padding: isMobile ? '40px 20px' : '60px 32px' }}>
          <div style={{ width: '100%', maxWidth: 640 }}>

            {/* Title */}
            <div style={{ fontSize: isMobile ? 22 : 26, fontWeight: 800, marginBottom: 8 }}>{cfg?.title ?? 'Exam Simulation'}</div>
            <div style={{ fontSize: 14, color: '#605d5d', lineHeight: 1.6, marginBottom: 32 }}>{cfg?.description}</div>

            {/* Parts overview */}
            <div style={{ marginBottom: 32 }}>
              <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: '0.08em', textTransform: 'uppercase', color: '#7d7979', marginBottom: 12 }}>Exam Structure</div>
              <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
                {cfg?.parts.map((p, i) => (
                  <div key={p.id} style={{ background: '#fff', border: '2px solid rgba(32,30,29,0.4)', padding: '14px 20px', display: 'flex', alignItems: 'center', gap: 16 }}>
                    <div style={{ width: 32, height: 32, background: '#f3f2f2', border: '2px solid rgba(32,30,29,0.25)', display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0 }}>
                      <span style={{ fontSize: 13, fontWeight: 800 }}>{i + 1}</span>
                    </div>
                    <div style={{ flex: 1 }}>
                      <div style={{ fontSize: 14, fontWeight: 700, marginBottom: 2 }}>{p.title}</div>
                      <div style={{ fontSize: 12, color: '#7d7979' }}>{p.section_titles.join(' · ')} · {p.question_count} questions</div>
                    </div>
                    {i > 0 && (
                      <span style={{ fontSize: 11, color: '#7d7979', fontWeight: 600 }}>LOCKED UNTIL PART {i}</span>
                    )}
                  </div>
                ))}
              </div>
            </div>

            {/* Total */}
            <div style={{ padding: '12px 20px', background: '#eae9e9', marginBottom: 32, display: 'flex', gap: 24 }}>
              <span style={{ fontSize: 13, color: '#605d5d' }}><strong>{cfg?.parts.length ?? 0} parts</strong></span>
              <span style={{ fontSize: 13, color: '#605d5d' }}><strong>{totalQ} questions total</strong></span>
            </div>

            {/* Existing session warning */}
            {existingSession && !existingSession.submittedParts.every(Boolean) && (
              <div style={{ marginBottom: 20, padding: '14px 20px', background: '#fffbeb', border: '2px solid #d97706' }}>
                <div style={{ fontSize: 13, fontWeight: 700, color: '#92400e', marginBottom: 8 }}>Unfinished session found</div>
                <div style={{ fontSize: 13, color: '#92400e', marginBottom: 12 }}>
                  You have a session in progress (Part {(existingSession.submittedParts.findIndex(s => !s) + 1)} in progress). Resume or start fresh.
                </div>
                <div style={{ display: 'flex', gap: 10 }}>
                  <button onClick={() => { if (!fullConfig) return; setSession(existingSession); startExam(existingSession); }}
                    style={{ padding: '8px 20px', background: '#d97706', color: '#fff', border: 'none', cursor: 'pointer', fontWeight: 700, fontSize: 13 }}>
                    Resume
                  </button>
                  <button onClick={() => { if (!fullConfig) return; clearSession(fullConfig.id); setExistingSession(null); startExam(); }}
                    style={{ padding: '8px 20px', background: 'transparent', color: '#92400e', border: '2px solid #d97706', cursor: 'pointer', fontWeight: 700, fontSize: 13 }}>
                    Start Fresh
                  </button>
                </div>
              </div>
            )}

            {/* Start button (no session or completed) */}
            {(!existingSession || existingSession.submittedParts.every(Boolean)) && (
              <div style={{ display: 'flex', gap: 10 }}>
                <button onClick={() => { if (!fullConfig) return; startExam(); }}
                  disabled={!fullConfig}
                  style={{ padding: '12px 32px', background: fullConfig ? '#2F6FED' : '#c0c0c0', color: '#fff', border: 'none', cursor: fullConfig ? 'pointer' : 'default', fontWeight: 700, fontSize: 14 }}>
                  {fullConfig ? 'Start Exam' : 'Loading...'}
                </button>
                {existingSession?.submittedParts.every(Boolean) && (
                  <button onClick={() => { setSession(existingSession); setView('final-results'); }}
                    style={{ padding: '12px 24px', background: 'transparent', color: '#1d4ed8', border: '2px solid #2F6FED', cursor: 'pointer', fontWeight: 700, fontSize: 14 }}>
                    View Last Results
                  </button>
                )}
              </div>
            )}
          </div>
        </div>
      </div>
    );
  }

  // ─── Exam view ───────────────────────────────────────────────────────────────

  if (view === 'exam') {
    if (!session || !fullConfig || !currentQuestion) {
      return (
        <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2' }}>
          {header('Exam Simulation')}
          <div style={{ flex: 1, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
            <span style={{ fontSize: 14, color: '#7d7979' }}>Loading questions...</span>
          </div>
        </div>
      );
    }

    const partConfig = fullConfig.parts[currentPartIndex];
    const totalParts = fullConfig.parts.length;
    const answeredInPart = currentPartQuestions.filter(q => session.answers[q.id]).length;
    const unansweredCount = currentPartQuestions.length - answeredInPart;
    const selectedChoice = session.answers[currentQuestion.id] ?? null;
    const isFlagged = session.flagged[currentQuestion.id] ?? false;

    const sidebarContent = (
      <div style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
        {/* Part progress */}
        <div>
          <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: '0.06em', textTransform: 'uppercase', color: '#7d7979', marginBottom: 10 }}>
            {partConfig.title}
          </div>
          <div style={{ fontSize: 13, color: '#605d5d', marginBottom: 8 }}>
            {answeredInPart} / {currentPartQuestions.length} answered
          </div>
          {/* Legend */}
          <div style={{ display: 'flex', flexDirection: 'column', gap: 4, marginBottom: 10 }}>
            {[
              { color: '#eae9e9', border: 'rgba(32,30,29,0.25)', label: 'Unanswered' },
              { color: '#2F6FED', border: '#2F6FED', label: 'Answered', textColor: '#fff' },
              { color: '#fff', border: '#2F6FED', label: 'Current' },
              { color: '#fff', border: 'rgba(32,30,29,0.25)', label: 'Flagged ●', flagDot: true },
            ].map(item => (
              <div key={item.label} style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                <div style={{ width: 18, height: 18, background: item.color, border: `2px solid ${item.border}`, flexShrink: 0 }} />
                <span style={{ fontSize: 11, color: '#605d5d' }}>{item.label}</span>
              </div>
            ))}
          </div>
          {/* Grid */}
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(5, 1fr)', gap: 4 }}>
            {currentPartQuestions.map((q, i) => {
              const isActive = i === currentQ;
              const isAnswered = !!session.answers[q.id];
              const isQFlagged = session.flagged[q.id];
              return (
                <button key={q.id} onClick={() => { setCurrentQ(i); if (isMobile) setSidebarOpen(false); }}
                  style={{
                    position: 'relative', width: '100%', aspectRatio: '1', fontSize: 11, fontWeight: 700, cursor: 'pointer',
                    background: isActive ? '#fff' : isAnswered ? '#2F6FED' : '#eae9e9',
                    color: isActive ? '#201e1d' : isAnswered ? '#fff' : '#7d7979',
                    border: `2px solid ${isActive ? '#2F6FED' : isAnswered ? '#2F6FED' : 'rgba(32,30,29,0.25)'}`,
                  }}>
                  {i + 1}
                  {isQFlagged && (
                    <span style={{ position: 'absolute', top: 1, right: 1, width: 6, height: 6, background: '#d97706', borderRadius: '50%' }} />
                  )}
                </button>
              );
            })}
          </div>
        </div>

        {/* Submit Part button */}
        <div>
          {confirmingSubmit && (
            <div style={{ marginBottom: 10, padding: '10px 12px', background: '#fffbeb', border: '2px solid #d97706' }}>
              <div style={{ fontSize: 12, fontWeight: 700, color: '#92400e', marginBottom: 8 }}>
                {unansweredCount} question{unansweredCount !== 1 ? 's' : ''} unanswered. Submit anyway?
              </div>
              <div style={{ display: 'flex', gap: 8 }}>
                <button onClick={handleSubmitPart}
                  style={{ flex: 1, padding: '6px 0', background: '#d97706', color: '#fff', border: 'none', cursor: 'pointer', fontWeight: 700, fontSize: 12 }}>
                  Submit
                </button>
                <button onClick={() => setConfirmingSubmit(false)}
                  style={{ flex: 1, padding: '6px 0', background: 'transparent', color: '#92400e', border: '2px solid #d97706', cursor: 'pointer', fontWeight: 700, fontSize: 12 }}>
                  Cancel
                </button>
              </div>
            </div>
          )}
          <button onClick={handleSubmitPart}
            style={{ width: '100%', padding: '10px 0', background: '#2F6FED', color: '#fff', border: 'none', cursor: 'pointer', fontWeight: 700, fontSize: 13 }}>
            Submit Part {currentPartIndex + 1}
            {currentPartIndex < totalParts - 1 ? ` →` : ''}
          </button>
        </div>
      </div>
    );

    return (
      <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2' }}>
        {/* Header */}
        <div style={{ flexShrink: 0, background: '#f3f2f2', borderBottom: '2px solid rgba(32,30,29,0.4)' }}>
          <div style={{ height: 68, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: `0 ${px}px` }}>
            <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
              <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM 9 OJK</span>
              {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Exam Simulation</span>}
            </div>
            <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
              <span style={{ fontSize: 12, color: '#7d7979', fontWeight: 600 }}>Part {currentPartIndex + 1} of {totalParts}</span>
              {isMobile && (
                <button onClick={() => setSidebarOpen(o => !o)}
                  style={{ background: 'transparent', border: '2px solid rgba(32,30,29,0.4)', padding: '4px 10px', cursor: 'pointer', fontSize: 12, fontWeight: 700 }}>
                  {sidebarOpen ? 'Close' : 'Navigator'}
                </button>
              )}
            </div>
          </div>

          {/* Part tabs */}
          <div style={{ display: 'flex', borderTop: '1px solid rgba(32,30,29,0.15)', overflowX: 'auto' }}>
            {fullConfig.parts.map((p, i) => {
              const done = session.submittedParts[i];
              const current = i === currentPartIndex;
              const locked = !done && i > (session.submittedParts.findIndex(s => !s) === -1 ? fullConfig.parts.length - 1 : session.submittedParts.findIndex(s => !s));
              return (
                <div key={p.id} style={{
                  padding: `8px ${px}px`,
                  fontSize: 12, fontWeight: 700,
                  borderBottom: current ? '2px solid #2F6FED' : '2px solid transparent',
                  color: done ? '#15803d' : current ? '#2F6FED' : '#7d7979',
                  whiteSpace: 'nowrap', flexShrink: 0,
                }}>
                  {done ? '✓ ' : locked ? '🔒 ' : ''}{isMobile ? `P${i + 1}` : p.title}
                </div>
              );
            })}
          </div>
        </div>

        {/* Body */}
        <div style={{ flex: 1, display: 'flex', overflow: 'hidden' }}>
          {/* Question area */}
          <div style={{ flex: 1, overflowY: 'auto', padding: isMobile ? '24px 20px' : '32px 32px', display: 'flex', flexDirection: 'column', gap: 0 }}>
            {/* Mobile sidebar overlay */}
            {isMobile && sidebarOpen && (
              <div style={{ position: 'fixed', inset: 0, zIndex: 50, background: 'rgba(0,0,0,0.4)' }} onClick={() => setSidebarOpen(false)}>
                <div style={{ position: 'absolute', right: 0, top: 0, bottom: 0, width: 260, background: '#f3f2f2', padding: 20, overflowY: 'auto' }} onClick={e => e.stopPropagation()}>
                  {sidebarContent}
                </div>
              </div>
            )}

            {/* Question card */}
            <div style={{ maxWidth: 720, width: '100%' }}>
              {/* Question meta */}
              <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 6, flexWrap: 'wrap' }}>
                <span style={{ fontSize: 12, color: '#7d7979', fontWeight: 600 }}>
                  Question {currentQ + 1} of {currentPartQuestions.length}
                </span>
                <span style={{ fontSize: 12, color: '#7d7979' }}>·</span>
                <span style={{ fontSize: 12, color: '#7d7979' }}>{currentQuestion.section_title}</span>
                <SimSourceBadge source={currentQuestion.source} />
              </div>

              {/* Question card */}
              <div style={{ background: '#fff', border: '2px solid rgba(32,30,29,0.4)', padding: isMobile ? '20px 16px' : '28px 28px', marginBottom: 16 }}>
                <div style={{ fontSize: 15, lineHeight: 1.7, marginBottom: 24, color: '#201e1d', fontWeight: 600 }}>
                  {currentQuestion.text}
                </div>
                <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
                  {currentQuestion.choices.map((choice) => {
                    const isSelected = selectedChoice === choice.id;
                    const isHovered = hoveredOption === choice.id;
                    return (
                      <button key={choice.id}
                        onClick={() => handleAnswer(currentQuestion.id, choice.id)}
                        onMouseEnter={() => setHoveredOption(choice.id)}
                        onMouseLeave={() => setHoveredOption(null)}
                        style={{
                          display: 'flex', alignItems: 'flex-start', gap: 12, padding: '12px 14px',
                          background: isSelected ? '#2F6FED' : isHovered ? '#eae9e9' : '#f3f2f2',
                          border: `2px solid ${isSelected ? '#2F6FED' : 'rgba(32,30,29,0.25)'}`,
                          cursor: 'pointer', textAlign: 'left', width: '100%',
                        }}>
                        <div style={{
                          width: 16, height: 16, borderRadius: '50%', flexShrink: 0, marginTop: 2,
                          border: `2px solid ${isSelected ? '#fff' : 'rgba(32,30,29,0.4)'}`,
                          background: isSelected ? '#fff' : 'transparent',
                        }} />
                        <span style={{ fontSize: 14, lineHeight: 1.5, color: isSelected ? '#fff' : '#201e1d' }}>
                          {choice.text}
                        </span>
                      </button>
                    );
                  })}
                </div>
              </div>

              {/* Nav + Flag row */}
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', gap: 10 }}>
                <div style={{ display: 'flex', gap: 8 }}>
                  <button onClick={() => { setCurrentQ(q => Math.max(0, q - 1)); setConfirmingSubmit(false); }}
                    disabled={currentQ === 0}
                    style={{ padding: '8px 16px', background: currentQ === 0 ? '#eae9e9' : '#fff', border: '2px solid rgba(32,30,29,0.4)', cursor: currentQ === 0 ? 'default' : 'pointer', fontWeight: 700, fontSize: 13, color: currentQ === 0 ? '#c0c0c0' : '#201e1d' }}>
                    ← Prev
                  </button>
                  <button onClick={() => { setCurrentQ(q => Math.min(currentPartQuestions.length - 1, q + 1)); setConfirmingSubmit(false); }}
                    disabled={currentQ === currentPartQuestions.length - 1}
                    style={{ padding: '8px 16px', background: currentQ === currentPartQuestions.length - 1 ? '#eae9e9' : '#fff', border: '2px solid rgba(32,30,29,0.4)', cursor: currentQ === currentPartQuestions.length - 1 ? 'default' : 'pointer', fontWeight: 700, fontSize: 13, color: currentQ === currentPartQuestions.length - 1 ? '#c0c0c0' : '#201e1d' }}>
                    Next →
                  </button>
                </div>
                <button onClick={() => handleFlag(currentQuestion.id)}
                  style={{ padding: '8px 16px', background: isFlagged ? '#d97706' : 'transparent', color: isFlagged ? '#fff' : '#7d7979', border: `2px solid ${isFlagged ? '#d97706' : 'rgba(32,30,29,0.3)'}`, cursor: 'pointer', fontWeight: 700, fontSize: 13 }}>
                  {isFlagged ? 'Flagged ✕' : 'Flag'}
                </button>
              </div>
            </div>
          </div>

          {/* Desktop sidebar */}
          {!isMobile && (
            <div style={{ width: 240, flexShrink: 0, borderLeft: '2px solid rgba(32,30,29,0.2)', background: '#f3f2f2', padding: '24px 20px', overflowY: 'auto' }}>
              {sidebarContent}
            </div>
          )}
        </div>
      </div>
    );
  }

  // ─── Part results (between parts) ────────────────────────────────────────────

  if (view === 'part-results' && session && fullConfig) {
    const { correct, total } = calcScore(currentPartIndex);
    const pct = total > 0 ? Math.round((correct / total) * 100) : 0;
    const nextPartIndex = currentPartIndex + 1;
    const nextPart = fullConfig.parts[nextPartIndex];
    const partConfig = fullConfig.parts[currentPartIndex];
    const partQs = drawnQuestions[currentPartIndex] ?? [];

    return (
      <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2' }}>
        {header('Exam Simulation')}
        <div style={{ flex: 1, overflowY: 'auto', padding: isMobile ? '32px 20px' : '48px 32px', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
          <div style={{ width: '100%', maxWidth: 680 }}>

            {/* Score card */}
            <div style={{ background: '#fff', border: '2px solid rgba(32,30,29,0.4)', padding: '32px 28px', marginBottom: 24 }}>
              <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: '0.08em', textTransform: 'uppercase', color: '#7d7979', marginBottom: 8 }}>
                Part {currentPartIndex + 1} Complete
              </div>
              <div style={{ fontSize: isMobile ? 22 : 28, fontWeight: 800, marginBottom: 4, color: '#201e1d' }}>{partConfig.title}</div>
              <div style={{ fontSize: 48, fontWeight: 800, color: pct >= 75 ? '#15803d' : pct >= 50 ? '#d97706' : '#b91c1c', lineHeight: 1, marginBottom: 4 }}>{pct}%</div>
              <div style={{ fontSize: 14, color: '#605d5d' }}>{correct} correct out of {total} questions</div>
            </div>

            {/* Continue button */}
            {nextPart && (
              <div style={{ marginBottom: 32 }}>
                <div style={{ padding: '16px 20px', background: '#eae9e9', marginBottom: 16 }}>
                  <div style={{ fontSize: 13, fontWeight: 600, color: '#201e1d', marginBottom: 2 }}>Next: {nextPart.title}</div>
                  <div style={{ fontSize: 12, color: '#7d7979' }}>{nextPart.question_count} questions · {nextPart.section_titles?.join(' · ')}</div>
                </div>
                <button onClick={handleContinue}
                  style={{ padding: '12px 32px', background: '#2F6FED', color: '#fff', border: 'none', cursor: 'pointer', fontWeight: 700, fontSize: 14 }}>
                  Continue to Part {nextPartIndex + 1} →
                </button>
              </div>
            )}

            {/* Answer key */}
            <div>
              <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: '0.08em', textTransform: 'uppercase', color: '#7d7979', marginBottom: 16 }}>Answer Key</div>
              <div style={{ display: 'flex', flexDirection: 'column', gap: 12 }}>
                {partQs.map((q, i) => {
                  const picked = session.answers[q.id];
                  const correctChoice = q.choices.find(c => c.is_correct);
                  const pickedChoice = q.choices.find(c => c.id === picked);
                  const isCorrect = picked && correctChoice && picked === correctChoice.id;
                  return (
                    <div key={q.id} style={{ background: '#fff', border: `2px solid ${isCorrect ? '#86efac' : picked ? '#fca5a5' : 'rgba(32,30,29,0.25)'}`, padding: '14px 16px' }}>
                      <div style={{ display: 'flex', gap: 10, alignItems: 'flex-start', marginBottom: 8 }}>
                        <span style={{ fontSize: 12, fontWeight: 700, color: isCorrect ? '#15803d' : picked ? '#b91c1c' : '#7d7979', minWidth: 24, flexShrink: 0 }}>{i + 1}.</span>
                        <div style={{ flex: 1 }}>
                          <div style={{ fontSize: 13, color: '#201e1d', marginBottom: 6 }}>{q.text}</div>
                          <div style={{ display: 'flex', gap: 8, alignItems: 'center', flexWrap: 'wrap' }}>
                            <SimSourceBadge source={q.source} />
                            <span style={{ fontSize: 12, color: '#7d7979' }}>{q.section_title}</span>
                          </div>
                        </div>
                        <span style={{ fontSize: 16, flexShrink: 0 }}>{!picked ? '○' : isCorrect ? '✓' : '✗'}</span>
                      </div>
                      {!isCorrect && (
                        <div style={{ paddingLeft: 34 }}>
                          {pickedChoice && <div style={{ fontSize: 12, color: '#b91c1c', marginBottom: 2 }}>Your answer: {pickedChoice.text}</div>}
                          {correctChoice && <div style={{ fontSize: 12, color: '#15803d' }}>Correct: {correctChoice.text}</div>}
                          {!picked && <div style={{ fontSize: 12, color: '#7d7979' }}>Not answered · Correct: {correctChoice?.text}</div>}
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // ─── Final results ────────────────────────────────────────────────────────────

  if (view === 'final-results' && session && fullConfig) {
    const partScores = fullConfig.parts.map((_, i) => calcScore(i));
    const totalCorrect = partScores.reduce((s, p) => s + p.correct, 0);
    const totalQuestions = partScores.reduce((s, p) => s + p.total, 0);
    const overallPct = totalQuestions > 0 ? Math.round((totalCorrect / totalQuestions) * 100) : 0;

    return (
      <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2' }}>
        {header('Exam Simulation')}
        <div style={{ flex: 1, overflowY: 'auto', padding: isMobile ? '32px 20px' : '48px 32px', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
          <div style={{ width: '100%', maxWidth: 680 }}>

            {/* Overall score */}
            <div style={{ background: '#fff', border: '2px solid rgba(32,30,29,0.4)', padding: '32px 28px', marginBottom: 24 }}>
              <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: '0.08em', textTransform: 'uppercase', color: '#7d7979', marginBottom: 8 }}>Final Results</div>
              <div style={{ fontSize: isMobile ? 22 : 26, fontWeight: 800, marginBottom: 12 }}>{fullConfig.title}</div>
              <div style={{ fontSize: 52, fontWeight: 800, color: overallPct >= 75 ? '#15803d' : overallPct >= 50 ? '#d97706' : '#b91c1c', lineHeight: 1, marginBottom: 4 }}>{overallPct}%</div>
              <div style={{ fontSize: 14, color: '#605d5d' }}>{totalCorrect} correct out of {totalQuestions} questions</div>
            </div>

            {/* Per-part scores */}
            <div style={{ display: 'flex', flexDirection: isMobile ? 'column' : 'row', gap: 12, marginBottom: 32 }}>
              {fullConfig.parts.map((p, i) => {
                const { correct, total } = partScores[i];
                const pct = total > 0 ? Math.round((correct / total) * 100) : 0;
                return (
                  <div key={p.id} style={{ flex: 1, background: '#fff', border: '2px solid rgba(32,30,29,0.3)', padding: '16px 20px' }}>
                    <div style={{ fontSize: 11, fontWeight: 700, color: '#7d7979', marginBottom: 6 }}>PART {i + 1}</div>
                    <div style={{ fontSize: 14, fontWeight: 700, marginBottom: 8 }}>{p.title}</div>
                    <div style={{ fontSize: 28, fontWeight: 800, color: pct >= 75 ? '#15803d' : pct >= 50 ? '#d97706' : '#b91c1c', lineHeight: 1, marginBottom: 2 }}>{pct}%</div>
                    <div style={{ fontSize: 12, color: '#7d7979' }}>{correct}/{total}</div>
                  </div>
                );
              })}
            </div>

            {/* Actions */}
            <div style={{ display: 'flex', gap: 10, marginBottom: 40 }}>
              <button onClick={handleRestart}
                style={{ padding: '10px 24px', background: '#2F6FED', color: '#fff', border: 'none', cursor: 'pointer', fontWeight: 700, fontSize: 13 }}>
                Retake Exam
              </button>
              <button onClick={() => setView('overview')}
                style={{ padding: '10px 24px', background: 'transparent', color: '#1d4ed8', border: '2px solid #2F6FED', cursor: 'pointer', fontWeight: 700, fontSize: 13 }}>
                Back to Overview
              </button>
            </div>

            {/* Full answer key per part */}
            {fullConfig.parts.map((p, partIdx) => {
              const partQs = drawnQuestions[partIdx] ?? [];
              return (
                <div key={p.id} style={{ marginBottom: 40 }}>
                  <div style={{ fontSize: 13, fontWeight: 800, marginBottom: 12, paddingBottom: 8, borderBottom: '2px solid rgba(32,30,29,0.2)' }}>
                    Part {partIdx + 1}: {p.title}
                  </div>
                  <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
                    {partQs.map((q, i) => {
                      const picked = session.answers[q.id];
                      const correctChoice = q.choices.find(c => c.is_correct);
                      const pickedChoice = q.choices.find(c => c.id === picked);
                      const isCorrect = picked && correctChoice && picked === correctChoice.id;
                      return (
                        <div key={q.id} style={{ background: '#fff', border: `2px solid ${isCorrect ? '#86efac' : picked ? '#fca5a5' : 'rgba(32,30,29,0.25)'}`, padding: '12px 14px' }}>
                          <div style={{ display: 'flex', gap: 10, alignItems: 'flex-start', marginBottom: isCorrect ? 0 : 8 }}>
                            <span style={{ fontSize: 12, fontWeight: 700, color: isCorrect ? '#15803d' : picked ? '#b91c1c' : '#7d7979', minWidth: 24, flexShrink: 0 }}>{i + 1}.</span>
                            <div style={{ flex: 1 }}>
                              <div style={{ fontSize: 12.5, color: '#201e1d', marginBottom: 4 }}>{q.text}</div>
                              <div style={{ display: 'flex', gap: 6, alignItems: 'center', flexWrap: 'wrap' }}>
                                <SimSourceBadge source={q.source} />
                                <span style={{ fontSize: 11, color: '#7d7979' }}>{q.section_title}</span>
                              </div>
                            </div>
                            <span style={{ fontSize: 14, flexShrink: 0 }}>{!picked ? '○' : isCorrect ? '✓' : '✗'}</span>
                          </div>
                          {!isCorrect && (
                            <div style={{ paddingLeft: 34 }}>
                              {pickedChoice && <div style={{ fontSize: 11.5, color: '#b91c1c', marginBottom: 2 }}>Your answer: {pickedChoice.text}</div>}
                              {correctChoice && <div style={{ fontSize: 11.5, color: '#15803d' }}>Correct: {correctChoice.text}</div>}
                              {!picked && <div style={{ fontSize: 11.5, color: '#7d7979' }}>Not answered · Correct: {correctChoice?.text}</div>}
                            </div>
                          )}
                        </div>
                      );
                    })}
                  </div>
                </div>
              );
            })}

          </div>
        </div>
      </div>
    );
  }

  return null;
}
