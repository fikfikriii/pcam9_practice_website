-- Derivatif & Bursa Karbon — 42 questions
-- Source: additional | Category: pasar_modal | Module: 2 | Position: 39

DO $$
DECLARE
  s INT;
  q INT;
BEGIN

INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Derivatif & Bursa Karbon', 39,
  (SELECT id FROM modules WHERE number = 2),
  'pasar_modal', TRUE, 42)
RETURNING id INTO s;

-- Q1
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Berikut ini yang paling tepat menggambarkan derivatif keuangan adalah...', 1, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Instrumen keuangan berupa saham yang diperdagangkan di bursa efek', 1, FALSE),
(q, 'Kontrak atau produk keuangan yang nilainya mengikuti atau diturunkan dari nilai aset yang mendasari (underlying asset)', 2, TRUE),
(q, 'Reksa dana yang mengikuti indeks saham tertentu sebagai tolok ukur kinerja', 3, FALSE),
(q, 'Obligasi yang diterbitkan oleh pemerintah untuk keperluan pembiayaan negara', 4, FALSE);

-- Q2
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Seorang eksportir Indonesia yang khawatir nilai tukar rupiah akan melemah sehingga menurunkan penerimaan rupiah dari penjualan dollarnya menggunakan kontrak derivatif untuk mengunci nilai tukar tersebut. Tindakan eksportir ini mencerminkan tujuan penggunaan derivatif sebagai...', 2, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Spekulasi', 1, FALSE),
(q, 'Arbitrase', 2, FALSE),
(q, 'Hedging (lindung nilai)', 3, TRUE),
(q, 'Market making', 4, FALSE);

-- Q3
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Pernyataan yang BENAR mengenai tujuan penggunaan derivatif keuangan adalah...', 3, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Derivatif hanya boleh digunakan untuk tujuan hedging dan dilarang untuk spekulasi', 1, FALSE),
(q, 'Tujuan utama derivatif adalah spekulasi, sedangkan hedging merupakan tujuan sekunder', 2, FALSE),
(q, 'Derivatif dapat digunakan untuk dua tujuan utama: hedging (lindung nilai) dan spekulasi', 3, TRUE),
(q, 'Penggunaan derivatif untuk tujuan spekulasi wajib mendapat persetujuan OJK terlebih dahulu', 4, FALSE);

-- Q4
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Berdasarkan PP 49 Tahun 2024, kewenangan pengaturan dan pengawasan derivatif keuangan dengan underlying berupa efek beralih dari Bappebti ke OJK. Kapan peralihan kewenangan tersebut mulai berlaku efektif?', 4, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '12 Januari 2023, bertepatan dengan berlakunya UU P2SK', 1, FALSE),
(q, '24 bulan setelah UU P2SK berlaku, yaitu sekitar Januari 2025', 2, TRUE),
(q, 'Segera setelah PP 49 Tahun 2024 diundangkan', 3, FALSE),
(q, '6 bulan setelah POJK 1 Tahun 2025 ditetapkan', 4, FALSE);

-- Q5
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Setelah peralihan kewenangan derivatif keuangan, peraturan OJK yang menjadi dasar pengaturan derivatif keuangan dengan aset yang mendasari berupa efek adalah...', 5, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK 14 Tahun 2023', 1, FALSE),
(q, 'POJK 1 Tahun 2025', 2, TRUE),
(q, 'POJK 32 Tahun 2015', 3, FALSE),
(q, 'POJK 41 Tahun 2020', 4, FALSE);

-- Q6
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Setelah berlakunya UU P2SK, kewenangan pengaturan derivatif keuangan di Indonesia dibagi antara tiga regulator. Manakah pembagian yang TEPAT?', 6, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'OJK mengawasi derivatif dengan underlying komoditi; Bank Indonesia mengawasi derivatif dengan underlying efek', 1, FALSE),
(q, 'OJK mengawasi derivatif dengan underlying efek; Bank Indonesia mengawasi PUVA; Bappebti mengawasi derivatif dengan underlying komoditi', 2, TRUE),
(q, 'Bappebti tetap mengawasi semua derivatif; OJK hanya mengawasi pasar modal konvensional', 3, FALSE),
(q, 'Bank Indonesia mengawasi semua derivatif keuangan; OJK mengawasi pasar modal efek', 4, FALSE);

