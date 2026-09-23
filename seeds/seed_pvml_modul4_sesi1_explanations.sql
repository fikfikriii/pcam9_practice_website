-- seed_pvml_modul4_sesi1_explanations.sql
-- Explanations for 70 questions in sections 58-61 (Module 4, PVML)

-- ==================== SECTION 1: Pengenalan PVML (sec_id = 58) ====================
UPDATE questions SET explanation = 'Pasal 1 angka 4 UU 21/2011 menyebutkan sektor LJK: perbankan, pasar modal, perasuransian, dana pensiun, modal ventura, lembaga keuangan mikro, lembaga pembiayaan, dan LJK lainnya. Perpajakan bukan termasuk sektor LJK yang diawasi OJK.' WHERE section_id = 58 AND position = 1;

UPDATE questions SET explanation = 'UU P2SK (UU 4/2023) tidak lagi secara eksplisit menyebutkan "modal ventura" dan "lembaga keuangan mikro" dalam definisi LJK. Keduanya digantikan dengan frasa umum "berdasarkan ketentuan perundang-undangan di sektor jasa keuangan".' WHERE section_id = 58 AND position = 2;

UPDATE questions SET explanation = 'Pemberian pinjaman dengan jaminan benda bergerak berdasarkan hukum gadai adalah kegiatan inti Perusahaan Pergadaian (UJP ke-5). Kegiatan ini berbeda dari pembiayaan PP yang tidak mensyaratkan agunan benda bergerak.' WHERE section_id = 58 AND position = 3;

UPDATE questions SET explanation = 'Pembiayaan dalam bentuk penyediaan dana pada proyek infrastruktur adalah kegiatan UJP ke-3, yang diselenggarakan oleh Perusahaan Pembiayaan Infrastruktur (PPI) — bukan PP biasa.' WHERE section_id = 58 AND position = 4;

UPDATE questions SET explanation = 'Penyelenggara UJP hanya boleh berbentuk Perseroan Terbatas (PT) atau Koperasi. Bentuk lain seperti Firma, CV, atau Yayasan tidak diperbolehkan karena tidak memiliki struktur kelembagaan yang memadai untuk kegiatan jasa keuangan.' WHERE section_id = 58 AND position = 5;

UPDATE questions SET explanation = 'WNA (Warga Negara Asing) HANYA boleh memiliki saham penyelenggara UJP melalui kemitraan bersama dengan Pemerintah, Pemda, WNI, atau Badan Hukum Indonesia — bukan penyertaan langsung. Ini berbeda dengan BHA yang harus melalui Pasar Modal.' WHERE section_id = 58 AND position = 6;

UPDATE questions SET explanation = 'BHA (Badan Hukum Asing) HANYA boleh memiliki saham penyelenggara UJP melalui transaksi di Pasar Modal — berbeda dengan WNA yang melalui kemitraan bersama. Penyertaan langsung oleh BHA dilarang.' WHERE section_id = 58 AND position = 7;

UPDATE questions SET explanation = 'LPBBTI (Layanan Pendanaan Bersama Berbasis Teknologi Informasi) adalah penyelenggara UJP ke-4 yang mempertemukan pemberi dana dengan penerima dana melalui sistem elektronik berbasis internet, dikenal juga sebagai pinjaman daring (P2P lending).' WHERE section_id = 58 AND position = 8;

UPDATE questions SET explanation = 'Sumber dana penyertaan yang dilarang pertama adalah pinjaman — karena modal harus berasal dari dana sendiri (equity), bukan utang, untuk memastikan soliditas keuangan dan menghindari risiko sistemik.' WHERE section_id = 58 AND position = 9;

UPDATE questions SET explanation = 'Selain pinjaman, dana penyertaan dilarang berasal dari kegiatan APU-PPT: pencucian uang (money laundering), pendanaan terorisme, dan kejahatan keuangan lainnya. Ini sesuai dengan prinsip integritas sektor keuangan.' WHERE section_id = 58 AND position = 10;

