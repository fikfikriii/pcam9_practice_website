-- Kurasi Quiz & Ujian PPDP — 53 questions across 5 new sections
-- Source: new 'curated' source (label 'Curated')
-- Category: ppdp, Module: 1, Positions: 22-26

-- 1. Add source
INSERT INTO question_sources (id, label) VALUES ('curated', 'Curated') ON CONFLICT DO NOTHING;

DO $$
DECLARE
  sA INT; sB INT; sC INT; sD INT; sE INT;
  q INT;
BEGIN

-- ============================================================
-- SECTION A: Dasar Asuransi, Produk & Pelaku (21 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Dasar Asuransi, Produk & Pelaku', 22, 1, 'ppdp', TRUE, 21)
RETURNING id INTO sA;

-- Q1
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Apa yang dimaksud dengan asuransi', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Perjanjian yang didasarkan pada hasil pengelolaan dana', 1, FALSE),
(q, 'Perjanjian di mana seorang penanggung mengikatkan diri kepada seorang tertanggung untuk memberikan penggantian karena suatu kerugian, kerusakan, atau kehilangan keuntungan yang diharapkan', 2, TRUE),
(q, 'Pertanggungan atau perjanjian antara dua pihak di mana pihak yang satu berkewajiban membayar iuran dan pihak yang lain memberikan jaminan sepenuhnya kepada pembayar iuran', 3, FALSE),
(q, 'Perjanjian antara dua pihak yang menjadi dasar bagi penerimaan premi oleh perusahaan asuransi', 4, FALSE);

-- Q2
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Sejumlah uang yang dibayarkan oleh Tertanggung kepada Penanggung atas suatu mekanisme pengalihan risiko disebut', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Premi', 1, TRUE),
(q, 'Asuransi', 2, FALSE),
(q, 'Polis', 3, FALSE),
(q, 'Klaim', 4, FALSE);

-- Q3
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Usaha jasa pertanggungan ulang terhadap risiko yang dihadapi oleh perusahaan asuransi, perusahaan penjaminan, atau perusahaan reasuransi lainnya, disebut', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Usaha reasuransi', 1, TRUE),
(q, 'Usaha asuransi jiwa', 2, FALSE),
(q, 'Usaha penjaminan ulang', 3, FALSE),
(q, 'Usaha asuransi umum', 4, FALSE);

-- Q4
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Definisi yang paling tepat atas usaha asuransi jiwa sesuai UU Nomor 4 Tahun 2023 Tentang Pengembangan dan Penguatan Sektor Keuangan adalah', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'usaha yang menyelenggarakan jasa penanggulangan risiko yang memberikan pembayaran kepada pemegang polis, tertanggung, atau pihak lain yang berhak dalam hal tertanggung meninggal dunia atau tetap hidup, atau pembayaran lain kepada pemegang polis, tertanggung, atau pihak lain yang berhak pada waktu tertentu yang diatur dalam perjanjian, yang besarnya telah ditetapkan dan/atau didasarkan pada hasil pengelolaan dana', 1, TRUE),
(q, 'usaha jasa pertanggungan ulang terhadap risiko yang dihadapi oleh perusahaan asuransi, perusahaan penjaminan, atau perusahaan reasuransi lainnya', 2, FALSE),
(q, 'usaha jasa pertanggungan risiko yang memberikan penggantian kepada tertanggung atau pemegang polis karena kerugian, biaya yang timbul, kehilangan keuntungan, atau tanggung jawab hukum kepada pihak ketiga yang mungkin diderita tertanggung atau pemegang polis karena terjadinya suatu peristiwa yang tidak pasti', 3, FALSE),
(q, 'usaha yang menyelenggarakan jasa penanggulangan risiko yang memberikan pembayaran kepada pemegang polis', 4, FALSE);

-- Q5
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Berikut ini bukan merupakan jenis usaha asuransi', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Perusahaan Asuransi Umum', 1, FALSE),
(q, 'Perusahaan Asuransi Kendaraan Bermotor', 2, TRUE),
(q, 'Perusahaan Reasuransi', 3, FALSE),
(q, 'Perusahaan Asuransi Jiwa', 4, FALSE);

