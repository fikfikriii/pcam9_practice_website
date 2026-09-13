-- seed_bank_soal_ppdp_pcs7.sql
-- Sources merged:
--   (A) Bank Soal PPDP.pdf (PCS7 exam bank) — 77 unique questions
--   (B) seed_ppdp_pcs7.sql (Bank Soal Pengawasan.docx + Bank Soal Penjaminan.docx) — 35 questions
-- Sections: Perasuransian (34Q), Penjaminan (29Q), Dana Pensiun (19Q), Pengawasan PPDP (30Q)
-- Category: ppdp | Source: pcs7 | Module: 1
-- NOTE: seed_ppdp_pcs7.sql is superseded by this file — do not run both.

DO $$
DECLARE
  mod_id  INTEGER;
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN

  SELECT id INTO mod_id FROM modules WHERE number = 1;

  INSERT INTO section_categories (id, label)
  VALUES ('ppdp', 'PPDP')
  ON CONFLICT (id) DO NOTHING;

  -- ===========================================================================
  -- SECTION 1: Perasuransian (34 questions — from Bank Soal PPDP.pdf)
  -- ===========================================================================
  SELECT id INTO sec_id FROM sections WHERE title = 'Perasuransian';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session, module_id, category_id)
    VALUES ('Perasuransian', sec_pos, 10, mod_id, 'ppdp')
    RETURNING id INTO sec_id;
  END IF;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- Q2
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pernyataan berikut benar, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tertanggung harus memiliki hubungan dengan objek yang diasuransikan', FALSE),
    (q_id, 'Asuransi kesehatan dapat diselenggarakan oleh perusahaan asuransi umum', FALSE),
    (q_id, 'Asuransi menjamin kerugian yang diakibatkan pelanggaran hukum oleh pihak Tertanggung', TRUE),
    (q_id, 'Asuransi dapat melakukan penelitian terhadap klaim yang diajukan nasabah', FALSE);

  -- Q5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Produk Asuransi yang terkait dengan investasi adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'PAYDI', TRUE),
    (q_id, 'Asuransi jiwa berjangka', FALSE),
    (q_id, 'Anuitas', FALSE),
    (q_id, 'Dwiguna', FALSE);

  -- Q9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Sejumlah uang yang dibayarkan oleh Tertanggung kepada Penanggung atas suatu mekanisme pengalihan risiko disebut', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Klaim', FALSE),
    (q_id, 'Asuransi', FALSE),
    (q_id, 'Polis', FALSE),
    (q_id, 'Premi', TRUE);

  -- Q11
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pihak yang dapat memberikan jasa penilaian terhadap kerugian pada obyek asuransi yang dipertanggungkan, adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aktuaris', FALSE),
    (q_id, 'Underwriter', FALSE),
    (q_id, 'Penilai kerugian', TRUE),
    (q_id, 'Pialang asuransi/reasuransi', FALSE);

  -- Q12
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Usaha jasa pertanggungan ulang terhadap risiko yang dihadapi oleh perusahaan asuransi, perusahaan penjaminan, atau perusahaan reasuransi lainnya, disebut', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Usaha asuransi jiwa', FALSE),
    (q_id, 'Usaha penjaminan ulang', FALSE),
    (q_id, 'Usaha asuransi umum', FALSE),
    (q_id, 'Usaha reasuransi', TRUE);

  -- Q13
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Manakah pernyataan mengenai asuransi jiwa yang benar?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Polis Asuransi Jiwa adalah perjanjian antara perusahaan asuransi dengan pihak yang menggunakan asuransi', FALSE),
    (q_id, 'Polis Asuransi Jiwa adalah perjanjian antara penanggung dengan tertanggung', FALSE),
    (q_id, 'Nomor 1 dan 2 yang benar', TRUE),
    (q_id, 'Nomor 1 dan 3 yang benar', FALSE);

  -- Q35
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pernyataan yang benar menurut Undang-Undang Nomor 40 Tahun 2014 tentang Perasuransian sebagaimana telah diubah dengan Undang-Undang Nomor 4 Tahun 2023 tentang Pengembangan dan Penguatan Sektor Keuangan, yaitu', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Setiap perubahan kepemilikan wajib terlebih dahulu memperoleh persetujuan Otoritas Jasa Keuangan', TRUE),
    (q_id, 'Setiap perubahan kepemilikan yang menyebabkan perubahan Pengendali wajib terlebih dahulu memperoleh persetujuan Otoritas Jasa Keuangan', FALSE),
    (q_id, 'Perubahan kepemilikan pemegang saham Perusahaan Perasuransian melalui transaksi di bursa efek dikecualikan dari ketentuan kewajiban memperoleh persetujuan Otoritas Jasa Keuangan terlebih dahulu', FALSE),
    (q_id, 'Ketentuan mengenai Perusahaan Perasuransian yang memiliki usaha sejenis atau kepemilikan perusahaan induk atas anak perusahaan yang bergerak di bidang Usaha Perasuransian yang sejenis wajib tetap dipenuhi saat terjadi perubahan kepemilikan', FALSE);

  -- Q37
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Yang tidak termasuk bentuk badan hukum perusahaan asuransi dan perusahaan reasuransi', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Koperasi dan Usaha Bersama', FALSE),
    (q_id, 'Perseroan Komanditer dan Perseroan Terbatas', TRUE),
    (q_id, 'Perseroan Terbatas dan Koperasi', FALSE),
    (q_id, 'Usaha Bersama dan Perseroan Terbatas', FALSE);

  -- Q38
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Tindak pidana perasuransian yang diatur dalam pasal 79 Undang-Undang nomor 40 tahun 2014 tentang Perasuransian adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menandatangani polis baru dari perusahaan asuransi yang sedang dalam pengenaan sanksi pembatasan kegiatan usaha', TRUE),
    (q_id, 'Melakukan pemalsuan atas dokumen perusahaan asuransi dan perusahaan reasuransi', FALSE),
    (q_id, 'Menggelapkan dengan cara mengalihkan, menjaminkan, mengagunkan, atau menggunakan kekayaan yang mengakibatkan berkurangnya aset Perusahaan Perasuransian', FALSE),
    (q_id, 'Menerima premi dari tertanggung tanpa meneruskannya kepada penanggung', FALSE);

  -- Q43
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Jumlah modal disetor yang diwajibkan dimiliki oleh Perusahaan Pialang Asuransi dan Perusahaan Penilai Kerugian Asuransi berdasarkan Peraturan Otoritas Jasa Keuangan Republik Indonesia Nomor 24 Tahun 2023 tentang Perizinan Usaha dan Kelembagaan adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rp1,5 Miliar dan Rp350 Miliar', FALSE),
    (q_id, 'Rp5 Miliar dan Rp500 Juta', FALSE),
    (q_id, 'Rp5 Miliar dan Rp1,5 Miliar', TRUE),
    (q_id, 'Rp50 Miliar dan Rp500 Miliar', FALSE);

  -- Q44
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Ketentuan mengenai batasan kepemilikan asing yang berlaku bagi perusahaan asuransi dan perusahaan reasuransi, yaitu', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'a, b dan c benar', FALSE),
    (q_id, 'Tidak terdapat batasan kepemilikan asing bagi perusahaan asuransi dan perusahaan reasuransi yang pemegang sahamnya merupakan perseroan terbuka', FALSE),
    (q_id, 'Paling tinggi sebesar 80%', TRUE),
    (q_id, 'Paling tinggi sebesar 75%', FALSE);

  -- Q46
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berdasarkan Peraturan Otoritas Jasa Keuangan Republik Indonesia Nomor 23 Tahun 2023 tentang Perizinan Usaha dan Kelembagaan Perusahaan Asuransi, Perusahaan Asuransi Syariah, Perusahaan Reasuransi, dan Perusahaan Reasuransi Syariah, laporan perubahan anggaran dasar yang wajib dilaporkan kepada Otoritas Jasa Keuangan, yaitu', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Laporan pengkinian KBLI pada OSS dan laporan pengurangan modal disetor', FALSE),
    (q_id, 'Laporan perubahan tempat kedudukan kantor pusat dan laporan perubahan anggaran dasar lainnya berdasarkan permintaan Otoritas Jasa Keuangan', TRUE),
    (q_id, 'Laporan penambahan modal disetor dan laporan perubahan maksud, tujuan serta kegiatan usaha', FALSE),
    (q_id, 'Laporan pengurangan modal disetor dan laporan perubahan jaringan kantor', FALSE);

  -- Q49
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Kewajiban penyesuaian jumlah modal disetor bagi Perusahaan Asuransi, Perusahaan Asuransi Syariah, Perusahaan Reasuransi, dan Perusahaan Reasuransi Syariah, tidak diberlakukan bagi kondisi sebagai berikut, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Akuisisi', TRUE),
    (q_id, 'Restukturisasi Grup', FALSE),
    (q_id, 'Penilaian Otoritas Jasa Keuangan', FALSE),
    (q_id, 'Pemenuhan Ekuitas Minimum', FALSE);

  -- Q51
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Standar Penanganan Klaim bagi Perusahaan Pialang Asuransi (PPA) yang diatur dalam ketentuan adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'PPA wajib menyampaikan laporan penilaian kerugian kepada Perusahaan Reasuransi', FALSE),
    (q_id, 'PPA melakukan survey lokasi', FALSE),
    (q_id, 'PPA wajib menginformasikan besar nilai klaim/manfaat yang disetujui oleh Perusahaan Asuransi kepada pemegang polis, tertanggung, peserta', TRUE),
    (q_id, 'PPA memutuskan nilai klaim dari suatu kejadian', FALSE);

  -- Q52
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Komponen yang terdapat di dalam dana tabarru adalah, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Manfaat Penarikan Investasi', TRUE),
    (q_id, 'Kontribusi Tabarru', FALSE),
    (q_id, 'Ujrah Pengelolaan Risiko', FALSE),
    (q_id, 'Beban Klaim', FALSE);

  -- Q53
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Besaran minimum ekuitas Perusahaan Penilai Kerugian Asuransi adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rp 400 juta', FALSE),
    (q_id, 'Rp 500 juta', TRUE),
    (q_id, 'Rp 100 juta', FALSE),
    (q_id, 'Rp 200 juta', FALSE);

  -- Q54
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Direksi Perusahaan Pialang Reasuransi harus memiliki sertifikat kepialangan dengan kualifikasi', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '1 (satu) level di bawah kualifikasi tertinggi dari Lembaga Sertifikasi Profesi di bidang perasuransian', TRUE),
    (q_id, '2 (dua) level di bawah kualifikasi tertinggi dari Lembaga Sertifikasi Profesi di bidang perasuransian', FALSE),
    (q_id, '3 (tiga) level di bawah kualifikasi tertinggi dari Lembaga Sertifikasi Profesi di bidang perasuransian', FALSE),
    (q_id, 'Sama dengan kualifikasi tertinggi dari Lembaga Sertifikasi Profesi di bidang perasuransian', FALSE);

  -- Q56
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Kerja sama tertulis Perusahaan Pialang Asuransi, Perusahaan Pialang Reasuransi, dan Perusahaan Penilai Kerugian Asuransi dengan pihak lain dalam rangka perolehan bisnis atau melaksanakan sebagian fungsi dalam penyelenggaraan usahanya, minimal mencakup klausul tentang', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Premi', TRUE),
    (q_id, 'Klaim', FALSE),
    (q_id, 'Komisi', FALSE),
    (q_id, 'Manfaat polis', FALSE);

  -- Q57
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut adalah Peringkat Komposit TKS, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Sehat', FALSE),
    (q_id, 'Sedang Sehat', TRUE),
    (q_id, 'Tidak Sehat', FALSE),
    (q_id, 'Kurang Sehat', FALSE);

  -- Q59
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Perusahaan Pialang Reasuransi dapat memperoleh imbalan atas, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Jasa analisis perusahaan', TRUE),
    (q_id, 'Jasa keperantaraan', FALSE),
    (q_id, 'Jasa konsultasi', FALSE),
    (q_id, 'Jasa penanganan penyelesaian klaim', FALSE);

  -- Q60
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut ini bukan merupakan jenis usaha asuransi', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perusahaan Asuransi Umum', FALSE),
    (q_id, 'Perusahaan Reasuransi', FALSE),
    (q_id, 'Perusahaan Asuransi Kendaraan Bermotor', TRUE),
    (q_id, 'Perusahaan Asuransi Jiwa', FALSE);

  -- Q61
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Laporan rutin yang disampaikan oleh Konsultan Aktuaria kepada OJK adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Laporan Tahunan', TRUE),
    (q_id, 'Laporan Semesteran', FALSE),
    (q_id, 'Laporan Program Pendidikan Berkelanjutan', FALSE),
    (q_id, 'Laporan Kegiatan Pemberian Jasa', FALSE);

  -- Q62
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Penilaian risiko inheren dan kualitas penerapan manajemen risiko terhadap 9 risiko dibagi menjadi 3 kelompok risiko, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko Bisnis', FALSE),
    (q_id, 'Risiko Finansial', FALSE),
    (q_id, 'Risiko Permodalan', TRUE),
    (q_id, 'Risiko Governance', FALSE);

  -- Q63
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Jenis produk asuransi yang dapat dipasarkan secara digital sebagaimana dimaksud pada Pasal 51A ayat (4) huruf d POJK 28 Tahun 2022, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Asuransi perjalanan', FALSE),
    (q_id, 'Asuransi kendaraan bermotor', FALSE),
    (q_id, 'Asuransi rangka kapal', TRUE),
    (q_id, 'Asuransi kecelakaan diri', FALSE);

  -- Q64
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Profesi yang tidak masuk ke dalam pengawasan Direktorat Pengawasan Jasa Penunjang adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penilai', FALSE),
    (q_id, 'Akuntan Publik', FALSE),
    (q_id, 'Konsultan Hukum', TRUE),
    (q_id, 'Konsultan Aktuaria', FALSE);

  -- Q65
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Perusahaan Pialang Asuransi setiap saat wajib memiliki ekuitas paling sedikit sebesar', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rp1.500.000.000,00 (satu miliar lima ratus juta rupiah)', FALSE),
    (q_id, 'Rp500.000.000,00 (lima ratus juta rupiah)', FALSE),
    (q_id, 'Rp2.000.000.000,00 (dua miliar rupiah)', TRUE),
    (q_id, 'Rp3.000.000.000,00 (tiga miliar rupiah)', FALSE);

  -- Q68
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Manakah yang tidak termasuk dalam proses penanganan klaim bagi Perusahaan Pialang Asuransi', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menginformasikan dokumen pendukung yang dibutuhkan paling lama 3 hari kerja sejak pemberitahuan klaim diterima', FALSE),
    (q_id, 'Menyampaikan dokumen pendukung kepada PA/PAS paling lama 1 hari kerja sejak seluruh dokumen pendukung diterima', FALSE),
    (q_id, 'Memberikan penilaian atas kejadian klaim', TRUE),
    (q_id, 'Menyampaikan informasi pengajuan klaim paling lama 1 hari kerja setelah diterimanya informasi pengajuan klaim', FALSE);

  -- Q69
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Perusahaan Pialang Asuransi dalam melaksanakan kegiatan usahanya wajib memiliki Pialang Asuransi, salah satu tugas Pialang Asuransi adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Memberikan informasi terkini mengenai perkembangan industri asuransi dan peraturan di bidang perasuransian kepada Pialang Asuransi', FALSE),
    (q_id, 'Membantu calon pemegang polis, tertanggung atau peserta dalam proses penanganan klaim', TRUE),
    (q_id, 'Membuat dan menerapkan proses kerja Pialang Asuransi yang baik', FALSE),
    (q_id, 'Melakukan peninjauan atas kredibilitas Perusahaan Asuransi', FALSE);

  -- Q70
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Perusahaan dinyatakan dengan status pengawasan khusus jika:'
    || E'\ni. Tingkat Kesehatan dengan Peringkat Komposit 5'
    || E'\nii. Tingkat Kesehatan dengan Peringkat Komposit 4'
    || E'\niii. Faktor Tata Kelola dengan Peringkat 5'
    || E'\niv. Faktor Tata Kelola dengan Peringkat 4',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kondisi i dan iii', TRUE),
    (q_id, 'Kondisi ii dan iv', FALSE),
    (q_id, 'Kondisi i dan iv', FALSE),
    (q_id, 'Kondisi ii dan iii', FALSE);

  -- Q71
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Batas minimal tingkat kesehatan keuangan perusahaan Asuransi/ Rasio Solvabilitas adalah sebesar', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '120%', TRUE),
    (q_id, '200%', FALSE),
    (q_id, '150%', FALSE),
    (q_id, '100%', FALSE);

  -- Q73
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apa yang dimaksud dengan asuransi?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pertanggungan atau perjanjian antara dua pihak di mana pihak yang satu berkewajiban membayar iuran dan pihak yang lain memberikan jaminan sepenuhnya kepada pembayar iuran', FALSE),
    (q_id, 'Perjanjian antara dua pihak yang menjadi dasar bagi penerimaan premi oleh perusahaan asuransi', FALSE),
    (q_id, 'Perjanjian di mana seorang penanggung mengikatkan diri kepada seorang tertanggung untuk memberikan penggantian karena suatu kerugian, kerusakan, atau kehilangan keuntungan yang diharapkan', TRUE),
    (q_id, 'Perjanjian yang didasarkan pada hasil pengelolaan dana', FALSE);

  -- Q74
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Lini usaha yang terdapat pada asuransi umum, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Asuransi Kesehatan, Asuransi Kecelakaan Diri, PAYDI', FALSE),
    (q_id, 'Asuransi Jiwa Berjangka, Asuransi Kesehatan, Asuransi Kecelakaan Diri', TRUE),
    (q_id, 'Asuransi Kendaraan Bermotor, Asuransi Harta Benda, Asuransi Pengangkutan', FALSE),
    (q_id, 'Asuransi Kesehatan, Asuransi Kecelakaan Diri, Asuransi Kendaraan Bermotor', FALSE);

  -- Q75
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa lama jangka waktu penyerahan premi/kontribusi yang harus disampaikan oleh Perusahaan Pialang Asuransi kepada Perusahaan Asuransi', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '30 hari kerja sejak premi/kontribusi diterima dari tertanggung atau sesuai jangka waktu pembayaran premi atau kontribusi yang ditetapkan dalam Polis Asuransi yang bersangkutan, mana yang lebih singkat', TRUE),
    (q_id, '30 hari sejak premi/kontribusi diterima dari tertanggung', FALSE),
    (q_id, '3 hari kerja sejak premi/kontribusi diterima dari tertanggung', FALSE),
    (q_id, '15 hari kerja sejak premi/kontribusi diterima dari tertanggung', FALSE);

  -- Q93
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut adalah aspek pengawasan/pemeriksaan perasuransian, penjaminan, dan dana pensiun dari bidang aktuaria, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Valuasi dan Pelaporan', FALSE),
    (q_id, 'Perhitungan Premi', FALSE),
    (q_id, 'Desain Produk', FALSE),
    (q_id, 'Penilaian Tata Kelola', TRUE);

  -- ===========================================================================
  -- SECTION 2: Penjaminan (29 questions)
  --   4 from Bank Soal PPDP.pdf + 25 from seed_ppdp_pcs7.sql
  -- ===========================================================================
  SELECT id INTO sec_id FROM sections WHERE title = 'Penjaminan';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session, module_id, category_id)
    VALUES ('Penjaminan', sec_pos, 10, mod_id, 'ppdp')
    RETURNING id INTO sec_id;
  END IF;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- === From Bank Soal PPDP.pdf ===

  -- Q7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Lembaga keuangan atau di luar lembaga keuangan yang telah memberikan Kredit, Pembiayaan, Pembiayaan Berdasarkan Prinsip Syariah atau kontrak jasa kepada Terjamin, disebut', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penjamin', FALSE),
    (q_id, 'Terjamin', FALSE),
    (q_id, 'Penerima Jaminan', TRUE),
    (q_id, 'Pemberi Kredit', FALSE);

  -- Q20
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pernyataan berikut terkait dengan penjaminan adalah benar, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perusahaan penjaminan berfungsi menjamin pemenuhan kewajiban finansial terjamin kepada penerima jaminan', FALSE),
    (q_id, 'Terdapat 2 (dua) pihak yang terlibat, yaitu penjamin dan penerima jaminan', TRUE),
    (q_id, 'Terdapat 2 (dua) mekanisme penjaminan, yaitu penjaminan langsung dan penjaminan tidak langsung', FALSE),
    (q_id, 'Perjanjian penjaminan merupakan perjanjian accesoir', FALSE);

  -- Q31
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Produk asuransi yang memberikan jaminan untuk membayar kepada penerima jaminan/obligee apabila terjamin/principal wanprestasi atas pelaksanaan kontrak yang dijamin, berdasarkan pada syarat dan kondisi yang dicetak, dicantumkan, dilekatkan dan/atau dibuatkan endorsemen pada ketentuan polis disebut', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Asuransi Tanggung Gugat', FALSE),
    (q_id, 'Semua salah', FALSE),
    (q_id, 'Asuransi Rekayasa', FALSE),
    (q_id, 'Asuransi Kredit', FALSE),
    (q_id, 'Suretyship', TRUE);

  -- Q33
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Tindak pidana bidang penjaminan mengenai penggelapan diatur dalam', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pasal 59 Undang-Undang nomor 1 tahun 2016 tentang Penjaminan', TRUE),
    (q_id, 'Pasal 58 Undang-Undang nomor 1 tahun 2018 tentang Penjaminan', FALSE),
    (q_id, 'Pasal 59 Undang-Undang nomor 1 tahun 2018 tentang Penjaminan', FALSE),
    (q_id, 'Pasal 58 Undang-Undang nomor 1 tahun 2016 tentang Penjaminan', FALSE);

  -- === From seed_ppdp_pcs7.sql — Penjaminan Proses Bisnis (Q11–Q20) ===

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Sebutkan dasar hukum/pengaturan perusahaan penjaminan, kecuali:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'SEOJK Nomor 11/POJK.05/2013', TRUE),
    (q_id, 'SEOJK Nomor 54/POJK.05/2017', FALSE),
    (q_id, 'SEOJK Nomor 18/POJK.05/2018', FALSE),
    (q_id, 'SEOJK Nomor 52/POJK.05/2017', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Terdapat berapa pihak dalam kegiatan penjaminan?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '2 pihak: penerima jaminan dan terjamin', FALSE),
    (q_id, '2 pihak: penerima jaminan dan penjamin', FALSE),
    (q_id, '3 pihak: penjamin, penerima jaminan, dan terjamin', TRUE),
    (q_id, '3 pihak: penanggung, tertanggung, agen penjamin', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut merupakan kegiatan utama perusahaan penjaminan:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penjaminan kredit dan/atau pinjaman program kemitraan yang disalurkan oleh BUMN dalam rangka PKBL', FALSE),
    (q_id, 'Penjaminan pengadaan barang dan/atau jasa (surety bonds)', TRUE),
    (q_id, 'Penjaminan kepabeanan (custom bonds)', FALSE),
    (q_id, 'Penjaminan pembelian barang secara angsuran', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut merupakan kegiatan usaha lainnya perusahaan penjaminan:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penjaminan kredit dan/atau pinjaman program kemitraan yang disalurkan oleh BUMN dalam rangka PKBL', TRUE),
    (q_id, 'Penjaminan pinjaman yang disalurkan oleh koperasi simpan pinjam atau koperasi yang mempunyai unit simpan pinjam kepada anggotanya', FALSE),
    (q_id, 'Penjaminan kredit, pembiayaan, atau pembiayaan berdasarkan prinsip syariah yang diberikan oleh lembaga keuangan', FALSE),
    (q_id, 'Penjaminan transaksi dagang', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Sampai dengan saat ini, ada berapa banyak perusahaan penjaminan konvensional di Indonesia:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '10 perusahaan penjaminan', FALSE),
    (q_id, '15 perusahaan penjaminan', TRUE),
    (q_id, '20 perusahaan penjaminan', FALSE),
    (q_id, '25 perusahaan penjaminan', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Penjaminan merupakan perjanjian yang bersifat accesoir. Ciri perjanjian accesoir adalah sebagai berikut, kecuali:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Adanya tergantung pada perjanjian pokok', FALSE),
    (q_id, 'Jika perjanjian pokok batal, maka perjanjian penjaminan juga ikut batal', FALSE),
    (q_id, 'Jika perjanjian pokok batal, maka hanya klausula yang berkaitan dengan penjaminan saja yang akan batal', TRUE),
    (q_id, 'Ikut beralih dengan beralihnya perjanjian pokok', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dalam skema penjaminan kredit, bank/koperasi bertindak sebagai:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penerima Jaminan', TRUE),
    (q_id, 'Tertanggung', FALSE),
    (q_id, 'Terjamin', FALSE),
    (q_id, 'Penanggung', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Sejak ganti rugi dibayarkan oleh perusahaan penjaminan, maka timbul hak tagih yang beralih menjadi hak tagih perusahaan penjaminan, yang disebut:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Klaim', FALSE),
    (q_id, 'Subrogasi', TRUE),
    (q_id, 'Imbal Jasa Penjaminan', FALSE),
    (q_id, 'Komisi', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Kegiatan usaha yang dapat dilaksanakan oleh perusahaan penjaminan diatur dalam:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'POJK Nomor 1/POJK.05/2016', FALSE),
    (q_id, 'POJK Nomor 1/POJK.05/2017', FALSE),
    (q_id, 'POJK Nomor 2/POJK.05/2017', TRUE),
    (q_id, 'POJK Nomor 3/POJK.05/2017', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Kegiatan usaha yang wajib dilaporkan oleh Perusahaan Penjaminan ke OJK adalah:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penjaminan kredit, pembiayaan, atau pembiayaan berdasarkan prinsip syariah yang diberikan oleh lembaga keuangan', FALSE),
    (q_id, 'Penjaminan pinjaman yang disalurkan oleh koperasi simpan pinjam atau koperasi yang mempunyai unit simpan pinjam kepada anggotanya', FALSE),
    (q_id, 'Penjaminan kredit dan/atau pinjaman program kemitraan yang disalurkan oleh BUMN dalam rangka PKBL', FALSE),
    (q_id, 'Pemberian jasa konsultasi manajemen terkait kegiatan penjaminan', TRUE);

  -- === From seed_ppdp_pcs7.sql — Penjaminan Laporan Periodik (Q21–Q35) ===

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut ini jenis-jenis laporan yang disampaikan oleh perusahaan penjaminan kepada OJK, yaitu:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Laporan triwulanan dan laporan semesteran', FALSE),
    (q_id, 'Laporan keuangan tahunan audited dan Laporan triwulanan', FALSE),
    (q_id, 'Laporan triwulanan dan laporan semesteran dan laporan lainnya yang terkait dengan aksi korporasi (perubahan modal, perubahan pemegang saham, perubahan pengurus perusahaan)', FALSE),
    (q_id, 'Laporan keuangan bulanan, Laporan keuangan tahunan audited, dan Laporan lainnya yang terkait dengan aksi korporasi (perubahan modal, perubahan pemegang saham, perubahan pengurus perusahaan)', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Manakah komponen yang tercantum di format laporan penjaminan kredit pada laporan keuangan bulanan perusahaan penjaminan yang benar?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Produksi piutang pembiayaan dari awal tahun sampai tanggal laporan (periode) maupun nilai outstanding per tanggal laporan (posisi)', FALSE),
    (q_id, 'Dirinci berdasarkan jenis penjaminan, yaitu untuk usaha produktif dan non produktif', TRUE),
    (q_id, 'Dirinci berdasarkan jenis penerima pinjaman', FALSE),
    (q_id, 'Dirinci berdasarkan jenis penerima penjaminan, yaitu untuk lembaga keuangan bank dan non bank', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa nilai rasio penjaminan usaha produktif terhadap total penjaminan perusahaan penjaminan sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Minimum 30%', FALSE),
    (q_id, 'Maksimum 25%', FALSE),
    (q_id, 'Minimum 150%', FALSE),
    (q_id, 'Minimum 25%', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa nilai rasio likuiditas perusahaan penjaminan sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Minimum 30%', FALSE),
    (q_id, 'Maksimum 25%', FALSE),
    (q_id, 'Minimum 120%', TRUE),
    (q_id, 'Minimum 25%', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa nilai gearing ratio untuk usaha produktif perusahaan penjaminan sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Minimum 30 kali', FALSE),
    (q_id, 'Maksimum 20 kali', TRUE),
    (q_id, 'Minimum 20 kali', FALSE),
    (q_id, 'Maksimum 40 kali', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa nilai total gearing ratio perusahaan penjaminan sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Minimum 30 kali', FALSE),
    (q_id, 'Maksimum 20 kali', FALSE),
    (q_id, 'Minimum 20 kali', FALSE),
    (q_id, 'Maksimum 40 kali', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa nilai rasio cadangan umum perusahaan penjaminan sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Minimum 30%', FALSE),
    (q_id, 'Maksimum 25%', FALSE),
    (q_id, 'Minimum 150%', FALSE),
    (q_id, 'Minimum 25%', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa jumlah nilai penempatan investasi perusahaan penjaminan pada investasi dalam bentuk SBN sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Maksimum 50% dari jumlah investasi', TRUE),
    (q_id, 'Maksimum 100% dari jumlah investasi', FALSE),
    (q_id, 'Minimum 25% dari jumlah investasi', FALSE),
    (q_id, 'Maksimum 25% dari jumlah investasi', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa jumlah nilai penempatan investasi perusahaan penjaminan pada investasi dalam bentuk Reksadana dan/atau reksadana syariah sesuai dengan POJK No. 2/POJK.05/2017 tentang Penyelenggaraan Usaha Lembaga Penjamin?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Maksimum 15% dari jumlah investasi per manajemen investasi, dan maksimum 20% untuk keseluruhan penempatan dalam bentuk Reksadana dan/atau reksadana Syariah terhadap total investasi', FALSE),
    (q_id, 'Maksimum 25% dari jumlah investasi per manajemen investasi, dan maksimum 20% untuk keseluruhan penempatan dalam bentuk Reksadana dan/atau reksadana Syariah terhadap total investasi', FALSE),
    (q_id, 'Maksimum 5% dari jumlah investasi per manajemen investasi, dan maksimum 20% untuk keseluruhan penempatan dalam bentuk Reksadana dan/atau reksadana Syariah terhadap total investasi', TRUE),
    (q_id, 'Maksimum 5% dari jumlah investasi per manajemen investasi, dan maksimum 25% untuk keseluruhan penempatan dalam bentuk Reksadana dan/atau reksadana Syariah terhadap total investasi', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apa tujuan dilakukan analisis aspek kegiatan usaha?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengetahui nilai pinjaman yang disalurkan oleh perusahaan penjaminan pada periode laporan', FALSE),
    (q_id, 'Membandingkan nilai pendapatan investasi pada periode laporan dengan periode sebelumnya, baik secara year on year, year to date, maupun month to month', FALSE),
    (q_id, 'Mengetahui nilai laba/rugi perusahaan penjaminan pada periode laporan', FALSE),
    (q_id, 'Mengetahui nilai penjaminan yang disalurkan oleh perusahaan penjaminan pada periode laporan', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apa ketentuan yang mengatur pengukuran tingkat Kesehatan keuangan lembaga penjamin?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'SE OJK Nomor 18 Tahun 2018 Tentang Kesehatan Keuangan Lembaga Penjamin', TRUE),
    (q_id, 'SE OJK Nomor 18 Tahun 2019 Tentang Kesehatan Keuangan Lembaga Penjamin', FALSE),
    (q_id, 'SE OJK Nomor 15 Tahun 2019 Tentang Kesehatan Keuangan Lembaga Penjamin', FALSE),
    (q_id, 'SE OJK Nomor 18 Tahun 2020 Tentang Kesehatan Keuangan Lembaga Penjamin', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apa saja komponen yang digunakan sebagai acuan dalam mengukur tingkat Kesehatan keuangan lembaga penjamin?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rasio likuiditas, Gearing Ratio, Rentabilitas, Self assessment penerapan tata Kelola perusahaan yang baik', TRUE),
    (q_id, 'Rasio NPG (Non Performing Guarantee), Gearing Ratio, Rentabilitas, Self assessment penerapan tata Kelola perusahaan yang baik', FALSE),
    (q_id, 'BOPO (Beban Operasional terhadap Pendapatan Operasional), Rasio klaim terhadap Imbal Jasa Penjaminan, Rentabilitas, Self assessment penerapan tata Kelola perusahaan yang baik', FALSE),
    (q_id, 'Rasio likuiditas, ROI (Return On Investment), ROA (Return On Asset), Rasio NPG', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apa saja komponen rentabilitas yang dihitung dalam pengukuran tingkat kesehatan keuangan lembaga penjamin?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'ROA (Return On Asset), ROI (Return On Investment), Rasio NPG (Non Performing Guarantee)', FALSE),
    (q_id, 'BOPO (Beban Operasional terhadap Pendapatan Operasional), ROI (Return On Investment), Rasio NPG (Non Performing Guarantee)', FALSE),
    (q_id, 'ROA (Return On Asset), BOPO (Beban Operasional terhadap Pendapatan Operasional), Rasio klaim terhadap Imbal Jasa Penjaminan', TRUE),
    (q_id, 'ROI (Return On Investment), BOPO (Beban Operasional terhadap Pendapatan Operasional), Rasio klaim terhadap Imbal Jasa Penjaminan', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa nilai bobot masing-masing komponen dalam pengukuran komposit tingkat kesehatan keuangan lembaga penjamin?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rasio likuiditas = 20%, Gearing Ratio = 30%, Rentabilitas = 30%, Self assessment penerapan tata Kelola perusahaan yang baik = 20%', FALSE),
    (q_id, 'Rasio likuiditas = 10%, Gearing Ratio = 35%, Rentabilitas = 35%, Self assessment penerapan tata Kelola perusahaan yang baik = 20%', TRUE),
    (q_id, 'Rasio likuiditas = 15%, Gearing Ratio = 35%, Rentabilitas = 35%, Self assessment penerapan tata Kelola perusahaan yang baik = 15%', FALSE),
    (q_id, 'Rasio likuiditas = 10%, Gearing Ratio = 30%, Rentabilitas = 30%, Self assessment penerapan tata Kelola perusahaan yang baik = 30%', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berdasarkan nilai komposit kesehatan keuangan lembaga penjamin sebagaimana SE OJK Nomor 18 Tahun 2018 Tentang Kesehatan Keuangan Lembaga Penjamin, lembaga penjamin dikatakan sangat sehat apabila:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Lembaga penjamin memiliki nilai kesehatan keuangan dari 1 (satu) sampai dengan kurang dari 1,8 (satu koma delapan)', TRUE),
    (q_id, 'Lembaga penjamin memiliki nilai kesehatan keuangan dari 1,8 (satu koma delapan) sampai dengan kurang dari 2,6 (dua koma enam)', FALSE),
    (q_id, 'Lembaga penjamin memiliki nilai kesehatan keuangan dari 2,6 (dua koma enam) sampai dengan kurang dari 3,4 (tiga koma empat)', FALSE),
    (q_id, 'Lembaga penjamin memiliki nilai kesehatan keuangan dari 3,4 (tiga koma empat) sampai dengan kurang dari 4,2 (empat koma dua)', FALSE);

  -- ===========================================================================
  -- SECTION 3: Dana Pensiun (19 questions — from Bank Soal PPDP.pdf)
  -- ===========================================================================
  SELECT id INTO sec_id FROM sections WHERE title = 'Dana Pensiun';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session, module_id, category_id)
    VALUES ('Dana Pensiun', sec_pos, 10, mod_id, 'ppdp')
    RETURNING id INTO sec_id;
  END IF;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- Q1
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Bentuk badan hukum dari Dana Pensiun menurut Undang-undang yang berlaku adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Dana Pensiun', TRUE),
    (q_id, 'Usaha Bersama', FALSE),
    (q_id, 'Perseroan Terbatas', FALSE),
    (q_id, 'Yayasan', FALSE);

  -- Q4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dana Pensiun Lembaga Keuangan dapat dibentuk oleh Lembaga jasa keuangan berikut, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Manajer Investasi', FALSE),
    (q_id, 'Perusahaan Asuransi Jiwa', FALSE),
    (q_id, 'Bank Umum', FALSE),
    (q_id, 'Perusahaan Asuransi Umum', TRUE);

  -- Q6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Manfaat pensiun bagi peserta yang dibayarkan bila peserta pensiun pada usia tertentu sebelum usia pensiun normal, disebut', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Manfaat Pensiun normal', FALSE),
    (q_id, 'Manfaat Pensiun dipercepat', TRUE),
    (q_id, 'Manfaat Pensiun segera', FALSE),
    (q_id, 'Manfaat Pensiun ditunda', FALSE);

  -- Q8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pernyataan yang tidak tepat mengenai DPPK adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'DPPK hanya dapat menyelenggarakan PPIP', TRUE),
    (q_id, 'DPPK dapat dibentuk oleh lebih dari satu Pemberi Kerja', FALSE),
    (q_id, 'Pendiri dari LJK yang dapat membentuk DPLK, juga dapat membentuk DPPK', FALSE),
    (q_id, '1 Pemberi Kerja dapat mendirikan lebih dari 1 DPPK', FALSE);

  -- Q14
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut adalah pemangku kepentingan (stakeholder) dari Dana Pensiun Lembaga Keuangan', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pengurus, Pelaksana Tugas Pengurus, Pendiri, dan Peserta', TRUE),
    (q_id, 'Pendiri, Mitra Pendiri, Peserta, Pelaksana Tugas Pengurus', FALSE),
    (q_id, 'Pendiri, Pemberi Kerja, Peserta dan Mitra Pendiri', FALSE),
    (q_id, 'Pemberi Kerja, Pendiri, Mitra Pendiri, dan Pengurus', FALSE);

  -- Q26
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Tindak pidana pembayaran dana pensiun selain kepada pihak yang telah ditentukan diatur dalam', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pasal 192 UU P2SK', FALSE),
    (q_id, 'Pasal 193 UU P2SK', FALSE),
    (q_id, 'Pasal 194 UU P2SK', FALSE),
    (q_id, 'Pasal 195 UU P2SK', TRUE);

  -- Q76
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Organ Dana Pensiun Syariah sebagai berikut', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pengurus, Dewan Pengawas dan Dewan Pengawas Syariah', TRUE),
    (q_id, 'Pengurus dan Dewan Pengawas', FALSE),
    (q_id, 'Dewan Pengawas dan Dewan Pengawas Syariah', FALSE),
    (q_id, 'Pengurus dan Dewan Pengawas Syariah', FALSE);

  -- Q78
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Siklus pengawasan Dana Pensiun antara lain, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penilaian Tingkat Kesehatan', FALSE),
    (q_id, 'Forum panel', FALSE),
    (q_id, 'Penyusunan Know Your Pension Fund (KYPF)', FALSE),
    (q_id, 'Compliance Based Supervision', TRUE);

  -- Q79
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut pernyataan yang benar terkait program pensiun iuran pasti, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Manfaat pensiun merupakan akumulasi iuran dan hasil pengembangan', FALSE),
    (q_id, 'Pencatatan dana secara agregat', TRUE),
    (q_id, 'Pencatatan dana dalam akun-akun individu', FALSE),
    (q_id, 'Risiko investasi ditanggung peserta', FALSE);

  -- Q82
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dana Pensiun adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Badan Hukum yang mengelola dan menjalankan program yang menjanjikan pembayaran manfaat pensiun sesuai dengan Undang-Undang Nomor 4 Tahun 2023 tentang Pengembangan dan Penguatan Sektor Keuangan', TRUE),
    (q_id, 'Badan Hukum yang pembayaran pesangon sesuai dengan Undang-Undang Nomor 4 Tahun 2023 tentang Pengembangan dan Penguatan Sektor Keuangan', FALSE),
    (q_id, 'Badan Hukum yang mengelola iuran peserta program pensiun sesuai dengan Undang-Undang Nomor 4 Tahun 2021 tentang Pengembangan dan Penguatan Sektor Keuangan', FALSE),
    (q_id, 'Badan Hukum yang mengelola dan menjalankan program yang menjanjikan pembayaran manfaat pensiun sesuai dengan Undang-Undang Nomor 6 Tahun 2023 tentang Pengembangan dan Penguatan Sektor Keuangan', FALSE);

  -- Q83
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Risiko akibat kegagalan debitur dan/atau pihak lain dalam memenuhi kewajiban kepada Dana Pensiun merupakan definisi dari risiko', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko Hukum', FALSE),
    (q_id, 'Risiko Kredit', TRUE),
    (q_id, 'Risiko Operasional', FALSE),
    (q_id, 'Risiko Pasar', FALSE);

  -- Q84
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Bejo adalah seorang pedagang bakso, dia ingin memiliki program pensiun, ke mana Bejo dapat mendaftar untuk memiliki program pensiun', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Dana Pensiun Pemberi Kerja', FALSE),
    (q_id, 'Dana Pensiun Lembaga Keuangan', TRUE),
    (q_id, 'PT Taspen', FALSE),
    (q_id, 'Semua benar', FALSE);

  -- Q88
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pembayaran Manfaat Pensiun di Dana Pensiun Pemberi Kerja dapat dilakukan pada saat', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Dapat dibayarkan sebagian pada saat memasuki usia pensiun normal, sisanya dibayarkan secara bulanan', TRUE),
    (q_id, 'Harus dibayarkan tiga bulan setelah peserta memasuki usia pensiun normal', FALSE),
    (q_id, 'Dapat diambil sebagian pada saat 10 tahun sebelum Peserta memasuki usia pensiun normal', FALSE),
    (q_id, 'Dapat diambil sewaktu-waktu oleh Peserta', FALSE);

  -- Q91
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Akad yang tidak dapat diterapkan dalam penyelenggaraan program pensiun syariah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Akad Rahn', TRUE),
    (q_id, 'Akad Wakalah', FALSE),
    (q_id, 'Akad Mudharabah', FALSE),
    (q_id, 'Akad Hibah Bi Syart', FALSE);

  -- Q92
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pernyataan yang tepat terkait dengan Dewan Pengawas Syariah (DPS)', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'DPS pada Dana Pensiun Syariah dapat langsung melaksanakan tugas setelah mendapatkan rekomendasi dari Dewan Syariah Nasional Majelis Ulama Indonesia', FALSE),
    (q_id, 'DPS wajib menyampaikan laporan hasil pengawasan kepada OJK 2 (dua) kali dalam 1 (satu) tahun', FALSE),
    (q_id, 'Dana Pensiun Lembaga Keuangan yang menjual Paket Investasi Syariah tidak wajib memiliki DPS', FALSE),
    (q_id, 'DPS memiliki tugas untuk melakukan pengawasan aspek syariah pada penyelenggaraan program pensiun syariah', TRUE);

  -- Q94
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Perbedaan karakteristik dana pensiun syariah dengan dana pensiun konvensional', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Apabila pemberi kerja telat membayar iuran pensiun, pemberi kerja dikenakan sanksi ta''zir yang dimasukkan ke dalam dana sosial', TRUE),
    (q_id, 'Kepengurusan hanya terdiri atas pengurus dan dewan pengawas', FALSE),
    (q_id, 'Instrumen investasi yang digunakan tidak harus sesuai prinsip syariah', FALSE),
    (q_id, 'Tidak harus menggunakan akad', FALSE);

  -- Q95
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Undang-undang terkini terkait dengan Dana Pensiun adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'UU Nomor 2 Tahun 2023', FALSE),
    (q_id, 'UU Nomor 4 Tahun 2023', TRUE),
    (q_id, 'UU Nomor 5 Tahun 2023', FALSE),
    (q_id, 'UU Nomor 3 Tahun 2023', FALSE);

  -- Q96
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut merupakan cara pembayaran manfaat pensiun', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Sekaligus (lump sum)', FALSE),
    (q_id, '25% sekaligus', FALSE),
    (q_id, '75% sekaligus', FALSE),
    (q_id, 'Bulanan', TRUE);

  -- Q99
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Aktivitas mengumpulkan data dan informasi terkait kondisi Dana Pensiun merupakan salah satu bagian dari siklus pengawasan Dana Pensiun yaitu', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penilaian Tingkat Kesehatan', FALSE),
    (q_id, 'Forum panel', FALSE),
    (q_id, 'Compliance Based Supervision', FALSE),
    (q_id, 'Penyusunan Know Your Pension Fund (KYPF)', TRUE);

  -- ===========================================================================
  -- SECTION 4: Pengawasan PPDP (30 questions)
  --   20 from Bank Soal PPDP.pdf + 10 from seed_ppdp_pcs7.sql (pemeriksaan langsung)
  -- ===========================================================================
  SELECT id INTO sec_id FROM sections WHERE title = 'Pengawasan PPDP';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session, module_id, category_id)
    VALUES ('Pengawasan PPDP', sec_pos, 10, mod_id, 'ppdp')
    RETURNING id INTO sec_id;
  END IF;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- === From Bank Soal PPDP.pdf ===

  -- Q3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut adalah pernyataan yang benar, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'IAIS menerbitkan prinsip-prinsip dasar pengawasan di sektor perasuransian (Insurance Core Principle)', FALSE),
    (q_id, 'IAIS merupakan Lembaga internasional untuk pengawas di sektor perasuransian', FALSE),
    (q_id, 'IOPS merupakan Lembaga internasional untuk pengawas di sektor dana pensiun swasta', FALSE),
    (q_id, 'IOPS merupakan lembaga internasional untuk pengawas sistem pensiun termasuk sistem jaminan sosial', TRUE);

  -- Q10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut adalah Undang-Undang yang mengatur sektor Perasuransian, Penjaminan dan Dana Pensiun, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'UU no 4 tahun 2023', FALSE),
    (q_id, 'UU no 1 tahun 2016', FALSE),
    (q_id, 'UU no 10 tahun 1998', TRUE),
    (q_id, 'UU no 40 tahun 2014', FALSE);

  -- Q27
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Ketentuan pidana bidang PPDP terkait program penjaminan polis dalam UU P2SK mencakup', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Laporan', FALSE),
    (q_id, 'Penyalahgunaan aset', FALSE),
    (q_id, 'Perizinan', FALSE),
    (q_id, 'Proses likuidasi', TRUE);

  -- Q28
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pihak yang hadir dalam kegiatan forum panel pengawasan LJKNB berbasis risiko adalah, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pengawas', FALSE),
    (q_id, 'Perusahaan / Lembaga Jasa Keuangan Nonbank', TRUE),
    (q_id, 'Sekretariat Forum Panel pengawasan berbasis risiko', FALSE),
    (q_id, 'Panelis', FALSE);

  -- Q30
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Anggota Komite Pengawasan LJKNB adalah, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Deputi Komisioner', FALSE),
    (q_id, 'Direktur', FALSE),
    (q_id, 'Kepala Departemen', TRUE),
    (q_id, 'Kepala Eksekutif IKNB (PPDP/PVML)', FALSE);

  -- Q32
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Yang bukan merupakan tahapan pelaksanaan pemeriksaan khusus adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penyusunan laporan hasil pemeriksaan khusus', FALSE),
    (q_id, 'Pelaksanaan pemeriksaan khusus', FALSE),
    (q_id, 'Evaluasi hasil pemeriksaan khusus', TRUE),
    (q_id, 'Perencanaan pemeriksaan khusus', FALSE);

  -- Q36
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dalam Surat Edaran Dewan Komisioner OJK tentang Pedoman Pelaksanaan Pengendalian Kualitas (Quality Assurance) Dalam Rangka Pengawasan Lembaga Jasa Keuangan Nonbank Berbasis Risiko Melalui Forum Panel Pengawasan Lembaga Jasa Keuangan Nonbank Berbasis Risiko, Lembaga Jasa Keuangan Nonbank yang dimaksud, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perusahaan Penilai Kerugian', TRUE),
    (q_id, 'Perusahaan Asuransi dan Perusahaan Reasuransi', FALSE),
    (q_id, 'Perusahaan Pembiayaan', FALSE),
    (q_id, 'Dana Pensiun', FALSE);

  -- Q39
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dalam melakukan tindak lanjut atas permohonan penilaian kemampuan dan kepatutan, Sekretariat Penilaian Kemampuan dan Kepatutan dapat memutuskan untuk melakukan/tidak dilakukan klarifikasi/wawancara atas calon Pihak Utama. Manakah pernyataan di bawah ini yang benar mengenai alasan seorang calon Pihak Utama tidak perlu dilakukan klarifikasi/wawancara', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Calon Pihak Utama belum mempunyai pengalaman pada PPDP di Indonesia yang relevan dengan jabatan yang dituju', FALSE),
    (q_id, 'Calon Pihak Utama pernah ditetapkan tidak disetujui dalam pencalonan sebelumnya', FALSE),
    (q_id, 'Calon Pihak Utama yang diajukan berasal dari PPDP yang masuk kategori LJKNB Utama', FALSE),
    (q_id, 'Tidak terdapat informasi negatif mengenai calon Pihak Utama', TRUE);

  -- Q40
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut ini manakah yang tidak termasuk ke dalam dasar hukum penilaian kemampuan dan kepatutan di bidang pengawasan PPDP', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'SEOJK Nomor 23/SEOJK.05/2023', FALSE),
    (q_id, 'POJK Nomor 27/POJK.03/2016', FALSE),
    (q_id, 'POJK Nomor 23 Tahun 2023', TRUE),
    (q_id, 'SEDK Nomor 3/SEDK.05/2023', FALSE);

  -- Q41
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa lama waktu yang diberikan oleh peraturan perundang-undangan (cooling off period) untuk pengajuan kembali penilaian kemampuan dan kepatutan apabila diketahui suatu calon Pihak Utama tidak disetujui dalam penilaian kemampuan dan kepatutan sebelumnya', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '6 bulan', TRUE),
    (q_id, 'Tidak ada pengaturan mengenai hal dimaksud', FALSE),
    (q_id, '3 bulan', FALSE),
    (q_id, '12 bulan', FALSE);

  -- Q42
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Sumber informasi apa yang digunakan oleh Sekretariat Penilaian Kemampuan dan Kepatutan dalam melakukan penelaahan administratif atas aspek integritas dan reputasi keuangan', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'SLIK', FALSE),
    (q_id, 'Semua Benar', TRUE),
    (q_id, 'Pencarian Dalam Direktori Putusan Mahkamah Agung terkait perkara kepailitan', FALSE),
    (q_id, 'SIPUTRI', FALSE);

  -- Q45
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Tujuan penanganan dugaan tindak pidana yang dilakukan oleh unit kerja Pemeriksaan Khusus PPDP adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengidentifikasi pengaruh tindak pidana terhadap kinerja dan/atau kelangsungan usaha pelaku usaha PPDP', FALSE),
    (q_id, 'Memastikan apakah terdapat dugaan tindak pidana', FALSE),
    (q_id, 'Menentukan tindak lanjut pengawasan yang diperlukan', FALSE),
    (q_id, 'Memastikan pemenuhan bukti yang relevan', TRUE);

  -- Q47
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dalam hal OJK telah menyetujui hasil penilaian kemampuan dan kepatutan bagi calon Direksi di Perusahaan PPDP, berapa lama waktu yang dibutuhkan oleh PPDP tersebut untuk mengangkat calon Pihak Utama dimaksud dalam jabatan definitif', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '6 bulan', FALSE),
    (q_id, 'Tidak ada pengaturan mengenai hal dimaksud', FALSE),
    (q_id, '3 bulan', TRUE),
    (q_id, '1 bulan', FALSE);

  -- Q48
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Penyelesaian pelanggaran oleh terlapor diatur pada', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pasal 48 A UU P2SK', FALSE),
    (q_id, 'Pasal 49 A UU P2SK', FALSE),
    (q_id, 'Pasal 48 B UU P2SK', TRUE),
    (q_id, 'Pasal 49 B UU P2SK', FALSE);

  -- Q50
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Syarat penanganan informasi awal dugaan tindak pidana dapat dilimpahkan ke Riksus PPDP adalah... (kecuali)', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Terdapat keyakinan bahwa informasi awal Dugaan Tindak Pidana merupakan dugaan Tindak Pidana', FALSE),
    (q_id, 'Telah memperoleh dokumen pendukung yang relevan dan memadai dengan dugaan Tindak Pidana', FALSE),
    (q_id, 'Pelaku yang diduga melakukan tindak pidana tidak memiliki itikad baik', FALSE),
    (q_id, 'Pelaku yang diduga melakukan tindak pidana tidak memenuhi kualifikasi pelaku Tindak Pidana sebagaimana diatur dalam ketentuan mengenai sanksi pidana', TRUE);

  -- Q58
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dasar Hukum yang Mengatur Jaminan Kesehatan', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'UUD 1945 pasal 28', FALSE),
    (q_id, 'Undang Undang No 40 Tahun 2004', FALSE),
    (q_id, 'Perpres No 82 Tahun 2018', TRUE),
    (q_id, 'Peraturan Pemerintah No 86 Tahun 2013', FALSE);

  -- Q77
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut adalah unit kerja yang dapat mengajukan permohonan pendampingan pemeriksaan on-site kepada Satuan Kerja KSPA, kecuali', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Direktorat Pengawasan Lembaga Pembiayaan, Perusahaan Modal Ventura dan Lembaga Keuangan Khusus (DPVL)', TRUE),
    (q_id, 'Direktorat Pengawasan Khusus Perasuransian, Penjaminan dan Dana Pensiun', FALSE),
    (q_id, 'Direktorat Pengawasan Asuransi Umum dan Reasuransi (DPAR)', FALSE),
    (q_id, 'Direktorat Pengawasan Asuransi Jiwa', FALSE);

  -- Q81
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Besaran nominal maksimal total santunan meninggal pada program JKM sebesar', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '174 juta rupiah', FALSE),
    (q_id, '50 juta rupiah', FALSE),
    (q_id, '175 juta rupiah', FALSE),
    (q_id, '42 juta rupiah', TRUE);

  -- Q87
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut ini yang termasuk dalam ruang lingkup pengawasan BPJS Ketenagakerjaan oleh OJK, adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pengelolaan dan Kinerja Investasi', FALSE),
    (q_id, 'Semua benar', TRUE),
    (q_id, 'Penerapan Manajemen Risiko', FALSE),
    (q_id, 'Perlindungan Konsumen', FALSE);

  -- Q90
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dasar hukum sistem jaminan sosial nasional adalah', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Undang-Undang Nomor 4 Tahun 2008 tentang Sistem Jaminan Sosial Nasional', FALSE),
    (q_id, 'Undang-Undang Nomor 41 Tahun 2004 tentang Sistem Jaminan Sosial Nasional', FALSE),
    (q_id, 'Undang-Undang Nomor 40 Tahun 2004 tentang Sistem Jaminan Sosial Nasional', TRUE),
    (q_id, 'Undang-Undang Nomor 14 Tahun 2004 tentang Sistem Jaminan Sosial Nasional', FALSE);

  -- === From seed_ppdp_pcs7.sql — Pengawasan Proses Bisnis (Q1–Q10) ===

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dasar Hukum pelaksanaan pengawasan Perusahaan Penjaminan adalah:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'POJK Nomor 11/POJK.05/2014 tahun 2014', FALSE),
    (q_id, 'POJK Nomor 2/POJK.05/2017 tahun 2017', FALSE),
    (q_id, 'POJK Nomor 30/POJK.05/2018 tahun 2018', TRUE),
    (q_id, 'POJK 30/POJK.05/2020 tahun 2020', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pelaksanaan Pemeriksaan Langsung pada Perusahaan Penjaminan dilakukan secara berkala dengan frekuensi:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Frekuensi 1 (satu) kali dalam 3 (tiga) tahun', FALSE),
    (q_id, 'Frekuensi 1 (satu) kali dalam 2 (dua) tahun', FALSE),
    (q_id, 'Frekuensi 1 (satu) kali dalam 1 (satu) tahun', FALSE),
    (q_id, 'Jawaban semua benar', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut langkah-langkah yang dilakukan pada waktu pemeriksaan langsung, kecuali:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penyiapan Laporan Hasil Analisis', TRUE),
    (q_id, 'Penyusunan Rencana Kerja Pemeriksaan Langsung', FALSE),
    (q_id, 'Penyiapan Dokumen Pemeriksaan Langsung', FALSE),
    (q_id, 'Pelaksanaan Pemeriksaan Langsung', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Aspek-aspek dalam melakukan Pemeriksaan Langsung pada Perusahaan Penjaminan adalah, kecuali:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kelembagaan', FALSE),
    (q_id, 'Keuangan', FALSE),
    (q_id, 'Pelaksanaan Tata Kelola Perusahaan Yang Baik', FALSE),
    (q_id, 'Profil Risiko', TRUE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Hal-hal apa saja yang perlu disiapkan dalam tahapan persiapan pemeriksaan:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengumpulkan dokumen pemeriksaan', FALSE),
    (q_id, 'Wawancara', FALSE),
    (q_id, 'Penyiapan dokumen Audit Program', TRUE),
    (q_id, 'Pembahasan Matriks Pemeriksaan', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Tujuan penyusunan KKP, kecuali:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mendukung kesimpulan yang telah diambil Pemeriksa', FALSE),
    (q_id, 'Bukti bahwa Pemeriksa telah melaksanakan Pemeriksaan Langsung sesuai program Pemeriksaan Langsung (audit program)', FALSE),
    (q_id, 'Penyusunan Berita Acara Pemeriksaan', TRUE),
    (q_id, 'Sebagai pegangan untuk Pemeriksaan Langsung berikutnya', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Hal-hal yang diperlukan untuk persiapan Pra Exit Meeting adalah:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Bahan Matriks Pemeriksaan', TRUE),
    (q_id, 'Dokumen', FALSE),
    (q_id, 'Bahan Berita Pemeriksaan', FALSE),
    (q_id, 'Surat Tugas', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Kelengkapan dokumen sebelum pelaksanaan pemeriksaan, kecuali:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Surat Tugas', FALSE),
    (q_id, 'Matriks Pemeriksaan', FALSE),
    (q_id, 'Surat Perintah', TRUE),
    (q_id, 'Surat Pemberitahuan', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Isi Laporan Hasil Pemeriksaan Langsung memuat:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tujuan Pemeriksaan Langsung, Ruang Lingkup Pemeriksaan Langsung, Tempat Pemeriksaan Langsung, Jangka Waktu Pemeriksaan, Hasil Pemeriksaan, Kesimpulan, Rekomendasi dan Saran', FALSE),
    (q_id, 'Tujuan Pemeriksaan Langsung, Ruang Lingkup Pemeriksaan Langsung, Periode Pelaksanaan Pemeriksaan Langsung, Jangka Waktu Pemeriksaan, Hasil Pemeriksaan, Tanggapan perusahaan, Rekomendasi dan Saran', FALSE),
    (q_id, 'Tujuan Pemeriksaan Langsung, Ruang Lingkup Pemeriksaan Langsung, Periode Pelaksanaan Pemeriksaan Langsung, Jangka Waktu Pemeriksaan, Hasil Pemeriksaan, Kesimpulan, Rekomendasi dan Saran', TRUE),
    (q_id, 'Audit Program, Ruang Lingkup Pemeriksaan Langsung, Periode Pelaksanaan Pemeriksaan Langsung, Jangka Waktu Pemeriksaan, Hasil Pemeriksaan, Kesimpulan, Rekomendasi dan Saran', FALSE);

  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'LHPL ditandatangani oleh Tim Pemeriksa, kecuali:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Anggota Tim', FALSE),
    (q_id, 'Ketua Tim', FALSE),
    (q_id, 'Penyelia Tim', FALSE),
    (q_id, 'Deputi Komisioner', TRUE);

END $$;
