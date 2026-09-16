-- Kurasi Soal Ujian & Quiz PEPK — 80 questions across 6 new sections
-- Source: 'curated' (already exists)
-- Category: inklusi (label = 'PEPK'), Module: 1, Positions: 32-37

DO $$
DECLARE
  sA INT; sB INT; sC INT; sD INT; sE INT; sF INT;
  q INT;
BEGIN

-- ============================================================
-- SECTION A: Literasi & Edukasi Keuangan (9 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Literasi & Edukasi Keuangan', 32, 1, 'inklusi', TRUE, 9)
RETURNING id INTO sA;

-- Q1
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Berdasarkan Survei Nasional Literasi dan Inklusi Keuangan (SNLIK) tahun 2022, diketahui indeks literasi keuangan nasional adalah sebesar ...', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '49,67%', 1, FALSE),
(q, '49,68%', 2, TRUE),
(q, '49,86%', 3, FALSE),
(q, '49,87%', 4, FALSE);

-- Q2
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Dalam mengukur tingkat literasi keuangan masyarakat terdapat beberapa aspek yang perlu diperhatikan yaitu:', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pengetahuan dan Keterampilan Keuangan', 1, FALSE),
(q, 'Keyakinan Keuangan', 2, FALSE),
(q, 'Sikap dan Perilaku Keuangan', 3, FALSE),
(q, 'Semua Benar', 4, TRUE);

-- Q3
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Peraturan OJK tentang Peningkatan Literasi dan Inklusi Keuangan di Sektor Jasa Keuangan bagi Konsumen dan/atau Masyarakat, yaitu ...', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK Nomor 21 tahun 2023 dan POJK Nomor 3 tahun 2023', 1, FALSE),
(q, 'POJK Nomor 22 tahun 2023 dan POJK Nomor 3 tahun 2023', 2, TRUE),
(q, 'POJK Nomor 22 tahun 2023 dan POJK Nomor 2 tahun 2023', 3, FALSE),
(q, 'POJK Nomor 21 tahun 2023 dan POJK Nomor 2 tahun 2023', 4, FALSE);

-- Q4
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Berdasarkan POJK Nomor 3 tahun 2023 disebutkan bahwa pelaksanaan kegiatan untuk meningkatkan literasi keuangan dilaksanakan berdasarkan prinsip-prinsip berikut, kecuali...', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Berkolaborasi', 1, TRUE),
(q, 'Terencana dan terukur', 2, FALSE),
(q, 'Berorientasi pada pencapaian', 3, FALSE),
(q, 'Berkelanjutan', 4, FALSE);

-- Q5
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Berdasarkan POJK Nomor 22 Tahun 2023 disebutkan bahwa setiap Pelaku Usaha Jasa Keuangan wajib melaksanakan kegiatan dalam rangka meningkatkan literasi keuangan minimal...', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '1 kali dalam 1 tahun', 1, FALSE),
(q, '2 kali setahun', 2, FALSE),
(q, '1 kali setiap triwulan', 3, FALSE),
(q, '1 kali dalam 1 semester', 4, TRUE);

-- Q6
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'PUJK wajib menyampaikan laporan rencana dan realisasi kegiatan literasi dan inklusi keuangan kepada OJK melalui sistem', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'SPRINT', 1, FALSE),
(q, 'SIPP', 2, FALSE),
(q, 'SiPEDULI', 3, TRUE),
(q, 'SLIK', 4, FALSE);

-- Q7
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Literasi Keuangan merupakan suatu rangkaian proses atau aktivitas untuk meningkatkan pengetahuan (knowledge), keterampilan (skill), dan keyakinan (confidence) konsumen dan masyarakat luas sehingga mereka mampu untuk :', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Menggunakan seluruh produk dan jasa keuangan', 1, FALSE),
(q, 'Mengelola keuangan pribadi dengan lebih baik', 2, TRUE),
(q, 'Mendapatkan keringanan persyaratan dalam penggunaan produk dan jasa keuangan', 3, FALSE),
(q, 'Menghindari penggunaan produk dan jasa keuangan', 4, FALSE);

-- Q8
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'OJK dalam melaksanakan edukasi, juga melaksanakan outreach program. Hal ini dilatarbelakangi berbagai hal, kecuali:', 8, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Terdapat kelompok masyarakat yang secara sosial terisolir', 1, FALSE),
(q, 'Terdapat masyarakat yang tinggal di daerah terpencil (remote area)', 2, FALSE),
(q, 'Tidak semua golongan masyarakat memiliki pengetahuan yang cukup tentang LJK dan produk/jasa keuangan', 3, FALSE),
(q, 'Terdapat kemudahan akses terhadap informasi yang diperlukan', 4, TRUE);

-- Q9
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'SNLKI merupakan pedoman bagi OJK, lembaga jasa keuangan dan pemangku kepentingan lainnya dalam melaksanakan kegiatan/program literasi dan inklusi keuangan. Kepanjangan dari SNLKI adalah', 9, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Survei Nasional Literasi Keuangan Inklusif', 1, FALSE),
(q, 'Strategi Nasional Literasi Keuangan Inklusif', 2, FALSE),
(q, 'Strategi Nasional Literasi Keuangan Indonesia', 3, TRUE),
(q, 'Survei Nasional Literasi Keuangan Indonesia', 4, FALSE);