-- Q6
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Asuransi Kesehatan merupakan lini usaha dari', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Perusahaan Asuransi Umum', 1, FALSE),
(q, 'Perusahaan Reasuransi', 2, FALSE),
(q, 'Perusahaan Asuransi Jiwa', 3, FALSE),
(q, 'Perusahaan Asuransi Jiwa dan Perusahaan Asuransi Umum', 4, TRUE);

-- Q7
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Produk Asuransi yang terkait dengan investasi adalah', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Dwiguna', 1, FALSE),
(q, 'Asuransi jiwa berjangka', 2, FALSE),
(q, 'Anuitas', 3, FALSE),
(q, 'PAYDI', 4, TRUE);

-- Q8
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Produk asuransi yang paling sedikit memberikan perlindungan terhadap risiko kematian dan memberikan manfaat yang mengacu pada hasil investasi dari kumpulan dana yang khusus dibentuk untuk Produk Asuransi baik yang dinyatakan dalam bentuk unit maupun bukan unit disebut', 8, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Produk Asuransi Yang Dikaitkan Dengan Investasi', 1, TRUE),
(q, 'Dwiguna', 2, FALSE),
(q, 'Seumur Hidup', 3, FALSE);

-- Q9
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Pihak yang dapat memberikan jasa penilaian terhadap kerugian pada obyek asuransi yang dipertanggungkan, adalah', 9, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Aktuaris', 1, FALSE),
(q, 'Pialang asuransi/reasuransi', 2, FALSE),
(q, 'Underwriter', 3, FALSE),
(q, 'Penilai kerugian', 4, TRUE);

-- Q10
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Yang termasuk penunjang usaha asuransi, kecuali', 10, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pialang Reasuransi', 1, FALSE),
(q, 'Konsultan Pajak', 2, TRUE),
(q, 'Perusahaan penilaian kerugian', 3, FALSE),
(q, 'Konsultan Aktuaria', 4, FALSE);

-- Q11
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Produk asuransi yang memberikan jaminan untuk membayar kepada penerima jaminan/obligee apabila terjamin/principal wanprestasi atas pelaksanaan kontrak yang dijamin, berdasarkan pada syarat dan kondisi yang dicetak, dicantumkan, dilekatkan dan/atau dibuatkan endorsemen pada ketentuan polis disebut', 11, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Suretyship', 1, TRUE),
(q, 'Semua salah', 2, FALSE),
(q, 'Asuransi Tanggung Gugat', 3, FALSE),
(q, 'Asuransi Rekayasa', 4, FALSE),
(q, 'Asuransi Kredit', 5, FALSE);

-- Q12
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Prinsip asuransi yang mengatur mengenai hak untuk mengasuransikan, yang timbul dari suatu hubungan keuangan, antara tertanggung dengan yang diasuransikan dan diakui secara hukum disebut', 12, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Moral Hazard', 1, FALSE),
(q, 'Contribution', 2, FALSE),
(q, 'Proximate Cause', 3, FALSE),
(q, 'Insurable Interest', 4, TRUE),
(q, 'Subrogasi', 5, FALSE);

-- Q13
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Di bawah ini merupakan prinsip asuransi', 13, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Subrogasi, Proximate Cause, Moral Hazard', 1, FALSE),
(q, 'Deductible, Subrogasi, Proximate cause', 2, FALSE),
(q, 'Contribution, Moral Hazard, Proximate Cause', 3, FALSE),
(q, 'Deductible, Moral Hazard, Proximate Cause', 4, FALSE),
(q, 'Contribution, Subrogasi, Proximate cause', 5, TRUE);

-- Q14
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Suatu mekanisme dimana penanggung menyediakan kompensasi finansial dalam upayanya menempatkan tertanggung dalam posisi keuangan yang ia miliki sesaat sebelum terjadinya kerugian disebut', 14, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Indemnity', 1, TRUE),
(q, 'Subrogasi', 2, FALSE),
(q, 'Proximate Cause', 3, FALSE);

-- Q15
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Membeli asuransi kendaraan merupakan contoh pengelolaan risiko dengan cara', 15, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'transfer risiko', 1, TRUE),
(q, 'pendanaan', 2, FALSE),
(q, 'penahanan', 3, FALSE),
(q, 'penghindaran', 4, FALSE);

