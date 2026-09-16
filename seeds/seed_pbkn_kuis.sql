-- 4 questions for section_id=12 (Pengawasan Bank Berbasis Risiko), source='original'
-- Positions 11-14

DO $$
DECLARE
  q1 INT; q2 INT; q3 INT; q4 INT;
BEGIN

INSERT INTO questions (section_id, text, position, source)
VALUES (12, 'Berdasarkan SEDK 13/2016, tujuan Audit Working Plan adalah sebagai berikut, kecuali .....', 11, 'original')
RETURNING id INTO q1;

INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q1, 'Penyusunan strategi pemeriksaan', 1, FALSE),
(q1, 'Panduan penyediaan data oleh Bank', 2, TRUE),
(q1, 'Efektivitas waktu', 3, FALSE),
(q1, 'Ketertiban dan dokumentasi', 4, FALSE);

INSERT INTO questions (section_id, text, position, source)
VALUES (12, 'Tahapan dari siklus Risk Based Supervision yang merupakan pengendalian kualitas Pengawasan Bank adalah .....', 12, 'original')
RETURNING id INTO q2;

INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q2, 'Penyusunan Audit Working Plan', 1, FALSE),
(q2, 'Penyusunan Konfirmasi Hasil Pemeriksaan', 2, FALSE),
(q2, 'Pelaksanaan Forum Panel Pengawasan', 3, TRUE),
(q2, 'Penilaian Tingkat Kesehatan Bank', 4, FALSE);

INSERT INTO questions (section_id, text, position, source)
VALUES (12, 'Jenis fokus pengawasan yang terdapat pada Supervisory Plan adalah .....', 13, 'original')
RETURNING id INTO q3;

INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q3, 'Fokus Pengawasan Utama, Sekunder, Tambahan', 1, FALSE),
(q3, 'Fokus Pengawasan Utama, Sekunder, Lainnya', 2, TRUE),
(q3, 'Fokus Pengawasan Pertama, Kedua, Ketiga', 3, FALSE),
(q3, 'Fokus Pengawasan Utama, Tambahan, Lainnya', 4, FALSE);

INSERT INTO questions (section_id, text, position, source)
VALUES (12, 'Pemantauan Supervisory Plan dilakukan oleh Pengawas secara .....', 14, 'original')
RETURNING id INTO q4;

INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q4, 'Triwulanan', 1, TRUE),
(q4, 'Bulanan', 2, FALSE),
(q4, 'Semesteran', 3, FALSE),
(q4, 'Tahunan', 4, FALSE);

END $$;