-- ============================================================
-- SECTION B: Inklusi Keuangan, TPAKD & Program Akses (22 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Inklusi Keuangan, TPAKD & Program Akses', 33, 1, 'inklusi', TRUE, 22)
RETURNING id INTO sB;

-- Q10
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Keuangan Inklusif didefinisikan sebagai:', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Suatu keadaan dimana seluruh masyarakat terlindungi dari aktivitas keuangan yang berpotensi merugikan', 1, FALSE),
(q, 'Suatu keadaan dimana seluruh masyarakat dapat menjangkau akses layanan keuangan baik formal maupun non formal secara mudah dan memiliki budaya untuk mengoptimalkan jasa keuangan', 2, FALSE),
(q, 'Suatu kondisi ketika setiap anggota masyarakat mempunyai akses terhadap berbagai layanan keuangan formal yang berkualitas secara tepat waktu, lancar, dan aman dengan biaya terjangkau sesuai dengan kebutuhan dan kemampuan dalam rangka meningkatkan kesejahteraan masyarakat', 3, TRUE),
(q, 'Suatu keadaan dimana seluruh masyarakat memiliki pengetahuan, keterampilan dan keyakinan keuangan yang baik, sehingga mampu mengelola keuangan pribadi', 4, FALSE);

-- Q11
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Strategi Nasional Keuangan Inklusif (SNKI) diatur dalam Peraturan Presiden Nomor ...', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Peraturan Presiden (Perpres) No. 82 tahun 2016 tentang SNKI yang direvisi melalui Perpres 114 tahun 2020', 1, TRUE),
(q, 'Peraturan Presiden (Perpres) No. 76 tahun 2016 tentang SNKI yang direvisi melalui Perpres 114 tahun 2020', 2, FALSE),
(q, 'Peraturan Presiden (Perpres) No. 82 tahun 2012 tentang SNKI yang direvisi melalui Perpres 114 tahun 2020', 3, FALSE),
(q, 'Peraturan Presiden (Perpres) No. 28 tahun 2016 tentang SNKI yang direvisi melalui Perpres 114 tahun 2020', 4, FALSE);

-- Q12
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Pengaturan Literasi dan Inklusi Keuangan dalam UNDANG-UNDANG No 4 Tahun 2023 Tentang Pengembangan dan Penguatan Sektor Keuangan (P2SK) tercantum dalam:', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pasal 226', 1, TRUE),
(q, 'Pasal 227', 2, FALSE),
(q, 'Pasal 245', 3, FALSE),
(q, 'Pasal 246', 4, FALSE);

-- Q13
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Aspek inklusi keuangan adalah ...', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Akses', 1, FALSE),
(q, 'Penggunaan (Usage)', 2, FALSE),
(q, 'Kualitas', 3, FALSE),
(q, 'Semua benar', 4, TRUE);

-- Q14
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Penyelenggaraan Bulan Inklusi Keuangan secara masif dilaksanakan setiap bulan ....', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Agustus', 1, FALSE),
(q, 'September', 2, FALSE),
(q, 'Oktober', 3, TRUE),
(q, 'November', 4, FALSE);

-- Q15
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Program inklusi keuangan di daerah dikoordinasikan dan diimplementasikan oleh ...', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Dewan Nasional Keuangan Inklusif', 1, FALSE),
(q, 'Dewan Keuangan Inklusif Daerah', 2, FALSE),
(q, 'Tim Percepatan Akses Keuangan Daerah', 3, TRUE),
(q, 'Tim Akselerasi Akses Keuangan Daerah', 4, FALSE);

-- Q16
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Satu Rekening Satu Pelajar (KEJAR) merupakan salah satu bentuk Aksi Pelajar Indonesia Menabung dalam rangka implementasi:', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Keputusan Presiden (Keppres) Nomor 76 Tahun 2016 tentang Hari Indonesia Menabung', 1, FALSE),
(q, 'Keputusan Presiden (Keppres) Nomor 26 Tahun 2016 tentang Hari Indonesia Menabung', 2, FALSE),
(q, 'Keputusan Presiden (Keppres) Nomor 26 Tahun 2019 tentang Hari Indonesia Menabung', 3, TRUE),
(q, 'Keputusan Presiden (Keppres) Nomor 76 Tahun 2019 tentang Hari Indonesia Menabung', 4, FALSE);

-- Q17
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Program yang diberikan oleh lembaga jasa keuangan formal kepada pelaku UMK dengan proses cepat, mudah, dan berbiaya rendah, untuk mengurangi ketergantungan/pengaruh entitas kredit informal/ilegal adalah', 8, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'KUR', 1, FALSE),
(q, 'K/PMR', 2, TRUE),
(q, 'Business Matching', 3, FALSE),
(q, 'Bank Wakaf Mikro', 4, FALSE);

-- Q18
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Berikut ini merupakan Index Inklusi Keuangan Nasional tahun 2022, adalah ...', 9, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '38,03%', 1, FALSE),
(q, '59,7%', 2, FALSE),
(q, '67,8%', 3, FALSE),
(q, '85,10%', 4, TRUE);

-- Q19
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Hari Indonesia Menabung (HIM) diperingati setiap tanggal ...', 10, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '1 Agustus', 1, FALSE),
(q, '2 Agustus', 2, FALSE),
(q, '10 Agustus', 3, FALSE),
(q, '20 Agustus', 4, TRUE);

