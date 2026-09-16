-- Kurasi Soal Ujian & Quiz PMDK — 66 questions across 5 new sections
-- Source: 'curated' (already exists)
-- Category: pasar_modal, Module: 1, Positions: 27-31

DO $$
DECLARE
  sA INT; sB INT; sC INT; sD INT; sE INT;
  q INT;
BEGIN

-- ============================================================
-- SECTION A: Emiten, Pelaporan & Tata Kelola (8 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Emiten, Pelaporan & Tata Kelola', 27, 1, 'pasar_modal', TRUE, 8)
RETURNING id INTO sA;

-- Q1
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Transaksi Benturan Kepentingan adalah transaksi yang dilakukan oleh perusahaan terbuka atau perusahaan terkendali dengan … yang mengandung Benturan Kepentingan', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pengendali perusahaan terbuka', 1, FALSE),
(q, 'Direksi dan Dewan Komisaris perusahaan terbuka, pemegang saham utama perusahaan terbuka dan Pengendali perusahaan terbuka', 2, FALSE),
(q, 'Setiap pihak, baik dengan Afiliasi maupun pihak selain Afiliasi', 3, TRUE),
(q, 'Pemegang saham utama perusahaan terbuka', 4, FALSE);

-- Q2
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Laporan keuangan berkala yang dimaksud dalam POJK Nomor 14/POJK.04/2022 tentang Penyampaian Laporan Keuangan Berkala Emiten atau Perusahaan Publik, terdiri atas', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Laporan keuangan tahunan, laporan keuangan tengah tahunan, dan laporan tahunan', 1, FALSE),
(q, 'Laporan keuangan tahunan, laporan keuangan tengah tahunan, dan laporan keuangan triwulanan', 2, FALSE),
(q, 'Laporan tahunan dan laporan keuangan triwulanan', 3, FALSE),
(q, 'Laporan keuangan tahunan dan laporan keuangan tengah tahunan', 4, TRUE);

-- Q3
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Komite Audit dapat dijabat oleh', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Semua komisaris', 1, FALSE),
(q, 'Komisaris independen', 2, TRUE),
(q, 'Komisaris utama namun bukan komisaris independen', 3, FALSE),
(q, 'Kepala internal audit', 4, FALSE);

-- Q4
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Berikut ini adalah kewajiban pelaporan Emiten dan Perusahaan Publik yang dilakukan secara berkala, kecuali', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Laporan tahunan', 1, FALSE),
(q, 'Laporan realisasi penggunaan dana hasil penawaran umum', 2, FALSE),
(q, 'Laporan atas permohonan kepailitan', 3, TRUE),
(q, 'Laporan keuangan tahunan', 4, FALSE);

-- Q5
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Perbedaan proses Penawaran Umum yang menggunakan e-IPO dan Penawaran Umum yang tidak menggunakan e-IPO adalah ...', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Penawaran Umum menggunakan e-IPO wajib menyampaikan laporan hasil Penawaran Umum kepada OJK sedangkan Penawaran Umum tidak menggunakan e-IPO tidak wajib menyampaikan laporan hasil Penawaran Umum kepada OJK', 1, FALSE),
(q, 'Penawaran Umum menggunakan e-IPO tidak diwajibkan menyampaikan laporan audit penjatahan kepada OJK sedangkan Penawaran Umum tidak menggunakan sistem e-IPO wajib menyampaikan laporan audit penjatahan kepada OJK', 2, TRUE),
(q, 'Masa Penawaran Umum perusahaan yang menggunakan e-IPO adalah 1-5 hari kerja sedangkan Masa Penawaran Umum perusahaan yang tidak menggunakan e-IPO adalah 3-5 hari kerja', 3, FALSE),
(q, 'Penawaran Umum menggunakan e-IPO menyampaikan dokumen Pernyataan Pendaftaran melalui e-IPO sedangkan Penawaran Umum tidak menggunakan sistem e-IPO menyampaikan dokumen Pernyataan Pendaftaran melalui SPRINT', 4, FALSE);

-- Q6
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Emiten dan Perusahaan Publik menyajikan informasi analisis dan pembahasan oleh manajemen pada', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Laporan realisasi penggunaan dana', 1, FALSE),
(q, 'Laporan keuangan tengah tahunan', 2, FALSE),
(q, 'Laporan tahunan', 3, TRUE),
(q, 'Laporan keuangan tahunan', 4, FALSE);

