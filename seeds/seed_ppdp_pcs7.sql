-- seed_ppdp_pcs7.sql
-- Source: Bank Soal Pengawasan.docx + Bank Soal Penjaminan.docx
--         (Materi PCS 7 — Direktorat Pengawasan PP, Dana Pensiun dan Pengawasan Khusus)
-- Section: PPDP | Source: pcs7
-- 35 questions total:
--   Pengawasan  — Proses Bisnis    (10 soal, Q1–Q10)
--   Penjaminan  — Proses Bisnis    (10 soal, Q11–Q20)
--   Penjaminan  — Laporan Periodik (15 soal, Q21–Q35, answer key confirmed)
--
-- NOTE: Answers for Q1–Q20 (Pengawasan + Penjaminan Proses Bisnis) are best-effort
--       estimates — no answer key was included in the source files.
--       Verify via admin panel and correct as needed.

DO $$
DECLARE
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN
  -- Insert section (idempotent)
  SELECT id INTO sec_id FROM sections WHERE title = 'PPDP';

  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session)
    VALUES ('PPDP', sec_pos, 10)
    RETURNING id INTO sec_id;
  END IF;

  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- =========================================================================
  -- Bank Soal Pengawasan — Proses Bisnis (10 soal)
  -- =========================================================================

  -- Soal 1
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dasar Hukum pelaksanaan pengawasan Perusahaan Penjaminan adalah:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'POJK Nomor 11/POJK.05/2014 tahun 2014', FALSE),
    (q_id, 'POJK Nomor 2/POJK.05/2017 tahun 2017', FALSE),
    (q_id, 'POJK Nomor 30/POJK.05/2018 tahun 2018', TRUE),
    (q_id, 'POJK 30/POJK.05/2020 tahun 2020', FALSE);

  -- Soal 2
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pelaksanaan Pemeriksaan Langsung pada Perusahaan Penjaminan dilakukan secara berkala dengan frekuensi:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Frekuensi 1 (satu) kali dalam 3 (tiga) tahun', FALSE),
    (q_id, 'Frekuensi 1 (satu) kali dalam 2 (dua) tahun', FALSE),
    (q_id, 'Frekuensi 1 (satu) kali dalam 1 (satu) tahun', FALSE),
    (q_id, 'Jawaban semua benar', TRUE);

  -- Soal 3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut langkah-langkah yang dilakukan pada waktu pemeriksaan langsung, kecuali:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penyiapan Laporan Hasil Analisis', TRUE),
    (q_id, 'Penyusunan Rencana Kerja Pemeriksaan Langsung', FALSE),
    (q_id, 'Penyiapan Dokumen Pemeriksaan Langsung', FALSE),
    (q_id, 'Pelaksanaan Pemeriksaan Langsung', FALSE);

  -- Soal 4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Aspek-aspek dalam melakukan Pemeriksaan Langsung pada Perusahaan Penjaminan adalah, kecuali:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kelembagaan', FALSE),
    (q_id, 'Keuangan', FALSE),
    (q_id, 'Pelaksanaan Tata Kelola Perusahaan Yang Baik', FALSE),
    (q_id, 'Profil Risiko', TRUE);

  -- Soal 5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Hal-hal apa saja yang perlu disiapkan dalam tahapan persiapan pemeriksaan:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengumpulkan dokumen pemeriksaan', FALSE),
    (q_id, 'Wawancara', FALSE),
    (q_id, 'Penyiapan dokumen Audit Program', TRUE),
    (q_id, 'Pembahasan Matriks Pemeriksaan', FALSE);

  -- Soal 6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Tujuan penyusunan KKP, kecuali:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mendukung kesimpulan yang telah diambil Pemeriksa', FALSE),
    (q_id, 'Bukti bahwa Pemeriksa telah melaksanakan Pemeriksaan Langsung sesuai program Pemeriksaan Langsung (audit program)', FALSE),
    (q_id, 'Penyusunan Berita Acara Pemeriksaan', TRUE),
    (q_id, 'Sebagai pegangan untuk Pemeriksaan Langsung berikutnya', FALSE);

  -- Soal 7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Hal-hal yang diperlukan untuk persiapan Pra Exit Meeting adalah:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Bahan Matriks Pemeriksaan', TRUE),
    (q_id, 'Dokumen', FALSE),
    (q_id, 'Bahan Berita Pemeriksaan', FALSE),
    (q_id, 'Surat Tugas', FALSE);

  -- Soal 8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Kelengkapan dokumen sebelum pelaksanaan pemeriksaan, kecuali:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Surat Tugas', FALSE),
    (q_id, 'Matriks Pemeriksaan', FALSE),
    (q_id, 'Surat Perintah', TRUE),
    (q_id, 'Surat Pemberitahuan', FALSE);

  -- Soal 9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Isi Laporan Hasil Pemeriksaan Langsung memuat:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tujuan Pemeriksaan Langsung, Ruang Lingkup Pemeriksaan Langsung, Tempat Pemeriksaan Langsung, Jangka Waktu Pemeriksaan, Hasil Pemeriksaan, Kesimpulan, Rekomendasi dan Saran', FALSE),
    (q_id, 'Tujuan Pemeriksaan Langsung, Ruang Lingkup Pemeriksaan Langsung, Periode Pelaksanaan Pemeriksaan Langsung, Jangka Waktu Pemeriksaan, Hasil Pemeriksaan, Tanggapan perusahaan, Rekomendasi dan Saran', FALSE),
    (q_id, 'Tujuan Pemeriksaan Langsung, Ruang Lingkup Pemeriksaan Langsung, Periode Pelaksanaan Pemeriksaan Langsung, Jangka Waktu Pemeriksaan, Hasil Pemeriksaan, Kesimpulan, Rekomendasi dan Saran', TRUE),
    (q_id, 'Audit Program, Ruang Lingkup Pemeriksaan Langsung, Periode Pelaksanaan Pemeriksaan Langsung, Jangka Waktu Pemeriksaan, Hasil Pemeriksaan, Kesimpulan, Rekomendasi dan Saran', FALSE);

  -- Soal 10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'LHPL ditandatangani oleh Tim Pemeriksa, kecuali:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Anggota Tim', FALSE),
    (q_id, 'Ketua Tim', FALSE),
    (q_id, 'Penyelia Tim', FALSE),
    (q_id, 'Deputi Komisioner', TRUE);

  -- =========================================================================
  -- Bank Soal Penjaminan — Proses Bisnis (10 soal)
  -- =========================================================================

  -- Soal 11
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Sebutkan dasar hukum/pengaturan perusahaan penjaminan, kecuali:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'SEOJK Nomor 11/POJK.05/2013', TRUE),
    (q_id, 'SEOJK Nomor 54/POJK.05/2017', FALSE),
    (q_id, 'SEOJK Nomor 18/POJK.05/2018', FALSE),
    (q_id, 'SEOJK Nomor 52/POJK.05/2017', FALSE);

  -- Soal 12
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Terdapat berapa pihak dalam kegiatan penjaminan?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '2 pihak: penerima jaminan dan terjamin', FALSE),
    (q_id, '2 pihak: penerima jaminan dan penjamin', FALSE),
    (q_id, '3 pihak: penjamin, penerima jaminan, dan terjamin', TRUE),
    (q_id, '3 pihak: penanggung, tertanggung, agen penjamin', FALSE);

  -- Soal 13
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut merupakan kegiatan utama perusahaan penjaminan:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penjaminan kredit dan/atau pinjaman program kemitraan yang disalurkan oleh BUMN dalam rangka PKBL', FALSE),
    (q_id, 'Penjaminan pengadaan barang dan/atau jasa (surety bonds)', TRUE),
    (q_id, 'Penjaminan kepabeanan (custom bonds)', FALSE),
    (q_id, 'Penjaminan pembelian barang secara angsuran', FALSE);

  -- Soal 14
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut merupakan kegiatan usaha lainnya perusahaan penjaminan:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penjaminan kredit dan/atau pinjaman program kemitraan yang disalurkan oleh BUMN dalam rangka PKBL', TRUE),
    (q_id, 'Penjaminan pinjaman yang disalurkan oleh koperasi simpan pinjam atau koperasi yang mempunyai unit simpan pinjam kepada anggotanya', FALSE),
    (q_id, 'Penjaminan kredit, pembiayaan, atau pembiayaan berdasarkan prinsip syariah yang diberikan oleh lembaga keuangan', FALSE),
    (q_id, 'Penjaminan transaksi dagang', FALSE);

  -- Soal 15
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Sampai dengan saat ini, ada berapa banyak perusahaan penjaminan konvensional di Indonesia:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '10 perusahaan penjaminan', FALSE),
    (q_id, '15 perusahaan penjaminan', TRUE),
    (q_id, '20 perusahaan penjaminan', FALSE),
    (q_id, '25 perusahaan penjaminan', FALSE);

  -- Soal 16
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Penjaminan merupakan perjanjian yang bersifat accesoir. Ciri perjanjian accesoir adalah sebagai berikut, kecuali:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Adanya tergantung pada perjanjian pokok', FALSE),
    (q_id, 'Jika perjanjian pokok batal, maka perjanjian penjaminan juga ikut batal', FALSE),
    (q_id, 'Jika perjanjian pokok batal, maka hanya klausula yang berkaitan dengan penjaminan saja yang akan batal', TRUE),
    (q_id, 'Ikut beralih dengan beralihnya perjanjian pokok', FALSE);

  -- Soal 17
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam skema penjaminan kredit, bank/koperasi bertindak sebagai:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penerima Jaminan', TRUE),
    (q_id, 'Tertanggung', FALSE),
    (q_id, 'Terjamin', FALSE),
    (q_id, 'Penanggung', FALSE);

  -- Soal 18
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Sejak ganti rugi dibayarkan oleh perusahaan penjaminan, maka timbul hak tagih yang beralih menjadi hak tagih perusahaan penjaminan, yang disebut:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Klaim', FALSE),
    (q_id, 'Subrogasi', TRUE),
    (q_id, 'Imbal Jasa Penjaminan', FALSE),
    (q_id, 'Komisi', FALSE);

  -- Soal 19
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Kegiatan usaha yang dapat dilaksanakan oleh perusahaan penjaminan diatur dalam:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'POJK Nomor 1/POJK.05/2016', FALSE),
    (q_id, 'POJK Nomor 1/POJK.05/2017', FALSE),
    (q_id, 'POJK Nomor 2/POJK.05/2017', TRUE),
    (q_id, 'POJK Nomor 3/POJK.05/2017', FALSE);

  -- Soal 20
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Kegiatan usaha yang wajib dilaporkan oleh Perusahaan Penjaminan ke OJK adalah:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penjaminan kredit, pembiayaan, atau pembiayaan berdasarkan prinsip syariah yang diberikan oleh lembaga keuangan', FALSE),
    (q_id, 'Penjaminan pinjaman yang disalurkan oleh koperasi simpan pinjam atau koperasi yang mempunyai unit simpan pinjam kepada anggotanya', FALSE),
    (q_id, 'Penjaminan kredit dan/atau pinjaman program kemitraan yang disalurkan oleh BUMN dalam rangka PKBL', FALSE),
    (q_id, 'Pemberian jasa konsultasi manajemen terkait kegiatan penjaminan', TRUE);

  -- =========================================================================
  -- Bank Soal Penjaminan — Laporan Periodik (15 soal)
  -- Answer key (confirmed): D, B, D, C, B, D, D, A, C, D, A, A, C, B, A
  -- =========================================================================

  -- Soal 21 — Answer: D
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut ini jenis-jenis laporan yang disampaikan oleh perusahaan penjaminan kepada OJK, yaitu:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Laporan triwulanan dan laporan semesteran', FALSE),
    (q_id, 'Laporan keuangan tahunan audited dan Laporan triwulanan', FALSE),
    (q_id, 'Laporan triwulanan dan laporan semesteran dan laporan lainnya yang terkait dengan aksi korporasi (perubahan modal, perubahan pemegang saham, perubahan pengurus perusahaan)', FALSE),
    (q_id, 'Laporan keuangan bulanan, Laporan keuangan tahunan audited, dan Laporan lainnya yang terkait dengan aksi korporasi (perubahan modal, perubahan pemegang saham, perubahan pengurus perusahaan)', TRUE);

  -- Soal 22 — Answer: B
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Manakah komponen yang tercantum di format laporan penjaminan kredit pada laporan keuangan bulanan perusahaan penjaminan yang benar?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Produksi piutang pembiayaan dari awal tahun sampai tanggal laporan (periode) maupun nilai outstanding per tanggal laporan (posisi)', FALSE),
    (q_id, 'Dirinci berdasarkan jenis penjaminan, yaitu untuk usaha produktif dan non produktif', TRUE),
    (q_id, 'Dirinci berdasarkan jenis penerima pinjaman', FALSE),
    (q_id, 'Dirinci berdasarkan jenis penerima penjaminan, yaitu untuk lembaga keuangan bank dan non bank', FALSE);

  -- Soal 23 — Answer: D
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa nilai rasio penjaminan usaha produktif terhadap total penjaminan perusahaan penjaminan sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Minimum 30%', FALSE),
    (q_id, 'Maksimum 25%', FALSE),
    (q_id, 'Minimum 150%', FALSE),
    (q_id, 'Minimum 25%', TRUE);

  -- Soal 24 — Answer: C
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa nilai rasio likuiditas perusahaan penjaminan sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Minimum 30%', FALSE),
    (q_id, 'Maksimum 25%', FALSE),
    (q_id, 'Minimum 120%', TRUE),
    (q_id, 'Minimum 25%', FALSE);

  -- Soal 25 — Answer: B
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa nilai gearing ratio untuk usaha produktif perusahaan penjaminan sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Minimum 30 kali', FALSE),
    (q_id, 'Maksimum 20 kali', TRUE),
    (q_id, 'Minimum 20 kali', FALSE),
    (q_id, 'Maksimum 40 kali', FALSE);

  -- Soal 26 — Answer: D
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa nilai total gearing ratio perusahaan penjaminan sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Minimum 30 kali', FALSE),
    (q_id, 'Maksimum 20 kali', FALSE),
    (q_id, 'Minimum 20 kali', FALSE),
    (q_id, 'Maksimum 40 kali', TRUE);

  -- Soal 27 — Answer: D
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa nilai rasio cadangan umum perusahaan penjaminan sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Minimum 30%', FALSE),
    (q_id, 'Maksimum 25%', FALSE),
    (q_id, 'Minimum 150%', FALSE),
    (q_id, 'Minimum 25%', TRUE);

  -- Soal 28 — Answer: A
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa jumlah nilai penempatan investasi perusahaan penjaminan pada investasi dalam bentuk SBN sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Maksimum 50% dari jumlah investasi', TRUE),
    (q_id, 'Maksimum 100% dari jumlah investasi', FALSE),
    (q_id, 'Minimum 25% dari jumlah investasi', FALSE),
    (q_id, 'Maksimum 25% dari jumlah investasi', FALSE);

  -- Soal 29 — Answer: C
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa jumlah nilai penempatan investasi perusahaan penjaminan pada investasi dalam bentuk Reksadana dan/atau reksadana syariah sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Maksimum 15% dari jumlah investasi per manajemen investasi, dan maksimum 20% untuk keseluruhan penempatan dalam bentuk Reksadana dan/atau reksadana Syariah terhadap total investasi', FALSE),
    (q_id, 'Maksimum 25% dari jumlah investasi per manajemen investasi, dan maksimum 20% untuk keseluruhan penempatan dalam bentuk Reksadana dan/atau reksadana Syariah terhadap total investasi', FALSE),
    (q_id, 'Maksimum 5% dari jumlah investasi per manajemen investasi, dan maksimum 20% untuk keseluruhan penempatan dalam bentuk Reksadana dan/atau reksadana Syariah terhadap total investasi', TRUE),
    (q_id, 'Maksimum 5% dari jumlah investasi per manajemen investasi, dan maksimum 25% untuk keseluruhan penempatan dalam bentuk Reksadana dan/atau reksadana Syariah terhadap total investasi', FALSE);

  -- Soal 30 — Answer: D
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Apa tujuan dilakukan analisis aspek kegiatan usaha?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengetahui nilai pinjaman yang disalurkan oleh perusahaan penjaminan pada periode laporan', FALSE),
    (q_id, 'Membandingkan nilai pendapatan investasi pada periode laporan dengan periode sebelumnya, baik secara year on year, year to date, maupun month to month', FALSE),
    (q_id, 'Mengetahui nilai laba/rugi perusahaan penjaminan pada periode laporan', FALSE),
    (q_id, 'Mengetahui nilai penjaminan yang disalurkan oleh perusahaan penjaminan pada periode laporan', TRUE);

  -- Soal 31 — Answer: A
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Apa ketentuan yang mengatur pengukuran tingkat Kesehatan keuangan lembaga penjamin?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'SE OJK Nomor 18 Tahun 2018 Tentang Kesehatan Keuangan Lembaga Penjamin', TRUE),
    (q_id, 'SE OJK Nomor 18 Tahun 2019 Tentang Kesehatan Keuangan Lembaga Penjamin', FALSE),
    (q_id, 'SE OJK Nomor 15 Tahun 2019 Tentang Kesehatan Keuangan Lembaga Penjamin', FALSE),
    (q_id, 'SE OJK Nomor 18 Tahun 2020 Tentang Kesehatan Keuangan Lembaga Penjamin', FALSE);

  -- Soal 32 — Answer: A
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Apa saja komponen yang digunakan sebagai acuan dalam mengukur tingkat Kesehatan keuangan lembaga penjamin?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rasio likuiditas, Gearing Ratio, Rentabilitas, Self assessment penerapan tata Kelola perusahaan yang baik', TRUE),
    (q_id, 'Rasio NPG (Non Performing Guarantee), Gearing Ratio, Rentabilitas, Self assessment penerapan tata Kelola perusahaan yang baik', FALSE),
    (q_id, 'BOPO (Beban Operasional terhadap Pendapatan Operasional), Rasio klaim terhadap Imbal Jasa Penjaminan, Rentabilitas, Self assessment penerapan tata Kelola perusahaan yang baik', FALSE),
    (q_id, 'Rasio likuiditas, ROI (Return On Investment), ROA (Return On Asset), Rasio NPG', FALSE);

  -- Soal 33 — Answer: C
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Apa saja komponen rentabilitas yang dihitung dalam pengukuran tingkat kesehatan keuangan lembaga penjamin?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'ROA (Return On Asset), ROI (Return On Investment), Rasio NPG (Non Performing Guarantee)', FALSE),
    (q_id, 'BOPO (Beban Operasional terhadap Pendapatan Operasional), ROI (Return On Investment), Rasio NPG (Non Performing Guarantee)', FALSE),
    (q_id, 'ROA (Return On Asset), BOPO (Beban Operasional terhadap Pendapatan Operasional), Rasio klaim terhadap Imbal Jasa Penjaminan', TRUE),
    (q_id, 'ROI (Return On Investment), BOPO (Beban Operasional terhadap Pendapatan Operasional), Rasio klaim terhadap Imbal Jasa Penjaminan', FALSE);

  -- Soal 34 — Answer: B
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa nilai bobot masing-masing komponen dalam pengukuran komposit tingkat kesehatan keuangan lembaga penjamin?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rasio likuiditas = 20%, Gearing Ratio = 30%, Rentabilitas = 30%, Self assessment penerapan tata Kelola perusahaan yang baik = 20%', FALSE),
    (q_id, 'Rasio likuiditas = 10%, Gearing Ratio = 35%, Rentabilitas = 35%, Self assessment penerapan tata Kelola perusahaan yang baik = 20%', TRUE),
    (q_id, 'Rasio likuiditas = 15%, Gearing Ratio = 35%, Rentabilitas = 35%, Self assessment penerapan tata Kelola perusahaan yang baik = 15%', FALSE),
    (q_id, 'Rasio likuiditas = 10%, Gearing Ratio = 30%, Rentabilitas = 30%, Self assessment penerapan tata Kelola perusahaan yang baik = 30%', FALSE);

  -- Soal 35 — Answer: A
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berdasarkan nilai komposit kesehatan keuangan lembaga penjamin sebagaimana SE OJK Nomor 18 Tahun 2018 Tentang Kesehatan Keuangan Lembaga Penjamin, lembaga penjamin dikatakan sangat sehat apabila:',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Lembaga penjamin memiliki nilai kesehatan keuangan dari 1 (satu) sampai dengan kurang dari 1,8 (satu koma delapan)', TRUE),
    (q_id, 'Lembaga penjamin memiliki nilai kesehatan keuangan dari 1,8 (satu koma delapan) sampai dengan kurang dari 2,6 (dua koma enam)', FALSE),
    (q_id, 'Lembaga penjamin memiliki nilai kesehatan keuangan dari 2,6 (dua koma enam) sampai dengan kurang dari 3,4 (tiga koma empat)', FALSE),
    (q_id, 'Lembaga penjamin memiliki nilai kesehatan keuangan dari 3,4 (tiga koma empat) sampai dengan kurang dari 4,2 (empat koma dua)', FALSE);

END $$;
