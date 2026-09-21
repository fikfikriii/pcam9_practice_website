export default function Loading() {
  return (
    <div style={{ display: 'flex', flexDirection: 'column', minHeight: '100vh', background: '#f3f2f2', fontFamily: 'inherit' }}>
      {/* Header skeleton */}
      <div style={{ height: 68, flexShrink: 0, borderBottom: '2px solid rgba(32,30,29,0.4)', background: '#f3f2f2', display: 'flex', alignItems: 'center', padding: '0 32px' }}>
        <div style={{ width: 160, height: 20, background: '#eae9e9', borderRadius: 0 }} />
      </div>

      {/* Tab skeleton */}
      <div style={{ borderBottom: '1.5px solid rgba(32,30,29,0.15)', padding: '0 32px', display: 'flex', gap: 0 }}>
        {[140, 100].map((w, i) => (
          <div key={i} style={{ width: w, height: 44, display: 'flex', alignItems: 'center', marginRight: 8 }}>
            <div style={{ width: w - 16, height: 14, background: '#eae9e9' }} />
          </div>
        ))}
      </div>

      <div style={{ flex: 1, display: 'flex', maxWidth: 1200, width: '100%', margin: '0 auto', boxSizing: 'border-box' }}>
        {/* Sidebar skeleton */}
        <div style={{ width: 268, flexShrink: 0, padding: '28px 16px 32px 32px', borderRight: '1px solid rgba(32,30,29,0.1)' }}>
          <div style={{ width: 60, height: 10, background: '#eae9e9', marginBottom: 14 }} />
          {[120, 90, 110, 80, 100, 70, 95, 85].map((w, i) => (
            <div key={i} style={{ width: w, height: 12, background: '#eae9e9', marginBottom: 10, marginLeft: i % 3 !== 0 ? 12 : 0 }} />
          ))}
        </div>

        {/* Content skeleton */}
        <div style={{ flex: 1, padding: '40px 48px 80px 40px' }}>
          <div style={{ width: 280, height: 30, background: '#eae9e9', marginBottom: 24 }} />
          {[100, 85, 95, 70, 90, 80, 75, 88, 60, 92].map((w, i) => (
            <div key={i} style={{ width: `${w}%`, height: 14, background: '#eae9e9', marginBottom: 10 }} />
          ))}
          <div style={{ width: '100%', height: 120, background: '#eae9e9', margin: '24px 0' }} />
          {[88, 76, 94, 68, 82].map((w, i) => (
            <div key={i} style={{ width: `${w}%`, height: 14, background: '#eae9e9', marginBottom: 10 }} />
          ))}
        </div>
      </div>
    </div>
  );
}
