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
  source: 'original' | 'additional';
  choices: Choice[];
}

export interface Section {
  id: number;
  title: string;
  position: number;
  draw_per_session: number;
  is_active: boolean;
  questions: Question[];
}
