-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2015 at 03:53 PM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `recsys1`
--

-- --------------------------------------------------------

--
-- Table structure for table `resume`
--

CREATE TABLE IF NOT EXISTS `resume` (
  `ResumeId` int(11) NOT NULL,
  `AccountId` int(11) NOT NULL,
  `Title` text,
  `Name` text,
  `Birthday` datetime DEFAULT NULL,
  `Gender` text,
  `MaritalStatus` tinyint(1) DEFAULT NULL,
  `PlaceOfBirth` text,
  `Hometown` text,
  `Nationality` text,
  `Avatar` text,
  `Address` text,
  `Email` char(100) DEFAULT NULL,
  `Phone` char(15) DEFAULT NULL,
  `Hobby` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resume`
--

INSERT INTO `resume` (`ResumeId`, `AccountId`, `Title`, `Name`, `Birthday`, `Gender`, `MaritalStatus`, `PlaceOfBirth`, `Hometown`, `Nationality`, `Avatar`, `Address`, `Email`, `Phone`, `Hobby`) VALUES
(1, 14, 'Java Developer', 'Thảo', '1994-02-21 00:00:00', 'Nữ', 0, 'abc', 'abc', 'viet nam', 'link ảnh', '1256 Đinh Bộ Lĩnh, Quận 7, tp Hồ Chí Minh', 'thaoho21294@gmail.com', '0934 678 9230', 'singing\r\nprogramming\r\ntraveling');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `resume`
--
ALTER TABLE `resume`
  ADD PRIMARY KEY (`ResumeId`), ADD KEY `FK_Relationship_9` (`AccountId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `resume`
--
ALTER TABLE `resume`
  MODIFY `ResumeId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `resume`
--
ALTER TABLE `resume`
ADD CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`AccountId`) REFERENCES `account` (`AccountId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