-- Q7
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Pihak lain yang dapat mengajukan sebagai Penyedia Sistem Penyelenggaraan E-RUPS adalah', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pihak yang telah terdaftar usaha dari OJK untuk melakukan kegiatan di sektor pasar modal', 1, FALSE),
(q, 'Pihak yang telah tercatat dari OJK untuk melakukan kegiatan di sektor pasar modal', 2, FALSE),
(q, 'Pihak yang telah memiliki persetujuan usaha dari OJK untuk melakukan kegiatan di sektor pasar modal', 3, FALSE),
(q, 'Pihak yang telah mendapatkan izin usaha dari OJK untuk melakukan kegiatan di sektor pasar modal', 4, TRUE);

-- Q8
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Berikut yang merupakan laporan insidental Agen Penjual Efek Reksa Dana adalah', 8, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Laporan Keuangan Tahunan', 1, FALSE),
(q, 'Laporan harian Nilai Aktiva Bersih', 2, FALSE),
(q, 'Laporan perubahan tenaga pemasar', 3, TRUE),
(q, 'Laporan Modal Kerja Bersih Disesuaikan', 4, FALSE);

-- ============================================================
-- SECTION B: Ekosistem, Perizinan & Lembaga Pasar Modal (21 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Ekosistem, Perizinan & Lembaga Pasar Modal', 28, 1, 'pasar_modal', TRUE, 21)
RETURNING id INTO sB;

-- Q9
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Perbedaan antara kepentingan ekonomis perusahaan terbuka dengan kepentingan ekonomis pribadi anggota Direksi, anggota Dewan Komisaris, pemegang saham utama, atau pengendali yang dapat merugikan perusahaan terbuka dimaksud adalah definisi dari', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Benturan Kepentingan', 1, TRUE),
(q, 'Penawaran Tender', 2, FALSE),
(q, 'Transaksi Material', 3, FALSE),
(q, 'Transaksi Afiliasi', 4, FALSE);

-- Q10
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Kapan masa berlaku izin Wakil Perusahaan Efek', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '3 Tahun sejak Tanggal surat persetujuan dan berakhir di tanggal kelahiran pemegang izin', 1, TRUE),
(q, '3 Tahun sejak tanggal surat persetujuan pemegang izin', 2, FALSE),
(q, '3 Tahun sejak tanggal lahir pemegang izin', 3, FALSE),
(q, '4 Tahun sejak Tanggal surat persetujuan dan berakhir di tanggal kelahiran pemegang izin', 4, FALSE);

-- Q11
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Yang tidak termasuk dalam Lembaga Penunjang Pasar Modal adalah', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pemeringkat Efek', 1, TRUE),
(q, 'Biro Administrasi Efek', 2, FALSE),
(q, 'Kustodian', 3, FALSE),
(q, 'Wali Amanat', 4, FALSE);

-- Q12
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Peraturan terkait dengan perizinan Penyelenggara Layanan Urun Dana adalah', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK Nomor 37/POJK.04/2018', 1, FALSE),
(q, 'POJK Nomor 57/POJK.04/2018', 2, FALSE),
(q, 'POJK Nomor 57/POJK.04/2020', 3, TRUE),
(q, 'POJK Nomor 37/POJK.04/2020', 4, FALSE);

-- Q13
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Dalam menganalisis data transaksi efek, Pengawas Transaksi Efek melakukan rekapitulasi 15 nasabah terbesar transaksi beli dan jual untuk melihat', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'dominasi pihak bertransaksi', 1, TRUE),
(q, 'keterkaitan nasabah', 2, FALSE),
(q, 'tidak ada jawaban yang benar', 3, FALSE),
(q, 'motif transaksi', 4, FALSE);

-- Q14
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Kapan permohonan perpanjangan izin diajukan kepada OJK?', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Paling cepat 90 hari setelah masa berlaku izin berakhir', 1, FALSE),
(q, 'Paling cepat 90 hari kerja setelah masa berlaku izin berakhir', 2, FALSE),
(q, 'Paling cepat 90 hari kerja sebelum masa berlaku izin berakhir', 3, FALSE),
(q, 'Paling cepat 90 hari sebelum masa berlaku izin berakhir', 4, TRUE);

-- Q15
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Tugas dan fungsi dari notaris dalam proses Penawaran Umum adalah ...', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Memberikan rating atas obligasi atau sukuk yang diterbitkan oleh perusahaan', 1, FALSE),
(q, 'Menyusun laporan penilaian aset dari perusahaan', 2, FALSE),
(q, 'Memberikan nasihat dan penerapan prinsip Syariah', 3, FALSE),
(q, 'Membuat akta-akta perjanjian dalam rangka Penawaran Umum', 4, TRUE);

