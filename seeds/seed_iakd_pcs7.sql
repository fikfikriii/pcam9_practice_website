-- seed_iakd.sql
-- Source: Kisi-Kisi IAKD_rev.docx (PCS 7, Juni 2024) — Sesi 1–4
-- Type 1: original options from Sesi 3 (15 questions)
-- Type 2: questions rewired from Sesi 1, 2 & 4 — options authored here (35 questions)
-- source = 'pcs7'

DO $$
DECLARE
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN

  -- Insert section (idempotent)
  SELECT id INTO sec_id FROM sections WHERE title = 'IAKD';

  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position)
    VALUES ('IAKD', sec_pos)
    RETURNING id INTO sec_id;
  END IF;

  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- =========================================================================
  -- SESI 3 — Pengawasan (Type 1: original multiple-choice options)
  -- =========================================================================

  -- Soal 1
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa jumlah aset kripto yang diperbolehkan untuk diperdagangkan di Indonesia, serta berapa jumlah yang bersifat global dan lokal?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '506 aset kripto: 502 global dan 4 lokal',  FALSE),
    (q_id, '542 aset kripto: 520 global dan 22 lokal', FALSE),
    (q_id, '545 aset kripto: 506 global dan 39 lokal', TRUE),
    (q_id, '545 aset kripto: 510 global dan 35 lokal', FALSE);

  -- Soal 2
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Manakah yang TIDAK termasuk dalam ekosistem aset kripto di Indonesia?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Bursa Berjangka Penyelenggara Perdagangan Aset Kripto', FALSE),
    (q_id, 'Lembaga Kliring Berjangka',                             FALSE),
    (q_id, 'Lembaga Pengawas Kegiatan Penawaran Komoditas Berjangka', TRUE),
    (q_id, 'Pedagang Fisik Aset Kripto',                            FALSE);

  -- Soal 3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dari keempat jenis aset kripto yang dikenal secara global, jenis mana yang tidak memiliki underlying asset berupa aset fisik maupun uang fiat?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Utility Token',                TRUE),
    (q_id, 'Security Token',               FALSE),
    (q_id, 'Stablecoin',                   FALSE),
    (q_id, 'Central Bank Digital Currency', FALSE);

  -- Soal 4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Manakah yang merupakan ciri-ciri dari transaksi yang dilakukan di dalam blockchain?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tidak dapat diubah',           TRUE),
    (q_id, 'Tidak dapat dipindahkan',      FALSE),
    (q_id, 'Tidak dapat diperjualbelikan', FALSE),
    (q_id, 'Tidak dapat diperdagangkan',   FALSE);

  -- Soal 5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam transaksi aset kripto, siapa yang menerbitkan order book?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Lembaga Kliring Berjangka',  FALSE),
    (q_id, 'Lembaga Kustodian',          FALSE),
    (q_id, 'Bank Penyedia Dana Margin',  FALSE),
    (q_id, 'Pedagang Fisik Aset Kripto', TRUE);

  -- Soal 6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Lembaga yang bertugas menyimpan aset kripto milik pedagang fisik aset kripto dan investor adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kustodian',                    TRUE),
    (q_id, 'Kliring Berjangka',            FALSE),
    (q_id, 'Penyedia Jasa Pembayaran',     FALSE),
    (q_id, 'Bank Penyimpanan Dana Margin', FALSE);

  -- Soal 7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut ini yang merupakan potensi pemanfaatan blockchain dan teknologi aset kripto di sektor keuangan adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Blockchain dapat dimanfaatkan untuk transaksi yang sifatnya rahasia',                    FALSE),
    (q_id, 'Pemanfaatan blockchain dapat mempercepat transaksi dan mempermudah pelacakan transaksi', TRUE),
    (q_id, 'Aset kripto dapat meningkatkan kekayaan investornya secara pasti',                       FALSE),
    (q_id, 'Blockchain dapat meningkatkan pemasaran produk dan layanan keuangan',                    FALSE);

  -- Soal 8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Manakah yang merupakan risiko utama dari aset kripto?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aset kripto merupakan aset yang pasti menghasilkan keuntungan', FALSE),
    (q_id, 'Aset kripto dikembangkan di luar negeri',                       FALSE),
    (q_id, 'Aset kripto tidak berwujud',                                    FALSE),
    (q_id, 'Harga aset kripto sangat volatile',                             TRUE);

  -- Soal 9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Manakah yang BUKAN merupakan fungsi dari Pedagang Fisik Aset Kripto (PFAK)?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Sebagai platform penyedia layanan perdagangan aset kripto',              FALSE),
    (q_id, 'Sebagai platform yang memfasilitasi transaksi jual beli aset kripto',    FALSE),
    (q_id, 'Sebagai platform yang memfasilitasi tukar menukar aset kripto dengan uang fiat', FALSE),
    (q_id, 'Sebagai platform yang memberikan tambahan dana kepada investor',         TRUE);

  -- Soal 10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Manakah yang BUKAN merupakan fungsi dari Lembaga Kliring Berjangka aset kripto?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menerbitkan order book bagi pelanggan aset kripto',          TRUE),
    (q_id, 'Melakukan pencatatan dana milik pedagang aset kripto',       FALSE),
    (q_id, 'Sebagai tempat pelaksanaan settlement transaksi aset kripto', FALSE),
    (q_id, 'Pemegang master account rekening pedagang aset kripto',      FALSE);

  -- Soal 11
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Salah satu jenis exchange dalam ekosistem aset kripto yang karakteristiknya tidak transparan dan belum diatur secara ketat disebut...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Centralized Exchange',   FALSE),
    (q_id, 'Decentralized Exchange', TRUE),
    (q_id, 'Dark Pool Exchange',     FALSE),
    (q_id, 'Anonymous Exchange',     FALSE);

  -- Soal 12
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Jenis aset kripto yang memiliki nilai relatif lebih stabil dibandingkan aset kripto lainnya adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Stablecoin',    TRUE),
    (q_id, 'Utility Token', FALSE),
    (q_id, 'Monero',        FALSE),
    (q_id, 'Ripple',        FALSE);

  -- Soal 13
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Teknik melakukan validasi transaksi di suatu blockchain disebut dengan...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Immutable', FALSE),
    (q_id, 'Traceable', FALSE),
    (q_id, 'Mining',    TRUE),
    (q_id, 'Fork',      FALSE);

  -- Soal 14
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Definisi aset kripto yang paling tepat sesuai ketentuan yang berlaku adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aset Berwujud berbasis teknologi buku besar yang secara fisik diperdagangkan oleh Pedagang Fisik Aset Kripto terdaftar di Bappebti', FALSE),
    (q_id, 'Aset Tidak Berwujud yang berbentuk aset digital, menggunakan kriptografi, jaringan peer-to-peer, dan buku besar yang terdistribusi, untuk mengatur penciptaan unit baru, memverifikasi transaksi, dan mengamankan transaksi tanpa campur tangan pihak lain', TRUE),
    (q_id, 'Aset Digital yang dapat diperdagangkan dan diserahterimakan antar pihak dengan bantuan teknologi blockchain, serta dapat dipakai sebagai pengganti mata uang', FALSE),
    (q_id, 'Aset Digital yang dikembangkan oleh DAO untuk kepentingan organisasi tertutup dan tidak membutuhkan lembaga pemerintah', FALSE);

  -- Soal 15
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Calon Pedagang Fisik Aset Kripto diperbolehkan untuk menjual aset kripto kepada...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Investor retail saja',           FALSE),
    (q_id, 'Investor non-retail saja',       FALSE),
    (q_id, 'Investor retail dan non-retail', TRUE),
    (q_id, 'Sophisticated investor saja',    FALSE);

  -- =========================================================================
  -- SESI 1 — Perizinan (Type 2: options authored)
  -- =========================================================================

  -- Soal 16
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Peraturan OJK yang mengatur Penyelenggaraan Inovasi Teknologi Sektor Keuangan (ITSK) adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'POJK 13/2018 tentang Penyelenggara Inovasi Keuangan Digital',                   FALSE),
    (q_id, 'POJK 3/2024 tentang Penyelenggaraan Inovasi Teknologi Sektor Keuangan',         TRUE),
    (q_id, 'POJK 22/2023 tentang Perlindungan Konsumen di Sektor Jasa Keuangan',            FALSE),
    (q_id, 'POJK 77/2016 tentang Layanan Pinjam Meminjam Uang Berbasis Teknologi Informasi', FALSE);

  -- Soal 17
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Kapan pemindahan kewenangan pengawasan aset kripto dari BAPPEBTI ke OJK dilaksanakan?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '1 Januari 2024',     FALSE),
    (q_id, '12 Januari 2023',    FALSE),
    (q_id, '10 Januari 2025',    TRUE),
    (q_id, '1 Maret 2025',       FALSE);

  -- Soal 18
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Apa fungsi utama Regulatory Sandbox dalam kerangka ITSK?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Memberikan izin usaha penuh kepada penyelenggara ITSK yang memenuhi syarat modal minimum',  FALSE),
    (q_id, 'Memastikan inovasi teknologi keuangan dikembangkan secara bertanggung jawab',               TRUE),
    (q_id, 'Menentukan tarif layanan keuangan digital yang diperbolehkan beroperasi di Indonesia',      FALSE),
    (q_id, 'Melakukan audit tahunan terhadap seluruh penyelenggara ITSK yang telah terdaftar',         FALSE);

  -- Soal 19
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa lama maksimal periode uji coba dalam Regulatory Sandbox ITSK?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '6 bulan',  FALSE),
    (q_id, '1 tahun',  TRUE),
    (q_id, '18 bulan', FALSE),
    (q_id, '2 tahun',  FALSE);

  -- Soal 20
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Setelah dinyatakan lulus dari Regulatory Sandbox, berapa lama batas waktu pengajuan pendaftaran izin usaha?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '1 bulan',  FALSE),
    (q_id, '3 bulan',  FALSE),
    (q_id, '6 bulan',  TRUE),
    (q_id, '12 bulan', FALSE);

  -- Soal 21
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut ini yang BUKAN merupakan kriteria kelayakan untuk mengikuti Regulatory Sandbox ITSK adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Termasuk dalam ruang lingkup sektor jasa keuangan',                              FALSE),
    (q_id, 'Mengandung unsur kebaruan dalam model bisnis atau teknologi',                    FALSE),
    (q_id, 'Telah memperoleh izin usaha penuh dari OJK sebelum mendaftar sandbox',          TRUE),
    (q_id, 'Siap untuk dilakukan pengujian dan pengembangan inovasi',                       FALSE);

  -- Soal 22
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Kapan batas waktu penyampaian laporan akhir Regulatory Sandbox ITSK?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Paling lambat 5 hari kerja sebelum jangka waktu sandbox berakhir',   FALSE),
    (q_id, 'Paling lambat 10 hari kerja sebelum jangka waktu sandbox berakhir',  FALSE),
    (q_id, 'Paling lambat 20 hari sebelum jangka waktu sandbox berakhir',        TRUE),
    (q_id, 'Paling lambat 30 hari sebelum jangka waktu sandbox berakhir',        FALSE);

  -- Soal 23
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Manakah urutan tahapan Regulatory Sandbox ITSK yang benar?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penilaian → Permohonan → Persetujuan/Penolakan → Uji Coba & Pengembangan → Penetapan Hasil',        FALSE),
    (q_id, 'Permohonan → Penilaian → Persetujuan/Penolakan → Uji Coba & Pengembangan → Penetapan Hasil',        TRUE),
    (q_id, 'Permohonan → Persetujuan/Penolakan → Penilaian → Uji Coba & Pengembangan → Penetapan Hasil',        FALSE),
    (q_id, 'Permohonan → Penilaian → Uji Coba & Pengembangan → Persetujuan/Penolakan → Penetapan Hasil',        FALSE);

  -- Soal 24
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Aspek dokumen yang diperlukan dalam pengajuan permohonan Regulatory Sandbox ITSK meliputi...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Hanya dokumen kelembagaan dan tata kelola',                                              FALSE),
    (q_id, 'Kelembagaan & tata kelola, model bisnis, teknologi informasi, dan kemitraan',            TRUE),
    (q_id, 'Laporan keuangan audited 2 tahun terakhir dan rencana bisnis 5 tahun ke depan',          FALSE),
    (q_id, 'Formulir permohonan dan surat pernyataan bermaterai saja',                               FALSE);

  -- Soal 25
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Sumber data yang digunakan dalam layanan Innovative Credit Scoring (ICS) berasal dari...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Hanya data dari SLIK OJK',                                                      FALSE),
    (q_id, 'Data telekomunikasi, e-commerce, dan sumber data alternatif lain di luar SLIK',  TRUE),
    (q_id, 'Data perbankan dan laporan keuangan yang diaudit',                               FALSE),
    (q_id, 'Data kependudukan dari Dukcapil dan data perpajakan dari DJP',                  FALSE);

  -- Soal 26
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Apakah sudah ada ketentuan modal minimum bagi penyelenggara ITSK yang terdaftar?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Ya, modal minimum Rp 1 miliar',   FALSE),
    (q_id, 'Ya, modal minimum Rp 2,5 miliar', FALSE),
    (q_id, 'Ya, modal minimum Rp 5 miliar',   FALSE),
    (q_id, 'Belum ada ketentuan modal minimum', TRUE);

  -- Soal 27
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Peta Jalan (Roadmap) Penguatan dan Pengembangan ITSK, Aset Keuangan Digital dan Aset Kripto 2024–2028 memiliki berapa pilar utama?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '3 pilar', FALSE),
    (q_id, '4 pilar', TRUE),
    (q_id, '5 pilar', FALSE),
    (q_id, '6 pilar', FALSE);

  -- Soal 28
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'SEOJK nomor berapa yang mengatur tentang Mekanisme Ruang Uji Coba Inovasi Teknologi Sektor Keuangan?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'SEOJK 3/2024', FALSE),
    (q_id, 'SEOJK 5/2024', TRUE),
    (q_id, 'SEOJK 6/2024', FALSE),
    (q_id, 'SEOJK 8/2024', FALSE);

  -- =========================================================================
  -- SESI 2 — Pengaturan (Type 2: options authored)
  -- =========================================================================

  -- Soal 29
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Mandat OJK untuk mengatur dan mengawasi sektor IAKD tertuang dalam...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'UU No. 21 Tahun 2011 tentang Otoritas Jasa Keuangan',                           FALSE),
    (q_id, 'UU No. 4 Tahun 2023 tentang Pengembangan dan Penguatan Sektor Keuangan (P2SK)', TRUE),
    (q_id, 'UU No. 7 Tahun 1992 tentang Perbankan sebagaimana telah diubah',                FALSE),
    (q_id, 'UU No. 8 Tahun 1995 tentang Pasar Modal',                                       FALSE);

  -- Soal 30
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Kepanjangan dari ITSK adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Inovasi Teknologi Sistem Keuangan',     FALSE),
    (q_id, 'Inovasi Teknologi Sektor Keuangan',     TRUE),
    (q_id, 'Institusi Teknologi Sistem Keuangan',   FALSE),
    (q_id, 'Integrasi Teknologi Sektor Keuangan',   FALSE);

  -- Soal 31
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Hal utama yang perlu diperhatikan investor sebelum membeli aset kripto adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rating dari lembaga pemeringkat kredit internasional',  FALSE),
    (q_id, 'Whitepaper dari aset kripto yang bersangkutan',         TRUE),
    (q_id, 'Rekomendasi dari komunitas media sosial',               FALSE),
    (q_id, 'Historis harga dalam 1 tahun terakhir',                 FALSE);

  -- Soal 32
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'ITSK memberikan dampak pada ekosistem keuangan digital dalam hal...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Hanya pada produk dan layanan keuangan konvensional',          FALSE),
    (q_id, 'Produk, aktivitas, layanan, dan model bisnis keuangan digital', TRUE),
    (q_id, 'Regulasi dan pengawasan perbankan nasional',                    FALSE),
    (q_id, 'Infrastruktur teknologi dan keamanan data pemerintah',          FALSE);

  -- Soal 33
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pernyataan yang benar mengenai durasi pelaksanaan uji coba dalam Regulatory Sandbox ITSK adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Dilaksanakan selama tepat 1 tahun penuh tanpa pengecualian',                                                         FALSE),
    (q_id, 'Dilaksanakan selama maksimal 1 tahun dan dapat berakhir lebih cepat apabila peserta dinyatakan lulus atau tidak lulus', TRUE),
    (q_id, 'Dilaksanakan selama minimal 1 tahun dan dapat diperpanjang tanpa batas',                                             FALSE),
    (q_id, 'Tidak ada batasan durasi — bergantung kesiapan penyelenggara',                                                       FALSE);

  -- Soal 34
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Siapakah Kepala Eksekutif IAKD OJK berdasarkan materi PCS 7 Juni 2024?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Friderica Widyasari Dewi', FALSE),
    (q_id, 'Hassan Fawzi',             TRUE),
    (q_id, 'Dian Ediana Rae',          FALSE),
    (q_id, 'Hasan Zein Mahmud',        FALSE);

  -- Soal 35
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut ini adalah jenis coin kripto, KECUALI...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Utility Token',  FALSE),
    (q_id, 'Stablecoin',     FALSE),
    (q_id, 'Security Token', FALSE),
    (q_id, 'Cryptarithm',    TRUE);

  -- =========================================================================
  -- SESI 4 — Pengawasan Digital & Pemeringkat Kredit (Type 2: options authored)
  -- =========================================================================

  -- Soal 36
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'UU Pengembangan dan Penguatan Sektor Keuangan (UU P2SK) adalah UU nomor berapa dan ditetapkan tanggal berapa?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'UU No. 3 Tahun 2023, tanggal 10 Januari 2023',   FALSE),
    (q_id, 'UU No. 4 Tahun 2023, tanggal 12 Januari 2023',   TRUE),
    (q_id, 'UU No. 4 Tahun 2024, tanggal 12 Februari 2024',  FALSE),
    (q_id, 'UU No. 5 Tahun 2023, tanggal 15 Maret 2023',     FALSE);

  -- Soal 37
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa jenis laporan yang wajib disampaikan penyelenggara ITSK berdasarkan POJK 3/2024?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '2 jenis (Laporan Berkala dan Insidentil)',                                          FALSE),
    (q_id, '3 jenis (Laporan Bulanan, Tahunan, dan Insidentil)',                               FALSE),
    (q_id, '4 jenis (Laporan Bulanan, Tahunan, Evaluasi Mandiri, dan Insidentil)',             TRUE),
    (q_id, '5 jenis (Laporan Bulanan, Triwulanan, Tahunan, Evaluasi Mandiri, dan Insidentil)', FALSE);

  -- Soal 38
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Siklus pengawasan ITSK terdiri dari berapa tahap?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '3 tahap', FALSE),
    (q_id, '4 tahap', FALSE),
    (q_id, '5 tahap', TRUE),
    (q_id, '6 tahap', FALSE);

  -- Soal 39
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Batas waktu penyampaian laporan bulanan penyelenggara ITSK adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Paling lambat 5 hari kerja setelah periode bulan pelaporan',   FALSE),
    (q_id, 'Paling lambat 10 hari kerja setelah periode bulan pelaporan',  TRUE),
    (q_id, 'Paling lambat 14 hari kerja setelah periode bulan pelaporan',  FALSE),
    (q_id, 'Paling lambat 30 hari kalender setelah periode bulan pelaporan', FALSE);

  -- Soal 40
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Laporan tahunan penyelenggara ITSK disampaikan paling lambat pada...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '31 Maret tahun berikutnya',      FALSE),
    (q_id, '30 April tahun berikutnya',       TRUE),
    (q_id, '30 Juni tahun berikutnya',        FALSE),
    (q_id, '31 Desember tahun yang berjalan', FALSE);

  -- Soal 41
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Apabila penyelenggara ITSK melakukan perubahan model bisnis, kewajiban yang harus dipenuhi adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengajukan permohonan izin usaha baru dari awal',                                                 FALSE),
    (q_id, 'Melaporkan model bisnis terbaru disertai dokumen pendukungnya kepada OJK',                        TRUE),
    (q_id, 'Menghentikan kegiatan usaha sementara hingga persetujuan model bisnis baru diterbitkan',          FALSE),
    (q_id, 'Memberitahukan perubahan melalui email ke OJK tanpa perlu melampirkan dokumen apapun',           FALSE);

  -- Soal 42
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut ini yang BUKAN merupakan alasan mengapa ITSK perlu diawasi adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengedepankan perlindungan konsumen',                                               FALSE),
    (q_id, 'Memfasilitasi pengembangan infrastruktur digital yang efektif dan efisien',         FALSE),
    (q_id, 'Mendorong peningkatan penerimaan pajak dari sektor keuangan digital',               TRUE),
    (q_id, 'Mendukung inovasi yang bertanggung jawab',                                          FALSE);

  -- Soal 43
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut ini yang BUKAN merupakan contoh laporan insidentil penyelenggara ITSK adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Laporan terkait insiden keamanan siber yang mempengaruhi layanan',     FALSE),
    (q_id, 'Laporan terkait perubahan kepemilikan signifikan penyelenggara',       FALSE),
    (q_id, 'Laporan terkait gangguan sistem yang berdampak pada pengguna',         FALSE),
    (q_id, 'Laporan rencana bisnis tahunan',                                        TRUE);

  -- Soal 44
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Aspek pengawasan ITSK yang diatur dalam POJK 3/2024 mencakup hal berikut, KECUALI...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tata Kelola',                         FALSE),
    (q_id, 'Manajemen Risiko',                    FALSE),
    (q_id, 'ITE, Keamanan, dan Ketahanan Siber',  FALSE),
    (q_id, 'Likuidasi',                            TRUE);

  -- Soal 45
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pengawasan ITSK secara tidak langsung (off-site) diawali dengan...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Melakukan pemeriksaan langsung ke lokasi penyelenggara ITSK',                                      FALSE),
    (q_id, 'Analisis laporan berkala dan/atau insidentil yang disampaikan oleh penyelenggara ITSK',            TRUE),
    (q_id, 'Melakukan wawancara langsung dengan direksi penyelenggara ITSK',                                   FALSE),
    (q_id, 'Mengirim tim auditor untuk memeriksa sistem teknologi informasi penyelenggara',                    FALSE);

  -- Soal 46
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Tugas pokok Departemen Pengawasan ITSK OJK mencakup semua hal berikut, KECUALI...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Melakukan pengawasan tidak langsung (off-site) terhadap penyelenggara ITSK',  FALSE),
    (q_id, 'Melakukan pengawasan langsung (on-site) terhadap penyelenggara ITSK',         FALSE),
    (q_id, 'Memberikan perizinan kepada calon penyelenggara ITSK',                        TRUE),
    (q_id, 'Melakukan tindak lanjut dan rekomendasi atas hasil pengawasan',               FALSE);

  -- Soal 47
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'SEOJK Nomor 7 Tahun 2024 mengatur tentang...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mekanisme Ruang Uji Coba Inovasi Teknologi Sektor Keuangan',    FALSE),
    (q_id, 'Pendaftaran Penyelenggara Inovasi Teknologi Sektor Keuangan',   FALSE),
    (q_id, 'Pelaporan Penyelenggara Inovasi Teknologi Sektor Keuangan',     TRUE),
    (q_id, 'Asosiasi Penyelenggara Inovasi Teknologi Sektor Keuangan',      FALSE);

  -- Soal 48
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'POJK Nomor 13 Tahun 2018 mengatur tentang...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penyelenggaraan Inovasi Teknologi Sektor Keuangan',  FALSE),
    (q_id, 'Penyelenggara Inovasi Keuangan Digital',             TRUE),
    (q_id, 'Pengaturan Aset Kripto di Indonesia',                FALSE),
    (q_id, 'Layanan Pinjam Meminjam Uang Berbasis Teknologi',    FALSE);

  -- Soal 49
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dokumentasi hasil pengawasan ITSK akan dimuat dalam...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Laporan Tahunan OJK',               FALSE),
    (q_id, 'Kertas Kerja Pengawasan',            TRUE),
    (q_id, 'Laporan Berkala Penyelenggara',      FALSE),
    (q_id, 'Rencana Kerja Pengawasan Tahunan',   FALSE);

  -- =========================================================================
  -- SIKLUS PENGAWASAN — 5 tahap (Sesi 4 hint: "muncul 4 soal")
  -- =========================================================================

  -- Soal 50
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Tahap pertama dalam siklus pengawasan ITSK adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penilaian Peringkat Risiko',          FALSE),
    (q_id, 'Know Your Entity',                    TRUE),
    (q_id, 'Supervisory Plan',                    FALSE),
    (q_id, 'Tindakan Pengawasan',                 FALSE);

  -- Soal 51
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Yang dimaksud dengan tahap "Know Your Entity" dalam siklus pengawasan ITSK adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penetapan peringkat risiko komposit penyelenggara ITSK oleh OJK',                                                 FALSE),
    (q_id, 'Pemahaman terhadap faktor-faktor internal dan eksternal yang dapat mempengaruhi peringkat risiko komposit penyelenggara ITSK', TRUE),
    (q_id, 'Penyusunan rencana kegiatan dan strategi pengawasan tahunan',                                                     FALSE),
    (q_id, 'Pelaksanaan pemeriksaan langsung (on-site) ke lokasi penyelenggara ITSK',                                         FALSE);

  -- Soal 52
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam siklus pengawasan ITSK, Supervisory Plan adalah...',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pemeriksaan langsung (on-site) kepada penyelenggara ITSK yang berisiko tinggi',                                                     FALSE),
    (q_id, 'Penyusunan rencana kegiatan dan strategi pengawasan tahunan, mencakup pengawasan tidak langsung maupun langsung sesuai hasil penilaian risiko', TRUE),
    (q_id, 'Penetapan sanksi kepada penyelenggara yang melanggar ketentuan POJK 3/2024',                                                         FALSE),
    (q_id, 'Tindak lanjut atas rekomendasi pengawasan periode sebelumnya',                                                                       FALSE);

  -- Soal 53
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa lama periode siklus pengawasan ITSK yang lazim dilaksanakan?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '6 bulan',                    FALSE),
    (q_id, '1 tahun',                    TRUE),
    (q_id, '2 tahun',                    FALSE),
    (q_id, 'Tidak ada batasan waktu',    FALSE);

END $$;