UPDATE questions SET explanation = 'Perusahaan Pergadaian masuk kategori "Lembaga Jasa Keuangan Lainnya" bersama lembaga penjaminan, LPEI, PPSP, LPBBTI, dan lembaga pengelola dana wajib — bukan Lembaga Pembiayaan (yang terdiri dari PP dan PPI).' WHERE section_id = 58 AND position = 11;

UPDATE questions SET explanation = 'LPEI (Lembaga Pembiayaan Ekspor Indonesia) termasuk dalam kategori "Lembaga Jasa Keuangan Lainnya" di bawah PVML. PMV dan LKM berdiri sebagai kategori tersendiri, sementara PP dan PPI masuk "Lembaga Pembiayaan".' WHERE section_id = 58 AND position = 12;

UPDATE questions SET explanation = 'PKK (Penilaian Kemampuan dan Kepatutan) wajib dipenuhi oleh semua pihak yang berpengaruh terhadap UJP: Anggota Direksi, Dewan Komisaris, DPS, Pemegang Saham Pengendali, Pengurus, Pengawas, dan Pengelola dari UJP.' WHERE section_id = 58 AND position = 13;

UPDATE questions SET explanation = 'PMV yang mengelola dana ventura dalam bentuk kontrak investasi bersama wajib memperoleh izin dari OJK terlebih dahulu, sesuai POJK 46 Tahun 2024 tentang Pengembangan dan Penguatan PP, PMV, dan PPI.' WHERE section_id = 58 AND position = 14;

UPDATE questions SET explanation = 'Pembiayaan melalui penyertaan modal dan/atau pembiayaan jangka tertentu untuk pengembangan usaha pasangan usaha adalah kegiatan UJP ke-2, yang diselenggarakan oleh Perusahaan Modal Ventura (PMV).' WHERE section_id = 58 AND position = 15;

-- ==================== SECTION 2: Perusahaan Pembiayaan & Modal Ventura (sec_id = 59) ====================
UPDATE questions SET explanation = 'POJK 10/POJK.05/2019 mengatur khusus tentang penyelenggaraan usaha PP Syariah dan Unit Usaha Syariah (UUS) PP. Berbeda dengan POJK 35/2018 yang mengatur PP konvensional, dan POJK 46/2024 yang mengatur pengembangan & penguatan PP secara umum.' WHERE section_id = 59 AND position = 1;

UPDATE questions SET explanation = 'Alur model bisnis PP: (1) Debitur ajukan permohonan → (2) PP setujui → (3) Debitur bayar uang muka → (4) Pembiayaan bersama bank (opsional) → (5) PP beli barang dari supplier → (6) Supplier serahkan barang ke debitur → (7) Debitur bayar angsuran.' WHERE section_id = 59 AND position = 2;

UPDATE questions SET explanation = '"Fasilitas Modal Usaha" hanya ada di kategori Pembiayaan Modal Kerja. "Fasilitas Dana" ada di Multiguna, "Pembiayaan Proyek" dan "Pembiayaan Infrastruktur" ada di Investasi. Jual dan Sewa-Balik ada di Investasi dan Modal Kerja.' WHERE section_id = 59 AND position = 3;

UPDATE questions SET explanation = '"Pembiayaan Proyek" dan "Pembiayaan Infrastruktur" hanya ada di kategori Pembiayaan Investasi PP — tidak ditemukan di Modal Kerja maupun Multiguna, karena sifatnya untuk pembiayaan aset jangka panjang.' WHERE section_id = 59 AND position = 4;

UPDATE questions SET explanation = 'Akad Pembiayaan Jual Beli PP Syariah: Murabahah (jual beli dengan margin), Salam (jual beli dengan pembayaran di muka untuk barang yang belum ada), dan Istishna'' (pemesanan pembuatan barang). Mudharabah/Musyarakah masuk kategori Investasi.' WHERE section_id = 59 AND position = 5;

