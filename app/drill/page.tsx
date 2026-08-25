import type { Metadata } from 'next';
import DrillPage from '@/components/drill/DrillPage';

export const metadata: Metadata = { title: 'PCAM 9 OJK — Section Drill' };

export default function Drill() {
  return <DrillPage />;
}