-- Q16
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Dalam menganalisis data transaksi efek, untuk melihat dominasi transaksi beli dan jual suatu efek oleh suatu nasabah, Pengawas Transaksi Efek melakukan', 8, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'rekapitulasi 15 nasabah terbesar transaksi beli dan jual', 1, TRUE),
(q, 'analisis aliran dana', 2, FALSE),
(q, 'tidak ada jawaban yang benar', 3, FALSE),
(q, 'pemeriksaan setempat', 4, FALSE);

-- Q17
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Penilaian kemampuan dan kepatutan dilakukan untuk menilai bahwa calon anggota Direksi Perusahaan Pemeringkat Efek memenuhi persyaratan sebagai berikut, kecuali', 9, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Kompetensi', 1, FALSE),
(q, 'Integritas', 2, FALSE),
(q, 'Kelayakan Keuangan', 3, TRUE),
(q, 'Reputasi Keuangan', 4, FALSE);

-- Q18
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Jenis Efek Bersifat Utang dan Sukuk berlandaskan keberlanjutan yaitu, kecuali', 10, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Obligasi Ritel Indonesia (ORI)', 1, TRUE),
(q, 'Sustainability Sukuk', 2, FALSE),
(q, 'Green Bond', 3, FALSE),
(q, 'Sosial Bond', 4, FALSE);

-- Q19
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Di antara jawaban berikut ini, manakah yang bukan termasuk dalam penegakan hukum di sektor Pasar Modal sesuai dengan UU No. 8 Tahun 1995 tentang Pasar Modal dan UU No. 4 Tahun 2023 tentang Pengembangan dan Penguatan Sektor Keuangan', 11, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pemeriksaan', 1, FALSE),
(q, 'Pengenaan Sanksi Administratif', 2, FALSE),
(q, 'Pembinaan', 3, FALSE),
(q, 'Pemberian Pernyataan Efektif', 4, TRUE);

-- Q20
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Perantara Pedagang Efek yang khusus didirikan untuk memasarkan Efek Reksa Dana wajib memenuhi', 12, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Modal disetor minimal 500 juta, minimal dua direksi memiliki izin WMI', 1, FALSE),
(q, 'Modal disetor minimal 500 juta, minimal salah satu direksi memiliki izin WAPERD', 2, TRUE),
(q, 'Modal disetor minimal 25 milyar, minimal salah satu direksi memiliki izin WAPERD', 3, FALSE),
(q, 'Modal disetor minimal 500 juta, minimal dua direksi memiliki izin WAPERD', 4, FALSE);

-- Q21
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Perhitungan/ valuasi dari Nilai Pasar Wajar Efek Saham pada portofolio Reksa Dana menggunakan', 13, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Harga transaksi yang dilakukan', 1, FALSE),
(q, 'Harga penutupan bursa', 2, TRUE),
(q, 'Nilai nominal', 3, FALSE),
(q, 'Amortisasi', 4, FALSE);

-- Q22
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'POJK yang mengatur penerbitan Efek Bersifat Utang dan Sukuk (EBUS) berlandaskan keberlanjutan adalah', 14, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK 18/2023', 1, TRUE),
(q, 'POJK 60/2017', 2, FALSE),
(q, 'POJK 51/2017', 3, FALSE),
(q, 'POJK 14/2023', 4, FALSE);

-- Q23
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Perusahaan Efek yang melakukan Penjaminan Emisi Efek antara lain harus memenuhi persyaratan sebagai berikut', 15, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Sekurang-kurangnya mempunyai seorang direktur dan dua orang pegawai yang telah memperoleh izin orang perseorangan sebagai Wakil Penjamin Emisi Efek', 1, FALSE),
(q, 'Didukung oleh pegawai-pegawai yang ahli di dalam bidang penjaminan Emisi Efek', 2, FALSE),
(q, 'Sekurang-kurangnya mempunyai seorang direktur dan seorang pegawai yang masing-masing telah memperoleh izin orang perseorangan sebagai Wakil Penjamin Emisi Efek', 3, TRUE),
(q, 'Semua direktur harus mempunyai izin orang perseorangan sebagai Wakil Penjamin Emisi Efek', 4, FALSE);

-- Q24
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Persyaratan Efek bersifat utang tanpa Penawaran Umum adalah ...', 16, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Efek bersifat utang tanpa Penawaran Umum hanya dapat dibeli Kembali dalam jangka waktu lebih dari 1 tahun', 1, TRUE),
(q, 'Efek bersifat utang tanpa Penawaran Umum dapat dibeli Kembali dalam jangka waktu kurang dari 1 tahun', 2, FALSE),
(q, 'wajib dicatatkan di Bursa Efek Indonesia', 3, FALSE),
(q, 'jumlah pemegang Efek bersifat utang tanpa Penawaran Umum minimal 50 pihak', 4, FALSE);

