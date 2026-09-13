-- seed_ujian_perbankan_pcs8.sql
-- Source: Perbankan (lms.ojk.go.id — learnojk, PCS 8 exam attempt 216987)
-- Section: Perbankan | Source: pcs8 | Category: perbankan | Module: 1
-- 100 questions total:
--   69 × Mark 1.00 (confirmed correct from LMS)
--   31 × Mark 0.00 (correct answer not shown; answered with best judgment)
-- To re-run on a DB that already has the 69-question version: existing questions
-- are deleted and all 100 are re-inserted.

DO $$
DECLARE
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN
  -- Insert section (idempotent)
  SELECT id INTO sec_id FROM sections WHERE title = 'Perbankan';

  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session, module_id, category_id)
    VALUES ('Perbankan', sec_pos, 20, 1, 'perbankan')
    RETURNING id INTO sec_id;
  END IF;

  -- Clear existing questions (handles re-run after 69-question version)
  DELETE FROM questions WHERE section_id = sec_id;

  -- =========================================================================
  -- Q1 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Yang bukan merupakan ciri utama pada pembiayaan jual beli yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Harga jual yang disepakati tidak boleh berubah meskipun dilakukan perpanjangan akad', FALSE),
    (q_id, 'Harus ada underlying barang yang diperjualbelikan', FALSE),
    (q_id, 'Nasabah berkewajiban membayar hutangnya berupa harga jual yang terdiri dari pokok + margin meskipun dilakukan pembayaran dipercepat', FALSE),
    (q_id, 'Nasabah berkewajiban hanya melunasi sebesar pokok pembiayaan kepada bank apabila dilakukan pelunasan dipercepat', TRUE);

  -- =========================================================================
  -- Q2 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Undang-undang yang menjadi dasar perbankan syariah yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'UU Nomor 10 tahun 1998', FALSE),
    (q_id, 'UU Nomor 21 tahun 2011', FALSE),
    (q_id, 'UU Nomor 11 tahun 2008', FALSE),
    (q_id, 'UU Nomor 21 tahun 2008', TRUE);

  -- =========================================================================
  -- Q3 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Apa yang menjadi ciri khas dari produk simpanan berjangka?',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pemegang tidak dapat menarik dana sebelum jangka waktu tertentu', TRUE),
    (q_id, 'Likuiditas tinggi', FALSE),
    (q_id, 'Jangka waktu tidak ditentukan', FALSE),
    (q_id, 'Bunga yang dapat dinegosiasikan', FALSE);

  -- =========================================================================
  -- Q4 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Di bawah ini, pernyataan yang tidak sesuai dengan POJK Nomor 12/POJK.03/2021 adalah:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pembukaan/Penutupan Kantor di Luar Negeri memerlukan izin DIMB/OJK', FALSE),
    (q_id, 'Penutupan KC memerlukan izin DIMB/OJK', FALSE),
    (q_id, 'Pemindahan alamat Kantor di Luar Negeri dalam kota yang sama memerlukan izin DIMB/OJK', TRUE),
    (q_id, 'Pemindahan alamat KP yang mengakibatkan perubahan tempat kedudukan dalam anggaran dasar memerlukan izin DIMB/OJK', FALSE);

  -- =========================================================================
  -- Q5 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Setelah menjalankan fungsinya, Bank Perantara akan:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Dilikuidasi sepenuhnya oleh BI', FALSE),
    (q_id, 'Dilebur dengan bank sistemik', FALSE),
    (q_id, 'Dibubarkan oleh OJK', FALSE),
    (q_id, 'Dialihkan kepemilikannya kepada pihak lain', TRUE);

  -- =========================================================================
  -- Q6 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Komponen Know Your BPR/BPRS (KYBPR/BPRS):',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Bisnis Utama dan Infrastruktur Pendukung', TRUE),
    (q_id, 'Kelembagaan dan Organisasi', FALSE),
    (q_id, 'Semua benar', FALSE),
    (q_id, 'Perkembangan Kinerja', FALSE);

  -- =========================================================================
  -- Q7 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Modal disetor yang dipersyaratkan untuk pendirian BUS yang akan menjadi anak dalam struktur kelompok usaha bank adalah sebesar:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rp 3.000.000.000.000,00', TRUE),
    (q_id, 'Rp 1.000.000.000.000,00', FALSE),
    (q_id, 'Rp 500.000.000.000,00', FALSE),
    (q_id, 'Rp 10.000.000.000.000,00', FALSE);

  -- =========================================================================
  -- Q8 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Kerangka tata kelola syariah bagi BUS dan UUS terdiri dari:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'DPS, kepatuhan dan manajemen risiko syariah, audit intern syariah, audit ekstern syariah', FALSE),
    (q_id, 'DPS, kepatuhan syariah, manajemen risiko syariah, audit intern syariah, kaji ulang ekstern syariah', TRUE),
    (q_id, 'DPS, kepatuhan syariah, komite syariah, audit intern syariah, audit ekstern syariah', FALSE),
    (q_id, 'DPS, komite syariah, kepatuhan syariah, manajemen risiko syariah, audit intern syariah, kaji ulang ekstern syariah', FALSE);

  -- =========================================================================
  -- Q9 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Definisi Tindak Pidana di Bidang Perbankan adalah',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'semuanya benar.', TRUE),
    (q_id, 'Segala jenis perbuatan melanggar hukum yang berhubungan dengan kegiatan dalam menjalankan usaha bank, baik bank sebagai sarana maupun bank sebagai sasaran.', FALSE),
    (q_id, 'Perbuatan-perbuatan yang berhubungan dengan kegiatan usaha pokok bank yang diatur dalam ketentuan-ketentuan di luar UU Perbankan, seperti KUHP, UU Pemberantasan Tipikor, dll.', FALSE),
    (q_id, 'Tindak pidana yang tidak hanya mencakup pelanggaran terhadap Undang-Undang Perbankan saja, melainkan mencakup pula tindak pidana penipuan, penggelapan, pemalsuan dan tindak pidana lain sepanjang berkaitan dengan lembaga perbankan', FALSE);

  -- =========================================================================
  -- Q10 — Mark 0.00 (answered with best judgment; 5 options)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Jangka waktu pelaporan perubahan data Akuntan Publik / Kantor Akuntan Publik di OJK, yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Paling Lama 20 hari kerja', FALSE),
    (q_id, 'Paling Lama 7 hari', FALSE),
    (q_id, 'Paling Lama 7 hari kerja', FALSE),
    (q_id, 'Paling Lama 10 hari', FALSE),
    (q_id, 'Paling Lama 10 hari kerja', TRUE);

  -- =========================================================================
  -- Q11 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dokumen persyaratan permohonan penambahan modal disetor atau perubahan kepemilikan saham yang tidak mengakibatkan perubahan PSP dalam hal setoran modal berasal dari tabungan, yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Salinan akta hibah', FALSE),
    (q_id, 'Mutasi rekening yang menampung hasil penjualan aset', FALSE),
    (q_id, 'Fotokopi bilyet deposito yang telah dicairkan', FALSE),
    (q_id, 'Mutasi rekening 6 (enam) bulan terakhir', TRUE);

  -- =========================================================================
  -- Q12 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Manakah pengertian Penyimpangan Ketentuan Perbankan (PKP) adalah',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Semua jawaban benar', FALSE),
    (q_id, 'Tindakan yang disengaja oleh anggota manajemen perusahaan, pihak yang berperan dalam governance perusahaan, karyawan, atau pihak ketiga yang melakukan pembohongan atau penipuan untuk memperoleh keuntungan yang tidak adil atau illegal.', FALSE),
    (q_id, 'Tindakan penyimpangan yang melanggar ketentuan, antara lain UU Perbankan, UU Perbankan Syariah, Peraturan Otoritas Jasa Keuangan (POJK), Peraturan Bank Indonesia (PBI), peraturan perundang-undangan lainnya, Surat Edaran Otoritas Jasa Keuangan (SE OJK), Surat Edaran Bank Indonesia (SE BI), dan ketentuan internal bank.', TRUE),
    (q_id, 'Tindakan sengaja melanggar ketentuan internal (system & procedure) & peraturan perundang-undangan yang berlaku, demi kepentingan pribadi atau pihak lain yang berpotensi merugikan baik material maupun non material (moril)', FALSE);

  -- =========================================================================
  -- Q13 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Penyelenggaraan jaringan kantor dengan mekanisme penyampaian informasi adalah:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perubahan status dari Kantor di bawah KCPBLN menjadi KCPBLN', FALSE),
    (q_id, 'Pemindahan alamat untuk Kantor Wilayah ke provinsi yang berbeda', FALSE),
    (q_id, 'Perubahan status dari Kantor Cabang menjadi Kantor Cabang Pembantu', TRUE),
    (q_id, 'Perubahan status dari Kantor Cabang Pembantu menjadi Kantor Cabang', FALSE);

  -- =========================================================================
  -- Q14 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Melakukan koordinasi pengawasan di sektor PVML yang berkantor pusat di daerah, merupakan salah satu fungsi satuan kerja koordinator (hub bidang), yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'DPLK', FALSE),
    (q_id, 'DPDK', FALSE),
    (q_id, 'DPLJ', TRUE),
    (q_id, 'DPVR', FALSE);

  -- =========================================================================
  -- Q15 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Salah satu peraturan yang melandasi proses perizinan kelembagaan dan jaringan kantor Bank Umum adalah:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'POJK No.33/POJK.04/2014', FALSE),
    (q_id, 'POJK No.27/POJK.03/2016', FALSE),
    (q_id, 'POJK No.55/POJK.03/2016', FALSE),
    (q_id, 'POJK No.12/POJK.03/2021', TRUE);

  -- =========================================================================
  -- Q16 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Departemen Manajemen dan Pengembangan OJK Daerah atau DMND merupakan satuan kerja di bidang kebijakan strategis yang memiliki fungsi:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Koordinasi pengelolaan Kantor OJK daerah, manajemen pengawasan dan perizinan sektor keuangan di daerah, pengembangan ekonomi dan keuangan daerah', FALSE),
    (q_id, 'Mengelola Kantor OJK daerah, manajemen pengawasan dan perizinan sektor jasa keuangan di daerah, pengembangan ekonomi dan keuangan daerah serta layanan manajemen strategis Kantor OJK daerah', FALSE),
    (q_id, 'Koordinasi pengelolaan Kantor OJK daerah, manajemen pengawasan dan perizinan sektor jasa keuangan di daerah, pengembangan ekonomi dan keuangan daerah serta layanan manajemen strategis Kantor OJK daerah', TRUE),
    (q_id, 'Koordinasi pengelolaan Kantor OJK daerah, pengawasan dan perizinan sektor jasa keuangan di daerah, pengembangan ekonomi dan keuangan daerah serta layanan manajemen strategis Kantor OJK daerah.', FALSE);

  -- =========================================================================
  -- Q17 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Tahapan Penilaian Kemampuan dan Kepatutan new entry:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Absensi dokumen, identifikasi dokumen dan hasil PKK', FALSE),
    (q_id, 'Absensi dokumen, identifikasi dokumen, penelitian administratif dan hasil PKK', TRUE),
    (q_id, 'Identifikasi dokumen, penelitian administratif, permintaan rekomendasi dan track record, hasil PKK', FALSE),
    (q_id, 'Identifikasi dokumen, penelitian administratif dan hasil PKK', FALSE);

  -- =========================================================================
  -- Q18 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa persentase BMPK untuk kredit kepada 1 kelompok peminjam BPR?',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '25% dari modal BPR', FALSE),
    (q_id, '30% dari modal BPR', TRUE),
    (q_id, '10% dari modal BPR', FALSE),
    (q_id, '20% dari modal BPR', FALSE);

  -- =========================================================================
  -- Q19 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Yang merupakan pihak utama bagi bank sebagaimana diatur di dalam POJK PKK adalah:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Dewan Komisaris, Anggota Dewan Pengawas Syariah, Direksi', FALSE),
    (q_id, 'Pemegang Saham Pengendali, Dewan Komisaris, Direksi', TRUE),
    (q_id, 'Auditor Internal, Direksi, Anggota Dewan Pengawas Syariah', FALSE),
    (q_id, 'Pemegang Saham Pengendali, Dewan Komisaris, Auditor Internal', FALSE);

  -- =========================================================================
  -- Q20 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Anggota Komite Tata Kelola Terintegrasi adalah sebagai berikut, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perwakilan Komisaris dari salah satu LJK yang memiliki posisi sebagai perwakilan dari Pemegang Saham', TRUE),
    (q_id, 'Komisaris Independen yang menjadi ketua pada salah satu komite pada Entitas Utama', FALSE),
    (q_id, 'Seorang Pihak Independen', FALSE),
    (q_id, 'Komisaris Independen yang mewakili dan ditunjuk dari LJK dalam Konglomerasi Keuangan', FALSE);

  -- =========================================================================
  -- Q21 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Bank dinilai memiliki potensi kesulitan yang membahayakan kelangsungan usaha jika memenuhi kriteria berikut, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rasio CAR mencapai 12%', TRUE),
    (q_id, 'TKS komposit dinilai 4 dalam 2 periode berturut-turut', FALSE),
    (q_id, 'Rasio GWM tidak tercapai', FALSE),
    (q_id, 'Rasio kewajiban penyediaan modal minimum Bank sama dengan atau lebih besar dari 8%', FALSE);

  -- =========================================================================
  -- Q22 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Manakah satuan kerja yang terlibat pada pengawasan AP/KAP?',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'DIMB, DPEP, dan DKEU', FALSE),
    (q_id, 'OJKI, DIMB, dan DAJP', FALSE),
    (q_id, 'DIMB, DPBS, dan DKEU', FALSE),
    (q_id, 'DIMB, DAJP, dan DPEP', TRUE);

  -- =========================================================================
  -- Q23 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berdasarkan siklus Pengawasan Terintegrasi, langkah yang dilakukan selanjutnya sebelum Integrated Risk Rating KK Tahap 1 yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tindakan Pengawasan dan Pemantauan', FALSE),
    (q_id, 'Perencanaan Pengawasan', FALSE),
    (q_id, 'Pemahaman terhadap Konglomerasi Keuangan', TRUE),
    (q_id, 'Koordinasi Pemeriksaan Berdasarkan Risiko', FALSE);

  -- =========================================================================
  -- Q24 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Siapa yang wajib memberikan rekomendasi dalam usulan penunjukan AP dan/atau KAP',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Komite Audit', TRUE),
    (q_id, 'Akuntan Internal', FALSE),
    (q_id, 'Pemegang saham', FALSE),
    (q_id, 'Direksi', FALSE);

  -- =========================================================================
  -- Q25 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'BPR XYZ dengan modal disetor Rp15 miliar dan berkantor pusat di Kabupaten Ciamis bermaksud untuk memindahkan kantor pusatnya ke Kota Bandung. Berapa jumlah modal disetor yang wajib dipenuhi sesuai ketentuan?',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tidak diwajibkan meningkatkan modal disetor.', TRUE),
    (q_id, 'Rp25 miliar.', FALSE),
    (q_id, 'Rp100 miliar.', FALSE),
    (q_id, 'Rp50 miliar.', FALSE);

  -- =========================================================================
  -- Q26 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam hal pembukaan Rahasia Bank dilakukan untuk kepentingan peradilan dalam perkara pidana, prosedur yang harus ditempuh adalah:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Dikoordinasikan terlebih dahulu dengan Bank Indonesia', FALSE),
    (q_id, 'Disampaikan melalui Mahkamah Agung kepada bank', FALSE),
    (q_id, 'Langsung disampaikan kepada bank oleh aparat penegak hukum', FALSE),
    (q_id, 'Harus diajukan melalui izin tertulis kepada OJK', TRUE);

  -- =========================================================================
  -- Q27 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Permohonan persetujuan prinsip pendirian BPR diajukan kepada OJK dilampiri dengan dokumen antara lain:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Rencana SOP dan sistem, bukti setoran modal, bukti pembayaran biaya perizinan', TRUE),
    (q_id, 'Data kepemilikan, bukti setoran modal, akta pendirian', FALSE),
    (q_id, 'Data kepemilikan, daftar calon anggota Direksi dan anggota Dewan Komisaris, bukti kesiapan operasional', FALSE),
    (q_id, 'Data kepemilikan, bukti pembayaran biaya perizinan, akta pendirian', FALSE);

  -- =========================================================================
  -- Q28 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Penanganan Tindak Pidana Perbankan yang dilakukan oleh Departemen Pemeriksaan Khusus Perbankan (DRKP) mencakup',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Melakukan pemeriksaan khusus tipibank terhadap penyimpangan ketentuan perbankan yang berindikasi tindak pidana perbankan', FALSE),
    (q_id, 'Semuanya benar', TRUE),
    (q_id, 'Memberikan rekomendasi langkah-langkah pengawasan dan pembinaan kepada pengawas.', FALSE),
    (q_id, 'Memberikan pendapat sebagai ahli untuk membuat jelas suatu perkara', FALSE);

  -- =========================================================================
  -- Q29 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Posisi dalam struktur organisasi bank syariah yang tidak ada dalam bank konvensional:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Direksi', FALSE),
    (q_id, 'Komisaris', FALSE),
    (q_id, 'Dewan Audit', FALSE),
    (q_id, 'Dewan Pengawas Syariah', TRUE);

  -- =========================================================================
  -- Q30 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pengalihan fungsi dan tugas pengawasan LJK Daerah dan market conduct dari Kantor Pusat ke Kantor Daerah merupakan dampak penataan organisasi OJK sebagaimana diatur dalam Surat Edaran Dewan Komisioner:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'SEDK Nomor 19/SEDK.02/2024 Perubahan Ketiga Atas Surat Edaran Dewan Komisioner Otoritas Jasa Keuangan Nomor 19/SEDK.02/2023 tentang Organisasi Bidang Kebijakan Strategis', TRUE),
    (q_id, 'SEDK Nomor 24/SEDK.02/2023 tentang Perubahan Kedua Atas SEDK Nomor 11/SEDK.02/2023 tentang Organisasi Bidang Pengawasan Sektor Perbankan', FALSE),
    (q_id, 'SEDK Nomor 21/SEDK.02/2023 tentang Organisasi Bidang Pengawasan Sektor Pasar Modal, Keuangan Derivatif dan Bursa Karbon', FALSE),
    (q_id, 'SEDK Nomor 22/SEDK.02/2023 tentang Perubahan Atas SEDK Nomor 10/SEDK.02/2023 Organisasi Bidang pengawasan PEPK', FALSE);

  -- =========================================================================
  -- Q31 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Setelah memenuhi kondisi sebagai Konglomerasi Keuangan yang wajib membentuk PIKK Nonoperasional, PSP dan/atau PSPT wajib menyampaikan dokumen rencana pembentukan PIKK paling lambat:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '6 bulan', TRUE),
    (q_id, '3 bulan', FALSE),
    (q_id, '1 tahun', FALSE),
    (q_id, '9 bulan', FALSE);

  -- =========================================================================
  -- Q32 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Sistem Pelaporan yang digunakan bank untuk menyampaikan laporan kepada OJK yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'APOLO', TRUE),
    (q_id, 'SIPENA', FALSE),
    (q_id, 'SIGAP', FALSE),
    (q_id, 'SIPINA', FALSE);

  -- =========================================================================
  -- Q33 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam transaksi jual beli dimana harus melalui proses pemesanan karena barangnya belum tersedia dan pembeli dapat membayar barang yang dibeli dikemudian hari, dapat diakomodir menggunakan akad:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Ijarah', FALSE),
    (q_id, 'Salam', FALSE),
    (q_id, 'Istishna', TRUE),
    (q_id, 'Musyarakah', FALSE);

  -- =========================================================================
  -- Q34 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Bobot risiko untuk aset produktif dengan sumber dana Profit Sharing Investment Account (PSIA) yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '100%', FALSE),
    (q_id, '400%', FALSE),
    (q_id, '1%', TRUE),
    (q_id, '300%', FALSE);

  -- =========================================================================
  -- Q35 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam proses bisnis perkreditan, bank perlu untuk melakukan analisa berjenjang dan/atau terpisah terhadap suatu debitur yang dilakukan oleh unit kerja yang berbeda, antara lain oleh account manager dengan credit reviewer. Praktik dimaksud umumnya dikenal sebagai:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Segregation of duty', FALSE),
    (q_id, 'Four eyes principle', TRUE),
    (q_id, 'Five Cs of credit', FALSE),
    (q_id, 'Third line of defense', FALSE);

  -- =========================================================================
  -- Q36 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'LPIP wajib menghasilkan informasi perkreditan yang memiliki nilai tambah. Berikut adalah informasi perkreditan yang memiliki nilai tambah, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pemantauan dan evaluasi debitur atau nasabah', FALSE),
    (q_id, 'Informasi kredit macet pada SLIK', TRUE),
    (q_id, 'Skor kredit', FALSE),
    (q_id, 'Peringatan fraud', FALSE);

  -- =========================================================================
  -- Q37 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Di bawah ini merupakan dasar Pencabutan izin usaha Bank BHI dan KCBLN, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Izin usaha kantor pusat KCBLN dicabut atau dilikuidasi oleh otoritas negara setempat', FALSE),
    (q_id, 'Permintaan kantor pusat dari KCBLN', FALSE),
    (q_id, 'Permintaan pemilik atau pemegang saham Bank BHI untuk melakukan pencabutan izin usaha Bank BHI, termasuk bank perantara', FALSE),
    (q_id, 'Permintaan dari Bank lainnya', TRUE);

  -- =========================================================================
  -- Q38 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Sebutkan pihak yang dapat memperoleh informasi perkreditan dari LPIP',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Lembaga Keuangan non anggota dari LPIP', FALSE),
    (q_id, 'Non Lembaga Keuangan yang menjadi sumber data LPIP yang bersangkutan', TRUE),
    (q_id, 'Debitur atau Nasabah Peer-to-Peer Lending', FALSE),
    (q_id, 'Calon sumber data dari LPIP', FALSE);

  -- =========================================================================
  -- Q39 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Produk bank syariah yang tidak tersedia di bank konvensional adalah:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Gadai (Rahn)', TRUE),
    (q_id, 'Tabungan dan Deposito', FALSE),
    (q_id, 'Kartu kredit', FALSE),
    (q_id, 'Letter of Credit (LC)', FALSE);

  -- =========================================================================
  -- Q40 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut adalah surat pemberitahuan persetujuan kredit kepada nasabah harus memuat antara lain, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Informasi terkait pemberitahuan perubahan suku bunga', FALSE),
    (q_id, 'Suku bunga kredit yang diberikan', FALSE),
    (q_id, 'Estimasi premi risiko yang dikenakan', TRUE),
    (q_id, 'Informasi konversi suku bunga flat setara efektif', FALSE);

  -- =========================================================================
  -- Q41 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam UU Perbankan, penggunaan TKA oleh Bank diatur dalam pasal berikut:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pasal 40', FALSE),
    (q_id, 'Pasal 41', FALSE),
    (q_id, 'Pasal 38', FALSE),
    (q_id, 'Pasal 39', TRUE);

  -- =========================================================================
  -- Q42 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'OJK dapat menghentikan penilaian kemampuan dan kepatutan pihak utama BPR atau BPR Syariah apabila',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Berkomitmen terhadap pengembangan operasional BPR yang sehat', FALSE),
    (q_id, 'Sedang menjalani proses penilaian kemampuan dan kepatutan pada suatu LJK', TRUE),
    (q_id, 'Tidak sedang dalam proses penilaian kembali karena terdapat indikasi permasalahan integritas', FALSE),
    (q_id, 'Tidak sedang menjalani proses hukum', FALSE);

  -- =========================================================================
  -- Q43 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Sumber data Bank Performance Report (BPeR), kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Data Pokok', FALSE),
    (q_id, 'Data Konsumen', TRUE),
    (q_id, 'Laporan Laba Rugi', FALSE),
    (q_id, 'Laporan Posisi keuangan', FALSE);

  -- =========================================================================
  -- Q44 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut merupakan komponen Know Your Financial Conglomerate, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Infrastruktur Pendukung', FALSE),
    (q_id, 'Bisnis Utama dan Peran/Kontribusi LJK pada Konglomerasi Keuangan', FALSE),
    (q_id, 'Struktur Konglomerasi Keuangan', FALSE),
    (q_id, 'Pengawasan Direksi dan Dewan Komisaris', TRUE);

  -- =========================================================================
  -- Q45 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Jenis Pembagian KSP terdiri dari',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'TI, APU-PPT, Syariah, Likuiditas dan Pasar', FALSE),
    (q_id, 'TI, APU-PPT, Kredit, Likuiditas dan Pasar, Panelis', FALSE),
    (q_id, 'TI, APU-PPT, Kredit, Likuiditas dan Pasar, Syariah', TRUE),
    (q_id, 'TI, APU-PPT, Market', FALSE);

  -- =========================================================================
  -- Q46 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam menetapkan bank sistemik, Otoritas Jasa Keuangan menyusun metodologi penetapan Bank Sistemik menggunakan indikator antara lain, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tingkat Kesehatan bank', TRUE),
    (q_id, 'Keterkaitan dengan sistem keuangan', FALSE),
    (q_id, 'Kompleksitas transaksi', FALSE),
    (q_id, 'Ukuran bank', FALSE);

  -- =========================================================================
  -- Q47 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dasar Hukum pengawasan AP/KAP:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'UU Perbankan No.10 Tahun 1996', FALSE),
    (q_id, 'POJK Nomor 9 Tahun 2023 dan SEOJK Nomor 18/SEOJK.03/2023', TRUE),
    (q_id, 'POJK Nomor 9 Tahun 2023 dan SEOJK Nomor 21/SEOJK.03/2023', FALSE),
    (q_id, 'POJK Nomor 13 Tahun 2017 dan SEOJK Nomor 18/SEOJK.03/2023', FALSE);

  -- =========================================================================
  -- Q48 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Di bawah ini yang bukan termasuk dalam komponen penerapan tata kelola yang baik sebagaimana diatur dalam POJK 17 2023 adalah:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Integritas pelaporan dan sistem informasi teknologi', FALSE),
    (q_id, 'Penyediaan dana kepada pihak terkait penyediaan dana besar', FALSE),
    (q_id, 'Penerapan manajemen risiko termasuk sistem pengendalian intern', FALSE),
    (q_id, 'Sistem rotasi telah dilaksanakan untuk menghindari ketergantungan kepada pegawai tertentu dan mengurangi kemungkinan terjadinya fraud', TRUE);

  -- =========================================================================
  -- Q49 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Yang bukan merupakan komponen penilaian Kecukupan Penerapan Manajemen Risiko (KPMR) yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kecukupan Kebijakan, Prosedur, dan Penetapan Limit', FALSE),
    (q_id, 'Penilaian Kecukupan Penerapan Tata Kelola', TRUE),
    (q_id, 'Pengawasan Direksi dan Dewan Komisaris', FALSE),
    (q_id, 'Pengendalian Intern yang Menyeluruh', FALSE);

  -- =========================================================================
  -- Q50 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dokumen Know Your Bank memuat Informasi di bawah ini kecuali',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kepemilikan dan Struktur Kelompok Usaha', FALSE),
    (q_id, 'Profil Risiko Terintegrasi', TRUE),
    (q_id, 'Kinerja Keuangan', FALSE),
    (q_id, 'Aktivitas Bisnis Utama dan Aktivitas Penunjang Utama', FALSE);

  -- =========================================================================
  -- Q51 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Kriteria keunggulan komoditas termasuk dalam top 5 produksi komoditas agrikultur nasional bertujuan untuk, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Memberikan keyakinan ketersediaan pasar atas komoditas dimaksud', TRUE),
    (q_id, 'Memberikan keyakinan kepada offtaker potensial yang bonafide', FALSE),
    (q_id, 'Memberikan keyakinan komoditas memiliki basis di daerah', FALSE),
    (q_id, 'Memberikan keyakinan ketersediaan suplai komoditas di daerah secara signifikan', FALSE);

  -- =========================================================================
  -- Q52 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Salah satu pimpinan KC bank Kepompong di Sumatera tertangkap KPK atas tindakan korupsi dan beritanya tersiar dalam media massa. Kasus ini mencatat kenaikan kasus fraud bank Kepompong yang pada periode sebelumnya tercatat nihil. Dampak dari kasus tersebut menyebabkan sebagian besar nasabah KC dimaksud serentak melakukan rush sehingga likuiditas cabang turun signifikan sebesar -78,95% dari bulan sebelumnya, serta NPL naik menjadi 11,51% (0,017% bank wide) karena mayoritas penyaluran kredit kepada kolega pimpinan KC yang usahanya fiktif. Porsi terbesar evaluasi atas kasus ini oleh Pengawas dilakukan pada penilaian RBBR dalam analisa:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Risiko Reputasi', FALSE),
    (q_id, 'Risiko Operasional', TRUE),
    (q_id, 'Risiko Likuiditas', FALSE),
    (q_id, 'Risiko Kredit', FALSE);

  -- =========================================================================
  -- Q53 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pengalihan Pengawasan Lembaga Jasa Keuangan Bidang Perasuransian, Penjaminan, dan Dana Pensiun (PPDP), direncanakan telah dilakukan pada bulan:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Oktober 2024', FALSE),
    (q_id, 'Agustus 2024', FALSE),
    (q_id, 'November 2024', FALSE),
    (q_id, 'September 2024', TRUE);

  -- =========================================================================
  -- Q54 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Perbuatan hukum yang dilakukan oleh KCBLN dan Bank dengan mengalihkan aset dan/atau liabilitas KCBLN secara hukum kepada Bank, dan selanjutnya dilakukan pencabutan izin usaha KCBLN disebut:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Peleburan', FALSE),
    (q_id, 'Konversi', FALSE),
    (q_id, 'Penggabungan', FALSE),
    (q_id, 'Integrasi', TRUE);

  -- =========================================================================
  -- Q55 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam rangka koordinasi OJK dengan LPS, dilakukan koordinasi setiap',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Bulanan atau triwulanan', FALSE),
    (q_id, 'Bulanan dan triwulanan', TRUE),
    (q_id, 'Bulanan', FALSE),
    (q_id, 'Triwulanan', FALSE);

  -- =========================================================================
  -- Q56 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pendapatan yang diakui oleh Bank Syariah dalam laporan laba rugi, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Margin', FALSE),
    (q_id, 'Ujrah', FALSE),
    (q_id, 'Denda', TRUE),
    (q_id, 'Bagi Hasil', FALSE);

  -- =========================================================================
  -- Q57 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut ini yang termasuk ke dalam komponen Penilaian Integrated Risk Rating, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Manajemen Risiko Terintegrasi', TRUE),
    (q_id, 'Tata Kelola Terintegrasi', FALSE),
    (q_id, 'Profil Risiko Terintegrasi', FALSE),
    (q_id, 'Permodalan Terintegrasi', FALSE);

  -- =========================================================================
  -- Q58 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut ini merupakan tantangan dalam konsolidasi BPR/BPRS, kecuali',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Keterbatasan internal control, SDM dan TI', FALSE),
    (q_id, 'Kesulitan mendapatkan pasangan penggabungan', FALSE),
    (q_id, 'PSP umumnya tidak mau mempertahankan kepemilikannya pada 1 BPR dan BPRS', TRUE),
    (q_id, 'Kepemilikan BPR/S memiliki nilai historis sehingga kepemilikannya akan dipertahankan', FALSE);

  -- =========================================================================
  -- Q59 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Kajian disusun dengan memperhatikan proses pengembangan ekonomi secara end-to-end, dari proses penetapan, implementasi, hingga evaluasi, merupakan definisi dari aspek:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aspek keberlanjutan', FALSE),
    (q_id, 'Aspek perencanaan', FALSE),
    (q_id, 'Aspek komprehensif', TRUE),
    (q_id, 'Aspek manajemen', FALSE);

  -- =========================================================================
  -- Q60 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Permohonan izin atas produk bank lanjutan, untuk Bank Umum, dilakukan melalui...',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'OBOX', FALSE),
    (q_id, 'SIPENA', FALSE),
    (q_id, 'APOLO', FALSE),
    (q_id, 'SPRINT', TRUE);

  -- =========================================================================
  -- Q61 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Apa tujuan utama dari pengaturan pemanfaatan Tenaga Kerja Asing (TKA) di sektor perbankan?',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menyederhanakan prosedur perizinan ketenagakerjaan lintas sektor', FALSE),
    (q_id, 'Meningkatkan daya saing industri perbankan sekaligus mendorong alih pengetahuan (Transfer of Knowledge)', TRUE),
    (q_id, 'Menyesuaikan struktur gaji tenaga kerja asing dan domestik', FALSE),
    (q_id, 'Mempermudah proses rekrutmen tenaga kerja dari luar negeri', FALSE);

  -- =========================================================================
  -- Q62 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Penilaian Kemampuan dan Kepatutan diberlakukan bagi pihak yang mengajukan diri untuk menduduki posisi sebagai berikut di bank syariah, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Komisaris', FALSE),
    (q_id, 'Pengawas Syariah', TRUE),
    (q_id, 'Pemegang Saham Pengendali', FALSE),
    (q_id, 'Direksi', FALSE);

  -- =========================================================================
  -- Q63 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Yang termasuk fungsi Spesialis TI, adalah',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penyusunan Laporan Large Exposure (LEX)', FALSE),
    (q_id, 'Pemberian tanggapan/aktif dalam forum/diskusi terkait Perbankan Syariah.', FALSE),
    (q_id, 'Pemberian tanggapan/aktif dalam forum/diskusi terkait risiko pasar dan likuiditas', FALSE),
    (q_id, 'Pemberian tanggapan terkait perizinan LPE/LPD dan Penempatan DC/DRC di luar wilayah Indonesia, Laporan Rutin TI (RSTI, RPTI, RPPB, Laporan Kondisi Terkini TI, Laporan Hasil Keamanan Siber); Realisasi Produk;', TRUE);

  -- =========================================================================
  -- Q64 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pembiayaan pembelian barang-barang konsumsi seperti kendaraan bermotor dalam perbankan syariah menggunakan prinsip:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mudharabah', FALSE),
    (q_id, 'Murabahah', TRUE),
    (q_id, 'Kafalah', FALSE),
    (q_id, 'Wakalah', FALSE);

  -- =========================================================================
  -- Q65 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut ini adalah aplikasi produk dari konsep dasar bank syariah dalam layanan keuangan, dimana bank berfungsi sebagai penyedia jasa layanan, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Dana talangan Prinsip Qardh dan Gadai Prinsip Rahn', FALSE),
    (q_id, 'Letter of Credit (L/C), Transfer, Inkaso, Kliring dengan Prinsip Wakalah', FALSE),
    (q_id, 'Anjak Piutang Prinsip Hiwalah dan Bank Garansi Prinsip Kafalah', FALSE),
    (q_id, 'Jual Beli Valuta Asing (bank notes) dengan Prinsip Maisir', TRUE);

  -- =========================================================================
  -- Q66 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Bagi Dana Pensiun yang berbentuk perusahaan publik, penggunaan jasa dari AP yang sama dibatasi',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '7 tahun berturut turut', FALSE),
    (q_id, '7 tahun kumulatif', TRUE),
    (q_id, '5 tahun berturut-turut', FALSE),
    (q_id, '5 tahun kumulatif', FALSE);

  -- =========================================================================
  -- Q67 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut adalah tujuan bagi OJK melaksanakan stress test, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Meningkatkan fungsi Pengawasan Bank', FALSE),
    (q_id, 'Penguatan Mitigasi dalam implementasi fungsi manajemen krisis', FALSE),
    (q_id, 'Meningkatkan fungsi intermediasi', TRUE),
    (q_id, 'Meningkatkan fungsi Surveilans', FALSE);

  -- =========================================================================
  -- Q68 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Bentuk badan hukum Bank Syariah berdasarkan UU No.21 Tahun 2008 tentang Perbankan Syariah adalah:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Perseroan Terbatas (PT), Perusahaan Umum (Perum) dan BUMN', FALSE),
    (q_id, 'Perseroan Terbatas (PT), Perusahaan Umum (Perum), Yayasan dan BUMN', TRUE),
    (q_id, 'Perseroan Terbatas (PT)', FALSE),
    (q_id, 'Perseroan Terbatas (PT), Perusahaan Umum (Perum), Yayasan, BUMN dan Koperasi', FALSE);

  -- =========================================================================
  -- Q69 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Ketentuan OJK yang mengatur tentang penyampaian laporan bank umum melalui sistem pelaporan yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'POJK 12/POJK.03/2019 dan SEOJK 26/SEOJK.03/2020', FALSE),
    (q_id, 'POJK 11/POJK.03/2019 dan SEOJK 20/SEOJK.03/2020', FALSE),
    (q_id, 'POJK 60/POJK.03/2021 dan SEOJK 54/SEOJK.03/2020', FALSE),
    (q_id, 'POJK 63/POJK.03/2020 dan SEOJK 26/SEOJK.03/2020', TRUE);

  -- =========================================================================
  -- Q70 — Mark 1.00 (5 options)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Permohonan pendaftaran Akuntan Publik (AP) telah disetujui oleh OJK serta telah diberikan Surat Tanda Terdaftar (STTD) maka AP dimaksud akan masuk ke publikasi sebagai:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Daftar AP yang Aktif', TRUE),
    (q_id, 'Daftar AP Tidak Aktif Sementara waktu', FALSE),
    (q_id, 'Daftar AP yang dibekukan', FALSE),
    (q_id, 'Daftar AP yang tidak boleh audit LJK', FALSE),
    (q_id, 'Daftar AP Tidak Aktif Tetap', FALSE);

  -- =========================================================================
  -- Q71 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut adalah kegiatan usaha LPIP, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menghasilkan informasi perkreditan yang memiliki nilai tambah', FALSE),
    (q_id, 'Menghimpun dan menyalurkan dana dari dan kepada masyarakat', TRUE),
    (q_id, 'Memberikan jasa pemeringkatan terhadap debitur atau nasabah', FALSE),
    (q_id, 'Menghimpun dan mengolah data kredit atau pembiayaan dan/atau data lain', FALSE);

  -- =========================================================================
  -- Q72 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pemisahan UUS dapat dilakukan dalam skema',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pendirian BUS baru bersama LJK lainnya', TRUE),
    (q_id, 'Mengalihkan hak dan kewajiban UUS kepada BUK induknya', FALSE),
    (q_id, 'Mencabut izin usaha UUS', FALSE),
    (q_id, 'Pendirian BUS bersama dengan UUS lainnya', FALSE);

  -- =========================================================================
  -- Q73 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Perizinan kelembagaan yang hanya terdapat di sektor perbankan Syariah, yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Integrasi', FALSE),
    (q_id, 'Akuisisi', FALSE),
    (q_id, 'Konversi', TRUE),
    (q_id, 'Konsolidasi', FALSE);

  -- =========================================================================
  -- Q74 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Produk yang memberikan kemudahan untuk pembayaran secara elektronik seperti tagihan bulanan dan transfer antarbank adalah',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tabungan', FALSE),
    (q_id, 'Deposito', FALSE),
    (q_id, 'Kartu Kredit', FALSE),
    (q_id, 'Internet Banking', TRUE);

  -- =========================================================================
  -- Q75 — Mark 0.00 (answered with best judgment; 3 options)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut merupakan jenis jaringan kantor BPR berdasarkan POJK 7 Tahun 2024, kecuali',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Sentra Keuangan Khusus', FALSE),
    (q_id, 'Unit Layanan Keliling', FALSE),
    (q_id, 'Kantor Wilayah', TRUE);

  -- =========================================================================
  -- Q76 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Aplikasi Pengawasan Konglomerasi Keuangan saat ini, disebut:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Sistem Informasi Pengawasan Terpadu', FALSE),
    (q_id, 'Sistem Informasi Pengawasan Terkoordinasi', FALSE),
    (q_id, 'Sistem Informasi Pengawasan Terintegrasi', TRUE),
    (q_id, 'Sistem Informasi Pengawasan Terkini', FALSE);

  -- =========================================================================
  -- Q77 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pos pada laporan keuangan yang memberikan informasi terkait cadangan yang dibentuk oleh bank untuk mengantisipasi potensi kerugian yang mungkin timbul akibat penurunan nilai aset keuangan yaitu',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Cadangan Kerugian Penurunan Nilai (CKPN)', TRUE),
    (q_id, 'Giro Wajib Bank', FALSE),
    (q_id, 'Cadangan Bank', FALSE),
    (q_id, 'Giro Wajib Minimum', FALSE);

  -- =========================================================================
  -- Q78 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa batas waktu konsolidasi BPR non-pemda yang diatur di dalam POJK 7 Tahun 2024?',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '3 tahun', TRUE),
    (q_id, '6 bulan', FALSE),
    (q_id, '1 tahun', FALSE),
    (q_id, '2 tahun', FALSE);

  -- =========================================================================
  -- Q79 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Siapa yang menyusun dan menyetujui Rencana Bisnis Bank (RBB)?',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Direksi yang menyusun dan Dewan Komisaris menyetujui', TRUE),
    (q_id, 'OJK dan BPR', FALSE),
    (q_id, 'Komite audit dan Dewan Komisaris', FALSE),
    (q_id, 'Pemegang saham menyusun dan menyetujui', FALSE);

  -- =========================================================================
  -- Q80 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pernyataan yang tidak benar mengenai sinergi perbankan, yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Sinergi perbankan hanya dapat dilakukan oleh bank-bank dalam satu grup atau memiliki hubungan kepemilikan', FALSE),
    (q_id, 'Sinergi yang melibatkan bank syariah harus mendapatkan opini/persetujuan dari Dewan Pengawas Syariah', FALSE),
    (q_id, 'Sinergi perbankan dapat dilakukan di bidang IT, SDM, jaringan kantor, jaringan komunikasi, pelaporan, audit', FALSE),
    (q_id, 'Sinergi perbankan dapat dilakukan atas izin OJK', TRUE);

  -- =========================================================================
  -- Q81 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Sesuai dengan SEDK 6/SEDK.02/2024 Tentang Perubahan Atas SEDK Nomor 19/SEDK.02/2023 Tentang Organisasi Bidang Strategis bahwa Kantor OJK Dibagi menjadi Kantor OJK Koordinator dan Kantor OJK Non-Koordinator. Dibawah ini merupakan rincian Kantor OJK Koordinator, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kantor OJK Provinsi Jawa Barat', FALSE),
    (q_id, 'Kantor OJK Provinsi Kalimantan Selatan', TRUE),
    (q_id, 'Kantor OJK Provinsi Sumatera Selatan', FALSE),
    (q_id, 'Kantor OJK Provinsi Sulawesi Selatan dan Sulawesi Barat', FALSE);

  -- =========================================================================
  -- Q82 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Di bawah ini pernyataan yang tidak benar terkait Penggabungan/Peleburan adalah:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penggabungan/Peleburan dapat dilakukan antar BPR yang berkedudukan dalam wilayah provinsi yang berbeda sepanjang kantor-kantor BPR hasil Penggabungan/Peleburan berlokasi dalam wilayah provinsi yang sama', FALSE),
    (q_id, 'Penggabungan/Peleburan dapat dilakukan antar BPR yang berkedudukan dalam wilayah provinsi yang sama', FALSE),
    (q_id, 'Penggabungan/Peleburan antara BPR konvensional dengan BPR berdasarkan prinsip syariah hanya dapat dilakukan apabila BPR hasil Penggabungan/Peleburan tetap menjadi BPR konvensional', TRUE),
    (q_id, 'Penggabungan/Peleburan hanya dapat dilakukan antar BPR', FALSE);

  -- =========================================================================
  -- Q83 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'BPRS dapat didirikan oleh, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pemerintah daerah', FALSE),
    (q_id, 'Badan hukum Indonesia yang seluruh pemiliknya warga negara Indonesia', FALSE),
    (q_id, 'Warga negara Indonesia', FALSE),
    (q_id, 'Badan hukum Indonesia dengan warga negara asing dan/atau badan hukum asing secara kemitraan', TRUE);

  -- =========================================================================
  -- Q84 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Prinsip penyusunan pengembangan ekonomi daerah adalah:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aspek layak investasi, aspek manajemen dan aspek hukum', FALSE),
    (q_id, 'Aspek manajemen, aspek layak investasi dan aspek komprehensif', FALSE),
    (q_id, 'Aspek keberlanjutan, aspek layak investasi dan aspek komprehensif', TRUE),
    (q_id, 'Aspek transparansi, aspek layak investasi dan aspek manajemen', FALSE);

  -- =========================================================================
  -- Q85 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Peran utama offtaker dalam ekosistem Pengembangan Ekonomi Daerah antara lain, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Memberikan asistensi teknis aspek produksi', TRUE),
    (q_id, 'Menyerap hasil produksi pembudidaya', FALSE),
    (q_id, 'Memberikan imbal hasil produksi kepada pembudidaya', FALSE),
    (q_id, 'Menghimpun informasi mengenai pembudidaya yang akan bekerja sama', FALSE);

  -- =========================================================================
  -- Q86 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam melaksanakan fungsi audit intern, SKAI melakukan komunikasi dengan OJK yang membahas hal-hal berikut, kecuali',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Temuan dan rekomendasi dari pelaksanaan audit intern pada tahun berjalan', FALSE),
    (q_id, 'Pemahaman tindakan mitigasi risiko yang dilakukan oleh bank', FALSE),
    (q_id, 'Rencana audit bulanan', TRUE),
    (q_id, 'Area berisiko yang diidentifikasi OJK dan SKAI', FALSE);

  -- =========================================================================
  -- Q87 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Calon anggota Direksi Perbankan Syariah wajib memiliki pengetahuan dan pemahaman tentang peraturan dan operasional perbankan syariah, antara lain dibuktikan dengan:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Sertifikat pelatihan perbankan syariah', TRUE),
    (q_id, 'Sertifikat pelatihan dari LPPOM MUI', FALSE),
    (q_id, 'Sertifikat pembicara seminar perbankan syariah', FALSE),
    (q_id, 'Sertifikat pelatihan dari DSN MUI', FALSE);

  -- =========================================================================
  -- Q88 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Aspek penilaian uji kemampuan dan kepatutan new entry calon pemegang saham pengendali bank:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Integritas dan reputasi keuangan', FALSE),
    (q_id, 'Integritas dan kelayakan keuangan', TRUE),
    (q_id, 'Integritas dan komitmen', FALSE),
    (q_id, 'Integritas dan kompetensi', FALSE);

  -- =========================================================================
  -- Q89 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Jangka waktu penetapan hasil penilaian kemampuan dan kepatutan dari OJK paling lama',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '30 (tiga puluh) hari kerja setelah seluruh dokumen permohonan diterima secara lengkap', TRUE),
    (q_id, '60 (enam puluh) hari kerja setelah seluruh dokumen permohonan diterima secara lengkap', FALSE),
    (q_id, '30 (tiga puluh) hari kerja setelah penilaian kemampuan dan kepatutan dilakukan', FALSE),
    (q_id, '60 (enam puluh) hari kerja setelah penilaian kemampuan dan kepatutan dilakukan', FALSE);

  -- =========================================================================
  -- Q90 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Perbuatan berikut merupakan PKP yang memiliki indikasi tindak pidana perbankan, kecuali ...',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pemalsuan dokumen persyaratan permohonan kredit oleh calon debitur.', TRUE),
    (q_id, 'Penarikan uang kas yang tidak dicatat dalam pembukuan bank.', FALSE),
    (q_id, 'Setoran deposito/tabungan/giro yang tidak dicatat dalam pembukuan bank.', FALSE),
    (q_id, 'Pemberian kredit kepada debitur fiktif.', FALSE);

  -- =========================================================================
  -- Q91 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pernyataan di bawah ini adalah benar mengenai ketentuan Pengurus Bank Syariah, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Jumlah anggota dewan komisaris BUS minimal 3 orang dan maksimal sama dengan jumlah anggota direksi', FALSE),
    (q_id, 'Jumlah anggota direksi BUS minimal 3 orang dan maksimal sama dengan jumlah anggota dewan komisaris', TRUE),
    (q_id, 'Jumlah anggota direksi BPRS minimal 2 orang', FALSE),
    (q_id, 'Jumlah anggota direksi BUS minimal 3 orang', FALSE);

  -- =========================================================================
  -- Q92 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berikut merupakan karakteristik dari simpanan wadiah, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pemberian imbalan/bonus tergantung kebijakan Bank', FALSE),
    (q_id, 'Tidak ada imbalan/bonus', FALSE),
    (q_id, 'Bisa diambil sewaktu-waktu atau sesuai kesepakatan', FALSE),
    (q_id, 'Bonus diperjanjikan di awal', TRUE);

  -- =========================================================================
  -- Q93 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Informasi SLIK dapat digunakan oleh LJK untuk:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengubah status hukum perusahaan', FALSE),
    (q_id, 'Menentukan suku bunga BI', FALSE),
    (q_id, 'Menilai kelayakan debitur', TRUE),
    (q_id, 'Menetapkan pajak', FALSE);

  -- =========================================================================
  -- Q94 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Merupakan akad pelimpahan kekuasaan oleh satu pihak (muwakil) kepada pihak lain (wakil) yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Istishna', FALSE),
    (q_id, 'Wakalah', TRUE),
    (q_id, 'Kafalah', FALSE),
    (q_id, 'Hawalah', FALSE);

  -- =========================================================================
  -- Q95 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Laporan laba rugi bank mencakup hal-hal sebagai berikut, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Beban operasional', FALSE),
    (q_id, 'Pendapatan operasional', FALSE),
    (q_id, 'Beban bunga', FALSE),
    (q_id, 'Tabungan', TRUE);

  -- =========================================================================
  -- Q96 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Tahapan keempat pada Siklus Pengawasan Bank Berdasarkan Risiko adalah',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Monitoring', FALSE),
    (q_id, 'Penilaian Tingkat Kesehatan', FALSE),
    (q_id, 'Pemeriksaan Berdasarkan Risiko', TRUE),
    (q_id, 'Pemahaman Terhadap Bank', FALSE);

  -- =========================================================================
  -- Q97 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Total eksposur Bank dalam penetapan status sistemik terdiri dari beberapa komponen berikut, kecuali:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Eksposur pada neraca (on-balance sheet exposure)', FALSE),
    (q_id, 'Potential future exposure dari transaksi derivative', FALSE),
    (q_id, 'Eksposur pada rekening administratif (off-balance sheet exposure)', FALSE),
    (q_id, 'Pajak penghasilan tangguhan (deferred tax)', TRUE);

  -- =========================================================================
  -- Q98 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Yang bukan merupakan cakupan penerapan tata kelola sesuai POJK No.2 tahun 2024 tentang Penerapan Tata Kelola Syariah BUS UUS yaitu:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kewajiban pengalihan penghasilan yang tidak sesuai dengan prinsip syariah', FALSE),
    (q_id, 'Kewajiban pembentukan komite syariah', FALSE),
    (q_id, 'Pembatasan masa jabatan anggota DPS', TRUE),
    (q_id, 'Kerangka tata kelola syariah', FALSE);

  -- =========================================================================
  -- Q99 — Mark 0.00 (answered with best judgment)
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Perbuatan hukum yang dilakukan oleh KCBLN untuk mengubah izin usaha KCBLN menjadi izin usaha Bank, dan selanjutnya dilakukan pencabutan izin usaha KCBLN disebut:',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Konversi', TRUE),
    (q_id, 'Integrasi', FALSE),
    (q_id, 'Peleburan', FALSE),
    (q_id, 'Penggabungan', FALSE);

  -- =========================================================================
  -- Q100 — Mark 1.00
  -- =========================================================================
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Kegiatan usaha yang berasaskan Prinsip Syariah yaitu kegiatan usaha yang tidak mengandung unsur sebagai berikut, kecuali',
    pos, 'pcs8')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Maisir', FALSE),
    (q_id, 'Zalim', FALSE),
    (q_id, 'Istishna', TRUE),
    (q_id, 'Riba', FALSE);

END $$;