-- Q20
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Program fasilitasi dan intermediasi penyaluran kredit bagi UMKM dengan fokus pada komoditi unggulan daerah adalah ...', 11, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'KUR', 1, FALSE),
(q, 'K/PMR', 2, FALSE),
(q, 'Business Matching', 3, TRUE),
(q, 'BWM', 4, FALSE);

-- Q21
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Manakah yang bukan merupakan Misi TPAKD:', 12, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Memperkuat infrastruktur dan peningkatan titik akses keuangan di daerah', 1, FALSE),
(q, 'Memastikan keberlanjutan TPAKD untuk jangka pendek', 2, TRUE),
(q, 'Memperkuat kapasitas anggota TPAKD dan peningkatan kinerja TPAKD', 3, FALSE),
(q, 'Mendukung pencapaian target literasi dan inklusi keuangan', 4, FALSE);

-- Q22
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Simpanan Mahasiswa dan Pemuda (SiMUDA) adalah produk tabungan yang ditujukan bagi kelompok usia ...', 13, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '7-18 tahun', 1, FALSE),
(q, '13-18 tahun', 2, FALSE),
(q, '18-22 tahun', 3, FALSE),
(q, '18-30 tahun', 4, TRUE);

-- Q23
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Apakah kepanjangan dari TPAKD?', 14, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Tim Perluasan Akses Keuangan Daerah', 1, FALSE),
(q, 'Tim Percepatan Akses Keuangan Daerah', 2, TRUE),
(q, 'Tim Peningkatan Akses Keuangan Daerah', 3, FALSE),
(q, 'Tim Penyediaan Akses Keuangan Daerah', 4, FALSE);

-- Q24
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Dalam Kerangka TPAKD, implementasi dari program kerja TPAKD dapat diklasifikasikan sebagai berikut, kecuali:', 15, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Optimalisasi produk dan layanan keuangan', 1, FALSE),
(q, 'Penguatan infrastruktur akses keuangan', 2, FALSE),
(q, 'Peningkatan literasi keuangan', 3, FALSE),
(q, 'Penguatan sektor rill', 4, TRUE);

-- Q25
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Manakah yang merupakan Strategi Inklusi Keuangan di bawah ini:', 16, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Penguatan regulasi dan kebijakan', 1, FALSE),
(q, 'Implementasi program kerja perluasan akses keuangan', 2, FALSE),
(q, 'Pengembangan dan penguatan sistem informasi', 3, FALSE),
(q, 'Semua benar', 4, TRUE);

-- Q26
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Yang bukan merupakan prinsip dari inklusi keuangan adalah', 17, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Terjamin', 1, TRUE),
(q, 'Terukur', 2, FALSE),
(q, 'Terjangkau', 3, FALSE),
(q, 'Tepat Sasaran', 4, FALSE);

-- Q27
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Yang merupakan sasaran dari keuangan inklusif adalah', 18, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pemilik ruko', 1, FALSE),
(q, 'Pelaku usaha UMKM', 2, FALSE),
(q, 'Masyarakat berpendapatan rendah dan rentan (kelompok masyarakat 40% berpendapatan terendah)', 3, FALSE),
(q, 'Jawaban b dan c benar', 4, TRUE);

-- Q28
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Yang bukan merupakan Aspek inklusi keuangan adalah ...', 19, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Akses', 1, FALSE),
(q, 'Formal', 2, TRUE),
(q, 'Penggunaan (Usage)', 3, FALSE),
(q, 'Kualitas', 4, FALSE);

-- Q29
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Pelaksanaan kegiatan intermediasi dalam rangka mendorong pemanfaatan produk dan/atau layanan jasa keuangan oleh Pelaku Usaha Sektor Keuangan (PUSK) kepada berbagai segmen masyarakat yang telah mendapatkan sosialisasi/pelatihan/pendampingan/edukasi keuangan oleh stakeholders terkait, sesuai dengan kebutuhan dan kemampuan masyarakat, merupakan definisi:', 20, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Business Matching', 1, FALSE),
(q, 'Product Matching', 2, TRUE),
(q, 'Kredit/Pembiayaan Melawan Rentenir', 3, FALSE),
(q, 'Kredit/Pembiayaan Sektor Prioritas Pertanian', 4, FALSE);

-- Q30
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Layanan Keuangan Tanpa Kantor Dalam Rangka Keuangan Inklusif disingkat:', 21, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'LAKUPANDAI', 1, TRUE),
(q, 'LAKUPINDA', 2, FALSE),
(q, 'LAKUTANPA', 3, FALSE),
(q, 'PANDAILAKU', 4, FALSE);

-- Q31
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Salah satu tujuan pelaksanaan inklusi keuangan yaitu:', 22, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Peningkatan kualitas pengambilan keputusan keuangan', 1, FALSE),
(q, 'Peningkatan sikap dan perilaku dalam pembelian produk dan layanan jasa keuangan', 2, FALSE),
(q, 'Meningkatnya kualitas penggunaan produk dan layanan jasa keuangan sesuai kebutuhan dan kemampuan masyarakat', 3, TRUE),
(q, 'Peningkatan sikap dan perilaku dalam pengelolaan keuangan', 4, FALSE);