-- Q25
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Berdasarkan UU Nomor 8 Tahun 1995 tentang Pasar Modal (UU PM) sebagaimana telah diubah dengan UU Nomor 4 Tahun 2023 tentang Penguatan dan Pengembangan Pasar Modal (UU P2SK), Pasar Modal adalah', 17, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Bagian dari Sistem Keuangan yang berkaitan dengan kegiatan penawaran umum dan transaksi efek; pengelolaan investasi dan Lembaga dan profesi yang berkaitan dengan Efek', 1, FALSE),
(q, 'Bagian dari Sistem Keuangan yang berkaitan dengan kegiatan penawaran umum dan transaksi efek; pengelolaan investasi; dan Emiten dan Perusahaan Publik yang berkaitan dengan Efek yang diterbitkannya', 2, FALSE),
(q, 'Bagian dari Sistem Keuangan yang berkaitan dengan pengelolaan investasi; dan Lembaga dan profesi yang berkaitan dengan Efek', 3, FALSE),
(q, 'Bagian dari Sistem Keuangan yang berkaitan dengan kegiatan penawaran umum dan transaksi efek; pengelolaan investasi; Emiten dan Perusahaan Publik yang berkaitan dengan Efek yang diterbitkannya; dan Lembaga dan profesi yang berkaitan dengan Efek', 4, TRUE);

-- Q26
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Berdasarkan UU Nomor 8 Tahun 1995 tentang Pasar Modal (UU PM) sebagaimana telah diubah dengan UU Nomor 4 Tahun 2023 tentang Penguatan dan Pengembangan Pasar Modal (UU P2SK), Perusahaan Efek adalah pihak yang melakukan kegiatan sebagai berikut, kecuali', 18, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Manajer Investasi', 1, FALSE),
(q, 'Pemeringkat Efek', 2, TRUE),
(q, 'Penjamin Emisi Efek', 3, FALSE),
(q, 'Perantara Pedagang Efek', 4, FALSE);

-- Q27
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Berikut ini adalah pihak yang tidak dapat melakukan kegiatan usaha sebagai Manajer Investasi', 19, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Perseroan Terbatas', 1, FALSE),
(q, 'Perusahaan Publik', 2, FALSE),
(q, 'Perusahaan Terbuka', 3, FALSE),
(q, 'Asuransi', 4, TRUE);

-- Q28
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Berapa minimal besar dana kelolaan Reksa Dana yang harus dipenuhi?', 20, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '20 miliar', 1, FALSE),
(q, '25 miliar', 2, FALSE),
(q, '10 miliar', 3, TRUE),
(q, '5 miliar', 4, FALSE);

-- Q29
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Mekanisme berbasis pasar untuk mengurangi emisi GRK melalui kegiatan jual beli adalah pengertian dari', 21, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Penyelenggara Bursa Karbon', 1, FALSE),
(q, 'Pengguna Jasa Bursa Karbon', 2, FALSE),
(q, 'Bursa Karbon', 3, FALSE),
(q, 'Perdagangan Karbon', 4, TRUE);

-- ============================================================
-- SECTION C: Pengawasan, RBS & Aplikasi (14 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Pengawasan, RBS & Aplikasi', 29, 1, 'pasar_modal', TRUE, 14)
RETURNING id INTO sC;

-- Q30
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Dalam siklus pengawasan PE berdasarkan RBS (Risk Based Supervision), tahap setelah Penilaian Peringkat Risiko Komposit adalah', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pemeriksaan berdasarkan risiko', 1, FALSE),
(q, 'Pemahaman PE', 2, FALSE),
(q, 'Perencanaan Pengawasan', 3, TRUE),
(q, 'Tindakan Pengawasan dan Monitoring', 4, FALSE);

-- Q31
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Alur pengawasan transaksi efek yang berlaku di Direktorat Pengawasan Transaksi Efek', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pemeriksaan Teknis – Penelaahan – Reviu Alert', 1, FALSE),
(q, 'Reviu Alert – Pemeriksaan Teknis – Penelaahan', 2, FALSE),
(q, 'Pemeriksaan Teknis – Reviu Alert – Penelaahan', 3, FALSE),
(q, 'Reviu Alert – Penelaahan – Pemeriksaan Teknis', 4, TRUE);

-- Q32
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Apa nama sistem yang digunakan untuk melakukan perhitungan Risk Based Supervision (RBS) Manajer Investasi?', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Sistem Informasi Pungutan OJK', 1, FALSE),
(q, 'Sistem Perizinan Terintegrasi', 2, FALSE),
(q, 'Sistem SIPEDULI', 3, FALSE),
(q, 'Sistem Informasi Pasar Modal (SIPM)', 4, TRUE);

