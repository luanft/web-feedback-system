-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2015 at 08:12 AM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `recsys`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryId`, `Description`) VALUES
(1, ' ﻿Xây dựng\r\n'),
(2, ' Kiến trúc/Thiết kế nội thất\r\n'),
(3, ' Bất động sản\r\n'),
(4, ' Viễn Thông\r\n'),
(5, ' Truyền hình/Truyền thông/Báo chí\r\n'),
(6, ' Mỹ thuật/Thiết kế\r\n'),
(7, ' Quảng cáo/Khuyến mãi/Đối ngoại\r\n'),
(8, ' Internet/Online Media\r\n'),
(9, ' Ngân hàng\r\n'),
(10, ' Kiểm toán\r\n'),
(11, ' Tài chính/Đầu tư\r\n'),
(12, ' Chứng khoán\r\n'),
(13, ' Bảo hiểm\r\n'),
(14, ' Hàng không/Du lịch/Khách sạn\r\n'),
(15, ' Thực phẩm & Đồ uống\r\n'),
(16, ' Điện/Điện tử\r\n'),
(17, ' Cơ khí\r\n'),
(18, ' Hóa học/Hóa sinh\r\n'),
(19, ' Môi trường/Xử lý chất thải\r\n'),
(20, ' Dầu khí\r\n'),
(21, ' Dệt may/Da giày\r\n'),
(22, ' Dược Phẩm/Công nghệ sinh học\r\n'),
(23, ' Ô tô\r\n'),
(24, ' Nông nghiệp/Lâm nghiệp\r\n'),
(25, ' Sản phẩm công nghiệp\r\n'),
(26, ' Công nghệ cao\r\n'),
(27, ' Bán lẻ/Bán sỉ\r\n'),
(28, ' Thời trang/Lifestyle\r\n'),
(29, ' Hàng cao cấp\r\n'),
(30, ' Phi chính phủ/Phi lợi nhuận\r\n'),
(31, ' Giáo dục/Đào tạo\r\n'),
(32, ' Y tế/Chăm sóc sức khỏe\r\n'),
(33, ' Tư vấn\r\n'),
(34, ' Vận chuyển/Giao nhận\r\n'),
(35, ' Kho vận\r\n'),
(36, ' Marketing\r\n'),
(37, ' Bán hàng\r\n'),
(38, ' Dịch vụ khách hàng\r\n'),
(39, ' Bán hàng kỹ thuật\r\n'),
(40, ' Hành chánh/Thư ký\r\n'),
(41, ' Kế toán\r\n'),
(42, ' Nhân sự\r\n'),
(43, ' Biên phiên dịch\r\n'),
(44, ' Pháp lý\r\n'),
(45, ' IT-Phần cứng/Mạng\r\n'),
(46, ' IT - Phần mềm\r\n'),
(47, ' Xuất nhập khẩu\r\n'),
(48, ' QA/QC\r\n'),
(49, ' Sản Xuất\r\n'),
(50, ' Vật Tư/Cung vận\r\n'),
(51, ' Hoạch định/Dự án');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