-- Q7
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam ekosistem perdagangan berjangka di Indonesia, terdapat dua Bursa Berjangka yang beroperasi. Pasangan yang TEPAT antara Bursa Berjangka dan Lembaga Kliring Berjangka yang menaunginya adalah...', 7, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'JFX — ICH; ICDX — KBI', 1, FALSE),
(q, 'JFX — KBI; ICDX — ICH', 2, TRUE),
(q, 'JFX — KPEI; ICDX — KSEI', 3, FALSE),
(q, 'JFX — KBI; ICDX — KPEI', 4, FALSE);

-- Q8
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'KBSA dalam konteks derivatif keuangan merupakan singkatan dari...', 8, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Kontrak Berjangka Sistem Alternatif', 1, FALSE),
(q, 'Kontrak Bursa Saham Acuan', 2, FALSE),
(q, 'Kontrak Berjangka Saham Acuan', 3, TRUE),
(q, 'Kliring Berjangka Saham Aktif', 4, FALSE);

-- Q9
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'PALN dalam konteks perdagangan derivatif merujuk pada...', 9, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Penyelenggara Alternatif Luar Negeri', 1, FALSE),
(q, 'Produk Asing Lintas Negara', 2, FALSE),
(q, 'Perdagangan Aset Luar Negeri', 3, FALSE),
(q, 'Aset yang mendasari yang berasal dari luar negeri', 4, TRUE);

-- Q10
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'SPA dalam ekosistem derivatif keuangan adalah singkatan dari...', 10, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Sarana Perdagangan Asing', 1, FALSE),
(q, 'Sistem Perdagangan Alternatif', 2, TRUE),
(q, 'Standar Perjanjian Amanat', 3, FALSE),
(q, 'Sertifikasi Pelaku Alternatif', 4, FALSE);

-- Q11
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Pialang Berjangka yang ingin menjadi Peserta SPA (Sistem Perdagangan Alternatif) wajib memiliki persyaratan perizinan berupa...', 11, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Izin Usaha Operasional dari OJK', 1, FALSE),
(q, 'Pendaftaran (STTD) di OJK', 2, FALSE),
(q, 'Persetujuan dari OJK', 3, TRUE),
(q, 'Pengakuan dari Bursa Berjangka', 4, FALSE);

-- Q12
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Berdasarkan data Persetujuan Prinsip yang telah diberikan OJK dalam proses transisi, jumlah total persetujuan prinsip yang telah diterbitkan adalah...', 12, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '95', 1, FALSE),
(q, '115', 2, TRUE),
(q, '125', 3, FALSE),
(q, '150', 4, FALSE);

-- Q13
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dari total Persetujuan Prinsip derivatif keuangan yang telah diterbitkan, kelompok pelaku usaha dengan jumlah terbanyak adalah...', 13, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pedagang Berjangka (23)', 1, FALSE),
(q, 'Bank Penyimpan (15)', 2, FALSE),
(q, 'Pialang Berjangka (65)', 3, TRUE),
(q, 'SRO (4)', 4, FALSE);

-- Q14
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam konsep pengaturan perizinan derivatif keuangan, Pedagang Berjangka wajib memiliki...', 14, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Persetujuan dari OJK', 1, FALSE),
(q, 'Izin Usaha Operasional dari OJK', 2, TRUE),
(q, 'Pendaftaran (STTD) di OJK', 3, FALSE),
(q, 'Pengakuan dari Bursa Berjangka', 4, FALSE);

