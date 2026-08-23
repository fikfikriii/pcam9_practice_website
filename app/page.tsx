import Link from 'next/link';

export default function Home() {
  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2', fontFamily: 'inherit' }}>
      {/* Header */}
      <div style={{ height: 68, flexShrink: 0, display: 'flex', alignItems: 'center', padding: '0 32px', borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2' }}>
        <div style={{ display: 'flex', alignItems: 'baseline', gap: 14 }}>
          <span style={{ fontSize: 18, fontWeight: 800 }}>PCAM 9 OJK</span>
          <span style={{ fontSize: 13, color: '#605d5d' }}>Assessment Practices</span>
        </div>
      </div>

      {/* Body */}
      <div style={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', padding: '60px 32px' }}>
        {/* Hero text */}
        <div style={{ textAlign: 'center', marginBottom: 52, maxWidth: 480 }}>
          <div style={{ fontSize: 32, fontWeight: 800, lineHeight: 1.2, marginBottom: 14 }}>
            PCAM 9 OJK
          </div>
          <div style={{ fontSize: 15, color: '#605d5d', lineHeight: 1.6 }}>
            Exam practice platform covering Accounting, Financial Statement Analysis, and Risk Based Audit.
          </div>
        </div>

        {/* Cards */}
        <div style={{ display: 'flex', gap: 20, flexWrap: 'wrap', justifyContent: 'center', width: '100%', maxWidth: 820 }}>
          {/* Quiz Practice */}
          <Link href="/quiz" style={{ textDecoration: 'none', flex: '1 1 240px', maxWidth: 300 }}>
            <div style={{
              background: '#2F6FED',
              color: '#fff',
              padding: '36px 32px',
              border: '2px solid #2F6FED',
              cursor: 'pointer',
              height: '100%',
              boxSizing: 'border-box',
            }}>
              <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: '0.08em', textTransform: 'uppercase', opacity: 0.75, marginBottom: 14 }}>
                Module 1
              </div>
              <div style={{ fontSize: 20, fontWeight: 800, marginBottom: 10 }}>Quiz Practice</div>
              <div style={{ fontSize: 13.5, lineHeight: 1.6, opacity: 0.85 }}>
                Take a mock exam. Answer questions one by one, flag for review, and get a scored result with answer key.
              </div>
              <div style={{ marginTop: 28, fontSize: 13, fontWeight: 700, opacity: 0.9 }}>
                Start quiz →
              </div>
            </div>
          </Link>

          {/* Question Bank */}
          <Link href="/bank" style={{ textDecoration: 'none', flex: '1 1 240px', maxWidth: 300 }}>
            <div style={{
              background: '#fff',
              color: '#201e1d',
              padding: '36px 32px',
              border: '2px solid rgba(32,30,29,0.4)',
              cursor: 'pointer',
              height: '100%',
              boxSizing: 'border-box',
            }}>
              <div style={{ fontSize: 11, fontWeight: 700, letterSpacing: '0.08em', textTransform: 'uppercase', color: '#7d7979', marginBottom: 14 }}>
                Module 2
              </div>
              <div style={{ fontSize: 20, fontWeight: 800, marginBottom: 10 }}>Question Bank</div>
              <div style={{ fontSize: 13.5, lineHeight: 1.6, color: '#605d5d' }}>
                Browse the full question repository with correct answers shown. Filter by section or by source (Original / Additional).
              </div>
              <div style={{ marginTop: 28, fontSize: 13, fontWeight: 700, color: '#1d4ed8' }}>
                Browse questions →
              </div>
            </div>
          </Link>

        </div>
      </div>

      {/* Footer */}
      <div style={{ padding: '20px 32px', borderTop: '1px solid rgba(32,30,29,0.15)', display: 'flex', justifyContent: 'center' }}>
        <span style={{ fontSize: 12, color: '#7d7979' }}>PCAM 9 OJK — Internal Practice Platform</span>
      </div>
    </div>
  );
}
