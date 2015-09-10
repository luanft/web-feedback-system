-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2015 at 03:32 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

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
-- Table structure for table `job_reccommended`
--

CREATE TABLE IF NOT EXISTS `job_reccommended` (
  `AccountId` int(11) NOT NULL,
  `JobId` int(11) NOT NULL,
  `Fit` tinyint(1) DEFAULT NULL,
  `NotFit` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `job_reccommended`
--
ALTER TABLE `job_reccommended`
  ADD PRIMARY KEY (`AccountId`,`JobId`), ADD KEY `FK_JOB_RECCOMENDED2` (`JobId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `job_reccommended`
--
ALTER TABLE `job_reccommended`
ADD CONSTRAINT `FK_JOB_RECCOMENDED` FOREIGN KEY (`AccountId`) REFERENCES `account` (`AccountId`),
ADD CONSTRAINT `FK_JOB_RECCOMENDED2` FOREIGN KEY (`JobId`) REFERENCES `job` (`JobId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
