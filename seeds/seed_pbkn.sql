-- seed_pbkn.sql
-- Source: Quizziz Perbankan 18092024.docx (PBKN-7 / Materi PCS 7)
-- Creates section 'PBKN' with 10 questions
-- source = 'pcs7'

DO $$
DECLARE
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN
  SELECT id INTO sec_id FROM sections WHERE title = 'PBKN';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session)
    VALUES ('PBKN', sec_pos, 10)
    RETURNING id INTO sec_id;
  END IF;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- Q1
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut merupakan fungsi pengembangan pengawasan perbankan dan konglomerasi keuangan, kecuali',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Merencanakan, mengendalikan, dan melaksanakan pengembangan metodologi pengawasan perbankan dan konglomerasi keuangan baik dalam bentuk kajian dan penyempurnaan proses bisnis.', FALSE),
    (q_id, 'Melaksanakan, mengkoordinasi dan mereview pengembangan Suptech Perbankan.', FALSE),
    (q_id, 'Melaksanakan audit internal pengawasan perbankan dan konglomerasi keuangan.', TRUE),
    (q_id, 'Meningkatkan kompetensi pengawas perbankan dan konglomerasi keuangan.', FALSE);

  -- Q2
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Tantangan dan Isu pada pengawasan Bank Umum antara lain',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penguatan RBBR dengan new emerging risk', FALSE),
    (q_id, 'Penguatan suptech untuk mendukung data analytic dan early risk detection', FALSE),
    (q_id, 'Penguatan koordinasi penanganan permasalahan bank (BI & LPS)', FALSE),
    (q_id, 'Semua benar', TRUE);

  -- Q3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Life cycle Bank pada siklus pengawasan adalah',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perizinan, Pengawasan, Exit Policy', TRUE),
    (q_id, 'Pendirian, Pengawasan, Likuidasi', FALSE),
    (q_id, 'Perizinan, Pengembangan, Operasional', FALSE),
    (q_id, 'Pendirian, Pengawasan, Exit Policy', FALSE);

  -- Q4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Tahapan dalam siklus pengawasan BPR dan BPRS berdasarkan risiko, kecuali',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penilaian Profil Risiko dan Kinerja BPR atau BPRS', FALSE),
    (q_id, 'Tindakan Pengawasan dan Pemantauan (Supervisory Actions and Monitoring)', FALSE),
    (q_id, 'Pemeriksaan Berdasarkan Risiko', FALSE),
    (q_id, 'Pemeriksaan berbasis kepatuhan', TRUE);

  -- Q5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Faktor dan bobot penilaian TKS BPR dan BPRS yaitu',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Profil Risiko (25%), Tata Kelola (30%), Rentabilitas (15%), Permodalan (30%)', TRUE),
    (q_id, 'Profil Risiko (30%), Tata Kelola (25%), Rentabilitas (15%), Permodalan (30%)', FALSE),
    (q_id, 'Profil Risiko (30%), Tata Kelola (25%), Rentabilitas (30%), Permodalan (15%)', FALSE),
    (q_id, 'Profil Risiko (25%), Tata Kelola (25%), Rentabilitas (30%), Permodalan (20%)', FALSE);

  -- Q6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Yang bukan merupakan komponen penilaian Kecukupan Penerapan Manajemen Risiko (KPMR) yaitu',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pengawasan Direksi dan Dewan Komisaris', FALSE),
    (q_id, 'Kecukupan Kebijakan, Prosedur, dan Penetapan Limit', FALSE),
    (q_id, 'Penilaian Kecukupan Penerapan Tata Kelola', TRUE),
    (q_id, 'Pengendalian Intern yang Menyeluruh', FALSE);

  -- Q7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Prinsip-prinsip umum penetapan peringkat risiko BPR/BPRS antara lain',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Berorientasi Risiko, Proporsionalitas, Signifikansi dan Materialitas, Komprehensif dan Terstruktur', TRUE),
    (q_id, 'Transparansi, Proporsionalitas, Signifikansi dan Materialitas, Komprehensif dan Terstruktur', FALSE),
    (q_id, 'Berorientasi Risiko, Terintegrasi, Signifikansi dan Materialitas, Komprehensif dan Terstruktur', FALSE),
    (q_id, 'Akuntabilitas, Proporsionalitas, Signifikansi dan Materialitas, Transparansi', FALSE);

  -- Q8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    '"Kejelasan fungsi dan pelaksanaan pertanggungjawaban organ BPR/BPRS" merupakan prinsip tata kelola',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Akuntabilitas', TRUE),
    (q_id, 'Transparansi', FALSE),
    (q_id, 'Independensi', FALSE),
    (q_id, 'Fairness', FALSE);

  -- Q9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Periodisasi penyusunan Audit Working Plan (AWP)',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'AWP wajib disusun sebelum melakukan pemeriksaan.', TRUE),
    (q_id, 'AWP wajib disusun sebelum melakukan pengawasan.', FALSE),
    (q_id, 'AWP wajib disusun sebelum dan sesudah melakukan pemeriksaan.', FALSE),
    (q_id, 'AWP wajib disusun setahun sekali.', FALSE);

  -- Q10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Sumber data Bank Performance Report (BPeR), kecuali',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Data Pokok', FALSE),
    (q_id, 'Laporan Posisi Keuangan', FALSE),
    (q_id, 'Data Konsumen', TRUE),
    (q_id, 'Laporan Laba Rugi', FALSE);

END $$;
