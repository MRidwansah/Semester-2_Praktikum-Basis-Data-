-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Mar 2025 pada 16.34
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teknik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id` char(2) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id`, `nama`) VALUES
('1', 'S1 Teknologi Informasi'),
('2', 'S1 Teknik Mekatronika'),
('3', 'S1 Teknik Electro'),
('4', 'S1 Teknik Mesin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `khs`
--

CREATE TABLE `khs` (
  `id` int(11) NOT NULL,
  `NPM` char(10) NOT NULL,
  `id_mata_kuliah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `khs`
--

INSERT INTO `khs` (`id`, `NPM`, `id_mata_kuliah`) VALUES
(1, '244506074', 1),
(2, '244506074', 2),
(3, '244506074', 3),
(4, '244506075', 1),
(5, '244506075', 3),
(6, '244506076', 4),
(7, '244506077', 4),
(8, '244506078', 5),
(9, '244506079', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NPM` char(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `id_jurusan` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NPM`, `nama`, `id_jurusan`) VALUES
('244506074', 'Jabbar Hakim', '1'),
('244506075', 'Robby Ade Pratama', '1'),
('244506076', 'Tio Restu Pambudi', '4'),
('244506077', 'Aulia Nidya Kusuma Dewati', '3'),
('244506078', 'Galang Dwi Santoso', '3'),
('244506079', 'Muhamad Ridwansah', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id`, `nama`) VALUES
(1, 'Praktikum Basis Data'),
(2, 'Basis Data'),
(3, 'Praktikum Struktur Data'),
(4, 'Kalkulus Lanjut'),
(5, 'Fisika Lanjut');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id` int(11) NOT NULL,
  `NPM` char(10) NOT NULL,
  `id_mata_kuliah` int(11) NOT NULL,
  `nilai` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id`, `NPM`, `id_mata_kuliah`, `nilai`) VALUES
(1, '244506074', 1, 100.00),
(2, '244506074', 2, 100.00),
(3, '244506074', 3, 100.00),
(4, '244506075', 1, 95.00),
(5, '244506075', 3, 85.00),
(6, '244506076', 4, 75.00),
(7, '244506077', 4, 83.00),
(8, '244506078', 5, 89.00),
(9, '244506079', 5, 90.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `khs`
--
ALTER TABLE `khs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `NPM` (`NPM`),
  ADD KEY `id_mata_kuliah` (`id_mata_kuliah`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NPM`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indeks untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `NPM` (`NPM`),
  ADD KEY `id_mata_kuliah` (`id_mata_kuliah`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `khs`
--
ALTER TABLE `khs`
  ADD CONSTRAINT `khs_ibfk_1` FOREIGN KEY (`NPM`) REFERENCES `mahasiswa` (`NPM`),
  ADD CONSTRAINT `khs_ibfk_2` FOREIGN KEY (`id_mata_kuliah`) REFERENCES `mata_kuliah` (`id`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id`);

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`NPM`) REFERENCES `mahasiswa` (`NPM`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`id_mata_kuliah`) REFERENCES `mata_kuliah` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