-- Q33
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Alur pengawasan transaksi efek di Direktorat Pengawasan Transaksi Efek dapat berlaku sebagai berikut, kecuali', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Reviu Alert – Penelaahan – Tutup', 1, FALSE),
(q, 'Reviu Alert – Penelaahan – Pelimpahan ke Direktorat Pemeriksaan Khusus Pasar Modal', 2, FALSE),
(q, 'Reviu Alert – Pemeriksaan Teknis – Penelaahan – Tutup', 3, TRUE),
(q, 'Reviu Alert – Penelaahan Pemeriksaan Teknis – Pelimpahan ke Direktorat Pemeriksaan Khusus Pasar Modal', 4, FALSE);

-- Q34
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Atas Perintah Tindakan Tertentu yang tidak dipenuhi, OJK berwenang melakukan', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'pemeriksaan dan perintah tertulis', 1, TRUE),
(q, 'pengambilalihan kewenangan dan perintah tertulis', 2, FALSE),
(q, 'perintah tertulis dan teguran tertulis', 3, FALSE),
(q, 'pemeriksaan dan teguran tertulis', 4, FALSE);

-- Q35
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Aplikasi Penerima Laporan Transaksi Efek (PLTE) Daily Watching merupakan aplikasi yang digunakan oleh Pengawas Transaksi Efek untuk melihat data pelaporan transaksi', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'EBUS (Efek bersifat utang (obligasi) atau sukuk)', 1, TRUE),
(q, 'tidak ada jawaban yang benar', 2, FALSE),
(q, 'saham', 3, FALSE),
(q, 'saham dan EBUS (Efek bersifat utang (obligasi) atau sukuk)', 4, FALSE);

-- Q36
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Alur penetapan sanksi yang berlaku di Direktorat Pengawasan Transaksi Efek', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Penyusunan Pendapat Hukum – Penyusunan Surat Sanksi – Surat Sanksi – Pelimpahan ke Direktorat Pemeriksaan Khusus Pasar Modal', 1, FALSE),
(q, 'Pelimpahan dari Direktorat Pemeriksaan Khusus Pasar Modal – Penyusunan Surat Sanksi – Penyusunan Pendapat Hukum – Surat Sanksi', 2, FALSE),
(q, 'Penyusunan Surat Sanksi – Penyusunan Pendapat Hukum – Surat Sanksi – Pelimpahan ke Direktorat Pemeriksaan Khusus Pasar Modal', 3, FALSE),
(q, 'Pelimpahan dari Direktorat Pemeriksaan Khusus Pasar Modal – Penyusunan Pendapat Hukum – Penyusunan Surat Sanksi – Surat Sanksi', 4, TRUE);

-- Q37
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Berikut adalah aplikasi yang digunakan sebagai aplikasi pengawasan', 8, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'e-BAE, e-RKAT', 1, FALSE),
(q, 'ARIA, SIPM, PIPM', 2, FALSE),
(q, 'SIPM, SIPETRO, Daily Watching', 3, TRUE),
(q, 'SPRINT', 4, FALSE);

-- Q38
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Apa perbedaan utama antara metode pemeriksaan off-site inspection dan on-site inspection', 9, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Off-site fokus pada pengaduan, sementara on-site fokus pada pelanggaran', 1, FALSE),
(q, 'Off-site dilakukan secara berkala, sementara on-site dilakukan secara insidentil', 2, FALSE),
(q, 'Off-site menggunakan teknik simulasi, sementara on-site tidak', 3, FALSE),
(q, 'Off-site dilakukan di kantor OJK, sementara on-site dilakukan dengan mendatangi langsung objek pemeriksaan', 4, TRUE);

-- Q39
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Berikut yang merupakan komponen penilaian dari permodalan Manajer Investasi', 10, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Modal Kerja Bersih Disesuaikan', 1, TRUE),
(q, 'Laba/ rugi', 2, FALSE),
(q, 'Return on Asset', 3, FALSE),
(q, 'Return on Equity', 4, FALSE);

-- Q40
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Salah satu aplikasi yang digunakan oleh Pengawas Transaksi Efek untuk melihat data pelaporan transaksi EBUS (Efek bersifat utang (obligasi) atau sukuk) adalah', 11, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'tidak ada jawaban yang benar', 1, FALSE),
(q, 'Microsoft Power Point', 2, FALSE),
(q, 'Sipetro (Nasdaq)', 3, FALSE),
(q, 'Penerima Laporan Transaksi Efek (PLTE) Daily Watching', 4, TRUE);

