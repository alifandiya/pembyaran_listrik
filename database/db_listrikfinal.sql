-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Agu 2024 pada 17.27
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_listrikfinal`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `manager`
--

CREATE TABLE `manager` (
  `id_manager` varchar(15) NOT NULL,
  `nama_mgr` varchar(20) NOT NULL,
  `alamat_mgr` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `aksi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `manager`
--

INSERT INTO `manager` (`id_manager`, `nama_mgr`, `alamat_mgr`, `no_telp`, `gender`, `username`, `password`, `aksi`) VALUES
('P20210527001', 'Alif', 'Jakarta', '08111187878', 'L', 'admin1', '123', 'manager'),
('P20240729001', 'Riki', 'Jakarta Timur', '08111187878', 'L', 'admin2', '123', 'manager');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(15) NOT NULL,
  `no_seri` varchar(12) NOT NULL,
  `nama_plgn` varchar(50) NOT NULL,
  `alamat_plgn` text NOT NULL,
  `batas_waktu` varchar(2) NOT NULL,
  `id_tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `no_seri`, `nama_plgn`, `alamat_plgn`, `batas_waktu`, `id_tarif`) VALUES
('20240726153017', '207240751517', 'Gusti', 'Mustika Jaya', '26', 1),
('20240726154627', '207240751527', 'Dimas', 'Setu', '26', 2),
('20240726161057', '207240751657', 'Bayu', 'Mustika Sari', '26', 3),
('20240726161632', '207240751632', 'Ridho', 'Bantar Gebang', '26', 4),
('20240726165525', '207240751625', 'Alby', 'Cimuning', '26', 1),
('20240729114203', '210240711103', 'Ardiansyah', 'Ciketing', '29', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(15) NOT NULL,
  `id_pelanggan` varchar(15) NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `waktu_pembayaran` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bulan_pembayaran` varchar(2) NOT NULL,
  `tahun_pembayaran` year(4) NOT NULL,
  `jumlah_pembayaran` double NOT NULL,
  `biaya_admin` double NOT NULL,
  `total` double NOT NULL,
  `bayar` double NOT NULL,
  `kembali` double NOT NULL,
  `id_teller` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pelanggan`, `tgl_pembayaran`, `waktu_pembayaran`, `bulan_pembayaran`, `tahun_pembayaran`, `jumlah_pembayaran`, `biaya_admin`, `total`, `bayar`, `kembali`, `id_teller`) VALUES
('BYR202407270001', '20240726165525', '2024-07-27', '2024-07-27 14:20:15', '08', '2024', 15000, 2000, 17000, 20000, 3000, 'T20240726001'),
('BYR202407270002', '20240726161632', '2024-07-27', '2024-07-27 14:20:59', '08', '2024', 375000, 2000, 377000, 380000, 3000, 'T20240726001'),
('BYR202407270003', '20240726154627', '2024-07-27', '2024-07-27 14:28:30', '08', '2024', 36000, 2000, 38000, 40000, 2000, 'T20240726001'),
('BYR202407270004', '20240726154627', '2024-07-27', '2024-07-27 14:29:46', '09', '2024', 24000, 2000, 26000, 27000, 1000, 'T20240726001'),
('BYR202407290001', '20240729114203', '2024-07-29', '2024-07-29 04:55:18', '08', '2024', 85000, 2000, 87000, 200000, 113000, 'A20210527001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penggunaan`
--

