-- seed_data_analytics.sql
-- Source: Kumpulan_Soal_Data_Analytics.docx (IAI — Data Analytics Series)
-- Creates section 'Data Analytics' and seeds 10 questions (Modul 1–5)
-- source = 'original' (IAI class materials)

DO $$
DECLARE
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN
  -- Insert section (idempotent)
  SELECT id INTO sec_id FROM sections WHERE title = 'Data Analytics';

  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session)
    VALUES ('Data Analytics', sec_pos, 10)
    RETURNING id INTO sec_id;
  END IF;

  -- Append after any existing questions in this section
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- =========================================================================
  -- Modul 1 — Data Understanding
  -- =========================================================================

  -- Soal 1
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Sebuah dataset berisi satu baris untuk setiap LJK pada setiap bulan pelaporan. Jika LJK yang sama muncul enam kali selama Januari–Juni, bagaimana satu baris data seharusnya dipahami?',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Satu sektor pengawasan',          FALSE),
    (q_id, 'Satu LJK pada satu bulan pelaporan', TRUE),
    (q_id, 'Satu LJK selama satu semester',   FALSE),
    (q_id, 'Satu variabel dalam data dictionary', FALSE);

  -- Soal 2
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Ketika menganalisis Total Assets per Juni 2026, perlakuan yang paling tepat adalah ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menjumlahkan Total Assets Januari sampai Juni', FALSE),
    (q_id, 'Mengubah Total Assets menjadi flow',            FALSE),
    (q_id, 'Menggunakan nilai pada titik waktu Juni 2026',  TRUE),
    (q_id, 'Menghitung rata-rata seluruh dimension',        FALSE);

  -- =========================================================================
  -- Modul 2 — Data Cleaning and Preparation
  -- =========================================================================

  -- Soal 3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pada kolom Complaints ditemukan nilai kosong. Mengapa nilai tersebut tidak boleh otomatis diubah menjadi 0?',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Karena blank dapat berarti data belum tersedia, sedangkan 0 berarti tidak ada kejadian', TRUE),
    (q_id, 'Karena semua blank harus dihapus dari dataset',                FALSE),
    (q_id, 'Karena 0 hanya boleh digunakan untuk identifier',              FALSE),
    (q_id, 'Karena missing value selalu menunjukkan duplicate',            FALSE);

  -- Soal 4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Data Exposure lebih besar daripada Total Assets, padahal tipe data dan formatnya sudah benar. Pemeriksaan lanjutan yang paling sesuai adalah ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengganti semua null menjadi nol',          FALSE),
    (q_id, 'Business logic validation',                  TRUE),
    (q_id, 'Menambah seluruh baris dengan Append',       FALSE),
    (q_id, 'Menghapus semua field kategori',             FALSE);

  -- =========================================================================
  -- Modul 3 — Power Query
  -- =========================================================================

  -- Soal 5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Setelah Merge dengan Master Entity, jumlah baris tiba-tiba bertambah. Risiko yang paling mungkin perlu diperiksa adalah ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tabel referensi memiliki duplicate key',            TRUE),
    (q_id, 'Worksheet tidak memiliki warna',                    FALSE),
    (q_id, 'Semua kolom berubah menjadi dimension',             FALSE),
    (q_id, 'Power Query tidak dapat melakukan Refresh',         FALSE);

  -- Soal 6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Tim menerima file pelaporan Januari, Februari, dan Maret dengan struktur kolom yang sama. Operasi Power Query yang paling tepat untuk menyusun data menjadi satu tabel panjang adalah ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Merge',           FALSE),
    (q_id, 'Left Outer Join', FALSE),
    (q_id, 'Refresh',         FALSE),
    (q_id, 'Append',          TRUE);

  -- =========================================================================
  -- Modul 4 — Analitik Deskriptif
  -- =========================================================================

  -- Soal 7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Distribusi complaint rate sangat tidak simetris dan terdapat beberapa nilai ekstrem. Ukuran pusat data yang biasanya lebih tahan terhadap nilai ekstrem adalah ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Maximum', FALSE),
    (q_id, 'Range',   FALSE),
    (q_id, 'Median',  TRUE),
    (q_id, 'Sum',     FALSE);

  -- Soal 8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam agregasi portofolio, complaint rate antar-LJK sebaiknya dihitung dengan mempertimbangkan total complaints dan total customers. Pendekatan ini disebut ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Simple average dari individual rate', FALSE),
    (q_id, 'Weighted rate',                       TRUE),
    (q_id, 'Maximum rate',                        FALSE),
    (q_id, 'Minimum rate',                        FALSE);

  -- =========================================================================
  -- Modul 5 — PivotTable dan Data Visualization
  -- =========================================================================

  -- Soal 9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam PivotTable, field Sector paling tepat ditempatkan pada area Rows atau Columns karena berfungsi sebagai ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Measure',            FALSE),
    (q_id, 'Formula',            FALSE),
    (q_id, 'Dimension',          TRUE),
    (q_id, 'Objective function', FALSE);

  -- Soal 10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Seorang analis ingin menampilkan perkembangan jumlah pengaduan dari bulan ke bulan. Jenis chart yang paling sesuai adalah ...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Scatter Plot', FALSE),
    (q_id, 'Heatmap',      FALSE),
    (q_id, 'Histogram',    FALSE),
    (q_id, 'Line Chart',   TRUE);

END $$;
