export interface QuestionSource {
  id: string;
  label: string;
}

export interface SectionCategory {
  id: string;
  label: string;
}

export interface Module {
  id: number;
  number: number;
  title: string;
  exam_date: string;
  section_count: number;
  question_count: number;
}

export interface Choice {
  id: number;
  text: string;
  position: number;
  is_correct: boolean;
}

export interface Question {
  id: number;
  section_id: number;
  text: string;
  position: number;
  source: string;
  explanation?: string | null;
  choices: Choice[];
}

export interface SectionMeta {
  id: number;
  title: string;
  position: number;
  draw_per_session: number;
  is_active: boolean;
  module_id: number | null;
  category_id: string | null;
  question_count: number;
}

export interface Section {
  id: number;
  title: string;
  position: number;
  draw_per_session: number;
  is_active: boolean;
  module_id: number | null;
  category_id: string | null;
  questions: Question[];
}