UPDATE questions SET explanation = 'Akad Kafalah atau Kafalah bil Ujrah hanya boleh dilakukan PP Syariah melalui gabungan dari beberapa akad (akad komposit), tidak dapat berdiri sendiri sebagai produk tunggal — karena sifat Kafalah yang merupakan akad tabarru'' (tolong-menolong).' WHERE section_id = 59 AND position = 6;

UPDATE questions SET explanation = 'PP Syariah wajib memiliki DPS (Dewan Pengawas Syariah) yang bertugas mengawasi operasional agar sesuai standar syariah dan memberikan nasihat kepada Direksi. PP Konvensional tidak memerlukan DPS karena tidak terikat prinsip syariah.' WHERE section_id = 59 AND position = 7;

UPDATE questions SET explanation = 'PP Syariah wajib menghindari: Riba (bunga), Maysir (perjudian), Gharar (ketidakpastian/spekulasi), Tadlis (penipuan), Risywah (suap), Dhalim (zalim), dan Ikrah (pemaksaan). Larangan ini bersumber dari fatwa DSN-MUI dan tidak ada padanannya di PP Konvensional.' WHERE section_id = 59 AND position = 8;

UPDATE questions SET explanation = 'Modal Inti (Tier 1) minimum PP adalah Rp100 miliar sesuai POJK 46 Tahun 2024. PP berbentuk koperasi wajib memiliki Modal Inti dari modal sendiri koperasi. Rasio Modal Inti terhadap Modal Disetor minimal 50%.' WHERE section_id = 59 AND position = 9;

UPDATE questions SET explanation = 'Modal Pelengkap (Tier 2) diperhitungkan paling tinggi 100% dari Modal Inti (Tier 1). Selain itu, PP wajib memiliki rasio Modal Inti terhadap Modal Disetor paling rendah 50% — artinya modal sendiri harus mendominasi.' WHERE section_id = 59 AND position = 10;

UPDATE questions SET explanation = 'BNPL pada PP/PPS diatur dalam POJK Nomor 32 Tahun 2025 tentang Penyelenggaraan Beli Sekarang Bayar Nanti. POJK ini terpisah dari regulasi PP umum (POJK 46/2024) karena BNPL memiliki karakteristik unik sebagai pembiayaan digital berbasis transaksi.' WHERE section_id = 59 AND position = 11;

UPDATE questions SET explanation = 'Kolektibilitas PP: Lancar (≤10 hari), Dalam Perhatian Khusus/DPK (>10 s.d. 90 hari), Kurang Lancar (>90 s.d. 120 hari), Diragukan (>120 s.d. 180 hari), Macet (>180 hari). DPK dimulai dari hari ke-11.' WHERE section_id = 59 AND position = 12;

UPDATE questions SET explanation = 'Piutang "Macet" jika keterlambatan >180 hari kalender. Urutan lengkap: Lancar (≤10 hari) → DPK (>10-90 hari) → Kurang Lancar (>90-120 hari) → Diragukan (>120-180 hari) → Macet (>180 hari).' WHERE section_id = 59 AND position = 13;

UPDATE questions SET explanation = 'Restrukturisasi dilarang jika tujuannya adalah window dressing: memperbaiki kualitas piutang atau menghindari kenaikan CKPN (cadangan kerugian). Restrukturisasi hanya boleh jika debitur genuine mengalami kesulitan dan masih prospektif.' WHERE section_id = 59 AND position = 14;

UPDATE questions SET explanation = 'Jika pemberian pembiayaan awal dilakukan oleh pihak berkewenangan tertinggi (misal: komite kredit tertinggi), maka keputusan restrukturisasi wajib diambil melalui Rapat Direksi — satu tingkat lebih tinggi dari pengambil keputusan pembiayaan awal.' WHERE section_id = 59 AND position = 15;

