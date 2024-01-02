-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jan 2024 pada 05.26
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_mobil`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `NIK` varchar(20) NOT NULL,
  `NMKARYAWAN` varchar(50) NOT NULL,
  `ALMTKARYAWAN` varchar(50) NOT NULL,
  `TELPKARYAWAN` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`NIK`, `NMKARYAWAN`, `ALMTKARYAWAN`, `TELPKARYAWAN`) VALUES
('123459876', 'Yusuf', 'Jl. Panglima Sudirman', '0356-443300');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan`
--

CREATE TABLE `kendaraan` (
  `NOPLAT` varchar(20) NOT NULL,
  `IDTYPE` varchar(5) NOT NULL,
  `KODEPEMILIK` varchar(6) NOT NULL,
  `KODE_SERVICE` varchar(5) NOT NULL,
  `TAHUN` varchar(4) NOT NULL,
  `TARIFPERJAM` decimal(10,0) NOT NULL,
  `STATUSRENTAL` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kendaraan`
--

INSERT INTO `kendaraan` (`NOPLAT`, `IDTYPE`, `KODEPEMILIK`, `KODE_SERVICE`, `TAHUN`, `TARIFPERJAM`, `STATUSRENTAL`) VALUES
('S 4074 P', 'TP01', 'PML001', 'SRV01', '2012', '25000', 'Tersedia'),
('S 5555 P', 'TP02', 'PML002', 'SRV01', '2012', '30000', 'Tersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `USERNAME` varchar(10) NOT NULL,
  `NIK` varchar(20) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL,
  `TYPEUSER` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`USERNAME`, `NIK`, `PASSWORD`, `TYPEUSER`) VALUES
('Fdhiv', '083159', 'Fdhiv', 'Administrator');

-- --------------------------------------------------------

--
-- Struktur dari tabel `merk`
--

CREATE TABLE `merk` (
  `KODEMERK` varchar(6) NOT NULL,
  `NMMERK` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `merk`
--

INSERT INTO `merk` (`KODEMERK`, `NMMERK`) VALUES
('MRK01', 'Kijang Inova'),
('MRK02', 'Toyota Avanza'),
('MRK03', 'Honda Jazz');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `NOKTP` varchar(20) NOT NULL,
  `NAMAPEL` varchar(50) NOT NULL,
  `ALAMATPEL` varchar(50) NOT NULL,
  `TELPPEL` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`NOKTP`, `NAMAPEL`, `ALAMATPEL`, `TELPPEL`) VALUES
('1234567890', 'Ibrahim ', 'Palang', '0356-303058'),
('1234560987', 'Muhammad', 'Tuban', '0356-303000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_pelanggan` varchar(10) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `no_transaksi` varchar(30) NOT NULL,
  `tanggal` varchar(10) NOT NULL,
  `id_mobil` varchar(10) NOT NULL,
  `merk` varchar(30) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `jumlah_hari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_pelanggan`, `nama_pelanggan`, `no_transaksi`, `tanggal`, `id_mobil`, `merk`, `harga`, `jumlah_hari`) VALUES
('A1002', 'Bjorka', '121212', '12-12-2002', 'M122', 'Mercy', '1000000', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`NIK`);

--
-- Indeks untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`NOPLAT`),
  ADD KEY `FK_R10` (`KODE_SERVICE`),
  ADD KEY `FK_R3` (`IDTYPE`),
  ADD KEY `FK_R4` (`KODEPEMILIK`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`USERNAME`),
  ADD KEY `FK_R2` (`NIK`);

--
-- Indeks untuk tabel `merk`
--
ALTER TABLE `merk`
  ADD PRIMARY KEY (`KODEMERK`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`NOKTP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
