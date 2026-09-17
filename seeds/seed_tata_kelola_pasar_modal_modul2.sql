DO $$
DECLARE
  sec_id INT;
  mod_id INT;
BEGIN
  -- New source
  INSERT INTO question_sources (id, label) VALUES ('kisi_kisi', 'Kisi-Kisi')
  ON CONFLICT (id) DO NOTHING;

  -- New category
  INSERT INTO section_categories (id, label) VALUES ('tata_kelola', 'Tata Kelola')
  ON CONFLICT (id) DO NOTHING;

  SELECT id INTO mod_id FROM modules WHERE number = 2;

  INSERT INTO sections (title, position, draw_per_session, is_active, module_id, category_id)
  VALUES ('Tata Kelola Pasar Modal', 41, 10, TRUE, mod_id, 'tata_kelola')
  RETURNING id INTO sec_id;

  -- Q1 (original)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Komite Nominasi dan Remunerasi diketuai oleh?', 1, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Direktur Utama', FALSE),
    ((SELECT id FROM q), 'Dewan Komisaris', FALSE),
    ((SELECT id FROM q), 'Direksi', FALSE),
    ((SELECT id FROM q), 'Komisaris Independen', TRUE);

  -- Q2 (original)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'OECD Principle on Corporate Governance saat ini mengalami perkembangan dalam versi 2023 (ongoing revision). Manakah prinsip baru yang tidak terdapat dalam versi 2015?', 2, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'The rights and equitable treatment of shareholders and key ownership functions', FALSE),
    ((SELECT id FROM q), 'Sustainability and resilience', TRUE),
    ((SELECT id FROM q), 'Institutional investors, stock markets and other intermediaries', FALSE),
    ((SELECT id FROM q), 'Disclosure and transparency', FALSE);

  -- Q3 (original)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Berapa syarat keanggotaan Komisaris Independen di Emiten dan Perusahaan Publik?', 3, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Minimal 30%, dalam hal Dewan Komisaris lebih dari 2 orang', TRUE),
    ((SELECT id FROM q), 'Minimal 1 orang, dalam hal Dewan Komisaris 4 orang', FALSE),
    ((SELECT id FROM q), 'Minimal 50%, dalam hal Dewan Komisaris lebih dari 2 orang', FALSE),
    ((SELECT id FROM q), 'Minimal 30%, dalam hal Dewan Komisaris lebih dari 3 orang', FALSE);

  -- Q4 (original)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Perusahaan Efek dalam menyusun Rencana Bisnis wajib memperhatikan?', 4, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Kondisi Keuangan', FALSE),
    ((SELECT id FROM q), 'Pandangan Otoritas', FALSE),
    ((SELECT id FROM q), 'Rencana Strategis, Faktor Internal Eksternal, Prinsip Kehati-hatian, dan Penerapan Manajemen Risiko', TRUE),
    ((SELECT id FROM q), 'Arahan Komisaris', FALSE);

  -- Q5 (original)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Di bawah ini merupakan dasar hukum tata kelola Perusahaan Efek...', 5, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'POJK 15/POJK.04/2020', FALSE),
    ((SELECT id FROM q), 'POJK 57/POJK.04/2017', TRUE),
    ((SELECT id FROM q), 'POJK 33/POJK.04/2014', FALSE),
    ((SELECT id FROM q), 'POJK 3/POJK.04/2021', FALSE);

  -- Q6 (original)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Rencana Bisnis Perusahaan Efek wajib disampaikan kepada OJK dalam jangka waktu:', 6, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Setiap 2x dalam 1 tahun', FALSE),
    ((SELECT id FROM q), 'Setiap 1x dalam 1 tahun', TRUE),
    ((SELECT id FROM q), 'Setiap 1x dalam 2 tahun', FALSE),
    ((SELECT id FROM q), 'Seketika jika diperlukan', FALSE);

  -- Q7 (original)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Penilaian integritas dan kelayakan keuangan pemegang saham Manajer Investasi dilakukan melalui:', 7, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Fit and Proper Test oleh Otoritas Jasa Keuangan', TRUE),
    ((SELECT id FROM q), 'Penilaian Laporan Keuangan', FALSE),
    ((SELECT id FROM q), 'Penilaian Dokumen', FALSE),
    ((SELECT id FROM q), 'Pemeriksaan Langsung', FALSE);

  -- Q8 (original)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Berikut ini adalah Peringkat Komposit Tingkat Kesehatan Manajer Investasi, kecuali...', 8, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Peringkat Komposit 1: Tata kelola diimplementasikan dengan sangat baik di mana seluruh atau hampir seluruh indikator tata kelola telah dipenuhi', FALSE),
    ((SELECT id FROM q), 'Peringkat Komposit 2: Tata kelola diimplementasikan dengan baik di mana sebagian besar indikator tata kelola telah dipenuhi', FALSE),
    ((SELECT id FROM q), 'Peringkat Komposit 3: Tata kelola diimplementasikan dengan cukup baik di mana sebagian indikator tata kelola telah dipenuhi', FALSE),
    ((SELECT id FROM q), 'Peringkat Komposit 4: Tata kelola diimplementasikan dengan tidak baik di mana hampir seluruh indikator tata kelola tidak dipenuhi', TRUE);

  -- Q9 (original)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Manajer Investasi Syariah atau Manajer Investasi yang memiliki unit pengelolaan investasi syariah wajib memiliki DPS, yaitu singkatan dari:', 9, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Dewan Pemeriksa Syariah', FALSE),
    ((SELECT id FROM q), 'Dewan Penerjemah Syariah', FALSE),
    ((SELECT id FROM q), 'Dewan Pengawas Syariah', TRUE),
    ((SELECT id FROM q), 'Dewan Penguji Syariah', FALSE);

  -- Q10 (original)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Penyampaian laporan pelaksanaan rencana tindak disampaikan paling lambat … setelah target waktu penyelesaian rencana tindak (action plan).', 10, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), '5 hari kerja', FALSE),
    ((SELECT id FROM q), '10 hari kerja', TRUE),
    ((SELECT id FROM q), '15 hari kerja', FALSE),
    ((SELECT id FROM q), '20 hari kerja', FALSE);

  -- Q11 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Frekuensi rapat Direksi Manajer Investasi paling sedikit dilaksanakan...', 11, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), '1 kali setiap bulan', FALSE),
    ((SELECT id FROM q), '1 kali setiap 2 bulan', TRUE),
    ((SELECT id FROM q), '1 kali setiap 3 bulan', FALSE),
    ((SELECT id FROM q), '1 kali setiap 6 bulan', FALSE);

  -- Q12 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Frekuensi rapat Dewan Komisaris Manajer Investasi paling sedikit dilaksanakan...', 12, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), '1 kali setiap bulan', FALSE),
    ((SELECT id FROM q), '1 kali setiap 2 bulan', FALSE),
    ((SELECT id FROM q), '1 kali setiap 3 bulan', TRUE),
    ((SELECT id FROM q), '1 kali setiap 4 bulan', FALSE);

  -- Q13 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Manajer Investasi Syariah wajib memiliki DPS. Berapa jumlah minimum anggota DPS dan apa syarat utamanya?', 13, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Minimal 2 orang yang berstatus sebagai ulama MUI', FALSE),
    ((SELECT id FROM q), 'Minimal 1 orang atau lebih yang memiliki izin ASPM', TRUE),
    ((SELECT id FROM q), 'Minimal 2 orang yang ditunjuk oleh Dewan Komisaris', FALSE),
    ((SELECT id FROM q), 'Minimal 1 orang yang memiliki gelar akademik di bidang ekonomi syariah', FALSE);

  -- Q14 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Stewardship dalam konteks Manajer Investasi didefinisikan sebagai...', 14, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Kewajiban MI untuk menyampaikan laporan kinerja reksa dana kepada OJK setiap kuartal', FALSE),
    ((SELECT id FROM q), 'Mekanisme pengawasan internal MI terhadap seluruh kegiatan operasional perusahaan', FALSE),
    ((SELECT id FROM q), 'Bentuk pertanggungjawaban Manajer Investasi (fiduciary duties) atas dana kelolaan yang dipercayakan Nasabah atau penerima manfaat', TRUE),
    ((SELECT id FROM q), 'Hak MI untuk menggunakan hak suara atas efek yang ada dalam portofolio reksa dana', FALSE);

  -- Q15 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Situs web Manajer Investasi wajib memuat paling sedikit tiga jenis informasi. Ketiga informasi tersebut adalah...', 15, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Informasi produk, informasi pasar modal, dan informasi regulasi OJK', FALSE),
    ((SELECT id FROM q), 'Informasi umum, informasi bagi nasabah, dan informasi tata kelola', TRUE),
    ((SELECT id FROM q), 'Informasi keuangan, informasi direksi, dan informasi komisaris', FALSE),
    ((SELECT id FROM q), 'Informasi reksa dana, informasi NAB harian, dan informasi laporan tahunan', FALSE);

  -- Q16 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Sebuah Manajer Investasi mendapatkan nilai self assessment Tata Kelola sebesar 82. Peringkat Komposit yang tepat adalah...', 16, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Peringkat Komposit 1', FALSE),
    ((SELECT id FROM q), 'Peringkat Komposit 2', TRUE),
    ((SELECT id FROM q), 'Peringkat Komposit 3', FALSE),
    ((SELECT id FROM q), 'Peringkat Komposit 4', FALSE);

  -- Q17 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'MI dengan Peringkat Komposit berapa yang wajib menyusun Rencana Tindak (action plan)?', 17, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Peringkat Komposit 3 dan 4', FALSE),
    ((SELECT id FROM q), 'Peringkat Komposit 4 dan 5', TRUE),
    ((SELECT id FROM q), 'Peringkat Komposit 2, 3, dan 4', FALSE),
    ((SELECT id FROM q), 'Semua peringkat komposit', FALSE);

  -- Q18 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Frekuensi rapat Direksi Perusahaan Efek paling sedikit, serta kewajiban pelatihan Direksi PE adalah...', 18, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Rapat 1x/bulan; pelatihan 1x/tahun', FALSE),
    ((SELECT id FROM q), 'Rapat 1x/2 bulan; pelatihan 1x/2 tahun', TRUE),
    ((SELECT id FROM q), 'Rapat 1x/3 bulan; pelatihan 1x/tahun', FALSE),
    ((SELECT id FROM q), 'Rapat 1x/2 bulan; pelatihan 1x/tahun', FALSE);

  -- Q19 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Komposisi Dewan Komisaris Perusahaan Efek mengikuti ketentuan berikut, KECUALI...', 19, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Jumlah anggota Dewan Komisaris harus lebih kecil dari jumlah anggota Direksi', FALSE),
    ((SELECT id FROM q), 'Wajib memiliki Komisaris Independen', FALSE),
    ((SELECT id FROM q), 'Minimal 2 orang, salah satunya Komisaris Utama', TRUE),
    ((SELECT id FROM q), 'Jika DK lebih dari 2 orang, Komisaris Independen wajib minimal 30%', FALSE);

  -- Q20 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Perusahaan Efek yang mengadministrasikan rekening Efek nasabah (PPE) wajib membentuk fungsi-fungsi tambahan berikut, kecuali...', 20, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Fungsi pemasaran', FALSE),
    ((SELECT id FROM q), 'Fungsi pembukuan', FALSE),
    ((SELECT id FROM q), 'Fungsi kustodian', FALSE),
    ((SELECT id FROM q), 'Fungsi manajemen risiko', TRUE);

  -- Q21 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Dalam struktur pengendalian internal PE, fungsi yang dapat dialihkan kepada penyedia jasa berbentuk badan hukum adalah...', 21, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Fungsi Manajemen Risiko, Kepatuhan, dan Audit Internal', FALSE),
    ((SELECT id FROM q), 'Fungsi Investasi dan Riset', FALSE),
    ((SELECT id FROM q), 'Fungsi Akuntansi & Keuangan dan Fungsi Pengembangan Sumber Daya Manusia', TRUE),
    ((SELECT id FROM q), 'Fungsi Pemasaran dan Fungsi Perdagangan', FALSE);

  -- Q22 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Frekuensi rapat berkala Direksi dan Dewan Komisaris Emiten/Perusahaan Publik adalah...', 22, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Direksi: min 1x/2 bulan; Dewan Komisaris: min 1x/3 bulan', FALSE),
    ((SELECT id FROM q), 'Direksi: min 1x/bulan; Dewan Komisaris: min 1x/2 bulan', TRUE),
    ((SELECT id FROM q), 'Direksi: min 1x/bulan; Dewan Komisaris: min 1x/bulan', FALSE),
    ((SELECT id FROM q), 'Direksi: min 1x/2 bulan; Dewan Komisaris: min 1x/2 bulan', FALSE);

  -- Q23 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Manakah yang BUKAN merupakan syarat Komisaris Independen di Emiten dan Perusahaan Publik?', 23, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Bukan orang yang bekerja atau mempunyai wewenang untuk merencanakan, memimpin, mengendalikan, atau mengawasi kegiatan Emiten dalam 6 bulan terakhir', FALSE),
    ((SELECT id FROM q), 'Tidak mempunyai saham baik langsung maupun tidak langsung pada Emiten', FALSE),
    ((SELECT id FROM q), 'Tidak mempunyai hubungan afiliasi dengan Emiten, DK, Direksi, atau pemegang saham utama', FALSE),
    ((SELECT id FROM q), 'Wajib memiliki pengalaman minimal 5 tahun di industri yang sama dengan Emiten', TRUE);

  -- Q24 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Peran utama Komite Audit adalah membantu Dewan Komisaris dalam menjalankan fungsi pengawasan terhadap...', 24, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Pengelolaan sumber daya manusia dan kebijakan remunerasi Direksi', FALSE),
    ((SELECT id FROM q), 'Efektivitas pelaksanaan pengelolaan risiko, pelaporan keuangan, pengendalian internal, dan tata kelola perusahaan', TRUE),
    ((SELECT id FROM q), 'Proses nominasi calon anggota Direksi dan Dewan Komisaris', FALSE),
    ((SELECT id FROM q), 'Keterbukaan informasi dan hubungan dengan pemegang saham', FALSE);

  -- Q25 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Keanggotaan Komite Audit terdiri dari minimal...', 25, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), '2 orang, diketuai oleh Direktur Utama', FALSE),
    ((SELECT id FROM q), '3 orang yang berasal dari Komisaris Independen dan pihak dari luar Emiten; diketuai Komisaris Independen', TRUE),
    ((SELECT id FROM q), '3 orang anggota Dewan Komisaris; diketuai Komisaris Utama', FALSE),
    ((SELECT id FROM q), '2 orang Komisaris Independen dan 1 orang dari luar Emiten; diketuai Komisaris Utama', FALSE);

  -- Q26 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Salah satu tugas Sekretaris Perusahaan yang dihighlight sebagai kewajiban utama adalah...', 26, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Menyusun Rencana Bisnis tahunan perusahaan bersama Direksi', FALSE),
    ((SELECT id FROM q), 'Membantu Direksi dan Dewan Komisaris dalam pelaksanaan tata kelola seperti keterbukaan informasi, pelaporan, RUPS, dokumentasi, dan orientasi Direksi dan Komisaris', TRUE),
    ((SELECT id FROM q), 'Melakukan audit internal atas kepatuhan perusahaan terhadap regulasi pasar modal', FALSE),
    ((SELECT id FROM q), 'Mengelola hubungan dengan investor institusional dan analis pasar modal', FALSE);

  -- Q27 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Bukti pemanggilan dan risalah RUPS Perusahaan Efek wajib disampaikan ke OJK paling lambat...', 27, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), '2 hari kerja setelah penyelenggaraan RUPS', FALSE),
    ((SELECT id FROM q), '5 hari kerja setelah penyelenggaraan RUPS', FALSE),
    ((SELECT id FROM q), '7 hari kerja setelah penyelenggaraan RUPS', TRUE),
    ((SELECT id FROM q), '14 hari setelah penyelenggaraan RUPS', FALSE);

  -- Q28 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Laporan Penerapan Tata Kelola Perusahaan Efek paling sedikit memuat tiga hal. Manakah yang BUKAN termasuk di dalamnya?', 28, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Aspek Transparansi', FALSE),
    ((SELECT id FROM q), 'Hasil Penilaian Sendiri (self assessment) atas penerapan Tata Kelola', FALSE),
    ((SELECT id FROM q), 'Rencana Tindak (action plan) untuk Peringkat Komposit 4 dan 5', FALSE),
    ((SELECT id FROM q), 'Laporan keuangan yang telah diaudit oleh akuntan publik', TRUE);

  -- Q29 (kisi_kisi)
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Prinsip Comply or Explain dalam Pedoman Tata Kelola Perusahaan Terbuka berarti...', 29, 'kisi_kisi')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Perusahaan Terbuka wajib mematuhi semua rekomendasi pedoman tanpa pengecualian', FALSE),
    ((SELECT id FROM q), 'Perusahaan Terbuka wajib menerapkan pedoman; jika tidak menerapkan wajib memberikan penjelasan alasannya', TRUE),
    ((SELECT id FROM q), 'OJK wajib menjelaskan kepada perusahaan alasan suatu rekomendasi diberlakukan', FALSE),
    ((SELECT id FROM q), 'Perusahaan boleh memilih untuk patuh atau membayar denda sebagai pengganti kepatuhan', FALSE);

END $$;