-- ============================================================
-- SECTION C: Pelindungan Konsumen, Pengaduan & RIPLAY (15 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Pelindungan Konsumen, Pengaduan & RIPLAY', 34, 1, 'inklusi', TRUE, 15)
RETURNING id INTO sC;

-- Q32
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Berikut merupakan tugas dari Satuan Tugas Penanganan Kegiatan Usaha Tanpa Izin di Sektor Keuangan, kecuali', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Melaksanakan pengembangan kebijakan terkait pencegahan dan penanganan Kegiatan Usaha Tanpa Izin di Sektor Keuangan', 1, FALSE),
(q, 'Melaksanakan penanganan atas Kegiatan Usaha Tanpa Izin di Sektor Keuangan', 2, FALSE),
(q, 'Melakukan pencegahan terhadap Kegiatan Usaha Tanpa Izin di Sektor Keuangan', 3, FALSE),
(q, 'Melakukan pengambilalihan kepemilikan dan penormalan Kegiatan usaha Tanpa Izin di Sektor Keuangan', 4, TRUE);

-- Q33
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'OJK berwenang melakukan pembelaan hukum dalam rangka pelindungan konsumen dan Masyarakat, adapun bentuk pembelaan hukum dimaksud yaitu', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Melakukan Penyidikan dan Melakukan Pendampingan Hukum', 1, FALSE),
(q, 'Melakukan Pendampingan Hukum dan Melakukan Pengajuan Gugatan', 2, FALSE),
(q, 'Memerintahkan/melakukan tindakan tertentu untuk menyelesaikan pengaduan Konsumen dan gugatan perdata', 3, TRUE),
(q, 'Mengumumkan Pengenaan Sanksi dan Melakukan koordinasi dengan Kementerian/instansi terkait', 4, FALSE);

-- Q34
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Dalam perilaku dasar terdapat ketentuan "PUJK wajib memiliki dan menerapkan kebijakan dan prosedur tertulis Pelindungan Konsumen pada setiap jenjang PUJK", berikut merupakan kegiatan PUJK yang dimaksud dalam POJK 22 tahun 2023 tentang Pelindungan Konsumen dan Masyarakat di Sektor Jasa Keuangan, kecuali', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Tahap Desain Produk dan Layanan', 1, FALSE),
(q, 'Tahap Penyampaian Informasi Produk dan Layanan', 2, FALSE),
(q, 'Tahap Penanganan Pengaduan & Penyelesaian Sengketa', 3, FALSE),
(q, 'Tahap Pengajuan Gugatan', 4, TRUE);

-- Q35
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Berikut adalah cara kanal Layanan Konsumen OJK yang benar', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Nomor whatsapp 0813-157-157-157', 1, FALSE),
(q, 'Nomor whatsapp 0856-157-157-157', 2, FALSE),
(q, 'Kontak 157', 3, TRUE),
(q, 'Halo OJK', 4, FALSE);

-- Q36
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Kepanjangan dari APPK adalah', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Aplikasi Portal Pengawasan Keuangan', 1, FALSE),
(q, 'Aplikasi Pengaduan Pengawasan Keuangan', 2, FALSE),
(q, 'Aplikasi Pengawasan Pengaduan Keuangan', 3, FALSE),
(q, 'Aplikasi Portal Perlindungan Konsumen', 4, TRUE);

-- Q37
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Berdasarkan POJK 18/POJK.07/2018 tentang Layanan Pengaduan Konsumen di Sektor Jasa Keuangan, sebagaimana telah diubah melalui POJK 22 tahun 2023, PUJK wajib menindaklanjuti dan menyelesaikan pengaduan secara tertulis, serta dalam kondisi tertentu dapat mengajukan perpanjangan waktu penyelesaian pengaduan yaitu dalam jangka waktu paling lama', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '10 + 5 hari kerja', 1, FALSE),
(q, '20 + 10 hari kerja', 2, FALSE),
(q, '10 + 10 hari kerja', 3, TRUE),
(q, '20 + 20 hari kerja', 4, FALSE);

-- Q38
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Yang termasuk salah satu prinsip Layanan Pengaduan Konsumen yang diatur dalam Peraturan OJK Nomor 18/POJK.07/2018 yaitu', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Efisiensi dan Efektivitas', 1, FALSE),
(q, 'Transparansi', 2, FALSE),
(q, 'Larangan Pengenaan Biaya', 3, TRUE),
(q, 'Perlindungan yang Adil', 4, FALSE);

-- Q39
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Ruang lingkup layanan pengaduan konsumen yang diatur dalam Peraturan OJK Nomor 18/POJK.07/2018 tentang Layanan Pengaduan Konsumen di Sektor Jasa Keuangan adalah:', 8, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pencatatan, Penanganan, dan Penyelesaian Pengaduan', 1, FALSE),
(q, 'Penerimaan, Pencatatan, dan Pembukuan Pengaduan', 2, FALSE),
(q, 'Penerimaan, Penanganan, dan Penyelesaian Pengaduan', 3, TRUE),
(q, 'Penerimaan, Penanganan, dan Pembukuan Pengaduan', 4, FALSE);

