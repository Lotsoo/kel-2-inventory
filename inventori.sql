-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Mar 2024 pada 03.43
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventori`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `nip` char(9) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`nip`, `password`) VALUES
('126062005', '12345678');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kode_barang` varchar(5) NOT NULL,
  `nama_barang` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`) VALUES
('K01', 'Keyboard'),
('M01', 'Mouse'),
('MT01', 'Monitor');

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_keluar`
--

CREATE TABLE `surat_keluar` (
  `no_surat_keluar` char(10) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `kode_barang` varchar(5) NOT NULL,
  `nama_barang` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `no_surat_masuk` char(10) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `upload` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `surat_masuk`
--

INSERT INTO `surat_masuk` (`no_surat_masuk`, `tanggal_masuk`, `upload`) VALUES
('01SM160324', '2024-03-16', 'Surat Barang.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`nip`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indeks untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD PRIMARY KEY (`no_surat_keluar`),
  ADD UNIQUE KEY `kode_barang` (`kode_barang`);

--
-- Indeks untuk tabel `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`no_surat_masuk`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD CONSTRAINT `surat_keluar_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
