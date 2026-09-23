-- seed_pvml_modul4_sesi1.sql
-- Category: pvml | Module: 4 | Sections: 4 | Questions: 70
-- Source: Sesi 1 - Pengaturan dan Pengawasan PVML (Sep 2026)

-- ======================== SECTIONS ========================
INSERT INTO sections (title, position, draw_per_session, is_active, module_id, category_id) VALUES
  ('Pengenalan PVML', 46, 15, true, (SELECT id FROM modules WHERE number = 4), 'pvml'),
  ('Perusahaan Pembiayaan & Modal Ventura', 47, 20, true, (SELECT id FROM modules WHERE number = 4), 'pvml'),
  ('LJK Lainnya', 48, 20, true, (SELECT id FROM modules WHERE number = 4), 'pvml'),
  ('Pengawasan & Tata Kelola PVML', 49, 15, true, (SELECT id FROM modules WHERE number = 4), 'pvml');

-- ==================== SECTION 1: Pengenalan PVML (15 soal) ====================

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Berdasarkan Pasal 1 angka 4 UU Nomor 21 Tahun 2011 tentang OJK, manakah di antara berikut yang TIDAK termasuk dalam sektor LJK yang disebutkan?', 1, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Perasuransian', 1, false FROM q UNION ALL
SELECT id, 'Modal ventura', 2, false FROM q UNION ALL
SELECT id, 'Perpajakan', 3, true FROM q UNION ALL
SELECT id, 'Dana pensiun', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'UU Nomor 4 Tahun 2023 tentang P2SK mengubah definisi LJK, salah satunya dengan tidak lagi secara eksplisit menyebutkan sektor...', 2, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Perbankan dan pasar modal', 1, false FROM q UNION ALL
SELECT id, 'Perasuransian dan dana pensiun', 2, false FROM q UNION ALL
SELECT id, 'Modal ventura dan lembaga keuangan mikro', 3, true FROM q UNION ALL
SELECT id, 'Lembaga pembiayaan dan LJK lainnya', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Kegiatan "pemberian pinjaman dengan jaminan benda bergerak" dalam ruang lingkup Usaha Jasa Pembiayaan (UJP) diselenggarakan oleh...', 3, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Perusahaan Pembiayaan', 1, false FROM q UNION ALL
SELECT id, 'Perusahaan Modal Ventura', 2, false FROM q UNION ALL
SELECT id, 'Penyelenggara LPBBTI', 3, false FROM q UNION ALL
SELECT id, 'Perusahaan Pergadaian', 4, true FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Kegiatan UJP berupa "pembiayaan dalam bentuk penyediaan dana pada proyek infrastruktur" diselenggarakan oleh...', 4, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Perusahaan Pembiayaan', 1, false FROM q UNION ALL
SELECT id, 'Perusahaan Pembiayaan Infrastruktur (PPI)', 2, true FROM q UNION ALL
SELECT id, 'Perusahaan Modal Ventura', 3, false FROM q UNION ALL
SELECT id, 'Penyelenggara LPBBTI', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Manakah yang merupakan bentuk badan hukum yang diperbolehkan bagi penyelenggara Usaha Jasa Pembiayaan (UJP)?', 5, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Perseroan Terbatas dan Firma', 1, false FROM q UNION ALL
SELECT id, 'Perseroan Terbatas dan Koperasi', 2, true FROM q UNION ALL
SELECT id, 'Koperasi dan Persekutuan Komanditer', 3, false FROM q UNION ALL
SELECT id, 'Yayasan dan Perseroan Terbatas', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Kepemilikan oleh Warga Negara Asing (WNA) dalam penyelenggara UJP hanya dapat dilakukan melalui...', 6, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Penyertaan langsung tanpa batasan', 1, false FROM q UNION ALL
SELECT id, 'Kemitraan bersama dengan Pemerintah, Pemda, WNI, atau Badan Hukum Indonesia', 2, true FROM q UNION ALL
SELECT id, 'Transaksi di Pasar Modal', 3, false FROM q UNION ALL
SELECT id, 'Joint venture dengan Badan Hukum Asing lain', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Kepemilikan oleh Badan Hukum Asing (BHA) dalam penyelenggara UJP hanya dapat dilakukan melalui...', 7, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Transaksi di Pasar Modal', 1, true FROM q UNION ALL
SELECT id, 'Kemitraan bersama dengan Pemerintah', 2, false FROM q UNION ALL
SELECT id, 'Penyertaan modal langsung', 3, false FROM q UNION ALL
SELECT id, 'Pendirian anak perusahaan', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Kegiatan UJP berupa "menyediakan, mengelola, dan mengoperasikan layanan jasa keuangan untuk mempertemukan pemberi dana dengan penerima dana melalui sistem elektronik menggunakan internet" diselenggarakan oleh...', 8, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Perusahaan Pembiayaan Digital', 1, false FROM q UNION ALL
SELECT id, 'Perusahaan Modal Ventura', 2, false FROM q UNION ALL
SELECT id, 'Penyelenggara LPBBTI', 3, true FROM q UNION ALL
SELECT id, 'Perusahaan Pembiayaan Infrastruktur', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Sumber dana penyertaan penyelenggara UJP yang secara eksplisit DILARANG adalah yang berasal dari...', 9, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Dana dari investor asing', 1, false FROM q UNION ALL
SELECT id, 'Pinjaman', 2, true FROM q UNION ALL
SELECT id, 'Penerbitan obligasi', 3, false FROM q UNION ALL
SELECT id, 'Setoran modal pemegang saham', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Selain pinjaman, sumber dana penyertaan penyelenggara UJP juga dilarang berasal dari dan untuk tujuan kegiatan...', 10, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Investasi portofolio asing', 1, false FROM q UNION ALL
SELECT id, 'Dana masyarakat umum', 2, false FROM q UNION ALL
SELECT id, 'Pencucian uang, pendanaan terorisme, dan kejahatan keuangan lain', 3, true FROM q UNION ALL
SELECT id, 'Lembaga keuangan internasional', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Yang termasuk dalam kategori "Lembaga Jasa Keuangan Lainnya" di bawah PVML adalah...', 11, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Perusahaan Modal Ventura', 1, false FROM q UNION ALL
SELECT id, 'Lembaga Keuangan Mikro', 2, false FROM q UNION ALL
SELECT id, 'Perusahaan Pembiayaan Infrastruktur', 3, false FROM q UNION ALL
SELECT id, 'Lembaga Pembiayaan Ekspor Indonesia (LPEI)', 4, true FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Manakah yang TIDAK termasuk dalam kategori "Lembaga Pembiayaan" di bawah pengawasan PVML?', 12, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Perusahaan Pembiayaan', 1, false FROM q UNION ALL
SELECT id, 'Perusahaan Pembiayaan Infrastruktur', 2, false FROM q UNION ALL
SELECT id, 'Perusahaan Pergadaian', 3, true FROM q UNION ALL
SELECT id, 'Perusahaan Pembiayaan Syariah', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Pihak-pihak yang wajib memenuhi persyaratan Penilaian Kemampuan dan Kepatutan (PKK) dari OJK mencakup...', 13, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Hanya anggota Direksi dan Dewan Komisaris', 1, false FROM q UNION ALL
SELECT id, 'Anggota Direksi, Dewan Komisaris, DPS, PSP, Pengurus, Pengawas, dan Pengelola dari Penyelenggara UJP', 2, true FROM q UNION ALL
SELECT id, 'Hanya Pemegang Saham Pengendali (PSP)', 3, false FROM q UNION ALL
SELECT id, 'Seluruh karyawan penyelenggara UJP', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Perusahaan Modal Ventura dapat mengelola dana ventura dalam bentuk kontrak investasi bersama dan untuk itu wajib...', 14, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Mendaftarkan diri ke Bursa Efek Indonesia', 1, false FROM q UNION ALL
SELECT id, 'Memperoleh izin dari OJK', 2, true FROM q UNION ALL
SELECT id, 'Mendapatkan rekomendasi dari Bank Indonesia', 3, false FROM q UNION ALL
SELECT id, 'Memiliki modal disetor minimal Rp500 miliar', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengenalan PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Kegiatan UJP berupa "pembiayaan melalui penyertaan modal dan/atau pembiayaan untuk jangka waktu tertentu dalam rangka pengembangan usaha pada pasangan usaha atau debitur" diselenggarakan oleh...', 15, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Perusahaan Pembiayaan', 1, false FROM q UNION ALL
SELECT id, 'Perusahaan Modal Ventura', 2, true FROM q UNION ALL
SELECT id, 'Penyelenggara LPBBTI', 3, false FROM q UNION ALL
SELECT id, 'Perusahaan Pergadaian', 4, false FROM q;

