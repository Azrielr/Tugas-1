-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2022 at 02:29 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan_obat`
--

CREATE TABLE `detail_penjualan_obat` (
  `id_nama_obat` int(11) NOT NULL,
  `tanggal_penjualan` date NOT NULL,
  `jumlah` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_penjualan_obat`
--

INSERT INTO `detail_penjualan_obat` (`id_nama_obat`, `tanggal_penjualan`, `jumlah`) VALUES
(1, '2022-03-15', 40),
(2, '2022-03-01', 200),
(3, '2022-03-31', 280),
(4, '2022-04-20', 50),
(5, '2022-05-30', 50),
(6, '2022-06-29', 300),
(7, '2022-06-01', 3000),
(8, '2022-06-30', 190),
(9, '2022-07-05', 500),
(10, '2022-07-01', 30);

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id` int(11) NOT NULL,
  `jenis_obat` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id`, `jenis_obat`) VALUES
(1, 'Paracetamol'),
(2, 'Dextromethorphan HBr'),
(3, 'ibuprofen'),
(4, 'ventolin'),
(5, 'Suppositoria'),
(6, 'natrium birkabonat'),
(7, 'antiseptik'),
(8, 'antibiotik'),
(9, 'Ringer laktat'),
(10, 'krim');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_jenis_obat` int(32) NOT NULL,
  `harga_obat` int(16) NOT NULL,
  `nama_obat` varchar(25) NOT NULL,
  `supplier` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_jenis_obat`, `harga_obat`, `nama_obat`, `supplier`) VALUES
(1, 10000, 'panadol', 'pt_pharmacy_1'),
(2, 20000, 'obh', 'pt_pharmacy_1'),
(3, 15000, 'oskadon', 'pt_pharmacy_1'),
(4, 45000, 'ventolin', 'pt_pharmacy_2'),
(5, 50000, 'suppositoria', 'pt_pharmacy_3'),
(6, 9000, 'natrium bicarbonat 500mg ', 'pt_pharmacy_3'),
(7, 1000, 'hansaplast', 'pt_pharmacy_2'),
(8, 5000, 'omeproksil ciprofloxacin ', 'pt_pharmacy_3'),
(9, 140000, 'infus kristaloid', 'pt_pharmacy_4'),
(10, 16000, 'hot in cream', 'pt_pharmacy_5');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_obat`
--

CREATE TABLE `penjualan_obat` (
  `id` int(11) NOT NULL,
  `id_penjualan_obat` int(11) NOT NULL,
  `nama_obat` varchar(64) NOT NULL,
  `stock` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan_obat`
--

INSERT INTO `penjualan_obat` (`id`, `id_penjualan_obat`, `nama_obat`, `stock`) VALUES
(1, 1, 'panadol', 60),
(2, 2, 'obh', 100),
(3, 3, 'oskadon', 120),
(4, 4, 'ventolin', 30),
(5, 5, 'suppositoria', 150),
(6, 6, 'natrium bikarbonat 500mg', 200),
(7, 7, 'hansaplast', 1000),
(8, 8, 'omeproksil ciprofloxacin ', 110),
(9, 9, 'infus kristaloid', 500),
(10, 10, 'hot in cream', 70);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_penjualan_obat`
--
ALTER TABLE `detail_penjualan_obat`
  ADD PRIMARY KEY (`id_nama_obat`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_jenis_obat`),
  ADD KEY `fk_jenis_obat` (`id_jenis_obat`) USING BTREE;

--
-- Indexes for table `penjualan_obat`
--
ALTER TABLE `penjualan_obat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_obat` (`id_penjualan_obat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_penjualan_obat`
--
ALTER TABLE `detail_penjualan_obat`
  MODIFY `id_nama_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `penjualan_obat`
--
ALTER TABLE `penjualan_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_penjualan_obat`
--
ALTER TABLE `detail_penjualan_obat`
  ADD CONSTRAINT `detail_penjualan_obat_ibfk_1` FOREIGN KEY (`id_nama_obat`) REFERENCES `penjualan_obat` (`id_penjualan_obat`);

--
-- Constraints for table `jenis`
--
ALTER TABLE `jenis`
  ADD CONSTRAINT `jenis_ibfk_1` FOREIGN KEY (`id`) REFERENCES `penjualan_obat` (`id_penjualan_obat`);

--
-- Constraints for table `obat`
--
ALTER TABLE `obat`
  ADD CONSTRAINT `fk_jenis_obat` FOREIGN KEY (`id_jenis_obat`) REFERENCES `jenis` (`id`);

--
-- Constraints for table `penjualan_obat`
--
ALTER TABLE `penjualan_obat`
  ADD CONSTRAINT `penjualan_obat_ibfk_1` FOREIGN KEY (`id_penjualan_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `penjualan_obat_ibfk_2` FOREIGN KEY (`id`) REFERENCES `jenis` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
