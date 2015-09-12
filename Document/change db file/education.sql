-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2015 at 03:46 PM
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
-- Table structure for table `education`
--

CREATE TABLE IF NOT EXISTS `education` (
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `EducationDescription` text,
  `EducationId` int(11) NOT NULL,
  `ResumeId` int(11) NOT NULL,
  `SchoolID` int(11) NOT NULL,
  `EducationLevel` text,
  `EducationMajor` text NOT NULL,
  `EducationLocation` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`StartDate`, `EndDate`, `EducationDescription`, `EducationId`, `ResumeId`, `SchoolID`, `EducationLevel`, `EducationMajor`, `EducationLocation`) VALUES
('1994-02-21', '2015-09-01', 'asd', 1, 1, 1, 'asd', 'abc', 'asd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`EducationId`), ADD KEY `FK_Relationship_2` (`ResumeId`), ADD KEY `FK_Relationship_6` (`SchoolID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `EducationId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `education`
--
ALTER TABLE `education`
ADD CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`ResumeId`) REFERENCES `resume` (`ResumeId`),
ADD CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`SchoolID`) REFERENCES `school` (`SchoolID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
