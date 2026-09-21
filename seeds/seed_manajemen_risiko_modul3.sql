-- seed_manajemen_risiko_modul3.sql
-- Modul 3: Manajemen Risiko — latihan soal
-- Source: ringkasan modul-3-mr.md & modul-3-cyber.md
-- Sections: 4 sections | Source: original | Module: 3
-- Total questions: ~70

DO $$
DECLARE
  mod_id  INTEGER;
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN

  SELECT id INTO mod_id FROM modules WHERE number = 3;

  -- ===========================================================================
  -- SECTION 1: Konsep & Kerangka Manajemen Risiko (~20 questions)
  -- ===========================================================================
  SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
  INSERT INTO sections (title, position, module_id, is_active)
  VALUES ('Konsep & Kerangka Manajemen Risiko', sec_pos, mod_id, true)
  RETURNING id INTO sec_id;
  pos := 0;

  -- Q1
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Apa yang dimaksud dengan "Risiko" dalam konteks manajemen risiko organisasi?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kepastian terjadinya kerugian finansial yang berdampak pada laporan keuangan', FALSE),
    (q_id, 'Kemungkinan terjadinya suatu peristiwa yang berdampak negatif terhadap pencapaian tujuan organisasi', TRUE),
    (q_id, 'Setiap aktivitas operasional yang dilakukan oleh unit bisnis tanpa persetujuan manajemen', FALSE),
    (q_id, 'Kegagalan sistem teknologi informasi yang mengganggu layanan kepada nasabah', FALSE),
    (q_id, 'Kondisi pasar yang tidak menguntungkan bagi kinerja portofolio investasi', FALSE);

  -- Q2
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Yang dimaksud dengan "Risk Universe" dalam manajemen risiko SJK adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Daftar seluruh counterparty dan debitur yang memiliki eksposur kredit besar', FALSE),
    (q_id, 'Laporan agregat risiko yang disampaikan kepada OJK setiap triwulan', FALSE),
    (q_id, 'Keseluruhan spektrum risiko yang berpotensi mempengaruhi SJK, mencakup risiko internal dan eksternal', TRUE),
    (q_id, 'Sistem informasi manajemen risiko berbasis teknologi yang digunakan oleh lembaga keuangan', FALSE),
    (q_id, 'Panduan regulasi yang diterbitkan OJK mengenai jenis-jenis risiko yang wajib dikelola', FALSE);

  -- Q3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa tahap dalam siklus manajemen risiko yang berulang secara berkesinambungan?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '3 tahap', FALSE),
    (q_id, '4 tahap', TRUE),
    (q_id, '5 tahap', FALSE),
    (q_id, '6 tahap', FALSE),
    (q_id, '2 tahap', FALSE);

  -- Q4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Urutan yang benar dari siklus manajemen risiko adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pengukuran → Identifikasi → Pemantauan → Pengendalian', FALSE),
    (q_id, 'Identifikasi → Pengendalian → Pengukuran → Pemantauan', FALSE),
    (q_id, 'Identifikasi → Pengukuran → Pemantauan → Pengendalian', TRUE),
    (q_id, 'Pemantauan → Identifikasi → Pengukuran → Pengendalian', FALSE),
    (q_id, 'Identifikasi → Pemantauan → Pengukuran → Pengendalian', FALSE);

  -- Q5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa jumlah Pilar Manajemen Risiko yang ditetapkan OJK?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '3 pilar', FALSE),
    (q_id, '5 pilar', FALSE),
    (q_id, '4 pilar', TRUE),
    (q_id, '6 pilar', FALSE),
    (q_id, '2 pilar', FALSE);

  -- Q6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pilar pertama dalam kerangka Manajemen Risiko OJK adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kecukupan Proses & Sistem', FALSE),
    (q_id, 'Pengendalian Intern yang Menyeluruh', FALSE),
    (q_id, 'Kecukupan Kebijakan & Prosedur', FALSE),
    (q_id, 'Pengawasan Aktif oleh Dewan Komisaris dan Direksi', TRUE),
    (q_id, 'Pelaporan Risiko kepada Regulator', FALSE);

  -- Q7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Matriks risiko yang digunakan dalam pengukuran risiko menggunakan skala berapa kali berapa?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '3×3', FALSE),
    (q_id, '4×4', FALSE),
    (q_id, '5×5', TRUE),
    (q_id, '6×6', FALSE),
    (q_id, '10×10', FALSE);

  -- Q8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa level risiko yang ada dalam matriks risiko 5×5?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '3 level', FALSE),
    (q_id, '4 level', FALSE),
    (q_id, '5 level', TRUE),
    (q_id, '6 level', FALSE),
    (q_id, '7 level', FALSE);

  -- Q9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pada matriks risiko 5×5, skor risiko dihitung dengan cara...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kemungkinan + Dampak', FALSE),
    (q_id, 'Kemungkinan × Dampak', TRUE),
    (q_id, 'Kemungkinan / Dampak', FALSE),
    (q_id, '(Kemungkinan + Dampak) / 2', FALSE),
    (q_id, 'Dampak − Kemungkinan', FALSE);

  -- Q10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pada skala kemungkinan (Likelihood), skor 1 menunjukkan level risiko...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Sangat Sering (>70% kemungkinan)', FALSE),
    (q_id, 'Sering (41–70% kemungkinan)', FALSE),
    (q_id, 'Kadang (11–40% kemungkinan)', FALSE),
    (q_id, 'Jarang (1–10% kemungkinan)', FALSE),
    (q_id, 'Sangat Jarang (<1% kemungkinan)', TRUE);

  -- Q11
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pada skala dampak (Impact), skor 5 menunjukkan tingkat dampak...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tidak Signifikan — dampak minimal, tidak mengganggu operasional', FALSE),
    (q_id, 'Kecil — dampak kecil, bisa ditangani rutin', FALSE),
    (q_id, 'Sedang — memerlukan intervensi manajemen', FALSE),
    (q_id, 'Besar — mengganggu pencapaian tujuan utama', FALSE),
    (q_id, 'Katastrofik — mengancam keberlangsungan organisasi', TRUE);

  -- Q12
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pada matriks risiko 5×5, skor berapa yang menghasilkan level risiko "Sangat Tinggi" (warna Merah)?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '1–4', FALSE),
    (q_id, '5–9', FALSE),
    (q_id, '10–14', FALSE),
    (q_id, '15–19', FALSE),
    (q_id, '20–25', TRUE);

  -- Q13
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Tindakan yang diperlukan ketika level risiko berada di zona "Sangat Tinggi" (Merah) adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Terima dan monitor secara rutin tanpa tindakan khusus', FALSE),
    (q_id, 'Monitor dengan prosedur standar yang sudah ada', FALSE),
    (q_id, 'Mitigasi aktif diperlukan oleh unit manajemen menengah', FALSE),
    (q_id, 'Eskalasi ke manajemen senior dan lakukan mitigasi', FALSE),
    (q_id, 'Tindakan segera, eskalasi ke Direksi dan Dewan Komisaris', TRUE);

  -- Q14
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Yang dimaksud dengan "Inherent Risk" adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko setelah seluruh kontrol mitigasi diterapkan', FALSE),
    (q_id, 'Risiko sebelum kontrol diterapkan, dinilai berdasarkan kompleksitas bisnis dan kondisi eksternal', TRUE),
    (q_id, 'Risiko yang tidak dapat dimitigasi dan harus diterima organisasi', FALSE),
    (q_id, 'Risiko yang berasal dari faktor internal seperti kegagalan proses dan sistem', FALSE),
    (q_id, 'Risiko minimum yang wajib dilaporkan kepada regulator OJK', FALSE);

  -- Q15
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Formula konseptual Residual Risk adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Residual Risk = Inherent Risk + Efektivitas Kontrol', FALSE),
    (q_id, 'Residual Risk = Inherent Risk × Efektivitas Kontrol', FALSE),
    (q_id, 'Residual Risk = Inherent Risk − Efektivitas Kontrol', TRUE),
    (q_id, 'Residual Risk = Inherent Risk / Efektivitas Kontrol', FALSE),
    (q_id, 'Residual Risk = Efektivitas Kontrol − Inherent Risk', FALSE);

  -- Q16
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Singkatan KPMR dalam konteks manajemen risiko OJK adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kerangka Pengawasan Manajemen Risiko', FALSE),
    (q_id, 'Kualitas Penerapan Manajemen Risiko', TRUE),
    (q_id, 'Komite Pengkajian dan Monitoring Risiko', FALSE),
    (q_id, 'Kebijakan Pengendalian dan Mitigasi Risiko', FALSE),
    (q_id, 'Kriteria Penilaian Manajemen Risiko', FALSE);

  -- Q17
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Output dari proses identifikasi risiko yang berisi daftar risiko teridentifikasi beserta deskripsi, penyebab, dan dampaknya disebut...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risk Dashboard', FALSE),
    (q_id, 'Risk Appetite Statement', FALSE),
    (q_id, 'Risk Register', TRUE),
    (q_id, 'Risk Matrix', FALSE),
    (q_id, 'Risk Universe', FALSE);

  -- Q18
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dari 4 opsi respons risiko berikut, manakah yang berarti mengalihkan risiko melalui asuransi atau hedging?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Avoid', FALSE),
    (q_id, 'Reduce/Mitigate', FALSE),
    (q_id, 'Accept', FALSE),
    (q_id, 'Transfer/Share', TRUE),
    (q_id, 'Escalate', FALSE);

  -- Q19
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Opsi respons risiko "Avoid" berarti...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menerapkan kontrol untuk menurunkan kemungkinan atau dampak risiko', FALSE),
    (q_id, 'Menerima risiko karena masih dalam selera risiko yang ditetapkan', FALSE),
    (q_id, 'Mengalihkan risiko kepada pihak ketiga melalui asuransi', FALSE),
    (q_id, 'Menghentikan aktivitas yang menimbulkan risiko', TRUE),
    (q_id, 'Mengeskalasi risiko kepada manajemen senior untuk ditangani', FALSE);

  -- Q20
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Konteks yang perlu ditetapkan sebelum melakukan identifikasi risiko mencakup tiga hal, yaitu...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Konteks finansial, konteks teknologi, dan konteks regulasi', FALSE),
    (q_id, 'Konteks eksternal, konteks internal, dan konteks manajemen risiko', TRUE),
    (q_id, 'Konteks strategik, konteks operasional, dan konteks kepatuhan', FALSE),
    (q_id, 'Konteks pasar, konteks kredit, dan konteks likuiditas', FALSE),
    (q_id, 'Konteks Direksi, konteks unit bisnis, dan konteks auditor', FALSE);

  -- ===========================================================================
  -- SECTION 2: Penerapan Manajemen Risiko (~20 questions)
  -- ===========================================================================
  SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
  INSERT INTO sections (title, position, module_id, is_active)
  VALUES ('Penerapan Manajemen Risiko', sec_pos, mod_id, true)
  RETURNING id INTO sec_id;
  pos := 0;

  -- Q1
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dalam Three Lines Model, siapakah yang berperan sebagai Lini Pertama?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Fungsi Internal Audit yang memberikan assurance independen', FALSE),
    (q_id, 'Fungsi Manajemen Risiko yang menetapkan kebijakan dan metodologi', FALSE),
    (q_id, 'Unit bisnis pemilik risiko yang bertanggung jawab atas pengelolaan risiko sehari-hari', TRUE),
    (q_id, 'Dewan Komisaris yang mengawasi kebijakan risiko', FALSE),
    (q_id, 'Komite Risiko di bawah Dewan Komisaris', FALSE);

  -- Q2
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Lini Kedua dalam Three Lines Model terdiri dari...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Unit bisnis dan front office', FALSE),
    (q_id, 'Fungsi Manajemen Risiko dan Kepatuhan yang menetapkan kebijakan dan metodologi', TRUE),
    (q_id, 'Internal Audit yang melakukan assurance independen', FALSE),
    (q_id, 'Dewan Komisaris dan Komite Audit', FALSE),
    (q_id, 'OJK sebagai pengawas eksternal', FALSE);

  -- Q3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Lini Ketiga dalam Three Lines Model memberikan fungsi berupa...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pengelolaan risiko operasional sehari-hari oleh unit bisnis', FALSE),
    (q_id, 'Penetapan kebijakan dan limit risiko untuk seluruh organisasi', FALSE),
    (q_id, 'Assurance independen atas efektivitas tata kelola dan pengendalian risiko', TRUE),
    (q_id, 'Pelaporan risiko kepada OJK sesuai regulasi yang berlaku', FALSE),
    (q_id, 'Pengembangan sistem informasi manajemen risiko', FALSE);

  -- Q4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Risk Appetite Statement (RAS) adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Laporan triwulanan profil risiko yang disampaikan kepada Dewan Komisaris', FALSE),
    (q_id, 'Pernyataan formal yang mendokumentasikan selera risiko dalam bentuk kualitatif dan kuantitatif', TRUE),
    (q_id, 'Daftar limit risiko per unit bisnis yang ditetapkan oleh Direksi', FALSE),
    (q_id, 'Panduan regulasi OJK mengenai jumlah maksimum risiko yang boleh ditanggung bank', FALSE),
    (q_id, 'Laporan insiden kerugian operasional yang wajib dilaporkan kepada regulator', FALSE);

  -- Q5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Urutan hierarki selera risiko dari yang paling besar ke paling kecil adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risk Appetite > Risk Capacity > Risk Tolerance > Operational Limits', FALSE),
    (q_id, 'Risk Tolerance > Risk Appetite > Risk Capacity > Operational Limits', FALSE),
    (q_id, 'Risk Capacity > Risk Appetite > Risk Tolerance > Operational Limits', TRUE),
    (q_id, 'Operational Limits > Risk Tolerance > Risk Appetite > Risk Capacity', FALSE),
    (q_id, 'Risk Capacity > Risk Tolerance > Risk Appetite > Operational Limits', FALSE);

  -- Q6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa jumlah jenis risiko utama yang dihadapi Sektor Jasa Keuangan (SJK)?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '5 jenis', FALSE),
    (q_id, '6 jenis', FALSE),
    (q_id, '7 jenis', FALSE),
    (q_id, '8 jenis', TRUE),
    (q_id, '10 jenis', FALSE);

  -- Q7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Risiko yang timbul akibat gagal bayar debitur atau counterparty disebut...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko Pasar', FALSE),
    (q_id, 'Risiko Kredit', TRUE),
    (q_id, 'Risiko Likuiditas', FALSE),
    (q_id, 'Risiko Operasional', FALSE),
    (q_id, 'Risiko Strategik', FALSE);

  -- Q8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Ketidakmampuan memenuhi kewajiban jatuh tempo tanpa kerugian signifikan merupakan definisi dari...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko Kredit', FALSE),
    (q_id, 'Risiko Pasar', FALSE),
    (q_id, 'Risiko Likuiditas', TRUE),
    (q_id, 'Risiko Kepatuhan', FALSE),
    (q_id, 'Risiko Reputasi', FALSE);

  -- Q9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Risiko yang timbul akibat kerugian dari kegagalan proses, sistem, SDM, atau kejadian eksternal adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko Strategik', FALSE),
    (q_id, 'Risiko Pasar', FALSE),
    (q_id, 'Risiko Kepatuhan', FALSE),
    (q_id, 'Risiko Operasional', TRUE),
    (q_id, 'Risiko Reputasi', FALSE);

  -- Q10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'KRI adalah singkatan dari...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Key Regulatory Indicator', FALSE),
    (q_id, 'Key Risk Indicator', TRUE),
    (q_id, 'Key Reporting Index', FALSE),
    (q_id, 'Komponen Risiko Institusi', FALSE),
    (q_id, 'Kebijakan Risiko Institusi', FALSE);

  -- Q11
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dalam sistem traffic light KRI, warna Merah (Red) menunjukkan kondisi...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'KRI dalam batas aman, tidak ada tindakan khusus diperlukan', FALSE),
    (q_id, 'KRI mendekati threshold, perlu peningkatan monitoring', FALSE),
    (q_id, 'KRI melampaui limit, wajib eskalasi dan tindakan korektif segera', TRUE),
    (q_id, 'KRI dalam kondisi baik dan tidak perlu dipantau', FALSE),
    (q_id, 'KRI hanya perlu dilaporkan kepada unit bisnis terkait', FALSE);

  -- Q12
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Warna Kuning/Amber dalam sistem traffic light KRI menandakan bahwa...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko telah melampaui limit dan harus dieskalasi ke Direksi', FALSE),
    (q_id, 'KRI mendekati threshold, perlu peningkatan monitoring dan tindakan preventif', TRUE),
    (q_id, 'Kondisi normal, tidak ada tindakan khusus', FALSE),
    (q_id, 'Risiko berada di level "Sangat Rendah" dan dapat diabaikan', FALSE),
    (q_id, 'KRI perlu dilaporkan kepada OJK secara berkala', FALSE);

  -- Q13
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Konsep "Limit Cascading" dalam manajemen risiko berarti...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Limit ditetapkan secara berjenjang dari level enterprise ke unit bisnis ke individu', TRUE),
    (q_id, 'Limit risiko diperbesar secara bertahap sesuai dengan pertumbuhan bisnis', FALSE),
    (q_id, 'Limit risiko dikurangi secara bertahap hingga mencapai nol', FALSE),
    (q_id, 'Limit risiko disamakan untuk semua unit bisnis dalam organisasi', FALSE),
    (q_id, 'Limit risiko ditetapkan oleh OJK dan berlaku untuk seluruh industri', FALSE);

  -- Q14
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Formula RAROC adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'RAROC = Modal Ekonomi / (Pendapatan Bersih − Kerugian Ekspektasian)', FALSE),
    (q_id, 'RAROC = (Pendapatan Bersih + Kerugian Ekspektasian) / Modal Ekonomi', FALSE),
    (q_id, 'RAROC = (Pendapatan Bersih − Kerugian Ekspektasian) / Modal Ekonomi', TRUE),
    (q_id, 'RAROC = Pendapatan Bersih / (Modal Ekonomi − Kerugian Ekspektasian)', FALSE),
    (q_id, 'RAROC = Kerugian Ekspektasian / Modal Ekonomi', FALSE);

  -- Q15
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'RAROC merupakan singkatan dari...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risk-Adjusted Rate of Capital', FALSE),
    (q_id, 'Risk-Adjusted Return on Capital', TRUE),
    (q_id, 'Risk-Assessed Return on Capital', FALSE),
    (q_id, 'Risk-Allocated Revenue on Capital', FALSE),
    (q_id, 'Return-Adjusted Risk on Capital', FALSE);

  -- Q16
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Aktivitas yang memiliki RAROC di atas "hurdle rate" dianggap...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Melampaui batas risiko yang ditetapkan dan harus dihentikan', FALSE),
    (q_id, 'Menciptakan nilai bagi organisasi', TRUE),
    (q_id, 'Tidak efisien dan harus direstrukturisasi', FALSE),
    (q_id, 'Harus dilaporkan kepada OJK sebagai pelanggaran', FALSE),
    (q_id, 'Berada dalam kondisi risiko sangat tinggi', FALSE);

  -- Q17
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Stress testing dalam konteks manajemen risiko adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pengujian kecepatan sistem teknologi informasi di bawah beban tinggi', FALSE),
    (q_id, 'Simulasi dampak kondisi ekstrem terhadap keuangan dan risiko organisasi', TRUE),
    (q_id, 'Evaluasi kinerja karyawan dalam menangani situasi darurat', FALSE),
    (q_id, 'Pengujian efektivitas kontrol internal melalui surprise audit', FALSE),
    (q_id, 'Penilaian ketahanan modal bank terhadap permintaan OJK', FALSE);

  -- Q18
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa level maturitas dalam Risk Maturity Model?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '2 level', FALSE),
    (q_id, '3 level', FALSE),
    (q_id, '4 level', TRUE),
    (q_id, '5 level', FALSE),
    (q_id, '6 level', FALSE);

  -- Q19
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Level maturitas tertinggi dalam Risk Maturity Model adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Initial/Ad-hoc — manajemen risiko reaktif dan tidak sistematis', FALSE),
    (q_id, 'Developing/Compliance — kerangka dasar ada, penerapan parsial', FALSE),
    (q_id, 'Established/Integrated — MR terintegrasi dalam proses bisnis', FALSE),
    (q_id, 'Advanced/Value Creating — MR sebagai keunggulan kompetitif, menciptakan nilai', TRUE),
    (q_id, 'Optimized/Automated — MR sepenuhnya otomatis berbasis AI', FALSE);

  -- Q20
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pada level maturitas "Initial/Ad-hoc", karakteristik manajemen risiko organisasi adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'MR terintegrasi dalam proses bisnis, KRI dan RAS berjalan dengan baik', FALSE),
    (q_id, 'MR sebagai keunggulan kompetitif dan menciptakan nilai bagi organisasi', FALSE),
    (q_id, 'Manajemen risiko reaktif, tidak sistematis, bergantung pada individu', TRUE),
    (q_id, 'Kerangka dasar ada namun penerapan masih parsial dan didorong kepatuhan regulasi', FALSE),
    (q_id, 'Seluruh risiko telah diidentifikasi dan dimitigasi secara komprehensif', FALSE);

  -- ===========================================================================
  -- SECTION 3: Budaya & Tata Kelola Risiko (~15 questions)
  -- ===========================================================================
  SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
  INSERT INTO sections (title, position, module_id, is_active)
  VALUES ('Budaya & Tata Kelola Risiko', sec_pos, mod_id, true)
  RETURNING id INTO sec_id;
  pos := 0;

  -- Q1
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa fase evolusi budaya risiko dalam organisasi?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '2 fase', FALSE),
    (q_id, '3 fase', FALSE),
    (q_id, '4 fase', TRUE),
    (q_id, '5 fase', FALSE),
    (q_id, '6 fase', FALSE);

  -- Q2
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Fase pertama evolusi budaya risiko adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Resilient — organisasi mampu beradaptasi dan pulih cepat dari kejadian risiko', FALSE),
    (q_id, 'Risk Aware — seluruh karyawan memiliki kesadaran risiko yang tinggi dan proaktif', FALSE),
    (q_id, 'Integration — MR mulai terintegrasi dalam pengambilan keputusan sehari-hari', FALSE),
    (q_id, 'Compliance — kepatuhan terhadap aturan karena kewajiban, bukan kesadaran', TRUE),
    (q_id, 'Proactive — seluruh lini aktif mengidentifikasi dan melaporkan risiko', FALSE);

  -- Q3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Fase budaya risiko "Resilient" ditandai dengan...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kepatuhan terhadap aturan karena kewajiban regulasi', FALSE),
    (q_id, 'MR mulai terintegrasi dalam pengambilan keputusan sehari-hari', FALSE),
    (q_id, 'Seluruh karyawan memiliki kesadaran risiko yang tinggi dan proaktif', FALSE),
    (q_id, 'Organisasi mampu beradaptasi dan pulih cepat dari kejadian risiko', TRUE),
    (q_id, 'Kontrol risiko hanya dilakukan oleh unit manajemen risiko', FALSE);

  -- Q4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa tingkat maturitas governance risiko yang dikenal dalam kerangka manajemen risiko?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '2 tingkat', FALSE),
    (q_id, '3 tingkat', TRUE),
    (q_id, '4 tingkat', FALSE),
    (q_id, '5 tingkat', FALSE),
    (q_id, '6 tingkat', FALSE);

  -- Q5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Tingkat maturitas governance risiko "Effectiveness" berarti...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kebijakan, struktur, dan prosedur sudah ada secara tertulis', FALSE),
    (q_id, 'Kebijakan dan prosedur sudah dijalankan dalam praktik sehari-hari', FALSE),
    (q_id, 'Penerapan terbukti efektif dalam mengendalikan risiko dan mencapai tujuan', TRUE),
    (q_id, 'Manajemen risiko telah terintegrasi dengan sistem teknologi informasi', FALSE),
    (q_id, 'Seluruh risiko telah berhasil dimitigasi dan tidak ada residual risk', FALSE);

  -- Q6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'POJK 12/2024 mengatur tentang...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kerangka manajemen risiko operasional bagi bank umum', FALSE),
    (q_id, 'Pencegahan dan Penanganan Fraud di Sektor Jasa Keuangan', TRUE),
    (q_id, 'Kewajiban stress testing triwulanan bagi lembaga keuangan', FALSE),
    (q_id, 'Tata cara pelaporan insiden siber kepada OJK', FALSE),
    (q_id, 'Persyaratan modal minimum untuk bank dan lembaga keuangan', FALSE);

  -- Q7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa pilar pencegahan dan penanganan fraud dalam POJK 12/2024?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '3 pilar', FALSE),
    (q_id, '4 pilar', TRUE),
    (q_id, '5 pilar', FALSE),
    (q_id, '6 pilar', FALSE),
    (q_id, '2 pilar', FALSE);

  -- Q8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pilar pertama anti-fraud berdasarkan POJK 12/2024 adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Deteksi — surprise audit, surveillance system, dan data analytics', FALSE),
    (q_id, 'Investigasi & Sanksi — prosedur investigasi dan penerapan sanksi', FALSE),
    (q_id, 'Pemantauan & Evaluasi — review berkala efektivitas program anti-fraud', FALSE),
    (q_id, 'Pencegahan — budaya anti-fraud, screening SDM, pelatihan, whistleblowing system', TRUE),
    (q_id, 'Pelaporan — kewajiban laporan fraud kepada OJK secara berkala', FALSE);

  -- Q9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pilar "Deteksi" dalam kerangka anti-fraud POJK 12/2024 mencakup...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Screening SDM, pelatihan, dan whistleblowing system', FALSE),
    (q_id, 'Prosedur investigasi dan kerjasama dengan aparat hukum', FALSE),
    (q_id, 'Surprise audit, surveillance system, KRI fraud, dan data analytics', TRUE),
    (q_id, 'Review berkala efektivitas program dan pelaporan kepada regulator', FALSE),
    (q_id, 'Penerapan sanksi tegas kepada pelaku fraud', FALSE);

  -- Q10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, '"Near miss" dalam konteks manajemen risiko adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kejadian kerugian besar yang hampir menyebabkan kebangkrutan organisasi', FALSE),
    (q_id, 'Transaksi yang hampir melampaui limit risiko yang ditetapkan', FALSE),
    (q_id, 'Kejadian yang berpotensi menimbulkan kerugian tetapi tidak terjadi (hampir terjadi)', TRUE),
    (q_id, 'Insiden siber yang berhasil dideteksi sebelum menimbulkan kerugian finansial', FALSE),
    (q_id, 'Risiko residual yang mendekati batas risk appetite', FALSE);

  -- Q11
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Mengapa near miss wajib dilaporkan dalam organisasi yang memiliki budaya risiko yang baik?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Karena near miss merupakan kewajiban regulasi yang ditetapkan OJK', FALSE),
    (q_id, 'Karena near miss adalah sinyal dini sebelum kejadian sesungguhnya terjadi', TRUE),
    (q_id, 'Karena near miss harus dicatat dalam laporan keuangan sebagai potensi kerugian', FALSE),
    (q_id, 'Karena near miss menunjukkan kegagalan sistem kontrol internal yang signifikan', FALSE),
    (q_id, 'Karena OJK akan memberikan sanksi jika near miss tidak dilaporkan', FALSE);

  -- Q12
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Hambatan utama dalam pelaporan near miss yang harus diatasi melalui budaya non-blame adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kurangnya sistem teknologi untuk mencatat kejadian near miss', FALSE),
    (q_id, 'Tidak adanya regulasi yang mewajibkan pelaporan near miss', FALSE),
    (q_id, 'Rasa malu, takut disalahkan, dan menganggap tidak penting', TRUE),
    (q_id, 'Terlalu banyak near miss yang terjadi sehingga tidak tertangani', FALSE),
    (q_id, 'Tidak adanya anggaran untuk pengelolaan pelaporan near miss', FALSE);

  -- Q13
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Jalur transmisi risiko eksternal ke dalam organisasi dapat melalui... (pilih yang PALING LENGKAP)', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Hanya melalui nasabah dan debitur yang terdampak kondisi eksternal', FALSE),
    (q_id, 'Nasabah/counterparty, rantai pasokan dan mitra bisnis, infrastruktur pasar keuangan, dan sentimen pasar', TRUE),
    (q_id, 'Hanya melalui perubahan regulasi dari OJK dan pemerintah', FALSE),
    (q_id, 'Hanya melalui sentimen pasar dan kepercayaan publik', FALSE),
    (q_id, 'Melalui kegagalan sistem teknologi informasi internal organisasi', FALSE);

  -- Q14
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Laporan Profil Risiko disampaikan kepada Dewan Komisaris dengan frekuensi...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Harian', FALSE),
    (q_id, 'Mingguan', FALSE),
    (q_id, 'Bulanan', FALSE),
    (q_id, 'Triwulanan', TRUE),
    (q_id, 'Tahunan', FALSE);

  -- Q15
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Laporan Profil Risiko kepada Direksi disampaikan dengan frekuensi...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Harian', FALSE),
    (q_id, 'Bulanan', TRUE),
    (q_id, 'Triwulanan', FALSE),
    (q_id, 'Semesteran', FALSE),
    (q_id, 'Tahunan', FALSE);

  -- ===========================================================================
  -- SECTION 4: Pelaksana & Insiden Siber (~15 questions)
  -- ===========================================================================
  SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
  INSERT INTO sections (title, position, module_id, is_active)
  VALUES ('Pelaksana & Insiden Siber', sec_pos, mod_id, true)
  RETURNING id INTO sec_id;
  pos := 0;

  -- Q1
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'R-V-R-E-F adalah kerangka tindak bagi pelaksana sebagai Lini Pertahanan Pertama. Huruf "R" pertama dalam R-V-R-E-F singkatan dari...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Report — Laporkan kepada atasan atau saluran pelaporan resmi', FALSE),
    (q_id, 'Resolve — Selesaikan masalah risiko secara mandiri', FALSE),
    (q_id, 'Recognize — Kenali tanda-tanda risiko atau ketidaksesuaian', TRUE),
    (q_id, 'Review — Tinjau ulang prosedur yang ada', FALSE),
    (q_id, 'Record — Catat setiap insiden risiko dalam sistem', FALSE);

  -- Q2
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dalam kerangka R-V-R-E-F, tahap "V" (Verify) berarti...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menghentikan transaksi yang mencurigakan secara langsung', FALSE),
    (q_id, 'Verifikasi kebenaran fakta sebelum bertindak', TRUE),
    (q_id, 'Menginformasikan kepada seluruh rekan kerja di unit bisnis', FALSE),
    (q_id, 'Memvalidasi bahwa sistem teknologi berfungsi dengan benar', FALSE),
    (q_id, 'Mengevaluasi efektivitas kontrol yang sudah berjalan', FALSE);

  -- Q3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Tahap "E" dalam R-V-R-E-F adalah Escalate, yang dilakukan apabila...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko sudah berhasil dimitigasi oleh unit bisnis', FALSE),
    (q_id, 'Tidak ada respons dari atasan atau risiko bersifat signifikan', TRUE),
    (q_id, 'Pelaksana telah mendapat pelatihan manajemen risiko lanjutan', FALSE),
    (q_id, 'Insiden sudah dilaporkan kepada OJK dan diselesaikan', FALSE),
    (q_id, 'Risk Appetite Statement menunjukkan toleransi yang tinggi', FALSE);

  -- Q4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Tahap terakhir dalam kerangka R-V-R-E-F adalah "F — Follow Up", yang berarti...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menutup laporan risiko setelah eskalasi dilakukan', FALSE),
    (q_id, 'Memformat ulang laporan insiden agar sesuai standar OJK', FALSE),
    (q_id, 'Pantau hingga ada penyelesaian dan tindak lanjut nyata', TRUE),
    (q_id, 'Menyerahkan penanganan sepenuhnya kepada unit manajemen risiko', FALSE),
    (q_id, 'Mengajukan permintaan anggaran untuk perbaikan sistem kontrol', FALSE);

  -- Q5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dalam kerangka SEE → UNDERSTAND → ACT, tindakan pada tahap ACT harus dilakukan dalam batas waktu...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '30 menit sejak sinyal risiko terdeteksi', FALSE),
    (q_id, '4 jam sejak sinyal risiko terdeteksi', FALSE),
    (q_id, '12 jam sejak sinyal risiko terdeteksi', FALSE),
    (q_id, '1×24 jam sejak sinyal risiko terdeteksi', TRUE),
    (q_id, '3×24 jam sejak sinyal risiko terdeteksi', FALSE);

  -- Q6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pada tahap "SEE" dalam kerangka SEE → UNDERSTAND → ACT, pelaksana diminta untuk...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengambil tindakan korektif segera terhadap risiko yang terdeteksi', FALSE),
    (q_id, 'Menganalisis akar penyebab dan dampak potensial dari risiko', FALSE),
    (q_id, 'Amati dan sadari sinyal risiko di lingkungan kerja (anomali, deviasi, perilaku mencurigakan)', TRUE),
    (q_id, 'Melaporkan insiden kepada atasan dan unit manajemen risiko', FALSE),
    (q_id, 'Mendokumentasikan seluruh bukti dan log transaksi yang mencurigakan', FALSE);

  -- Q7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Kerangka berpikir analitik FACT → SIGNAL → HYPOTHESIS → CONCLUSION digunakan untuk...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Membuat laporan keuangan yang akurat kepada OJK', FALSE),
    (q_id, 'Menetapkan limit risiko yang tepat untuk setiap unit bisnis', FALSE),
    (q_id, 'Menarik kesimpulan yang didukung bukti dari fakta, sinyal, dan hipotesis risiko', TRUE),
    (q_id, 'Mengembangkan kebijakan manajemen risiko baru untuk organisasi', FALSE),
    (q_id, 'Melakukan stress testing terhadap portofolio kredit', FALSE);

  -- Q8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Nilai transaksi fraud dalam kasus siber sektor keuangan yang dibahas sebagai studi kasus adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rp 275 juta', FALSE),
    (q_id, 'Rp 1,5 miliar', FALSE),
    (q_id, 'Rp 2,75 miliar', TRUE),
    (q_id, 'Rp 5,75 miliar', FALSE),
    (q_id, 'Rp 27,5 miliar', FALSE);

  -- Q9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Fraud dalam kasus siber terjadi karena pelaku memanfaatkan...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kelemahan sistem teknologi informasi yang sudah usang', FALSE),
    (q_id, 'Trusted internal channel — jalur yang secara historis dianggap aman dan tidak diverifikasi ulang', TRUE),
    (q_id, 'Akses fisik ke ruang server pusat lembaga keuangan', FALSE),
    (q_id, 'Kelemahan enkripsi data pada sistem perbankan digital', FALSE),
    (q_id, 'Phishing melalui email kepada karyawan yang tidak waspada', FALSE);

  -- Q10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berapa dimensi efektivitas kontrol yang harus dipenuhi agar kontrol dianggap efektif?', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '3 dimensi', FALSE),
    (q_id, '4 dimensi', FALSE),
    (q_id, '5 dimensi', TRUE),
    (q_id, '6 dimensi', FALSE),
    (q_id, '7 dimensi', FALSE);

  -- Q11
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dimensi "Resilience" dalam 5 dimensi efektivitas kontrol berarti...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kontrol dirancang dengan benar untuk mengatasi risiko yang dituju', FALSE),
    (q_id, 'Kontrol mencakup seluruh skenario risiko yang relevan', FALSE),
    (q_id, 'Kontrol berjalan sebagaimana dirancang dalam praktik sehari-hari', FALSE),
    (q_id, 'Ada bukti yang cukup dan dapat diverifikasi bahwa kontrol berjalan', FALSE),
    (q_id, 'Kontrol tetap efektif saat sistem berada di bawah tekanan atau serangan', TRUE);

  -- Q12
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dalam Risk Treatment Prioritization, P1 (Contain & Preserve) memiliki timeframe...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '0–7 hari', FALSE),
    (q_id, '0–30 hari', TRUE),
    (q_id, '31–90 hari', FALSE),
    (q_id, '90–180 hari', FALSE),
    (q_id, 'Lebih dari 180 hari', FALSE);

  -- Q13
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Fokus utama pada tahap P2 (Fix the Control Path) dalam Risk Treatment Prioritization adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Hentikan kerusakan lebih lanjut dan amankan bukti digital', FALSE),
    (q_id, 'Perbaiki kontrol yang gagal, tutup celah, redesain prosedur — 31 sampai 90 hari', TRUE),
    (q_id, 'Monitoring berkelanjutan dan validasi efektivitas perbaikan jangka panjang', FALSE),
    (q_id, 'Laporkan insiden kepada OJK sesuai ketentuan regulasi', FALSE),
    (q_id, 'Mengganti seluruh sistem teknologi informasi yang rentan', FALSE);

  -- Q14
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Prinsip Zero Trust Architecture dalam cyber risk menyatakan bahwa...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Seluruh karyawan internal dipercaya secara otomatis karena telah melewati screening', FALSE),
    (q_id, 'Keamanan siber hanya perlu diterapkan di titik perimeter jaringan', FALSE),
    (q_id, 'Trust must be proven at every transaction — tidak ada entitas yang secara otomatis dipercaya', TRUE),
    (q_id, 'Sistem keamanan berbasis AI dapat dipercaya sepenuhnya untuk mendeteksi ancaman', FALSE),
    (q_id, 'Saluran internal yang sudah lama digunakan tidak perlu diverifikasi ulang', FALSE);

  -- Q15
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Dimensi efektivitas kontrol yang menilai apakah kontrol dirancang dengan benar untuk mengatasi risiko yang dituju adalah...', pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Coverage', FALSE),
    (q_id, 'Operation', FALSE),
    (q_id, 'Evidence', FALSE),
    (q_id, 'Design', TRUE),
    (q_id, 'Resilience', FALSE);

END $$;
