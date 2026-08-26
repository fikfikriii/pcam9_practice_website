'use client';

import Link from 'next/link';
import { useMobile } from '@/lib/useMobile';

export default function Home() {
  const isMobile = useMobile();
  const px = isMobile ? 20 : 32;

  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2', fontFamily: 'inherit' }}>
      {/* Header */}
      <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', padding: `0 ${px}px`, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
        <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
          <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM 9 OJK</span>
          {!isMobile && <span style={{ fontSize: 13, color: '#605d5d' }}>Assessment Practices</span>}
        </div>
      </div>

      {/* Body */}
      <div style={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', padding: isMobile ? '40px 20px' : '60px 32px' }}>
        {/* Hero text */}
        <div style={{ textAlign: 'center', marginBottom: isMobile ? 36 : 52, maxWidth: 480, width: '100%' }}>
          <div style={{ fontSize: isMobile ? 26 : 32, fontWeight: 800, lineHeight: 1.2, marginBottom: 12 }}>
            PCAM 9 OJK
          </div>
          <div style={{ fontSize: isMobile ? 14 : 15, color: '#605d5d', lineHeight: 1.6 }}>
            Exam practice platform covering Accounting, Risk Based Audit, and Data Analytics.
          </div>
        </div>

        {/* Cards */}
        <div style={{ display: 'flex', gap: 16, flexDirection: isMobile ? 'column' : 'row', width: '100%', maxWidth: isMobile ? 480 : 1060 }}>
          {/* Quiz Practice */}
          <Link href="/quiz" style={{ textDecoration: 'none', flex: 1 }}>
            <div style={{ background: '#2F6FED', color: '#fff', padding: isMobile ? '28px 24px' : '36px 32px', border: '2px solid #2F6FED', cursor: 'pointer', boxSizing: 'border-box', height: '100%' }}>
              <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: '0.08em', textTransform: 'uppercase', opacity: 0.75, marginBottom: 12 }}>
                Module 1
              </div>
              <div style={{ fontSize: 20, fontWeight: 800, marginBottom: 10 }}>Quiz Practice</div>
              <div style={{ fontSize: 13.5, lineHeight: 1.6, opacity: 0.85 }}>
                Take a mock exam. Answer questions one by one, flag for review, and get a scored result with answer key.
              </div>
              <div style={{ marginTop: 24, fontSize: 13, fontWeight: 700, opacity: 0.9 }}>
                Start quiz →
              </div>
            </div>
          </Link>

          {/* Section Drill */}
          <Link href="/drill" style={{ textDecoration: 'none', flex: 1 }}>
            <div style={{ background: '#fff', color: '#201e1d', padding: isMobile ? '28px 24px' : '36px 32px', border: '2px solid rgba(32,30,29,0.4)', cursor: 'pointer', boxSizing: 'border-box', height: '100%' }}>
              <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: '0.08em', textTransform: 'uppercase', color: '#7d7979', marginBottom: 12 }}>
                Module 2
              </div>
              <div style={{ fontSize: 20, fontWeight: 800, marginBottom: 10 }}>Section Drill</div>
              <div style={{ fontSize: 13.5, lineHeight: 1.6, color: '#605d5d' }}>
                Focus on one section at a time. Choose how many questions to practice and get instant feedback.
              </div>
              <div style={{ marginTop: 24, fontSize: 13, fontWeight: 700, color: '#1d4ed8' }}>
                Start drill →
              </div>
            </div>
          </Link>

          {/* Question Bank */}
          <Link href="/bank" style={{ textDecoration: 'none', flex: 1 }}>
            <div style={{ background: '#fff', color: '#201e1d', padding: isMobile ? '28px 24px' : '36px 32px', border: '2px solid rgba(32,30,29,0.4)', cursor: 'pointer', boxSizing: 'border-box', height: '100%' }}>
              <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: '0.08em', textTransform: 'uppercase', color: '#7d7979', marginBottom: 12 }}>
                Module 3
              </div>
              <div style={{ fontSize: 20, fontWeight: 800, marginBottom: 10 }}>Question Bank</div>
              <div style={{ fontSize: 13.5, lineHeight: 1.6, color: '#605d5d' }}>
                Browse the full question repository with correct answers shown. Filter by section or by source.
              </div>
              <div style={{ marginTop: 24, fontSize: 13, fontWeight: 700, color: '#1d4ed8' }}>
                Browse questions →
              </div>
            </div>
          </Link>

          {/* Exam Simulation */}
          <Link href="/simulation" style={{ textDecoration: 'none', flex: 1 }}>
            <div style={{ background: '#201e1d', color: '#fff', padding: isMobile ? '28px 24px' : '36px 32px', border: '2px solid #201e1d', cursor: 'pointer', boxSizing: 'border-box', height: '100%' }}>
              <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: '0.08em', textTransform: 'uppercase', opacity: 0.6, marginBottom: 12 }}>
                Module 4
              </div>
              <div style={{ fontSize: 20, fontWeight: 800, marginBottom: 10 }}>Exam Simulation</div>
              <div style={{ fontSize: 13.5, lineHeight: 1.6, opacity: 0.75 }}>
                Full-length timed simulation. Multi-part format mirroring the real exam. Unlock each part sequentially.
              </div>
              <div style={{ marginTop: 24, fontSize: 13, fontWeight: 700, opacity: 0.9 }}>
                Start simulation →
              </div>
            </div>
          </Link>
        </div>
      </div>

      {/* Footer */}
      <div style={{ padding: `16px ${px}px`, borderTop: '1px solid rgba(32,30,29,0.15)', display: 'flex', justifyContent: 'center' }}>
        <span style={{ fontSize: 12, color: '#7d7979' }}>PCAM 9 OJK — Internal Practice Platform</span>
      </div>
    </div>
  );
}