-- Q40
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Pengaduan seperti apa yang dapat diselesaikan melalui upaya Fasilitasi oleh OJK?', 9, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pengaduan berindikasi sengketa', 1, TRUE),
(q, 'Pengaduan berindikasi penipuan', 2, FALSE),
(q, 'Pengaduan berindikasi pelanggaran', 3, FALSE),
(q, 'Pengaduan berindikasi pidana', 4, FALSE);

-- Q41
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Apa yang dimaksud dengan Konsumen berdasarkan Peraturan OJK tentang Perlindungan Konsumen dan Masyarakat di Sektor Jasa Keuangan?', 10, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'pihak-pihak yang menempatkan dananya dan/atau memanfaatkan pelayanan yang tersedia di Otoritas Jasa Keuangan', 1, FALSE),
(q, 'pihak-pihak yang menempatkan dananya yang tersedia di Lembaga Jasa Keuangan', 2, FALSE),
(q, 'pihak-pihak yang menempatkan dananya dan/atau memanfaatkan pelayanan yang tersedia di Lembaga Jasa Keuangan antara lain nasabah pada Perbankan, pemodal di Pasar Modal, pemegang polis pada Perasuransian, dan peserta pada Dana Pensiun, berdasarkan peraturan perundang-undangan di sektor jasa keuangan', 3, TRUE),
(q, 'pihak-pihak yang menempatkan dananya dan/atau memanfaatkan pelayanan yang tersedia di Perbankan', 4, FALSE);

-- Q42
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Manakah yang bukan termasuk dalam jenis layanan konsumen dan masyarakat oleh OJK sebagaimana diatur dalam Peraturan OJK Nomor 31/POJK.07/2020 tentang Layanan Konsumen dan Masyarakat di Sektor Jasa Keuangan oleh Otoritas Jasa Keuangan?', 11, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Layanan Pemberian Informasi', 1, FALSE),
(q, 'Layanan Penggantian Informasi', 2, TRUE),
(q, 'Layanan Penerimaan Informasi', 3, FALSE),
(q, 'Layanan Pengaduan', 4, FALSE);

-- Q43
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Ringkasan Informasi Produk dan/atau Layanan (RIPLAY) versi personal disampaikan oleh Pelaku Usaha Jasa Keuangan kepada calon Konsumen pada saat:', 12, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Konsumen menyampaikan pengaduan kepada OJK', 1, FALSE),
(q, 'Konsumen melihat iklan di media digital', 2, FALSE),
(q, 'Setelah penandatanganan perjanjian', 3, FALSE),
(q, 'Sebelum penandatanganan perjanjian', 4, TRUE);

-- Q44
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Penyelesaian pengaduan terlebih dahulu oleh PUJK dengan konsumen dikenal dengan istilah', 13, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'External conflict resolution', 1, FALSE),
(q, 'Internal dispute resolution', 2, TRUE),
(q, 'External dispute resolution', 3, FALSE),
(q, 'Internal conflict resolution', 4, FALSE);

-- Q45
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Norma dasar dalam iklan sektor jasa keuangan adalah', 14, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Wajar, Jujur, Jelas, Tidak Menyesatkan', 1, FALSE),
(q, 'Akurat, Jujur, Jelas, Seimbang', 2, FALSE),
(q, 'Akurat, Adil, Jelas, Tidak Menyesatkan', 3, FALSE),
(q, 'Akurat, Jujur, Jelas, Tidak Menyesatkan', 4, TRUE);

-- Q46
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Yang termasuk dalam layanan konsumen OJK di EPK adalah', 15, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Layanan Permintaan Informasi, Layanan Pemberian Informasi, Layanan Pengaduan', 1, FALSE),
(q, 'Layanan Penerimaan Informasi, Layanan Pemberian Informasi, Layanan Gugatan', 2, FALSE),
(q, 'Layanan Pengaduan, Layanan Pemberian Informasi, Layanan Gugatan', 3, FALSE),
(q, 'Layanan Penerimaan Informasi, Layanan Pemberian Informasi, Layanan Pengaduan', 4, TRUE);

-- ============================================================
-- SECTION D: Market Conduct & Pengawasan Perilaku PUJK (14 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Market Conduct & Pengawasan Perilaku PUJK', 35, 1, 'inklusi', TRUE, 14)
RETURNING id INTO sD;

-- Q47
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Bentuk pengawasan Perilaku PUJK (market conduct) sebagaimana diatur dalam POJK 22 Tahun 2023 tentang Pelindungan Konsumen dan Masyarakat di Sektor Jasa Keuangan, yaitu', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pengawasan Reguler dan Pengawasan Insidental', 1, FALSE),
(q, 'Pengawasan Langsung dan Pengawasan Tidak Langsung', 2, TRUE),
(q, 'Pengawasan Berjenjang dan Pengawasan Langsung', 3, FALSE),
(q, 'Pengawasan Reguler dan Pengawasan Tematik', 4, FALSE);

-- Q48
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Fungsi dilakukannya role play dalam pelaksanaan intelijen pasar adalah...', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Sebagai media latihan bagi tim dalam memahami peran dan kondisi lapangan sebelum kegiatan intelijen dilakukan', 1, TRUE),
(q, 'Sebagai pelengkap dokumentasi kegiatan intelijen pasar', 2, FALSE),
(q, 'sebagai media bagi tim untuk menggali informasi sebelum kegiatan intelijen pasar dilakukan', 3, FALSE),
(q, 'membantu pihak ketiga sebelum terlibat dalam kegiatan intelijen pasar dilakukan', 4, FALSE);

