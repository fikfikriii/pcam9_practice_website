-- Penawaran Umum — 49 questions
-- Source: additional | Category: pasar_modal | Module: 2 | Position: 38

DO $$
DECLARE
  s INT;
  q INT;
BEGIN

INSERT INTO sections (title, position, module_id, category_id, is_active, draw_per_session)
VALUES ('Penawaran Umum', 38,
  (SELECT id FROM modules WHERE number = 2),
  'pasar_modal', TRUE, 49)
RETURNING id INTO s;

-- Q1
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Berdasarkan UU P2SK, suatu kegiatan penawaran Efek dikategorikan sebagai Penawaran Umum apabila memenuhi kriteria berikut, KECUALI:', 1, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Dilakukan di wilayah Indonesia atau kepada WNI', 1, FALSE),
(q, 'Menggunakan media massa, atau ditawarkan kepada lebih dari 100 pihak', 2, FALSE),
(q, 'Nilai penawaran melebihi Rp5 miliar dan dalam jangka waktu 12 bulan', 3, FALSE),
(q, 'Dilakukan oleh Emiten yang telah memperoleh izin OJK sebelumnya', 4, TRUE);

-- Q2
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam kriteria Penawaran Umum, suatu penawaran dianggap Penawaran Umum apabila telah dijual kepada:', 2, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Lebih dari 100 pihak', 1, FALSE),
(q, 'Lebih dari 49 pihak', 2, FALSE),
(q, 'Lebih dari 50 pihak', 3, TRUE),
(q, 'Lebih dari 25 pihak', 4, FALSE);

-- Q3
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Penawaran Efek yang dilakukan TANPA melalui Penawaran Umum (berdasarkan POJK 30/2019) ditujukan kepada pemodal profesional dengan batasan maksimal:', 3, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '100 pihak', 1, FALSE),
(q, '99 pihak', 2, FALSE),
(q, '50 pihak', 3, FALSE),
(q, '49 pihak', 4, TRUE);

-- Q4
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Mana pernyataan yang BENAR mengenai pihak yang dapat melakukan Penawaran Umum?', 4, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Hanya Badan Hukum yang dapat melakukan Penawaran Umum', 1, FALSE),
(q, 'Badan Hukum dapat menerbitkan saham, obligasi, dan sukuk; Pemerintah dapat menerbitkan obligasi dan sukuk', 2, TRUE),
(q, 'Pemerintah hanya dapat menerbitkan saham negara', 3, FALSE),
(q, 'Badan Hukum dan Pemerintah sama-sama dapat menerbitkan saham', 4, FALSE);

-- Q5
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Urutan tahapan proses Penawaran Umum yang benar adalah:', 5, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Persiapan Internal → Efektif → Pernyataan Pendaftaran → Penawaran Umum → Listing', 1, FALSE),
(q, 'Persiapan Internal → Pernyataan Pendaftaran → Efektif → Penawaran Umum → Listing', 2, TRUE),
(q, 'Pernyataan Pendaftaran → Persiapan Internal → Efektif → Penawaran Umum → Listing', 3, FALSE),
(q, 'Persiapan Internal → Penawaran Umum → Pernyataan Pendaftaran → Efektif → Listing', 4, FALSE);

-- Q6
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam persiapan internal IPO, siapa yang berperan sebagai koordinator tim IPO, membantu menawarkan saham kepada investor, dan menjamin pembelian atas saham yang tidak diserap investor publik?', 6, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Wali Amanat', 1, FALSE),
(q, 'Biro Administrasi Efek (BAE)', 2, FALSE),
(q, 'Penjamin Emisi Efek (Underwriter)', 3, TRUE),
(q, 'Konsultan Hukum', 4, FALSE);

-- Q7
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam persiapan Penawaran Umum, dokumen Pernyataan Pendaftaran terdiri dari Prospektus yang mencakup tiga aspek. Sebutkan ketiga aspek tersebut:', 7, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Akuntansi, Keterbukaan, Hukum', 1, TRUE),
(q, 'Keuangan, Operasional, Hukum', 2, FALSE),
(q, 'Akuntansi, Audit, Notaris', 3, FALSE),
(q, 'Keterbukaan, Pajak, Hukum', 4, FALSE);