UPDATE questions SET explanation = 'PP wajib menyampaikan 2 jenis laporan berkala: (1) Laporan bulanan untuk monitoring rutin OJK, dan (2) Laporan keuangan tahunan yang diaudit oleh akuntan publik untuk memastikan transparansi dan akuntabilitas.' WHERE section_id = 59 AND position = 16;

UPDATE questions SET explanation = 'PP yang memanfaatkan TI wajib memiliki: salah satu anggota Direksi DAN pejabat 1 tingkat di bawah Direksi yang membidangi pengelolaan sistem informasi — keduanya harus bersertifikat kompetensi TI, bukan hanya salah satu.' WHERE section_id = 59 AND position = 17;

UPDATE questions SET explanation = 'Divestasi PMV adalah proses keluar dari investasi (exit strategy). Caranya: melalui IPO (perusahaan pasangan usaha go public di bursa efek) atau dijual langsung ke pemegang saham/investor baru. Tujuannya adalah merealisasikan keuntungan dari pertumbuhan nilai perusahaan.' WHERE section_id = 59 AND position = 18;

UPDATE questions SET explanation = 'Berdasarkan POJK 25/POJK.05/2023, PMV dan PMVS wajib berbentuk PT atau Koperasi. PMVS (PMV Syariah) selain berbentuk PT/Koperasi juga wajib memiliki DPS dan mematuhi prinsip syariah.' WHERE section_id = 59 AND position = 19;

UPDATE questions SET explanation = 'PMV memberikan modal/pembiayaan kepada pasangan usaha (portfolio company) dengan prioritas UMKM, khususnya UMKM yang membutuhkan modal untuk pengembangan dan pertumbuhan usaha — sesuai mandat POJK 25/2023.' WHERE section_id = 59 AND position = 20;

-- ==================== SECTION 3: LJK Lainnya (sec_id = 60) ====================
UPDATE questions SET explanation = 'Modal disetor minimum LPBBTI saat pendirian adalah Rp25 miliar sesuai POJK 40 Tahun 2024. Ini lebih tinggi dari batas minimum umum untuk memastikan LPBBTI memiliki kapasitas keuangan yang memadai dalam mengelola platform digital.' WHERE section_id = 60 AND position = 1;

UPDATE questions SET explanation = 'Batas maksimum pendanaan LPBBTI per Penerima Dana adalah Rp2 miliar (konsumtif maupun produktif). Batas ini dapat ditingkatkan hingga Rp5 miliar khusus untuk pendanaan produktif dengan syarat TWP90 ≤5% dalam 6 bulan terakhir.' WHERE section_id = 60 AND position = 2;

UPDATE questions SET explanation = 'Untuk pendanaan produktif hingga Rp5 miliar, Penyelenggara LPBBTI harus membuktikan kualitas portofolio dengan TWP90 (Tingkat Wanprestasi 90 hari) maksimal 5% dalam 6 bulan terakhir, dan tidak sedang dalam pengenaan sanksi OJK.' WHERE section_id = 60 AND position = 3;

UPDATE questions SET explanation = 'Seluruh perjanjian LPBBTI (antara Penyelenggara-Pemberi Dana dan Penyelenggara-Penerima Dana) wajib menggunakan Tanda Tangan Elektronik (TTE) yang telah diamankan dengan Sertifikat Elektronik — sesuai UU ITE dan standar keamanan digital.' WHERE section_id = 60 AND position = 4;

UPDATE questions SET explanation = 'Batas kepemilikan 25% per Pemberi Dana dan afiliasinya adalah untuk mencegah konsentrasi risiko dan ketergantungan pada satu sumber pendanaan. Pemberi Dana yang merupakan LJK yang diawasi OJK mendapat batas lebih tinggi (75%).' WHERE section_id = 60 AND position = 5;

