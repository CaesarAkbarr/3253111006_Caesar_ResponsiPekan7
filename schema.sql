CREATE DATABASE IF NOT EXISTS krs_db;
USE krs_db;

CREATE TABLE IF NOT EXISTS mahasiswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(20) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS matakuliah (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode_mk VARCHAR(20) NOT NULL UNIQUE,
    nama_mk VARCHAR(100) NOT NULL,
    sks INT NOT NULL,
    semester INT NOT NULL,
    dosen VARCHAR(100) NOT NULL,
    kuota INT DEFAULT 30
);

CREATE TABLE IF NOT EXISTS krs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mahasiswa_id INT NOT NULL,
    matakuliah_id INT NOT NULL,
    tanggal_ambil TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (mahasiswa_id) REFERENCES mahasiswa(id) ON DELETE CASCADE,
    FOREIGN KEY (matakuliah_id) REFERENCES matakuliah(id) ON DELETE CASCADE,
    UNIQUE KEY unique_pengambilan (mahasiswa_id, matakuliah_id)
);

-- Data Seeder Akun Mahasiswa
INSERT INTO mahasiswa (nim, nama, password) VALUES 
('3253111006', 'Caesar Akbar Hazimul Fikri', 'password123')
ON DUPLICATE KEY UPDATE nama=VALUES(nama);

-- Data Seeder Katalog Mata Kuliah Semester 3
INSERT INTO matakuliah (kode_mk, nama_mk, sks, semester, dosen, kuota) VALUES
('SI301', 'Pemrograman Web', 3, 3, 'Dosen PWP', 30),
('SI302', 'Sistem Operasi', 3, 3, 'Dosen SO', 30),
('SI303', 'Manajemen Proses Bisnis', 3, 3, 'Dosen MPB', 30),
('SI304', 'Krenovasi dan Kewirausahaan', 2, 3, 'Dosen KWU', 30),
('SI305', 'Pemrograman Berorientasi Objek', 3, 3, 'Dosen PBO', 30),
('SI306', 'Rekayasa Perangkat Lunak', 3, 3, 'Dosen RPL', 30)
ON DUPLICATE KEY UPDATE nama_mk=VALUES(nama_mk);