-- Q16
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Apa tujuan utama dari asuransi', 16, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Menyediakan dana pensiun bagi tertanggung', 1, FALSE),
(q, 'Menghasilkan keuntungan besar bagi perusahaan asuransi', 2, FALSE),
(q, 'Memberikan perlindungan agar keuangan masyarakat tidak akan terganggu ketika terjadi suatu risiko yang menimbulkan kerugian', 3, TRUE),
(q, 'Meningkatkan nilai aset perusahaan', 4, FALSE);

-- Q17
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Berikut ini yang bukan kegiatan usaha kepialangan adalah', 17, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Jasa penanganan klaim', 1, FALSE),
(q, 'Jasa Konsultan', 2, FALSE),
(q, 'Jasa keperantaraan', 3, FALSE),
(q, 'Jasa penerbitan polis', 4, TRUE);

-- Q18
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Perusahaan Pialang Asuransi dalam melaksanakan kegiatan usahanya wajib memiliki Pialang Asuransi, salah satu tugas Pialang Asuransi adalah', 18, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'memberikan informasi terkini mengenai perkembangan industri asuransi dan peraturan di bidang perasuransian kepada Pialang Asuransi', 1, FALSE),
(q, 'membuat dan menerapkan proses kerja Pialang Asuransi yang baik', 2, FALSE),
(q, 'membantu calon pemegang polis, tertanggung atau peserta dalam proses penanganan klaim', 3, TRUE),
(q, 'melakukan peninjauan atas kredibilitas Perusahaan Asuransi', 4, FALSE);

-- Q19
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Manakah yang tidak termasuk dalam proses penanganan klaim bagi Perusahaan Pialang Asuransi', 19, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Menginformasikan dokumen pendukung yang dibutuhkan paling lama 3 hari kerja sejak pemberitahuan klaim diterima', 1, FALSE),
(q, 'Menyampaikan informasi pengajuan klaim paling lama 1 hari kerja setelah diterimanya informasi pengajuan klaim', 2, FALSE),
(q, 'Memberikan penilaian atas kejadian klaim', 3, TRUE),
(q, 'Menyampaikan dokumen pendukung kepada PA/PAS paling lama 1 hari kerja sejak seluruh dokumen pendukung diterima', 4, FALSE);

-- Q20
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Standar Penanganan Klaim bagi Perusahaan Pialang Asuransi (PPA) yang diatur dalam ketentuan adalah', 20, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'PPA wajib menyampaikan laporan penilaian kerugian kepada Perusahaan Reasuransi', 1, FALSE),
(q, 'PPA memutuskan nilai klaim dari suatu kejadian', 2, FALSE),
(q, 'PPA melakukan survey lokasi', 3, FALSE),
(q, 'PPA wajib menginformasikan besar nilai klaim/manfaat yang disetujui oleh Perusahaan Asuransi kepada pemegang polis, tertanggung, peserta', 4, TRUE);

-- Q21
INSERT INTO questions (section_id, text, position, source) VALUES (sA, 'Manakah yang tidak termasuk dalam proses bisnis perusahaan penilai kerugian asuransi', 21, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Melakukan survey penanganan klaim', 1, FALSE),
(q, 'Melakukan koordinasi dengan tertanggung', 2, FALSE),
(q, 'Menawarkan pilihan lebih dari 1 perusahaan asuransi kepada tertanggung', 3, TRUE);

-- ============================================================
-- SECTION B: Pengawasan PPDP Berbasis Risiko, TKS & Risiko (16 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Pengawasan PPDP Berbasis Risiko, TKS & Risiko', 23, 1, 'ppdp', TRUE, 16)
RETURNING id INTO sB;

-- Q22
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Yang tidak termasuk dalam Faktor Penilaian Tingkat Kesehatan berdasarkan POJK 28/2020 tentang Penilaian Tingkat Kesehatan LJKNB', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Rentabilitas', 1, FALSE),
(q, 'Tata Kelola Perusahaan Yang Baik', 2, FALSE),
(q, 'Jumlah Pemegang Polis', 3, TRUE),
(q, 'Permodalan', 4, FALSE);

-- Q23
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Berikut adalah Peringkat Komposit TKS, kecuali', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Sehat', 1, FALSE),
(q, 'Tidak Sehat', 2, FALSE),
(q, 'Sedang Sehat', 3, TRUE),
(q, 'Kurang Sehat', 4, FALSE);