UPDATE questions SET explanation = 'Modal disetor Pergadaian berjenjang sesuai luas wilayah: Kabupaten/Kota Rp2M, Provinsi Rp8M, Nasional Rp100M. Jenjang ini memastikan modal yang dimiliki sepadan dengan skala operasional dan risiko yang dihadapi.' WHERE section_id = 60 AND position = 6;

UPDATE questions SET explanation = 'Rasio pinjaman gadai minimal 51% dari total pinjaman memastikan bisnis inti Pergadaian tetap pada kegiatan pinjaman beragunan benda bergerak (core business), tidak bergeser ke aktivitas lain yang bukan kompetensi utamanya.' WHERE section_id = 60 AND position = 7;

UPDATE questions SET explanation = 'Tingkat Kesehatan minimum Pergadaian adalah Peringkat Komposit 3 (PK 3). Status pengawasan khusus diterapkan jika PK 4, NPF 0% ≤ MSMD <50%; PK 5, MSMD <0%; atau NPF ≥25% dengan dampak signifikan.' WHERE section_id = 60 AND position = 8;

UPDATE questions SET explanation = 'LKM wajib transformasi ke BPR/BPRS jika memenuhi salah satu dari 3 syarat: (1) beroperasi >1 wilayah kab/kota, (2) Ekuitas ≥5x modal minimum BPR/BPRS, atau (3) DPK dalam 1 tahun ≥25x modal minimum BPR/BPRS.' WHERE section_id = 60 AND position = 9;

UPDATE questions SET explanation = 'Skala LKM berdasarkan aset: Kecil = desa/kelurahan dengan aset <Rp1M; Menengah = kecamatan dengan aset Rp1M s.d. <Rp10M; Besar = kab/kota dengan aset ≥Rp10M. OJK menetapkan skala LKM pertama kali paling lambat 28 Februari 2025.' WHERE section_id = 60 AND position = 10;

UPDATE questions SET explanation = 'Kegiatan utama PPI berdasarkan POJK 46/2020: (1) Direct lending untuk infrastruktur, (2) Refinancing infrastruktur yang dibiayai pihak lain, (3) Pembiayaan subordinasi terkait infrastruktur, dan (4) Kegiatan lain setelah persetujuan OJK.' WHERE section_id = 60 AND position = 11;

UPDATE questions SET explanation = 'PT SMI didirikan 26 Februari 2009 berdasarkan PP No. 66/2007 dengan tujuan menjadi katalis percepatan pembangunan infrastruktur Indonesia. Kegiatan usahanya mencakup pemberian fasilitas pembiayaan, penyertaan modal, upaya pasar swap, dan bantuan teknis.' WHERE section_id = 60 AND position = 12;

UPDATE questions SET explanation = 'UU P2SK (Bab X Pasal 106 ayat 5 huruf c) menetapkan PT SMI berada di luar ruang lingkup usaha jasa pembiayaan — artinya PT SMI tidak lagi tunduk pada regulasi PPI (POJK 46/2020). PT SMI kini diawasi berdasarkan POJK 16/2024.' WHERE section_id = 60 AND position = 13;

UPDATE questions SET explanation = 'PPSP (PT SMF) melakukan sekuritisasi: membeli portofolio KPR dari bank penyalur → menerbitkan Efek Beragun Aset (EBA) berbasis KPR → investor membeli EBA → dana kembali ke bank untuk KPR baru. Tujuannya mengatasi mismatch funding jangka pendek-panjang di perbankan.' WHERE section_id = 60 AND position = 14;

UPDATE questions SET explanation = 'Rasio likuiditas PPSP (rasio lancar) minimal 110% — lebih tinggi dari standar umum 100% — karena PPSP mengelola aset KPR jangka panjang yang membutuhkan buffer likuiditas lebih kuat untuk menghadapi risiko pelunasan dini atau perubahan suku bunga.' WHERE section_id = 60 AND position = 15;

