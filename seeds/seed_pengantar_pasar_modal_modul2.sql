DO $$
DECLARE
  sec_id INT;
  mod_id INT;
BEGIN
  SELECT id INTO mod_id FROM modules WHERE number = 2;

  INSERT INTO sections (title, position, draw_per_session, is_active, module_id, category_id)
  VALUES ('Pengantar Pasar Modal', 40, 10, TRUE, mod_id, 'pasar_modal')
  RETURNING id INTO sec_id;

  -- Q1
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Suatu instrumen yang nilainya merupakan turunan dari aset keuangan yang mendasarinya disebut…', 1, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Saham', FALSE),
    ((SELECT id FROM q), 'Obligasi', FALSE),
    ((SELECT id FROM q), 'Derivatif Keuangan', TRUE),
    ((SELECT id FROM q), 'Reksa Dana', FALSE);

  -- Q2
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Berikut merupakan unsur-unsur dalam definisi "Efek" menurut UU P2SK, kecuali…', 2, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Hanya berbentuk digital', TRUE),
    ((SELECT id FROM q), 'Surat berharga atau kontrak investasi', FALSE),
    ((SELECT id FROM q), 'Dapat dialihkan dan/atau diperdagangkan di Pasar Modal', FALSE),
    ((SELECT id FROM q), 'Memperoleh manfaat ekonomis dari penerbit atau pihak lain', FALSE);

  -- Q3
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Di bawah ini yang merupakan bagian dari Lembaga Penunjang adalah…', 3, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Biro Administrasi Efek', TRUE),
    ((SELECT id FROM q), 'Lembaga Pendanaan Efek', FALSE),
    ((SELECT id FROM q), 'Notaris', FALSE),
    ((SELECT id FROM q), 'Manajer Investasi', FALSE);

  -- Q4
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Berikut merupakan alasan perlunya untuk berinvestasi, kecuali…', 4, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Diperlukan tambahan passive income selain bunga tabungan', FALSE),
    ((SELECT id FROM q), 'Melindungi nilai aset yang dimiliki', FALSE),
    ((SELECT id FROM q), 'Meningkatnya utang akibat gaya hidup', TRUE),
    ((SELECT id FROM q), 'Adanya inflasi (kenaikan harga)', FALSE);

  -- Q5
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Seorang investor ingin membeli obligasi korporasi namun menghindari risiko gagal bayar. Peringkat yang masih termasuk Investment Grade namun memiliki risiko tertinggi adalah…', 5, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'D', FALSE),
    ((SELECT id FROM q), 'AAA', FALSE),
    ((SELECT id FROM q), 'BBB', TRUE),
    ((SELECT id FROM q), 'CCC', FALSE);

  -- Q6
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Berikut ini merupakan bagian dari Self Regulatory Organization (SRO) Pasar Modal, kecuali…', 6, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'PT Bursa Efek Indonesia', FALSE),
    ((SELECT id FROM q), 'PT Kliring Penjaminan Efek Indonesia', FALSE),
    ((SELECT id FROM q), 'PT Kustodian Sentral Efek Indonesia', FALSE),
    ((SELECT id FROM q), 'PT Pemeringkat Efek Indonesia', TRUE);

  -- Q7
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Suatu Reksa Dana diwajibkan melakukan investasi sekurang-kurangnya 80% dari aktivanya dalam bentuk efek bersifat surat utang. Jenis reksa dana tersebut adalah…', 7, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Reksa Dana Campuran', FALSE),
    ((SELECT id FROM q), 'Reksa Dana Saham', FALSE),
    ((SELECT id FROM q), 'Reksa Dana Pendapatan Tetap', TRUE),
    ((SELECT id FROM q), 'Reksa Dana Pasar Uang', FALSE);

  -- Q8
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Keuntungan utama yang diperoleh pemegang saham adalah…', 8, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Jaminan Pelunasan', FALSE),
    ((SELECT id FROM q), 'Kupon dan Bunga', FALSE),
    ((SELECT id FROM q), 'Dividen dan Capital Gain', TRUE),
    ((SELECT id FROM q), 'Imbal Hasil Tetap', FALSE);

  -- Q9
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Berapakah nilai minimum modal yang disetor oleh Perusahaan Publik?', 9, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Rp2.000.000.000', FALSE),
    ((SELECT id FROM q), 'Rp3.000.000.000', TRUE),
    ((SELECT id FROM q), 'Rp4.000.000.000', FALSE),
    ((SELECT id FROM q), 'Rp1.000.000.000', FALSE);

  -- Q10
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Penyelenggaraan layanan penawaran efek yang dilakukan oleh penerbit untuk menjual efek secara langsung kepada pemodal melalui sistem elektronik yang bersifat terbuka merupakan pengertian dari…', 10, 'original')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Securities Investor Protection Fund (SIPF)', FALSE),
    ((SELECT id FROM q), 'Securities Crowdfunding (SCF)', TRUE),
    ((SELECT id FROM q), 'Penilai Harga Efek Indonesia (PHEI)', FALSE),
    ((SELECT id FROM q), 'Pendanaan Efek Indonesia (PEI)', FALSE);

END $$;
