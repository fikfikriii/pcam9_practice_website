-- seed_laporan_keuangan.sql
-- Source: Soal Kuis Akuntansi.pdf (Hari Kedua & Ketiga)
-- Creates section 'Laporan Keuangan' and seeds 13 questions
-- source = 'original' (class quiz materials)

DO $$
DECLARE
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN
  SELECT id INTO sec_id FROM sections WHERE title = 'Laporan Keuangan';

  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session)
    VALUES ('Laporan Keuangan', sec_pos, 10)
    RETURNING id INTO sec_id;
  END IF;

  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- =========================================================================
  -- Hari Kedua — Penyusunan Laporan Keuangan
  -- =========================================================================

  -- Soal 1
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pos dalam laporan keuangan kecuali...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aset',      FALSE),
    (q_id, 'Liabilitas', FALSE),
    (q_id, 'Laba',      TRUE),
    (q_id, 'Ekuitas',   FALSE);

  -- Soal 2
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut merupakan pos laporan keuangan yang akan bertambah pada posisi kredit, kecuali...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Liabilitas',  FALSE),
    (q_id, 'Penghasilan', FALSE),
    (q_id, 'Beban',       TRUE),
    (q_id, 'Ekuitas',     FALSE);

  -- Soal 3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut merupakan pernyataan yang paling tepat tentang aset, kecuali...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aset bertambah ketika ekuitas bertambah',      FALSE),
    (q_id, 'Aset bertambah ketika utang bertambah',        FALSE),
    (q_id, 'Aset bertambah ketika beban bertambah',        TRUE),
    (q_id, 'Aset bertambah ketika penghasilan bertambah',  FALSE);

  -- Soal 4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut adalah transaksi yang akan diikuti oleh penyesuaian (jurnal penyesuaian) di akhir periode, kecuali...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pembelian aset tetap kendaraan',             FALSE),
    (q_id, 'Pendapatan diterima dimuka atas sewa',       FALSE),
    (q_id, 'Pembelian aset tetap tanah',                 TRUE),
    (q_id, 'Biaya dibayar dimuka atas sewa',             FALSE);

  -- Soal 5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Apabila Perusahaan melakukan penjualan barang senilai Rp 1.000 juta, tetapi uang yang diterima hanya sebesar Rp 800 juta, maka pernyataan dibawah yang paling tepat terkait transaksi ini adalah...',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perusahaan mencatat sisanya sebagai piutang usaha',                  TRUE),
    (q_id, 'Sisa penjualan sebesar Rp 200 juta tidak jadi dilakukan oleh perusahaan', FALSE),
    (q_id, 'Perusahaan mengembalikan uang sebesar Rp 800 juta yang diterima dari pelanggan', FALSE),
    (q_id, 'Penjualan sebenarnya hanya sebesar Rp 800 juta',                     FALSE);

  -- =========================================================================
  -- Hari Ketiga — Analisis Laporan Keuangan: Sesi 1
  -- =========================================================================

  -- Soal 6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Analisis kualitas laporan laba rugi yang paling tepat adalah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pendapatan (beban) yang berulang / aktivitas utama menghasilkan laba yang baik',          TRUE),
    (q_id, 'Pendapatan (beban) yang tidak berulang / bukan aktivitas utama menghasilkan laba yang baik', FALSE),
    (q_id, 'Ekuitas bertambah karena saldo laba lebih bagus',                                          FALSE),
    (q_id, 'Ekuitas bertambah karena modal saham akan lebih bagus',                                   FALSE);

  -- Soal 7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Analisis kualitas laporan perubahan ekuitas yang paling tepat adalah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pendapatan (beban) yang berulang / aktivitas utama menghasilkan laba yang baik',          FALSE),
    (q_id, 'Pendapatan (beban) yang tidak berulang / bukan aktivitas utama menghasilkan laba yang baik', FALSE),
    (q_id, 'Ekuitas bertambah karena saldo laba lebih bagus',                                          TRUE),
    (q_id, 'Ekuitas bertambah karena modal saham akan lebih bagus',                                   FALSE);

  -- Soal 8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Analisis kualitas laporan posisi keuangan yang paling tepat adalah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aset naik karena liabilitas lebih baik daripada ekuitas', FALSE),
    (q_id, 'Aset naik karena ekuitas lebih baik daripada liabilitas', TRUE),
    (q_id, 'Ekuitas bertambah, akan lebih baik jika berasal dari saldo laba',  FALSE),
    (q_id, 'Ekuitas bertambah, akan lebih baik jika berasal dari modal saham', FALSE);

  -- Soal 9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut merupakan analisis kualitas laporan arus kas yang paling tepat adalah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aktivitas investasi positif lebih baik dibandingkan negatif',  FALSE),
    (q_id, 'Aktivitas pendanaan positif lebih baik dibandingkan negatif',  FALSE),
    (q_id, 'Aktivitas operasi negatif lebih baik dibandingkan negatif',    FALSE),
    (q_id, 'Aktivitas operasi positif lebih baik dibandingkan negatif',    TRUE);

  -- =========================================================================
  -- Hari Ketiga — Analisis Laporan Keuangan: Sesi 2
  -- =========================================================================

  -- Soal 10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Tujuan dari analisis laporan keuangan, kecuali:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pengambilan keputusan',                                  FALSE),
    (q_id, 'Evaluasi kinerja dan posisi keuangan masa lalu',         FALSE),
    (q_id, 'Pelengkap laporan keuangan',                             TRUE),
    (q_id, 'Estimasi kinerja dan posisi keuangan masa depan',        FALSE);

  -- Soal 11
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Cakupan dalam analisis laporan keuangan yang benar, kecuali:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Efektivitas',   TRUE),
    (q_id, 'Likuiditas',    FALSE),
    (q_id, 'Solvabilitas',  FALSE),
    (q_id, 'Profitabilitas', FALSE);

  -- Soal 12
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Rasio yang menggunakan pos antar laporan keuangan:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Account receivable turnover', TRUE),
    (q_id, 'Quick ratio',                 FALSE),
    (q_id, 'Debt to equity ratio',        FALSE),
    (q_id, 'EBIT ratio',                  FALSE);

  -- Soal 13
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Yang bukan termasuk dalam rasio profitabilitas, adalah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Gross profit margin',        FALSE),
    (q_id, 'Operating profit margin',    FALSE),
    (q_id, 'Earning before tax margin',  FALSE),
    (q_id, 'Profit sharing margin',      TRUE);

  -- Soal 14
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Jika suatu Perusahaan membeli barang dagang dengan rata-rata harga beli sebesar Rp 100.000, dan menjualnya dengan rata-rata harga jual Rp 200.000, maka berapa gross profit margin rasio-nya:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '200%',                  FALSE),
    (q_id, 'Tidak ada yang benar',  TRUE),
    (q_id, '100%',                  FALSE),
    (q_id, '75%',                   FALSE);

  -- Soal 15
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Average days inventory yang semakin kecil atau berkurang, artinya:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Jumlah hari yang diperlukan Perusahaan dalam menjual barang dagangannya semakin cepat',  TRUE),
    (q_id, 'Jumlah hari yang diperlukan Perusahaan dalam menjual barang dagangannya semakin lama',   FALSE),
    (q_id, 'Jumlah hari yang diperlukan Perusahaan dalam membeli barang dagangannya semakin cepat',  FALSE),
    (q_id, 'Jumlah hari yang diperlukan Perusahaan dalam membeli barang dagangannya semakin lama',   FALSE);

  -- Soal 16
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Diketahui Perusahaan A mempunyai Utang Bank sebesar Rp 200 juta dengan bunga sebesar 5% p.a dan Utang Usaha sebesar Rp 400 juta, dan Perusahaan B mempunyai Utang Bank sebesar Rp 0 dan Utang Usaha sebesar Rp 2 milyar, manakah pernyataan berikut yang benar:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perusahaan A akan mempunyai laba lebih besar daripada Perusahaan B dengan asumsi semua pendapatan dan beban selain terkait dengan rasio di atas adalah sama.', FALSE),
    (q_id, 'Perusahaan B akan mempunyai laba lebih besar daripada Perusahaan A dengan asumsi semua pendapatan dan beban selain terkait dengan rasio diatas adalah sama',    TRUE),
    (q_id, 'Perusahaan A akan mempunyai kinerja lebih baik karena utangnya lebih kecil',  FALSE),
    (q_id, 'Perusahaan B akan mempunyai kinerja lebih baik karena utangnya lebih besar',  FALSE);

  -- Soal 17
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Average collection period yang semakin besar atau bertambah, mencerminkan:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Jumlah hari yang diperlukan Perusahaan untuk melakukan penjualan kreditnya semakin lama',          FALSE),
    (q_id, 'Jumlah hari yang diperlukan Perusahaan untuk melakukan penjualan kreditnya semakin cepat',         FALSE),
    (q_id, 'Jumlah hari yang diperlukan Perusahaan untuk menagih piutang hasil penjualan kreditnya semakin lama',  TRUE),
    (q_id, 'Jumlah hari yang diperlukan Perusahaan untuk menagih piutang hasil penjualan kreditnya semakin cepat', FALSE);

END $$;