-- Q41
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Aplikasi Sipetro (Nasdaq) merupakan aplikasi yang digunakan oleh Pengawas Transaksi Efek untuk melihat data transaksi berikut, kecuali', 12, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'pasar negosiasi saham', 1, FALSE),
(q, 'pasar reguler waran', 2, FALSE),
(q, 'pasar negosiasi EBUS (Efek bersifat utang (obligasi) atau sukuk)', 3, TRUE),
(q, 'pasar reguler saham', 4, FALSE);

-- Q42
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Berikut yang merupakan komponen penilaian dari risiko operasional Manajer Investasi, kecuali', 13, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Banyaknya surat pemberitahuan dari Bank Kustodian', 1, TRUE),
(q, 'Jumlah nasabah', 2, FALSE),
(q, 'Besarnya dana kelolaan', 3, FALSE),
(q, 'Kepemilikan kantor cabang', 4, FALSE);

-- Q43
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Salah satu kegiatan yang dilakukan pada tahap pelaksanaan onsite pemeriksaan kepatuhan dan pemeriksaan teknis terhadap profesi penunjang pasar modal adalah', 14, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Penyampaian laporan hasil pemeriksaan', 1, FALSE),
(q, 'Risk profiling', 2, FALSE),
(q, 'Penerbitan Surat Tugas', 3, FALSE),
(q, 'Wawancara / permintaan keterangan', 4, TRUE);

-- ============================================================
-- SECTION D: Derivatif & Bursa Karbon (16 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Derivatif & Bursa Karbon', 30, 1, 'pasar_modal', TRUE, 16)
RETURNING id INTO sD;

-- Q44
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Peraturan OJK yang mengatur tentang Perdagangan Karbon melalui Bursa Karbon adalah', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK Nomor 14 Tahun 2022', 1, FALSE),
(q, 'POJK Nomor 12 Tahun 2023', 2, FALSE),
(q, 'POJK Nomor 14 Tahun 2023', 3, TRUE),
(q, 'POJK Nomor 14 Tahun 2024', 4, FALSE);

-- Q45
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Kewenangan OJK dalam Ekosistem Perdagangan Karbon di Indonesia adalah', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Memberikan Izin Project Developer dan mengawasi Pasar Primer perdagangan karbon', 1, FALSE),
(q, 'Memberikan Izin Project Developer, dan mengawasi lembaga validasi dan verifikasi', 2, FALSE),
(q, 'Memberikan Izin Penyelenggara Bursa Karbon, dan mengawasi Pasar Sekunder perdagangan karbon', 3, TRUE),
(q, 'Mengawasi Pasar Sekunder perdagangan karbon', 4, FALSE);

-- Q46
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Tugas dan wewenang OJK dalam ekosistem Perdagangan Karbon di Indonesia adalah', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Mengatur dan mengawasi penerbitan unit karbon dan pendaftaran pada sistem registrasi nasional', 1, FALSE),
(q, 'Mengatur dan mengawasi penetapan pengurangan emisi dan penerapan pajak karbon', 2, FALSE),
(q, 'Mengatur dan mengawasi penyelenggaraan perdagangan karbon secara menyeluruh', 3, FALSE),
(q, 'Mengatur dan mengawasi perdagangan unit karbon pada pasar sekunder yang ditransaksikan melalui Bursa Karbon', 4, TRUE);

-- Q47
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Manakah pernyataan yang tidak benar terkait unit karbon yang dapat diperdagangkan melalui Bursa Karbon', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Unit karbon SPE GRK di Bursa Karbon yang diterbitkan oleh Kementerian Lingkungan Hidup dan Kehutanan', 1, FALSE),
(q, 'Unit karbon yang diterbitkan oleh registri Internasional dapat diperdagangkan langsung di Bursa Karbon', 2, TRUE),
(q, 'Unit karbon yang diperdagangkan di Bursa Karbon terlebih dahulu tercatat di SRN PPI', 3, FALSE),
(q, 'Unit karbon PTBAE-PU di Bursa Karbon yang diterbitkan oleh Kementerian terkait', 4, FALSE);

-- Q48
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Derivatif adalah instrumen keuangan yang nilainya diturunkan dari', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Harga saham IPO', 1, FALSE),
(q, 'Nilai inflasi', 2, FALSE),
(q, 'Kurs BI', 3, FALSE),
(q, 'Aset yang mendasarinya (underlying)', 4, TRUE);