-- Q8
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Pernyataan Pendaftaran dapat menjadi EFEKTIF berdasarkan lewatnya waktu, yaitu:', 8, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '14 hari kerja sejak PP diterima OJK secara lengkap', 1, FALSE),
(q, '20 hari kerja sejak PP diterima OJK secara lengkap, ATAU 20 hari kerja sejak perubahan terakhir yang disampaikan/diminta OJK', 2, TRUE),
(q, '30 hari kerja sejak PP diterima OJK secara lengkap', 3, FALSE),
(q, '10 hari kerja sejak PP diterima OJK secara lengkap', 4, FALSE);

-- Q9
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam timeline e-IPO, berapa lama batas waktu OJK untuk merespons perubahan/tambahan informasi setelah Surat Pernyataan Efektif diterbitkan?', 9, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '≥1 hari kerja dan ≤3 hari kerja', 1, FALSE),
(q, '≥3 hari kerja dan ≤5 hari kerja', 2, TRUE),
(q, '≥5 hari kerja dan ≤7 hari kerja', 3, FALSE),
(q, '≥2 hari kerja dan ≤4 hari kerja', 4, FALSE);

-- Q10
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Penggunaan sistem e-IPO saat ini dikhususkan untuk:', 10, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Semua jenis Penawaran Umum termasuk obligasi dan sukuk', 1, FALSE),
(q, 'Pihak yang menggunakan Penjamin Emisi Efek dalam Penawaran Umum DAN Perusahaan yang melakukan Penawaran Umum perdana saham', 2, TRUE),
(q, 'Hanya Penawaran Umum perdana saham tanpa underwriter', 3, FALSE),
(q, 'Hanya Penawaran Umum Berkelanjutan (PUB)', 4, FALSE);

-- Q11
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'POJK yang mengatur pelaksanaan kegiatan Penawaran Umum secara Elektronik (e-IPO) adalah:', 11, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK Nomor 36/POJK.04/2014', 1, FALSE),
(q, 'POJK Nomor 32/POJK.04/2015', 2, FALSE),
(q, 'POJK Nomor 41/POJK.04/2020', 3, TRUE),
(q, 'POJK Nomor 45/POJK.04/2024', 4, FALSE);

-- Q12
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Berdasarkan POJK 45/POJK.04/2024, pihak yang melakukan Penawaran Umum Efek bersifat EKUITAS:', 12, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Boleh memilih untuk mencatatkan atau tidak mencatatkan di Bursa Efek', 1, FALSE),
(q, 'WAJIB mencatatkan Efek bersifat ekuitasnya di Bursa Efek', 2, TRUE),
(q, 'Wajib mencatatkan di Bursa Efek hanya jika nilai IPO di atas Rp100 miliar', 3, FALSE),
(q, 'Tidak diwajibkan mencatatkan di Bursa Efek', 4, FALSE);

-- Q13
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Tujuan penggunaan sistem e-IPO mencakup hal-hal berikut, KECUALI:', 13, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Percepatan dan efisiensi pelaksanaan Penawaran Umum', 1, FALSE),
(q, 'Pembentukan harga yang lebih transparan', 2, FALSE),
(q, 'Peningkatan partisipasi perusahaan efek', 3, FALSE),
(q, 'Mengurangi jumlah investor retail dalam penjatahan IPO', 4, TRUE);

-- Q14
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam sistem e-IPO, kegiatan Penawaran Awal (bookbuilding) dilakukan:', 14, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Sebelum Pernyataan Pendaftaran disampaikan ke OJK', 1, FALSE),
(q, 'Setelah Surat Pernyataan Efektif diterbitkan', 2, FALSE),
(q, 'Pada tahap ke-1 dari 4 tahapan dalam Sistem Penawaran Umum Elektronik', 3, TRUE),
(q, 'Hanya dilakukan dalam Penawaran Umum Non e-IPO', 4, FALSE);

-- Q15
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam penjatahan terpusat (pooling), yang membedakannya dari penjatahan pasti (fixed) adalah:', 15, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Penjatahan terpusat dilakukan melalui Penjamin Emisi Efek', 1, FALSE),
(q, 'Penjatahan terpusat mengumpulkan seluruh pemesanan dalam 1 SID yang sama, pemodal Ritel dijatahkan terpisah dari Non-Ritel, dan alokasi dilakukan terlebih dahulu sebanyak 10 lot', 2, TRUE),
(q, 'Penjatahan terpusat hanya untuk investor institusional', 3, FALSE),
(q, 'Penjatahan terpusat memberikan alokasi sesuai pesanan secara langsung', 4, FALSE);

