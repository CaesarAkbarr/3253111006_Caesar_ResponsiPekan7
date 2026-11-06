# Aplikasi Pengambilan Mata Kuliah (KRS) - Responsi PWP

Aplikasi web sistem Kartu Rencana Studi (KRS) mahasiswa berbasis Python Flask, MySQL, Bootstrap 5, Flask Session, dan jQuery AJAX. Project ini dikembangkan untuk memenuhi kriteria penugasan Responsi Praktikum Pemrograman Web (Pekan 7), Program Studi D3 Sistem Informasi, Fakultas Sains & Teknologi, Universitas Teknologi Yogyakarta.

---

## Identitas Mahasiswa
- **Nama:** Caesar Akbar Hazimul Fikri
- **NIM:** 3253111006
- **Program Studi:** D3 Sistem Informasi
- **Mata Kuliah:** Pemrograman Web Praktik (PWP)
- **Dosen Pengampu:** Dosen Pemrograman Web

---

## Pemenuhan Kriteria Responsi

Aplikasi ini telah dirancang dan diuji untuk memenuhi lima kriteria utama yang dipersyaratkan:

1. **Virtual Environment**
   - Menggunakan virtual environment Python (`.venv`) terisolasi.
   - Manajemen paket pustaka terdaftar rapi pada file `requirements.txt`.
   - File konfigurasi `.gitignore` aktif mencegah file pustaka dan konfigurasi sensitif terdorong ke repositori publik.

2. **Integrasi Flask dan Bootstrap**
   - Struktur antarmuka modular memanfaatkan Jinja2 Template Inheritance (`base.html`, `login.html`, `register.html`, `krs.html`).
   - Styling berbasis Bootstrap 5 responsif: Navbar interaktif, Card informasi profil, Badge status matakuliah, form input dengan ikon Bootstrap Icons, dan sistem dialog modal notifikasi.

3. **Integrasi Flask dan MySQL**
   - Manajemen basis data relasional melalui driver `mysql-connector-python`.
   - Struktur database `krs_db` memuat tiga tabel relasional: `mahasiswa`, `matakuliah`, dan `krs`.
   - Penerapan relasi transaksi many-to-many lengkap dengan constraint integritas referensial `FOREIGN KEY ... ON DELETE CASCADE` dan `UNIQUE KEY` untuk mencegah pengambilan mata kuliah berulang.
   - Eksekusi query backend menggunakan prepared statement parameterized (`%s`) untuk proteksi dari SQL Injection.

4. **Integrasi Flask Session**
   - State sesi pengguna dienkripsi dengan `SECRET_KEY` dari konfigurasi environment (`.env`).
   - Mekanisme autentikasi ganda: Login dan Registrasi Mahasiswa Baru.
   - Route Protection: Akses halaman utama KRS diproteksi ketat; permintaan tanpa session valid otomatis dialihkan ke halaman login.
   - Fitur Logout yang membersihkan seluruh data sesi pengguna secara aman (`session.clear()`).

5. **Integrasi jQuery dan Bootstrap**
   - Komunikasi data asinkron via jQuery AJAX (`$.ajax`) untuk aksi Ambil Mata Kuliah (`POST /api/krs/ambil`) dan Batalkan Mata Kuliah (`POST /api/krs/batal`) tanpa reload browser.
   - Pembaruan status tombol dan counter total SKS secara real-time di antarmuka.
   - Validasi batas maksimal 24 SKS di sisi server dengan respon pesan kesalahan langsung ke frontend.
   - Validasi data dua lapis (Two-Tier Validation):
     * Client-Side (jQuery): Pengecekan tipe data numerik NIM dan panjang kata sandi sebelum form dikirim.
     * Server-Side (Flask & MySQL): Pengecekan keberadaan akun, validasi kata sandi, dan deteksi duplikasi data saat registrasi.
   - Notifikasi interaktif berbasis Bootstrap Modal (`feedbackModal`) dan floating alert otomatis.
   - Fitur pencarian instan (Live Search Filter) katalog mata kuliah secara real-time via event handler jQuery.

---

## Tangkapan Layar Tampilan Aplikasi (Screenshots)

### 1. Halaman Autentikasi Login Mahasiswa
Antarmuka login mahasiswa dengan form berikon, validasi kredensial, serta integrasi dialog modal untuk penanganan format data salah.

