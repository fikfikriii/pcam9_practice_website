-- Seed: Makroekonomi — Kisi-Kisi
-- Source: 240926_Soal evaluasi sharing makroekonomi dan Banking.docx
-- source = 'kisi_kisi', module_id = 4, category_id = 'makroekonomi'
-- 20 soal evaluasi sistem keuangan dan makroekonomi PCAM OJK Angkatan 9

-- New category
INSERT INTO section_categories (id, label)
VALUES ('makroekonomi', 'Makroekonomi')
ON CONFLICT (id) DO NOTHING;

-- New section
INSERT INTO sections (title, position, draw_per_session, is_active, module_id, category_id)
VALUES ('Makroekonomi', 53, 10, TRUE, 4, 'makroekonomi');

-- Q1: Dampak AI bagi sektor riil
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Perusahaan mulai menggunakan AI untuk operasional usahanya. Apa dampak AI bagi sektor riil?', 1, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Menyebabkan penurunan kualitas produk karena keputusan diambil oleh mesin tanpa manusia', 1, FALSE),
  ('Meningkatkan produktivitas, tetapi beberapa pekerjaan manusia berpotensi digantikan oleh AI', 2, TRUE),
  ('Menghambat inovasi karena perusahaan terlalu bergantung pada sistem otomatis', 3, FALSE),
  ('Menurunkan produktivitas karena perusahaan semakin bergantung pada teknologi', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q2: Penyebab kenaikan yield obligasi dunia
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Yield obligasi dunia meningkat dalam beberapa bulan terakhir. Faktor apakah yang paling mungkin menyebabkan kenaikan yield tersebut?', 2, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Investor meminta tingkat imbal hasil yang lebih tinggi akibat meningkatnya risiko dan ketidakpastian pasar', 1, TRUE),
  ('Pemerintah menurunkan penerbitan obligasi sehingga yield mengalami peningkatan', 2, FALSE),
  ('Peningkatan kepercayaan pasar terhadap stabilitas ekonomi global', 3, FALSE),
  ('Kenaikan permintaan obligasi oleh investor mendorong kenaikan yield obligasi', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q3: Dampak kenaikan Fed Rate ke Indonesia
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'The Fed meningkatkan suku bunga acuannya sebesar 25bps pada FOMC September 2026. Apa dampak yang dapat terjadi dari kenaikan suku bunga The Fed kepada ekonomi Indonesia?', 3, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Nilai tukar Rupiah mengalami penguatan karena kenaikan Fed Rate hanya mempengaruhi tingkat inflasi AS', 1, FALSE),
  ('Nilai tukar Rupiah berpotensi mengalami tekanan karena kenaikan suku bunga The Fed menyebabkan penyempitan yield differential, yang mendorong arus modal keluar dari aset Indonesia menuju aset berdenominasi USD', 2, TRUE),
  ('Tidak terdapat risiko nilai tukar sehingga Bank Indonesia dapat mempertahankan suku bunga', 3, FALSE),
  ('Kenaikan suku bunga The Fed mampu mendorong pertumbuhan ekspor dan pelemahan impor Indonesia', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q4: Dampak eskalasi konflik Timur Tengah ke Indonesia, kecuali
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Salah satu kekhawatiran eskalasi perang AS-Israel dengan Iran adalah disrupsi rantai pasok energi global, ditandai dengan penutupan kembali selat hormuz. Berikut ini merupakan dampak eskalasi konflik di Timur Tengah terhadap perekonomian Indonesia, kecuali...', 4, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Credit default swap dan yield obligasi meningkat', 1, FALSE),
  ('Nilai tukar Rupiah menguat akibat terjadinya capital outflow dan pelemahan surplus neraca dagang', 2, TRUE),
  ('Ekspektasi inflasi meningkat akibat kenaikan harga barang impor dan pelemahan Rupiah', 3, FALSE),
  ('Kenaikan biaya subsidi dan kompensasi karena Indonesia merupakan net importir minyak', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q5: Bukan dampak defisit fiskal > 3%
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Manakah di antara berikut ini yang bukan termasuk dampak yang umum terjadi jika defisit fiskal > 3%?', 5, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Nilai tukar Rupiah berpotensi tertekan akibat keluarnya arus modal asing dan peningkatan persepsi risiko', 1, FALSE),
  ('Yield obligasi pemerintah berpotensi meningkat karena investor meminta premi risiko yang lebih tinggi', 2, FALSE),
  ('Premi credit default swap (CDS) menurun dan arus modal asing cenderung masuk', 3, TRUE),
  ('Premi credit default swap (CDS) meningkat dan arus modal asing cenderung keluar', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q6: Bukan langkah BI untuk stabilisasi nilai tukar
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Nilai tukar Indonesia mencapai level Rp18.000/USD. Kenaikan ini dapat memberikan dampak pada inflasi Indonesia melalui kenaikan barang Input. Oleh sebab itu, Bank Indonesia melakukan berbagai upaya untuk meredam depresiasi nilai tukar. Manakah yang bukan termasuk langkah BI untuk stabilisasi nilai tukar adalah …', 6, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Intervensi nilai Rupiah di pasar offshore', 1, FALSE),
  ('Melakukan injeksi dana SAL kepada perbankan untuk menjaga likuiditas perbankan', 2, TRUE),
  ('Menurunkan threshold transaksi outward remmitance tanpa underlying dan pemberian insentif hedging pada transaksi valas kepada investor asing', 3, FALSE),
  ('Bank Indonesia meningkatkan BI Rate', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q7: Langkah BI saat Rupiah tertekan
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Kenaikan inflasi mendorong The Fed meningkatkan suku bunga acuannya. Jika kenaikan suku bunga berdampak pada tekanan nilai Rupiah, apa langkah yang dapat dilakukan Bank Indonesia?', 7, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Meningkatkan suku bunga acuan untuk mendorong asset keuangan Indonesia tetap atraktif dan menjaga stabilisasi Rupiah', 1, TRUE),
  ('Menurunkan suku bunga acuan untuk mendorong pertumbuhan ekonomi dan menurunkan tekanan nilai tukar', 2, FALSE),
  ('Menjaga rasio defisit APBN < 3% untuk menjaga persepsi risiko Indonesia dan menjaga arus masuk modal asing', 3, FALSE),
  ('Memberikan pendanaan kepada pemerintah agar program pemerintah terus berjalan sehingga pertumbuhan ekonomi dapat terakselerasi', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q8: Risiko penerbitan SBN bagi perbankan
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Pemerintah terus menerbitkan SBN sebagai upaya pembiayaan program pemerintah. Namun langkah tersebut memiliki risiko bagi perbankan dan penyaluran kredit, seperti …', 8, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Kredit dan loan deposit ratio mengalami peningkatan secara simultas', 1, FALSE),
  ('Peningkatan likuiditas perbankan', 2, FALSE),
  ('Financial crowding out (bank lebih memilih untuk berinvestasi ke SBN dibandingkan penyaluran kredit)', 3, TRUE),
  ('Meningkatkan non-performing loan', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q9: Bukan komponen PDB pengeluaran
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Total nilai pasar dari aktivitas barang dan jasa akhir dalam suatu negara dapat disebut produk domestik bruto (PDB). Mana saja yang bukan termasuk komponen PDB berdasarkan pengeluaran!', 9, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Konsumsi Rumah Tangga', 1, FALSE),
  ('Belanja pemerintah', 2, FALSE),
  ('Ekspor neto (Ekspor – Impor)', 3, FALSE),
  ('Kepemilikan asset luar negeri', 4, TRUE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q10: Penyebab penurunan CDS Indonesia
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Persepsi risiko (CDS) Indonesia mengalami penurunan pada April 2026. Manakah yang termasuk penyebab penurunan CDS?', 10, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Cadangan devisa Indonesia mengalami penurunan', 1, FALSE),
  ('Pemerintah Indonesia berkomitmen menjaga rasio defisit fiskal < 3%', 2, TRUE),
  ('Neraca berjalan Indonesia mengalami defisit', 3, FALSE),
  ('Penurunan rating outlook ekonomi Indonesia dari stabil ke negatif oleh lembaga pemeringkat global', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q11: PDB Riil Indonesia Q2 (angka spesifik — verifikasi ke pengajar)
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Saat ini, pertumbuhan ekonomi indonesia sebesar > 5% selama 2 kuartal berturut-turut. Berapa besaran PDB Riil Indonesia pada kuartal 2?', 11, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('5,61% YoY', 1, FALSE),
  ('5,29% YoY', 2, FALSE),
  ('5,45% YoY', 3, TRUE),
  ('5,37% YoY', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q12: Penyebab penurunan daya beli masyarakat
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Saat ini, penurunan kelas menengah dan peningkatan kelas menuju menengah mengindikasikan pelemahan daya beli masyarakat. Apa hal yang dapat menyebabkan penurunan daya beli masyarakat adalah …', 12, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Kenaikan inflasi yang melebihi kenaikan pendapatan riil, sehingga nilai uang menurun dan kemampuan beli menurun', 1, TRUE),
  ('Peningkatan jumlah pekerjaan di sektor formal yang meningkatkan penghasilan rumah tangga', 2, FALSE),
  ('Nilai tukar Rupiah menguat sehingga harga barang impor menjadi lebih murah', 3, FALSE),
  ('Penurunan harga barang dan jasa', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q13: Yield SBN stabil meski asing jual
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Investor asing melakukan aksi jual pada SBN 10 tahun Indonesia akibat adanya sentimen dari lembaga rating dunia. Namun, yield obligasi 10 tahun cenderung stabil. Apa penjelasan yang mungkin terjadi?', 13, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Pemerintah menghentikan seluruh penerbitan SBN sehingga harga obligasi tetap stabil', 1, FALSE),
  ('Permintaan SBN dari investor domestik mampu mengimbangi aksi jual investor asing. Selain itu, intervensi Bank Indonesia di pasar sekunder membantu menjaga stabilitas yield obligasi', 2, TRUE),
  ('Investor asing mengalihkan investasi dari SBN tenor 10 tahun ke jangka waktu yang lebih singkat', 3, FALSE),
  ('Aksi jual asing tidak berpengaruh pada yield obligasi 10 tahun', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q14: Langkah OJK saat IHSG volatile
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Pasar modal Indonesia sedang disorot oleh lembaga rating global. Poin penting yang dilihat dari lembaga rating adalah tata kelola dan transparansi pasar modal. Hal ini memberikan tekanan volatilitas IHSG Indonesia. Apa langkah yang paling tepat dilakukan oleh Otoritas Jasa Keuangan?', 14, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Berkoordinasi dengan BI untuk menurunkan BI Rate guna mendukung pemulihan sektor riil dan meningkatkan prospek kinerja emiten di pasar modal', 1, FALSE),
  ('Melakukan intervensi pasar saham dengan melakukan pembelian saham berkapitalisasi besar untuk menahan penurunan IHSG', 2, FALSE),
  ('Meningkatkan transparansi, memperkuat pengawasan terhadap emiten dan pelaku pasar, serta memperbaiki implementasi tata kelola pasar yang baik', 3, TRUE),
  ('Berkoordinasi dengan pemerintah untuk meningkatkan belanja fiskal dalam upaya menjaga pertumbuhan ekonomi', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q15: Bukan dampak buruk IHSG turun
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Sentimen asing menyebabkan IHSG turun tajam dalam waktu singkat. Manakah yang bukan dampak buruk dari turunnya IHSG?', 15, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Tekanan nilai tukar akibat arus keluar modal asing (capital outflow)', 1, FALSE),
  ('Negative wealth effect (konsumsi menurun seiring pelemahan portfolio investasi) di masyarakat', 2, FALSE),
  ('Potensi penurunan volume transaksi pasar saham Indonesia karena kondisi pasar modal masih dianggap tidak pasti', 3, FALSE),
  ('Peningkatan kekayaan secara umum karena masyarakat melakukan aksi take profit', 4, TRUE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q16: Kredit korporasi lebih tinggi dari UMKM
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Data OJK menunjukkan bahwa pertumbuhan kredit korporasi (15.3% YoY) lebih tinggi dibandingkan UMKM (1.0% YoY) pada bulan Juni 2026. Apa hal yang mendasari kondisi tersebut?', 16, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Permintaan kredit korporasi dan tingkat NPL korporasi yang lebih tinggi mendorong penyaluran kredit cenderung ke korporasi', 1, FALSE),
  ('Bank menganggap bahwa UMKM masih memiliki risiko yang tinggi, tercermin pada tingkat non-performing loan UMKM yang lebih tinggi dibandingkan korporasi', 2, TRUE),
  ('UMKM cenderung tidak memerlukan pembiayaan untuk meningkatkan bisnisnya', 3, FALSE),
  ('UMKM lebih memilih berinvestasi di surat berharga dibandingkan ekspansi usaha', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q17: Instrumen BI berdenominasi Rupiah untuk tarik modal asing
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Di tengah meningkatnya tekanan terhadap nilai tukar Rupiah dan keluarnya aliran modal asing (capital outflow), Bank Indonesia meluncurkan instrumen berdenominasi Rupiah untuk menarik kembali aliran dana asing sekaligus menjaga stabilitas Rupiah. Instrumen apakah yang dimaksud?', 17, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('SUVBI', 1, FALSE),
  ('SRBI', 2, TRUE),
  ('SPN', 3, FALSE),
  ('SPNS', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q18: Bukan kredit produktif
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Manakah yang tidak termasuk dalam kategori kredit produktif kepada perusahaan?', 18, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Kredit pemilikan rumah untuk konsumsi', 1, TRUE),
  ('Kredit modal kerja', 2, FALSE),
  ('Kredit investasi', 3, FALSE),
  ('Kredit ekspor', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q19: Loan to deposit ratio
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Rasio yang mengukur perbandingan antara total pinjaman dengan dana yang dihimpun oleh perbankan (Dana Pihak Ketiga) biasa disebut…', 19, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Non-performing loan', 1, FALSE),
  ('Loan to deposit ratio', 2, TRUE),
  ('Capital adequacy ratio', 3, FALSE),
  ('Return on asset ratio', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;

-- Q20: Rasio kualitas kredit per sektor
WITH q AS (
  INSERT INTO questions (text, position, section_id, source)
  SELECT 'Apa rasio yang dapat digunakan oleh perbankan untuk melihat kualitas kredit pada suatu sektor atau segment?', 20, id, 'kisi_kisi'
  FROM sections WHERE title = 'Makroekonomi' AND position = 53
  RETURNING id
)
INSERT INTO choices (text, position, is_correct, question_id) SELECT * FROM (VALUES
  ('Non-performing loan', 1, TRUE),
  ('Loan to deposit ratio', 2, FALSE),
  ('Rasio intermediasi makroprudensial', 3, FALSE),
  ('Loan to value', 4, FALSE)
) AS c(text, position, is_correct) CROSS JOIN q;