-- Q16
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'PUB EBUS diatur dalam:', 16, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK Nomor 41/POJK.04/2020', 1, FALSE),
(q, 'POJK Nomor 36/POJK.04/2014', 2, TRUE),
(q, 'POJK Nomor 32/POJK.04/2015', 3, FALSE),
(q, 'POJK Nomor 30/2019', 4, FALSE);

-- Q17
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Pemberitahuan pelaksanaan PUB EBUS terakhir disampaikan kepada OJK paling lambat pada:', 17, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Ulang tahun pertama sejak efektifnya Pernyataan Pendaftaran dalam rangka PUB EBUS', 1, FALSE),
(q, 'Ulang tahun kedua sejak efektifnya Pernyataan Pendaftaran dalam rangka PUB EBUS', 2, TRUE),
(q, 'Ulang tahun ketiga sejak efektifnya Pernyataan Pendaftaran', 3, FALSE),
(q, '3 tahun sejak tanggal efektif Pernyataan Pendaftaran', 4, FALSE);

-- Q18
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Persyaratan Efek dalam PUB EBUS adalah:', 18, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Efek merupakan EBUS yang memiliki peringkat termasuk dalam 2 peringkat teratas dan layak investasi', 1, FALSE),
(q, 'Efek merupakan EBUS yang memiliki peringkat termasuk dalam 4 peringkat teratas dan layak investasi', 2, TRUE),
(q, 'Efek merupakan EBUS yang memiliki peringkat termasuk dalam 5 peringkat teratas', 3, FALSE),
(q, 'Tidak ada persyaratan peringkat untuk EBUS dalam PUB', 4, FALSE);

-- Q19
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Persyaratan Pihak untuk dapat melakukan PUB EBUS (jalur utama) adalah:', 19, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Merupakan Emiten atau Perusahaan Publik dalam kurun waktu paling singkat 1 (satu) tahun dan tidak pernah mengalami Gagal Bayar selama 1 tahun terakhir', 1, FALSE),
(q, 'Merupakan Emiten atau Perusahaan Publik dalam kurun waktu paling singkat 2 (dua) tahun dan tidak pernah mengalami Gagal Bayar selama 2 tahun terakhir sebelum penyampaian PP', 2, TRUE),
(q, 'Merupakan Emiten atau Perusahaan Publik dalam kurun waktu paling singkat 3 (tiga) tahun', 3, FALSE),
(q, 'Tidak ada persyaratan minimum masa menjadi Emiten', 4, FALSE);

-- Q20
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Right Issue diatur dalam:', 20, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK No 36/POJK.04/2014', 1, FALSE),
(q, 'POJK No 32/POJK.04/2015', 2, TRUE),
(q, 'POJK No 14/POJK.04/2019', 3, FALSE),
(q, 'POJK No 42/POJK.04/2020', 4, FALSE);

-- Q21
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Kewajiban memberikan Hak Memesan Efek Terlebih Dahulu (HMETD) kepada pemegang saham TIDAK BERLAKU apabila:', 21, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Penambahan modal tidak melebihi 20% dari modal disetor', 1, FALSE),
(q, 'Penambahan modal tidak melebihi 10% dari modal disetor, ATAU untuk memperbaiki posisi keuangan sesuai kondisi di POJK 14/POJK.04/2019', 2, TRUE),
(q, 'Penambahan modal tidak melebihi 5% dari modal disetor', 3, FALSE),
(q, 'Kewajiban HMETD selalu berlaku tanpa pengecualian', 4, FALSE);

-- Q22
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam Timeline Right Issue, terdapat pernyataan penting bahwa:', 22, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Book building dilakukan setelah RUPS', 1, FALSE),
(q, 'Tidak ada book building di Right Issue', 2, TRUE),
(q, 'Book building dilakukan bersamaan dengan masa penawaran', 3, FALSE),
(q, 'Book building wajib dilakukan sebelum PP disampaikan ke OJK', 4, FALSE);

-- Q23
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Syarat yang harus dipenuhi Perusahaan Terbuka sebelum melakukan penambahan modal dengan HMETD mencakup:', 23, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Memperoleh persetujuan RUPS, menyampaikan PP ke OJK, dan PP telah efektif', 1, TRUE),
(q, 'Hanya memerlukan persetujuan Direksi', 2, FALSE),
(q, 'Memperoleh izin dari Bursa Efek', 3, FALSE),
(q, 'Melaporkan rencana Right Issue kepada OJK minimal 6 bulan sebelumnya', 4, FALSE);

