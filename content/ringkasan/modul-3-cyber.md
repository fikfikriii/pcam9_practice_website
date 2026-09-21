# Modul 3 — Cyber Risk

## Insiden Siber: Lessons from a Financial Sector Cyber Incident

### Latar Belakang Kasus

- Kasus nyata (dianonimkan): transaksi fraud senilai **Rp 2,75 miliar** melalui saluran internal yang dipercaya.
- Pelaku memanfaatkan **trusted internal channel** — jalur yang secara historis dianggap aman dan tidak diverifikasi ulang.
- Fraud berhasil karena kontrol yang ada **tidak didesain untuk mendeteksi penyalahgunaan dari dalam** melalui jalur tepercaya.

### Temuan Utama Investigasi

- Kontrol teknis **ada** tetapi tidak efektif dalam praktik — mismatch antara desain dan operasionalisasi.
- Tidak ada **mekanisme verifikasi independen** untuk transaksi besar melalui saluran internal.
- Jejak bukti (evidence trail) tidak lengkap karena logging tidak memadai.
- Respons terlambat karena ketiadaan **eskalasi otomatis** saat anomali terdeteksi.

### 5 Dimensi Efektivitas Kontrol

1. **Design** — apakah kontrol dirancang dengan benar untuk mengatasi risiko yang dituju?
2. **Coverage** — apakah kontrol mencakup seluruh skenario risiko yang relevan?
3. **Operation** — apakah kontrol berjalan sebagaimana dirancang dalam praktik sehari-hari?
4. **Evidence** — apakah ada bukti yang cukup dan dapat diverifikasi bahwa kontrol berjalan?
5. **Resilience** — apakah kontrol tetap efektif saat sistem berada di bawah tekanan/serangan?

> Kontrol yang hanya memenuhi dimensi Design dan Coverage tetapi lemah pada Operation, Evidence, atau Resilience **tidak dianggap efektif**.

### Investigasi Berbasis Bukti

- Prinsip: **"Evidence speaks louder than assertions"** — setiap klaim harus didukung bukti konkret.
- Langkah investigasi:
  1. **Preserve** — amankan log dan bukti digital sebelum terdegradasi.
  2. **Collect** — kumpulkan data dari semua sumber relevan (sistem, saksi, dokumen).
  3. **Analyze** — analisis timeline kejadian dan titik kegagalan kontrol.
  4. **Report** — buat laporan faktual dengan temuan, akar masalah, dan rekomendasi.
- **Chain of custody** digital harus dijaga agar bukti dapat digunakan secara hukum.

### Risk Treatment Prioritization (P1/P2/P3)

<div style="margin:16px 0;padding:24px 16px;background:#f3f2f2;border:1px solid rgba(32,30,29,0.12);overflow-x:auto">
  <div style="display:flex;flex-direction:column;align-items:center;gap:0">
    <div style="padding:10px 24px;border:2px solid #b91c1c;background:#fef2f2;color:#201e1d;font-size:13px;font-weight:800;text-align:center">Insiden Siber / Fraud Terdeteksi</div>
    <div style="font-size:16px;color:#605d5d;line-height:1.2">↓</div>
    <div style="padding:10px 20px;border:1.5px solid #b45309;background:#fffbeb;color:#201e1d;font-size:12px;min-width:240px;text-align:center"><strong>P1 — Contain &amp; Preserve</strong><br/><span style="color:#b45309;font-size:11px;font-weight:700">0–30 hari</span><br/><span style="color:#605d5d;font-size:11px">Hentikan kerusakan, amankan bukti, stabilkan sistem</span></div>
    <div style="font-size:16px;color:#605d5d;line-height:1.2">↓</div>
    <div style="padding:10px 20px;border:1.5px solid #2F6FED;background:#eaf1fd;color:#201e1d;font-size:12px;min-width:240px;text-align:center"><strong>P2 — Fix the Control Path</strong><br/><span style="color:#2F6FED;font-size:11px;font-weight:700">31–90 hari</span><br/><span style="color:#605d5d;font-size:11px">Perbaiki kontrol yang gagal, tutup celah, redesain prosedur</span></div>
    <div style="font-size:16px;color:#605d5d;line-height:1.2">↓</div>
    <div style="padding:10px 20px;border:1.5px solid #15803d;background:#eafaf1;color:#201e1d;font-size:12px;min-width:240px;text-align:center"><strong>P3 — Sustain Assurance</strong><br/><span style="color:#15803d;font-size:11px;font-weight:700">90+ hari</span><br/><span style="color:#605d5d;font-size:11px">Monitoring berkelanjutan, validasi perbaikan, audit independen</span></div>
  </div>