![Login Mahasiswa](screenshoot/Screenshot%202026-11-06%20at%2011-11-07%20Login%20Mahasiswa%20-%20Portal%20KRS.png)

---

### 2. Halaman Registrasi Mahasiswa Baru
Fasilitas pendaftaran akun mahasiswa baru dengan verifikasi kelengkapan kolom, tipe data angka untuk NIM, dan validasi duplikasi data pada database MySQL.

![Pendaftaran Mahasiswa](screenshoot/Screenshot%202026-11-06%20at%2011-11-32%20Daftar%20Akun%20Mahasiswa%20-%20Portal%20KRS.png)

---

### 3. Dashboard Pengambilan Mata Kuliah (KRS)
Halaman utama setelah berhasil login. Menampilkan profil mahasiswa aktif, indikator beban SKS dinamis (maksimal 24 SKS), kotak pencarian mata kuliah, serta tabel interaktif dengan tombol aksi berbasis jQuery AJAX.

![Dashboard KRS Mahasiswa](screenshoot/Screenshot%202026-11-06%20at%2011-12-35%20Dashboard%20Pengambilan%20Mata%20Kuliah.png)

---

## Struktur Direktori Project

```text
3253111006_Caesar_ResponsiPekan7/
├── .env.example            # Template konfigurasi environment database & port
├── .gitignore              # Daftar file/folder yang diabaikan oleh Git
├── README.md               # Dokumentasi lengkap dan panduan proyek
├── app.py                  # Logika utama aplikasi Flask, routing, & endpoint API
├── requirements.txt        # Daftar pustaka Python yang dibutuhkan
├── schema.sql              # Struktur tabel database MySQL dan data awal (seeder)
├── screenshoot/            # Bukti tangkapan layar antarmuka sistem
│   ├── Screenshot 2026-11-06 at 11-11-07 Login Mahasiswa - Portal KRS.png
│   ├── Screenshot 2026-11-06 at 11-11-32 Daftar Akun Mahasiswa - Portal KRS.png
│   └── Screenshot 2026-11-06 at 11-12-35 Dashboard Pengambilan Mata Kuliah.png
├── static/
│   └── js/
│       └── krs.js          # Logika jQuery AJAX, validasi client, & modal dialog
└── templates/
    ├── base.html           # Layout induk antarmuka (Navbar & Modal)
    ├── login.html          # Template halaman login
    ├── register.html       # Template halaman registrasi mahasiswa
    └── krs.html            # Template dashboard KRS dan tabel katalog matakuliah
```

---

## Panduan Instalasi dan Pengoperasian

### 1. Kloning Repositori
```bash
git clone https://github.com/CaesarAkbarr/3253111006_Caesar_ResponsiPekan7.git
cd 3253111006_Caesar_ResponsiPekan7
```

### 2. Penyiapan Virtual Environment
```bash
# Membuat environment
python -m venv .venv

# Aktivasi di Windows (Command Prompt / PowerShell):
.venv\Scripts\activate

# Aktivasi di Linux / macOS:
source .venv/bin/activate
```

### 3. Instalasi Dependensi
```bash
pip install -r requirements.txt
```

### 4. Konfigurasi Basis Data MySQL
1. Pastikan service MySQL pada XAMPP atau Laragon telah berjalan aktif.
2. Buka phpMyAdmin di browser (`http://localhost/phpmyadmin`).
3. Eksekusi query yang terdapat pada file `schema.sql` untuk membuat basis data `krs_db`, struktur tabel, serta data awal mata kuliah.
4. Buat file `.env` pada direktori utama project (sesuaikan dengan kredensial MySQL lokal Anda):
   ```env
   FLASK_APP=app.py
   FLASK_DEBUG=True
   FLASK_HOST=127.0.0.1
   FLASK_PORT=5000
   SECRET_KEY=rahasia_portal_krs_pwp_2026

   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=
   DB_NAME=krs_db
   ```

### 5. Menjalankan Aplikasi
```bash
python app.py
```
Akses sistem melalui peramban web pada alamat: `http://127.0.0.1:5000`

---

## Akun Demo Pengujian
Untuk pengujian cepat tanpa mendaftar akun baru, dapat menggunakan data akun bawaan seeder:
- **NIM:** `3253111006`
- **Kata Sandi:** `password123`
