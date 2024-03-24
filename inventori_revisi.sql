-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Mar 2024 pada 05.42
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
-- Database: `inventori_revisi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `nip` char(8) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`nip`, `password`) VALUES
('26062005', '25d55ad283aa400af464c76d713c07ad');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kode_inventaris` varchar(4) NOT NULL,
  `jenis_barang` varchar(11) NOT NULL,
  `merek` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kode_inventaris`, `jenis_barang`, `merek`) VALUES
('M01', 'Mouse', 'Logitech'),
('MT01', 'Monitor', 'Relion');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `tanggal_keluar` date NOT NULL,
  `no_surat_keluar` char(10) NOT NULL,
  `kode_inventaris` varchar(4) NOT NULL,
  `jenis_barang` varchar(11) NOT NULL,
  `merek` varchar(10) NOT NULL,
  `nip` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang_keluar`
--

INSERT INTO `barang_keluar` (`tanggal_keluar`, `no_surat_keluar`, `kode_inventaris`, `jenis_barang`, `merek`, `nip`) VALUES
('2024-03-16', '01SK160324', 'M01', 'Mouse', 'Logitech', '26062005');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `tanggal_masuk` date NOT NULL,
  `no_surat_masuk` char(10) NOT NULL,
  `kode_inventaris` varchar(4) NOT NULL,
  `jenis_barang` varchar(11) NOT NULL,
  `merek` varchar(10) NOT NULL,
  `nip` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`tanggal_masuk`, `no_surat_masuk`, `kode_inventaris`, `jenis_barang`, `merek`, `nip`) VALUES
('2024-03-16', '01SM160324', 'M01', 'Mouse', 'Logitech', '26062005'),
('2024-03-16', '01SM160324', 'MT01', 'Monitor', 'Relion', '26062005');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan`
--

CREATE TABLE `ruangan` (
  `nama_ruangan` varchar(6) NOT NULL,
  `nama_barang` varchar(9) NOT NULL,
  `status` enum('Hilang','Rusak','Hidup') NOT NULL,
  `kode_inventaris` varchar(4) NOT NULL,
  `jenis_barang` varchar(11) NOT NULL,
  `merek` varchar(10) NOT NULL,
  `nip` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ruangan`
--

INSERT INTO `ruangan` (`nama_ruangan`, `nama_barang`, `status`, `kode_inventaris`, `jenis_barang`, `merek`, `nip`) VALUES
('LAB 10', 'Mahasiswa', 'Hidup', 'M01', 'Mouse', 'Logitech', '26062005'),
('LAB 10', 'Dosen', 'Rusak', 'MT01', 'Monitor', 'Relion', '26062005');

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
  ADD PRIMARY KEY (`kode_inventaris`);

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`kode_inventaris`),
  ADD UNIQUE KEY `kode_inventaris` (`kode_inventaris`,`nip`),
  ADD KEY `nip` (`nip`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`kode_inventaris`),
  ADD UNIQUE KEY `kode_inventaris` (`kode_inventaris`,`nip`),
  ADD KEY `nip` (`nip`);

--
-- Indeks untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`kode_inventaris`),
  ADD UNIQUE KEY `kode_inventaris` (`kode_inventaris`,`nip`),
  ADD KEY `nip` (`nip`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`kode_inventaris`) REFERENCES `barang` (`kode_inventaris`),
  ADD CONSTRAINT `barang_keluar_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `admin` (`nip`);

--
-- Ketidakleluasaan untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`kode_inventaris`) REFERENCES `barang` (`kode_inventaris`),
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `admin` (`nip`);

--
-- Ketidakleluasaan untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD CONSTRAINT `ruangan_ibfk_1` FOREIGN KEY (`kode_inventaris`) REFERENCES `barang` (`kode_inventaris`),
  ADD CONSTRAINT `ruangan_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `admin` (`nip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