-- Q15
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Perusahaan Efek berizin OJK sebagai Perantara Pedagang Efek yang ingin berpartisipasi sebagai Peserta SPA wajib memenuhi persyaratan modal minimum berupa...', 15, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Minimal PEKU 1', 1, FALSE),
(q, 'Minimal PEKU 2', 2, TRUE),
(q, 'Minimal PEKU 3', 3, FALSE),
(q, 'Tidak ada persyaratan modal khusus', 4, FALSE);

-- Q16
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam infrastruktur pasar derivatif efek, Perantara Pedagang Efek (PEKU 3) yang ingin menjadi Penyelenggara SPA memerlukan...', 16, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Izin Usaha Operasional', 1, FALSE),
(q, 'Pendaftaran (STTD)', 2, FALSE),
(q, 'Persetujuan', 3, TRUE),
(q, 'Pengakuan', 4, FALSE);

-- Q17
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Profesi Penunjang Derivatif Efek seperti KAP/Akuntan Publik, Konsultan Hukum, dan Notaris yang terlibat dalam ekosistem derivatif keuangan wajib...', 17, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Memperoleh Izin Usaha Operasional dari OJK', 1, FALSE),
(q, 'Memperoleh Persetujuan dari OJK', 2, FALSE),
(q, 'Terdaftar di OJK (STTD)', 3, TRUE),
(q, 'Memperoleh Pengakuan dari Bursa Berjangka', 4, FALSE);

-- Q18
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Asosiasi Pialang Berjangka Indonesia (Aspebtindo) dalam konsep pengaturan perizinan derivatif keuangan memperoleh status berupa...', 18, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Izin Usaha Operasional', 1, FALSE),
(q, 'Persetujuan', 2, FALSE),
(q, 'Pendaftaran (STTD)', 3, FALSE),
(q, 'Pengakuan', 4, TRUE);

-- Q19
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Penasihat Investasi yang sudah berizin OJK dan ingin berkegiatan di bidang derivatif keuangan memerlukan...', 19, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Izin Usaha Operasional baru', 1, FALSE),
(q, 'Persetujuan Kegiatan Lain dari OJK', 2, TRUE),
(q, 'Pendaftaran (STTD) tambahan', 3, FALSE),
(q, 'Pengakuan dari Bursa Berjangka', 4, FALSE);

-- Q20
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam proses persetujuan Trading Rules derivatif keuangan, urutan langkah yang BENAR setelah Pelaku Usaha mengirimkan dokumen ke Bursa Berjangka adalah...', 20, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'OJK langsung menganalisis → Bursa memberikan rekomendasi → OJK menerbitkan persetujuan', 1, FALSE),
(q, 'Bursa verifikasi dan memberikan surat rekomendasi → Bursa menyampaikan ke OJK → OJK analisis → OJK menerbitkan persetujuan/penolakan', 2, TRUE),
(q, 'Bursa menyampaikan langsung ke OJK → OJK analisis → Pelaku Usaha merevisi dokumen → OJK menerbitkan persetujuan', 3, FALSE),
(q, 'OJK meminta dokumen dari Pelaku Usaha → Bursa verifikasi → OJK menerbitkan persetujuan', 4, FALSE);

-- Q21
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Salah satu common problem yang sering ditemui dalam proses persetujuan Trading Rules adalah tidak terdapatnya...', 21, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Laporan keuangan Pelaku Usaha yang diaudit', 1, FALSE),
(q, 'Kertas kerja penelaahan atas rekomendasi yang disampaikan Bursa Berjangka', 2, TRUE),
(q, 'Sertifikat kompetensi dari pengurus Pelaku Usaha', 3, FALSE),
(q, 'Persetujuan dari Bappebti sebelum diajukan ke OJK', 4, FALSE);