CREATE TABLE `penggunaan` (
  `id_penggunaan` varchar(20) NOT NULL,
  `id_pelanggan` varchar(15) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` year(4) NOT NULL,
  `meter_awal` int(11) NOT NULL,
  `meter_akhir` int(11) NOT NULL,
  `tgl_cek` date NOT NULL,
  `id_manager` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `penggunaan`
--

INSERT INTO `penggunaan` (`id_penggunaan`, `id_pelanggan`, `bulan`, `tahun`, `meter_awal`, `meter_akhir`, `tgl_cek`, `id_manager`) VALUES
('20240726153017082024', '20240726153017', '08', '2024', 0, 123, '2024-07-26', 'P20210527001'),
('20240726153017092024', '20240726153017', '09', '2024', 123, 0, '0000-00-00', ''),
('20240726154627010202', '20240726154627', '01', '2024', 20, 0, '0000-00-00', ''),
('20240726154627082024', '20240726154627', '08', '2024', 0, 12, '2024-07-26', 'P20210527001'),
('20240726154627092024', '20240726154627', '09', '2024', 12, 20, '2024-07-26', 'P20210527001'),
('20240726161057082024', '20240726161057', '08', '2024', 0, 15, '2024-07-26', 'P20210527001'),
('20240726161057092024', '20240726161057', '09', '2024', 15, 0, '0000-00-00', ''),
('20240726161632082024', '20240726161632', '08', '2024', 0, 50, '2024-07-26', 'P20240726001'),
('20240726161632092024', '20240726161632', '09', '2024', 50, 0, '0000-00-00', ''),
('20240726165525082024', '20240726165525', '08', '2024', 0, 10, '2024-04-01', 'P20240726001'),
('20240726165525092024', '20240726165525', '09', '2024', 10, 0, '0000-00-00', ''),
('20240729114203082024', '20240729114203', '08', '2024', 0, 10, '2024-07-29', 'P20240729001'),
('20240729114203092024', '20240729114203', '09', '2024', 10, 0, '0000-00-00', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int(11) NOT NULL,
  `id_pelanggan` varchar(15) NOT NULL,
  `bulan` varchar(2) NOT NULL,
  `tahun` year(4) NOT NULL,
  `jumlah_meter` int(11) NOT NULL,
  `tarif_perkwh` double NOT NULL,
  `jumlah_bayar` double NOT NULL,
  `status` varchar(15) NOT NULL,
  `id_manager` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `id_pelanggan`, `bulan`, `tahun`, `jumlah_meter`, `tarif_perkwh`, `jumlah_bayar`, `status`, `id_manager`) VALUES
(1, '20240726153017', '08', '2024', 123, 1500, 184500, 'Terbayar', 'P20210527001'),
(2, '20240726154627', '08', '2024', 12, 3000, 36000, 'Terbayar', 'P20210527001'),
(3, '20240726154627', '09', '2024', 8, 3000, 24000, 'Terbayar', 'P20210527001'),
(4, '20240726161057', '08', '2024', 15, 6000, 90000, 'Terbayar', 'P20210527001'),
(5, '20240726161632', '08', '2024', 50, 7500, 375000, 'Terbayar', 'P20240726001'),
(6, '20240726165525', '08', '2024', 10, 1500, 15000, 'Terbayar', 'P20240726001'),
(7, '20240729114203', '08', '2024', 10, 8500, 85000, 'Terbayar', 'P20240729001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tarif`
--

CREATE TABLE `tarif` (
  `id_tarif` int(11) NOT NULL,
  `no_tarif` varchar(20) NOT NULL,
  `golongan` varchar(10) NOT NULL,
  `daya` varchar(10) NOT NULL,
  `tarif_perkwh` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tarif`
--

INSERT INTO `tarif` (`id_tarif`, `no_tarif`, `golongan`, `daya`, `tarif_perkwh`) VALUES
(1, 'R1/450VA', 'R1', '450VA', 1500),
(2, 'R2/900VA', 'R2', '900VA', 3000),
(3, 'R3/1300VA', 'R3', '1300VA', 6000),
(4, 'B1/1300VA', 'B1', '1300VA', 7500),
(5, 'B2/1900VA', 'B2', '1900VA', 8500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `teller`
--

CREATE TABLE `teller` (
  `id_teller` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `saldo` double NOT NULL,
  `biaya_admin` double NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `aksi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `teller`
--

INSERT INTO `teller` (`id_teller`, `nama`, `alamat`, `no_telp`, `saldo`, `biaya_admin`, `username`, `password`, `aksi`) VALUES
('A20210527001', 'Tasya', 'Jakarta', '081122334455', 0, 2000, 'teller1', '1234', 'teller'),
('T20240726001', 'Bagas', 'Cisarua', '123456', 0, 2500, 'teller3', '1234', 'teller'),
('T20240729001', 'Rudi', 'Cibarusah', '089234567890', 0, 3000, 'teller2', '1234', 'teller');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_pembayaran`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_pembayaran` (
`id_pembayaran` varchar(15)
,`id_pelanggan` varchar(15)
,`tgl_pembayaran` date
,`waktu_pembayaran` timestamp
,`bulan_bayar` varchar(2)
,`tahun_bayar` year(4)
,`jumlah_pembayaran` double
,`biaya_admin` double
,`total` double
,`bayar` double
,`kembali` double
,`id_teller` varchar(12)
,`nama_pelanggan` varchar(50)
,`nama_teller` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_penggunaan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_penggunaan` (
`id_penggunaan` varchar(20)
,`id_pelanggan` varchar(15)
,`bulan` varchar(2)
,`tahun` year(4)
,`meter_awal` int(11)
,`meter_akhir` int(11)
,`tgl_cek` date
,`id_manager` varchar(15)
,`nama_pelanggan` varchar(50)
,`nama_manager` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_tagihan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_tagihan` (
`id_tagihan` int(11)
,`id_pelanggan` varchar(15)
,`bulan` varchar(2)
,`tahun` year(4)
,`jumlah_meter` int(11)
,`tarif_perkwh` double
,`jumlah_pembayaran` double
,`status` varchar(15)
,`id_manager` varchar(15)
,`nama_pelanggan` varchar(50)
,`id_tarif` int(11)
,`nama_manager` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_pembayaran`
--
DROP TABLE IF EXISTS `v_pembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pembayaran`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_pelanggan` AS `id_pelanggan`, `pembayaran`.`tgl_pembayaran` AS `tgl_pembayaran`, `pembayaran`.`waktu_pembayaran` AS `waktu_pembayaran`, `pembayaran`.`bulan_pembayaran` AS `bulan_bayar`, `pembayaran`.`tahun_pembayaran` AS `tahun_bayar`, `pembayaran`.`jumlah_pembayaran` AS `jumlah_pembayaran`, `pembayaran`.`biaya_admin` AS `biaya_admin`, `pembayaran`.`total` AS `total`, `pembayaran`.`bayar` AS `bayar`, `pembayaran`.`kembali` AS `kembali`, `pembayaran`.`id_teller` AS `id_teller`, `pelanggan`.`nama_plgn` AS `nama_pelanggan`, `teller`.`nama` AS `nama_teller` FROM ((`pembayaran` join `pelanggan` on(`pelanggan`.`id_pelanggan` = `pembayaran`.`id_pelanggan`)) join `teller` on(`teller`.`id_teller` = `pembayaran`.`id_teller`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_penggunaan`
--
DROP TABLE IF EXISTS `v_penggunaan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_penggunaan`  AS SELECT `penggunaan`.`id_penggunaan` AS `id_penggunaan`, `penggunaan`.`id_pelanggan` AS `id_pelanggan`, `penggunaan`.`bulan` AS `bulan`, `penggunaan`.`tahun` AS `tahun`, `penggunaan`.`meter_awal` AS `meter_awal`, `penggunaan`.`meter_akhir` AS `meter_akhir`, `penggunaan`.`tgl_cek` AS `tgl_cek`, `penggunaan`.`id_manager` AS `id_manager`, `pelanggan`.`nama_plgn` AS `nama_pelanggan`, `manager`.`nama_mgr` AS `nama_manager` FROM ((`penggunaan` join `pelanggan` on(`penggunaan`.`id_pelanggan` = `pelanggan`.`id_pelanggan`)) join `manager` on(`penggunaan`.`id_manager` = `manager`.`id_manager`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_tagihan`
--
DROP TABLE IF EXISTS `v_tagihan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_tagihan`  AS SELECT `tagihan`.`id_tagihan` AS `id_tagihan`, `tagihan`.`id_pelanggan` AS `id_pelanggan`, `tagihan`.`bulan` AS `bulan`, `tagihan`.`tahun` AS `tahun`, `tagihan`.`jumlah_meter` AS `jumlah_meter`, `tagihan`.`tarif_perkwh` AS `tarif_perkwh`, `tagihan`.`jumlah_bayar` AS `jumlah_pembayaran`, `tagihan`.`status` AS `status`, `tagihan`.`id_manager` AS `id_manager`, `pelanggan`.`nama_plgn` AS `nama_pelanggan`, `pelanggan`.`id_tarif` AS `id_tarif`, `manager`.`nama_mgr` AS `nama_manager` FROM ((`tagihan` join `pelanggan` on(`pelanggan`.`id_pelanggan` = `tagihan`.`id_pelanggan`)) join `manager` on(`manager`.`id_manager` = `tagihan`.`id_manager`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id_manager`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `penggunaan`
--
ALTER TABLE `penggunaan`
  ADD PRIMARY KEY (`id_penggunaan`);

--
-- Indeks untuk tabel `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`);

--
-- Indeks untuk tabel `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`id_tarif`);

--
-- Indeks untuk tabel `teller`
--
ALTER TABLE `teller`
  ADD PRIMARY KEY (`id_teller`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tarif`
--
ALTER TABLE `tarif`
  MODIFY `id_tarif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
