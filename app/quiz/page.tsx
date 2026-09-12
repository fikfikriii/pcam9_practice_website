import QuizPage from '@/components/quiz/QuizPage';

export const metadata = {
  title: 'PCAM9 MLE OJK — Quiz Practice',
};

export default async function Home({ searchParams }: { searchParams: Promise<{ module?: string }> }) {
  const params = await searchParams;
  const moduleId = params.module ? parseInt(params.module) : null;
  return <QuizPage moduleId={moduleId} />;
}
