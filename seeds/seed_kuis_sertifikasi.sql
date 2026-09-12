-- seed_kuis_sertifikasi.sql
-- Source: /Sertifikasi/Kuis/ — five quiz/latihan files from OJK class sessions
-- Creates 5 new sections with a total of 48 questions
-- source = 'original' (class quiz materials)
--
-- Sections created:
--   1. Aplikasi Perbankan        (6 questions)  — Kuis Sistem Informasi Pengawasan OJK
--   2. Inklusi Keuangan              (10 questions) — Kuis Inklusi Keuangan OJK
--   3. Pengawasan SRO Pasar Modal    (10 questions) — Latihan Soal Pengawasan SRO
--   4. Pengawasan Bank Berbasis Risiko (10 questions) — Latihan Soal Pengawasan Bank
--   5. Layanan Urun Dana             (12 questions) — Kuis Kahoot POJK No. 17 Tahun 2025
--
-- NOTE: Pengawasan Bank Q1 (Know Your Bank) — answer A is estimated (key not captured in source).
--       Pengawasan Bank Q2 (Siklus RBS tahap ke-4) — answer D marked bold in source (not UL-confirmed).


-- ============================================================
-- Section 1: Aplikasi Perbankan
-- ============================================================
DO $$
DECLARE
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN
  SELECT id INTO sec_id FROM sections WHERE title = 'Aplikasi Perbankan';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session)
    VALUES ('Aplikasi Perbankan', sec_pos, 6)
    RETURNING id INTO sec_id;
  END IF;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Sumber data yang digunakan pada olahan data Bank Umum pada skenario OSIDA Risiko Kredit di Big Data Analytics (BDA) adalah',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'SLIK', TRUE),
    (q_id, 'Laporan Bank Umum Terintegrasi (LBUT)', FALSE),
    (q_id, 'APOLO', FALSE),
    (q_id, 'SPRINT', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Aplikasi yang digunakan Pengawas Bank Umum dan BPR/BPRS untuk menyusun dokumen berdasarkan proses pengawasan berbasis risiko (RBS) adalah',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Supervisory Dashboard', FALSE),
    (q_id, 'Sistem Informasi Pengawasan Konglomerasi Keuangan', FALSE),
    (q_id, 'Sistem Informasi Pengawasan Perbankan', TRUE),
    (q_id, 'Enterprise Data Warehouse', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Aplikasi yang digunakan pengawas untuk melihat olahan data yang dapat menunjang analisis dan deteksi secara dini potensi risiko pada Bank adalah',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Enterprise Data Warehouse', TRUE),
    (q_id, 'Sistem Informasi Pengawasan Perbankan', FALSE),
    (q_id, 'OJK BOX (OBOX)', FALSE),
    (q_id, 'Data Pokok', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Aplikasi yang digunakan untuk mengelola informasi dan koordinasi terkait penanganan kasus dugaan pelanggaran tindak pidana perbankan bagi pengawas, pemeriksa, dan satuan kerja terkait adalah',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Sistem Informasi Pelaku Industri Jasa Keuangan (SIPELAKU)', FALSE),
    (q_id, 'Sistem Informasi Pengawasan Perbankan (SIPB)', FALSE),
    (q_id, 'Sistem Informasi Penanganan Dugaan Pelanggaran (SIPEDANG)', TRUE),
    (q_id, 'Data Pokok (DAPOK)', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Olahan data laporan keuangan dan rasio-rasio Bank dapat diakses melalui aplikasi Sistem Informasi Pengawasan Perbankan pada modul',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Bank Performance Report (BPeR)', TRUE),
    (q_id, 'Risk Based Bank Rating (RBBR)', FALSE),
    (q_id, 'Ringkasan Informasi Pengawasan Bank Umum', FALSE),
    (q_id, 'Financial Conglomerates Report (FICOR)', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Aplikasi yang digunakan pengawas untuk mengakses data pelaporan Bank terkait kredit atau pembiayaan adalah',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Data Pokok (DAPOK)', FALSE),
    (q_id, 'Aplikasi Pelaporan Online OJK (APOLO)', FALSE),
    (q_id, 'Sistem Layanan Informasi Keuangan (SLIK)', TRUE),
    (q_id, 'Supervisory Dashboard', FALSE);

END $$;


