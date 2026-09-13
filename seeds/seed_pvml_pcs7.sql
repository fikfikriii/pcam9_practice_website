-- seed_pvml_pcs7.sql
-- Source: Bank Soal PVML.pdf (Pegawai OJK / PCS 7 exam bank)
-- Sections: Modal Ventura, Lembaga Pembiayaan, Lembaga Keuangan Mikro, Lembaga Keuangan Lain
-- Category: pvml | Source: pcs7 | Module: 1
-- ~83 questions extracted from 100 total; skipped: Q21 (missing), Q30,Q34,Q39,Q43,Q45(dup),Q48,Q53,Q62,Q67,Q72,Q77,Q82,Q87,Q92,Q97 (partially visible)

DO $$
DECLARE
  mod_id  INTEGER;
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN

  SELECT id INTO mod_id FROM modules WHERE number = 1;

  -- Ensure category exists
  INSERT INTO section_categories (id, label)
  VALUES ('pvml', 'PVML')
  ON CONFLICT (id) DO NOTHING;

  -- ===========================================================================
  -- SECTION: Modal Ventura  (Q1, Q3, Q9)
  -- ===========================================================================
  SELECT id INTO sec_id FROM sections WHERE title = 'Modal Ventura';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session, module_id, category_id)
    VALUES ('Modal Ventura', sec_pos, 3, mod_id, 'pvml')
    RETURNING id INTO sec_id;
  END IF;

  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- Q1
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Yang Merupakan Pilar pertama dalam Road Map Perusahaan Modal Ventura', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perlindungan Konsumen', FALSE),
    (q_id, 'Pengembangan produk', FALSE),
    (q_id, 'Pengembangan Elemen Ekosistem', FALSE),
    (q_id, 'Tata Kelola Dan Kelembagaan', TRUE);

  -- Q3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apa Singkatan VDC pada Perusahaan Modal Ventura', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Venture Donation Corporation', FALSE),
    (q_id, 'Venture Debt Capital', FALSE),
    (q_id, 'Venture Debt Corporation', TRUE),
    (q_id, 'Venture Debt Donation', FALSE);

  -- Q9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Yang bukan merupakan tantangan dalam penyusunan Road Map Perusahaan Modal Ventura', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penurunan Jumlah PMV', FALSE),
    (q_id, 'Ekosistem', FALSE),
    (q_id, 'Buy Now Pay Later', TRUE),
    (q_id, 'Keterbatasan Sumber Pendanaan PMV', FALSE);

  -- Q24
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apa Singkatan VCC pada Perusahaan Modal Ventura', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Venture Corporation Capital', FALSE),
    (q_id, 'Venture Capacity Corporation', FALSE),
    (q_id, 'Venture Capital Capacity', FALSE),
    (q_id, 'Venture Capital Corporation', TRUE);

  -- Q47
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Fokus kegiatan usaha Perusahaan Modal Ventura (PMV) yang berbentuk Venture Capital Corporation (VCC) dan Venture Debt Corporation (VDC) diatur pada Peraturan OJK',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'POJK Nomor 34/2015', FALSE),
    (q_id, 'POJK Nomor 25/2023', TRUE),
    (q_id, 'POJK Nomor 25/2024', FALSE),
    (q_id, 'POJK Nomor 25/2022', FALSE);

  -- Q61
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'PMV dan PMVS berbentuk VCC wajib membubarkan dana ventura dalam kondisi, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'dana ventura tidak memperoleh penyertaan dari pemegang unit sesuai dengan target dan jangka waktu yang ditetapkan dalam perjanjian', FALSE),
    (q_id, 'PMV/PMVS dan bank kustodian telah sepakat membubarkan dana ventura dengan memperoleh persetujuan dari seluruh pemegang unit penyertaan dana ventura', FALSE),
    (q_id, 'berdasarkan perintah dewan komisaris', TRUE),
    (q_id, 'berdasarkan perintah OJK', FALSE);

  -- ===========================================================================
  -- SECTION: Lembaga Pembiayaan  (Q2, Q4, Q18)
  -- ===========================================================================
  SELECT id INTO sec_id FROM sections WHERE title = 'Lembaga Pembiayaan';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session, module_id, category_id)
    VALUES ('Lembaga Pembiayaan', sec_pos, 3, mod_id, 'pvml')
    RETURNING id INTO sec_id;
  END IF;

  pos := 0;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- Q2
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Undang-Undang pembentukan Lembaga Pembiayaan Ekspor Indonesia, adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'UU Nomor 22 tahun 2019', FALSE),
    (q_id, 'UU Nomor 2 tahun 2009', TRUE),
    (q_id, 'UU Nomor 2 tahun 2019', FALSE),
    (q_id, 'UU Nomor 22 tahun 2009', FALSE);

  -- Q4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Periode Road Map Perusahaan Pembiayaan', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '2023 – 2028', FALSE),
    (q_id, '2024 – 2028', TRUE),
    (q_id, '2024 – 2027', FALSE),
    (q_id, '2023 – 2027', FALSE);

  -- Q18
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut adalah merupakan rencana kerja Strategi Pengembangan Elemen Ekosistem Dalam Road Map Perusahaan Pembiayaan, kecuali',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Peningkatan Pengguna Platform Asset Registry', FALSE),
    (q_id, 'Penguatan Sinergi dengan LJK Lainnya, Sektor Ekonomi Prioritas, UMKM, Industri Halal, Sistem Pemeringkatan Kredit, dan Industri Ramah Lingkungan termasuk Program Penjaminan Pembiayaan', FALSE),
    (q_id, 'Penertiban Iklan Menyesatkan', TRUE),
    (q_id, 'Penguatan Peran Asosiasi untuk Mendukung Kegiatan Usaha Berbasis Disiplin Pasar', FALSE);

  -- Q51
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'POJK yang mengatur mengenai exit policy pada industri Perusahaan Pembiayaan adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Nomor 35/POJK.05/2018', FALSE),
    (q_id, 'Nomor 9/POJK.05/2020', FALSE),
    (q_id, 'Nomor 9/POJK.05/2021', TRUE),
    (q_id, 'Nomor 35/POJK.05/2021', FALSE);

  -- Q52
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Perusahaan Pembiayaan Infrastruktur dapat melakukan penyertaan langsung paling tinggi... % dari jumlah ekuitas Perusahaan Pembiayaan Infrastruktur yang bersangkutan', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '50', FALSE),
    (q_id, '75', TRUE),
    (q_id, '25', FALSE),
    (q_id, '90', FALSE);

  -- Q54
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Jenis akad pembiayaan investasi dalam penyaluran pembiayaan syariah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Musyarakah', FALSE),
    (q_id, 'Ijarah', TRUE),
    (q_id, 'Murabahah', FALSE),
    (q_id, 'Salam', FALSE);

  -- Q58
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Laporan bulanan Perusahaan Pembiayaan disampaikan melalui', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'SILARAS', TRUE),
    (q_id, 'Hardcopy', FALSE),
    (q_id, 'Email', FALSE),
    (q_id, 'Ereporting', FALSE);

  -- Q59
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Akad pembiayaan yang paling umum untuk kegiatan usaha penyertaan modal dan pembelian obligasi/konversi sukuk adalah sebagai berikut, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Murabahah', TRUE),
    (q_id, 'Musyarakah Musahammah', FALSE),
    (q_id, 'Syirkah musahamah', FALSE),
    (q_id, 'Mudharabah muqayyadah', FALSE);

  -- Q60
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dasar Hukum Penyampaian Laporan Tahunan Untuk Perusahaan Pembiayaan Syariah adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Peraturan OJK 46/POJK.05/2020', FALSE),
    (q_id, 'Peraturan OJK 35/POJK.05/2018', FALSE),
    (q_id, 'Peraturan OJK 24/POJK.05/2019', FALSE),
    (q_id, 'Peraturan OJK 10/POJK.05/2019', TRUE);

  -- Q63
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Laporan berikut yang wajib disampaikan oleh Unit Usaha Syariah Lembaga Pembiayaan adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Laporan Keuangan Tahunan yang telah di Audit', TRUE),
    (q_id, 'Pelaporan Data Debitur melalui SLIK', FALSE),
    (q_id, 'Laporan Penunjukan Akuntan Publik', FALSE),
    (q_id, 'Laporan Tata Kelola Perusahaan', FALSE);

  -- Q64
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Perusahaan Pembiayaan Infrastruktur dalam menjalankan kegiatan usaha syariah dapat memberikan pinjaman langsung kepada nasabah dengan menggunakan akad-akad berikut, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Murabahah', FALSE),
    (q_id, 'Rahn', TRUE),
    (q_id, 'Musyarakah Mutanaqishah', FALSE),
    (q_id, 'Ijarah Muntahiyah Bittamlik', FALSE);

  -- Q69
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Mekanisme pencabutan izin usaha perusahaan pembiayaan salah satunya adalah melalui pemberian sanksi administratif secara bertahap yaitu sebagai berikut, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Peringatan tertulis', FALSE),
    (q_id, 'Pembekuan kegiatan usaha', FALSE),
    (q_id, 'Penurunan hasil penilaian TKS', TRUE),
    (q_id, 'Pencabutan izin usaha', FALSE);

  -- Q71
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Fungsi Laporan Manajemen PPI bagi pengawas adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Sumber data analisis pengaduan', FALSE),
    (q_id, 'Sumber data analisis kepengurusan dan manajemen risiko', TRUE),
    (q_id, 'Sumber data analisis Tingkat Kesehatan', FALSE),
    (q_id, 'Sumber data analisis keuangan', FALSE);

  -- Q74
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Jangka waktu status pengawasan khusus pada perusahaan pembiayaan adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Paling lama 6 bulan dan dapat diperpanjang sesuai dengan rencana tindak yang telah disetujui', TRUE),
    (q_id, 'Paling lama 6 bulan dan dapat diperpanjang paling banyak 1 kali dengan jangka waktu 1 tahun', FALSE),
    (q_id, 'Paling lama 1 tahun dan dapat diperpanjang paling banyak 1 kali dengan jangka waktu 1 tahun', FALSE),
    (q_id, 'Paling lama 1 Tahun dan dapat diperpanjang sesuai dengan rencana tindak yang telah disetujui', FALSE);

  -- ===========================================================================
  -- SECTION: Lembaga Keuangan Mikro  (Q20)
  -- ===========================================================================
  SELECT id INTO sec_id FROM sections WHERE title = 'Lembaga Keuangan Mikro';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session, module_id, category_id)
    VALUES ('Lembaga Keuangan Mikro', sec_pos, 1, mod_id, 'pvml')
    RETURNING id INTO sec_id;
  END IF;

  pos := 0;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- Q20
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Peraturan dan Dasar Hukum Lembaga Keuangan Mikro, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'POJK No. 14 tahun 2014', FALSE),
    (q_id, 'POJK No. 12 tahun 2014', FALSE),
    (q_id, 'POJK No. 77 tahun 2016', TRUE),
    (q_id, 'UU 1 tahun 2013', FALSE);

  -- Q56
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Bentuk badan hukum LKM syariah yang diperkenankan secara ketentuan adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Firma', FALSE),
    (q_id, 'Commanditaire Vennootschap (CV)', FALSE),
    (q_id, 'Koperasi', TRUE),
    (q_id, 'Yayasan', FALSE);

  -- Q79
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Rasio likuiditas LKM dinyatakan bermasalah jika penurunan rasio lebih dari', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '25%', FALSE),
    (q_id, '20%', TRUE),
    (q_id, '10%', FALSE),
    (q_id, '15%', FALSE);

  -- Q86
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apa yang dimaksud dengan "penggelapan dana" dalam konteks fraud di LKM', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penggunaan dana untuk pengembangan usaha', FALSE),
    (q_id, 'Penggunaan dana yang dikumpulkan dari anggota untuk kepentingan pribadi pengurus', TRUE),
    (q_id, 'Penggunaan dana untuk membayar bunga pinjaman', FALSE),
    (q_id, 'Penggunaan dana untuk investasi yang sah', FALSE);

  -- Q94
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apa tujuan utama dari pembinaan dan pengawasan LKM oleh OJK', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menyediakan pinjaman besar', FALSE),
    (q_id, 'Mengembangkan teknologi keuangan', FALSE),
    (q_id, 'Menjamin kepatuhan LKM terhadap peraturan dan menjaga stabilitas keuangan', TRUE),
    (q_id, 'Meningkatkan keuntungan LKM', FALSE);

  -- Q96
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apa saja kegiatan usaha yang dapat dilakukan oleh LKM', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menjalankan perusahaan leasing', FALSE),
    (q_id, 'Menyediakan layanan investasi saham', FALSE),
    (q_id, 'Menyediakan pinjaman skala besar', FALSE),
    (q_id, 'Menyediakan jasa konsultasi pengembangan usaha', TRUE);

  -- Q98
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'LKM yang berbasis deposit wajib memperoleh izin dari', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'OJK', TRUE),
    (q_id, 'Lembaga Penjamin Simpanan', FALSE),
    (q_id, 'Kementerian Keuangan', FALSE),
    (q_id, 'Pemerintah Daerah', FALSE);

  -- ===========================================================================
  -- SECTION: Lembaga Keuangan Lain  (Q5–Q8, Q10–Q17, Q19)
  -- ===========================================================================
  SELECT id INTO sec_id FROM sections WHERE title = 'Lembaga Keuangan Lain';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session, module_id, category_id)
    VALUES ('Lembaga Keuangan Lain', sec_pos, 13, mod_id, 'pvml')
    RETURNING id INTO sec_id;
  END IF;

  pos := 0;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- Q5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Jangka waktu permintaan tanggapan dan rapat dengan pendapat untuk Surat Edaran Otoritas Jasa Keuangan, adalah',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '10 HK – 40 HK', FALSE),
    (q_id, '10 HK – 50 HK', FALSE),
    (q_id, '10 HK – 30 HK', FALSE),
    (q_id, '10 HK – 60 HK', TRUE);

  -- Q6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut adalah merupakan Strategi dalam Road Map LPBBTI, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Akselerasi Tranformasi Digital', TRUE),
    (q_id, 'Penguatan Perlindungan Konsumen', FALSE),
    (q_id, 'Penguatan Permodalan, Tata Kelola, Manajemen Risiko, dan SDM', FALSE),
    (q_id, 'Pengembangan Elemen Ekosistem', FALSE);

  -- Q7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Periode Road Map LPBBTI', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '2024 – 2028', FALSE),
    (q_id, '2023 – 2027', FALSE),
    (q_id, '2023 – 2028', TRUE),
    (q_id, '2024 – 2027', FALSE);

  -- Q8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pilar Road Map Penguatan dan Pengembangan LPBBTI terdiri dari 4 Pilar sebagai Berikut',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pengembangan Elemen Ekosistem, Tata Kelola Dan Kelembagaan, Perlindungan Konsumen, dan Pengembangan produk', FALSE),
    (q_id, 'Tata Kelola Dan Kelembagaan, Perlindungan Konsumen, Pengembangan Elemen Ekosistem dan Pengembangan produk', FALSE),
    (q_id, 'Tata Kelola Dan Kelembagaan, Perlindungan Konsumen, Pengembangan Elemen Ekosistem dan Penguatan Pengawasan', FALSE),
    (q_id, 'Perlindungan Konsumen, Tata Kelola Dan Kelembagaan, Pengembangan Elemen Ekosistem dan Pengaturan, Pengawasan dan Perizinan', TRUE);

  -- Q10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam penyusunan RPDK berapa lama waktu yang diberikan untuk melakukan penyesuaian RPDK dengan hasil board seminar',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '15 HK', FALSE),
    (q_id, '10 HK', TRUE),
    (q_id, '5 HK', FALSE),
    (q_id, '20 HK', FALSE);

  -- Q11
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Bentuk badan hukum BP. Tapera adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'commanditaire vennootschap (CV)', FALSE),
    (q_id, 'Koperasi', FALSE),
    (q_id, 'Perseroan Terbatas', FALSE),
    (q_id, 'Tapera', TRUE);

  -- Q12
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Target pangsa pembiayaan sektor produktif dan UMKM dalam Roadmap LPBBTI pada akhir tahun 2028',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Secara agregat 60-70%', FALSE),
    (q_id, 'Secara agregat 59-61%', TRUE),
    (q_id, 'Secara agregat 50-70%', FALSE),
    (q_id, 'Secara agregat 49-51%', FALSE);

  -- Q13
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Waktu penyelarasan dalam penyusunan SEOJK kondisi mendesak adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '10 HK', TRUE),
    (q_id, '5 HK', FALSE),
    (q_id, '20 HK', FALSE),
    (q_id, '15 HK', FALSE);

  -- Q14
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Waktu penyelarasan dalam penyusunan RPOJK kondisi mendesak adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '15 HK', FALSE),
    (q_id, '20 HK', FALSE),
    (q_id, '10 HK', TRUE),
    (q_id, '5 HK', FALSE);

  -- Q15
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut adalah merupakan rencana kerja Strategi Penguatan Perlindungan Konsumen Dalam Road Map LPBBTI, kecuali',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pemberantasan dan Penegakan Sanksi Pidana terhadap LPBBTI Ilegal', FALSE),
    (q_id, 'Penertiban Iklan Menyesatkan', FALSE),
    (q_id, 'Pengembangan Credit Scoring', TRUE),
    (q_id, 'Penataan Mekanisme Penagihan (Debt Collector)', FALSE);

  -- Q16
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Yang termasuk Jenis Peraturan yang dikeluarkan oleh OJK adalah, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Surat Keputusan OJK (KEP. OJK)', TRUE),
    (q_id, 'Peraturan Dewan Komisioner (PDK)', FALSE),
    (q_id, 'Surat Edaran OJK (SEOJK)', FALSE),
    (q_id, 'Peraturan OJK (POJK)', FALSE);

  -- Q17
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam penyusunan RPOJK tahapan yang dilakukan sebelum dimintakan penyelarasan ke DHUK, kecuali',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rapat dengan pendapat', FALSE),
    (q_id, 'Permintaan tanggapan ke stakeholders', FALSE),
    (q_id, 'RDK', TRUE),
    (q_id, 'Penyusunan RPOJK', FALSE);

  -- Q19
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Bentuk Badan Hukum Layanan Pendanaan Bersama Berbasis Teknologi Informasi adalah',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Firma', FALSE),
    (q_id, 'commanditaire vennootschap (CV)', FALSE),
    (q_id, 'Perseroan Terbatas', TRUE),
    (q_id, 'LPBBTI', FALSE);

  -- Q22
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Tahapan yang dilakukan setelah dilakukan penyelarasan oleh DHUK dalam penyusunan RPOJK adalah',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Permintaan Tanggapan', FALSE),
    (q_id, 'Board Seminar', FALSE),
    (q_id, 'Penetapan', FALSE),
    (q_id, 'RDK', TRUE);

  -- Q23
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dasar hukum pembentukan peraturan di Otoritas Jasa Keuangan diatur dalam', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'POJK Nomor 1/POJK.02/2022', FALSE),
    (q_id, 'PDK Nomor 1/PDK.02/2022', TRUE),
    (q_id, 'SEOJK Nomor 1/SEOJK.02/2022', FALSE),
    (q_id, 'SEDK Nomor 1/SEDK.02/2022', FALSE);

  -- Q25
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam proses pengundangan Peraturan Otoritas Jasa Keuangan (POJK) dicatatkan dalam',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Lembar Negara', TRUE),
    (q_id, 'Berita Negara', FALSE),
    (q_id, 'Semua Salah', FALSE),
    (q_id, 'Surat Negara', FALSE);

  -- Q26
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut yang bukan merupakan Perusahaan di bawah lingkup pemeriksaan khusus PVML', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perusahaan Asuransi', TRUE),
    (q_id, 'Perusahaan Pembiayaan', FALSE),
    (q_id, 'Perusahaan Modal Ventura', FALSE),
    (q_id, 'Perusahaan Penjaminan', FALSE);

  -- Q27
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Batas kepemilikan asing untuk Penyelenggara Layanan Pendanaan Bersama Berbasis Teknologi Informasi yaitu sebesar',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '80%', FALSE),
    (q_id, '20%', FALSE),
    (q_id, '85%', TRUE),
    (q_id, '25%', FALSE);

  -- Q28
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'POJK yang mengatur mengenai Usaha Pergadaian yaitu', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'POJK 31 Tahun 2016', TRUE),
    (q_id, 'POJK 10 Tahun 2021', FALSE),
    (q_id, 'POJK 47 Tahun 2020', FALSE),
    (q_id, 'POJK 34 Tahun 2015', FALSE);

  -- Q29
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Yang termasuk dalam dokumen utama yang diperlukan dalam forum panel adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Dokumen rencana pengawasan, Rencana bisnis, daftar sanksi', FALSE),
    (q_id, 'Laporan TKS, Tren data keuangan minimal 3 tahun, daftar sanksi', TRUE),
    (q_id, 'Laporan TKS, Daftar sanksi, Daftar rincian kantor cabang', FALSE),
    (q_id, 'Semua benar', FALSE);

  -- Q31
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Asas yang digunakan dalam Pemeriksaan Khusus PVML', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Asas Kepatuhan Hukum, Asas Kerahasiaan, asas integritas', FALSE),
    (q_id, 'Asas Proporsionalitas, Asas Kesaksamaan, Asas transparansi', FALSE),
    (q_id, 'Asas Praduga Tak Bersalah, Asas Legalitas, Asas Kepatuhan Hukum', FALSE),
    (q_id, 'Asas Akuntabilitas, asas transparansi, asas integritas', TRUE);

  -- Q32
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Salah satu faktor kompetensi bagi anggota Direksi, anggota Dewan Komisaris, anggota Dewan Pengawas Syariah, anggota Dewan Direktur, atau Direktur Pelaksana Perusahaan adalah pengetahuan dan kemampuan pengelolaan strategis, faktor dimaksud dapat dibuktikan dengan',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'pengetahuan mengenai struktur organisasi, manajemen, uraian tugas, dan tanggung jawab', FALSE),
    (q_id, 'Semua Benar', TRUE),
    (q_id, 'kemampuan potensial untuk melakukan analisis proses bisnis, memimpin organisasi, dan mengelola sumber daya manusia untuk mencapai tujuan organisasi', FALSE),
    (q_id, 'pengetahuan dasar pengawasan meliputi pengendalian internal, khusus bagi anggota Dewan Komisaris, anggota Dewan Pengawas Syariah, dan anggota Dewan Direktur', FALSE);

  -- Q33
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Menyusun rancangan rekomendasi di dalam Risalah Forum Panel merupakan tugas dari',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Panelis', FALSE),
    (q_id, 'Fungsi Pengendalian Kualitas Pengawasan', FALSE),
    (q_id, 'Pengawas', TRUE),
    (q_id, 'Semua benar', FALSE);

  -- Q35
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut adalah Kriteria penilaian faktor kompetensi bagi Direksi, anggota Dewan Komisaris, anggota Dewan Pengawas Syariah, anggota Dewan Direktur, atau Direktur Pelaksana, kecuali',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'pemahaman terhadap peraturan perundang-undangan', FALSE),
    (q_id, 'pengetahuan yang memadai dan relevan dengan jabatannya', FALSE),
    (q_id, 'tidak pernah dinyatakan pailit dan/atau tidak pernah menjadi pemegang saham, Pengendali Perusahaan Perasuransian yang bukan merupakan pemegang saham, anggota Direksi, pelaksana tugas pengurus, atau anggota Dewan Komisaris yang dinyatakan bersalah menyebabkan suatu perseroan dinyatakan pailit dalam waktu 5 (lima) tahun terakhir sebelum dicalonkan', TRUE),
    (q_id, 'kemampuan untuk melakukan pengelolaan strategis dalam rangka pengembangan usaha yang sehat', FALSE);

  -- Q36
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Fungsi Pengendalian Kualitas Pengawasan secara OJK wide berada pada', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Third line defense', TRUE),
    (q_id, 'Second line defense', FALSE),
    (q_id, 'First line defense', FALSE),
    (q_id, 'Fourth line defense', FALSE);

  -- Q37
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut adalah pihak-pihak yang diwajibkan mengikuti Penilaian Kemampuan dan Kepatutan Bagi Pihak Utama Lembaga Pembiayaan, Perusahaan Modal Ventura, dan Lembaga Jasa Keuangan Lainnya, kecuali',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Anggota Direksi, Tenaga Ahli, Anggota Dewan Pengawas Syariah', TRUE),
    (q_id, 'Anggota Dewan Pengawas Syariah, Anggota Dewan Komisaris, Anggota Direksi', FALSE),
    (q_id, 'Dewan Direktur, Direktur Pelaksana, Dewan Pengawas Syariah', FALSE),
    (q_id, 'Pemegang Saham Pengendali, Anggota Direksi, Anggota Dewan Komisaris', FALSE);

  -- Q38
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Sebutkan ketentuan permodalan modal disetor bagi Perusahaan Pergadaian di Indonesia', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rp500 juta untuk lingkup wilayah kabupaten/kota', TRUE),
    (q_id, 'Rp2,5 m untuk lingkup wilayah nasional', FALSE),
    (q_id, 'Rp2,5 m untuk lingkup wilayah kabupaten/kota', FALSE),
    (q_id, 'Rp500 juta untuk lingkup wilayah provinsi', FALSE);

  -- Q40
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Yang bukan merupakan Kriteria penilaian persyaratan integritas bagi Pihak Utama adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Memiliki akhlak dan moral yang baik, paling sedikit ditunjukkan dengan sikap mematuhi ketentuan yang berlaku, termasuk tidak pernah dihukum karena terbukti melakukan tindak pidana dalam jangka waktu tertentu sebelum dicalonkan', FALSE),
    (q_id, 'Memiliki komitmen untuk mematuhi peraturan perundang-undangan dan mendukung kebijakan OJK, antara lain dibuktikan dengan', FALSE),
    (q_id, 'Cakap melakukan perbuatan hukum', FALSE),
    (q_id, 'tidak memiliki kredit dan/atau pembiayaan macet', TRUE);

  -- Q41
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Yang dimaksud pihak utama PVL adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'pihak yang memiliki, mengelola, mengawasi, dan/atau mempunyai pengaruh yang signifikan pada perusahaan efek', FALSE),
    (q_id, 'Pejabat pada perusahaan asuransi, perusahaan asuransi syariah, perusahaan reasuransi, dan perusahaan reasuransi syariah yang ditunjuk dan bertanggung jawab untuk mengelola dampak keuangan dari risiko yang dihadapi perusahaan yang bekerja secara independen dan sesuai dengan standar praktik yang berlaku', FALSE),
    (q_id, 'Badan hukum, orang perseorangan, dan/atau kelompok usaha yang memiliki saham atau yang setara dengan saham PVL dan mempunyai kemampuan untuk melakukan pengendalian atas PVL', FALSE),
    (q_id, 'pihak yang memiliki, mengelola, mengawasi, dan/atau mempunyai pengaruh yang signifikan pada PVL', TRUE);

  -- Q42
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apakah yang dimaksud dengan fraud yang paling tepat', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tindakan memanfaatkan kelemahan atau celah dalam sistem untuk mendapatkan keuntungan pribadi atau merugikan orang lain', FALSE),
    (q_id, 'Tindakan Melanggar aturan, peraturan, atau hukum yang telah ditetapkan oleh otoritas yang berwenang', FALSE),
    (q_id, 'Tindakan atau praktik curang yang dilakukan seseorang atau entitas dengan maksud untuk memperoleh keuntungan secara tidak sah atau merugikan pihak lain', TRUE),
    (q_id, 'Tindakan menyembunyikan informasi penting, memberikan informasi yang salah, atau membuat klaim palsu untuk mencapai tujuan tertentu', FALSE);

  -- Q44
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Tata kelola perusahaan lemah & manajemen risiko perusahaan belum sesuai merupakan salah satu jenis root cause',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Profil risiko', FALSE),
    (q_id, 'Semua benar', FALSE),
    (q_id, 'GCG', TRUE),
    (q_id, 'Pendanaan', FALSE);

  -- Q46
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Saham perusahaan pergadaian dalam bentuk badan hukum Perseroan Terbatas dapat dimiliki oleh',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Semua benar', TRUE),
    (q_id, 'Pemerintah Daerah', FALSE),
    (q_id, 'Pemerintah Negara RI', FALSE),
    (q_id, 'Perorangan WNI', FALSE);

  -- Q49
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Tindak Pidana UJP terkait Gratifikasi dan Ketaatan termuat pada UU P2SK pasal', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '301', FALSE),
    (q_id, '300', TRUE),
    (q_id, '304', FALSE),
    (q_id, '302', FALSE);

  -- Q50
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Salah satu pihak utama yang wajib mengikuti penilaian kemampuan dan kepatutan adalah pemegang saham pengendali (PSP), adapun yang tergolong sebagai PSP PVL antara lain',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'orang perseorangan dan/atau badan hukum yang akan menjadi PSP pada Perusahaan Pembiayaan, Perusahaan Pembiayaan Infrastruktur, Perusahaan Modal Ventura, Perusahaan Pergadaian, Penyelenggara Layanan Pendanaan Bersama Berbasis Teknologi Informasi, dan PT Permodalan Nasional Madani hasil penggabungan (merger)', FALSE),
    (q_id, 'nonPSP yang melakukan penambahan setoran modal sehingga mengakibatkan yang bersangkutan akan menjadi PSP', FALSE),
    (q_id, 'Orang perseorangan dan/atau badan hukum yang akan melakukan pembelian, menerima hibah, menerima hak waris, atau bentuk lain pengalihan hak atas saham Perusahaan Pembiayaan, Perusahaan Pembiayaan Infrastruktur, Perusahaan Modal Ventura, Perusahaan Pergadaian, Penyelenggara Layanan Pendanaan Bersama Berbasis Teknologi Informasi, dan PT Permodalan Nasional Madani, sehingga mengakibatkan yang bersangkutan akan menjadi PSP', FALSE),
    (q_id, 'Semua Benar', TRUE);

  -- Q55
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Peraturan OJK terkait pengawasan PT Permodalan Nasional Madani adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'POJK Nomor 10/POJK.05/2019', FALSE),
    (q_id, 'POJK Nomor 19/POJK.05/2021', FALSE),
    (q_id, 'POJK nomor 16/POJK.05/2019', TRUE),
    (q_id, 'POJK nomor 31/POJK.05/2016', FALSE);

  -- Q57
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Melakukan transformasi aset yang tidak likuid menjadi likuid dengan cara pembelian Aset Keuangan dari Kreditur Asal dan penerbitan efek beragun aset merupakan kegiatan usaha PT SMF (Persero) sebagai berikut',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Financing', FALSE),
    (q_id, 'Penugasan Khusus dari Pemerintah', FALSE),
    (q_id, 'Sekuritisasi', TRUE),
    (q_id, 'Kegiatan bidang pembiayaan perumahan dan/atau permukiman sepanjang telah mendapat persetujuan pemegang saham', FALSE);

  -- Q65
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut adalah karakteristik LPEI, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Independen', FALSE),
    (q_id, 'Sovereign status', FALSE),
    (q_id, 'Tunduk kepada perundang-undangan pembiayaan', TRUE),
    (q_id, 'Merupakan lembaga khusus (sui generis)', FALSE);

  -- Q66
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Nasabah datang ke Perusahaan Pergadaian Syariah dengan membawa BPKB kendaraan bermotor untuk digadaikan dan nasabah menerima uang pinjaman setelah Perusahaan pergadaian syariah melakukan taksiran atas kendaraan tersebut, serta pembayaran yang dilakukan oleh nasabah dilakukan berdasarkan prinsip angsuran dan jangka waktu pinjaman lebih dari 4 bulan. Kegiatan usaha/akad yang tepat untuk transaksi tersebut adalah',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penyaluran uang pinjaman berdasarkan hukum gadai dengan akad rahn', FALSE),
    (q_id, 'Penyaluran uang pinjaman berdasarkan jaminan fidusia dengan akad rahn tasjily', TRUE),
    (q_id, 'Penyaluran uang pinjaman berdasarkan fee based income dengan akad marhun bih', FALSE),
    (q_id, 'Penyaluran uang pinjaman berdasarkan fee based income dengan akad ijarah', FALSE);

  -- Q68 (Mark 0.00 correction: correct = a. Mu'nah)
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam istilah syariah untuk kegiatan usaha gadai, ujrah (fee penyimpanan) yang disepakati antara perusahaan pergadaian dengan nasabah disebut',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mu''nah', TRUE),
    (q_id, 'Rahin', FALSE),
    (q_id, 'Marhun bih', FALSE),
    (q_id, 'Marhun', FALSE);

  -- Q70
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut yang bukan merupakan siklus pengawasan berbasis risiko untuk lembaga jasa keuangan non bank syariah',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penilaian Tingkat kesehatan', FALSE),
    (q_id, 'Penyidikan', TRUE),
    (q_id, 'Tindakan Pengawasan dan Pemantauan', FALSE),
    (q_id, 'Perencanaan pengawasan', FALSE);

  -- Q73
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Ruang lingkup Pengawasan OJK terhadap LPEI sebagaimana POJK Nomor 9/POJK.05/2022', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tingkat Kesehatan dan kepatuhan terhadap perundang-undangan', TRUE),
    (q_id, 'Pengelolaan dan penempatan dana serta kegiatan operasional', FALSE),
    (q_id, 'Kinerja dan kesesuaian kegiatan LPEI dengan RKAT', FALSE),
    (q_id, 'Pemberian arahan dan pedoman untuk pelaksanaan kegiatan usaha', FALSE);

  -- Q75
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Perusahaan pembiayaan LJKNB dengan status pengawasan khusus ditetapkan oleh Otoritas Jasa Keuangan tidak dapat disehatkan, jika berdasarkan penilaian Otoritas Jasa Keuangan diketahui bahwa',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Salah semua', FALSE),
    (q_id, 'Batas waktu status pengawasan khusus berakhir', FALSE),
    (q_id, 'LJKNB masih memenuhi kriteria status pengawasan khusus', FALSE),
    (q_id, 'Benar semua', TRUE);

  -- Q76
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Bagaimana pengawasan terhadap perusahaan pergadaian dilakukan', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Hanya melalui inspeksi mendadak', FALSE),
    (q_id, 'Melalui penilaian oleh pihak ketiga', FALSE),
    (q_id, 'Melalui pemantauan dan analisis laporan yang disampaikan perusahaan pergadaian kepada OJK', TRUE),
    (q_id, 'Hanya melalui audit eksternal', FALSE);

  -- Q78
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apa saja kewajiban perusahaan pergadaian dalam mengelola barang jaminan', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menyimpan barang jaminan di rumah pribadi', FALSE),
    (q_id, 'Menjual barang jaminan tanpa pemberitahuan', FALSE),
    (q_id, 'Menggunakan barang jaminan untuk keperluan operasional', FALSE),
    (q_id, 'Mengasuransikan barang jaminan dan menyimpannya di tempat yang aman', TRUE);

  -- Q80 (Mark 0.00 correction: correct = b. 10 hari)
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Laporan bulanan Penyelenggara LPBBTI disampaikan paling lambat', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '15 hari sejak berakhirnya periode laporan', FALSE),
    (q_id, '10 hari sejak berakhirnya periode laporan', TRUE),
    (q_id, '5 hari sejak berakhirnya periode laporan', FALSE),
    (q_id, '20 hari sejak berakhirnya periode laporan', FALSE);

  -- Q81
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dalam konteks pengawasan PVML, apa yang menjadi tugas pokok dan fungsi koordinasi', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Merencanakan strategi bisnis', FALSE),
    (q_id, 'Mengatur kegiatan pemasaran', FALSE),
    (q_id, 'Melaksanakan forum rutin untuk koordinasi tugas pengawasan', TRUE),
    (q_id, 'Menjalankan program literasi keuangan', FALSE);

  -- Q83
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam proses pengajuan pinjaman dengan hukum gadai, langkah pertama yang dilakukan oleh calon nasabah adalah',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Membayar bunga pinjaman', FALSE),
    (q_id, 'Menerima uang pinjaman', FALSE),
    (q_id, 'Menyerahkan barang jaminan untuk ditaksir', TRUE),
    (q_id, 'Menandatangani perjanjian pinjaman', FALSE);

  -- Q84
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Apa yang harus dilakukan perusahaan pergadaian jika barang jaminan mengalami kerusakan atau hilang selama penyimpanan',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengganti dengan barang yang setara atau uang tunai yang sesuai', TRUE),
    (q_id, 'Mengabaikan kejadian tersebut', FALSE),
    (q_id, 'Menuntut nasabah untuk mengganti kerugian', FALSE),
    (q_id, 'Menjual barang yang tersisa untuk menutupi kerugian', FALSE);

  -- Q85
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Batas penempatan dana disbursement (pencairan) pada rekening escrow adalah paling lama',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '3 hari kerja', FALSE),
    (q_id, 'tidak diatur', FALSE),
    (q_id, '2 hari kerja', TRUE),
    (q_id, '1 hari kerja', FALSE);

  -- Q88
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Batas maksimum pendanaan bagi lender Pelaku Jasa Keuangan yang diawasi OJK yang dapat disalurkan melalui Penyelenggara LPBBTI sebesar',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '25% dari pendanaan outstanding per bulan', FALSE),
    (q_id, 'Tidak terbatas', FALSE),
    (q_id, '50% dari pendanaan outstanding per bulan', FALSE),
    (q_id, '75% dari pendanaan outstanding per bulan', TRUE);

  -- Q89
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Laporan keuangan tahunan Penyelenggara LPBBTI disampaikan paling lambat', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '30 Mei tahun berikutnya', FALSE),
    (q_id, '30 Maret tahun berikutnya', FALSE),
    (q_id, '30 April tahun berikutnya', TRUE),
    (q_id, '30 Juni tahun berikutnya', FALSE);

  -- Q90
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Modal disetor minimum Penyelenggara LPBBTI adalah sebesar', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rp 25 miliar', TRUE),
    (q_id, 'Rp 7,5 miliar', FALSE),
    (q_id, 'Rp 2,5 miliar', FALSE),
    (q_id, 'Rp 12,5 miliar', FALSE);

  -- Q91
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dalam proses gadai, apa peran utama dari penaksir barang jaminan', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menilai kelayakan kredit nasabah', FALSE),
    (q_id, 'Menyimpan barang jaminan di tempat yang aman', FALSE),
    (q_id, 'Mengelola pembayaran bunga pinjaman', FALSE),
    (q_id, 'Menaksir nilai barang jaminan untuk menentukan jumlah pinjaman yang dapat diberikan', TRUE);

  -- Q93
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apa yang dimaksud dengan fidusia dalam konteks perusahaan pergadaian', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penyaluran pinjaman dengan jaminan properti', FALSE),
    (q_id, 'Penyaluran pinjaman tanpa jaminan', FALSE),
    (q_id, 'Penyaluran pinjaman dengan jaminan yang tetap berada di tangan nasabah', TRUE),
    (q_id, 'Penyaluran pinjaman dengan jaminan yang dipegang oleh pihak ketiga', FALSE);

  -- Q95
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Barang jaminan yang diberikan oleh nasabah dalam gadai harus disimpan di', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tempat penyimpanan pribadi', FALSE),
    (q_id, 'Tempat penyimpanan khusus sesuai jenis barang', TRUE),
    (q_id, 'Rumah Direktur', FALSE),
    (q_id, 'Rumah nasabah', FALSE);

  -- Q99 (Mark 0.00 correction: correct = d. Pelaksanaan audit internal paling sedikit 2 kali dalam setahun)
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut adalah ketentuan mengenai audit internal pada POJK LPBBTI, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penyelenggara wajib memiliki unit audit internal', FALSE),
    (q_id, 'Penyelenggara dapat menunjuk pihak lain untuk pelaksanaan audit internal', FALSE),
    (q_id, 'Unit audit internal dijalankan paling sedikit oleh 1 orang SDM', FALSE),
    (q_id, 'Pelaksanaan audit internal paling sedikit 2 kali dalam setahun', TRUE);

  -- Q100
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut adalah kualitas pendanaan Penyelenggara LPBBTI, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Diragukan', FALSE),
    (q_id, 'Kurang lancar', FALSE),
    (q_id, 'Tidak lancar', TRUE),
    (q_id, 'Lancar', FALSE);

END $$;