-- ==================== SECTION 2: Perusahaan Pembiayaan & Modal Ventura (20 soal) ====================

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'POJK Nomor 10/POJK.05/2019 mengatur tentang...', 1, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Penyelenggaraan Usaha Perusahaan Pembiayaan konvensional', 1, false FROM q UNION ALL
SELECT id, 'Penyelenggaraan Usaha Perusahaan Pembiayaan Syariah dan Unit Usaha Syariah', 2, true FROM q UNION ALL
SELECT id, 'Pengembangan dan Penguatan PP, PMV, dan PPI', 3, false FROM q UNION ALL
SELECT id, 'Penyelenggaraan Beli Sekarang Bayar Nanti (BNPL)', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Dalam model bisnis Perusahaan Pembiayaan, setelah debitur mengajukan permohonan pembiayaan, urutan langkah yang benar adalah...', 2, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'PP membeli barang → PP menyetujui → debitur membayar uang muka', 1, false FROM q UNION ALL
SELECT id, 'PP menyetujui → debitur membayar uang muka → PP membeli barang dari supplier', 2, true FROM q UNION ALL
SELECT id, 'Debitur membayar uang muka → PP menyetujui → PP membeli barang', 3, false FROM q UNION ALL
SELECT id, 'PP membeli barang → debitur membayar uang muka → PP menyetujui', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Manakah kegiatan usaha yang HANYA terdapat dalam kategori "Pembiayaan Modal Kerja" pada Perusahaan Pembiayaan?', 3, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Sewa Pembiayaan', 1, false FROM q UNION ALL
SELECT id, 'Pembiayaan Proyek', 2, false FROM q UNION ALL
SELECT id, 'Fasilitas Modal Usaha', 3, true FROM q UNION ALL
SELECT id, 'Fasilitas Dana', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Manakah yang merupakan kegiatan usaha EKSKLUSIF dalam kategori "Pembiayaan Investasi" pada Perusahaan Pembiayaan (tidak ada di kategori lain)?', 4, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Pembelian dengan Pembayaran secara Angsuran', 1, false FROM q UNION ALL
SELECT id, 'Jual dan Sewa-Balik', 2, false FROM q UNION ALL
SELECT id, 'Pembiayaan Proyek dan Pembiayaan Infrastruktur', 3, true FROM q UNION ALL
SELECT id, 'Anjak Piutang dengan Pemberian Jaminan dari Penjual Piutang', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Dalam pembiayaan berbasis akad syariah untuk Perusahaan Pembiayaan Syariah, kategori "Pembiayaan Jual Beli" mencakup akad...', 5, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Mudharabah, Musyarakah, dan Mudharabah Musytarakah', 1, false FROM q UNION ALL
SELECT id, 'Murabahah, Salam, dan/atau Istishna', 2, true FROM q UNION ALL
SELECT id, 'Ijarah dan Ijarah Muntahiyah Bittamlik', 3, false FROM q UNION ALL
SELECT id, 'Wakalah dan Hawalah', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Akad "Kafalah atau Kafalah bil Ujrah" dalam pembiayaan syariah PP hanya dapat dilakukan oleh...', 6, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Semua Perusahaan Pembiayaan Syariah tanpa syarat', 1, false FROM q UNION ALL
SELECT id, 'PP Syariah yang memiliki aset di atas Rp1 triliun', 2, false FROM q UNION ALL
SELECT id, 'PP Syariah melalui gabungan dari beberapa akad', 3, true FROM q UNION ALL
SELECT id, 'PP Syariah dengan persetujuan Bank Indonesia', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Perbedaan utama antara PP Konvensional dan PP Syariah dari sisi Dewan Pengawas Syariah (DPS) adalah...', 7, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'PP Konvensional wajib memiliki DPS, PP Syariah tidak', 1, false FROM q UNION ALL
SELECT id, 'PP Syariah wajib memiliki DPS yang mengawasi operasional agar sesuai standar syariah, sementara PP Konvensional tidak ada DPS', 2, true FROM q UNION ALL
SELECT id, 'Keduanya wajib memiliki DPS dengan komposisi yang berbeda', 3, false FROM q UNION ALL
SELECT id, 'DPS bersifat opsional pada PP Syariah', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Larangan yang berlaku pada PP Syariah tetapi TIDAK berlaku pada PP Konvensional adalah larangan terhadap...', 8, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Praktik monopoli pasar', 1, false FROM q UNION ALL
SELECT id, 'Transaksi valuta asing tanpa lindung nilai', 2, false FROM q UNION ALL
SELECT id, 'Riba, Maysir (judi), Gharar (spekulasi), Tadlis (penipuan), Risywah (sogok), dan Dhalim', 3, true FROM q UNION ALL
SELECT id, 'Pembiayaan kepada pihak terafiliasi', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Modal Inti (Tier 1) minimum yang wajib dimiliki oleh Perusahaan Pembiayaan berdasarkan ketentuan yang berlaku adalah...', 9, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Rp50.000.000.000', 1, false FROM q UNION ALL
SELECT id, 'Rp75.000.000.000', 2, false FROM q UNION ALL
SELECT id, 'Rp100.000.000.000', 3, true FROM q UNION ALL
SELECT id, 'Rp200.000.000.000', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Modal Pelengkap (Tier 2) Perusahaan Pembiayaan wajib diperhitungkan paling tinggi berapa persen dari Modal Inti (Tier 1)?', 10, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '50%', 1, false FROM q UNION ALL
SELECT id, '75%', 2, false FROM q UNION ALL
SELECT id, '100%', 3, true FROM q UNION ALL
SELECT id, '150%', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'BNPL (Buy Now Pay Later) pada PP/PPS diatur dalam...', 11, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'POJK Nomor 46 Tahun 2024', 1, false FROM q UNION ALL
SELECT id, 'POJK Nomor 35 Tahun 2025', 2, false FROM q UNION ALL
SELECT id, 'POJK Nomor 32 Tahun 2025 tentang Penyelenggaraan Beli Sekarang Bayar Nanti', 3, true FROM q UNION ALL
SELECT id, 'POJK Nomor 40 Tahun 2024', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Kolektibilitas piutang pembiayaan PP dikategorikan sebagai "Dalam Perhatian Khusus" apabila terdapat keterlambatan pembayaran pokok dan/atau bunga selama...', 12, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Sampai dengan 10 hari kalender', 1, false FROM q UNION ALL
SELECT id, 'Lebih dari 10 hari sampai dengan 90 hari kalender', 2, true FROM q UNION ALL
SELECT id, 'Lebih dari 90 hari sampai dengan 120 hari kalender', 3, false FROM q UNION ALL
SELECT id, 'Lebih dari 120 hari sampai dengan 180 hari kalender', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Piutang pembiayaan PP dikategorikan "Macet" apabila keterlambatan pembayaran pokok dan/atau bunga telah melampaui...', 13, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '120 hari kalender', 1, false FROM q UNION ALL
SELECT id, '150 hari kalender', 2, false FROM q UNION ALL
SELECT id, '180 hari kalender', 3, true FROM q UNION ALL
SELECT id, '210 hari kalender', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'PP dilarang melakukan restrukturisasi piutang pembiayaan dengan tujuan untuk...', 14, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Membantu debitur yang mengalami kesulitan pembayaran pokok dan/atau bunga', 1, false FROM q UNION ALL
SELECT id, 'Memperbaiki kualitas piutang pembiayaan dan/atau menghindari peningkatan pembentukan cadangan penyisihan penghapusan piutang', 2, true FROM q UNION ALL
SELECT id, 'Memberikan keringanan bunga kepada debitur potensial', 3, false FROM q UNION ALL
SELECT id, 'Mengubah jangka waktu pembiayaan atas permintaan debitur', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Dalam keputusan restrukturisasi, apabila pemberian pembiayaan awal dilakukan oleh pihak yang memiliki kewenangan tertinggi, maka restrukturisasi wajib dilakukan melalui...', 15, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Keputusan RUPS', 1, false FROM q UNION ALL
SELECT id, 'Persetujuan tertulis OJK', 2, false FROM q UNION ALL
SELECT id, 'Keputusan dalam Rapat Direksi', 3, true FROM q UNION ALL
SELECT id, 'Keputusan Dewan Komisaris', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Perusahaan Pembiayaan wajib menyampaikan laporan berkala kepada OJK berupa...', 16, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Laporan harian dan laporan keuangan tahunan yang diaudit', 1, false FROM q UNION ALL
SELECT id, 'Laporan bulanan dan laporan keuangan tahunan yang telah diaudit oleh akuntan publik', 2, true FROM q UNION ALL
SELECT id, 'Laporan mingguan dan laporan keuangan semesteran', 3, false FROM q UNION ALL
SELECT id, 'Laporan triwulanan dan laporan keuangan tahunan', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Syarat Direksi PP yang memanfaatkan teknologi informasi wajib memiliki sertifikat kompetensi kerja di bidang teknologi informasi. Pejabat yang wajib memiliki sertifikat ini adalah...', 17, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Seluruh anggota Direksi', 1, false FROM q UNION ALL
SELECT id, 'Salah satu anggota Direksi dan pejabat 1 tingkat di bawah Direksi yang membidangi pengelolaan sistem informasi', 2, true FROM q UNION ALL
SELECT id, 'Hanya pejabat di bidang teknologi informasi', 3, false FROM q UNION ALL
SELECT id, 'Direktur Utama saja', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Dalam model bisnis Perusahaan Modal Ventura, setelah melakukan penyertaan modal ke pasangan usaha, PMV dapat keluar dari investasi melalui "divestasi" yaitu...', 18, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Penerbitan obligasi konversi', 1, false FROM q UNION ALL
SELECT id, 'IPO (Initial Public Offering) atau dijual kepada pemegang saham/investor baru', 2, true FROM q UNION ALL
SELECT id, 'Merger dengan perusahaan lain dalam kelompok usaha', 3, false FROM q UNION ALL
SELECT id, 'Pembagian dividen kepada pasangan usaha', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Berdasarkan POJK 25/POJK.05/2023, PMV dan PMVS harus berbentuk badan hukum...', 19, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Hanya Perseroan Terbatas', 1, false FROM q UNION ALL
SELECT id, 'Perseroan Terbatas atau Koperasi', 2, true FROM q UNION ALL
SELECT id, 'Hanya Koperasi', 3, false FROM q UNION ALL
SELECT id, 'Perseroan Terbatas, Koperasi, atau Yayasan', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Perusahaan Pembiayaan & Modal Ventura' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'PMV yang memberikan pembiayaan berdasarkan akad syariah (mudharabah atau musyarakah) kepada pasangan usaha diwajibkan memprioritaskan kepada...', 20, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Perusahaan multinasional berskala besar', 1, false FROM q UNION ALL
SELECT id, 'Perusahaan yang sudah listing di Bursa Efek', 2, false FROM q UNION ALL
SELECT id, 'UMKM', 3, true FROM q UNION ALL
SELECT id, 'Perusahaan dengan aset di atas Rp100 miliar', 4, false FROM q;

