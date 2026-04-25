-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Apr 2026 pada 04.59
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recording_senkom`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventaris_barang`
--

CREATE TABLE `inventaris_barang` (
  `id` int(11) NOT NULL,
  `tim` varchar(50) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `merk_tipe` varchar(100) DEFAULT NULL,
  `jumlah_s` int(11) NOT NULL DEFAULT 0,
  `jumlah_us` int(11) NOT NULL DEFAULT 0,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `inventaris_barang`
--

INSERT INTO `inventaris_barang` (`id`, `tim`, `nama_barang`, `merk_tipe`, `jumlah_s`, `jumlah_us`, `keterangan`, `created_at`) VALUES
(2, 'harpon', 'PABX AX 3300', 'MITEL', 2, 0, 'Aman', '2026-04-25 02:53:06'),
(3, 'harpon', 'IP Phone 6920', 'MITEL', 10, 6, 'Aman', '2026-04-25 02:54:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_kegiatan`
--

CREATE TABLE `laporan_kegiatan` (
  `id` int(11) NOT NULL,
  `tanggal_kegiatan` date NOT NULL,
  `tim` enum('harpon','sound','cyber','harrad') NOT NULL,
  `lokasi_ruangan` varchar(100) NOT NULL,
  `deskripsi_pemeliharaan` text NOT NULL,
  `penyelesaian` text DEFAULT NULL,
  `deskripsi_kegiatan` text DEFAULT NULL,
  `personel_terlibat` varchar(255) NOT NULL,
  `id_admin_input` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `nama_katim_rekam` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `laporan_kegiatan`
--

INSERT INTO `laporan_kegiatan` (`id`, `tanggal_kegiatan`, `tim`, `lokasi_ruangan`, `deskripsi_pemeliharaan`, `penyelesaian`, `deskripsi_kegiatan`, `personel_terlibat`, `id_admin_input`, `created_at`, `nama_katim_rekam`) VALUES
(1, '2026-04-24', 'harpon', 'Bintalid (9066)', 'Tidak ada tone di box Dispers', 'Mengecek kembali di box sebelumnya ', NULL, 'Sertu Fauzan Sadewa, Serma Iwan Budiarso, Pelda Tri Istanto', 1, '2026-04-23 17:45:13', 'Katim Harpon'),
(2, '2026-04-24', 'harpon', 'Meteo (9058)', 'Pesawat Telpon tidak bisa digunakan(us)', 'Mengganti Pesawat Telpon yang baru', NULL, 'Sertu Fauzan Sadewa, Serma Iwan Budiarso', 1, '2026-04-24 01:44:27', 'Katim Harpon'),
(5, '2026-04-25', 'harpon', 'Kapekas (9013)', 'Kabel melintang di ruangan', 'Merapihkan kabel yang terurai di ruangan sehingga kembali rapih', NULL, 'Sertu Fauzan Sadewa, Serma Iwan Budiarso, Pelda Tri Istanto', 1, '2026-04-24 02:33:06', 'Pelda Tri Istanto'),
(6, '2026-04-25', 'sound', 'Lapangan Dirgantara', '-', '-', 'Set up duk sound untuk Apel pagi jam 06.00', 'Serda Muin, Kopda Sabar', 2, '2026-04-24 04:35:18', 'Pelda Rio Wijanarko');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personel`
--

CREATE TABLE `personel` (
  `id` int(11) NOT NULL,
  `nama_personel` varchar(100) NOT NULL,
  `pangkat` varchar(50) NOT NULL,
  `nrp` varchar(20) NOT NULL,
  `tim` enum('harpon','sound','cyber','harrad') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `personel`
--

INSERT INTO `personel` (`id`, `nama_personel`, `pangkat`, `nrp`, `tim`, `created_at`) VALUES
(2, 'Fauzan Sadewa', 'Sertu', '41819804547415', 'harpon', '2026-04-23 17:42:37'),
(3, 'Tri Istanto', 'Pelda', '231821', 'harpon', '2026-04-23 17:43:17'),
(4, 'Iwan Budiarso', 'Serma', '522257', 'harpon', '2026-04-24 01:55:28'),
(5, 'Sabar', 'Kopda', '121319', 'sound', '2026-04-24 04:32:45'),
(6, 'Muin', 'Serda', '193913', 'sound', '2026-04-24 04:33:22'),
(7, 'Mursyid', 'Serda', '666712', 'cyber', '2026-04-25 02:18:15'),
(8, 'Andi Luhur', 'Serda', '702114', 'cyber', '2026-04-25 02:18:43'),
(9, 'Alifiyan', 'Kopda', '932391', 'cyber', '2026-04-25 02:19:14'),
(10, 'Rio Offan', 'Serma', '314141', 'harrad', '2026-04-25 02:20:34'),
(11, 'Supriyadi', 'Serka', '411119', 'harrad', '2026-04-25 02:20:56'),
(12, 'Ahmad Saufan', 'Serka', '213100', 'harrad', '2026-04-25 02:21:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `tim` enum('harpon','sound','cyber','harrad') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `nama_admin`, `tim`, `created_at`) VALUES
(1, 'admin_harpon', '$2b$10$Am5EKLmn8m54o0WVyCyhLuNiyR8pDrgAhVRXHfezy9ZN0juGKERQm', 'Pelda Tri Istanto', 'harpon', '2026-04-23 16:19:11'),
(2, 'admin_sound', '$2b$10$Am5EKLmn8m54o0WVyCyhLuNiyR8pDrgAhVRXHfezy9ZN0juGKERQm', 'Pelda Rio Wijanarko', 'sound', '2026-04-23 16:19:11'),
(3, 'admin_cyber', '$2b$10$Am5EKLmn8m54o0WVyCyhLuNiyR8pDrgAhVRXHfezy9ZN0juGKERQm', 'Serda Mursyid', 'cyber', '2026-04-23 16:19:11'),
(4, 'admin_harrad', '$2b$10$Am5EKLmn8m54o0WVyCyhLuNiyR8pDrgAhVRXHfezy9ZN0juGKERQm', 'Serma Rio Offan', 'harrad', '2026-04-23 16:19:11');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `inventaris_barang`
--
ALTER TABLE `inventaris_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `laporan_kegiatan`
--
ALTER TABLE `laporan_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_admin_input` (`id_admin_input`);

--
-- Indeks untuk tabel `personel`
--
ALTER TABLE `personel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nrp` (`nrp`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `inventaris_barang`
--
ALTER TABLE `inventaris_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `laporan_kegiatan`
--
ALTER TABLE `laporan_kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `personel`
--
ALTER TABLE `personel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `laporan_kegiatan`
--
ALTER TABLE `laporan_kegiatan`
  ADD CONSTRAINT `laporan_kegiatan_ibfk_1` FOREIGN KEY (`id_admin_input`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