-- Q49
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Dalam pelaksanaan intelijen Pasar, maka berikut ini adalah hal yang harus dilakukan, kecuali...', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Berpura-pura tidak tahu ketika berhadapan dengan target', 1, FALSE),
(q, 'Mengenakan ID Card Pegawai', 2, TRUE),
(q, 'Menjaga kerahasiaan kegiatan', 3, FALSE),
(q, 'Bersikap Tenang', 4, FALSE);

-- Q50
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Dalam pelaksanaan customer testimony, maka sebaiknya menghindari pertanyaan yang bersifat...', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'menanyakan pengalaman penggunaan produk', 1, FALSE),
(q, 'memaksa dan mengkonfirmasi data yang kita miliki', 2, TRUE),
(q, 'menanyakan proses end to end saat membeli produk', 3, FALSE);

-- Q51
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Apa yang harus dilakukan ketika target intelijen kita mencurigai aktivitas yang kita lakukan adalah...', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Meminta Maaf', 1, FALSE),
(q, 'Menjelaskan tujuan kegiatan kepada target', 2, FALSE),
(q, 'Menghentikan kegiatan dan mencari target yang baru', 3, TRUE),
(q, 'Memberikan souvenir/hadiah kepada target', 4, FALSE);

-- Q52
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Hal yang menjadi pertimbangan dalam penentuan sample untuk pemeriksaan tematik adalah...', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Dampak Risiko dan Urgensi dilakukan pemeriksaan', 1, TRUE),
(q, 'Persetujuan satuan kerja pengawasan prudensial', 2, FALSE),
(q, 'Waktu Pelaksanaan Pemeriksaan', 3, FALSE),
(q, 'Ketersediaan Sumber Daya Pemeriksaan', 4, FALSE);

-- Q53
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Yang termasuk dalam instrumen pemeriksaan langsung adalah...', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Operasi Intelijen Pasar', 1, FALSE),
(q, 'Pemantauan Iklan', 2, FALSE),
(q, 'Validasi Laporan Penilaian Sendiri', 3, FALSE),
(q, 'Pemeriksaan Khusus', 4, TRUE);

-- Q54
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Teknik pengamatan lapangan yang dilakukan dengan melakukan pencarian informasi dari sumber terbuka adalah...', 8, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'mystery shopping', 1, FALSE),
(q, 'mystery calling', 2, FALSE),
(q, 'customer testimony', 3, FALSE),
(q, 'open source intelligence', 4, TRUE);

-- Q55
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Di bawah ini yang termasuk Teknik intelijen yang digunakan dalam operasi intelijen pasar, adalah:', 9, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Regular Shopping', 1, FALSE),
(q, 'In-Depth Interview', 2, TRUE),
(q, 'Special Examination', 3, FALSE),
(q, 'Survey', 4, FALSE);

-- Q56
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Berikut ini yang bukan merupakan Cakupan Pengawasan Market Conduct, adalah', 10, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Design Product', 1, FALSE),
(q, 'Marketing', 2, FALSE),
(q, 'Rasio Keuangan', 3, TRUE),
(q, 'Dispute Resolution', 4, FALSE);

-- Q57
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Pengertian "tidak menyesatkan" dalam iklan di sektor jasa keuangan adalah :', 11, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Iklan memuat informasi yang disampaikan secara lengkap, antara lain terkait manfaat, biaya, risiko, serta syarat dan ketentuan berlaku', 1, FALSE),
(q, 'Iklan sesuai dengan keadaan yang sebenarnya', 2, FALSE),
(q, 'Iklan dibuat berdasarkan kejelasan referensi yang bersifat kuantitatif maupun kualitatif', 3, FALSE),
(q, 'informasi dalam iklan tidak menimbulkan perbedaan penafsiran antara konsumen dan/atau masyarakat dengan PUJK', 4, TRUE);

-- Q58
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Di bawah ini adalah kegiatan yang dilakukan dalam Pengawasan Market Conduct, kecuali', 12, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pemeriksaan Tematik', 1, FALSE),
(q, 'Pemantauan Iklan', 2, FALSE),
(q, 'Investigasi', 3, TRUE),
(q, 'Self Assessment', 4, FALSE);

-- Q59
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Yang termasuk pemeriksaan onsite dalam pengawasan market conduct adalah', 13, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Operasi Intelijen Pasar dan Self Assessment', 1, FALSE),
(q, 'Pemeriksaan Tematik dan Self Assessment', 2, FALSE),
(q, 'Pemeriksaan Khusus dan Pemeriksaan Tematik', 3, TRUE),
(q, 'Self assessment dan Pemantauan Iklan', 4, FALSE);

-- Q60
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Dalam cakupan pengawasan market conduct, permasalahan mengenai kesesuaian produk dengan kebutuhan dan kemampuan konsumen berada dalam cakupan', 14, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Product Design', 1, TRUE),
(q, 'Marketing', 2, FALSE),
(q, 'After Sales', 3, FALSE),
(q, 'Product Launching', 4, FALSE);

