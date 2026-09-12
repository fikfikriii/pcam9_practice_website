-- seed_ppdp.sql
-- Source: Kisi-Kisi IAKD_rev.docx (Sesi 3 — Pengawasan, PCS 7 Juni 2024)
-- Creates section 'PPDP' and seeds 15 MCQ questions.
-- source = 'pcs7' (from PCS 7 June 2024 exam kisi-kisi; DB has NOT NULL constraint)

DO $$
DECLARE
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN
  -- Insert section (idempotent)
  SELECT id INTO sec_id FROM sections WHERE title = 'PPDP';

  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position)
    VALUES ('PPDP', sec_pos)
    RETURNING id INTO sec_id;
  END IF;

  -- Append after any existing questions in this section
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- Soal 1
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Berapa jumlah aset kripto yang diperbolehkan untuk diperdagangkan di Indonesia dan berapa jumlah yang global dan lokal?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, '506 aset kripto : 502 aset kripto global dan 4 aset kripto lokal',   FALSE),
    (q_id, '542 aset kripto : 520 aset kripto global dan 22 aset kripto lokal',  FALSE),
    (q_id, '545 aset kripto : 506 aset kripto global dan 39 aset kripto lokal',  TRUE),
    (q_id, '545 aset kripto : 510 aset kripto global dan 35 aset kripto lokal',  FALSE);

  -- Soal 2
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Mana yang tidak termasuk dalam ekosistem aset kripto yang ada di Indonesia?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Bursa Berjangka Penyelenggara Perdagangan Aset Kripto',        FALSE),
    (q_id, 'Lembaga Kliring Berjangka',                                    FALSE),
    (q_id, 'Lembaga Pengawas Kegiatan Penawaran Komoditas Berjangka',      TRUE),
    (q_id, 'Pedagang Fisik Aset Kripto',                                   FALSE);

  -- Soal 3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dari keempat jenis aset kripto yang dikenal secara global, jenis aset kripto mana yang tidak memiliki underlying asset baik berupa aset fisik atau aset uang fiat?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Utility Token',              TRUE),
    (q_id, 'Security Token',             FALSE),
    (q_id, 'Stablecoin',                 FALSE),
    (q_id, 'Central Bank Digital Currency', FALSE);

  -- Soal 4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Mana yang merupakan ciri-ciri dari transaksi yang dilakukan di dalam blockchain?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Tidak dapat diubah',             TRUE),
    (q_id, 'Tidak dapat dipindahkan',        FALSE),
    (q_id, 'Tidak dapat diperjualbelikan',   FALSE),
    (q_id, 'Tidak dapat diperdagangkan',     FALSE);

  -- Soal 5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam transaksi aset kripto, siapa yang menerbitkan order book?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Lembaga Kliring Berjangka',     FALSE),
    (q_id, 'Lembaga Kustodian',             FALSE),
    (q_id, 'Bank Penyedia Dana Margin',     FALSE),
    (q_id, 'Pedagang Fisik Aset Kripto',    TRUE);

  -- Soal 6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Lembaga yang bertugas untuk melakukan penyimpanan aset kripto yang dimiliki oleh pedagang fisik aset kripto dan investor?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kustodian',                    TRUE),
    (q_id, 'Kliring Berjangka',            FALSE),
    (q_id, 'Penyedia Jasa Pembayaran',     FALSE),
    (q_id, 'Bank Penyimpanan Dana Margin', FALSE);

  -- Soal 7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Di bawah ini yang merupakan potensi dari pemanfaatan blockchain dan teknologi aset kripto di sektor keuangan yaitu?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Blockchain dapat dimanfaatkan untuk transaksi yang sifatnya rahasia',                  FALSE),
    (q_id, 'Pemanfaatan blockchain dapat mempercepat transaksi dan mempermudah pelacakan transaksi', TRUE),
    (q_id, 'Aset kripto dapat meningkatkan kekayaan investornya',                                  FALSE),
    (q_id, 'Blockchain dapat meningkatkan pemasaran produk dan layanan keuangan',                  FALSE);

  -- Soal 8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Mana yang merupakan risiko dari aset kripto?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aset kripto merupakan aset yang menghasilkan keuntungan', FALSE),
    (q_id, 'Aset kripto dikembangkan di luar negeri',                 FALSE),
    (q_id, 'Aset kripto tidak berwujud',                              FALSE),
    (q_id, 'Harga aset kripto sangat volatile',                       TRUE);

  -- Soal 9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Mana yang bukan merupakan fungsi dari pedagang fisik aset kripto?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Sebagai platform penyedia layanan perdagangan aset kripto',              FALSE),
    (q_id, 'Sebagai platform yang memfasilitasi transaksi jual beli aset kripto',    FALSE),
    (q_id, 'Sebagai platform yang memfasilitasi tukar menukar aset kripto dengan uang fiat', FALSE),
    (q_id, 'Sebagai platform yang memberikan tambahan dana kepada investor',         TRUE);

  -- Soal 10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Mana yang bukan merupakan fungsi dari lembaga kliring berjangka aset kripto?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Menerbitkan order book bagi pelanggan aset kripto',          TRUE),
    (q_id, 'Melakukan pencatatan dana milik pedagang aset kripto',        FALSE),
    (q_id, 'Sebagai tempat pelaksanaan settlement transaksi aset kripto', FALSE),
    (q_id, 'Pemegang master account rekening pedagang aset kripto',       FALSE);

  -- Soal 11
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Terdapat dua jenis exchange yang dikenal dalam ekosistem aset kripto, salah satunya adalah exchange yang karakteristiknya tidak transparan dan belum diatur secara ketat, atau disebut',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Centralized Exchange',   FALSE),
    (q_id, 'Decentralized Exchange', TRUE),
    (q_id, 'Dark Pool Exchange',     FALSE),
    (q_id, 'Anonymous Exchange',     FALSE);

  -- Soal 12
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Aset kripto yang memiliki nilai relatif tidak terlalu volatile dibandingkan aset kripto lainnya yaitu?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Stable Coin',   TRUE),
    (q_id, 'Utility Token', FALSE),
    (q_id, 'Monero',        FALSE),
    (q_id, 'Ripple',        FALSE);

  -- Soal 13
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Teknik melakukan validasi transaksi di suatu blockchain disebut dengan?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Immutable',  FALSE),
    (q_id, 'Traceable',  FALSE),
    (q_id, 'Mining',     TRUE),
    (q_id, 'Fork',       FALSE);

  -- Soal 14
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Apa yang dimaksud dengan aset kripto?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Aset Berwujud berbasis teknologi buku besar yang secara fisik diperdagangkan oleh Pedagang Fisik Aset Kripto terdaftar di Bappebti', FALSE),
    (q_id, 'Aset Tidak Berwujud yang berbentuk aset digital, menggunakan kriptografi, jaringan peer-to-peer, dan buku besar yang terdistribusi, untuk mengatur penciptaan unit baru, memverifikasi transaksi, dan mengamankan transaksi tanpa campur tangan pihak lain', TRUE),
    (q_id, 'Aset Digital yang dapat diperdagangkan dan diserahterimakan antar pihak dengan bantuan teknologi blockchain, serta dapat dipakai sebagai pengganti mata uang', FALSE),
    (q_id, 'Aset Digital yang dikembangkan oleh DAO untuk kepentingan organisasi yang tertutup dan tidak membutuhkan lembaga Pemerintah lainnya', FALSE);

  -- Soal 15
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Calon Pedagang Fisik Aset Kripto hanya diperbolehkan untuk menjual aset kripto kepada?',
    pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Investor retail',              FALSE),
    (q_id, 'Investor non retail',          FALSE),
    (q_id, 'Investor retail dan Non-retail', TRUE),
    (q_id, 'Sophisticated investor',       FALSE);

END $$;
