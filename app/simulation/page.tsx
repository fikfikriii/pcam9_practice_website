import type { Metadata } from 'next';
import SimulationPage from '@/components/simulation/SimulationPage';

export const metadata: Metadata = { title: 'Exam Simulation — PCAM 9 OJK' };

export default function Page() {
  return <SimulationPage />;
}