-- ============================================================
-- SECTION E: LAPS SJK & Penyelesaian Sengketa (12 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('LAPS SJK & Penyelesaian Sengketa', 36, 1, 'inklusi', TRUE, 12)
RETURNING id INTO sE;

-- Q61
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Peraturan yang mewajibkan Seluruh Lembaga Jasa Keuangan menjadi anggota LAPS adalah', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pasal 11 a POJK No 61/POJK.07/2020 Tentang Lembaga Alternatif Penyelesaian Sengketa Sektor Jasa Keuangan', 1, TRUE),
(q, 'Pasal 39 ayat 1 POJK Nomor 1/POJK.07/2013 Tentang Perlindungan Konsumen Sektor Jasa Keuangan', 2, FALSE),
(q, 'Pasal 19 ayat 1 POJK Nomor 31/POJK.07/2020 Tentang Penyelenggaraan Layanan Konsumen Dan Masyarakat Di Sektor Jasa Keuangan Oleh Otoritas Jasa Keuangan', 3, FALSE),
(q, 'Pasal 26 ayat 1 POJK Nomor 18/POJK.07/2018 Tentang Layanan Pengaduan Konsumen di Sektor Jasa Keuangan', 4, FALSE);

-- Q62
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'LAPS SJK mulai beroperasi sejak tanggal', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '17 Agustus 2021', 1, FALSE),
(q, '1 Januari 2024', 2, FALSE),
(q, '17 Agustus 2023', 3, FALSE),
(q, '1 Januari 2021', 4, TRUE);

-- Q63
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Layanan yang dapat dilakukan oleh LAPS SJK adalah', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Mediasi dan ajudikasi', 1, FALSE),
(q, 'Mediasi dan arbitrase', 2, TRUE),
(q, 'Ajudikasi, negosiasi, dan arbitrase', 3, FALSE),
(q, 'Mediasi, ajudikasi dan arbitrase', 4, FALSE);

-- Q64
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Berikut adalah kewenangan LAPS SJK yang benar kecuali', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Melakukan penanganan sengketa Konsumen SJK', 1, FALSE),
(q, 'Melakukan pengembangan kompetensi mediator dan arbiter yang terdaftar pada LAPS SJK', 2, FALSE),
(q, 'Memberikan sanksi kepada PUJK yang salah', 3, TRUE),
(q, 'Melakukan kerjasama dengan lembaga/instansi perlindungan konsumen nasional dan internasional', 4, FALSE);

-- Q65
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Kesepakatan perdamaian merupakan penyelesaian dari', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pendapat mengikat', 1, FALSE),
(q, 'Arbritase', 2, FALSE),
(q, 'Mediasi', 3, TRUE),
(q, 'Ajudikasi', 4, FALSE);

-- Q66
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Berikut ini yang merupakan fungsi LAPS Sektor Jasa Keuangan', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'memberikan konsultasi penyelesaian sengketa di sektor jasa keuangan', 1, FALSE),
(q, 'menyelenggarakan layanan penyelesaian Sengketa yang terintegrasi pada sektor jasa keuangan', 2, TRUE),
(q, 'melaksanakan penanganan dan penyelesaian Sengketa Konsumen', 3, FALSE);

-- Q67
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Cara penyelesaian sengketa melalui pihak ketiga yang ditunjuk oleh pihak yang bersengketa, untuk membantu pihak yang bersengketa mencapai kesepakatan adalah pengertian dari', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Mediasi', 1, TRUE),
(q, 'Konsolidasi', 2, FALSE),
(q, 'Ajudikasi', 3, FALSE),
(q, 'Musyawarah', 4, FALSE);

-- Q68
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Perselisihan antara Konsumen dengan PUJK yang telah melalui proses penyelesaian Pengaduan oleh PUJK dan disebabkan oleh adanya kerugian dan/atau potensi kerugian materiil, wajar dan secara langsung pada Konsumen karena PUJK tidak memenuhi perjanjian dan/atau dokumen transaksi keuangan yang telah disepakati. Kalimat di atas merupakan definisi dalam Peraturan OJK Nomor 31/POJK.07/2020, yaitu', 8, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Sistem Layanan Konsumen Terintegrasi', 1, FALSE),
(q, 'Fasilitasi', 2, FALSE),
(q, 'Sengketa', 3, TRUE),
(q, 'Pengaduan', 4, FALSE);

-- Q69
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Pelaku Usaha Jasa Keuangan mempunyai kewajiban terkait dengan LAPS SJK, kecuali:', 9, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Membayar iuran keanggotaan LAPS Sektor Jasa Keuangan', 1, FALSE),
(q, 'melaksanakan kesepakatan dan putusan LAPS Sektor Jasa Keuangan', 2, FALSE),
(q, 'Menjadi anggota LAPS Sektor Jasa Keuangan', 3, FALSE),
(q, 'Wajib menyelesaikan sengketa melalui pengadilan terlebih dahulu', 4, TRUE);

-- Q70
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Penyelesaian sengketa melalui LAPS SJK dapat dilakukan melalui beberapa cara sebagaimana diatur dalam Peraturan OJK Nomor 61/POJK.07/2020 tentang Lembaga Alternatif Penyelesaian Sengketa Sektor Jasa Keuangan, kecuali', 10, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Surat Menyurat dengan OJK', 1, TRUE),
(q, 'Pemeriksaan Dokumen', 2, FALSE),
(q, 'Media Elektronik', 3, FALSE),
(q, 'Tatap Muka', 4, FALSE);