-- Q24
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Dalam melakukan pengawasan terhadap Perusahaan Asuransi dan Perusahaan Reasuransi, OJK menggunakan metode pengawasan', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pengawasan berbasis risiko', 1, TRUE),
(q, 'Pengawasan Langsung dan Tidak Langsung', 2, FALSE),
(q, 'Pengawasan atas aspek pengelolaan risiko dan Kesehatan keuangan', 3, FALSE),
(q, 'Pengawasan atas tatakelola dan pengelolaan keuangan Perusahaan Asuransi dan Perusahaan Reasuransi', 4, FALSE);

-- Q25
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Pihak yang hadir dalam kegiatan forum panel pengawasan LJKNB berbasis risiko adalah, kecuali', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Sekretariat Forum Panel pengawasan berbasis risiko', 1, FALSE),
(q, 'Pengawas', 2, FALSE),
(q, 'Panelis', 3, FALSE),
(q, 'Perusahaan / Lembaga Jasa Keuangan Nonbank', 4, TRUE);

-- Q26
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Posisi Forum Panel pengawasan berbasis risiko dalam siklus pengawasan Lembaga Jasa Keuangan Nonbank berbasis risiko adalah terdapat pada tahap', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Tindakan Pengawasan dan Pemantauan', 1, FALSE),
(q, 'Perencanaan Pengawasan (Supervisory Plan)', 2, FALSE),
(q, 'Pembahaman terhadap Lembaga Jasa Keuangan Nonbank (Know Your Nonbank Financial Institution)', 3, FALSE),
(q, 'Penilaian Tingkat Kesehatan Lembaga Jasa Keuangan Nonbank', 4, TRUE);

-- Q27
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Pertimbangan dalam pemilihan LJKNB yang akan dipanel adalah', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'tergolong LJKNB utama', 1, FALSE),
(q, 'LJKNB berada dalam status pengawasan intensif atau khusus', 2, FALSE),
(q, 'Semua Benar', 3, TRUE),
(q, 'pertimbangan lainnya yang diperlukan', 4, FALSE);

-- Q28
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Dalam Surat Edaran Dewan Komisioner OJK tentang Pedoman Pelaksanaan Pengendalian Kualitas (Quality Assurance) Dalam Rangka Pengawasan Lembaga Jasa Keuangan Nonbank Berbasis Risiko Melalui Forum Panel Pengawasan Lembaga Jasa Keuangan Nonbank Berbasis Risiko, Lembaga Jasa Keuangan Nonbank yang dimaksud, kecuali', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Perusahaan Pembiayaan', 1, FALSE),
(q, 'Perusahaan Asuransi dan Perusahaan Reasuransi', 2, FALSE),
(q, 'Perusahaan Penilai Kerugian', 3, TRUE),
(q, 'Dana Pensiun', 4, FALSE);

-- Q29
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Di bawah ini yang bukan merupakan alat pengawasan adalah', 8, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Hasil analisis laporan Berkala', 1, FALSE),
(q, 'Kebijakan peraturan', 2, TRUE),
(q, 'Pemeriksaan langsung', 3, FALSE),
(q, 'Laporan Berkala BPJS', 4, FALSE);

-- Q30
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Pemantauan atas Tingkat Kesehatan keuangan dari Perusahaan Asuransi dan Perusahaan Reasuransi mencakup antara lain', 9, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Penilaian atas tingkat solvabilitas Perusahaan Asuransi dan Perusahaan Reasuransi', 1, TRUE),
(q, 'Penilaian atas aspek prudential pengelolaan risiko asuransi', 2, FALSE),
(q, 'Penilaian atas Manajemen Risiko dalam pengelolaan investasi', 3, FALSE),
(q, 'Penilaian atas profitabilitas atas Perusahaan Asuransi dan Perusahaan Reasuransi', 4, FALSE);

