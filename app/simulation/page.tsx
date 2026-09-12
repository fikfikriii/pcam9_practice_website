import type { Metadata } from 'next';
import SimulationPage from '@/components/simulation/SimulationPage';

export const metadata: Metadata = { title: 'Exam Simulation — PCAM9 MLE OJK' };

export default function Page() {
  return <SimulationPage />;
}
