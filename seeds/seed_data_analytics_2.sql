-- seed_data_analytics_2.sql
-- Source: Kumpulan_Soal_Data_Analytics_Bagian_2.docx (IAI — Data Analytics Series)
-- Appends 10 questions to section 'Data Analytics', positions 11–20
-- Soal 1 of Bagian 2 is skipped (duplicate of position 10 in seed_data_analytics.sql)
-- source = 'original' (IAI class materials)

DO $$
DECLARE
  sec_id INTEGER;
  q_id   INTEGER;
  pos    INTEGER := 10;
BEGIN
  SELECT id INTO sec_id FROM sections WHERE title = 'Data Analytics';
  IF sec_id IS NULL THEN
    RAISE EXCEPTION 'Section "Data Analytics" not found. Run seed_data_analytics.sql first.';
  END IF;

  -- =========================================================================
  -- Modul 6 — Comparison dan Relationship Analysis
  -- =========================================================================

  -- Soal 2 → position 11
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Sebelum membaca nilai correlation, langkah visual yang sebaiknya dilakukan untuk melihat pola hubungan dua variabel numerik adalah ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Membuat Scenario Analysis',  FALSE),
    (q_id, 'Membuat Scatter Plot',        TRUE),
    (q_id, 'Menggunakan Goal Seek',       FALSE),
    (q_id, 'Menghapus semua outlier',     FALSE);

  -- Soal 3 → position 12
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pertanyaan "apakah rata-rata complaint rate berbeda antara sektor Perbankan dan Pembiayaan?" termasuk jenis analisis ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Comparison analysis', TRUE),
    (q_id, 'Forecasting',          FALSE),
    (q_id, 'Goal Seek',            FALSE),
    (q_id, 'Data leakage',         FALSE);

  -- =========================================================================
  -- Modul 7 — Regression Analysis
  -- =========================================================================

  -- Soal 4 → position 13
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam model regresi NPF Rate, variabel Growth, Collection Rate, Funding Cost, dan Complaint Rate berperan sebagai ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Dependent variable',               FALSE),
    (q_id, 'Unique key',                        FALSE),
    (q_id, 'Independent variables / predictors', TRUE),
    (q_id, 'Cleaning log',                      FALSE);

  -- Soal 5 → position 14
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Residual yang besar pada hasil regression sebaiknya dipahami sebagai ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Bukti bahwa model selalu benar',                              FALSE),
    (q_id, 'Selisih yang perlu diperiksa antara actual dan predicted value', TRUE),
    (q_id, 'Indikasi bahwa semua predictor harus dihapus',               FALSE),
    (q_id, 'Nilai yang sama dengan R Square',                            FALSE);

  -- =========================================================================
  -- Modul 8 — Time Series Analysis
  -- =========================================================================

  -- Soal 6 → position 15
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Untuk menangkap perubahan bulan ke bulan (short-term) pada sebuah metrik, ukuran yang paling tepat digunakan adalah ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'MoM (Month-over-Month)',  TRUE),
    (q_id, 'YoY (Year-over-Year)',    FALSE),
    (q_id, 'ANOVA',                   FALSE),
    (q_id, 'Left Outer Join',         FALSE);

  -- Soal 7 → position 16
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Moving Average digunakan dalam time series terutama untuk ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Membuktikan causality',                          FALSE),
    (q_id, 'Mengganti semua missing value',                  FALSE),
    (q_id, 'Mengurangi noise dan memperjelas underlying trend', TRUE),
    (q_id, 'Menentukan objective function',                  FALSE);

  -- =========================================================================
  -- Modul 9 — Forecasting dan Early-Warning Trend Analysis
  -- =========================================================================

  -- Soal 8 → position 17
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam forecasting, holdout period digunakan untuk ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menguji model pada data yang tidak digunakan saat membangun model', TRUE),
    (q_id, 'Menghapus seluruh seasonality',                                     FALSE),
    (q_id, 'Mengubah MA Short menjadi MA Long',                                 FALSE),
    (q_id, 'Membuat seluruh error menjadi nol',                                 FALSE);

  -- Soal 9 → position 18
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pada monitoring NPF Rate, MA-3 menembus MA-6 dari atas ke bawah. Interpretasi yang paling tepat adalah ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'NPF pasti akan naik terus',                                             FALSE),
    (q_id, 'Forecast tidak perlu digunakan lagi',                                   FALSE),
    (q_id, 'MA Short menembus MA Long dari bawah ke atas',                          FALSE),
    (q_id, 'Tekanan NPF jangka pendek mulai mereda dibanding tren jangka panjang',  TRUE);

  -- =========================================================================
  -- Modul 10 — Analitik Preskriptif Dasar
  -- =========================================================================

  -- Soal 10 → position 19
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Jika analis ingin mencari satu nilai input agar satu output mencapai target tertentu, tools Excel yang paling sesuai adalah ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Scenario Analysis', FALSE),
    (q_id, 'Goal Seek',         TRUE),
    (q_id, 'Solver',            FALSE),
    (q_id, 'PivotTable',        FALSE);

  -- Soal 11 → position 20
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam Solver, batasan seperti Total Cost ≤ Budget dan Total Days ≤ Available Days termasuk komponen yang disebut ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Residuals',       FALSE),
    (q_id, 'Dimension',       FALSE),
    (q_id, 'Constraints',     TRUE),
    (q_id, 'Forecast errors', FALSE);

END $$;