-- Q49
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Dalam ekosistem perdagangan karbon di Indonesia, pada Pasar Primer, sistem registrasi nasional berada di bawah kewenangan', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Lembaga Validasi dan Verifikasi', 1, FALSE),
(q, 'Kementerian Lingkungan Hidup dan Kehutanan', 2, TRUE),
(q, 'Otoritas Jasa Keuangan', 3, FALSE),
(q, 'Kementerian Koordinator bidang Maritim dan Investasi', 4, FALSE);

-- Q50
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Perdagangan unit karbon dalam negeri dan/atau luar negeri dapat dilakukan dengan kecuali', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Perdagangan langsung', 1, FALSE),
(q, 'Mekanisme Pasar melalui Bursa Karbon', 2, FALSE),
(q, 'Bursa Berjangka', 3, TRUE),
(q, 'IDX Carbon', 4, FALSE);

-- Q51
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Contoh produk derivatif yang diperdagangkan di BEI adalah', 8, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Rights Issue', 1, FALSE),
(q, 'Obligasi Ritel Indonesia', 2, FALSE),
(q, 'SSF LQ45', 3, TRUE),
(q, 'Reksa Dana Syariah', 4, FALSE);

-- Q52
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Pendelegasian wewenang perizinan Sektor Jasa Keuangan di Bidang Pengawasan Sektor Pasar Modal, Keuangan Derivatif, dan Bursa Karbon di Kantor OJK Daerah mulai efektif pelaksanaannya pada tahun', 9, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '2023', 1, FALSE),
(q, '2024', 2, FALSE),
(q, '2025', 3, TRUE),
(q, '2026', 4, FALSE);

-- Q53
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Manakah pernyataan yang tidak benar terkait Penyelenggara Bursa Karbon', 10, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Penyelenggara Bursa Karbon harus memperoleh izin usaha dari OJK', 1, FALSE),
(q, 'Penyelenggara Bursa Karbon harus memperoleh izin usaha dari KLHK', 2, TRUE),
(q, 'Penyelenggara Bursa Karbon dapat menyusun peraturannya sendiri setelah mendapat persetujuan OJK', 3, FALSE),
(q, 'Penyelenggara Bursa Karbon memperdagangkan Unit Karbon yang terdaftar pada SRN-PPI', 4, FALSE);

-- Q54
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Peraturan yang mendasari Pendelegasian Wewenang Kegiatan Operasional Mengenai Perizinan dan Pengawasan Sektor Jasa Keuangan di Bidang Pengawasan Sektor Pasar Modal, Keuangan Derivatif, dan Bursa Karbon di Kantor OJK Daerah adalah', 11, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'PDK nomor 1/PDK.02/2023 tanggal 31 Januari 2023', 1, FALSE),
(q, 'KADK nomor KEP-45/D.02/2017 tanggal 13 Juni 2017', 2, FALSE),
(q, 'KADK nomor KEP-1/D.04/2024 tanggal 8 Januari 2024', 3, TRUE),
(q, 'SEDK nomor 19/SEDK.02/2023 tanggal 1 September 2023', 4, FALSE);

-- Q55
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Berikut di bawah ini adalah jenis pasar perdana dalam perdagangan karbon yang hanya dapat digunakan oleh regulator/project developer di bursa karbon yaitu', 12, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pasar Lelang (Auction)', 1, TRUE),
(q, 'Pasar Langsung (Direct)', 2, FALSE),
(q, 'Pasar Reguler', 3, FALSE),
(q, 'Pasar Negosiasi', 4, FALSE);

-- Q56
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Menurut UU P2SK, kewenangan pengaturan derivatif keuangan beralih dari Bappebti ke', 13, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Kementerian Keuangan', 1, FALSE),
(q, 'OJK dan BI', 2, TRUE),
(q, 'KPPU', 3, FALSE),
(q, 'BEI', 4, FALSE);

-- Q57
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Di dalam Pendelegasian Wewenang di Bidang Sektor Pasar Modal, Keuangan Derivatif, dan Bursa Karbon, Kantor OJK Daerah diberikan kewenangan melakukan Pemeriksaan terhadap Lembaga Jasa Keuangan di Daerah, kecuali', 14, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Kantor Perwakilan Bursa Efek', 1, TRUE),
(q, 'Wakil Perusahaan Efek', 2, FALSE),
(q, 'Perusahaan Efek', 3, FALSE),
(q, 'Mitra Pemasaran Perantara Pedagang Efek', 4, FALSE);

-- Q58
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Manakah yang termasuk dalam mekanisme penyelenggaraan Nilai Ekonomi Karbon di Indonesia', 15, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pembayaran Berbasis Kinerja / Result-Based Payment', 1, FALSE),
(q, 'Perdagangan Karbon', 2, FALSE),
(q, 'Pajak Karbon', 3, FALSE),
(q, 'Semua Benar', 4, TRUE);

