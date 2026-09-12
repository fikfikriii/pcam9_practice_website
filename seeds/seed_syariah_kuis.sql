-- seed_syariah_kuis.sql
-- Source: Soal-Soal Tes Produk Perbankan Syariah — Sertifikasi Pengawas OJK (LPPI, September 2026)
-- Section: Perbankan Syariah | Source: original | Category: syariah | Module: 1
-- 24 questions (Q1 and Q2 were duplicates; only Q1 included)
-- All answers confirmed via KUNCI JAWABAN (answer key page).

DO $$
DECLARE
  sec_id  INTEGER;
  sec_pos INTEGER;
  q_id    INTEGER;
  pos     INTEGER := 0;
BEGIN
  -- Insert section (idempotent)
  SELECT id INTO sec_id FROM sections WHERE title = 'Perbankan Syariah';

  IF sec_id IS NULL THEN
    SELECT COALESCE(MAX(position), 0) + 1 INTO sec_pos FROM sections;
    INSERT INTO sections (title, position, draw_per_session, module_id, category_id)
    VALUES ('Perbankan Syariah', sec_pos, 15, 1, 'syariah')
    RETURNING id INTO sec_id;
  END IF;

  SELECT COALESCE(MAX(position), 0) INTO pos FROM questions WHERE section_id = sec_id;

  -- Q1 (Q2 is a duplicate of Q1 — omitted)
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Mana pernyataan dibawah ini yang merupakan perbedaan antara akad Istishna'' dan akad Salam?',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Akad Istishna'' dipergunakan untuk barang yang dalam pengadaannya membutuhkan proses pembuatan/pembikinan, sedangkan akad Salam dipergunakan untuk barang yang tidak membutuhkan proses pembuatan/pembikinan.', FALSE),
    (q_id, 'Penyelesaian pembayaran barang Istishna'' dilakukan sesuai dengan akad, sedangkan penyelesaian barang salam dalam akad salam dilakukan diawal akad.', FALSE),
    (q_id, 'Kedua pernyataan diatas adalah benar.', TRUE),
    (q_id, 'Hanya pernyataan a yang benar.', FALSE);

  -- Q3
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Bank syariah dalam menghimpun pendanaannya antara lain dapat menggunakan transaksi-transaksi berdasarkan prinsip berikut:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mudharabah dan Ijarah', FALSE),
    (q_id, 'Mudharabah dan Murabahah', FALSE),
    (q_id, 'Wadiah dan Ijarah', FALSE),
    (q_id, 'Mudharabah dan Wadiah', TRUE);

  -- Q4
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Prinsip perbankan Syariah berupa penjaminan terefleksikan dalam akad syariah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kafalah dan Rahn', TRUE),
    (q_id, 'Mudharabah', FALSE),
    (q_id, 'Murabahah', FALSE),
    (q_id, 'Ijarah', FALSE);

  -- Q5
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Transaksi Murabahah mempergunakan prinsip:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Jual beli', TRUE),
    (q_id, 'Bagi hasil', FALSE),
    (q_id, 'Sewa', FALSE),
    (q_id, 'Kredit', FALSE);

  -- Q6
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Murabahah yang dilakukan melalui proses pengadaan barang terlebih dahulu disebut dengan:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Murabahah dengan pesanan', TRUE),
    (q_id, 'Murabahah tanpa pesanan', FALSE),
    (q_id, 'Murabahah dengan persediaan', FALSE),
    (q_id, 'Murabahah dengan tender', FALSE);

  -- Q7
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam transaksi Ijarah barang, dimana bank syariah secara syariah memiliki aset tersebut dimungkinkan untuk meminta Jaminan kepada nasabah. Hal ini dimaksudkan untuk:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mengurangi risiko kerugian yang mungkin timbul.', FALSE),
    (q_id, 'Menghilangkan risiko kerugian yang mungkin timbul.', FALSE),
    (q_id, 'Menambah risiko kerugian.', FALSE),
    (q_id, 'Mitigasi risiko dalam rangka mengurangi risiko, terutama risiko legal.', TRUE);

  -- Q8
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam akuntansi mudharabah, pembagian hasil setelah memperhitungkan biaya-biaya terkait dengan pengelolaan dana mudharabah adalah metode:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Net Revenue Sharing', FALSE),
    (q_id, 'Gross Profit Sharing', FALSE),
    (q_id, 'Profit Sharing', TRUE),
    (q_id, 'Revenue Sharing', FALSE);

  -- Q9
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam akad musyarakah, apabila terdapat keuntungan akan dibagi sesuai nisbah yang disepakati, sedangkan apabila terjadi kerugian akan dibagi sesuai dengan:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'kontribusi modal yang diberikan.', TRUE),
    (q_id, 'sesuai dengan nisbah yang disepakati diawal akad.', FALSE),
    (q_id, 'Prosentase yang telah disepakati', FALSE),
    (q_id, 'Keinginan masing-masing mitra.', FALSE);

  -- Q10
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Salah satu aplikasi produk Murabahah',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kartu Kredit', FALSE),
    (q_id, 'Pembiayaan Multijasa', FALSE),
    (q_id, 'Pembiayaan Konsumen', TRUE),
    (q_id, 'Gadai', FALSE);

  -- Q11
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Salah satu aplikasi Istishna',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Charge Card', FALSE),
    (q_id, 'Pembiayaan Renovasi', TRUE),
    (q_id, 'Pembiayaan rekening koran', FALSE),
    (q_id, 'Pembiayaan gadai', FALSE);

  -- Q12
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Transfer dana antar nasabah dalam perbankan syariah menggunakan prinsip:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kafalah', FALSE),
    (q_id, 'Mudharabah', FALSE),
    (q_id, 'Wakalah', TRUE),
    (q_id, 'Musyarakah', FALSE);

  -- Q13
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pemberian garansi kepada pengusaha yang akan melakukan tender menggunakan prinsip:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kafalah', TRUE),
    (q_id, 'Mudharabah', FALSE),
    (q_id, 'Wakalah', FALSE),
    (q_id, 'Musyarakah', FALSE);

  -- Q14
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pemberian kredit/pembiayaan kepada nasabah untuk tujuan pemilikan kendaraan dapat menggunakan prinsip:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Murabahah', TRUE),
    (q_id, 'Musyarakah', FALSE),
    (q_id, 'Ijarah', FALSE),
    (q_id, 'Semua benar.', FALSE);

  -- Q15
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Idealnya pemberian kredit/pembiayaan untuk tujuan perdagangan yang modalnya diputarkan untuk jangka waktu tertentu menggunakan prinsip:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mudharabah', TRUE),
    (q_id, 'Ijarah', FALSE),
    (q_id, 'Murabahah', FALSE),
    (q_id, 'Wadiah', FALSE);

  -- Q16
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Salah satu akad yang digunakan dalam kartu kredit syariah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Murabahah', FALSE),
    (q_id, 'Istishna', FALSE),
    (q_id, 'Qardh', TRUE),
    (q_id, 'Mudharabah', FALSE);

  -- Q17
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Dalam perbankan syariah, apabila bank ingin memberikan kredit kepada petani dengan cara membeli gabah untuk 4 bulan mendatang dan dibayar dimuka, disebut:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Mudharabah', FALSE),
    (q_id, 'Salam', TRUE),
    (q_id, 'Ijon', FALSE),
    (q_id, 'Istishna', FALSE);

  -- Q18
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Produk bank syariah yang setara dengan leasing dalam keuangan konvensional',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Ijarah', TRUE),
    (q_id, 'Murabahah', FALSE),
    (q_id, 'Musyarakah', FALSE),
    (q_id, 'Ijarah Muntahiyah Bittamlik', FALSE);

  -- Q19
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Produk bank syariah yang setara dengan gadai dalam keuangan konvensional',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Qardh', FALSE),
    (q_id, 'Rahn', TRUE),
    (q_id, 'Murabahah', FALSE),
    (q_id, 'Musyarakah', FALSE);

  -- Q20
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Salah satu aplikasi produk Ijarah',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Pembiayaan Multijasa', TRUE),
    (q_id, 'Kartu Kredit', FALSE),
    (q_id, 'Pembiayaan Perkebunan', FALSE),
    (q_id, 'Charge Card', FALSE);

  -- Q21
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Prinsip jual-beli yang sesuai untuk produk penyaluran dana adalah:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Istishna', FALSE),
    (q_id, 'Salam', FALSE),
    (q_id, 'Murabahah', FALSE),
    (q_id, 'Semua betul', TRUE);

  -- Q22
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Letter of Credit dalam perbankan syariah yang telah difatwakan dapat menggunakan',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Kafalah dan Wakalah', TRUE),
    (q_id, 'Wakalah dan Hiwalah', FALSE),
    (q_id, 'Hiwalah dan Kafalah', FALSE),
    (q_id, 'Hiwalah', FALSE);

  -- Q23
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Mudharabah dapat memberikan hasil tetap, apabila',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Disepakati para pihak', FALSE),
    (q_id, 'Ditujukan untuk pembiayaan yang tidak menggunakan prinsip bagi hasil', TRUE),
    (q_id, 'Ditujukan untuk pembiayaan yang tidak menggunakan prinsip jual beli', FALSE),
    (q_id, 'Ditujukan untuk segmen ekonomi tertentu', FALSE);

  -- Q24
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pembiayaan untuk pengadaan/pembangunan ruko, idealnya menggunakan prinsip',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'Murabahah', FALSE),
    (q_id, 'Musyarakah', FALSE),
    (q_id, 'Mudharabah', FALSE),
    (q_id, 'Istishna', TRUE);

  -- Q25
  pos := pos + 1;
  INSERT INTO questions (section_id, text, position, source)
  VALUES (sec_id,
    'Pemberian potongan (diskon) kepada nasabah yang menikmati fasilitas murabahah dapat dilakukan oleh bank dengan pertimbangan:',
    pos, 'original')
  RETURNING id INTO q_id;
  INSERT INTO choices (question_id, text, is_correct) VALUES
    (q_id, 'nasabah yang melakukan pelunasan pembayaran tepat waktu atau lebih cepat waktu yang telah disepakati', FALSE),
    (q_id, 'nasabah yang melakukan kewajiban pembayaran cicilannya dengan tepat waktu', FALSE),
    (q_id, 'nasabah yang mengalami penurunan kemampuan pembayaran', FALSE),
    (q_id, 'semua betul', TRUE);

END $$;