-- Q22
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Berdasarkan Pasal 75 UUPM beserta penjelasannya, pernyataan yang BENAR mengenai peran OJK terhadap efek yang ditawarkan adalah...', 22, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'OJK memberikan penilaian atas keunggulan efek dan merekomendasikan efek yang layak dibeli', 1, FALSE),
(q, 'OJK tidak memberikan penilaian atas keunggulan dan kelemahan suatu efek; keputusan investasi sepenuhnya ada pada pemodal', 2, TRUE),
(q, 'OJK bertanggung jawab atas kerugian pemodal apabila informasi dalam prospektus tidak akurat', 3, FALSE),
(q, 'OJK wajib memperingatkan publik apabila suatu efek dinilai berisiko tinggi', 4, FALSE);

-- Q23
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam pengajuan Trading Rules (TR) Pialang kepada Bursa Berjangka, salah satu common problem yang sering terjadi adalah...', 23, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Bursa tidak menyertakan kertas kerja penelaahan versi terbaru', 1, FALSE),
(q, 'Bursa tidak melampirkan TR Pedagang saat mengajukan TR Pialang', 2, TRUE),
(q, 'OJK tidak memberikan umpan balik atas kekurangan dokumen', 3, FALSE),
(q, 'Pialang tidak memiliki segregated account', 4, FALSE);

-- Q24
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam proses pengajuan persetujuan produk PALN (Perdagangan Aset Luar Negeri), Pialang Berjangka bersama Bursa Berjangka dalam negeri wajib menyusun kajian yang paling sedikit memuat...', 24, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Laporan audit keuangan Bursa Berjangka luar negeri dan prospektus produk', 1, FALSE),
(q, 'Latar belakang penetapan, spesifikasi kontrak, dan database transaksi minimal 1 tahun terakhir', 2, TRUE),
(q, 'Perjanjian bilateral antara OJK dan otoritas Bursa Berjangka luar negeri', 3, FALSE),
(q, 'Persetujuan dari Bappebti dan rekomendasi dari asosiasi pialang', 4, FALSE);

-- Q25
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam mempertimbangkan penetapan daftar Bursa Berjangka luar negeri untuk PALN, Bappebti mempertimbangkan faktor-faktor berikut, KECUALI...', 25, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Peraturan dan tata tertib Bursa Berjangka luar negeri yang memberi perlindungan sama kepada nasabah domestik dan asing', 1, FALSE),
(q, 'Persyaratan dan likuiditas kontrak yang diperdagangkan di Bursa tersebut', 2, FALSE),
(q, 'Manfaat kontrak bagi perekonomian Indonesia', 3, FALSE),
(q, 'Reputasi dan peringkat kredit Bursa Berjangka luar negeri yang bersangkutan', 4, TRUE);

-- Q26
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Pernyataan yang BENAR mengenai penggunaan sistem SPRINT dalam proses perizinan derivatif keuangan adalah...', 26, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'SPRINT saat ini aktif digunakan untuk semua jenis perizinan derivatif keuangan', 1, FALSE),
(q, 'SPRINT digunakan pada tahun 2025 untuk penerbitan Persetujuan Prinsip; saat ini tidak lagi digunakan karena proses PP telah selesai', 2, TRUE),
(q, 'SPRINT hanya digunakan untuk perizinan Bursa Berjangka, bukan untuk pialang atau pedagang', 3, FALSE),
(q, 'SPRINT akan digantikan oleh sistem baru yang sudah siap beroperasi sejak awal 2026', 4, FALSE);

-- Q27
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Berikut adalah urutan kronologis milestone pendirian Bursa Karbon Indonesia yang TEPAT...', 27, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK 14 → MoU OJK-KLHK → SEOJK 12 → UU PPSK → Peluncuran Bursa Karbon', 1, FALSE),
(q, 'UU PPSK → MoU OJK-KLHK → POJK 14 → SEOJK 12 → PKS OJK-KLHK → Izin IDXCarbon → Peluncuran', 2, TRUE),
(q, 'UU PPSK → POJK 14 → MoU OJK-KLHK → Peluncuran → Izin IDXCarbon', 3, FALSE),
(q, 'MoU OJK-KLHK → UU PPSK → POJK 14 → SEOJK 12 → Peluncuran Bursa Karbon', 4, FALSE);