-- Q31
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Di bawah ini risiko apa yang bukan risiko finansial', 10, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Risiko Likuiditas', 1, FALSE),
(q, 'Risiko Pasar', 2, FALSE),
(q, 'Risiko Asuransi', 3, FALSE),
(q, 'Risiko Operasional', 4, TRUE);

-- Q32
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Berikut ini contoh risiko bisnis, kecuali', 11, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'risiko banjir', 1, TRUE),
(q, 'risiko pasar', 2, FALSE),
(q, 'risiko kurs', 3, FALSE),
(q, 'risiko bunga', 4, FALSE);

-- Q33
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Mengevaluasi besarnya dampak risiko terhadap organisasi, merupakan kegiatan', 12, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'identifikasi risiko', 1, FALSE),
(q, 'manajemen risiko terpadu', 2, FALSE),
(q, 'pengukuran risiko', 3, TRUE),
(q, 'pengelolaan risiko', 4, FALSE);

-- Q34
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Risiko misselling termasuk kategori', 13, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Risiko Operational', 1, TRUE),
(q, 'Risiko Strategis', 2, FALSE),
(q, 'Risiko Asuransi', 3, FALSE),
(q, 'Risiko Pasar', 4, FALSE);

-- Q35
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Naik turunnya harga saham termasuk di dalam risiko', 14, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Risiko Strategis', 1, FALSE),
(q, 'Risiko Hukum', 2, FALSE),
(q, 'Risiko Pasar', 3, TRUE),
(q, 'Risiko Kepatuhan', 4, FALSE);

-- Q36
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Status Pengawasan Perusahaan Asuransi Syariah, kecuali', 15, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Status Pengawasan Khusus', 1, FALSE),
(q, 'Status Pengawasan Intensif', 2, FALSE),
(q, 'Status Cabut Izin Usaha', 3, TRUE),
(q, 'Status Pengawasan Normal', 4, FALSE);

-- Q37
INSERT INTO questions (section_id, text, position, source) VALUES (sB, 'Batas minimal tingkat kesehatan keuangan perusahaan Asuransi/ Rasio Solvabilitas adalah sebesar', 16, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '120%', 1, TRUE),
(q, '200%', 2, FALSE),
(q, '150%', 3, FALSE),
(q, '100%', 4, FALSE);

-- ============================================================
-- SECTION C: Asuransi Syariah & Akad (7 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Asuransi Syariah & Akad', 24, 1, 'ppdp', TRUE, 7)
RETURNING id INTO sC;

-- Q38
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Berikut ini merupakan ciri-ciri dari asuransi syariah, kecuali', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Sharing of risk antara sesama peserta asuransi', 1, FALSE),
(q, 'Sharing of risk antara tertanggung dengan perusahaan asuransi', 2, TRUE),
(q, 'Memiliki dewan pengawas syariah', 3, FALSE),
(q, 'Investasi dikelola sesuai prinsip syariah', 4, FALSE),
(q, 'Menggunakan akad sesuai prinsip syariah', 5, FALSE);

-- Q39
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Dalam asuransi syariah, akad yang dilakukan dengan tujuan tolong menolong dalam rangka berbuat kebaikan adalah', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Akad Wakalah bil Ujrah', 1, FALSE),
(q, 'Akad Tijarah', 2, FALSE),
(q, 'Akad Mudharabah', 3, FALSE),
(q, 'Akad Tanahud', 4, FALSE),
(q, 'Akad Tabarru''', 5, TRUE);

-- Q40
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Akad tabarru adalah', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Akad antara peserta secara kolektif atau secara individu dan Perusahaan Asuransi Syariah, Perusahaan Reasuransi Syariah, atau Unit Syariah dengan tujuan komersial', 1, FALSE),
(q, 'Akad Tijarah yang memberikan kuasa kepada Perusahaan Asuransi Syariah, Perusahaan Reasuransi Syariah, atau Unit Syariah sebagai mudharib (pengelola dana) untuk mengelola investasi Dana Tabarru'' dan/atau Dana Investasi Peserta, sesuai kuasa atau wewenang yang diberikan, dengan imbalan berupa bagi hasil (nisbah) yang besarnya ditentukan berdasarkan komposisi kekayaan yang digabungkan dan telah disepakati sebelumnya', 2, FALSE),
(q, 'Akad hibah dalam bentuk pemberian dana dari satu peserta kepada Dana Tabarru'' untuk tujuan tolong menolong di antara para peserta, yang bersifat dan untuk tujuan komersial', 3, FALSE),
(q, 'Akad antara peserta secara kolektif atau secara individu dan Perusahaan Asuransi Syariah, Perusahaan Reasuransi Syariah, atau Unit Syariah dengan tujuan bukan komersial', 4, TRUE);

