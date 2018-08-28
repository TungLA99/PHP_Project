-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 23, 2018 at 09:14 AM
-- Server version: 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php_project_ver2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` varchar(15) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `pass` varchar(15) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feed_back`
--

DROP TABLE IF EXISTS `feed_back`;
CREATE TABLE IF NOT EXISTS `feed_back` (
  `id` char(5) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Mã Feedback',
  `acc` varchar(15) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Tên Tài Khoản',
  `con_feed` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Nội Dung Feedback',
  `date_feed` date NOT NULL COMMENT 'Ngày Feedback',
  `con_rep` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Nội Dung trả lời feedback',
  `date_rep` date DEFAULT NULL COMMENT 'Ngày trà lời',
  `status_feed` varchar(15) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Tình trạng feedback',
  PRIMARY KEY (`id`),
  KEY `acc` (`acc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hoa_don`
--

DROP TABLE IF EXISTS `hoa_don`;
CREATE TABLE IF NOT EXISTS `hoa_don` (
  `ID` char(5) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Mã hóa đơn',
  `ac_name` varchar(15) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Tên Tài Khoản',
  `pro_amount` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Sản Phẩm và số Lượng Mua',
  `total` int(9) NOT NULL,
  `note` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Ghi Chú Của Khách Hàng',
  `date_or` date NOT NULL COMMENT 'Ngày Đặt Hàng',
  `date_re` date DEFAULT NULL COMMENT 'Ngày Nhận Hàng',
  `status_pro` varchar(30) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Tình Trạng Đơn Hàng)',
  PRIMARY KEY (`ID`),
  KEY `ac_name` (`ac_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `hoa_don`
--

INSERT INTO `hoa_don` (`ID`, `ac_name`, `pro_amount`, `total`, `note`, `date_or`, `date_re`, `status_pro`) VALUES
('HD001', 'anyblue', 'dfsfdsfsdf', 9000, 'adasdsadasd', '2018-08-22', '2018-08-22', 'Đang chờ hàng');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `ID` char(5) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Mã Sản Phẩm',
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Tên Sản Phẩm',
  `brand` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Nhà Sản Xuat61',
  `ver` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Phiên Bản',
  `price` int(9) UNSIGNED NOT NULL COMMENT 'Giá',
  `q_s` int(3) UNSIGNED NOT NULL COMMENT 'Số Lượng Đã Bán',
  `L:-Date` int(11) NOT NULL COMMENT 'Ngày Ra Mắt',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tai_khoan`
--

DROP TABLE IF EXISTS `tai_khoan`;
CREATE TABLE IF NOT EXISTS `tai_khoan` (
  `acc` varchar(15) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Tên Tài Khoản',
  `pass` varchar(15) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Mật Khẩu',
  `f_name` varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Tên',
  `l_name` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Họ và tên đệm',
  `mail` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Số Điện Thoại',
  `addr` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Địa Chỉ',
  `re` varchar(10) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Độ Tin Cậy',
  PRIMARY KEY (`acc`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `tai_khoan`
--

INSERT INTO `tai_khoan` (`acc`, `pass`, `f_name`, `l_name`, `mail`, `phone`, `addr`, `re`) VALUES
('anyblue', 'Anyblue123', 'Hiển', 'Nguyễn Ngọc', 'nguenhien153@yahoo.com', '01633507616', 'sdsafdad', 'Tốt');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feed_back`
--
ALTER TABLE `feed_back`
  ADD CONSTRAINT `feed_back_ibfk_1` FOREIGN KEY (`acc`) REFERENCES `tai_khoan` (`acc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hoa_don`
--
ALTER TABLE `hoa_don`
  ADD CONSTRAINT `hoa_don_ibfk_1` FOREIGN KEY (`ac_name`) REFERENCES `tai_khoan` (`acc`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