-- Q59
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Pihak yang bertugas melakukan kliring dan penjaminan derivatif keuangan adalah', 16, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Bappebti', 1, FALSE),
(q, 'Lembaga Kliring dan Penjaminan (LKP)', 2, TRUE),
(q, 'Perusahaan Efek', 3, FALSE),
(q, 'BEI', 4, FALSE);

-- ============================================================
-- SECTION E: Pasar Modal Syariah & Muamalat (7 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Pasar Modal Syariah & Muamalat', 31, 1, 'pasar_modal', TRUE, 7)
RETURNING id INTO sE;

-- Q60
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Fatwa DSN-MUI yang mengatur Reksa Dana Syariah adalah', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Fatwa 20', 1, TRUE),
(q, 'Fatwa 80', 2, FALSE),
(q, 'Fatwa 23', 3, FALSE),
(q, 'Fatwa 40', 4, FALSE);

-- Q61
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Reksa Dana Syariah berbeda dari reksa dana konvensional karena', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Return selalu lebih tinggi', 1, FALSE),
(q, 'Terdapat mekanisme pembersihan kekayaan reksa dana yang tidak dapat diakui sebagai NAB', 2, TRUE),
(q, 'Tidak boleh investasi di obligasi', 3, FALSE),
(q, 'Tidak dikelola manajer investasi', 4, FALSE);

-- Q62
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Salah satu perbedaan Reksa Dana Syariah dibandingkan dengan Reksa Dana Konvensional adalah Reksa Dana Syariah hanya dapat menginvestasikan dananya pada Efek', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Obligasi, SBSN, Saham Syariah, Deposito Konvensional', 1, FALSE),
(q, 'Saham Syariah, Sukuk, SBSN, Instrumen Pasar Uang Syariah', 2, TRUE),
(q, 'Saham, Sukuk, Obligasi, ETF', 3, FALSE),
(q, 'Sukuk, ETF Syariah, Saham Syariah, Reksa Dana', 4, FALSE);

-- Q63
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Jenis akad dalam reksadana syariah antara pihak pemberi kuasa dan pihak penerima kuasa dengan cara pihak pemberi kuasa memberikan kuasa kepada pihak penerima kuasa untuk menginvestasikan uang investor kedalam produk syariah adalah konsep akad', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Kafalah', 1, FALSE),
(q, 'Istishna', 2, FALSE),
(q, 'Wakalah', 3, TRUE),
(q, 'Ijarah', 4, FALSE);

-- Q64
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Proses screening Daftar Efek Syariah (DES) atas laporan keuangan yang dilakukan oleh OJK adalah', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Tidak melakukan kegiatan usaha yang bertentangan dengan prinsip syariah, total utang berbasis bunga dibanding total aset tidak lebih dari 45%, dan total pendapatan non halal dibandingkan dengan total pendapatan tidak lebih dari 10%', 1, TRUE),
(q, 'Tidak melakukan kegiatan usaha yang bertentangan dengan prinsip syariah, total utang berbasis bunga dibanding total aset sama dengan 45%, dan total pendapatan non halal dibandingkan dengan total pendapatan tidak lebih dari 10%', 2, FALSE),
(q, 'Tidak melakukan kegiatan usaha yang bertentangan dengan prinsip syariah, total utang berbasis bunga dibanding total aset lebih dari 45%, dan total pendapatan non halal dibandingkan dengan total pendapatan lebih dari 10%', 3, FALSE),
(q, 'Tidak melakukan kegiatan usaha yang bertentangan dengan prinsip syariah, total utang berbasis bunga dibanding total aset tidak lebih dari 45%, dan total pendapatan non halal dibandingkan dengan total pendapatan sama dengan 10%', 4, FALSE);

-- Q65
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Salah satu kriteria business screening dalam Daftar Efek Syariah (DES) adalah', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Membagikan dividen', 1, FALSE),
(q, 'Tidak melakukan usaha perjudian', 2, TRUE),
(q, 'Likuiditas tinggi', 3, FALSE),
(q, 'Laba bersih stabil', 4, FALSE);

-- Q66
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Pasar Modal Syariah adalah kegiatan pasar modal yang', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Hanya untuk bank syariah', 1, FALSE),
(q, 'Tidak bertentangan dengan prinsip syariah', 2, TRUE),
(q, 'Menggunakan indeks global', 3, FALSE),
(q, 'Bebas pajak', 4, FALSE);

END $$;