-- ==================== SECTION 3: LJK Lainnya (20 soal) ====================

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Modal disetor minimum Penyelenggara LPBBTI (Layanan Pendanaan Bersama Berbasis Teknologi Informasi) pada saat pendirian adalah...', 1, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Rp10 miliar', 1, false FROM q UNION ALL
SELECT id, 'Rp25 miliar', 2, true FROM q UNION ALL
SELECT id, 'Rp50 miliar', 3, false FROM q UNION ALL
SELECT id, 'Rp100 miliar', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Batas maksimum Pendanaan konsumtif dan produktif kepada setiap Penerima Dana dalam LPBBTI berdasarkan POJK 40 Tahun 2024 adalah...', 2, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Rp500 juta', 1, false FROM q UNION ALL
SELECT id, 'Rp1 miliar', 2, false FROM q UNION ALL
SELECT id, 'Rp2 miliar', 3, true FROM q UNION ALL
SELECT id, 'Rp5 miliar', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Penyelenggara LPBBTI dapat memberikan Pendanaan produktif melebihi batas Rp2 miliar sampai dengan Rp5 miliar, dengan syarat memiliki TWP90 maksimal...', 3, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '3% dalam 6 bulan terakhir', 1, false FROM q UNION ALL
SELECT id, '5% dalam 6 bulan terakhir', 2, true FROM q UNION ALL
SELECT id, '10% dalam 6 bulan terakhir', 3, false FROM q UNION ALL
SELECT id, '15% dalam 6 bulan terakhir', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Dalam LPBBTI, perjanjian antara Penyelenggara dengan Pemberi Dana dan Penerima Dana diwajibkan menggunakan...', 4, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Materai elektronik senilai Rp10.000', 1, false FROM q UNION ALL
SELECT id, 'Tanda Tangan Elektronik yang telah diamankan dengan Sertifikat Elektronik', 2, true FROM q UNION ALL
SELECT id, 'Tanda tangan basah yang dilegalisir notaris', 3, false FROM q UNION ALL
SELECT id, 'Persetujuan tertulis OJK untuk setiap perjanjian', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Batas maksimum Pendanaan oleh setiap Pemberi Dana dan afiliasinya dalam LPBBTI adalah paling banyak...dari posisi akhir (outstanding) Pendanaan pada akhir bulan.', 5, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '10%', 1, false FROM q UNION ALL
SELECT id, '20%', 2, false FROM q UNION ALL
SELECT id, '25%', 3, true FROM q UNION ALL
SELECT id, '50%', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Modal disetor Perusahaan Pergadaian lingkup Kabupaten/Kota berdasarkan POJK 39 Tahun 2024 adalah...', 6, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Rp1 miliar', 1, false FROM q UNION ALL
SELECT id, 'Rp2 miliar', 2, true FROM q UNION ALL
SELECT id, 'Rp5 miliar', 3, false FROM q UNION ALL
SELECT id, 'Rp8 miliar', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Rasio pinjaman dengan Benda Jaminan berdasarkan hukum gadai terhadap total Pinjaman pada Perusahaan Pergadaian ditetapkan paling sedikit...', 7, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '35%', 1, false FROM q UNION ALL
SELECT id, '45%', 2, false FROM q UNION ALL
SELECT id, '51%', 3, true FROM q UNION ALL
SELECT id, '65%', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Tingkat Kesehatan minimum Perusahaan Pergadaian yang wajib dipenuhi berdasarkan POJK 39 Tahun 2024 adalah...', 8, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'PK 2', 1, false FROM q UNION ALL
SELECT id, 'PK 3', 2, true FROM q UNION ALL
SELECT id, 'PK 4', 3, false FROM q UNION ALL
SELECT id, 'PK 5', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'LKM wajib bertransformasi menjadi BPR/BPRS apabila memenuhi salah satu syarat, yaitu memiliki Ekuitas minimal...dari modal disetor minimum BPR/BPRS.', 9, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '3x', 1, false FROM q UNION ALL
SELECT id, '5x', 2, true FROM q UNION ALL
SELECT id, '10x', 3, false FROM q UNION ALL
SELECT id, '25x', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'LKM skala usaha kecil berdasarkan POJK 41/2024 memiliki cakupan wilayah dan kriteria aset...', 10, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Wilayah provinsi dengan aset di atas Rp10 Miliar', 1, false FROM q UNION ALL
SELECT id, 'Wilayah desa/kelurahan dengan aset kurang dari Rp1 Miliar', 2, true FROM q UNION ALL
SELECT id, 'Wilayah kecamatan dengan aset kurang dari Rp1 Miliar', 3, false FROM q UNION ALL
SELECT id, 'Wilayah kabupaten/kota dengan aset lebih dari Rp10 Miliar', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Kegiatan usaha utama Perusahaan Pembiayaan Infrastruktur (PPI) berdasarkan POJK 46/POJK.05/2020 meliputi...', 11, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Pemberian kredit konsumer kepada masyarakat umum', 1, false FROM q UNION ALL
SELECT id, 'Penghimpunan dana dari masyarakat untuk disalurkan ke proyek', 2, false FROM q UNION ALL
SELECT id, 'Pemberian pinjaman langsung (direct lending) untuk Pembiayaan Infrastruktur', 3, true FROM q UNION ALL
SELECT id, 'Pengelolaan investasi di pasar modal untuk infrastruktur', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'PT Sarana Multi Infrastruktur (PT SMI) didirikan dengan tujuan utama sebagai...', 12, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Lembaga penjaminan ekspor nasional', 1, false FROM q UNION ALL
SELECT id, 'Katalis percepatan pembangunan infrastruktur di Indonesia', 2, true FROM q UNION ALL
SELECT id, 'Pengelola tabungan perumahan rakyat', 3, false FROM q UNION ALL
SELECT id, 'Pemberi kredit mikro kepada UMKM', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Berdasarkan UU P2SK, PT SMI dinyatakan berada di luar ruang lingkup usaha jasa pembiayaan karena ketentuan dalam...', 13, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'PP Nomor 66 Tahun 2007', 1, false FROM q UNION ALL
SELECT id, 'POJK Nomor 46/POJK.05/2020', 2, false FROM q UNION ALL
SELECT id, 'Bab X Pasal 106 ayat 5 huruf c UU Nomor 4 Tahun 2023 (P2SK)', 3, true FROM q UNION ALL
SELECT id, 'Peraturan Menteri Keuangan Nomor 100/PMK.010/2009', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'PT Sarana Multigriya Finansial (PT SMF) berperan sebagai Perusahaan Pembiayaan Sekunder Perumahan dengan kegiatan usaha utama berupa...', 14, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Pemberian kredit langsung kepada masyarakat untuk membeli rumah', 1, false FROM q UNION ALL
SELECT id, 'Pengelolaan asuransi perumahan nasional', 2, false FROM q UNION ALL
SELECT id, 'Sekuritisasi aset (KPR) dan penyaluran pembiayaan kepada lembaga penyalur KPR', 3, true FROM q UNION ALL
SELECT id, 'Penyelenggaraan program tabungan perumahan', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Dalam PPSP (PT SMF), rasio likuiditas yang dihitung menggunakan rasio lancar ditetapkan paling rendah...', 15, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '100%', 1, false FROM q UNION ALL
SELECT id, '110%', 2, true FROM q UNION ALL
SELECT id, '120%', 3, false FROM q UNION ALL
SELECT id, '150%', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Lembaga Pembiayaan Ekspor Indonesia (LPEI) atau Indonesia Eximbank menggunakan struktur tata kelola...', 16, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Two Board System (Direksi dan Dewan Komisaris terpisah)', 1, false FROM q UNION ALL
SELECT id, 'One Board System dengan hanya Dewan Direktur sebagai organ tunggal', 2, true FROM q UNION ALL
SELECT id, 'Supervisory Board System seperti perusahaan Eropa', 3, false FROM q UNION ALL
SELECT id, 'Three Tier System dengan Direksi, Komisaris, dan Dewan Pengawas', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Kegiatan usaha LPEI mencakup...', 17, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Pembiayaan, perbankan, dan investasi pasar modal', 1, false FROM q UNION ALL
SELECT id, 'Tabungan, kredit, dan asuransi jiwa', 2, false FROM q UNION ALL
SELECT id, 'Pembiayaan, penjaminan, dan asuransi', 3, true FROM q UNION ALL
SELECT id, 'Penjaminan, investasi, dan pengelolaan dana pensiun', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'PT PNM melalui program ULaMM memberikan pembiayaan modal usaha untuk usaha mikro dan kecil dengan jumlah maksimal...', 18, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Rp100 juta', 1, false FROM q UNION ALL
SELECT id, 'Rp200 juta', 2, true FROM q UNION ALL
SELECT id, 'Rp500 juta', 3, false FROM q UNION ALL
SELECT id, 'Rp1 miliar', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Program Mekaar yang dijalankan PT PNM ditujukan untuk...', 19, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Pengusaha menengah yang membutuhkan modal kerja', 1, false FROM q UNION ALL
SELECT id, 'Perempuan pra-sejahtera pelaku usaha super mikro melalui layanan pemberdayaan berbasis kelompok', 2, true FROM q UNION ALL
SELECT id, 'UMKM di sektor manufaktur dan industri', 3, false FROM q UNION ALL
SELECT id, 'Koperasi simpan pinjam di pedesaan', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'LJK Lainnya' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Besaran simpanan Tapera yang wajib dibayarkan adalah sebesar 3%, dengan proporsi pembagian antara peserta dan pemberi kerja sebesar...', 20, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '1,5% peserta dan 1,5% pemberi kerja', 1, false FROM q UNION ALL
SELECT id, '2% peserta dan 1% pemberi kerja', 2, false FROM q UNION ALL
SELECT id, '2,5% peserta dan 0,5% pemberi kerja', 3, true FROM q UNION ALL
SELECT id, '3% sepenuhnya dari peserta', 4, false FROM q;

