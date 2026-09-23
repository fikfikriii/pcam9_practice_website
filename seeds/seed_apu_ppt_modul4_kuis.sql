-- Seed: APU PPT Pre-Test Kuis — Modul 4, section position 50
-- Source: Pre-Test APU PPT.pdf (Mentimeter quiz, 10 soal)
-- source = 'original' (label: Kuis), module_id = 4, category_id = NULL

INSERT INTO sections (title, position, draw_per_session, is_active, module_id, category_id)
VALUES ('APU PPT', 50, 10, TRUE, 4, NULL);

-- Q1: Tiga tahapan pendanaan terorisme
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Tiga tahapan pendanaan terorisme adalah ...', 1, id, 'original'
  FROM sections WHERE title = 'APU PPT' AND position = 50 AND module_id = 4
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Placing - Layering - Integration', 1, FALSE),
  ('Using - Layering - Integration',   2, FALSE),
  ('Raising - Moving - Using',         3, TRUE),
  ('Raising - Using - Layering',       4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q2: Organisasi internasional standar global TPPU/TPPT/PPSPM
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Organisasi internasional yang menetapkan standar global untuk mencegah TPPU/TPPT/PPSPM adalah ...', 2, id, 'original'
  FROM sections WHERE title = 'APU PPT' AND position = 50 AND module_id = 4
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('United Nations Office on Drugs and Crime (UNODC)', 1, FALSE),
  ('Financial Intelligence Unit (FIU)',                2, FALSE),
  ('Asia Pacific Group on AML/CFT',                   3, FALSE),
  ('Financial Action Task Force (FATF)',               4, TRUE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q3: Focal Point Indonesia APU/PPT/PPPSPM
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Lembaga yang berperan sebagai Focal Point di Indonesia terkait penerapan program APU/PPT/PPPSPM adalah ...', 3, id, 'original'
  FROM sections WHERE title = 'APU PPT' AND position = 50 AND module_id = 4
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('OJK',                                                      1, FALSE),
  ('Badan Nasional Penanggulangan Terorisme (BNPT)',           2, FALSE),
  ('Pusat Pelaporan dan Analisis Transaksi Keuangan (PPATK)', 3, TRUE),
  ('Kementerian Keuangan',                                     4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q4: Proses identifikasi, verifikasi, pemantauan nasabah berisiko tinggi
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Proses identifikasi, verifikasi, dan pemantauan terhadap nasabah berisiko tinggi disebut ...', 4, id, 'original'
  FROM sections WHERE title = 'APU PPT' AND position = 50 AND module_id = 4
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Simplified Due Diligence',                                       1, FALSE),
  ('Customer Due Diligence',                                         2, FALSE),
  ('Enhanced Due Diligence',                                         3, TRUE),
  ('Tidak dilakukan due diligence karena nasabah prioritas',         4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q5: Siklus pengawasan APU, PPT, PPPSPM yang benar
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Manakah skema siklus pengawasan program APU, PPT, dan PPPSPM yang benar?', 5, id, 'original'
  FROM sections WHERE title = 'APU PPT' AND position = 50 AND module_id = 4
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Penilaian Risiko → Rencana Pengawasan → Pelaksanaan Pengawasan → Tindak Lanjut Hasil Pengawasan', 1, TRUE),
  ('Rencana Pengawasan → Pelaksanaan Pengawasan → Tindak Lanjut Hasil Pengawasan → Penilaian Risiko',  2, FALSE),
  ('Pelaksanaan Pengawasan → Penilaian Risiko → Rencana Pengawasan → Tindak Lanjut',                   3, FALSE),
  ('Pelaksanaan Pengawasan → Tindak Lanjut Hasil Pengawasan → Rencana Pengawasan → Penilaian Tingkat Risiko', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q6: Lima Pilar APU/PPT/PPPSPM, kecuali
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Yang termasuk Lima Pilar utama penerapan program APU, PPT, dan PPPSPM sebagai berikut, kecuali ...', 6, id, 'original'
  FROM sections WHERE title = 'APU PPT' AND position = 50 AND module_id = 4
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Sistem Informasi Manajemen',        1, FALSE),
  ('SDM & Pelatihan',                   2, FALSE),
  ('Kebijakan dan Prosedur',            3, FALSE),
  ('Pengawasan aktif audit internal',   4, TRUE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q7: Sistem internal OJK tindak lanjut DTTOT dan DPPSPM
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Sistem internal OJK yang diantaranya digunakan dalam rangka tindak lanjut pelaporan DTTOT dan DPPSPM, yaitu ...', 7, id, 'original'
  FROM sections WHERE title = 'APU PPT' AND position = 50 AND module_id = 4
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('SIPESAT',  1, FALSE),
  ('SIGAP',    2, TRUE),
  ('SIPENDAR', 3, FALSE),
  ('GoAML',    4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q8: Kewajiban pelaporan PJK ke OJK, kecuali
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Kewajiban pelaporan PJK ke OJK terkait program APU/PPT/PPPSPM, kecuali ...', 8, id, 'original'
  FROM sections WHERE title = 'APU PPT' AND position = 50 AND module_id = 4
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Laporan Rencana dan Realisasi Pengkinian Data',   1, FALSE),
  ('Laporan Transaksi Keuangan Mencurigakan (LTKM)',  2, TRUE),
  ('Pelaporan Tindak Lanjut DTTOT dan DPPPPSM',       3, FALSE),
  ('Individual Risk Assessment (IRA)',                 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q9: Perbedaan PU dan PT, kecuali
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Perbedaan pencucian uang (PU) dan pendanaan terorisme (PT), kecuali ...', 9, id, 'original'
  FROM sections WHERE title = 'APU PPT' AND position = 50 AND module_id = 4
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Sumber dana PU: legal dan ilegal, Sumber dana PT: legal',                                       1, TRUE),
  ('Sumber dana PT: ilegal dan legal, Sumber dana PU: legal',                                       2, FALSE),
  ('Nominal transaksi PU bernilai besar, nominal transaksi PT cenderung kecil',                     3, FALSE),
  ('Prinsip PU = mengumpulkan sebanyak mungkin, Prinsip PT = mengumpulkan secukupnya',              4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q10: Tiga tahapan proses pencucian uang
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Tiga tahapan dalam proses pencucian uang adalah ...', 10, id, 'original'
  FROM sections WHERE title = 'APU PPT' AND position = 50 AND module_id = 4
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Layering - Placement - Integration', 1, FALSE),
  ('Placement - Layering - Integration', 2, TRUE),
  ('Placement - Moving - Integration',   3, FALSE),
  ('Raising - Layering - Using',         4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;