-- Q41
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Komponen yang terdapat di dalam dana tabarru adalah, kecuali', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Manfaat Penarikan Investasi', 1, TRUE),
(q, 'Penyisihan Teknis', 2, FALSE),
(q, 'Iuran Tabarru', 3, FALSE),
(q, 'Surplus Underwriting', 4, FALSE);

-- Q42
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Berikut adalah karakteristik dari asuransi syariah', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Surplus Underwriting merupakan hak seluruh peserta dan dapat dibagi sesuai dengan kesepakatan peserta', 1, TRUE),
(q, 'Kepemilikan dana seluruhnya dimiliki perusahaan sesuai dengan perjanjian, kecuali investasi dari produk unit link', 2, FALSE),
(q, 'Pemegang polis wajib membayar premi untuk memperoleh perlindungan jiwa, kesehatan dan/atau hartanya dari perusahaan', 3, FALSE),
(q, 'Sifat bisnis merupakan pengalihan risiko', 4, FALSE);

-- Q43
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Berikut adalah Persyaratan Tingkat Solvabilitas Perusahaan Asuransi dan Reasuransi Syariah', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Tingkat Solvabilitas Dana Perusahaan paling rendah 100% dari DTMBR', 1, FALSE),
(q, 'Tingkat Solvabilitas Dana Tabarru'' paling rendah 120% dari DTMBR', 2, FALSE),
(q, 'Tingkat Solvabilitas Dana Tabarru'' paling rendah 100% dari DTMBR', 3, TRUE),
(q, 'Tingkat Solvabilitas Dana Tabarru'' paling rendah 100% dari MMBR', 4, FALSE);

-- Q44
INSERT INTO questions (section_id, text, position, source) VALUES (sC, 'Risiko yang mempengaruhi perhitungan DTMBR, antara lain', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Risiko Kredit, Risiko Pasar, Risiko Asuransi, Risiko Likuiditas, Risiko Operasional', 1, TRUE),
(q, 'Risiko Kredit, Risiko Pasar, Risiko Asuransi, Risiko Hukum, Risiko Operasional', 2, FALSE),
(q, 'Risiko Kredit, Risiko Pasar, Risiko Asuransi, Risiko Hukum, Risiko Strategis', 3, FALSE),
(q, 'Risiko Kepatuhan, Risiko Pasar, Risiko Asuransi, Risiko Likuiditas, Risiko Operasional', 4, FALSE);

-- ============================================================
-- SECTION D: Dana Pensiun: RBS, Risiko & Syariah (7 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Dana Pensiun: RBS, Risiko & Syariah', 25, 1, 'ppdp', TRUE, 7)
RETURNING id INTO sD;

-- Q45
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Pernyataan yang tepat terkait dengan Dewan Pengawas Syariah (DPS)', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Dana Pensiun Lembaga Keuangan yang menjual Paket Investasi Syariah tidak wajib memiliki DPS', 1, FALSE),
(q, 'DPS memiliki tugas untuk melakukan pengawasan aspek syariah pada penyelenggaraan program pensiun syariah', 2, TRUE),
(q, 'DPS pada Dana Pensiun Syariah dapat langsung melaksanakan tugas setelah mendapatkan rekomendasi dari Dewan Syariah Nasional Majelis Ulama Indonesia', 3, FALSE),
(q, 'DPS wajib menyampaikan laporan hasil pengawasan kepada OJK 2 (dua) kali dalam 1 (satu) tahun', 4, FALSE);

-- Q46
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Organ Dana Pensiun Syariah sebagai berikut', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pengurus dan Dewan Pengawas Syariah', 1, FALSE),
(q, 'Pengurus, Dewan Pengawas dan Dewan Pengawas Syariah', 2, TRUE),
(q, 'Pengurus dan Dewan Pengawas', 3, FALSE),
(q, 'Dewan Pengawas dan Dewan Pengawas Syariah', 4, FALSE);