-- Q24
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam Timeline Right Issue, minimal berapa hari sebelum RUPS pemegang saham harus sudah diinformasikan?', 24, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '14 hari', 1, FALSE),
(q, '21 hari', 2, FALSE),
(q, '38 hari', 3, TRUE),
(q, '30 hari', 4, FALSE);

-- Q25
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Suatu penawaran Efek dikategorikan sebagai Penawaran Umum (dan bukan penawaran privat) jika SALAH SATU dari kondisi berikut terpenuhi, KECUALI:', 25, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Nilai keseluruhan di atas Rp5 Miliar', 1, FALSE),
(q, 'Dilakukan dalam 1 kali atau beberapa kali dalam jangka waktu paling lama 12 bulan', 2, FALSE),
(q, 'Dilakukan di wilayah RI kepada lebih dari 100 pihak atau dijual kepada lebih dari 50 pihak', 3, FALSE),
(q, 'Dilakukan kepada investor asing yang berdomisili di luar negeri', 4, TRUE);

-- Q26
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Berapa lama batas waktu penawaran Efek yang bukan merupakan Penawaran Umum dapat dilaksanakan setelah permohonan penetapan oleh OJK?', 26, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '6 bulan', 1, FALSE),
(q, '9 bulan', 2, FALSE),
(q, '12 bulan', 3, TRUE),
(q, '24 bulan', 4, FALSE);

-- Q27
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Berapa hari kerja sebelum melakukan penawaran Efek (non-PU), pihak wajib menginformasikan memorandum informasi kepada calon pembeli Efek?', 27, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '1 hari kerja', 1, FALSE),
(q, '2 hari kerja', 2, TRUE),
(q, '3 hari kerja', 3, FALSE),
(q, '5 hari kerja', 4, FALSE);

-- Q28
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Transaksi Material diatur dalam:', 28, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK No 42/POJK.04/2020', 1, FALSE),
(q, 'POJK No 17/POJK.04/2020', 2, TRUE),
(q, 'POJK No 9/POJK.04/2018', 3, FALSE),
(q, 'POJK No 74/POJK.04/2016', 4, FALSE);

-- Q29
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Batas nilai Transaksi Material untuk kategori "Semua Jenis Transaksi" (umum) adalah:', 29, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Nilai Transaksi Material ≥ 10% ekuitas', 1, FALSE),
(q, 'Nilai Transaksi Material ≥ 20% ekuitas', 2, TRUE),
(q, 'Nilai Transaksi Material ≥ 25% ekuitas', 3, FALSE),
(q, 'Nilai Transaksi Material ≥ 50% ekuitas', 4, FALSE);

-- Q30
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Jika Perusahaan Terbuka memiliki ekuitas NEGATIF, batas nilai Transaksi Material dihitung berdasarkan:', 30, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Nilai Transaksi Material ≥ 20% ekuitas', 1, FALSE),
(q, 'Nilai Transaksi Material ≥ 10% total aset', 2, TRUE),
(q, 'Nilai Transaksi Material ≥ 25% total aset', 3, FALSE),
(q, 'Nilai Transaksi Material ≥ 5% total aset', 4, FALSE);

-- Q31
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Prosedur yang diperlukan untuk Transaksi Material dengan nilai antara 20%-50% dari ekuitas adalah:', 31, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Hanya Laporan ke OJK', 1, FALSE),
(q, 'Keterbukaan Informasi + Penilai (H+2)', 2, TRUE),
(q, 'Keterbukaan Informasi + Penilai + RUPS', 3, FALSE),
(q, 'Keterbukaan Informasi + Penilai + RUPS Independen', 4, FALSE);

-- Q32
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Transaksi Material yang wajib mendapatkan persetujuan RUPS Independen adalah transaksi yang:', 32, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Mengandung benturan kepentingan, ATAU Transaksi Material yang mengandung Transaksi Afiliasi, ATAU berpotensi terganggunya kelangsungan usaha', 1, TRUE),
(q, 'Bernilai di atas 50% ekuitas saja', 2, FALSE),
(q, 'Dilakukan dengan pihak pemerintah', 3, FALSE),
(q, 'Merupakan kegiatan usaha rutin perusahaan', 4, FALSE);

-- Q33
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Transaksi Afiliasi dan Transaksi Benturan Kepentingan diatur dalam:', 33, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK No 17/POJK.04/2020', 1, FALSE),
(q, 'POJK No 42/POJK.04/2020', 2, TRUE),
(q, 'POJK No 9/POJK.04/2018', 3, FALSE),
(q, 'POJK No 74/POJK.04/2016', 4, FALSE);