-- ============================================================
-- Section 2: Inklusi Keuangan
-- ============================================================
DO $$
DECLARE
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN
  SELECT id INTO sec_id FROM sections WHERE title = 'Inklusi Keuangan';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session)
    VALUES ('Inklusi Keuangan', sec_pos, 10)
    RETURNING id INTO sec_id;
  END IF;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berdasarkan RPJMN, target inklusi keuangan yang harus dicapai pada tahun 2029 adalah sebesar...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '91%', FALSE),
    (q_id, '93%', TRUE),
    (q_id, '95%', FALSE),
    (q_id, '98%', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Prinsip pelaksanaan kegiatan Inklusi Keuangan yang dilaksanakan oleh OJK berlandaskan pada prinsip berikut, kecuali...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Terukur', FALSE),
    (q_id, 'Tepat Sasaran', FALSE),
    (q_id, 'Masif', TRUE),
    (q_id, 'Berkelanjutan', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Kerangka Regulasi yang mendasari Strategi Nasional Keuangan Inklusif adalah...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'UU No. 4 tahun 2023', FALSE),
    (q_id, 'POJK No. 3 tahun 2023', FALSE),
    (q_id, 'Perpres No. 114 tahun 2020', TRUE),
    (q_id, 'Keppres No. 26 tahun 2019', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Untuk mendukung Asta Cita 3 "Mendorong Kewirausahaan dan Industri Kreatif," program TPAKD yang disebutkan adalah...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Program Galeri Investasi', FALSE),
    (q_id, 'Implementasi Pedoman Setara bagi disabilitas', FALSE),
    (q_id, 'Membangun dari desa melalui implementasi GM EKI', FALSE),
    (q_id, 'Program Asistensi/Onboarding bagi UMKM atau Business Matching', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pada tahapan pra inkubasi dalam ekosistem keuangan inklusif, dilaksanakan proses...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pelaksanaan edukasi keuangan dan pendampingan kepada masyarakat desa', FALSE),
    (q_id, 'Aktivasi produk dan/atau layanan keuangan sesuai kebutuhan masyarakat', FALSE),
    (q_id, 'Pembangunan infrastruktur keuangan desa', FALSE),
    (q_id, 'Memahami kondisi desa dan kebutuhan masyarakatnya', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut yang bukan merupakan pola penyaluran kredit/pembiayaan pada Program K/PSP...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Channeling', FALSE),
    (q_id, 'Joint Financing', TRUE),
    (q_id, 'Executing', FALSE),
    (q_id, 'Pembiayaan Langsung', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Bobot persentase Ketersediaan dalam perhitungan Indeks Akses Keuangan Daerah adalah sebesar...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '10%', FALSE),
    (q_id, '20%', TRUE),
    (q_id, '50%', FALSE),
    (q_id, '70%', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pada tahun 2024, berapa total TPAKD yang telah terbentuk?',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '552', TRUE),
    (q_id, '514', FALSE),
    (q_id, '507', FALSE),
    (q_id, '520', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Salah satu fitur dari Produk Simpanan Pelajar yaitu, kecuali...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Saldo Maksimum Rp25juta', TRUE),
    (q_id, 'Setoran Awal Rp5.000/Rp1.000 (iB)', FALSE),
    (q_id, 'Bebas biaya administrasi', FALSE),
    (q_id, 'Setoran selanjutnya Rp1.000', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Bulan Inklusi Keuangan dilaksanakan secara rutin...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Setiap Bulan Oktober sejak tahun 2019', FALSE),
    (q_id, 'Setiap Bulan Oktober sejak tahun 2018', FALSE),
    (q_id, 'Setiap Bulan Oktober sejak tahun 2017', FALSE),
    (q_id, 'Setiap Bulan Oktober sejak tahun 2016', TRUE);

END $$;


-- ============================================================
-- Section 3: Pengawasan SRO Pasar Modal
-- ============================================================
DO $$
DECLARE
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN
  SELECT id INTO sec_id FROM sections WHERE title = 'Pengawasan SRO Pasar Modal';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session)
    VALUES ('Pengawasan SRO Pasar Modal', sec_pos, 10)
    RETURNING id INTO sec_id;
  END IF;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut ini adalah merupakan anggota Dana Perlindungan Pemodal, yaitu:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Reksadana', FALSE),
    (q_id, 'Manajer Investasi', FALSE),
    (q_id, 'Investor', FALSE),
    (q_id, 'Bank Kustodian', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Batas tertinggi ganti rugi per Kustodian menggunakan Dana Perlindungan Pemodal adalah...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '100 juta', FALSE),
    (q_id, '200 juta', FALSE),
    (q_id, '100 milyar', TRUE),
    (q_id, '1 milyar', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut ini Pihak yang melakukan penilaian harga pasar wajar atas Efek bersifat utang dan Sukuk, yaitu:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'SIPF', FALSE),
    (q_id, 'PHEI', TRUE),
    (q_id, 'PEI', FALSE),
    (q_id, 'KPEI', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut BUKAN kriteria pembayaran ganti rugi pemodal dengan menggunakan Dana Perlindungan Pemodal:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Terdapat kehilangan Aset Pemodal', FALSE),
    (q_id, 'Kustodian tak mampu kembalikan aset', FALSE),
    (q_id, 'Perusahaan Efek dicabut izin usaha', FALSE),
    (q_id, 'Pemodal tidak mengajukan ganti rugi', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut ini adalah salah satu tugas dan fungsi Lembaga Bursa Efek, kecuali:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menyediakan sistem dan menyelenggarakan transaksi', FALSE),
    (q_id, 'Jasa perdagangan efek', FALSE),
    (q_id, 'Jasa penyelesaian transaksi Bursa', TRUE),
    (q_id, 'Jasa pencatatan calon perusahaan tercatat', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Sistem pengawasan yang digunakan untuk memonitor RKAT SRO adalah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'SIPM', FALSE),
    (q_id, 'Mailing Room', FALSE),
    (q_id, 'E-RKAT', TRUE),
    (q_id, 'APOLO', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut ini merupakan dokumen yang disampaikan oleh SRO dalam persetujuan Rencana Kerja Anggaran Tahunan, kecuali:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Anggaran dan rencana kerja proyek insidentil', TRUE),
    (q_id, 'Anggaran beban dan pendapatan', FALSE),
    (q_id, 'Anggaran investasi', FALSE),
    (q_id, 'Gaji dan remunerasi', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Batas akhir OJK menyetujui RKAT tahunan SRO adalah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '5 November', FALSE),
    (q_id, '25 November', FALSE),
    (q_id, '15 November', FALSE),
    (q_id, '5 Desember', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Kondisi yang menjadi dasar pertimbangan dilaksanakannya pemeriksaan insidentil, yaitu:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pengawasan rutin', FALSE),
    (q_id, 'Gangguan Administrasi', FALSE),
    (q_id, 'Kasus pengaduan', TRUE),
    (q_id, 'Keterlambatan pelaporan', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Aspek pemeriksaan Lembaga Kliring dan Penjaminan adalah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Organisasi, Pencatatan Efek, Keanggotaan, Edukasi', FALSE),
    (q_id, 'Organisasi, Kustodian, Pengawasan, Manajemen Risiko', FALSE),
    (q_id, 'Manajemen Risiko, Organisasi, Pemeriksaan Internal, Kliring Penyelesaian', TRUE),
    (q_id, 'Kliring, Organisasi, Penjaminan dan Pengelolaan Risiko, Perdagangan Efek', FALSE);

END $$;


-- ============================================================
-- Section 4: Pengawasan Bank Berbasis Risiko
-- ============================================================
DO $$
DECLARE
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN
  SELECT id INTO sec_id FROM sections WHERE title = 'Pengawasan Bank Berbasis Risiko';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session)
    VALUES ('Pengawasan Bank Berbasis Risiko', sec_pos, 10)
    RETURNING id INTO sec_id;
  END IF;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- Q1: answer A is estimated — key was not revealed in source document
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dokumen Know Your Bank memuat informasi di bawah ini, kecuali:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Matriks Konfirmasi Hasil Pemeriksaan', TRUE),
    (q_id, 'Kepemilikan dan Struktur Kelompok Usaha', FALSE),
    (q_id, 'Aktivitas Bisnis Utama dan Aktivitas Penunjang Utama', FALSE),
    (q_id, 'Kinerja Keuangan', FALSE);

  -- Q2: answer D marked bold in source (confirm against material if needed)
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Tahapan keempat pada Siklus Pengawasan Bank Berdasarkan Risiko adalah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pemahaman terhadap Bank', FALSE),
    (q_id, 'Penilaian Tingkat Kesehatan', FALSE),
    (q_id, 'Pemantauan atau monitoring', FALSE),
    (q_id, 'Pemeriksaan Berdasarkan Risiko', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Di bawah ini yang bukan termasuk dalam komponen penilaian Risiko Inheren pada Risiko Kredit adalah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Strategi penyediaan dana sumber timbulnya penyediaan dana', FALSE),
    (q_id, 'Kualitas penyediaan dana dan kecukupan pencadangan', FALSE),
    (q_id, 'Keandalan mekanisme reviu strategi perkreditan secara berkala', TRUE),
    (q_id, 'Komposisi portofolio aset dan tingkat konsentrasi', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'PT Bank Archie Ihsani Sanusi merupakan perusahaan anak dari Aradea Bank, Ltd., yaitu Bank terbesar ke-5 di dunia dari segi total aset dan mendapatkan rating "AAA" dari Fetch Ratings dan Standard & Poor''s. Dalam penilaian permodalan RBBR, informasi tersebut paling tepat digunakan sebagai penilaian atas:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kecukupan permodalan', FALSE),
    (q_id, 'Kemampuan akses permodalan', TRUE),
    (q_id, 'Manajemen permodalan bank', FALSE),
    (q_id, 'Risiko permodalan', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Bank Kadal Bunga belum menyerahkan sertifikat agunan milik debitur yang telah meninggal dunia dengan alasan dana klaim asuransi belum kunjung dibayarkan pihak asuransi atau debitur masih berstatus gagal bayar. Hal ini berpotensi mengakibatkan adanya layangan gugatan dari ahli waris debitur. Secara inheren, apakah risiko yang paling kuat melekat atas kondisi tersebut?',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko Reputasi', FALSE),
    (q_id, 'Risiko Kredit', FALSE),
    (q_id, 'Risiko Hukum', TRUE),
    (q_id, 'Risiko Likuiditas', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam proses bisnis perkreditan, bank perlu untuk melakukan analisis berjenjang dan/atau terpisah terhadap suatu debitur yang dilakukan oleh unit kerja yang berbeda. Praktik dimaksud umumnya dikenal sebagai:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Segregation of duty', FALSE),
    (q_id, 'Four eyes principle', TRUE),
    (q_id, 'Third line of defense', FALSE),
    (q_id, 'Five Cs of credit', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam penilaian Rentabilitas periode Semester II 2025, pengawas Bank Buna Bahagia mempertimbangkan bahwa sebesar 27% dari seluruh pendapatan bank berasal dari revaluasi aset tetap, 18% berasal dari revaluasi valas, 43% berasal dari pendapatan bunga, dan sisanya berasal dari jasa dan pendapatan lainnya. Pada periode yang sama, diketahui bahwa total portofolio kredit tercatat sebesar 73% dari total aset, sehingga pengawas mengevaluasi peringkat rentabilitas turun dari 2 ke 3. Alasan utama yang menjadi pertimbangan pengawas dalam penyesuaian peringkat tersebut adalah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Keberlanjutan rentabilitas', TRUE),
    (q_id, 'Kinerja rentabilitas', FALSE),
    (q_id, 'Sumber-sumber rentabilitas', FALSE),
    (q_id, 'Tata kelola rentabilitas', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Salah satu pimpinan cabang Bank Chilli Pari tertangkap KPK atas tindakan korupsi dan beritanya tersiar dalam media massa, sehingga terdapat kenaikan kasus fraud bank yang pada periode sebelumnya tercatat nihil. Dampak dari kasus tersebut menyebabkan sebagian besar nasabah serentak melakukan rush sehingga likuiditas cabang turun signifikan sebesar -78,95% dari bulan sebelumnya serta NPL naik menjadi 11,51% karena mayoritas penyaluran kredit dilakukan kepada kolega pimpinan cabang yang usahanya fiktif. Porsi terbesar evaluasi atas kasus ini oleh Pengawas dilakukan pada penilaian RBBR dalam analisis:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko Kredit', FALSE),
    (q_id, 'Risiko Reputasi', FALSE),
    (q_id, 'Risiko Operasional', TRUE),
    (q_id, 'Risiko Likuiditas', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pengawas menilai bahwa akses sumber pendanaan Bank Bunga Bakung kurang sustain karena cenderung sulit mendapatkan dana dari grup usaha Pemegang Saham, sehingga secara inheren potensi risiko yang tinggi adalah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko Kredit', FALSE),
    (q_id, 'Risiko Reputasi', FALSE),
    (q_id, 'Risiko Operasional', FALSE),
    (q_id, 'Risiko Likuiditas', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'OSIDA Bank Umum pada portal Enterprise Data Warehouse (EDW) menggunakan sumber pelaporan bank berupa:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'BDA', FALSE),
    (q_id, 'SLIK', FALSE),
    (q_id, 'APOLO', FALSE),
    (q_id, 'LBU', TRUE);

END $$;


-- ============================================================
-- Section 5: Layanan Urun Dana
-- ============================================================
DO $$
DECLARE
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN
  SELECT id INTO sec_id FROM sections WHERE title = 'Layanan Urun Dana';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session)
    VALUES ('Layanan Urun Dana', sec_pos, 10)
    RETURNING id INTO sec_id;
  END IF;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dasar hukum terkini yang mengatur terkait penyelenggaraan Layanan Urun Dana adalah...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'POJK Nomor 57 Tahun 2022', FALSE),
    (q_id, 'POJK Nomor 57 Tahun 2025', FALSE),
    (q_id, 'POJK Nomor 17 Tahun 2025', TRUE),
    (q_id, 'POJK Nomor 17 Tahun 2022', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pihak yang mengajukan izin usaha ke Otoritas Jasa Keuangan yaitu...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penerbit', FALSE),
    (q_id, 'Penyelenggara', TRUE),
    (q_id, 'Pemodal', FALSE),
    (q_id, 'Semua Benar', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Jenis Efek yang ditawarkan pada Layanan Urun Dana yaitu...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Saham', FALSE),
    (q_id, 'Surat Utang', FALSE),
    (q_id, 'Sukuk', FALSE),
    (q_id, 'Semua Benar', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Jenis persyaratan yang harus dipenuhi oleh calon Direksi dan calon Dewan Komisaris yaitu...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Integritas, reputasi keuangan, kompetensi', TRUE),
    (q_id, 'Integritas, kompetensi, kelayakan keuangan', FALSE),
    (q_id, 'Integritas, kelayakan keuangan, kompetensi', FALSE),
    (q_id, 'Integritas, reputasi keuangan, kelayakan keuangan, kompetensi', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pemodal memiliki penghasilan Rp350 juta per tahun dan pengalaman investasi 3 tahun. Berapa persentase jumlah maksimal investasi Pemodal?',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '5%', FALSE),
    (q_id, '10%', FALSE),
    (q_id, '20%', FALSE),
    (q_id, 'Dikecualikan dari batasan pembelian Efek', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pihak Utama Penyelenggara yang wajib memperoleh persetujuan dari OJK sebelum menjalankan tugas dan fungsinya yaitu...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Direksi', FALSE),
    (q_id, 'Komisaris', FALSE),
    (q_id, 'PSP atau anggota pendiri bagi koperasi', FALSE),
    (q_id, 'Semua Benar', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Di bawah ini yang merupakan larangan sebagai Penerbit adalah...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Memiliki jumlah pemegang saham > 300 pihak dan modal disetor > 30M', TRUE),
    (q_id, 'Memiliki jumlah pemegang saham > 300 pihak atau modal disetor > 30M', FALSE),
    (q_id, 'Memiliki jumlah pemegang saham > 300 pihak dan modal disetor < 30M', FALSE),
    (q_id, 'Memiliki jumlah pemegang saham > 300 pihak atau modal disetor < 30M', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Yang bukan merupakan ruang lingkup perluasan perizinan yang tercantum dalam POJK 17/2025 yaitu...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perubahan jenis platform', FALSE),
    (q_id, 'Perubahan fitur dalam platform', TRUE),
    (q_id, 'Perubahan jenis Efek', FALSE),
    (q_id, 'Penetapan Efek Ekuitas sebagai Efek Syariah', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam melakukan penelaahan Penerbit, Penyelenggara wajib memiliki SDM yang memiliki keahlian/latar belakang sebagai berikut, kecuali...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'IT', FALSE),
    (q_id, 'Pemasaran', TRUE),
    (q_id, 'Hukum', FALSE),
    (q_id, 'Akuntansi', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa SLA yang diberikan OJK kepada calon Penyelenggara untuk melengkapi dokumen perizinan pada tahapan izin usaha?',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '20 hari kalender', FALSE),
    (q_id, '20 hari kerja', FALSE),
    (q_id, '90 hari kalender', TRUE),
    (q_id, '90 hari kerja', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa jumlah permodalan (dalam %) yang harus dipenuhi pada tahapan persetujuan prinsip?',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '25%', FALSE),
    (q_id, '75%', FALSE),
    (q_id, '50%', TRUE),
    (q_id, '100%', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Izin yang diberikan OJK kepada Penyelenggara untuk melakukan kegiatan usaha Layanan Urun Dana, yaitu...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Persetujuan Prinsip', FALSE),
    (q_id, 'Izin tercatat', FALSE),
    (q_id, 'Izin Usaha', TRUE),
    (q_id, 'Izin Prinsip', FALSE);

END $$;
