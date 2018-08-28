-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 24, 2018 at 12:39 PM
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
  `role` int(1) UNSIGNED NOT NULL COMMENT 'Quyền Hạn',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `name` varchar(15) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Tên Thương Hiệu',
  `logo` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Logo Thương Hiệu',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_invoice`
--

DROP TABLE IF EXISTS `detail_invoice`;
CREATE TABLE IF NOT EXISTS `detail_invoice` (
  `stt` int(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Số Thứ Tự',
  `code_detail` int(5) UNSIGNED DEFAULT NULL COMMENT 'Mã Chi Tiết Đơn Hàng',
  `ID_Invoice` int(5) UNSIGNED DEFAULT NULL COMMENT 'Mã Chi Tiết Đơn Hàng',
  `ID_Pro` int(5) UNSIGNED DEFAULT NULL COMMENT 'Mã Sản Phẩm',
  `Name_pro` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Tên Sản Phẩm',
  `img_pro` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Hình ảnh',
  `price_pro` int(9) DEFAULT NULL COMMENT 'Giá',
  `amount_pro` int(1) DEFAULT NULL COMMENT 'Số Lượng Mua',
  `total` int(10) DEFAULT NULL COMMENT 'Tổng Tiền',
  PRIMARY KEY (`stt`),
  UNIQUE KEY `ID_Pro` (`ID_Pro`),
  KEY `ID_Invoice` (`ID_Invoice`)
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `ID` int(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã hóa đơn',
  `ac_name` varchar(15) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Tên Tài Khoản',
  `detail_code` int(5) DEFAULT NULL COMMENT 'Sản Phẩm và số Lượng Mua',
  `total` int(15) NOT NULL,
  `note` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Ghi Chú Của Khách Hàng',
  `date_or` date NOT NULL COMMENT 'Ngày Đặt Hàng',
  `date_re` date DEFAULT NULL COMMENT 'Ngày Nhận Hàng',
  `deposit` varchar(3) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Chuyển Khoản ( yes - no )',
  PRIMARY KEY (`ID`),
  KEY `ac_name` (`ac_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `acc` varchar(15) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Tên Tài Khoản',
  `pass` varchar(15) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Mật Khẩu',
  `l_name` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Họ và tên đệm',
  `f_name` varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Tên',
  `mail` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Số Điện Thoại',
  `addr` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Địa Chỉ',
  `reliability` varchar(10) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL COMMENT 'Độ Tin Cậy',
  PRIMARY KEY (`acc`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `ID` int(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã Sản Phẩm',
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Tên Sản Phẩm',
  `name_brand` varchar(15) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Tên Nhà Sản Xuất',
  `img` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Hình Ảnh',
  `ver` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL COMMENT 'Phiên Bản',
  `price` int(9) UNSIGNED NOT NULL COMMENT 'Giá',
  `a_s` int(3) UNSIGNED NOT NULL COMMENT 'Số Lượng Đã Bán',
  `L_Date` int(11) NOT NULL COMMENT 'Ngày Ra Mắt',
  PRIMARY KEY (`ID`),
  KEY `name_brand` (`name_brand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_invoice`
--
ALTER TABLE `detail_invoice`
  ADD CONSTRAINT `detail_invoice_ibfk_1` FOREIGN KEY (`ID_Pro`) REFERENCES `product` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_invoice_ibfk_2` FOREIGN KEY (`ID_Invoice`) REFERENCES `invoice` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`ac_name`) REFERENCES `member` (`acc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`name_brand`) REFERENCES `brand` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