-- Q71
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Ketentuan mengenai LAPS SJK diatur dalam', 11, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Peraturan Dewan Komisioner Otoritas Jasa Keuangan Nomor 60/PDK.07/2020', 1, FALSE),
(q, 'Peraturan Otoritas Jasa Keuangan Nomor 61/POJK.07/2020', 2, TRUE),
(q, 'Peraturan Otoritas Jasa Keuangan Nomor 61/POJK.07/2021', 3, FALSE),
(q, 'Peraturan Otoritas Jasa Keuangan Nomor 60/POJK.05/2020', 4, FALSE);

-- Q72
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'LAPS Sektor Jasa Keuangan harus memenuhi persyaratan mempunyai organ paling sedikit, kecuali', 12, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pembina', 1, TRUE),
(q, 'Pengurus', 2, FALSE),
(q, 'Pengawas', 3, FALSE),
(q, 'Rapat Umum Anggota', 4, FALSE);

-- ============================================================
-- SECTION F: Keuangan Syariah & Literasi/Inklusi Syariah (8 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Keuangan Syariah & Literasi/Inklusi Syariah', 37, 1, 'inklusi', TRUE, 8)
RETURNING id INTO sF;

-- Q73
INSERT INTO questions (section_id, text, position, source) VALUES (sF, 'Yang bukan merupakan program strategis Pilar Literasi dan Inklusi Keuangan Syariah dalam Peta Jalan Pengawasan Pelaku Usaha Jasa Keuangan, Edukasi dan Pelindungan Konsumen (PEPK) OJK 2023 - 2027 adalah :', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Mengakselerasi dan Meningkatkan Program Literasi Keuangan Syariah', 1, FALSE),
(q, 'Memperbanyak program edukasi keuangan syariah bersama Pihak Eksternal', 2, TRUE),
(q, 'Mengembangkan dan Memperluas Akses Keuangan Syariah', 3, FALSE),
(q, 'Memperkuat Infrastruktur Literasi dan Inklusi Keuangan Syariah', 4, FALSE);

-- Q74
INSERT INTO questions (section_id, text, position, source) VALUES (sF, 'Yang termasuk program flagship program keuangan syariah OJK adalah:', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Edufin on Location', 1, FALSE),
(q, 'Ngopi Kuy (Ngobrol Pintar Seputar Keuangan Yuk!)', 2, FALSE),
(q, 'Gebyar Ramadan Keuangan Syariah (GERAK Syariah)', 3, TRUE),
(q, 'Desaku Cakap Keuangan', 4, FALSE);

-- Q75
INSERT INTO questions (section_id, text, position, source) VALUES (sF, 'Berikut adalah jenis perbankan syariah:', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pergadaian syariah', 1, FALSE),
(q, 'Bank Perekonomian Rakyat Syariah (BPRS)', 2, TRUE),
(q, 'Dana Pensiun syariah', 3, FALSE),
(q, 'Asuransi Syariah', 4, FALSE);

-- Q76
INSERT INTO questions (section_id, text, position, source) VALUES (sF, 'Berikut adalah beberapa hal yang dilarang dalam Sistem Keuangan Syariah, kecuali:', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Praktik bunga (riba)', 1, FALSE),
(q, 'Mengambil keuntungan dalam jual beli', 2, TRUE),
(q, 'Transaksi yang mengandung ketidakpastian (gharar)', 3, FALSE),
(q, 'Transaksi yang bersifat spekulatif (maysir)', 4, FALSE);

-- Q77
INSERT INTO questions (section_id, text, position, source) VALUES (sF, 'Berikut adalah produk yang ditawarkan dalam Pasar Modal Syariah, yakni :', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Saham Syariah', 1, TRUE),
(q, 'Tabungan', 2, FALSE),
(q, 'Penjaminan Kendaraan Bermotor', 3, FALSE),
(q, 'Deposito', 4, FALSE);

-- Q78
INSERT INTO questions (section_id, text, position, source) VALUES (sF, 'Yang termasuk lembaga jasa keuangan syariah adalah :', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Notaris', 1, FALSE),
(q, 'Akuntan', 2, FALSE),
(q, 'Konsultan Hukum', 3, FALSE),
(q, 'Perusahaan Asuransi Syariah', 4, TRUE);

-- Q79
INSERT INTO questions (section_id, text, position, source) VALUES (sF, 'Yang merupakan tujuan Keuangan Syariah sesuai prinsip Ekonomi Islam adalah :', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Menjadikan masyarakat kaya raya', 1, FALSE),
(q, 'Mengambil dana masyarakat', 2, FALSE),
(q, 'Menghindari Riba', 3, TRUE),
(q, 'Menimbun harta', 4, FALSE);

-- Q80
INSERT INTO questions (section_id, text, position, source) VALUES (sF, 'Berikut adalah ciri khas Lembaga Jasa Keuangan Syariah :', 8, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Menjalankan kegiatan usaha dengan memperhatikan prinsip syariah dan aspek halal', 1, TRUE),
(q, 'Menggunakan sistem bunga/riba', 2, FALSE),
(q, 'Tidak menggunakan akad', 3, FALSE),
(q, 'Tidak ada kegiatan yang dilarang', 4, FALSE);

END $$;
