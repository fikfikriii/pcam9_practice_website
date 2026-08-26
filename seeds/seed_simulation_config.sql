-- Default simulation config: 2-part PCAM 9 OJK exam
-- Part 1: Akuntansi + Analisis LK (40 questions)
-- Part 2: Risk Based Audit + Data Analytics (40 questions)
-- Run AFTER migration.sql and all section seeds.

DO $$
DECLARE
  cfg_id INTEGER;
  p1_id  INTEGER;
  p2_id  INTEGER;
BEGIN
  IF NOT EXISTS (SELECT 1 FROM simulation_configs LIMIT 1) THEN

    INSERT INTO simulation_configs (title, description)
    VALUES (
      'PCAM 9 OJK — Exam Simulation',
      '2-part simulation exam mirroring the real PCAM 9 format. Part 1 covers Akuntansi & Analisis LK (40 questions). Part 2 covers Risk Based Audit & Data Analytics (40 questions). You must complete Part 1 before unlocking Part 2.'
    )
    RETURNING id INTO cfg_id;

    INSERT INTO simulation_parts (simulation_id, part_number, title, question_count)
    VALUES (cfg_id, 1, 'Part 1 — Akuntansi & Analisis LK', 40)
    RETURNING id INTO p1_id;

    INSERT INTO simulation_parts (simulation_id, part_number, title, question_count)
    VALUES (cfg_id, 2, 'Part 2 — Risk Based Audit & Data Analytics', 40)
    RETURNING id INTO p2_id;

    -- Part 1 sections: Akuntansi (pos 0) + Analisis Laporan Keuangan (pos 1)
    INSERT INTO simulation_part_sections (part_id, section_id)
    SELECT p1_id, id FROM sections WHERE title IN ('Akuntansi', 'Analisis Laporan Keuangan');

    -- Part 2 sections: Risk Based Audit (pos 2) + Data Analytics (pos 3)
    INSERT INTO simulation_part_sections (part_id, section_id)
    SELECT p2_id, id FROM sections WHERE title IN ('Risk Based Audit', 'Data Analytics');

  END IF;
END $$;