-- Q47
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Perbedaan karakteristik dana pensiun syariah dengan dana pensiun konvensional', 3, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'tidak harus menggunakan akad', 1, FALSE),
(q, 'kepengurusan hanya terdiri atas pengurus dan dewan pengawas', 2, FALSE),
(q, 'instrument investasi yang digunakan tidak harus sesuai prinsip syariah', 3, FALSE),
(q, 'apabila pemberi kerja telat membayar iuran pensiun, pemberi kerja dikenakan sanksi ta''zir yang dimasukan ke dalam dana sosial', 4, TRUE);

-- Q48
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Siklus pengawasan Dana Pensiun antara lain, kecuali', 4, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Compliance Based Supervision', 1, TRUE),
(q, 'Penilaian Tingkat Kesehatan', 2, FALSE),
(q, 'Penyusunan Know Your Pension Fund (KYPF)', 3, FALSE),
(q, 'Forum panel', 4, FALSE);

-- Q49
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Aktivitas mengumpulkan data dan informasi terkait kondisi Dana Pensiun merupakan salah satu bagian dari siklus pengawasan Dana Pensiun yaitu', 5, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Penilaian Tingkat Kesehatan', 1, FALSE),
(q, 'Forum panel', 2, FALSE),
(q, 'Penyusunan Know Your Pension Fund (KYPF)', 3, TRUE),
(q, 'Compliance Based Supervision', 4, FALSE);

-- Q50
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Penilaian Tingkat Kesehatan Dana Pensiun mencakup aspek berikut', 6, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Tata Kelola Perusahaan yang baik, profil dana pensiun, rentabilitas, pendanaan (DPPK)', 1, FALSE),
(q, 'Tata Kelola Perusahaan yang baik, profil risiko, rentabilitas, pendanaan (DPPK)', 2, TRUE),
(q, 'Tata Kelola Perusahaan yang baik, profil dana pensiun, likuiditas, pendanaan (DPPK)', 3, FALSE),
(q, 'Likuiditas dana pensiun, rentabilitas, pendanaan (DPPK)', 4, FALSE);

-- Q51
INSERT INTO questions (section_id, text, position, source) VALUES (sD, 'Risiko akibat kegagalan debitur dan/atau pihak lain dalam memenuhi kewajiban kepada Dana Pensiun merupakan definisi dari risiko', 7, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Risiko Pasar', 1, FALSE),
(q, 'Risiko Operasional', 2, FALSE),
(q, 'Risiko Hukum', 3, FALSE),
(q, 'Risiko Kredit', 4, TRUE);

-- ============================================================
-- SECTION E: Pemeriksaan, TI & Market Conduct (2 questions)
-- ============================================================
INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Pemeriksaan, TI & Market Conduct', 26, 1, 'ppdp', TRUE, 2)
RETURNING id INTO sE;

-- Q52
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Yang bukan merupakan tahapan pelaksanaan pemeriksaan khusus adalah', 1, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Perencanaan pemeriksaan khusus', 1, FALSE),
(q, 'Penyusunan laporan hasil pemeriksaan khusus', 2, FALSE),
(q, 'Evaluasi hasil pemeriksaan khusus', 3, TRUE),
(q, 'Pelaksanaan pemeriksaan khusus', 4, FALSE);

-- Q53
INSERT INTO questions (section_id, text, position, source) VALUES (sE, 'Penerapan manajemen risiko teknologi informasi sebagai fokus pemeriksaan spesialis IT mengacu pada', 2, 'curated') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK Nomor 23/POJK.05/2023', 1, FALSE),
(q, 'POJK Nomor 28/POJK.05/2020', 2, FALSE),
(q, 'POJK Nomor 4/POJK.05/2021', 3, TRUE),
(q, 'POJK Nomor 44/POJK.05/2020', 4, FALSE);

END $$;