-- Q28
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Bursa Karbon Indonesia (IDXCarbon) secara resmi diluncurkan pada tanggal...', 28, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '18 September 2023', 1, FALSE),
(q, '6 September 2023', 2, FALSE),
(q, '2 Agustus 2023', 3, FALSE),
(q, '26 September 2023', 4, TRUE);

-- Q29
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dasar hukum utama yang mewajibkan perdagangan karbon melalui bursa karbon untuk memperoleh izin dari OJK adalah...', 29, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pasal 4 POJK 14/2023', 1, FALSE),
(q, 'Pasal 25 UU Nomor 4 Tahun 2023 (UU P2SK)', 2, TRUE),
(q, 'SEOJK 12/SEOJK.04/2023', 3, FALSE),
(q, 'Pasal 17 POJK 14/2023', 4, FALSE);

-- Q30
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Berdasarkan POJK 14/2023, pihak yang dapat menyelenggarakan kegiatan usaha sebagai Bursa Karbon adalah...', 30, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Perseroan terbatas yang memenuhi syarat modal minimum Rp50 miliar', 1, FALSE),
(q, 'Badan usaha milik negara yang bergerak di bidang lingkungan hidup', 2, FALSE),
(q, 'Penyelenggara pasar yang telah memiliki izin usaha sebagai Penyelenggara Bursa Karbon', 3, TRUE),
(q, 'Bursa Efek yang telah mendapatkan persetujuan dari Kementerian LHK', 4, FALSE);

-- Q31
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Modal disetor minimum yang wajib dimiliki Penyelenggara Bursa Karbon adalah...', 31, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Rp50 miliar', 1, FALSE),
(q, 'Rp75 miliar', 2, FALSE),
(q, 'Rp100 miliar', 3, TRUE),
(q, 'Rp150 miliar', 4, FALSE);

-- Q32
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Badan Hukum Asing yang ingin menjadi pemegang saham Penyelenggara Bursa Karbon dibatasi kepemilikannya maksimal sebesar...', 32, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '10% dari seluruh saham dengan hak suara', 1, FALSE),
(q, '20% dari seluruh saham dengan hak suara', 2, TRUE),
(q, '30% dari seluruh saham dengan hak suara', 3, FALSE),
(q, '49% dari seluruh saham dengan hak suara', 4, FALSE);

-- Q33
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Persyaratan Domisili Penyelenggara Bursa Karbon mewajibkan bahwa...', 33, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Penyelenggara dapat berbentuk badan hukum asing yang beroperasi di Indonesia', 1, FALSE),
(q, 'Penyelenggara merupakan perseroan terbatas yang berkedudukan hukum di wilayah Indonesia', 2, TRUE),
(q, 'Penyelenggara merupakan lembaga pemerintah yang ditunjuk oleh OJK', 3, FALSE),
(q, 'Penyelenggara dapat berbentuk koperasi yang berdomisili di Indonesia', 4, FALSE);

-- Q34
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Salah satu syarat khusus bagi Direktur Bursa Karbon (selain Direktur Utama) adalah wajib memiliki...', 34, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pengalaman minimal 10 tahun di bidang pasar modal', 1, FALSE),
(q, 'Pengetahuan atau pengalaman di bidang pengendalian perubahan iklim dan pasar karbon', 2, TRUE),
(q, 'Kewarganegaraan Indonesia dan tidak pernah terlibat tindak pidana', 3, FALSE),
(q, 'Gelar akademik minimal S2 di bidang keuangan atau lingkungan hidup', 4, FALSE);

-- Q35
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Jumlah minimum Direksi dan Komisaris Penyelenggara Bursa Karbon adalah...', 35, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Direksi minimal 1 orang; Komisaris minimal 1 orang', 1, FALSE),
(q, 'Direksi minimal 2 orang; Komisaris minimal 1 orang', 2, FALSE),
(q, 'Direksi minimal 2 orang; Komisaris minimal 2 orang (1 Komut)', 3, TRUE),
(q, 'Direksi minimal 3 orang; Komisaris minimal 2 orang', 4, FALSE);