-- Q34
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Yang dimaksud dengan Benturan Kepentingan adalah:', 34, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Perbedaan antara kepentingan perusahaan terbuka dengan kepentingan pemerintah', 1, FALSE),
(q, 'Perbedaan antara kepentingan ekonomis perusahaan terbuka dengan kepentingan ekonomis pribadi anggota direksi, dewan komisaris, pemegang saham utama, atau Pengendali yang dapat merugikan perusahaan terbuka', 2, TRUE),
(q, 'Konflik antara dua perusahaan terbuka yang bergerak di bidang yang sama', 3, FALSE),
(q, 'Perbedaan kepentingan antara Bursa Efek dengan OJK', 4, FALSE);

-- Q35
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Transaksi Benturan Kepentingan pada umumnya memerlukan prosedur:', 35, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Keterbukaan Informasi + Penilai + Laporan OJK (H+2)', 1, FALSE),
(q, 'Keterbukaan Informasi + Penilai + Laporan OJK (Pengumuman RUPS) + Persetujuan RUPS Independen, dan diungkapkan pada Laporan Tahunan', 2, TRUE),
(q, 'Hanya diungkapkan pada Laporan Keuangan Tahunan', 3, FALSE),
(q, 'Tidak ada keterbukaan informasi yang diperlukan', 4, FALSE);

-- Q36
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Penambahan Modal Perusahaan Terbuka Tanpa HMETD diatur dalam:', 36, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK No 32/POJK.04/2015', 1, FALSE),
(q, 'POJK No 14/POJK.04/2019', 2, TRUE),
(q, 'POJK No 42/POJK.04/2020', 3, FALSE),
(q, 'POJK No 9/POJK.04/2018', 4, FALSE);

-- Q37
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Perusahaan Terbuka selain bank dapat melakukan penambahan modal tanpa HMETD untuk memperbaiki posisi keuangan apabila:', 37, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Mempunyai modal kerja bersih negatif dan liabilitas melebihi 50% dari aset', 1, FALSE),
(q, 'Mempunyai modal kerja bersih negatif dan liabilitas melebihi 80% dari aset Perusahaan Terbuka pada saat RUPS yang menyetujui penambahan modal', 2, TRUE),
(q, 'Rugi bersih selama 2 tahun berturut-turut', 3, FALSE),
(q, 'Total utang melebihi total aset', 4, FALSE);

-- Q38
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Penambahan modal Tanpa HMETD (selain untuk memperbaiki posisi keuangan) hanya dapat dilakukan paling banyak:', 38, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '5% dari jumlah saham yang telah ditempatkan dan disetor penuh', 1, FALSE),
(q, '10% dari jumlah saham yang telah ditempatkan dan disetor penuh', 2, TRUE),
(q, '15% dari jumlah saham yang telah ditempatkan dan disetor penuh', 3, FALSE),
(q, '20% dari jumlah saham yang telah ditempatkan dan disetor penuh', 4, FALSE);

-- Q39
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Pengambilalihan Perusahaan Terbuka diatur dalam:', 39, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK No 74/POJK.04/2016', 1, FALSE),
(q, 'POJK No 54/POJK.04/2015', 2, FALSE),
(q, 'POJK No 9/POJK.04/2018', 3, TRUE),
(q, 'POJK No 42/POJK.04/2020', 4, FALSE);

-- Q40
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Setelah terjadinya Pengambilalihan Perusahaan Terbuka, Pengendali baru wajib mengumumkan kepada publik paling lambat:', 40, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '2 (dua) hari kerja setelah terjadinya Pengambilalihan', 1, FALSE),
(q, '1 (satu) hari kerja setelah terjadinya Pengambilalihan', 2, TRUE),
(q, '3 (tiga) hari kerja setelah terjadinya Pengambilalihan', 3, FALSE),
(q, '5 (lima) hari kerja setelah terjadinya Pengambilalihan', 4, FALSE);

-- Q41
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Pengendali Perusahaan Terbuka didefinisikan sebagai pihak yang secara langsung maupun tidak langsung memiliki saham Perusahaan Terbuka lebih dari:', 41, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '25%', 1, FALSE),
(q, '33%', 2, FALSE),
(q, '50%', 3, TRUE),
(q, '67%', 4, FALSE);