-- ==================== SECTION 4: Pengawasan & Tata Kelola PVML (15 soal) ====================

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Siklus Pengawasan PVML Berbasis Risiko terdiri dari berapa tahap?', 1, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '4 tahap', 1, false FROM q UNION ALL
SELECT id, '5 tahap', 2, false FROM q UNION ALL
SELECT id, '6 tahap', 3, true FROM q UNION ALL
SELECT id, '8 tahap', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Tahap pertama dalam Siklus Pengawasan PVML Berbasis Risiko adalah...', 2, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Penilaian Tingkat Kesehatan PVML', 1, false FROM q UNION ALL
SELECT id, 'Pemahaman terhadap PVML (Know Your Financial Institution/KYFI)', 2, true FROM q UNION ALL
SELECT id, 'Perencanaan Pengawasan (Supervisory Plan)', 3, false FROM q UNION ALL
SELECT id, 'Pemeriksaan Berbasis Risiko (Risk Based Examination)', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Cakupan risiko dalam Pengawasan PVML Berbasis Risiko yang KHUSUS berlaku bagi LPEI adalah...', 3, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Risiko Reputasi', 1, false FROM q UNION ALL
SELECT id, 'Risiko Strategis', 2, false FROM q UNION ALL
SELECT id, 'Risiko Asuransi', 3, true FROM q UNION ALL
SELECT id, 'Risiko Kepatuhan', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Berdasarkan POJK Tata Kelola PVML, PVML yang memiliki aset lebih dari Rp250 miliar wajib memiliki jumlah anggota Direksi minimal...', 4, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '2 orang', 1, false FROM q UNION ALL
SELECT id, '3 orang', 2, true FROM q UNION ALL
SELECT id, '4 orang', 3, false FROM q UNION ALL
SELECT id, '5 orang', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'PVML yang memiliki aset lebih dari Rp250 miliar wajib memiliki anggota Dewan Komisaris minimal...', 5, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '1 orang', 1, false FROM q UNION ALL
SELECT id, '2 orang', 2, true FROM q UNION ALL
SELECT id, '3 orang', 3, false FROM q UNION ALL
SELECT id, '4 orang', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'PVML yang memiliki aset lebih dari Rp250 miliar wajib membentuk tiga komite, yaitu...', 6, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Komite audit saja', 1, false FROM q UNION ALL
SELECT id, 'Komite audit dan komite pemantau risiko', 2, false FROM q UNION ALL
SELECT id, 'Komite audit, komite pemantau risiko, dan komite remunerasi dan nominasi (KRN)', 3, true FROM q UNION ALL
SELECT id, 'Komite audit, komite pemantau risiko, komite remunerasi, dan komite kredit', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Anggota DPS dapat merangkap jabatan sebagai anggota DPS pada lembaga keuangan syariah lain paling banyak...', 7, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '1 lembaga keuangan syariah lain', 1, false FROM q UNION ALL
SELECT id, '2 lembaga keuangan syariah lain', 2, false FROM q UNION ALL
SELECT id, '3 lembaga keuangan syariah lain', 3, true FROM q UNION ALL
SELECT id, '5 lembaga keuangan syariah lain', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   '"Cooling-off period" dalam POJK Tata Kelola PVML melarang pengangkatan mantan pegawai/pejabat OJK sebagai Direksi/Dekom/DPS apabila berhenti kurang dari...', 8, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '3 bulan', 1, false FROM q UNION ALL
SELECT id, '6 bulan', 2, true FROM q UNION ALL
SELECT id, '1 tahun', 3, false FROM q UNION ALL
SELECT id, '2 tahun', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'PVML yang memiliki aset lebih dari Rp250 miliar diwajibkan untuk...', 9, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Mengangkat Direktur Utama/setara', 1, true FROM q UNION ALL
SELECT id, 'Memiliki Presiden Komisaris', 2, false FROM q UNION ALL
SELECT id, 'Membentuk dewan penasihat independen', 3, false FROM q UNION ALL
SELECT id, 'Menunjuk auditor internal dari luar perusahaan', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Syarat yang harus dipenuhi oleh Direktur Utama/setara PVML adalah...', 10, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Harus berpengalaman minimal 10 tahun di industri keuangan', 1, false FROM q UNION ALL
SELECT id, 'Harus merupakan Warga Negara Indonesia', 2, false FROM q UNION ALL
SELECT id, 'Bukan pemegang saham perseorangan dan tidak memiliki hubungan keluarga sampai derajat kedua dengan pemegang saham perseorangan', 3, true FROM q UNION ALL
SELECT id, 'Harus berdomisili di DKI Jakarta', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Rapat Direksi PVML wajib diselenggarakan paling sedikit...', 11, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '1 kali dalam 2 bulan', 1, false FROM q UNION ALL
SELECT id, '1 kali dalam 1 bulan', 2, true FROM q UNION ALL
SELECT id, '2 kali dalam 1 bulan', 3, false FROM q UNION ALL
SELECT id, '1 kali dalam 3 bulan', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Rapat Dewan Komisaris PVML (bagi Dekom yang beranggotakan lebih dari 1 orang) wajib diselenggarakan paling sedikit...', 12, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '1 kali dalam 1 bulan', 1, false FROM q UNION ALL
SELECT id, '1 kali dalam 2 bulan', 2, false FROM q UNION ALL
SELECT id, '1 kali dalam 3 bulan', 3, true FROM q UNION ALL
SELECT id, '1 kali dalam 6 bulan', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Rapat bersama antara Direksi, pejabat eksekutif, dan/atau pimpinan UUS dengan DPS wajib dilaksanakan paling sedikit...', 13, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, '1 kali dalam 1 bulan', 1, false FROM q UNION ALL
SELECT id, '1 kali dalam 2 bulan', 2, true FROM q UNION ALL
SELECT id, '1 kali dalam 3 bulan', 3, false FROM q UNION ALL
SELECT id, '1 kali dalam 6 bulan', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'PVML yang memiliki aset lebih dari Rp250 miliar wajib membentuk satuan kerja kepatuhan, sedangkan PVML dengan aset kurang dari atau sama dengan Rp250 miliar diwajibkan untuk...', 14, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Tidak perlu memiliki fungsi kepatuhan sama sekali', 1, false FROM q UNION ALL
SELECT id, 'Membentuk satuan kerja kepatuhan dengan skala lebih kecil', 2, false FROM q UNION ALL
SELECT id, 'Memiliki fungsi yang bertanggung jawab terhadap pelaksanaan kepatuhan', 3, true FROM q UNION ALL
SELECT id, 'Menunjuk konsultan eksternal sebagai penanggung jawab kepatuhan', 4, false FROM q;

WITH q AS (INSERT INTO questions (section_id, text, position, source) VALUES
  ((SELECT id FROM sections WHERE title = 'Pengawasan & Tata Kelola PVML' AND module_id = (SELECT id FROM modules WHERE number = 4)),
   'Selain fungsi pengawasan dan pemberian nasihat, DPS di sektor PVML juga bertugas mengarahkan, memantau, dan mengevaluasi efektivitas penerapan...', 15, 'original') RETURNING id)
INSERT INTO choices (question_id, text, position, is_correct)
SELECT id, 'Manajemen risiko kredit dan risiko pasar saja', 1, false FROM q UNION ALL
SELECT id, 'Kebijakan pemberian pembiayaan dan penagihan', 2, false FROM q UNION ALL
SELECT id, 'Tata Kelola yang Baik, manajemen risiko, kepatuhan, dan audit internal', 3, true FROM q UNION ALL
SELECT id, 'Laporan keuangan tahunan dan laporan audit eksternal', 4, false FROM q;
