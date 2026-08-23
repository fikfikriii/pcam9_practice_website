import type { Metadata } from 'next';
import { Archivo } from 'next/font/google';
import './globals.css';

const archivo = Archivo({
  subsets: ['latin'],
  weight: ['400', '600', '800'],
  variable: '--font-archivo',
});

export const metadata: Metadata = {
  title: 'PCAM 9 OJK — Quiz Practice',
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={archivo.variable}>
      <body
        style={{
          fontFamily: 'var(--font-archivo), sans-serif',
          backgroundColor: '#f3f2f2',
          margin: 0,
          padding: 0,
          minHeight: '100vh',
        }}
      >
        {children}
      </body>
    </html>
  );
}
