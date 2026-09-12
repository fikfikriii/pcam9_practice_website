import type { Metadata } from 'next';
import DrillPage from '@/components/drill/DrillPage';

export const metadata: Metadata = { title: 'PCAM 9 OJK — Section Drill' };

export default async function Drill({ searchParams }: { searchParams: Promise<{ module?: string }> }) {
  const params = await searchParams;
  const moduleId = params.module ? parseInt(params.module) : null;
  return <DrillPage moduleId={moduleId} />;
}
