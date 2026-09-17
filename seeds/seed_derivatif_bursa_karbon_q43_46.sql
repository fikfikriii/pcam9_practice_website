DO $$
DECLARE
  sec_id INT;
BEGIN
  SELECT id INTO sec_id FROM sections WHERE title = 'Derivatif & Bursa Karbon' AND module_id = (SELECT id FROM modules WHERE number = 2);

  -- Q43
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Instrumen yang diperdagangkan di Bursa Karbon Indonesia (IDXCarbon) disebut...', 43, 'additional')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Efek Karbon', FALSE),
    ((SELECT id FROM q), 'Kredit Karbon', FALSE),
    ((SELECT id FROM q), 'Unit Karbon', TRUE),
    ((SELECT id FROM q), 'Sertifikat Emisi', FALSE);

  -- Q44
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Ekosistem perdagangan berjangka derivatif keuangan terdiri dari tiga jenis mekanisme perdagangan. Ketiga mekanisme tersebut adalah...', 44, 'additional')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Bilateral, Multilateral, dan PALN', FALSE),
    ((SELECT id FROM q), 'OTC (Over-The-Counter), Multilateral, dan PALN', TRUE),
    ((SELECT id FROM q), 'Spot, Derivatif, dan Multilateral', FALSE),
    ((SELECT id FROM q), 'Bilateral, OTC, dan Bursa Berjangka', FALSE);

  -- Q45
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'Dalam mekanisme perdagangan derivatif keuangan, setiap transaksi wajib melibatkan dua jenis pelaku usaha secara bersamaan, yaitu...', 45, 'additional')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Penasihat Investasi dan Pialang Berjangka', FALSE),
    ((SELECT id FROM q), 'Pedagang Berjangka dan Pialang Berjangka', TRUE),
    ((SELECT id FROM q), 'Bursa Berjangka dan Lembaga Kliring Berjangka', FALSE),
    ((SELECT id FROM q), 'Perantara Pedagang Efek dan Bank Kustodian', FALSE);

  -- Q46
  WITH q AS (
    INSERT INTO questions (section_id, text, position, source)
    VALUES (sec_id, 'KBI (Kliring Berjangka Indonesia) dan ICH (Indonesia Clearing House) berperan sebagai SRO dalam ekosistem perdagangan berjangka. Fungsi utama keduanya adalah...', 46, 'additional')
    RETURNING id
  )
  INSERT INTO choices (question_id, text, is_correct) VALUES
    ((SELECT id FROM q), 'Menetapkan peraturan perdagangan dan tata tertib Bursa Berjangka', FALSE),
    ((SELECT id FROM q), 'Mengawasi Pialang Berjangka dan Pedagang Berjangka atas nama OJK', FALSE),
    ((SELECT id FROM q), 'Menjamin penyelesaian transaksi yang terjadi di bursa derivatif', TRUE),
    ((SELECT id FROM q), 'Menerbitkan izin operasional bagi pelaku perdagangan berjangka', FALSE);

END $$;