-- Q42
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Penggabungan Usaha atau Peleburan Usaha Perusahaan Terbuka diatur dalam:', 42, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK No 42/POJK.04/2020', 1, FALSE),
(q, 'POJK No 9/POJK.04/2018', 2, FALSE),
(q, 'POJK No 74/POJK.04/2016', 3, TRUE),
(q, 'POJK No 54/POJK.04/2015', 4, FALSE);

-- Q43
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Perbedaan antara Penggabungan Usaha dan Peleburan Usaha adalah:', 43, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Pada Penggabungan Usaha, salah satu perusahaan tetap eksis; pada Peleburan Usaha, terbentuk entitas baru', 1, TRUE),
(q, 'Keduanya menghasilkan entitas yang sama', 2, FALSE),
(q, 'Pada Penggabungan Usaha, semua perusahaan bubar; pada Peleburan Usaha, salah satu tetap eksis', 3, FALSE),
(q, 'Tidak ada perbedaan antara keduanya', 4, FALSE);

-- Q44
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Perubahan status Perusahaan Terbuka menjadi Perseroan Tertutup secara sukarela diatur dalam:', 44, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'POJK No 9/POJK.04/2018', 1, FALSE),
(q, 'Pasal 84 ayat (2) UU P2SK', 2, TRUE),
(q, 'POJK No 74/POJK.04/2016', 3, FALSE),
(q, 'POJK No 42/POJK.04/2020', 4, FALSE);

-- Q45
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'OJK mencabut efektifnya Pernyataan Pendaftaran dalam proses perubahan status ke Perseroan Tertutup paling lama:', 45, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '7 hari kerja setelah permohonan diterima lengkap', 1, FALSE),
(q, '14 hari kerja setelah permohonan diterima lengkap', 2, TRUE),
(q, '21 hari kerja setelah permohonan diterima lengkap', 3, FALSE),
(q, '30 hari kerja setelah permohonan diterima lengkap', 4, FALSE);

-- Q46
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'Dalam mempersiapkan Penawaran Umum, Emiten dibantu oleh Profesi Penunjang yang terdaftar di OJK dan Lembaga Penunjang. Manakah dari pihak berikut yang merupakan Lembaga Penunjang, bukan Profesi Penunjang?', 46, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Konsultan Hukum', 1, FALSE),
(q, 'Notaris', 2, FALSE),
(q, 'Wali Amanat', 3, TRUE),
(q, 'Penilai', 4, FALSE);

-- Q47
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'PT Maju Tbk. sedang melaksanakan Penawaran Umum perdana saham melalui sistem e-IPO. Berapa lama minimum masa penawaran Efek kepada publik yang wajib dipenuhi dalam sistem e-IPO?', 47, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, '1 sampai 3 hari kerja', 1, FALSE),
(q, '1 sampai 5 hari kerja', 2, FALSE),
(q, '3 sampai 5 hari kerja', 3, TRUE),
(q, '5 sampai 7 hari kerja', 4, FALSE);

-- Q48
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'PT Sejahtera Tbk. hendak menyampaikan dokumen Pernyataan Pendaftaran kepada OJK sebagai langkah awal proses Penawaran Umum. Sistem elektronik OJK yang digunakan Emiten untuk penyampaian dokumen tersebut adalah:', 48, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'e-IPO, karena seluruh proses pendaftaran dilakukan melalui satu platform terintegrasi', 1, FALSE),
(q, 'SPRINT (sistem e-registration), yang merupakan sistem terpisah dari e-IPO', 2, TRUE),
(q, 'Portal SPSE (Sistem Pengadaan Secara Elektronik)', 3, FALSE),
(q, 'Sistem BIONS milik Bursa Efek Indonesia', 4, FALSE);

-- Q49
INSERT INTO questions (section_id, text, position, source) VALUES (s, 'PT Terbuka Tbk. yang sahamnya masih tercatat dan diperdagangkan di Bursa Efek Indonesia baru saja melakukan Transaksi Material. Di mana Keterbukaan Informasi atas transaksi tersebut wajib diumumkan?', 49, 'additional') RETURNING id INTO q;
INSERT INTO choices (question_id, text, position, is_correct) VALUES
(q, 'Minimal 1 surat kabar harian berbahasa Indonesia berperedaran nasional, dan situs web perusahaan', 1, FALSE),
(q, 'Situs web Perusahaan Terbuka dan situs web Bursa Efek', 2, TRUE),
(q, 'Situs web OJK dan situs web Bursa Efek', 3, FALSE),
(q, 'Situs web OJK dan minimal 1 surat kabar nasional', 4, FALSE);

END $$;
