-- seeds/seed_karbon_derivatif_pcs7.sql
-- Source: Pasar_Modal_Karbon_dan_Derivatif.pdf (15 questions)
-- Category: pasar_modal | Module: 1 | Source: pcs7
-- Sections: Bursa Karbon (11Q), Derivatif (4Q)

DO $$
DECLARE
  mod_id  INTEGER;
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN
  SELECT id INTO mod_id FROM modules WHERE number = 1;
  INSERT INTO section_categories (id, label) VALUES ('pasar_modal', 'Pasar Modal') ON CONFLICT (id) DO NOTHING;

  -- ─── Section 1: Bursa Karbon (11 questions) ───
  SELECT id INTO sec_id FROM sections WHERE title = 'Bursa Karbon';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session, module_id, category_id)
    VALUES ('Bursa Karbon', sec_pos, 10, mod_id, 'pasar_modal')
    RETURNING id INTO sec_id;
  END IF;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- Q1
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Sesuai UUP2SK dan POJK No. 10 Tahun 2026 Unit Karbon digolongkan sebagai:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Komoditas', FALSE),
    (q_id, 'Efek', TRUE),
    (q_id, 'Emisi', FALSE),
    (q_id, 'Gas Rumah Kaca', FALSE);

  -- Q2
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Manakah yang termasuk dalam mekanisme penyelenggaraan Nilai Ekonomi Karbon di Indonesia?', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pembayaran Berbasis Kinerja / Result-Based Payment', FALSE),
    (q_id, 'Perdagangan Karbon', FALSE),
    (q_id, 'Pajak Karbon', FALSE),
    (q_id, 'Semua Benar', TRUE);

  -- Q3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'KBIA MSLCHK Futures merupakan produk keuangan di ICDX', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'True', FALSE),
    (q_id, 'False', TRUE);

  -- Q4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Berikut di bawah ini adalah jenis pasar/perdagangan karbon yang tersedia di bursa karbon, kecuali:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pasar Lelang (Auction)', FALSE),
    (q_id, 'Pasar Reguler', FALSE),
    (q_id, 'Pasar Negosiasi', FALSE),
    (q_id, 'Pasar Langsung (Direct)', TRUE);

  -- Q6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'JFX dan ICDX merupakan bursa yang sekarang masih di bawah pengawasan Bappebti', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'True', TRUE),
    (q_id, 'False', FALSE);

  -- Q7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Manakah yang termasuk ruang lingkup pengawasan berdasarkan Pasal 26 angka (2) POJK 14 Tahun 2023, yaitu:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Penyelenggara Bursa Karbon', TRUE),
    (q_id, 'Project Developer perdagangan karbon', FALSE),
    (q_id, 'Sumber dana proyek perdagangan karbon', FALSE),
    (q_id, 'Lembaga Verifikasi dan Validasi', FALSE);

  -- Q8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pengawasan Transaksi ETF Nasdaq PALN merupakan kewenangan OJK', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'True', TRUE),
    (q_id, 'False', FALSE);

  -- Q9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pungutan atas Karbon adalah kewenangan OJK', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'True', FALSE),
    (q_id, 'False', TRUE);

  -- Q11
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Tugas dan wewenang OJK dalam ekosistem Perdagangan Karbon di Indonesia adalah:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengatur dan mengawasi penetapan emisi dan penerapan pajak karbon', FALSE),
    (q_id, 'Mengatur dan mengawasi perdagangan di pasar sekunder melalui Bursa', TRUE),
    (q_id, 'Mengatur dan mengawasi penerbitan unit karbon', FALSE),
    (q_id, 'Mengatur dan mengawasi penyelenggaraan perdagangan karbon secara menyeluruh', FALSE);

  -- Q13
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'SPA dan OTC merupakan mekanisme perdagangan yang sama', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'True', TRUE),
    (q_id, 'False', FALSE);

  -- Q14
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'POJK 10 Tahun 2026 adalah Peraturan OJK yang mengatur tentang Perdagangan Karbon melalui Bursa', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'True', TRUE),
    (q_id, 'False', FALSE);

  -- ─── Section 2: Derivatif (4 questions) ───
  SELECT id INTO sec_id FROM sections WHERE title = 'Derivatif';
  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session, module_id, category_id)
    VALUES ('Derivatif', sec_pos, 10, mod_id, 'pasar_modal')
    RETURNING id INTO sec_id;
  END IF;
  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- Q5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Harga derivatif berasal dari...', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mekanisme lelang', FALSE),
    (q_id, 'Fluktuasi aset yang mendasarinya', TRUE),
    (q_id, 'Jumlah Pemain', FALSE),
    (q_id, 'Kesepakatan antara pihak', FALSE);

  -- Q10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Posisi PUT adalah:', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Ekspektasi Harga Turun', TRUE),
    (q_id, 'Ekspektasi Harga Sideways', FALSE),
    (q_id, 'Ekspektasi Harga Naik', FALSE),
    (q_id, 'Ekspektasi Harga to the moon', FALSE);

  -- Q12
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Pada perdagangan produk derivatif di BEI, penentuan hak dan kewajiban, risk management dan penjaminan dilakukan oleh...', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'KSEI', FALSE),
    (q_id, 'OJK', FALSE),
    (q_id, 'ICDX', FALSE),
    (q_id, 'KPEI', TRUE);

  -- Q15
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id, 'Transaksi di bursa berjangka bersifat Bilateral', pos, 'pcs7')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'True', FALSE),
    (q_id, 'False', TRUE);

END $$;