UPDATE questions SET explanation = 'LPEI menggunakan One Board System: hanya ada Dewan Direktur sebagai organ tunggal yang menggabungkan fungsi eksekutif dan pengawasan. Berbeda dengan perusahaan umum (Two Board System) yang memisahkan Direksi dan Dewan Komisaris.' WHERE section_id = 60 AND position = 16;

UPDATE questions SET explanation = 'Tiga kegiatan usaha LPEI: (1) Pembiayaan ekspor (kredit untuk eksportir dan importir produk Indonesia), (2) Penjaminan ekspor (garansi atas risiko transaksi ekspor), dan (3) Asuransi ekspor (perlindungan terhadap risiko tidak terbayarnya ekspor).' WHERE section_id = 60 AND position = 17;

UPDATE questions SET explanation = 'Program ULaMM (Unit Layanan Modal Mikro) PT PNM memberikan pembiayaan modal usaha langsung kepada perorangan atau Bidang Usaha mikro dan kecil, dengan batas maksimal Rp200 juta dan Sertifikat Hak Milik (SHM) sebagai agunan.' WHERE section_id = 60 AND position = 18;

UPDATE questions SET explanation = 'Mekaar (Membina Ekonomi Keluarga Sejahtera) adalah program PT PNM khusus untuk perempuan pra-sejahtera pelaku usaha super mikro, menggunakan model pembiayaan kelompok tanpa agunan — berbeda dari ULaMM yang mensyaratkan agunan SHM.' WHERE section_id = 60 AND position = 19;

UPDATE questions SET explanation = 'Simpanan Tapera total 3% dari gaji/upah: 2,5% ditanggung peserta dan 0,5% ditanggung pemberi kerja. Dana dibagi ke tiga rekening: Dana Pemanfaatan (pembiayaan perumahan), Dana Cadangan (untuk ahli waris), dan Dana Pemupukan (investasi melalui Manajer Investasi).' WHERE section_id = 60 AND position = 20;

-- ==================== SECTION 4: Pengawasan & Tata Kelola PVML (sec_id = 61) ====================
UPDATE questions SET explanation = 'Siklus Pengawasan PVML Berbasis Risiko terdiri dari 6 tahap: (1) KYFI — pemahaman PVML, (2) Penilaian TKS, (3) Perencanaan Pengawasan (Supervisory Plan), (4) Pemeriksaan Berbasis Risiko (RBE), (5) Pengkinian TKS, (6) Tindakan & Pemantauan.' WHERE section_id = 61 AND position = 1;

UPDATE questions SET explanation = 'Tahap pertama adalah KYFI (Know Your Financial Institution) — pengumpulan data dan informasi melalui pengawasan tidak langsung untuk memahami profil bisnis, risiko, dan kondisi PVML sebelum merencanakan pengawasan lebih lanjut.' WHERE section_id = 61 AND position = 2;

UPDATE questions SET explanation = 'Dari 9 cakupan risiko PVML (Kredit, Pasar, Operasional, Strategis, Likuiditas, Hukum, Kepatuhan, Reputasi, Asuransi), Risiko Asuransi HANYA berlaku bagi LPEI karena LPEI satu-satunya PVML yang menjalankan kegiatan asuransi ekspor.' WHERE section_id = 61 AND position = 3;

UPDATE questions SET explanation = 'Berdasarkan POJK Tata Kelola PVML: aset >Rp250M wajib minimal 3 anggota Direksi; aset ≤Rp250M wajib minimal 2 anggota Direksi. Pengecualian: LKM dengan total aset <Rp10M dan tidak menghimpun dana masyarakat boleh hanya 2 anggota.' WHERE section_id = 61 AND position = 4;

UPDATE questions SET explanation = 'Jumlah Dekom: aset >Rp250M wajib minimal 2 Dekom; aset ≤Rp250M wajib minimal 1 Komisaris Independen. PVML wajib memastikan jumlah Dekom paling banyak SAMA dengan jumlah Direksi — Dekom tidak boleh lebih banyak dari Direksi.' WHERE section_id = 61 AND position = 5;

