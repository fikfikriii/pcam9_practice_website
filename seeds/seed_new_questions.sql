-- seed_new_questions.sql
-- Adds questions from:
--   1) Kuis Akuntansi PCS 8 - Noted.pdf      → 32 questions → Akuntansi
--   2) Soal Akuntansi x Audit MLE - Noted.pdf → 32 questions → Akuntansi
--                                              → 50 questions → Risk Based Audit
-- All source = 'original' (class materials)
-- Positions are appended after the current MAX(position) per section.

DO $$
DECLARE
  sec_akuntansi INTEGER;
  sec_audit     INTEGER;
  pos_a         INTEGER;
  pos_r         INTEGER;
  q_id          INTEGER;
BEGIN
  SELECT id INTO sec_akuntansi FROM sections WHERE title = 'Akuntansi';
  SELECT id INTO sec_audit     FROM sections WHERE title = 'Risk Based Audit';

  SELECT COALESCE(MAX(position), 0) INTO pos_a FROM questions WHERE section_id = sec_akuntansi;
  SELECT COALESCE(MAX(position), 0) INTO pos_r FROM questions WHERE section_id = sec_audit;

  -- =====================================================================
  -- KUIS AKUNTANSI PCS 8 (32 questions, Q1-Q10, Q12-Q33)
  -- =====================================================================

  -- Q1
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Titik awal dari proses akuntansi adalah aktivitas:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'mengomunikasikan informasi kepada pengguna.', FALSE),
    (q_id, 'mengidentifikasikan kejadian-kejadian ekonomi.', TRUE),
    (q_id, 'mencatat kejadian-kejadian ekonomi.', FALSE),
    (q_id, 'mengklasifikasikan transaksi ke dalam buku besar akun.', FALSE);

  -- Q2
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Periode bulanan dan triwulanan disebut:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'periode kalendar.', FALSE),
    (q_id, 'periode fiskal.', FALSE),
    (q_id, 'periode interim.', TRUE),
    (q_id, 'periode kuarter.', FALSE);

  -- Q3
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Informasi data untuk menyusun neraca saldo/neraca percobaan pada kertas kerja diperoleh dari:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'laporan keuangan.', FALSE),
    (q_id, 'akun-akun buku besar.', TRUE),
    (q_id, 'entri jurnal umum.', FALSE),
    (q_id, 'dokumen bisnis.', FALSE);

  -- Q4
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Akuntan menyebut kejadian-kejadian ekonomi sebagai:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'pembelian.', FALSE),
    (q_id, 'penjualan.', FALSE),
    (q_id, 'transaksi.', TRUE),
    (q_id, 'perubahan kepemilikan.', FALSE);

  -- Q5
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Prinsip pengakuan biaya (expense recognition principles) menyebutkan bahwa:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Dalam setiap transaksi, pencatatan debit harus selalu sama dengan kredit.', FALSE),
    (q_id, 'Biaya diakui pada saat kewajiban pelaksanaan telah terselesaikan.', FALSE),
    (q_id, 'Biaya diakui pada perioda yang sama dengan pendapatan terkait diakui.', TRUE),
    (q_id, 'Biaya diakui pada saat kas dikeluarkan/dibayarkan.', FALSE);

  -- Q6
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Mana dari pernyataan berikut tentang IFRS dan U.S. GAAP yang benar?', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'U.S. GAAP dianggap lebih "principles-based" dan lebih rinci daripada IFRS.', FALSE),
    (q_id, 'U.S. GAAP dianggap lebih "rules-based" dan kurang rinci daripada IFRS.', FALSE),
    (q_id, 'IFRS dianggap lebih "principles-based" dan kurang rinci daripada U.S. GAAP.', TRUE),
    (q_id, 'Kedua U.S. GAAP dan IFRS dianggap "rules-based", tetapi U.S. GAAP lebih kompleks.', FALSE);

  -- Q7
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Tujuan utama pelaporan keuangan adalah menyediakan informasi yang:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'berguna untuk kreditor dan investor dalam pengambilan keputusan.', TRUE),
    (q_id, 'menggambarkan secara jelas transaksi-transaksi non keuangan.', FALSE),
    (q_id, 'berguna untuk menilai jumlah, waktu, dan ketidakpastian penerimaan kas.', FALSE),
    (q_id, 'bukan merupakan klaim terhadap sumberdaya.', FALSE);

  -- Q8
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Asumsi bahwa suatu bisnis tidak akan dijual atau dilikuidasi dalam waktu dekat dikenal sebagai:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'asumsi kesatuan usaha.', FALSE),
    (q_id, 'asumsi unit moneter.', FALSE),
    (q_id, 'asumsi materialitas.', FALSE),
    (q_id, 'tidak ada jawaban yang benar.', TRUE);

  -- Q9
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Pendukung dari kos historis berargumen bahwa dibandingkan dengan cara penilaian lainnya, laporan yang menggunakan kos historis adalah lebih:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'dapat diverifikasi kebenarannya.', TRUE),
    (q_id, 'relevan.', FALSE),
    (q_id, 'menunjukkan daya beli perusahaan.', FALSE),
    (q_id, 'konservatif.', FALSE);

  -- Q10
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Pendapatan biasanya diakui pada saat:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'akhir produksi.', FALSE),
    (q_id, 'penerimaan kas.', FALSE),
    (q_id, 'direalisasikan.', FALSE),
    (q_id, 'diselesaikannya kewajiban pelaksanaan.', TRUE);

  -- Q12 (Q11 not in PDF)
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Mana dari berikut ini yang bukan merupakan komponen laporan keuangan yang sesuai dengan prinsip akuntansi berterima umum?', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Surat direktur utama kepada pemegang saham.', TRUE),
    (q_id, 'Laporan posisi keuangan.', FALSE),
    (q_id, 'Laporan laba rugi dan penghasilan komprehensif lain.', FALSE),
    (q_id, 'Catatan atas laporan keuangan.', FALSE);

  -- Q13
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Mana dari berikut ini yang merupakan kualitas fundamental dari informasi akuntansi yang bermanfaat?', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Komparabilitas.', FALSE),
    (q_id, 'Relevan.', TRUE),
    (q_id, 'Konsistensi.', FALSE),
    (q_id, 'Materialitas.', FALSE);

  -- Q14
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Apa yang dimaksud dengan komparabilitas dalam informasi akuntansi keuangan?', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Informasi mempunyai daya prediksi atau nilai feedback.', FALSE),
    (q_id, 'Informasi bebas dari kesalahan.', FALSE),
    (q_id, 'Informasi yang diukur dan dilaporkan dengan cara yang sama antar perusahaan.', TRUE),
    (q_id, 'Informasi tepat waktu.', FALSE);

  -- Q15
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Dalam pelaporan keuangan, pengukuran (measurement) merupakan prinsip yang sangat penting dan meliputi:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'prinsip nilai wajar saja.', FALSE),
    (q_id, 'prinsip biaya historis saja.', FALSE),
    (q_id, 'prinsip pengakuan pendapatan dan prinsip pengakuan biaya.', FALSE),
    (q_id, 'prinsip kos historis dan prinsip nilai wajar.', TRUE);

  -- Q16
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Manakah dari aktivitas berikut ini yang merupakan tahapan opsional pada siklus akuntansi pada suatu entitas bisnis?', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Analisis transaksi bisnis.', FALSE),
    (q_id, 'Menyusun kertas kerja.', TRUE),
    (q_id, 'Menyusun neraca saldo/neraca percobaan.', FALSE),
    (q_id, 'Posting ke buku besar akun.', FALSE);

  -- Q17
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, '"Penghasilan komprehensif lain":', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'diakumulasikan dan disajikan sebagai bagian ekuitas dari laporan posisi keuangan.', TRUE),
    (q_id, 'merupakan bagian dari laporan laba rugi.', FALSE),
    (q_id, 'diakumulasikan dan disajikan sebagai bagian akun laba ditahan.', FALSE),
    (q_id, 'bukan merupakan bagian dari laporan laba rugi dan penghasilan komprehensif lain.', FALSE);

  -- Q18
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Laporan laba rugi dan penghasilan komprehensif lain memiliki keterbatasan berikut, kecuali:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'akun/item yang tidak dapat diukur secara andal tidak dilaporkan.', FALSE),
    (q_id, 'pengakuan pendapatan dipengaruhi oleh metode akuntansi yang digunakan.', FALSE),
    (q_id, 'pengakuan pendapatan melibatkan penilaian konsiderasi yang sering kali tidak mudah ditentukan.', FALSE),
    (q_id, 'hanya jumlah aktual yang dilaporkan dalam menentukan laba bersih.', TRUE);

  -- Q19
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Jika liabilitas/kewajiban total berkurang sebesar Rp30.000.000 dan ekuitas/modal pemilik berkurang sebesar Rp15.000.000 selama periode operasional, maka bagaimanakah perubahan dari aset total selama periode yang sama?', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'berkurang Rp45.000.000.', TRUE),
    (q_id, 'berkurang Rp15.000.000.', FALSE),
    (q_id, 'meningkat Rp15.000.000.', FALSE),
    (q_id, 'meningkat Rp45.000.000.', FALSE);

  -- Q20
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Keuntungan atau kerugian yang belum terealisasi (unrealized gain or loss) disajikan sebagai bagian dari:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Laporan perubahan ekuitas.', FALSE),
    (q_id, 'Ekuitas dalam laporan posisi keuangan.', FALSE),
    (q_id, 'Laporan laba rugi.', FALSE),
    (q_id, 'Laporan penghasilan komprehensif lain.', TRUE);

  -- Q21
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Informasi dalam laporan laba rugi membantu pengguna untuk: 1) mengevaluasi kinerja masa lalu perusahaan; 2) memberikan dasar untuk memprediksi kinerja masa depan; 3) membantu menilai risiko atau ketidakpastian dalam mencapai arus kas masa depan. Sebagai konsekuensinya:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'item yang terjadi secara berulang disajikan secara terpisah dari item yang terjadi secara tidak berulang.', TRUE),
    (q_id, 'format penyajian harus disajikan berdasarkan fungsi.', FALSE),
    (q_id, 'penyajian dikategorikan ke dalam aktivitas operasi, investasi, dan pendanaan.', FALSE),
    (q_id, 'tidak ada jawaban yang tepat.', FALSE);

  -- Q22
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Jika bahan habis pakai kantor yang dibeli telah digunakan selama operasional bisnis, maka:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'kewajiban akan meningkat.', FALSE),
    (q_id, 'aset akan meningkat.', FALSE),
    (q_id, 'ekuitas/modal pemilik akan berkurang.', TRUE),
    (q_id, 'ekuitas/modal pemilik akan meningkat.', FALSE);

  -- Q23
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Laporan arus kas memberikan jawaban atas semua pertanyaan berikut, kecuali:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'dari mana kas itu berasal dan untuk apa kas digunakan selama periode tersebut?', FALSE),
    (q_id, 'berapa ketersediaan kas untuk mendukung operasi perusahaan?', FALSE),
    (q_id, 'apa dampak inflasi terhadap saldo kas pada akhir tahun?', TRUE),
    (q_id, 'berapakah perubahan saldo kas selama periode tersebut?', FALSE);

  -- Q24
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Langkah-langkah dalam menyusun neraca saldo/neraca percobaan meliputi semua langkah berikut ini, kecuali:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'mendaftar nama akun dan saldo masing-masing akun.', FALSE),
    (q_id, 'menjumlahkan total pada kolom debit dan kredit.', FALSE),
    (q_id, 'membuktikan kesamaan jumlah kedua kolom debit dan kredit.', FALSE),
    (q_id, 'mentransfer jumlah yang dijurnal ke buku besar akun.', TRUE);

  -- Q25
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Jika biaya dibayar di muka pada awalnya dicatat pada akun biaya dan tidak semua digunakan pada akhir periode akuntansi, jika tidak dibuat jurnal penyesuaian maka akan menyebabkan:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'aset dilaporkan lebih besar dari yang seharusnya (overstated).', FALSE),
    (q_id, 'aset dilaporkan lebih kecil dari yang seharusnya (understated).', TRUE),
    (q_id, 'biaya dilaporkan lebih rendah dari yang seharusnya (understated).', FALSE),
    (q_id, 'akun kontra dilaporkan lebih besar dari yang seharusnya (overstated).', FALSE);

  -- Q26
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut ini merupakan karakteristik dari informasi akuntansi, kecuali:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'penyajian terpercaya (faithful representation).', FALSE),
    (q_id, 'keterbandingan (comparability).', FALSE),
    (q_id, 'relevansi (relevance).', FALSE),
    (q_id, 'fleksibilitas (flexibility).', TRUE);

  -- Q27
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'UD ABC melakukan penjualan senilai Rp50.000.000,00. Penjualan tersebut dilakukan secara tunai Rp15.000.000,00 dan sisanya akan dibayarkan kemudian. Pernyataan berikut ini yang benar menggambarkan dampak dari transaksi tersebut terhadap posisi keuangan perusahaan adalah:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aset perusahaan bertambah sebesar Rp15.000.000,00.', FALSE),
    (q_id, 'Aset perusahaan bertambah sebesar Rp50.000.000,00.', TRUE),
    (q_id, 'Ekuitas perusahaan bertambah sebesar Rp15.000.000,00.', FALSE),
    (q_id, 'Ekuitas perusahaan berkurang sebesar Rp35.000.000,00.', FALSE);

  -- Q28
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Biaya penyusutan dalam satu periode mencerminkan:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perubahan nilai buku aset dibandingkan nilai pasar pada akhir periode.', FALSE),
    (q_id, 'Alokasi nilai wajar aset yang turun pada akhir periode hingga masa manfaat habis.', FALSE),
    (q_id, 'Perwujudan asumsi unit moneter dalam akuntansi, khususnya pada aset tetap.', FALSE),
    (q_id, 'Alokasi harga perolehan aset yang telah dimanfaatkan dalam satu periode.', TRUE);

  -- Q29
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Firma SAH menandatangani kontrak untuk partner kuasa hukum yang baru. Partner tersebut akan memperoleh gaji tahunan Rp120.000.000 per tahun. Jurnal untuk mencatat kejadian tersebut adalah:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kejadian tersebut tidak perlu dijurnal karena belum mengubah posisi keuangan perusahaan.', TRUE),
    (q_id, 'Debit Biaya Gaji Rp120.000.000; Kredit Utang Gaji Rp120.000.000.', FALSE),
    (q_id, 'Debit Biaya Gaji Rp120.000.000; Kredit Kas Rp120.000.000.', FALSE),
    (q_id, 'Debit Utang Gaji Rp120.000.000; Kredit Biaya Gaji Rp120.000.000.', FALSE);

  -- Q30
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'UD ABC menerima pembayaran di muka dari konsumen sebesar Rp800.000 atas jasa yang akan dilakukan 3 bulan dari sekarang. Atas kejadian ini, efek pada posisi keuangan dan persamaan dasar akuntansi yang terjadi adalah:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tidak ada efek, karena pendapatan belum terjadi.', FALSE),
    (q_id, 'Aset dan ekuitas meningkat sebesar Rp800.000.', FALSE),
    (q_id, 'Aset dan kewajiban meningkat sebesar Rp800.000.', TRUE),
    (q_id, 'Aset dan pendapatan meningkat sebesar Rp800.000.', FALSE);

  -- Q31
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Manakah dari berikut ini yang bukan merupakan penerapan yang tepat dari prinsip pengakuan pendapatan?', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mencatat pendapatan sebagai jurnal penyesuaian pada akhir periode akuntansi atas jasa yang sudah diserahkan namun belum dicatat.', FALSE),
    (q_id, 'Mencatat pendapatan atas penerimaan kas dari konsumen untuk jasa yang akan diserahkan tiga bulan kemudian.', TRUE),
    (q_id, 'Mencatat pendapatan dari tagihan ke konsumen yang dibuat tanggal 30 Juni atas jasa yang sudah dilakukan selama Bulan Juni.', FALSE),
    (q_id, 'Mencatat pendapatan atas kas yang diterima atas jasa yang telah dilakukan.', FALSE);

  -- Q32
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Manakah yang tidak benar tentang Amandemen PSAK:', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menambahkan pedoman pendukung untuk meningkatkan keterpahaman prinsip.', FALSE),
    (q_id, 'Mengklarifikasi prinsip dan persyaratan.', FALSE),
    (q_id, 'Mengubah persyaratan secara signifikan atau memberikan persyaratan baru.', TRUE),
    (q_id, 'Menambahkan persyaratan yang sudah ada tanpa berdampak signifikan pada praktik pelaporan keuangan.', FALSE);

  -- Q33
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut ini merupakan hal yang tidak benar tentang Standar Akuntansi Keuangan Privat (SAK EP):', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'menggantikan SAK Entitas Tanpa Akuntabilitas Publik (ETAP).', FALSE),
    (q_id, 'berlaku efektif per 1 Januari 2025 dan penerapan dini diperkenankan.', FALSE),
    (q_id, 'lebih sederhana dari versi SAK sebelumnya.', TRUE),
    (q_id, 'dilengkapi dengan Contoh Laporan Keuangan Ilustratif.', FALSE);

  -- =====================================================================
  -- SOAL AKUNTANSI x AUDIT MLE — BAGIAN I: AKUNTANSI (32 questions)
  -- =====================================================================

  -- MLE-I Q1
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Persamaan dasar akuntansi menyatakan bahwa aset sama dengan liabilitas ditambah dengan...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pendapatan.', FALSE),
    (q_id, 'Ekuitas.', TRUE),
    (q_id, 'Beban.', FALSE),
    (q_id, 'Laba Bersih.', FALSE);

  -- MLE-I Q2
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Sistem pencatatan akuntansi yang memungkinkan adanya mekanisme pengecekan terhadap keakuratan nilai sisi debit dan kredit disebut dengan...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Buku Besar.', FALSE),
    (q_id, 'Basis Kas.', FALSE),
    (q_id, 'Basis Akrual.', FALSE),
    (q_id, 'Double Entry.', TRUE);

  -- MLE-I Q3
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut merupakan pos laporan keuangan, kecuali...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Laba.', TRUE),
    (q_id, 'Penghasilan.', FALSE),
    (q_id, 'Beban.', FALSE),
    (q_id, 'Aset.', FALSE);

  -- MLE-I Q4
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut merupakan pos laporan keuangan yang akan bertambah pada posisi kredit, kecuali...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Liabilitas.', FALSE),
    (q_id, 'Penghasilan.', FALSE),
    (q_id, 'Beban.', TRUE),
    (q_id, 'Ekuitas.', FALSE);

  -- MLE-I Q5
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut merupakan pernyataan yang paling tepat tentang aset, kecuali...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aset bertambah ketika ekuitas bertambah.', FALSE),
    (q_id, 'Aset bertambah ketika utang bertambah.', FALSE),
    (q_id, 'Aset bertambah ketika beban bertambah.', TRUE),
    (q_id, 'Aset bertambah ketika penghasilan bertambah.', FALSE);

  -- MLE-I Q6
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut merupakan pos laporan keuangan yang akan bertambah pada posisi debit...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aset.', TRUE),
    (q_id, 'Ekuitas.', FALSE),
    (q_id, 'Beban.', FALSE),
    (q_id, 'Penghasilan.', FALSE);

  -- MLE-I Q7
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut merupakan tahapan dalam siklus akuntansi dimana akuntan perusahaan hampir tidak memiliki andil sama sekali...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Jurnal.', FALSE),
    (q_id, 'Buku besar.', FALSE),
    (q_id, 'Neraca saldo.', FALSE),
    (q_id, 'Bukti transaksi.', TRUE);

  -- MLE-I Q8
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Pencatatan bukti transaksi yang memadai dilakukan akuntan dalam...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Analisis transaksi.', FALSE),
    (q_id, 'Jurnal.', TRUE),
    (q_id, 'Buku besar.', FALSE),
    (q_id, 'Neraca saldo.', FALSE);

  -- MLE-I Q9
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut yang termasuk transaksi jurnal penyesuaian...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pembelian persediaan secara tunai maupun kredit.', FALSE),
    (q_id, 'Pengakuan pendapatan sewa atas pendapatan diterima dimuka.', TRUE),
    (q_id, 'Penerimaan utang bank jangka panjang.', FALSE),
    (q_id, 'Penjualan barang secara tunai maupun kredit.', FALSE);

  -- MLE-I Q10
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut adalah salah satu kemungkinan transaksi yang menyebabkan liabilitas bertambah, kecuali...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Beban gaji yang belum dibayar.', FALSE),
    (q_id, 'Kas bertambah karena utang bank.', FALSE),
    (q_id, 'Pembelian persediaan secara kredit.', FALSE),
    (q_id, 'Pengakuan beban sewa atas biaya dibayar dimuka.', TRUE);

  -- MLE-I Q11
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Apabila perusahaan melakukan penjualan barang senilai Rp500 juta, tetapi uang yang diterima hanya sebesar Rp400 juta, maka pernyataan dibawah yang paling tepat terkait transaksi ini adalah...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perusahaan mencatat sisanya sebagai piutang usaha.', TRUE),
    (q_id, 'Sisa penjualan sebesar Rp100 juta tidak jadi dilakukan oleh perusahaan.', FALSE),
    (q_id, 'Perusahaan mengembalikan uang sebesar Rp400 juta yang diterima dari pelanggan.', FALSE),
    (q_id, 'Penjualan sebenarnya hanya sebesar Rp400 juta.', FALSE);

  -- MLE-I Q12
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut adalah transaksi yang akan diikuti oleh penyesuaian (jurnal penyesuaian) di akhir periode, kecuali...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pembelian aset tetap kendaraan.', FALSE),
    (q_id, 'Pendapatan diterima dimuka atas sewa.', FALSE),
    (q_id, 'Pembelian aset tetap tanah.', TRUE),
    (q_id, 'Biaya dibayar dimuka atas sewa.', FALSE);

  -- MLE-I Q13
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Apabila perusahaan melakukan pembelian barang senilai Rp300 juta, tetapi uang yang dibayarkan hanya sebesar Rp200 juta, maka pernyataan dibawah yang paling tepat terkait transaksi ini adalah...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Sisa pembelian sebesar Rp100 juta tidak jadi dilakukan oleh perusahaan.', FALSE),
    (q_id, 'Pembelian sebenarnya hanya sebesar Rp200 juta.', FALSE),
    (q_id, 'Perusahaan menerima pengembalian uang sebesar Rp200 juta dari supplier.', FALSE),
    (q_id, 'Perusahaan mencatat sisanya sebagai utang usaha.', TRUE);

  -- MLE-I Q14
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Perusahaan membayarkan gaji pegawai sebesar Rp150 juta pada tanggal 25 setiap bulannya, tetapi pada 25 Januari perusahaan kesulitan keuangan dan belum bisa membayarkan gaji pegawai pada bulan tersebut. Bagaimana akuntan mencatat transaksi ini...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mencatat beban gaji (debit) dan kas (kredit).', FALSE),
    (q_id, 'Mencatat akrual/utang beban (debit) dan beban gaji (kredit).', FALSE),
    (q_id, 'Mencatat beban gaji (debit) dan akrual/utang beban (kredit).', TRUE),
    (q_id, 'Tidak mencatat apapun.', FALSE);

  -- MLE-I Q15
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Perusahaan menerima tagihan listrik sebesar Rp5 juta untuk bulan Desember 2025, pada 15 Januari 2026. Bagaimana akuntan mencatat transaksi ini...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Beban listrik (debit) dan kas (kredit) dengan tanggal jurnal 15 Januari 2026.', FALSE),
    (q_id, 'Beban listrik (debit) dan akrual/utang beban (kredit) dengan tanggal jurnal "backdate" menjadi 31 Desember 2025.', TRUE),
    (q_id, 'Beban listrik (debit) dan akrual/utang beban (kredit) dengan tanggal jurnal 15 Januari 2026.', FALSE),
    (q_id, 'Tidak mencatat apapun.', FALSE);

  -- MLE-I Q16
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut adalah beban dalam akuntansi yang tidak mengeluarkan kas...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Beban penyusutan.', TRUE),
    (q_id, 'Beban gaji.', FALSE),
    (q_id, 'Beban listrik.', FALSE),
    (q_id, 'Tidak ada yang benar, semua beban mengeluarkan kas.', FALSE);

  -- MLE-I Q17
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Perusahaan menerima uang sewa sebesar Rp120 juta pada 1 Januari 2025, untuk masa selama tahun 2025. Bagaimana akuntan mencatat transaksi ini...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kas (debit) dan pendapatan sewa (kredit).', FALSE),
    (q_id, 'Pendapatan diterima dimuka (debit) dan pendapatan sewa (kredit) sebesar Rp10 juta.', FALSE),
    (q_id, 'Piutang sewa (debit) dan pendapatan sewa (kredit).', FALSE),
    (q_id, 'Kas (debit) dan pendapatan diterima dimuka (kredit).', TRUE);

  -- MLE-I Q18
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut adalah penyajian akun uang muka pembelian dalam laporan keuangan yang paling tepat...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Liabilitas jangka pendek di laporan posisi keuangan.', FALSE),
    (q_id, 'Aset lancar di laporan posisi keuangan.', TRUE),
    (q_id, 'Beban pokok penjualan di laporan laba rugi.', FALSE),
    (q_id, 'Tidak ada jawaban yang benar.', FALSE);

  -- MLE-I Q19
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut adalah penyajian akun uang muka penjualan dalam laporan keuangan yang paling tepat...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Liabilitas jangka pendek di laporan posisi keuangan.', TRUE),
    (q_id, 'Aset lancar di laporan posisi keuangan.', FALSE),
    (q_id, 'Penjualan di laporan laba rugi.', FALSE),
    (q_id, 'Tidak ada jawaban yang benar.', FALSE);

  -- MLE-I Q20
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut adalah pos laporan keuangan yang termasuk kategori beban, kecuali...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Beban listrik.', FALSE),
    (q_id, 'Beban gaji.', FALSE),
    (q_id, 'Beban pokok penjualan.', FALSE),
    (q_id, 'Biaya dibayar dimuka.', TRUE);

  -- MLE-I Q21
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut adalah jurnal yang kemungkinan besar ada dalam pencatatan transaksi akuntansi, kecuali...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Beban gaji (debit) dan kas (kredit).', FALSE),
    (q_id, 'Utang usaha (debit) dan kas (kredit).', FALSE),
    (q_id, 'Piutang usaha (debit) dan penjualan (kredit).', FALSE),
    (q_id, 'Piutang usaha (debit) dan utang usaha (kredit).', TRUE);

  -- MLE-I Q22
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut adalah pos laporan keuangan yang termasuk kategori penghasilan, kecuali...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pendapatan diterima dimuka.', TRUE),
    (q_id, 'Pendapatan dividen.', FALSE),
    (q_id, 'Pendapatan bunga.', FALSE),
    (q_id, 'Keuntungan selisih kurs.', FALSE);

  -- MLE-I Q23
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Proses posting dilakukan dengan cara...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Memindahkan setiap angka transaksi dalam neraca saldo ke laporan keuangan.', FALSE),
    (q_id, 'Memindahkan setiap angka transaksi dalam jurnal ke buku besar masing-masing pos laporan keuangan.', TRUE),
    (q_id, 'Memindahkan setiap angka transaksi dalam buku besar ke neraca saldo masing-masing pos laporan keuangan.', FALSE),
    (q_id, 'Memindahkan setiap angka transaksi dalam buku besar ke jurnal masing-masing pos laporan keuangan.', FALSE);

  -- MLE-I Q24
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut adalah tahapan dalam siklus akuntansi dimana akuntan bisa melihat seluruh saldo akhir (hanya saldo akhir) dari semua pos laporan keuangan...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Jurnal.', FALSE),
    (q_id, 'Buku besar.', FALSE),
    (q_id, 'Neraca saldo.', TRUE),
    (q_id, 'Laporan keuangan.', FALSE);

  -- MLE-I Q25
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Sesuai dengan prosedur penyusunan laporan keuangan dalam siklus akuntansi, laporan keuangan yang harus pertama kali disusun adalah...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Laporan laba rugi dan penghasilan komprehensif lain.', TRUE),
    (q_id, 'Laporan perubahan ekuitas.', FALSE),
    (q_id, 'Laporan posisi keuangan.', FALSE),
    (q_id, 'Laporan arus kas.', FALSE);

  -- MLE-I Q26
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Jenis laporan keuangan yang tidak hanya menyajikan angka, tetapi juga informasi lain seperti legalitas, jenis usaha, kebijakan akuntansi dan informasi relevan lainnya adalah...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Laporan laba rugi dan penghasilan komprehensif lain.', FALSE),
    (q_id, 'Laporan perubahan ekuitas.', FALSE),
    (q_id, 'Laporan posisi keuangan.', FALSE),
    (q_id, 'Catatan atas laporan keuangan.', TRUE);

  -- MLE-I Q27
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut adalah transaksi yang bisa mempengaruhi laba (rugi) perusahaan...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penerimaan piutang.', FALSE),
    (q_id, 'Pembayaran beban.', TRUE),
    (q_id, 'Pembagian dividen.', FALSE),
    (q_id, 'Penerimaan setoran modal.', FALSE);

  -- MLE-I Q32
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut adalah transaksi, kejadian, atau peristiwa yang akan menambah saldo laba di laporan perubahan ekuitas...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perolehan laba.', TRUE),
    (q_id, 'Kerugian perusahaan.', FALSE),
    (q_id, 'Pembagian dividen.', FALSE),
    (q_id, 'Pembayaran beban.', FALSE);

  -- MLE-I Q33
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Berikut adalah kejadian, peristiwa, atau transaksi yang bisa membuat aset perusahaan naik...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pelunasan utang usaha.', FALSE),
    (q_id, 'Pembayaran beban gaji.', FALSE),
    (q_id, 'Pembagian dividen.', FALSE),
    (q_id, 'Penerimaan utang bank.', TRUE);

  -- MLE-I Q37
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Jika terdapat setoran modal saham oleh pemegang saham secara tunai, maka transaksi ini akan tercatat di laporan arus kas dari aktivitas...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Operasional.', FALSE),
    (q_id, 'Pendanaan.', TRUE),
    (q_id, 'Investasi.', FALSE),
    (q_id, 'Tidak tercatat di laporan arus kas.', FALSE);

  -- MLE-I Q38
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Saldo akhir tahun kas dalam laporan arus kas harus sama dengan...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kas dalam aktivitas investasi.', FALSE),
    (q_id, 'Kas dalam aktivitas operasi.', FALSE),
    (q_id, 'Kas dalam laporan posisi keuangan awal tahun.', FALSE),
    (q_id, 'Kas dalam laporan posisi keuangan akhir tahun.', TRUE);

  -- MLE-I Q39
  pos_a := pos_a + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_akuntansi, 'Jika suatu perusahaan ingin menyajikan informasi susunan pemegang sahamnya, maka jenis laporan keuangan mana yang paling tepat untuk menyajikan informasi ini...', pos_a, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Catatan atas laporan keuangan.', TRUE),
    (q_id, 'Laporan posisi keuangan.', FALSE),
    (q_id, 'Laporan laba rugi dan penghasilan komprehensif lain.', FALSE),
    (q_id, 'Laporan perubahan ekuitas.', FALSE);

  -- =====================================================================
  -- SOAL AKUNTANSI x AUDIT MLE — BAGIAN II: AUDIT BERBASIS RISIKO (50 questions)
  -- =====================================================================

  -- MLE-II Q1
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Secara sederhana, audit adalah proses untuk...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Membuat laporan keuangan perusahaan.', FALSE),
    (q_id, 'Memeriksa dan mengevaluasi informasi berdasarkan bukti untuk memberikan suatu kesimpulan.', TRUE),
    (q_id, 'Menggantikan pekerjaan manajemen.', FALSE),
    (q_id, 'Menentukan strategi pemasaran.', FALSE);

  -- MLE-II Q2
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Tujuan utama audit atas laporan keuangan adalah...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menjamin perusahaan tidak akan bangkrut.', FALSE),
    (q_id, 'Menemukan semua kecurangan.', FALSE),
    (q_id, 'Meningkatkan keyakinan pengguna terhadap laporan keuangan melalui opini auditor.', TRUE),
    (q_id, 'Membuat laporan keuangan perusahaan.', FALSE);

  -- MLE-II Q3
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Pihak yang bertanggung jawab menyusun laporan keuangan adalah...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Auditor.', FALSE),
    (q_id, 'Manajemen perusahaan.', TRUE),
    (q_id, 'Bank.', FALSE),
    (q_id, 'Pemerintah.', FALSE);

  -- MLE-II Q4
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Tanggung jawab utama auditor dalam audit laporan keuangan adalah...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menyusun laporan keuangan.', FALSE),
    (q_id, 'Memberikan opini berdasarkan audit yang dilakukan.', TRUE),
    (q_id, 'Menentukan laba perusahaan.', FALSE),
    (q_id, 'Mengelola kas perusahaan.', FALSE);

  -- MLE-II Q5
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Auditor harus independen terutama agar...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Auditor dapat menggantikan manajemen.', FALSE),
    (q_id, 'Penilaian auditor tidak dipengaruhi kepentingan pihak yang diaudit.', TRUE),
    (q_id, 'Audit dapat diselesaikan tanpa bukti.', FALSE),
    (q_id, 'Auditor dapat menentukan kebijakan perusahaan.', FALSE);

  -- MLE-II Q6
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Sikap auditor yang selalu mempertanyakan dan mengevaluasi bukti secara kritis disebut...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Skeptisisme profesional.', TRUE),
    (q_id, 'Optimisme profesional.', FALSE),
    (q_id, 'Kerahasiaan administratif.', FALSE),
    (q_id, 'Manajemen risiko.', FALSE);

  -- MLE-II Q7
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Contoh skeptisisme profesional adalah...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Selalu menganggap manajemen melakukan kecurangan.', FALSE),
    (q_id, 'Menerima semua penjelasan tanpa pemeriksaan.', FALSE),
    (q_id, 'Mempertimbangkan apakah penjelasan manajemen konsisten dengan bukti yang tersedia.', TRUE),
    (q_id, 'Menolak seluruh informasi dari perusahaan.', FALSE);

  -- MLE-II Q8
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Professional judgment atau pertimbangan profesional dalam audit berarti...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Auditor bebas mengambil keputusan tanpa dasar.', FALSE),
    (q_id, 'Auditor menggunakan pengetahuan, pengalaman, standar, fakta, dan bukti untuk membuat keputusan audit.', TRUE),
    (q_id, 'Auditor mengikuti keinginan manajemen.', FALSE),
    (q_id, 'Auditor selalu menggunakan keputusan audit tahun sebelumnya.', FALSE);

  -- MLE-II Q9
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Mengapa audit tidak memberikan jaminan absolut bahwa laporan keuangan bebas dari semua kesalahan?', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Karena auditor tidak memiliki tanggung jawab.', FALSE),
    (q_id, 'Karena audit memiliki keterbatasan inheren dan dilakukan untuk memperoleh keyakinan memadai.', TRUE),
    (q_id, 'Karena auditor tidak menggunakan bukti.', FALSE),
    (q_id, 'Karena laporan keuangan tidak diperiksa.', FALSE);

  -- MLE-II Q10
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Istilah reasonable assurance dalam audit dapat dipahami sebagai...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tidak ada keyakinan.', FALSE),
    (q_id, 'Keyakinan absolut 100%.', FALSE),
    (q_id, 'Tingkat keyakinan yang tinggi, tetapi bukan jaminan mutlak.', TRUE),
    (q_id, 'Keyakinan berdasarkan pendapat manajemen saja.', FALSE);

  -- MLE-II Q11
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Risiko audit secara sederhana adalah risiko bahwa...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Auditor memberikan opini yang tidak tepat ketika laporan keuangan mengandung salah saji material.', TRUE),
    (q_id, 'Perusahaan tidak memperoleh laba.', FALSE),
    (q_id, 'Harga saham turun.', FALSE),
    (q_id, 'Auditor terlambat datang ke kantor.', FALSE);

  -- MLE-II Q12
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Materialitas dalam audit berkaitan dengan...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Warna laporan keuangan.', FALSE),
    (q_id, 'Penting atau tidaknya suatu salah saji bagi keputusan pengguna laporan keuangan.', TRUE),
    (q_id, 'Jumlah auditor dalam tim.', FALSE),
    (q_id, 'Lamanya perusahaan berdiri.', FALSE);

  -- MLE-II Q13
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Apakah kesalahan dengan nilai kecil selalu tidak material?', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Ya, selalu.', FALSE),
    (q_id, 'Tidak, sifat dan keadaan suatu kesalahan juga dapat membuatnya material.', TRUE),
    (q_id, 'Ya, jika perusahaan besar.', FALSE),
    (q_id, 'Tidak, karena semua kesalahan pasti material.', FALSE);

  -- MLE-II Q14
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Contoh informasi yang mungkin material karena sifatnya meskipun jumlahnya relatif kecil adalah...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kesalahan penulisan nama biasa.', FALSE),
    (q_id, 'Transaksi dengan pihak berelasi yang sengaja tidak diungkapkan dan penting bagi pengguna.', TRUE),
    (q_id, 'Perubahan warna formulir.', FALSE),
    (q_id, 'Pergantian meja pegawai.', FALSE);

  -- MLE-II Q15
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Mengapa auditor perlu memahami bisnis klien?', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Untuk mengambil alih perusahaan.', FALSE),
    (q_id, 'Untuk memahami transaksi dan risiko yang dapat menyebabkan salah saji material.', TRUE),
    (q_id, 'Untuk menentukan strategi penjualan perusahaan.', FALSE),
    (q_id, 'Untuk memilih pegawai perusahaan.', FALSE);

  -- MLE-II Q16
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Jika perusahaan memiliki transaksi yang sangat kompleks, auditor pada umumnya akan...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengabaikannya.', FALSE),
    (q_id, 'Mempertimbangkan peningkatan risiko dan merancang prosedur audit yang sesuai.', TRUE),
    (q_id, 'Otomatis memberikan opini tidak wajar.', FALSE),
    (q_id, 'Meminta transaksi dihapus.', FALSE);

  -- MLE-II Q17
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Risiko salah saji material yang muncul sebelum mempertimbangkan pengendalian terkait dapat berkaitan dengan...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko inheren.', TRUE),
    (q_id, 'Risiko perjalanan.', FALSE),
    (q_id, 'Risiko pemasaran.', FALSE),
    (q_id, 'Risiko investasi auditor.', FALSE);

  -- MLE-II Q18
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Risiko bahwa pengendalian perusahaan tidak mencegah atau mendeteksi dan mengoreksi salah saji secara tepat waktu disebut...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko pengendalian.', TRUE),
    (q_id, 'Risiko pasar.', FALSE),
    (q_id, 'Risiko kredit auditor.', FALSE),
    (q_id, 'Risiko investasi.', FALSE);

  -- MLE-II Q19
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Risiko bahwa prosedur auditor tidak mendeteksi salah saji material yang ada disebut...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko deteksi.', TRUE),
    (q_id, 'Risiko likuiditas.', FALSE),
    (q_id, 'Risiko bisnis.', FALSE),
    (q_id, 'Risiko operasional perusahaan.', FALSE);

  -- MLE-II Q20
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Jika suatu area dinilai memiliki risiko audit yang lebih tinggi, auditor pada umumnya perlu...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengurangi perhatian terhadap area tersebut.', FALSE),
    (q_id, 'Merancang respons audit yang lebih kuat sesuai risiko.', TRUE),
    (q_id, 'Tidak melakukan audit.', FALSE),
    (q_id, 'Meminta manajemen menentukan hasil audit.', FALSE);

  -- MLE-II Q21
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Bukti audit digunakan auditor terutama untuk...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mendukung kesimpulan dan opini audit.', TRUE),
    (q_id, 'Menggantikan laporan keuangan.', FALSE),
    (q_id, 'Menghitung gaji auditor.', FALSE),
    (q_id, 'Membuat strategi pemasaran.', FALSE);

  -- MLE-II Q22
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Manakah yang dapat menjadi bukti audit?', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Faktur dan kontrak.', FALSE),
    (q_id, 'Konfirmasi pihak luar.', FALSE),
    (q_id, 'Hasil observasi auditor.', FALSE),
    (q_id, 'Semua jawaban benar.', TRUE);

  -- MLE-II Q23
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Bukti yang diperoleh langsung oleh auditor dari pihak eksternal independen pada umumnya...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Dapat memiliki keandalan lebih tinggi dibandingkan bukti internal tertentu.', TRUE),
    (q_id, 'Selalu salah.', FALSE),
    (q_id, 'Tidak boleh digunakan.', FALSE),
    (q_id, 'Sama sekali tidak relevan.', FALSE);

  -- MLE-II Q24
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Auditor meminta bank mengonfirmasi saldo rekening perusahaan secara langsung kepada auditor. Prosedur tersebut disebut...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Konfirmasi eksternal.', TRUE),
    (q_id, 'Observasi.', FALSE),
    (q_id, 'Wawancara kerja.', FALSE),
    (q_id, 'Perencanaan anggaran.', FALSE);

  -- MLE-II Q25
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Auditor menghadiri penghitungan persediaan yang dilakukan perusahaan dan mengamati proses tersebut. Ini merupakan contoh...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Observasi.', TRUE),
    (q_id, 'Konfirmasi bank.', FALSE),
    (q_id, 'Rekalkulasi bunga.', FALSE),
    (q_id, 'Analisis pemasaran.', FALSE);

  -- MLE-II Q26
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Auditor menghitung kembali perhitungan penyusutan yang dibuat perusahaan. Prosedur ini merupakan contoh...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rekalkulasi.', TRUE),
    (q_id, 'Konfirmasi.', FALSE),
    (q_id, 'Observasi fisik.', FALSE),
    (q_id, 'Wawancara pelanggan.', FALSE);

  -- MLE-II Q27
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Auditor membandingkan margin laba tahun ini dengan tahun sebelumnya untuk mencari perubahan yang tidak biasa. Ini merupakan contoh...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Prosedur analitis.', TRUE),
    (q_id, 'Konfirmasi eksternal.', FALSE),
    (q_id, 'Observasi persediaan.', FALSE),
    (q_id, 'Pemeriksaan fisik uang.', FALSE);

  -- MLE-II Q28
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Pernyataan manajemen kepada auditor...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Selalu cukup sebagai satu-satunya bukti.', FALSE),
    (q_id, 'Tidak perlu dievaluasi.', FALSE),
    (q_id, 'Dapat menjadi bagian bukti audit, tetapi auditor biasanya perlu mengevaluasinya bersama bukti lain yang relevan.', TRUE),
    (q_id, 'Tidak pernah boleh digunakan.', FALSE);

  -- MLE-II Q29
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Kecukupan bukti audit terutama berkaitan dengan...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kuantitas bukti audit.', TRUE),
    (q_id, 'Warna dokumen.', FALSE),
    (q_id, 'Nama perusahaan.', FALSE),
    (q_id, 'Format laporan.', FALSE);

  -- MLE-II Q30
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Ketepatan atau appropriateness bukti audit terutama berkaitan dengan...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Relevansi dan keandalan bukti.', TRUE),
    (q_id, 'Jumlah halaman.', FALSE),
    (q_id, 'Harga dokumen.', FALSE),
    (q_id, 'Umur auditor.', FALSE);

  -- MLE-II Q31
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Pengendalian internal secara sederhana bertujuan membantu organisasi...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengelola risiko dan mendukung tercapainya tujuan organisasi.', TRUE),
    (q_id, 'Menghilangkan seluruh risiko secara absolut.', FALSE),
    (q_id, 'Menggantikan seluruh pegawai.', FALSE),
    (q_id, 'Menghilangkan kebutuhan manajemen.', FALSE);

  -- MLE-II Q32
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Contoh pemisahan tugas yang baik adalah...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Satu orang membuat vendor, menyetujui pembelian, membayar, dan mencatat transaksi.', FALSE),
    (q_id, 'Fungsi persetujuan pembayaran dipisahkan dari fungsi pelaksanaan pembayaran sesuai kebutuhan pengendalian.', TRUE),
    (q_id, 'Semua pegawai memiliki password yang sama.', FALSE),
    (q_id, 'Semua transaksi dapat dihapus tanpa persetujuan.', FALSE);

  -- MLE-II Q33
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Mengapa pemisahan tugas penting?', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Untuk membuat proses selalu lebih lambat.', FALSE),
    (q_id, 'Untuk mengurangi risiko kesalahan dan kecurangan yang tidak terdeteksi.', TRUE),
    (q_id, 'Untuk menambah dokumen.', FALSE),
    (q_id, 'Untuk menghilangkan kebutuhan audit.', FALSE);

  -- MLE-II Q34
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Jika seorang kasir juga mencatat transaksi dan melakukan rekonsiliasi bank tanpa review, auditor mungkin melihat kondisi tersebut sebagai...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Potensi kelemahan pengendalian.', TRUE),
    (q_id, 'Pengendalian yang pasti sempurna.', FALSE),
    (q_id, 'Bukti bahwa tidak mungkin terjadi kecurangan.', FALSE),
    (q_id, 'Kondisi yang tidak berkaitan dengan pengendalian.', FALSE);

  -- MLE-II Q35
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Password dan pembatasan hak akses dalam sistem informasi merupakan contoh...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pengendalian akses.', TRUE),
    (q_id, 'Strategi pemasaran.', FALSE),
    (q_id, 'Kebijakan penjualan.', FALSE),
    (q_id, 'Metode penyusutan.', FALSE);

  -- MLE-II Q36
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Approval oleh pejabat yang berwenang sebelum pembayaran dilakukan merupakan contoh...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Otorisasi.', TRUE),
    (q_id, 'Konfirmasi eksternal.', FALSE),
    (q_id, 'Perhitungan fisik.', FALSE),
    (q_id, 'Prosedur analitis.', FALSE);

  -- MLE-II Q37
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Apakah pengendalian internal yang baik dapat menjamin tidak pernah terjadi kesalahan atau kecurangan?', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Ya, 100%.', FALSE),
    (q_id, 'Tidak, pengendalian internal memiliki keterbatasan.', TRUE),
    (q_id, 'Ya, jika menggunakan komputer.', FALSE),
    (q_id, 'Ya, jika perusahaan besar.', FALSE);

  -- MLE-II Q38
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Salah satu keterbatasan pengendalian internal adalah kemungkinan...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kolusi antarpegawai.', TRUE),
    (q_id, 'Semua transaksi pasti benar.', FALSE),
    (q_id, 'Seluruh pelanggan membayar tepat waktu.', FALSE),
    (q_id, 'Tidak adanya manusia dalam organisasi.', FALSE);

  -- MLE-II Q39
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Management override of controls berarti...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Manajemen menggunakan kewenangannya untuk mengabaikan atau mengesampingkan pengendalian yang seharusnya berlaku.', TRUE),
    (q_id, 'Auditor mengganti sistem perusahaan.', FALSE),
    (q_id, 'Pegawai mengambil cuti.', FALSE),
    (q_id, 'Perusahaan mengganti komputer.', FALSE);

  -- MLE-II Q40
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Mengapa auditor perlu memahami pengendalian internal?', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Untuk membantu mengidentifikasi dan menilai risiko serta merancang prosedur audit yang sesuai.', TRUE),
    (q_id, 'Untuk menjadi direktur perusahaan.', FALSE),
    (q_id, 'Untuk menggantikan internal auditor.', FALSE),
    (q_id, 'Untuk menyusun seluruh SOP perusahaan.', FALSE);

  -- MLE-II Q41
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Perbedaan penting antara error dan fraud adalah...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tidak ada perbedaan.', FALSE),
    (q_id, 'Fraud melibatkan unsur kesengajaan, sedangkan error pada dasarnya tidak disengaja.', TRUE),
    (q_id, 'Error selalu lebih besar daripada fraud.', FALSE),
    (q_id, 'Fraud hanya dapat dilakukan manajemen.', FALSE);

  -- MLE-II Q42
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Apakah tujuan utama audit laporan keuangan adalah menemukan setiap bentuk fraud?', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Ya, auditor menjamin semua fraud ditemukan.', FALSE),
    (q_id, 'Tidak; auditor merancang audit untuk memperoleh keyakinan memadai bahwa laporan keuangan bebas dari salah saji material, baik karena fraud maupun error.', TRUE),
    (q_id, 'Tidak, fraud sama sekali bukan bagian pertimbangan auditor.', FALSE),
    (q_id, 'Ya, tetapi hanya fraud bernilai kecil.', FALSE);

  -- MLE-II Q43
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Auditor menemukan dokumen yang tampaknya sengaja dimanipulasi. Sikap yang tepat adalah...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengabaikannya.', FALSE),
    (q_id, 'Meningkatkan skeptisisme dan melakukan prosedur lebih lanjut sesuai keadaan.', TRUE),
    (q_id, 'Langsung menyatakan seluruh manajemen bersalah.', FALSE),
    (q_id, 'Menghapus dokumen tersebut.', FALSE);

  -- MLE-II Q44
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Audit sampling berarti...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Auditor selalu memeriksa 100% transaksi.', FALSE),
    (q_id, 'Auditor menerapkan prosedur audit terhadap kurang dari 100% item dalam populasi yang relevan sehingga auditor memiliki dasar untuk menarik kesimpulan mengenai populasi.', TRUE),
    (q_id, 'Auditor memilih dokumen yang paling mudah saja.', FALSE),
    (q_id, 'Auditor tidak memerlukan bukti.', FALSE);

  -- MLE-II Q45
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Mengapa auditor dapat menggunakan sampling?', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Karena dalam kondisi tertentu auditor dapat memperoleh bukti yang memadai tanpa harus memeriksa seluruh populasi.', TRUE),
    (q_id, 'Karena auditor boleh menebak hasil audit.', FALSE),
    (q_id, 'Karena transaksi yang tidak dipilih pasti benar.', FALSE),
    (q_id, 'Karena auditor tidak bertanggung jawab terhadap kesimpulannya.', FALSE);

  -- MLE-II Q46
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Jika auditor menyimpulkan laporan keuangan disajikan secara wajar, dalam semua hal yang material, sesuai kerangka pelaporan yang berlaku, auditor pada umumnya memberikan...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Opini tanpa modifikasian.', TRUE),
    (q_id, 'Opini tidak wajar.', FALSE),
    (q_id, 'Opini menolak perusahaan.', FALSE),
    (q_id, 'Sertifikat bebas fraud.', FALSE);

  -- MLE-II Q47
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Apakah opini tanpa modifikasian berarti perusahaan pasti sehat dan tidak akan bangkrut?', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Ya.', FALSE),
    (q_id, 'Tidak.', TRUE),
    (q_id, 'Ya, selama satu tahun.', FALSE),
    (q_id, 'Ya, jika perusahaan memperoleh laba.', FALSE);

  -- MLE-II Q48
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Jika terdapat salah saji material tetapi tidak pervasif dan manajemen tidak melakukan koreksi yang diperlukan, auditor dapat mempertimbangkan...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Opini wajar dengan pengecualian.', TRUE),
    (q_id, 'Selalu opini tanpa modifikasian.', FALSE),
    (q_id, 'Tidak membuat laporan audit.', FALSE),
    (q_id, 'Sertifikat keuntungan.', FALSE);

  -- MLE-II Q49
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Jika salah saji bersifat material dan pervasif terhadap laporan keuangan, auditor dapat memberikan...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Opini tidak wajar.', TRUE),
    (q_id, 'Opini tanpa modifikasian.', FALSE),
    (q_id, 'Surat rekomendasi investasi.', FALSE),
    (q_id, 'Jaminan bahwa perusahaan akan bangkrut.', FALSE);

  -- MLE-II Q50
  pos_r := pos_r + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_audit, 'Pernyataan yang paling tepat mengenai auditor adalah...', pos_r, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Auditor bertugas menjamin seluruh transaksi perusahaan benar 100%.', FALSE),
    (q_id, 'Auditor menggantikan tanggung jawab manajemen.', FALSE),
    (q_id, 'Auditor mengumpulkan dan mengevaluasi bukti secara profesional untuk membentuk kesimpulan dan memberikan opini sesuai tujuan audit.', TRUE),
    (q_id, 'Auditor hanya mencari kesalahan pegawai.', FALSE);

END $$;