-- Q36
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Direksi Penyelenggara Bursa Karbon wajib memenuhi semua persyaratan berikut, KECUALI...', 36, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Lulus Fit and Proper Test', 1, FALSE),
(q, 'Mendapat persetujuan dari OJK', 2, FALSE),
(q, 'Berdomisili di Indonesia', 3, FALSE),
(q, 'Memiliki kewarganegaraan Indonesia', 4, TRUE);

-- Q37
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Pemegang saham Penyelenggara Bursa Karbon yang merupakan badan hukum asing wajib memenuhi kondisi bahwa badan hukum asing tersebut...', 37, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Berkedudukan di negara anggota G20', 1, FALSE),
(q, 'Telah memperoleh izin atau di bawah pengawasan regulator jasa keuangan di negara asalnya', 2, TRUE),
(q, 'Memiliki total aset minimal setara Rp1 triliun', 3, FALSE),
(q, 'Telah beroperasi minimal 10 tahun di bidang pasar karbon internasional', 4, FALSE);

-- Q38
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Tahapan proses izin usaha Penyelenggara Bursa Karbon setelah penelaahan dokumen adalah...', 38, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Langsung penerbitan Surat Keputusan OJK', 1, FALSE),
(q, 'Presentasi Visi dan Misi Pemegang Saham', 2, TRUE),
(q, 'Peninjauan Langsung ke kantor pemohon', 3, FALSE),
(q, 'Uji Kelayakan Kemampuan dan Kepatutan Pengurus', 4, FALSE);

-- Q39
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Uji Kelayakan Kemampuan dan Kepatutan Pengurus dalam proses izin usaha Bursa Karbon meliputi tiga tahap, yaitu...', 39, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Wawancara, simulasi perdagangan, dan kunjungan lapangan', 1, FALSE),
(q, 'Penelitian administratif, presentasi calon, dan wawancara', 2, TRUE),
(q, 'Verifikasi dokumen, uji teknis, dan presentasi bisnis plan', 3, FALSE),
(q, 'Pemeriksaan LHKPN, uji kompetensi, dan fit and proper test lisan', 4, FALSE);

-- Q40
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'SLA (Service Level Agreement) pemberian izin usaha Penyelenggara Bursa Karbon sejak permohonan diterima secara lengkap dan benar adalah...', 40, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '14 hari kerja', 1, FALSE),
(q, '20 hari kerja', 2, FALSE),
(q, '30 hari kerja', 3, TRUE),
(q, '45 hari kerja', 4, FALSE);

-- Q41
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam kerangka sinergi pengembangan regulasi derivatif keuangan, OJK berkolaborasi dengan Bank Indonesia khususnya untuk...', 41, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pengawasan Bursa Berjangka dan Lembaga Kliring', 1, FALSE),
(q, 'Penyusunan Kode Etik Derivatif PUVA dan Efek, pembahasan SKKNI, dan RPOJK', 2, TRUE),
(q, 'Penetapan daftar Bursa Berjangka luar negeri yang diakui', 3, FALSE),
(q, 'Penerbitan Persetujuan Prinsip untuk Pialang Berjangka', 4, FALSE);

-- Q42
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Kapasitas Capacity Building OJK di bidang derivatif keuangan dilakukan melalui kegiatan, antara lain...', 42, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Seminar nasional dan penerbitan buku panduan derivatif', 1, FALSE),
(q, 'Onsite visit ke Pialang/Pedagang Berjangka dan Knowledge Sharing ICDX Academy', 2, TRUE),
(q, 'Pelatihan internal OJK bekerja sama dengan universitas terkemuka', 3, FALSE),
(q, 'Kunjungan ke Bursa Berjangka luar negeri untuk benchmarking', 4, FALSE);

END $$;