UPDATE questions SET explanation = 'PVML dengan aset >Rp250M wajib membentuk 3 komite di bawah Dewan Komisaris: Komite Audit, Komite Pemantau Risiko, dan Komite Remunerasi & Nominasi (KRN). Dekom juga dapat membentuk komite lain sesuai kebutuhan.' WHERE section_id = 61 AND position = 6;

UPDATE questions SET explanation = 'DPS boleh merangkap jabatan di paling banyak 3 lembaga keuangan syariah lain — batas ini untuk memastikan DPS memiliki waktu, perhatian, dan kapasitas yang cukup dalam mengawasi setiap lembaga yang ditanganinya.' WHERE section_id = 61 AND position = 7;

UPDATE questions SET explanation = 'Cooling-off period 6 bulan berlaku bagi mantan pegawai/pejabat aktif OJK yang ingin menjadi Direksi/Dekom/DPS PVML — untuk mencegah konflik kepentingan dan memastikan independensi antara regulator dan pihak yang diawasi.' WHERE section_id = 61 AND position = 8;

UPDATE questions SET explanation = 'PVML dengan aset >Rp250M wajib mengangkat Direktur Utama/setara untuk memastikan ada satu pemimpin eksekutif yang bertanggung jawab penuh atas pengelolaan perusahaan dan dapat menjadi titik akuntabilitas tunggal bagi stakeholder.' WHERE section_id = 61 AND position = 9;

UPDATE questions SET explanation = 'Direktur Utama/setara tidak boleh merupakan pemegang saham perseorangan dan tidak boleh memiliki hubungan keluarga hingga derajat kedua (orang tua, anak, saudara, mertua) dengan pemegang saham perseorangan — untuk menjaga independensi kepemimpinan eksekutif.' WHERE section_id = 61 AND position = 10;

UPDATE questions SET explanation = 'Rapat Direksi minimal 1 kali per bulan. Setiap anggota Direksi wajib hadir paling sedikit 50% dari total rapat Direksi dalam periode 1 tahun. Rapat bersama Direksi-Dekom wajib paling sedikit 1 kali per 3 bulan.' WHERE section_id = 61 AND position = 11;

UPDATE questions SET explanation = 'Rapat Dewan Komisaris (jika Dekom >1 orang) wajib minimal 1 kali per 3 bulan. Setiap anggota Dekom wajib hadir minimal 75% dari total rapat Dekom dalam 1 tahun — lebih tinggi dari kewajiban kehadiran Direksi (50%).' WHERE section_id = 61 AND position = 12;

UPDATE questions SET explanation = 'Rapat bersama Direksi-DPS (joint meeting) wajib minimal 1 kali per 2 bulan — lebih sering dari rapat Dekom (per 3 bulan) untuk memastikan koordinasi aktif antara manajemen eksekutif dan pengawas syariah dalam penerapan prinsip syariah sehari-hari.' WHERE section_id = 61 AND position = 13;

UPDATE questions SET explanation = 'PVML aset >Rp250M: wajib membentuk Satuan Kerja Kepatuhan (SKK) yang berdiri sendiri. PVML aset ≤Rp250M: cukup memiliki "fungsi" kepatuhan (bisa dirangkap/digabung). Pengecualian diberikan bagi LKM skala menengah dan kecil.' WHERE section_id = 61 AND position = 14;

UPDATE questions SET explanation = 'DPS memiliki fungsi ganda: (1) Pengawasan syariah — memastikan kegiatan usaha sesuai prinsip syariah, dan (2) Advisory — mengarahkan, memantau, mengevaluasi efektivitas Tata Kelola yang Baik, manajemen risiko, kepatuhan, dan audit internal dari perspektif syariah.' WHERE section_id = 61 AND position = 15;
