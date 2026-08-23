CREATE TABLE IF NOT EXISTS sections (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  position INTEGER NOT NULL DEFAULT 0,
  draw_per_session INTEGER NOT NULL DEFAULT 10,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS questions (
  id SERIAL PRIMARY KEY,
  section_id INTEGER NOT NULL REFERENCES sections(id) ON DELETE CASCADE,
  text TEXT NOT NULL,
  position INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS choices (
  id SERIAL PRIMARY KEY,
  question_id INTEGER NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
  text TEXT NOT NULL,
  position INTEGER NOT NULL DEFAULT 0,
  is_correct BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE questions ADD COLUMN IF NOT EXISTS source VARCHAR(20) NOT NULL DEFAULT 'original';

DO $$
DECLARE
  s1 INTEGER; s2 INTEGER; s3 INTEGER;
  q  INTEGER;
BEGIN
  IF NOT EXISTS (SELECT 1 FROM sections LIMIT 1) THEN

    -- ─── Section 1: Akuntansi ───────────────────────────────────────────────
    INSERT INTO sections (title, position, draw_per_session)
    VALUES ('Akuntansi', 0, 10)
    RETURNING id INTO s1;

    -- Q1 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Manakah dari pernyataan berikut yang benar mengenai persamaan dasar akuntansi?', 0) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Aset = Kewajiban - Ekuitas', 0, FALSE),
      (q, 'Aset = Kewajiban + Ekuitas', 1, TRUE),
      (q, 'Ekuitas = Aset + Kewajiban', 2, FALSE),
      (q, 'Kewajiban = Aset + Ekuitas', 3, FALSE);

    -- Q2 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Sebuah perusahaan membeli perlengkapan kantor senilai Rp5.000.000 secara kredit. Bagaimana pencatatan jurnal yang benar?', 1) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Debit Kas Rp5.000.000, Kredit Perlengkapan Rp5.000.000', 0, FALSE),
      (q, 'Debit Utang Usaha Rp5.000.000, Kredit Perlengkapan Rp5.000.000', 1, FALSE),
      (q, 'Debit Perlengkapan Rp5.000.000, Kredit Kas Rp5.000.000', 2, FALSE),
      (q, 'Debit Perlengkapan Rp5.000.000, Kredit Utang Usaha Rp5.000.000', 3, TRUE);

    -- Q3 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Apa yang dimaksud dengan "going concern" dalam akuntansi?', 2) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Asumsi bahwa entitas akan terus beroperasi dalam jangka panjang', 0, TRUE),
      (q, 'Prinsip bahwa aset dicatat sebesar biaya historisnya', 1, FALSE),
      (q, 'Konsep bahwa pendapatan diakui saat kas diterima', 2, FALSE),
      (q, 'Asumsi bahwa nilai uang tetap stabil sepanjang waktu', 3, FALSE);

    -- Q4 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Metode penyusutan mana yang menghasilkan beban penyusutan paling besar pada tahun-tahun awal umur aset?', 3) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Garis lurus (Straight-line)', 0, FALSE),
      (q, 'Unit produksi', 1, FALSE),
      (q, 'Saldo menurun ganda (Double declining balance)', 2, TRUE),
      (q, 'Jumlah angka tahun (Sum of years digits)', 3, FALSE);

    -- Q5 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Dalam metode FIFO (First-In, First-Out), nilai persediaan akhir pada saat harga meningkat akan:', 4) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Lebih rendah dibandingkan metode LIFO', 0, FALSE),
      (q, 'Sama dengan metode LIFO', 1, FALSE),
      (q, 'Lebih tinggi dibandingkan metode LIFO', 2, TRUE),
      (q, 'Tidak dapat dibandingkan dengan metode LIFO', 3, FALSE);

    -- Q6 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Manakah dari berikut ini yang merupakan contoh biaya tetap (fixed cost)?', 5) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Beban sewa gedung tahunan', 0, TRUE),
      (q, 'Biaya bahan baku langsung', 1, FALSE),
      (q, 'Komisi penjualan per unit', 2, FALSE),
      (q, 'Biaya pengiriman per pesanan', 3, FALSE);

    -- Q7 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Piutang usaha (accounts receivable) diklasifikasikan dalam laporan posisi keuangan sebagai:', 6) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Aset tidak lancar', 0, FALSE),
      (q, 'Kewajiban lancar', 1, FALSE),
      (q, 'Ekuitas pemilik', 2, FALSE),
      (q, 'Aset lancar', 3, TRUE);

    -- Q8 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Apa yang dimaksud dengan "akrual" dalam akuntansi?', 7) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Pengakuan pendapatan/beban pada saat terjadi, bukan saat kas diterima/dibayar', 0, TRUE),
      (q, 'Pencatatan transaksi hanya saat kas berpindah tangan', 1, FALSE),
      (q, 'Metode pencatatan persediaan berdasarkan urutan masuk-keluar', 2, FALSE),
      (q, 'Proses menghitung nilai wajar aset pada akhir periode', 3, FALSE);

    -- Q9 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Jika sebuah perusahaan memiliki total aset Rp500 juta dan total kewajiban Rp200 juta, berapakah ekuitas pemegang sahamnya?', 8) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Rp700 juta', 0, FALSE),
      (q, 'Rp300 juta', 1, TRUE),
      (q, 'Rp200 juta', 2, FALSE),
      (q, 'Rp500 juta', 3, FALSE);

    -- Q10 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Manakah dari berikut ini yang BUKAN merupakan komponen laporan laba rugi?', 9) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Pendapatan penjualan', 0, FALSE),
      (q, 'Beban operasional', 1, FALSE),
      (q, 'Beban bunga', 2, FALSE),
      (q, 'Piutang usaha', 3, TRUE);

    -- Q11 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Metode akuntansi apa yang digunakan ketika perusahaan mencatat pendapatan hanya saat kas diterima dan beban hanya saat kas dibayarkan?', 10) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Basis kas (Cash basis)', 0, TRUE),
      (q, 'Basis akrual (Accrual basis)', 1, FALSE),
      (q, 'Basis campuran (Modified basis)', 2, FALSE),
      (q, 'Basis persediaan (Inventory basis)', 3, FALSE);

    -- Q12 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Dalam penyusunan laporan arus kas, pembayaran dividen tunai kepada pemegang saham diklasifikasikan sebagai:', 11) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Aktivitas operasi', 0, FALSE),
      (q, 'Aktivitas investasi', 1, FALSE),
      (q, 'Aktivitas pendanaan', 2, TRUE),
      (q, 'Aktivitas administrasi', 3, FALSE);

    -- Q13 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Apa yang dimaksud dengan "neraca saldo" (trial balance)?', 12) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Laporan keuangan yang menunjukkan posisi keuangan perusahaan', 0, FALSE),
      (q, 'Daftar semua transaksi yang terjadi dalam satu periode', 1, FALSE),
      (q, 'Catatan yang menunjukkan aliran kas masuk dan keluar', 2, FALSE),
      (q, 'Daftar semua akun dengan saldo debit dan kredit untuk memverifikasi keseimbangan', 3, TRUE);

    -- Q14 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Perusahaan menerima pembayaran uang muka dari pelanggan sebesar Rp10.000.000 untuk jasa yang belum diberikan. Jurnal yang benar adalah:', 13) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Debit Pendapatan Jasa Rp10.000.000, Kredit Kas Rp10.000.000', 0, FALSE),
      (q, 'Debit Kas Rp10.000.000, Kredit Piutang Usaha Rp10.000.000', 1, FALSE),
      (q, 'Debit Kas Rp10.000.000, Kredit Pendapatan Diterima Di Muka Rp10.000.000', 2, TRUE),
      (q, 'Debit Piutang Usaha Rp10.000.000, Kredit Pendapatan Jasa Rp10.000.000', 3, FALSE);

    -- Q15 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Apa yang dimaksud dengan "depresiasi" dalam akuntansi?', 14) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Kenaikan nilai aset dari waktu ke waktu', 0, FALSE),
      (q, 'Alokasi sistematis biaya aset tetap berwujud selama masa manfaatnya', 1, TRUE),
      (q, 'Penurunan nilai persediaan akibat kerusakan', 2, FALSE),
      (q, 'Penghapusan piutang tak tertagih', 3, FALSE);

    -- Q16 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Manakah dari berikut ini yang merupakan contoh aset tidak berwujud?', 15) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Hak paten dan merek dagang', 0, TRUE),
      (q, 'Gedung dan tanah', 1, FALSE),
      (q, 'Kas dan setara kas', 2, FALSE),
      (q, 'Persediaan barang dagangan', 3, FALSE);

    -- Q17 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Dalam laporan posisi keuangan, urutan penyajian aset lancar yang benar berdasarkan tingkat likuiditasnya adalah:', 16) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Persediaan, Piutang Usaha, Kas', 0, FALSE),
      (q, 'Piutang Usaha, Kas, Persediaan', 1, FALSE),
      (q, 'Persediaan, Kas, Piutang Usaha', 2, FALSE),
      (q, 'Kas, Piutang Usaha, Persediaan', 3, TRUE);

    -- Q18 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Jika perusahaan menggunakan metode garis lurus untuk menyusutkan mesin seharga Rp120.000.000 dengan nilai sisa Rp20.000.000 dan masa manfaat 10 tahun, berapakah beban penyusutan tahunannya?', 17) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Rp12.000.000', 0, FALSE),
      (q, 'Rp10.000.000', 1, TRUE),
      (q, 'Rp14.000.000', 2, FALSE),
      (q, 'Rp11.000.000', 3, FALSE);

    -- Q19 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Apa yang dimaksud dengan "konsep materialitas" dalam akuntansi?', 18) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Informasi dianggap material jika penghilangan atau kesalahannya dapat mempengaruhi keputusan pengguna laporan keuangan', 0, TRUE),
      (q, 'Semua transaksi, berapapun nilainya, harus dicatat secara terpisah', 1, FALSE),
      (q, 'Perusahaan harus mencatat aset pada nilai pasar terkini', 2, FALSE),
      (q, 'Laporan keuangan harus disusun setiap bulan tanpa terkecuali', 3, FALSE);

    -- Q20 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Laporan keuangan mana yang menunjukkan kinerja keuangan perusahaan selama satu periode tertentu?', 19) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Laporan posisi keuangan (neraca)', 0, FALSE),
      (q, 'Laporan arus kas', 1, FALSE),
      (q, 'Laporan perubahan ekuitas', 2, FALSE),
      (q, 'Laporan laba rugi komprehensif', 3, TRUE);

    -- Q21 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Sebuah perusahaan membeli kendaraan seharga Rp200.000.000 dengan membayar uang muka Rp50.000.000 dan sisanya melalui kredit bank. Bagaimana pencatatan yang benar?', 20) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Debit Kendaraan Rp200.000.000, Kredit Kas Rp200.000.000', 0, FALSE),
      (q, 'Debit Kendaraan Rp150.000.000, Kredit Utang Bank Rp150.000.000', 1, FALSE),
      (q, 'Debit Kas Rp200.000.000, Kredit Kendaraan Rp200.000.000', 2, FALSE),
      (q, 'Debit Kendaraan Rp200.000.000, Kredit Kas Rp50.000.000 dan Kredit Utang Bank Rp150.000.000', 3, TRUE);

    -- Q22 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Apa yang dimaksud dengan "prinsip konservatisme" dalam akuntansi?', 21) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Mengakui kerugian yang mungkin terjadi lebih awal, tetapi menunda pengakuan keuntungan hingga pasti', 0, TRUE),
      (q, 'Mencatat semua aset pada nilai yang lebih tinggi untuk menampilkan posisi keuangan yang lebih baik', 1, FALSE),
      (q, 'Menggunakan metode akuntansi yang paling menguntungkan bagi perusahaan', 2, FALSE),
      (q, 'Menunda pengakuan semua kerugian hingga terealisasi secara penuh', 3, FALSE);

    -- Q23 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Manakah dari berikut ini yang termasuk dalam kategori beban operasional?', 22) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Beban bunga pinjaman bank', 0, FALSE),
      (q, 'Beban gaji karyawan administrasi', 1, TRUE),
      (q, 'Pajak penghasilan perusahaan', 2, FALSE),
      (q, 'Kerugian penjualan investasi', 3, FALSE);

    -- Q24 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Dalam metode ekuitas (equity method) untuk investasi, perusahaan investor mencatat bagiannya atas laba perusahaan investee dengan:', 23) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Mendebit akun Kas dan mengkredit akun Pendapatan Dividen', 0, FALSE),
      (q, 'Mendebit akun Pendapatan Dividen dan mengkredit akun Investasi', 1, FALSE),
      (q, 'Mendebit akun Investasi dan mengkredit akun Pendapatan dari Investee', 2, TRUE),
      (q, 'Tidak ada pencatatan hingga dividen benar-benar dibayarkan', 3, FALSE);

    -- Q25 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Apa fungsi dari "buku besar" (general ledger) dalam sistem akuntansi?', 24) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Merangkum semua transaksi per akun dan menunjukkan saldo akhir setiap akun', 0, TRUE),
      (q, 'Mencatat transaksi secara kronologis untuk pertama kalinya', 1, FALSE),
      (q, 'Menyusun laporan keuangan akhir periode', 2, FALSE),
      (q, 'Menghitung total pajak yang harus dibayar perusahaan', 3, FALSE);

    -- Q26 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Perusahaan memiliki persediaan awal Rp30.000.000, pembelian Rp150.000.000, dan persediaan akhir Rp40.000.000. Berapakah Harga Pokok Penjualan (HPP)?', 25) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Rp180.000.000', 0, FALSE),
      (q, 'Rp150.000.000', 1, FALSE),
      (q, 'Rp120.000.000', 2, FALSE),
      (q, 'Rp140.000.000', 3, TRUE);

    -- Q27 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Apa yang dimaksud dengan "jurnal penyesuaian" (adjusting entries)?', 26) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Jurnal untuk mencatat transaksi yang dibatalkan', 0, FALSE),
      (q, 'Jurnal yang dibuat pada akhir periode untuk memastikan pendapatan dan beban diakui pada periode yang tepat', 1, TRUE),
      (q, 'Jurnal untuk mencatat pembayaran utang kepada kreditur', 2, FALSE),
      (q, 'Jurnal untuk menutup akun-akun sementara di akhir periode', 3, FALSE);

    -- Q28 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Dalam akuntansi, "aset tetap" (fixed assets) didefinisikan sebagai:', 27) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Aset berwujud yang digunakan dalam operasi bisnis dengan masa manfaat lebih dari satu tahun', 0, TRUE),
      (q, 'Semua aset yang dimiliki perusahaan, baik jangka pendek maupun jangka panjang', 1, FALSE),
      (q, 'Aset yang akan dikonversi menjadi kas dalam waktu kurang dari satu tahun', 2, FALSE),
      (q, 'Investasi jangka panjang dalam efek-efek berharga', 3, FALSE);

    -- Q29 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Manakah dari pernyataan berikut yang benar mengenai "laba kotor" (gross profit)?', 28) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Laba kotor = Pendapatan - Semua Beban', 0, FALSE),
      (q, 'Laba kotor = Pendapatan - Beban Operasional', 1, FALSE),
      (q, 'Laba kotor = Pendapatan - Beban Pajak', 2, FALSE),
      (q, 'Laba kotor = Pendapatan Penjualan - Harga Pokok Penjualan', 3, TRUE);

    -- Q30 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Apa yang dimaksud dengan "rasio lancar" (current ratio)?', 29) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Total Aset dibagi Total Kewajiban', 0, FALSE),
      (q, 'Aset Lancar dibagi Kewajiban Lancar', 1, TRUE),
      (q, 'Kas dibagi Total Kewajiban', 2, FALSE),
      (q, 'Laba Bersih dibagi Total Aset', 3, FALSE);

    -- Q31 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Dalam laporan arus kas metode langsung (direct method), penerimaan kas dari pelanggan dihitung dengan cara:', 30) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Laba bersih + Beban penyusutan', 0, FALSE),
      (q, 'Total penjualan - Beban operasional', 1, FALSE),
      (q, 'Total penjualan + Kenaikan piutang usaha', 2, FALSE),
      (q, 'Total penjualan - Kenaikan piutang usaha (atau + Penurunan piutang usaha)', 3, TRUE);

    -- Q32 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s1, 'Perusahaan mengeluarkan obligasi (bonds) senilai Rp1.000.000.000 dengan nilai nominal Rp1.000.000 per lembar dan kupon bunga 8% per tahun. Jika obligasi diterbitkan pada harga 95, berapakah kas yang diterima perusahaan?', 31) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Rp1.000.000.000', 0, FALSE),
      (q, 'Rp1.080.000.000', 1, FALSE),
      (q, 'Rp920.000.000', 2, FALSE),
      (q, 'Rp950.000.000', 3, TRUE);

    -- ── Additional (AI-generated) questions — Akuntansi ──

    -- AQ1 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position, source) VALUES (s1, 'Apa yang dimaksud dengan "prinsip pencocokan" (matching principle) dalam akuntansi?', 32, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Setiap entri debit harus diimbangi dengan entri kredit yang sama nilainya', 0, FALSE),
      (q, 'Aset dan kewajiban harus selalu seimbang dalam laporan posisi keuangan', 1, FALSE),
      (q, 'Beban harus diakui pada periode yang sama dengan pendapatan yang dihasilkannya', 2, TRUE),
      (q, 'Pendapatan dan beban harus dicatat pada saat kas diterima atau dibayarkan', 3, FALSE);

    -- AQ2 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position, source) VALUES (s1, 'Goodwill dalam akuntansi timbul ketika:', 33, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Nilai pasar aset perusahaan melebihi nilai tercatatnya di buku', 0, FALSE),
      (q, 'Perusahaan mengakuisisi perusahaan lain dengan harga yang melebihi nilai wajar aset bersih teridentifikasi', 1, TRUE),
      (q, 'Perusahaan memiliki reputasi merek yang sangat kuat di pasar', 2, FALSE),
      (q, 'Perusahaan mendaftarkan hak paten dan merek dagangnya secara resmi', 3, FALSE);

    -- AQ3 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position, source) VALUES (s1, 'Laba ditahan (retained earnings) dalam laporan ekuitas pemegang saham didefinisikan sebagai:', 34, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Kas yang disimpan perusahaan untuk keperluan investasi di masa mendatang', 0, FALSE),
      (q, 'Laba bersih yang dibagikan kepada pemegang saham dalam bentuk dividen', 1, FALSE),
      (q, 'Akumulasi laba bersih sepanjang masa perusahaan yang belum dibagikan sebagai dividen', 2, TRUE),
      (q, 'Cadangan khusus yang disisihkan untuk pembayaran utang jangka panjang', 3, FALSE);

    -- AQ4 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position, source) VALUES (s1, 'Ketika dividen tunai diumumkan (declared) namun belum dibayarkan, jurnal yang tepat adalah:', 35, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Debit Kas, Kredit Utang Dividen', 0, FALSE),
      (q, 'Debit Laba Ditahan, Kredit Utang Dividen', 1, TRUE),
      (q, 'Debit Utang Dividen, Kredit Laba Ditahan', 2, FALSE),
      (q, 'Debit Laba Ditahan, Kredit Kas', 3, FALSE);

    -- AQ5 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position, source) VALUES (s1, 'Kewajiban akrual (accrued liabilities) muncul dalam laporan posisi keuangan karena:', 36, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Beban telah terjadi dan diakui, tetapi pembayaran kasnya belum dilakukan pada akhir periode', 0, TRUE),
      (q, 'Perusahaan menerima kas lebih awal sebelum jasa atau produk diberikan kepada pelanggan', 1, FALSE),
      (q, 'Aset jangka panjang telah disusutkan melebihi nilai bukunya', 2, FALSE),
      (q, 'Pendapatan sudah diterima kasnya tetapi belum dicatat dalam buku besar', 3, FALSE);

    -- ─── Section 2: Analisis Laporan Keuangan ───────────────────────────────
    INSERT INTO sections (title, position, draw_per_session)
    VALUES ('Analisis Laporan Keuangan', 1, 10)
    RETURNING id INTO s2;

    -- Q1 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Rasio keuangan yang digunakan untuk mengukur kemampuan perusahaan membayar kewajiban jangka pendeknya menggunakan aset paling likuid (kas dan setara kas) adalah:', 0) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Rasio lancar (current ratio)', 0, FALSE),
      (q, 'Rasio cepat (quick ratio)', 1, FALSE),
      (q, 'Rasio kas (cash ratio)', 2, TRUE),
      (q, 'Rasio utang (debt ratio)', 3, FALSE);

    -- Q2 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Jika perusahaan memiliki total utang Rp400 juta dan total ekuitas Rp600 juta, berapakah Debt-to-Equity Ratio (DER)?', 1) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, '1,5x', 0, FALSE),
      (q, '1,0x', 1, FALSE),
      (q, '0,67x', 2, TRUE),
      (q, '0,4x', 3, FALSE);

    -- Q3 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Dalam analisis laporan keuangan, "analisis horizontal" mengacu pada:', 2) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Perbandingan rasio keuangan perusahaan dengan rasio industri pada periode yang sama', 0, FALSE),
      (q, 'Penyajian setiap pos laporan keuangan sebagai persentase dari pos dasar tertentu', 1, FALSE),
      (q, 'Perbandingan data keuangan antar periode untuk mengidentifikasi tren', 2, TRUE),
      (q, 'Analisis struktur modal perusahaan dibandingkan dengan kompetitor', 3, FALSE);

    -- Q4 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Return on Equity (ROE) mengukur:', 3) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Kemampuan aset perusahaan menghasilkan laba', 0, FALSE),
      (q, 'Efisiensi manajemen dalam menggunakan total aset', 1, FALSE),
      (q, 'Tingkat pengembalian bagi pemegang saham atas investasinya', 2, TRUE),
      (q, 'Kemampuan perusahaan membayar utang jangka panjang', 3, FALSE);

    -- Q5 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Manakah dari berikut ini yang merupakan komponen utama dalam analisis Du Pont?', 4) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Profit margin, Asset turnover, dan Financial leverage', 0, TRUE),
      (q, 'Current ratio, Quick ratio, dan Cash ratio', 1, FALSE),
      (q, 'Gross margin, Operating margin, dan Net margin', 2, FALSE),
      (q, 'Debt ratio, Debt-to-equity, dan Interest coverage', 3, FALSE);

    -- Q6 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Price-to-Earnings Ratio (P/E Ratio) dihitung dengan cara:', 5) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Harga saham per lembar dibagi Laba per saham (EPS)', 0, TRUE),
      (q, 'Laba bersih dibagi Jumlah saham beredar', 1, FALSE),
      (q, 'Total ekuitas dibagi Jumlah saham beredar', 2, FALSE),
      (q, 'Harga saham per lembar dibagi Nilai buku per saham', 3, FALSE);

    -- Q7 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Manakah dari pernyataan berikut yang BENAR mengenai analisis common-size (analisis vertikal)?', 6) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Membandingkan laporan keuangan antar tahun untuk mengetahui pertumbuhan', 0, FALSE),
      (q, 'Hanya dapat diterapkan pada laporan laba rugi, tidak pada neraca', 1, FALSE),
      (q, 'Menyajikan setiap komponen sebagai persentase dari total, sehingga memudahkan perbandingan antar perusahaan', 2, TRUE),
      (q, 'Menggunakan nilai absolut (bukan persentase) untuk membandingkan pos-pos laporan keuangan', 3, FALSE);

    -- Q8 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Rasio perputaran piutang (Accounts Receivable Turnover) yang tinggi mengindikasikan:', 7) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Perusahaan memberikan kredit terlalu longgar kepada pelanggan', 0, FALSE),
      (q, 'Perusahaan efisien dalam menagih piutangnya dari pelanggan', 1, TRUE),
      (q, 'Perusahaan memiliki banyak piutang tak tertagih', 2, FALSE),
      (q, 'Perusahaan mengalami kesulitan likuiditas', 3, FALSE);

    -- Q9 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'EBITDA (Earnings Before Interest, Taxes, Depreciation, and Amortization) sering digunakan dalam analisis keuangan karena:', 8) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Memperhitungkan dampak pajak dan struktur modal perusahaan', 0, FALSE),
      (q, 'Sama persis dengan arus kas operasional perusahaan', 1, FALSE),
      (q, 'Merupakan ukuran laba yang paling konservatif', 2, FALSE),
      (q, 'Memberikan gambaran kemampuan operasional perusahaan menghasilkan kas sebelum keputusan keuangan dan pajak', 3, TRUE);

    -- Q10 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Jika perusahaan memiliki laba bersih Rp50 juta dan total aset Rp500 juta, berapakah Return on Assets (ROA)?', 9) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, '5%', 0, FALSE),
      (q, '0,1%', 1, FALSE),
      (q, '10%', 2, TRUE),
      (q, '1%', 3, FALSE);

    -- Q11 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Interest Coverage Ratio (ICR) yang lebih besar dari 1 menunjukkan bahwa:', 10) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Perusahaan mampu membayar beban bunga dari laba operasionalnya', 0, TRUE),
      (q, 'Perusahaan memiliki lebih banyak utang daripada ekuitas', 1, FALSE),
      (q, 'Perusahaan memiliki aset lancar yang cukup untuk memenuhi kewajiban jangka pendek', 2, FALSE),
      (q, 'Perusahaan tidak memiliki utang berbunga', 3, FALSE);

    -- Q12 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Manakah dari berikut ini yang merupakan keterbatasan analisis rasio keuangan?', 11) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Perbedaan metode akuntansi antar perusahaan dapat membuat perbandingan menjadi tidak valid', 0, TRUE),
      (q, 'Rasio keuangan selalu memberikan gambaran yang akurat tentang kesehatan keuangan perusahaan', 1, FALSE),
      (q, 'Analisis rasio hanya dapat dilakukan pada perusahaan yang terdaftar di bursa saham', 2, FALSE),
      (q, 'Rasio keuangan dapat memprediksi masa depan perusahaan dengan pasti', 3, FALSE);

    -- Q13 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Apa yang dimaksud dengan "working capital" (modal kerja)?', 12) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Total aset perusahaan dikurangi total kewajiban', 0, FALSE),
      (q, 'Total investasi jangka panjang yang dimiliki perusahaan', 1, FALSE),
      (q, 'Modal yang digunakan untuk membeli aset tetap perusahaan', 2, FALSE),
      (q, 'Selisih antara aset lancar dan kewajiban lancar', 3, TRUE);

    -- Q14 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Dalam analisis fundamental saham, Price-to-Book Value (PBV) Ratio dihitung dengan cara:', 13) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Harga saham per lembar dibagi Laba per saham', 0, FALSE),
      (q, 'Harga saham per lembar dibagi Nilai buku per saham', 1, TRUE),
      (q, 'Total ekuitas dibagi Laba bersih', 2, FALSE),
      (q, 'Nilai pasar total perusahaan dibagi Total pendapatan tahunan', 3, FALSE);

    -- Q15 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Gross Profit Margin (GPM) yang menurun dari tahun ke tahun dapat mengindikasikan:', 14) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Meningkatnya biaya produksi atau menurunnya harga jual', 0, TRUE),
      (q, 'Meningkatnya efisiensi operasional perusahaan', 1, FALSE),
      (q, 'Berkurangnya utang jangka panjang perusahaan', 2, FALSE),
      (q, 'Meningkatnya kemampuan perusahaan dalam mengelola modal kerja', 3, FALSE);

    -- Q16 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Inventory Turnover Ratio yang rendah pada perusahaan manufaktur biasanya mengindikasikan:', 15) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Perusahaan sangat efisien dalam mengelola persediaannya', 0, FALSE),
      (q, 'Potensi masalah seperti kelebihan stok atau lambatnya perputaran penjualan', 1, TRUE),
      (q, 'Perusahaan memiliki permintaan yang sangat tinggi untuk produknya', 2, FALSE),
      (q, 'Perusahaan menggunakan metode LIFO untuk penilaian persediaan', 3, FALSE);

    -- Q17 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s2, 'Manakah dari komponen berikut yang TIDAK termasuk dalam laporan arus kas?', 16) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Arus kas dari aktivitas operasi', 0, FALSE),
      (q, 'Arus kas dari aktivitas investasi', 1, FALSE),
      (q, 'Arus kas dari aktivitas penjualan', 2, TRUE),
      (q, 'Arus kas dari aktivitas pendanaan', 3, FALSE);

    -- ── Additional (AI-generated) questions — Analisis Laporan Keuangan ──

    -- AQ1 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position, source) VALUES (s2, 'Operating leverage (leverage operasi) yang tinggi menunjukkan bahwa:', 17, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Perusahaan memiliki lebih banyak utang daripada ekuitas dalam struktur modalnya', 0, FALSE),
      (q, 'Perubahan kecil dalam volume penjualan akan menghasilkan perubahan persentase yang lebih besar pada laba operasional', 1, TRUE),
      (q, 'Perusahaan menghasilkan margin keuntungan yang sangat tinggi pada setiap penjualan', 2, FALSE),
      (q, 'Perusahaan sangat bergantung pada pinjaman jangka pendek untuk membiayai operasinya', 3, FALSE);

    -- AQ2 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position, source) VALUES (s2, 'Free Cash Flow (FCF) / Arus Kas Bebas dihitung dengan cara:', 18, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Laba bersih dikurangi seluruh total beban operasional', 0, FALSE),
      (q, 'EBITDA dikurangi beban bunga dan pajak penghasilan', 1, FALSE),
      (q, 'Arus kas dari aktivitas operasi dikurangi pengeluaran modal (capital expenditures)', 2, TRUE),
      (q, 'Laba bersih ditambah beban penyusutan dan amortisasi', 3, FALSE);

    -- AQ3 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position, source) VALUES (s2, 'Days Sales Outstanding (DSO) atau Periode Pengumpulan Piutang Rata-rata mengukur:', 19, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Rata-rata jumlah hari persediaan tersimpan sebelum terjual', 0, FALSE),
      (q, 'Rata-rata jumlah hari yang dibutuhkan perusahaan untuk menagih pembayaran dari pelanggan', 1, TRUE),
      (q, 'Rata-rata jumlah hari perusahaan membayar utang kepada pemasoknya', 2, FALSE),
      (q, 'Jumlah hari pendapatan dapat menutupi seluruh beban operasional', 3, FALSE);

    -- AQ4 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position, source) VALUES (s2, 'Altman Z-Score digunakan oleh analis keuangan terutama untuk:', 20, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Mengukur rasio pembayaran dividen (dividend payout ratio) perusahaan', 0, FALSE),
      (q, 'Memperkirakan harga saham perusahaan di masa mendatang', 1, FALSE),
      (q, 'Menilai kemungkinan suatu perusahaan mengalami kebangkrutan dalam waktu dekat', 2, TRUE),
      (q, 'Menghitung biaya rata-rata tertimbang modal (WACC) perusahaan', 3, FALSE);

    -- AQ5 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position, source) VALUES (s2, 'Economic Value Added (EVA) mengukur:', 21, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Total laba akuntansi yang dihasilkan perusahaan dalam suatu periode', 0, FALSE),
      (q, 'Selisih antara pendapatan perusahaan dan total beban operasionalnya', 1, FALSE),
      (q, 'Laba yang dihasilkan melebihi tingkat pengembalian minimum yang disyaratkan atas modal yang diinvestasikan', 2, TRUE),
      (q, 'Nilai pasar ekuitas perusahaan dibagi dengan nilai bukunya', 3, FALSE);

    -- ─── Section 3: Risk Based Audit ────────────────────────────────────────
    INSERT INTO sections (title, position, draw_per_session)
    VALUES ('Risk Based Audit', 2, 10)
    RETURNING id INTO s3;

    -- ── From: Risk based audit - kuis MLE.pdf (Q1–Q50) ──

    -- Q1 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Pendekatan audit berbasis risiko (Risk-Based Audit) berfokus pada:', 0) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Pemeriksaan seluruh transaksi tanpa pengecualian', 0, FALSE),
      (q, 'Mengidentifikasi dan menilai area dengan risiko salah saji yang signifikan', 1, TRUE),
      (q, 'Mengutamakan pemeriksaan aset tetap perusahaan', 2, FALSE),
      (q, 'Mengurangi jumlah sampel audit seminimal mungkin', 3, FALSE);

    -- Q2 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Tujuan utama dari audit laporan keuangan adalah:', 1) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Mendeteksi semua kecurangan yang terjadi di perusahaan', 0, FALSE),
      (q, 'Memastikan efisiensi operasional perusahaan', 1, FALSE),
      (q, 'Memberikan opini atas kewajaran penyajian laporan keuangan', 2, TRUE),
      (q, 'Menilai kinerja manajemen dalam mencapai target perusahaan', 3, FALSE);

    -- Q3 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Risiko audit (Audit Risk) terdiri dari komponen:', 2) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Risiko inheren, risiko deteksi, dan risiko keuangan', 0, FALSE),
      (q, 'Risiko inheren, risiko pengendalian, dan risiko deteksi', 1, TRUE),
      (q, 'Risiko operasional, risiko pasar, dan risiko kredit', 2, FALSE),
      (q, 'Risiko bisnis, risiko kepatuhan, dan risiko reputasi', 3, FALSE);

    -- Q4 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Risiko inheren (inherent risk) dalam audit didefinisikan sebagai:', 3) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Risiko yang muncul akibat kegagalan pengendalian internal perusahaan', 0, FALSE),
      (q, 'Kerentanan suatu asersi terhadap salah saji yang material, dengan asumsi tidak ada pengendalian internal', 1, TRUE),
      (q, 'Risiko bahwa prosedur audit gagal mendeteksi salah saji yang material', 2, FALSE),
      (q, 'Risiko yang berkaitan dengan kompleksitas transaksi akuntansi', 3, FALSE);

    -- Q5 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam model risiko audit, hubungan antara risiko deteksi dengan risiko inheren dan risiko pengendalian adalah:', 4) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Berbanding lurus: semakin tinggi risiko inheren, semakin tinggi risiko deteksi yang dapat diterima', 0, FALSE),
      (q, 'Berbanding terbalik: semakin tinggi risiko inheren dan pengendalian, semakin rendah risiko deteksi yang dapat diterima', 1, TRUE),
      (q, 'Tidak ada hubungan antara risiko deteksi dengan komponen risiko audit lainnya', 2, FALSE),
      (q, 'Risiko deteksi selalu ditetapkan pada level rendah terlepas dari risiko lainnya', 3, FALSE);

    -- Q6 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Prosedur penilaian risiko (risk assessment procedures) yang dilakukan auditor mencakup:', 5) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Tanya jawab dengan manajemen, observasi, dan prosedur analitis', 0, TRUE),
      (q, 'Konfirmasi kepada pihak ketiga dan pengujian substantif', 1, FALSE),
      (q, 'Pengujian pengendalian dan prosedur analitis substantif', 2, FALSE),
      (q, 'Pemeriksaan fisik aset dan rekonsiliasi bank', 3, FALSE);

    -- Q7 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Materialitas dalam audit digunakan untuk:', 6) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Menentukan honorarium yang akan ditagihkan kepada klien', 0, FALSE),
      (q, 'Memastikan semua transaksi kecil tetap diperiksa secara menyeluruh', 1, FALSE),
      (q, 'Membantu auditor menentukan sifat, waktu, dan luas prosedur audit', 2, TRUE),
      (q, 'Mengidentifikasi pelanggaran etika dalam perusahaan', 3, FALSE);

    -- Q8 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Asersi manajemen dalam laporan keuangan yang berkaitan dengan apakah semua transaksi yang seharusnya dicatat telah dicatat disebut asersi:', 7) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Eksistensi (existence)', 0, FALSE),
      (q, 'Kelengkapan (completeness)', 1, TRUE),
      (q, 'Penilaian (valuation)', 2, FALSE),
      (q, 'Hak dan kewajiban (rights and obligations)', 3, FALSE);

    -- Q9 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Pengendalian internal yang efektif dapat mengurangi risiko:', 8) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Risiko deteksi audit', 0, FALSE),
      (q, 'Risiko pengendalian', 1, TRUE),
      (q, 'Risiko inheren', 2, FALSE),
      (q, 'Risiko audit keseluruhan secara langsung', 3, FALSE);

    -- Q10 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Manakah dari berikut ini yang merupakan contoh dari "red flags" atau tanda peringatan kecurangan?', 9) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Perusahaan memiliki sistem pengendalian internal yang kuat', 0, FALSE),
      (q, 'Laporan keuangan disusun tepat waktu setiap tahunnya', 1, FALSE),
      (q, 'Manajemen menunjukkan sikap tidak kooperatif terhadap tim audit', 2, TRUE),
      (q, 'Perusahaan melakukan audit eksternal setiap tahun', 3, FALSE);

    -- Q11 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam kerangka COSO, komponen pengendalian internal yang menjadi fondasi dari seluruh sistem pengendalian adalah:', 10) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Lingkungan pengendalian (control environment)', 0, TRUE),
      (q, 'Penilaian risiko (risk assessment)', 1, FALSE),
      (q, 'Aktivitas pengendalian (control activities)', 2, FALSE),
      (q, 'Pemantauan (monitoring)', 3, FALSE);

    -- Q12 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Pengujian substantif atas detail transaksi (tests of details of transactions) bertujuan untuk:', 11) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Menilai efektivitas pengendalian internal perusahaan', 0, FALSE),
      (q, 'Memperoleh bukti tentang asersi yang berkaitan dengan transaksi dan saldo akun', 1, TRUE),
      (q, 'Mengidentifikasi area risiko tinggi dalam bisnis klien', 2, FALSE),
      (q, 'Memahami lingkungan bisnis dan industri klien', 3, FALSE);

    -- Q13 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Konfirmasi eksternal (external confirmation) dari bank merupakan prosedur audit yang memberikan bukti audit terkait asersi:', 12) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Kelengkapan pendapatan', 0, FALSE),
      (q, 'Eksistensi dan penilaian saldo kas', 1, TRUE),
      (q, 'Pengklasifikasian aset tetap', 2, FALSE),
      (q, 'Cut-off transaksi penjualan', 3, FALSE);

    -- Q14 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Prosedur analitis (analytical procedures) dalam audit digunakan untuk:', 13) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Menggantikan sepenuhnya pengujian pengendalian dan substantif', 0, FALSE),
      (q, 'Mengevaluasi informasi keuangan melalui analisis hubungan yang masuk akal antar data', 1, TRUE),
      (q, 'Melakukan pemeriksaan fisik atas aset perusahaan', 2, FALSE),
      (q, 'Memverifikasi keakuratan perhitungan matematis dalam laporan keuangan', 3, FALSE);

    -- Q15 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Opini audit "wajar tanpa pengecualian" (unmodified opinion) diberikan ketika:', 14) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Auditor menemukan kesalahan material yang telah diperbaiki oleh klien', 0, FALSE),
      (q, 'Laporan keuangan menyajikan secara wajar, dalam semua hal yang material, sesuai dengan kerangka pelaporan yang berlaku', 1, TRUE),
      (q, 'Auditor tidak dapat memperoleh bukti yang cukup tentang satu akun tertentu', 2, FALSE),
      (q, 'Terdapat ketidakpastian yang signifikan tentang kelangsungan usaha perusahaan', 3, FALSE);

    -- Q16 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam audit berbasis risiko, "risiko bisnis" klien relevan karena:', 15) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Auditor bertanggung jawab untuk mengelola risiko bisnis klien', 0, FALSE),
      (q, 'Risiko bisnis dapat menyebabkan salah saji material dalam laporan keuangan', 1, TRUE),
      (q, 'Risiko bisnis menentukan besarnya honorarium audit', 2, FALSE),
      (q, 'Auditor harus melaporkan semua risiko bisnis klien kepada pemegang saham', 3, FALSE);

    -- Q17 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Apa yang dimaksud dengan "sampling audit" dalam konteks audit laporan keuangan?', 16) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Penerapan prosedur audit pada sebagian elemen dalam suatu populasi untuk menarik kesimpulan tentang seluruh populasi', 0, TRUE),
      (q, 'Pemeriksaan 100% atas semua transaksi dalam suatu periode', 1, FALSE),
      (q, 'Penggunaan perangkat lunak komputer untuk menganalisis seluruh database perusahaan', 2, FALSE),
      (q, 'Pemilihan transaksi berdasarkan nilai moneter terbesar saja', 3, FALSE);

    -- Q18 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Going concern atau kelangsungan usaha menjadi perhatian auditor karena:', 17) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Laporan keuangan umumnya disusun dengan asumsi perusahaan akan terus beroperasi', 0, TRUE),
      (q, 'Auditor bertanggung jawab untuk menjamin kelangsungan usaha klien', 1, FALSE),
      (q, 'Kelangsungan usaha hanya relevan bagi perusahaan yang mengalami kerugian', 2, FALSE),
      (q, 'Standar audit mengharuskan pembahasan kelangsungan usaha di setiap laporan audit', 3, FALSE);

    -- Q19 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dokumentasi audit (audit documentation/working papers) berfungsi sebagai:', 18) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Bukti bahwa audit telah dilaksanakan sesuai standar dan dasar bagi laporan audit', 0, TRUE),
      (q, 'Dokumen yang harus diserahkan kepada klien setelah audit selesai', 1, FALSE),
      (q, 'Rekaman yang hanya disimpan selama satu tahun setelah penerbitan laporan', 2, FALSE),
      (q, 'Laporan rahasia yang hanya dapat diakses oleh pihak regulator', 3, FALSE);

    -- Q20 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Independensi auditor sangat penting dalam audit laporan keuangan karena:', 19) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Auditor yang tidak independen tidak memiliki kompetensi teknis yang memadai', 0, FALSE),
      (q, 'Opini audit hanya bernilai jika auditor bebas dari pengaruh yang dapat mempengaruhi objektivitasnya', 1, TRUE),
      (q, 'Standar audit internasional mensyaratkan auditor tidak boleh memiliki hubungan apapun dengan klien', 2, FALSE),
      (q, 'Independensi hanya diperlukan untuk audit perusahaan publik (Tbk)', 3, FALSE);

    -- Q21 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Manakah dari berikut ini yang merupakan contoh "pengendalian preventif" (preventive control)?', 20) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Pemisahan tugas antara fungsi otorisasi, pencatatan, dan penyimpanan aset', 0, TRUE),
      (q, 'Rekonsiliasi bank bulanan yang dilakukan oleh staf akuntansi', 1, FALSE),
      (q, 'Audit internal yang memeriksa kepatuhan prosedur secara berkala', 2, FALSE),
      (q, 'Laporan exception yang mengidentifikasi transaksi yang tidak biasa', 3, FALSE);

    -- Q22 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam audit atas siklus pendapatan, asersi "cut-off" berkaitan dengan:', 21) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Apakah semua penjualan telah dicatat di periode yang benar', 0, FALSE),
      (q, 'Apakah penjualan dicatat pada nilai yang tepat', 1, FALSE),
      (q, 'Apakah semua pelanggan yang berhutang telah diidentifikasi', 2, FALSE),
      (q, 'Apakah transaksi penjualan dicatat dalam periode akuntansi yang tepat', 3, TRUE);

    -- Q23 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Fraud triangle mengidentifikasi tiga kondisi yang mendorong kecurangan, yaitu:', 22) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Tekanan (pressure), kesempatan (opportunity), dan rasionalisasi (rationalization)', 0, TRUE),
      (q, 'Motivasi, kemampuan, dan niat jahat', 1, FALSE),
      (q, 'Keserakahan, kelemahan sistem, dan kurangnya pengawasan', 2, FALSE),
      (q, 'Tekanan keuangan, akses terhadap aset, dan kurangnya etika', 3, FALSE);

    -- Q24 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Apa yang dimaksud dengan "perikatan audit" (audit engagement)?', 23) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Kesepakatan antara auditor dan klien tentang syarat dan kondisi pelaksanaan audit', 0, TRUE),
      (q, 'Hubungan jangka panjang antara auditor dan klien yang tidak dapat diputus', 1, FALSE),
      (q, 'Proses seleksi dan penunjukan auditor oleh pemegang saham', 2, FALSE),
      (q, 'Kontrak yang mengharuskan auditor memberikan opini wajar tanpa pengecualian', 3, FALSE);

    -- Q25 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Surat perikatan audit (engagement letter) berfungsi untuk:', 24) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Mendokumentasikan dan mengkonfirmasi syarat-syarat perikatan serta tanggung jawab masing-masing pihak', 0, TRUE),
      (q, 'Menjamin bahwa klien akan membayar honorarium audit tepat waktu', 1, FALSE),
      (q, 'Memberikan jaminan tentang jenis opini yang akan diterbitkan', 2, FALSE),
      (q, 'Mengikat klien untuk tidak mengganti auditornya selama 5 tahun', 3, FALSE);

    -- Q26 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Standar audit yang berlaku di Indonesia untuk audit laporan keuangan entitas swasta mengacu pada:', 25) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Standar Profesional Akuntan Publik (SPAP) yang ditetapkan oleh IAPI', 0, TRUE),
      (q, 'International Standards on Auditing (ISA) yang langsung diterapkan tanpa adaptasi', 1, FALSE),
      (q, 'Peraturan Bank Indonesia untuk entitas perbankan', 2, FALSE),
      (q, 'Standar akuntansi yang ditetapkan oleh Ikatan Akuntan Indonesia (IAI)', 3, FALSE);

    -- Q27 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam audit berbasis risiko, tahap pertama yang harus dilakukan auditor setelah penerimaan perikatan adalah:', 26) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Langsung melakukan pengujian substantif atas saldo-saldo material', 0, FALSE),
      (q, 'Mengirimkan konfirmasi kepada semua bank dan debitur utama', 1, FALSE),
      (q, 'Memahami entitas dan lingkungannya untuk mengidentifikasi dan menilai risiko salah saji material', 2, TRUE),
      (q, 'Menetapkan materialitas dan merancang program audit', 3, FALSE);

    -- Q28 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Manakah dari berikut ini yang BUKAN merupakan tujuan audit internal?', 27) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Menilai efektivitas sistem pengendalian internal', 0, FALSE),
      (q, 'Membantu manajemen dalam mencapai tujuan organisasi', 1, FALSE),
      (q, 'Mengidentifikasi risiko dan memberikan rekomendasi perbaikan', 2, FALSE),
      (q, 'Memberikan opini independen atas kewajaran laporan keuangan untuk kepentingan publik', 3, TRUE);

    -- Q29 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Pengujian pengendalian (tests of controls) dilakukan auditor untuk:', 28) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Mengevaluasi apakah pengendalian berjalan efektif seperti yang telah dirancang', 0, TRUE),
      (q, 'Mendeteksi salah saji yang material dalam saldo akun', 1, FALSE),
      (q, 'Mengkonfirmasi saldo dengan pihak eksternal', 2, FALSE),
      (q, 'Menganalisis tren dalam laporan keuangan', 3, FALSE);

    -- Q30 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Konsep "professional skepticism" (skeptisisme profesional) mengharuskan auditor untuk:', 29) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Mempertanyakan bukti yang diperoleh dan selalu waspada terhadap kondisi yang mengindikasikan kecurangan', 0, TRUE),
      (q, 'Selalu curiga bahwa manajemen klien sedang melakukan kecurangan', 1, FALSE),
      (q, 'Menerima semua pernyataan manajemen tanpa verifikasi lebih lanjut', 2, FALSE),
      (q, 'Menolak semua bukti yang diberikan oleh klien dan mencari sendiri buktinya', 3, FALSE);

    -- Q31 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Apa yang dimaksud dengan "opini disclaimer" (tidak memberikan pendapat) dalam laporan audit?', 30) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Auditor tidak dapat menyatakan pendapat karena tidak dapat memperoleh bukti audit yang cukup dan tepat', 0, TRUE),
      (q, 'Auditor menyatakan bahwa laporan keuangan tidak disajikan secara wajar', 1, FALSE),
      (q, 'Auditor memberikan opini positif dengan catatan tentang beberapa pengecualian', 2, FALSE),
      (q, 'Auditor menolak untuk menyelesaikan penugasan audit', 3, FALSE);

    -- Q32 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam audit siklus pengeluaran, prosedur audit yang tepat untuk memverifikasi asersi "eksistensi" atas utang usaha adalah:', 31) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Memeriksa apakah semua pembelian kredit telah dicatat di buku besar', 0, FALSE),
      (q, 'Mengirimkan konfirmasi kepada pemasok untuk memverifikasi saldo utang yang tercatat', 1, TRUE),
      (q, 'Memeriksa cut-off transaksi pembelian di sekitar tanggal pelaporan', 2, FALSE),
      (q, 'Melakukan observasi atas proses pembelian dan penerimaan barang', 3, FALSE);

    -- Q33 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Materialitas pelaksanaan (performance materiality) ditetapkan oleh auditor:', 32) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Pada level yang sama dengan materialitas keseluruhan laporan keuangan', 0, FALSE),
      (q, 'Pada level yang lebih rendah dari materialitas keseluruhan untuk mengurangi risiko bahwa total salah saji tidak terdeteksi melebihi materialitas', 1, TRUE),
      (q, 'Pada level yang lebih tinggi dari materialitas keseluruhan untuk memperluas cakupan audit', 2, FALSE),
      (q, 'Berdasarkan instruksi langsung dari klien', 3, FALSE);

    -- Q34 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Teknik "walkthrough" dalam audit digunakan untuk:', 33) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Mengkonfirmasi pemahaman auditor atas alur suatu transaksi dari awal hingga tercermin dalam laporan keuangan', 0, TRUE),
      (q, 'Melakukan penghitungan fisik atas persediaan barang di gudang', 1, FALSE),
      (q, 'Menilai kecukupan sistem teknologi informasi perusahaan', 2, FALSE),
      (q, 'Mewawancarai karyawan tentang kepuasan kerja mereka', 3, FALSE);

    -- Q35 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Pihak yang bertanggung jawab atas penyusunan dan penyajian laporan keuangan yang wajar adalah:', 34) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Manajemen dan dewan direksi perusahaan', 0, TRUE),
      (q, 'Auditor eksternal yang ditunjuk untuk memeriksa laporan keuangan', 1, FALSE),
      (q, 'Komite audit yang dibentuk oleh dewan komisaris', 2, FALSE),
      (q, 'Departemen keuangan dan akuntansi perusahaan', 3, FALSE);

    -- Q36 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Jenis kecurangan yang melibatkan manipulasi laporan keuangan untuk menampilkan kinerja yang lebih baik dari yang sesungguhnya disebut:', 35) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Financial statement fraud (kecurangan laporan keuangan)', 0, TRUE),
      (q, 'Asset misappropriation (penyalahgunaan aset)', 1, FALSE),
      (q, 'Corruption (korupsi)', 2, FALSE),
      (q, 'Money laundering (pencucian uang)', 3, FALSE);

    -- Q37 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Bukti audit yang paling dapat diandalkan (reliable) berasal dari:', 36) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Pernyataan lisan manajemen dalam rapat pembahasan audit', 0, FALSE),
      (q, 'Sumber eksternal yang independen dari perusahaan klien', 1, TRUE),
      (q, 'Dokumen internal yang dibuat oleh staf akuntansi klien', 2, FALSE),
      (q, 'Estimasi manajemen yang telah disetujui oleh dewan direksi', 3, FALSE);

    -- Q38 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam audit, "representasi tertulis" (written representations) dari manajemen berfungsi sebagai:', 37) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Konfirmasi atas pernyataan manajemen dan pengakuan tanggung jawabnya atas laporan keuangan', 0, TRUE),
      (q, 'Bukti utama yang menggantikan prosedur substantif', 1, FALSE),
      (q, 'Dokumen yang menjamin tidak ada kecurangan dalam perusahaan', 2, FALSE),
      (q, 'Syarat yang harus dipenuhi untuk menerbitkan opini wajar tanpa pengecualian', 3, FALSE);

    -- Q39 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Komunikasi auditor dengan "those charged with governance" (pihak yang bertanggung jawab atas tata kelola) meliputi:', 38) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Tanggung jawab auditor, temuan signifikan dari audit, dan masalah kualitas independensi', 0, TRUE),
      (q, 'Laporan keuangan yang telah diaudit secara lengkap', 1, FALSE),
      (q, 'Rekomendasi strategi bisnis untuk meningkatkan profitabilitas', 2, FALSE),
      (q, 'Daftar seluruh kesalahan yang ditemukan tanpa terkecuali', 3, FALSE);

    -- Q40 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Manakah dari berikut ini yang BUKAN merupakan komponen dari COSO Internal Control Framework?', 39) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Analisis pesaing (competitor analysis)', 0, TRUE),
      (q, 'Lingkungan pengendalian (control environment)', 1, FALSE),
      (q, 'Penilaian risiko (risk assessment)', 2, FALSE),
      (q, 'Aktivitas pengendalian (control activities)', 3, FALSE);

    -- Q41 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Audit atas perkiraan akuntansi (accounting estimates) memerlukan perhatian khusus karena:', 40) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Perkiraan akuntansi selalu dibuat dengan sengaja untuk menyesatkan pengguna laporan', 0, FALSE),
      (q, 'Perkiraan akuntansi melibatkan ketidakpastian dan penilaian subjektif manajemen', 1, TRUE),
      (q, 'Standar akuntansi melarang penggunaan perkiraan dalam laporan keuangan', 2, FALSE),
      (q, 'Perkiraan akuntansi tidak memiliki dampak material terhadap laporan keuangan', 3, FALSE);

    -- Q42 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Rotasi auditor (audit firm rotation) yang diwajibkan regulator bertujuan untuk:', 41) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Memastikan setiap Kantor Akuntan Publik mendapatkan bagian klien yang merata', 0, FALSE),
      (q, 'Menjaga independensi dan objektivitas auditor dari pengaruh hubungan jangka panjang dengan klien', 1, TRUE),
      (q, 'Mengurangi biaya audit yang harus dibayarkan oleh perusahaan klien', 2, FALSE),
      (q, 'Memberikan kesempatan bagi auditor baru untuk memperoleh pengalaman', 3, FALSE);

    -- Q43 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam metodologi audit berbasis risiko, setelah auditor mengidentifikasi risiko salah saji material, langkah selanjutnya adalah:', 42) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Langsung menyampaikan temuan kepada manajemen klien', 0, FALSE),
      (q, 'Merancang dan melaksanakan respons audit yang tepat terhadap risiko yang teridentifikasi', 1, TRUE),
      (q, 'Menghentikan perikatan audit jika risiko terlalu tinggi', 2, FALSE),
      (q, 'Menerbitkan laporan audit dengan pengecualian', 3, FALSE);

    -- Q44 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Apa yang dimaksud dengan "audit trail" dalam konteks sistem informasi akuntansi?', 43) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Jalur fisik yang digunakan auditor saat melakukan kunjungan ke klien', 0, FALSE),
      (q, 'Catatan kronologis aktivitas sistem yang memungkinkan rekonstruksi dan penelusuran transaksi', 1, TRUE),
      (q, 'Daftar semua auditor yang pernah terlibat dalam audit suatu perusahaan', 2, FALSE),
      (q, 'Sistem pelacakan waktu dan biaya yang digunakan oleh kantor akuntan publik', 3, FALSE);

    -- Q45 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Perencanaan audit (audit planning) yang memadai penting karena:', 44) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Memastikan audit difokuskan pada area berisiko tinggi dan dilaksanakan secara efisien dan efektif', 0, TRUE),
      (q, 'Menjamin bahwa tidak ada salah saji dalam laporan keuangan klien', 1, FALSE),
      (q, 'Memungkinkan auditor untuk menetapkan honorarium yang lebih tinggi', 2, FALSE),
      (q, 'Mengurangi tanggung jawab hukum auditor terhadap pihak ketiga', 3, FALSE);

    -- Q46 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam pengujian pengendalian (tests of controls), "reperformance" berarti auditor:', 45) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Melaksanakan kembali suatu prosedur pengendalian yang sebelumnya dilakukan oleh personel klien', 0, TRUE),
      (q, 'Meminta klien untuk mengulangi prosedur pengendalian yang gagal', 1, FALSE),
      (q, 'Mengamati secara langsung pelaksanaan prosedur pengendalian oleh staf klien', 2, FALSE),
      (q, 'Mengevaluasi dokumentasi pengendalian yang dibuat oleh klien', 3, FALSE);

    -- Q47 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Hubungan antara risiko audit yang dapat diterima (acceptable audit risk) dengan luas prosedur audit adalah:', 46) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Berbanding lurus: semakin tinggi risiko yang dapat diterima, semakin luas prosedur audit', 0, FALSE),
      (q, 'Berbanding terbalik: semakin rendah risiko yang dapat diterima, semakin luas prosedur audit', 1, TRUE),
      (q, 'Tidak ada hubungan antara keduanya', 2, FALSE),
      (q, 'Hanya relevan untuk audit perusahaan publik', 3, FALSE);

    -- Q48 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Standar audit mengharuskan auditor untuk mempertimbangkan risiko kecurangan dalam setiap penugasan karena:', 47) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Kecurangan dapat menyebabkan salah saji material yang mempengaruhi kewajaran laporan keuangan', 0, TRUE),
      (q, 'Auditor bertanggung jawab untuk mencegah semua bentuk kecurangan', 1, FALSE),
      (q, 'Regulator mewajibkan auditor untuk mendeteksi setiap kasus kecurangan', 2, FALSE),
      (q, 'Kecurangan selalu melibatkan nilai yang material', 3, FALSE);

    -- Q49 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Apa yang dimaksud dengan "Subsequent Events" dalam audit?', 48) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Peristiwa atau kondisi yang terjadi setelah tanggal laporan keuangan hingga tanggal laporan audit', 0, TRUE),
      (q, 'Kejadian penting yang terjadi selama periode yang diaudit', 1, FALSE),
      (q, 'Transaksi material yang baru diketahui setelah laporan audit diterbitkan', 2, FALSE),
      (q, 'Perubahan kebijakan akuntansi yang diterapkan pada periode berikutnya', 3, FALSE);

    -- Q50 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Tujuan dari "peer review" (penelaahan sejawat) pada Kantor Akuntan Publik adalah untuk:', 49) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Menilai kompetensi teknis partner audit secara individual', 0, FALSE),
      (q, 'Menetapkan honorarium yang kompetitif di pasar', 1, FALSE),
      (q, 'Mengevaluasi apakah KAP telah mematuhi standar pengendalian mutu dalam praktik auditnya', 2, TRUE),
      (q, 'Membandingkan kualitas audit antar KAP untuk kepentingan kompetisi', 3, FALSE);

    -- ── From: Risk based audit - kuis kelas B.pdf (Q51–Q66) ──

    -- Q51 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam kerangka COSO ERM, "risk appetite" (selera risiko) didefinisikan sebagai:', 50) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Jumlah maksimum kerugian yang dapat mengakibatkan kebangkrutan perusahaan', 0, FALSE),
      (q, 'Risiko residual yang tersisa setelah penerapan seluruh pengendalian', 1, FALSE),
      (q, 'Jumlah risiko yang bersedia ditanggung oleh organisasi dalam mengejar tujuannya', 2, TRUE),
      (q, 'Risiko yang wajib diasuransikan oleh perusahaan', 3, FALSE);

    -- Q52 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam audit berbasis risiko, "significant risk" (risiko signifikan) memerlukan penanganan khusus karena:', 51) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Risiko tersebut pasti akan menghasilkan salah saji material', 0, FALSE),
      (q, 'Risiko tersebut memerlukan pertimbangan audit khusus karena penilaian risiko inheren dan faktor lainnya yang tinggi', 1, TRUE),
      (q, 'Risiko tersebut hanya dapat ditangani oleh partner audit yang berpengalaman', 2, FALSE),
      (q, 'Risiko tersebut tidak dapat dimitigasi oleh pengendalian internal', 3, FALSE);

    -- Q53 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Manakah situasi berikut yang paling tepat mengindikasikan bahwa auditor harus memodifikasi opininya?', 52) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Perusahaan mengubah metode penyusutan aset tetap dan mengungkapkannya secara memadai', 0, FALSE),
      (q, 'Auditor tidak dapat memperoleh bukti yang cukup mengenai saldo piutang yang material karena klien menolak konfirmasi eksternal', 1, TRUE),
      (q, 'Perusahaan menggunakan estimasi akuntansi yang berbeda dari tahun sebelumnya', 2, FALSE),
      (q, 'Terdapat ketidakpastian yang telah diungkapkan secara memadai dalam catatan atas laporan keuangan', 3, FALSE);

    -- Q54 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Prosedur "inspeksi" (inspection) dalam audit digunakan untuk memeriksa:', 53) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Cara pelaksanaan suatu aktivitas oleh staf klien secara real-time', 0, FALSE),
      (q, 'Konsistensi jawaban manajemen dengan bukti lain yang diperoleh', 1, FALSE),
      (q, 'Dokumen, catatan, atau aset fisik yang relevan dengan audit', 2, TRUE),
      (q, 'Hubungan antar data dalam laporan keuangan', 3, FALSE);

    -- Q55 (correct: D = index 3)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Apa yang membedakan "audit kepatuhan" (compliance audit) dari "audit laporan keuangan"?', 54) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Audit kepatuhan dilakukan oleh auditor internal, sementara audit laporan keuangan oleh auditor eksternal', 0, FALSE),
      (q, 'Audit kepatuhan tidak memerlukan pengumpulan bukti audit', 1, FALSE),
      (q, 'Audit laporan keuangan berfokus pada efisiensi, sedangkan audit kepatuhan pada kewajaran penyajian', 2, FALSE),
      (q, 'Audit kepatuhan menilai apakah entitas mematuhi peraturan dan kebijakan yang berlaku, bukan kewajaran penyajian laporan keuangan', 3, TRUE);

    -- Q56 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam audit atas persediaan, prosedur "stock opname" (penghitungan fisik) terutama memberikan bukti untuk asersi:', 55) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Penilaian (valuation) persediaan', 0, FALSE),
      (q, 'Eksistensi (existence) persediaan', 1, TRUE),
      (q, 'Kelengkapan (completeness) persediaan', 2, FALSE),
      (q, 'Hak dan kewajiban (rights and obligations) atas persediaan', 3, FALSE);

    -- Q57 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Audit atas pihak-pihak berelasi (related party transactions) memerlukan perhatian khusus karena:', 56) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Transaksi pihak berelasi selalu dilakukan pada harga yang tidak wajar', 0, FALSE),
      (q, 'Transaksi tersebut mungkin tidak dilakukan pada nilai wajar dan rentan terhadap kecurangan', 1, TRUE),
      (q, 'Standar akuntansi melarang semua transaksi dengan pihak berelasi', 2, FALSE),
      (q, 'Transaksi pihak berelasi selalu memerlukan persetujuan pemegang saham', 3, FALSE);

    -- Q58 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Manakah dari berikut ini yang merupakan contoh "key audit matter" (KAM) yang mungkin dilaporkan dalam laporan audit?', 57) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Jumlah total honorarium yang dibayarkan kepada kantor akuntan publik', 0, FALSE),
      (q, 'Penilaian goodwill yang memerlukan estimasi manajemen dengan ketidakpastian tinggi', 1, TRUE),
      (q, 'Jumlah hari yang digunakan untuk menyelesaikan audit', 2, FALSE),
      (q, 'Nama-nama staf audit yang terlibat dalam penugasan', 3, FALSE);

    -- Q59 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam konteks audit sistem informasi, "General IT Controls" (GITC) mencakup:', 58) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Kontrol yang tertanam langsung dalam aplikasi bisnis seperti validasi input', 0, FALSE),
      (q, 'Pengendalian atas proses bisnis yang menggunakan sistem komputer', 1, FALSE),
      (q, 'Pengendalian atas manajemen perubahan, akses logis, dan kelangsungan operasi TI', 2, TRUE),
      (q, 'Kontrol manual yang dilakukan oleh pengguna akhir sistem', 3, FALSE);

    -- Q60 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Apa yang dimaksud dengan "tolerable misstatement" dalam perencanaan sampel audit?', 59) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Salah saji maksimum yang boleh ada dalam satu transaksi', 0, FALSE),
      (q, 'Total salah saji aktual yang ditemukan selama prosedur audit', 1, FALSE),
      (q, 'Jumlah salah saji maksimum yang masih dapat diterima dalam suatu populasi tanpa mempengaruhi kewajaran laporan keuangan', 2, TRUE),
      (q, 'Salah saji yang terlalu kecil untuk dilaporkan kepada manajemen', 3, FALSE);

    -- Q61 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Auditor menemukan bahwa klien telah mencatat pendapatan Rp5 miliar dari kontrak yang syarat pengiriman (delivery terms) belum terpenuhi pada tanggal pelaporan. Temuan ini paling berkaitan dengan asersi:', 60) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Kelengkapan (completeness)', 0, FALSE),
      (q, 'Penilaian (valuation)', 1, FALSE),
      (q, 'Cut-off dan eksistensi', 2, TRUE),
      (q, 'Pengklasifikasian (classification)', 3, FALSE);

    -- Q62 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Dalam audit atas aset tetap, prosedur pemeriksaan fisik (physical inspection) terutama memberikan bukti untuk asersi:', 61) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Penilaian (valuation) aset tetap', 0, FALSE),
      (q, 'Pengungkapan (disclosure) aset tetap', 1, FALSE),
      (q, 'Eksistensi (existence) aset tetap', 2, TRUE),
      (q, 'Kelengkapan (completeness) aset tetap', 3, FALSE);

    -- Q63 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Manakah dari kondisi berikut yang paling memerlukan pertimbangan auditor tentang kelangsungan usaha (going concern)?', 62) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Perusahaan baru saja berhasil merestrukturisasi seluruh utangnya', 0, FALSE),
      (q, 'Perusahaan membukukan laba yang lebih rendah dari target awal', 1, FALSE),
      (q, 'Perusahaan memiliki ekuitas negatif dan gagal membayar utang jatuh tempo secara berulang', 2, TRUE),
      (q, 'Industri tempat perusahaan beroperasi sedang mengalami perlambatan pertumbuhan', 3, FALSE);

    -- Q64 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Ketika auditor mengeluarkan laporan dengan "opini wajar dengan pengecualian" (qualified opinion), hal tersebut berarti:', 63) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Laporan keuangan tidak menyajikan secara wajar dalam semua hal yang material', 0, FALSE),
      (q, 'Auditor tidak dapat memberikan pendapat apapun atas laporan keuangan', 1, FALSE),
      (q, 'Laporan keuangan menyajikan secara wajar kecuali untuk dampak dari satu atau beberapa hal tertentu', 2, TRUE),
      (q, 'Auditor menemukan kecurangan yang belum diselesaikan oleh manajemen', 3, FALSE);

    -- Q65 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Manakah dari berikut ini yang BUKAN merupakan faktor yang meningkatkan risiko inheren?', 64) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Transaksi yang kompleks dan tidak rutin', 0, FALSE),
      (q, 'Estimasi akuntansi yang memerlukan pertimbangan subjektif yang tinggi', 1, FALSE),
      (q, 'Adanya pengendalian internal yang kuat dan telah diuji efektivitasnya', 2, TRUE),
      (q, 'Perubahan signifikan dalam industri atau regulasi yang berlaku', 3, FALSE);

    -- Q66 (correct: A = index 0)
    INSERT INTO questions (section_id, text, position) VALUES (s3, 'Apa tujuan utama dari "Standar Pengendalian Mutu" (Quality Control Standards) bagi Kantor Akuntan Publik?', 65) RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Memastikan bahwa KAP dan seluruh personelnya mematuhi standar profesional dan menerbitkan laporan yang tepat sesuai kondisi', 0, TRUE),
      (q, 'Menetapkan tarif honorarium minimum yang boleh ditagihkan oleh KAP', 1, FALSE),
      (q, 'Membatasi jumlah klien yang dapat ditangani oleh seorang partner', 2, FALSE),
      (q, 'Mengatur jadwal rotasi auditor yang wajib diikuti oleh seluruh KAP', 3, FALSE);

    -- ── Additional (AI-generated) questions — Risk Based Audit ──

    -- AQ1 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position, source) VALUES (s3, 'Peran utama komite audit (audit committee) dalam tata kelola perusahaan adalah:', 66, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Melaksanakan audit harian atas transaksi keuangan perusahaan secara langsung', 0, FALSE),
      (q, 'Mengawasi proses pelaporan keuangan, sistem pengendalian internal, dan perikatan audit eksternal', 1, TRUE),
      (q, 'Menyetujui anggaran tahunan dan rencana investasi perusahaan', 2, FALSE),
      (q, 'Melakukan investigasi forensik setiap kali ada dugaan kecurangan', 3, FALSE);

    -- AQ2 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position, source) VALUES (s3, 'Sistem pelaporan pelanggaran (whistleblowing system) dalam suatu organisasi terutama berfungsi untuk:', 67, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Menggantikan fungsi audit internal dalam mendeteksi kecurangan', 0, FALSE),
      (q, 'Memungkinkan karyawan melaporkan dugaan pelanggaran atau penyimpangan secara aman kepada pihak yang berwenang', 1, TRUE),
      (q, 'Memberikan perlindungan hukum bagi karyawan yang melakukan pelanggaran ringan', 2, FALSE),
      (q, 'Mendokumentasikan seluruh keputusan manajemen untuk keperluan kepatuhan regulasi', 3, FALSE);

    -- AQ3 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position, source) VALUES (s3, 'Pernyataan manakah yang paling tepat menggambarkan perbedaan antara pengujian pengendalian (tests of controls) dan prosedur substantif (substantive procedures)?', 68, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Pengujian pengendalian menilai kebenaran saldo akun, sementara prosedur substantif mengevaluasi rancangan pengendalian', 0, FALSE),
      (q, 'Prosedur substantif hanya dilakukan apabila pengendalian internal dinilai tidak efektif', 1, FALSE),
      (q, 'Pengujian pengendalian mengevaluasi apakah pengendalian berjalan efektif, sementara prosedur substantif memperoleh bukti tentang kebenaran saldo dan transaksi laporan keuangan', 2, TRUE),
      (q, 'Tidak ada perbedaan yang berarti; keduanya merujuk pada prosedur audit yang sama', 3, FALSE);

    -- AQ4 (correct: C = index 2)
    INSERT INTO questions (section_id, text, position, source) VALUES (s3, 'Continuous auditing (audit kontinu) berbeda dari audit periodik tradisional karena:', 69, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Membutuhkan tim audit yang lebih besar dan lebih banyak sumber daya dibandingkan audit periodik', 0, FALSE),
      (q, 'Berfokus secara eksklusif pada sistem teknologi informasi, bukan laporan keuangan', 1, FALSE),
      (q, 'Memungkinkan auditor memberikan asurans atas informasi keuangan secara lebih sering, sering kali menggunakan alat otomatis', 2, TRUE),
      (q, 'Hanya dapat diterapkan pada fungsi audit internal, bukan audit eksternal', 3, FALSE);

    -- AQ5 (correct: B = index 1)
    INSERT INTO questions (section_id, text, position, source) VALUES (s3, 'Penggunaan data analytics (analitik data) dalam audit modern terutama membantu auditor untuk:', 70, 'additional') RETURNING id INTO q;
    INSERT INTO choices (question_id, text, position, is_correct) VALUES
      (q, 'Menghilangkan kebutuhan akan pertimbangan profesional dalam menilai bukti audit', 0, FALSE),
      (q, 'Menganalisis seluruh populasi transaksi, bukan hanya sampel, sehingga penilaian risiko menjadi lebih komprehensif', 1, TRUE),
      (q, 'Menggantikan sepenuhnya prosedur konfirmasi dan pemeriksaan fisik', 2, FALSE),
      (q, 'Membantu klien menyusun laporan keuangannya dengan lebih efisien', 3, FALSE);

  END IF;
END $$;
