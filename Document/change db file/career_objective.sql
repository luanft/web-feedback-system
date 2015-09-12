-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2015 at 04:11 PM
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
-- Table structure for table `career_objective`
--

CREATE TABLE IF NOT EXISTS `career_objective` (
  `DesireSalary` int(11) DEFAULT NULL,
  `RecentSalary` int(11) DEFAULT NULL,
  `PositionType` text,
  `DesireCareerLevel` text,
  `DesireWorkLocation` text,
  `WillingToRelocate` tinyint(1) DEFAULT NULL,
  `WillingToTravel` tinyint(1) DEFAULT NULL,
  `CareerObjective` text,
  `CareerObjectiveId` int(11) NOT NULL,
  `ResumeId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `career_objective`
--

INSERT INTO `career_objective` (`DesireSalary`, `RecentSalary`, `PositionType`, `DesireCareerLevel`, `DesireWorkLocation`, `WillingToRelocate`, `WillingToTravel`, `CareerObjective`, `CareerObjectiveId`, `ResumeId`) VALUES
(0, 0, 'Full-time Permanent', 'Student / Internship', 'Ho Chi Minh', 0, 0, 'Get money', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `career_objective`
--
ALTER TABLE `career_objective`
  ADD PRIMARY KEY (`CareerObjectiveId`), ADD KEY `FK_Relationship_5` (`ResumeId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `career_objective`
--
ALTER TABLE `career_objective`
  MODIFY `CareerObjectiveId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `career_objective`
--
ALTER TABLE `career_objective`
ADD CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`ResumeId`) REFERENCES `resume` (`ResumeId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