</div>

| Prioritas | Label | Timeframe | Fokus |
|-----------|-------|-----------|-------|
| **P1** | Contain & Preserve | 0–30 hari | Hentikan kerusakan lebih lanjut, amankan bukti, stabilkan sistem |
| **P2** | Fix the Control Path | 31–90 hari | Perbaiki kontrol yang gagal, tutup celah, redesain prosedur |
| **P3** | Sustain Assurance | 90+ hari | Monitoring berkelanjutan, validasi efektivitas perbaikan, audit independen |

### Prinsip Trust Boundary dalam Cyber Risk

- **"Trust must be proven at every transaction"** — tidak ada entitas internal atau eksternal yang secara otomatis dipercaya.
- Konsep **Zero Trust Architecture**: verifikasi identitas, otorisasi, dan integritas data di setiap titik, bukan hanya di perimeter.
- Praktik: multi-factor authentication, segregation of duties, four-eyes principle untuk transaksi bernilai besar.
- Insider threat adalah risiko nyata — kontrol harus dirancang untuk mendeteksi penyalahgunaan dari dalam, bukan hanya serangan dari luar.

### Pelajaran untuk Pelaksana

- Jangan asumsikan saluran yang "sudah lama aman" masih aman hari ini.
- Anomali sekecil apapun harus dilaporkan — bukan hanya insiden besar.
- Dokumentasikan setiap tindakan dan keputusan terkait transaksi tidak biasa.
- Gunakan R-V-R-E-F: **Recognize** transaksi mencurigakan → **Verify** legitimasinya → **Report** kepada atasan → **Escalate** jika tidak ada respons → **Follow Up** hingga ada kejelasan.

---

## Ringkasan Kunci untuk Ujian

### Angka dan Formula Penting

| Item | Nilai/Formula |
|------|---------------|
| Jumlah pilar MR OJK | 4 pilar |
| Jumlah jenis risiko utama SJK | 8 jenis |
| Skala matriks risiko | 5×5, skor 1–25 |
| Jumlah level risiko di matriks | 5 level (Sangat Rendah s.d. Sangat Tinggi) |
| Jumlah level maturity model | 4 level |
| Jumlah pilar anti-fraud POJK 12/2024 | 4 pilar |
| Jumlah fase budaya risiko | 4 fase |
| Dimensi efektivitas kontrol | 5 dimensi |
| Prioritas risk treatment | P1 (0–30 hr), P2 (31–90 hr), P3 (90+ hr) |
| Nilai transaksi fraud kasus siber | Rp 2,75 miliar |
| Batas waktu ACT dalam SEE→UNDERSTAND→ACT | 1×24 jam |
| RAROC formula | (Pendapatan Bersih − EL) / Modal Ekonomi |
| Residual Risk | Inherent Risk − Efektivitas Kontrol |

### Regulasi Kunci

- **POJK 12/2024** — Pencegahan dan Penanganan Fraud di SJK (4 pilar anti-fraud).
- **Basel Framework** — standar internasional untuk permodalan dan manajemen risiko perbankan.
- **IIA Three Lines Model** — standar global governance tiga lini pertahanan.

### Konsep yang Sering Diujikan

- Urutan hierarki: Risk Capacity > Risk Appetite > Risk Tolerance > Operational Limits
- Perbedaan Inherent Risk vs Residual Risk
- 3 Lini dalam Three Lines Model dan peran masing-masing
- Beda KRI Green/Amber/Red dan tindakan yang diperlukan
- R-V-R-E-F sebagai kerangka tindak pelaksana
- SEE → UNDERSTAND → ACT dengan batas waktu 1×24 jam
- 5 dimensi efektivitas kontrol: Design, Coverage, Operation, Evidence, Resilience
- "Trust must be proven at every transaction" — prinsip Zero Trust
