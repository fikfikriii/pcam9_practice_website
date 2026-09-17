'use client';

import { useState } from 'react';

type DocChoice = { text: string; is_correct: boolean };
type DocQuestion = { text: string; choices: DocChoice[] };

interface Props {
  title: string;
  questions: DocQuestion[];
  onClose: () => void;
}

export default function DownloadDocsModal({ title, questions, onClose }: Props) {
  const [downloading, setDownloading] = useState(false);

  async function handleDownload(withAnswers: boolean) {
    setDownloading(true);
    try {
      const res = await fetch('/api/docs', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ title, questions, withAnswers }),
      });
      const blob = await res.blob();
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = res.headers.get('content-disposition')?.match(/filename="(.+?)"/)?.[1] ?? 'questions.docx';
      a.click();
      URL.revokeObjectURL(url);
      onClose();
    } finally {
      setDownloading(false);
    }
  }

  return (
    <div style={{ position: 'fixed', inset: 0, zIndex: 200, display: 'flex', alignItems: 'center', justifyContent: 'center', background: 'rgba(32,30,29,0.5)' }}>
      <div style={{ background: '#fff', width: '90%', maxWidth: 400, padding: '28px 28px 24px' }}>
        <div style={{ fontSize: 17, fontWeight: 800, marginBottom: 8 }}>Download Docs</div>
        <div style={{ fontSize: 13.5, color: '#605d5d', marginBottom: 24 }}>Pilih format dokumen yang ingin diunduh.</div>
        <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
          <button
            onClick={() => handleDownload(true)}
            disabled={downloading}
            style={{ background: '#2F6FED', color: '#fff', border: 'none', padding: '12px 20px', fontSize: 14, fontWeight: 700, borderRadius: 0, cursor: downloading ? 'not-allowed' : 'pointer', fontFamily: 'inherit', textAlign: 'left', opacity: downloading ? 0.7 : 1 }}
          >
            Dengan Jawaban
            <div style={{ fontSize: 11.5, fontWeight: 400, marginTop: 2, opacity: 0.85 }}>Jawaban benar ditandai hijau</div>
          </button>
          <button
            onClick={() => handleDownload(false)}
            disabled={downloading}
            style={{ background: 'transparent', color: '#201e1d', border: '1.5px solid rgba(32,30,29,0.35)', padding: '12px 20px', fontSize: 14, fontWeight: 700, borderRadius: 0, cursor: downloading ? 'not-allowed' : 'pointer', fontFamily: 'inherit', textAlign: 'left', opacity: downloading ? 0.7 : 1 }}
          >
            Tanpa Jawaban
            <div style={{ fontSize: 11.5, fontWeight: 400, marginTop: 2, color: '#7d7979' }}>Soal saja, tanpa kunci jawaban</div>
          </button>
        </div>
        <button
          onClick={onClose}
          disabled={downloading}
          style={{ marginTop: 16, background: 'transparent', border: 'none', color: '#7d7979', fontSize: 13, cursor: 'pointer', fontFamily: 'inherit', padding: 0 }}
        >
          Batal
        </button>
      </div>
    </div>
  );
}
