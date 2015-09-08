-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2015 at 04:05 PM
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
CREATE DATABASE IF NOT EXISTS `recsys` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `recsys`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `AccountId` int(11) NOT NULL,
  `UserName` text,
  `Email` char(100) DEFAULT NULL,
  `Password` text,
  `AccountType` char(10) DEFAULT NULL,
  `TimeReceiveEmail` char(10) DEFAULT NULL,
  `NumberReceiveEmail` int(11) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL,
  `ConfirmCode` text NOT NULL,
  `Avatar` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `care`
--

CREATE TABLE IF NOT EXISTS `care` (
  `CategoryId` int(11) NOT NULL,
  `AccountId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `WillingToRelocate` blob,
  `WillingToTravel` blob,
  `CareerObjective` text,
  `CareerObjectiveId` int(11) NOT NULL,
  `ResumeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `CategoryId` int(11) NOT NULL,
  `Description` text
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `CompanyId` int(11) NOT NULL,
  `AccountId` int(11) NOT NULL,
  `CompanyName` text,
  `CompanySumary` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `EducationLevel` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE IF NOT EXISTS `experience` (
  `ExperienceId` int(11) NOT NULL,
  `ResumeId` int(11) NOT NULL,
  `Company_name` text,
  `JobTitle` text,
  `Position` text,
  `Description` text,
  `Period` text,
  `JobCategory` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `JobId` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `AccountId` int(11) NOT NULL,
  `JobName` text,
  `Location` text,
  `Salary` text,
  `Description` text,
  `Tags` text,
  `Requirement` text,
  `Benifit` text,
  `Expired` date DEFAULT NULL,
  `Source` text,
  `Company` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2774 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_reccomended`
--

CREATE TABLE IF NOT EXISTS `job_reccomended` (
  `AccountId` int(11) NOT NULL,
  `JobId` int(11) NOT NULL,
  `IsFit` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `Name` text,
  `Level` text,
  `LanguageId` int(11) NOT NULL,
  `ResumeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE IF NOT EXISTS `reference` (
  `Type` text,
  `Name` text,
  `JobTitle` text,
  `Phone` char(15) DEFAULT NULL,
  `Email` char(100) DEFAULT NULL,
  `ReferenceId` int(11) NOT NULL,
  `ResumeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `MaritalStatus` blob,
  `PlaceOfBirth` text,
  `Hometown` text,
  `Nationality` text,
  `Avatar` text,
  `Address` text,
  `Email` char(100) DEFAULT NULL,
  `Phone` char(15) DEFAULT NULL,
  `Hobby` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE IF NOT EXISTS `school` (
  `SchoolID` int(11) NOT NULL,
  `SchoolName` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE IF NOT EXISTS `skill` (
  `Name` text,
  `Level` text,
  `SkillId` int(11) NOT NULL,
  `ResumeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xpath`
--

CREATE TABLE IF NOT EXISTS `xpath` (
  `home_url` char(200) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `base_url` text,
  `xpath_code` text,
  `job_xpath` text,
  `company_xpath` text,
  `location_xpath` text,
  `description_xpath` text,
  `salary_xpath` text,
  `requirement_xpath` text,
  `benifit_xpath` text,
  `expired_xpath` text,
  `tags_xpath` text,
  `login_url` text,
  `login_data` text,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`AccountId`), ADD UNIQUE KEY `AK_Key_2` (`Email`);

--
-- Indexes for table `care`
--
ALTER TABLE `care`
  ADD PRIMARY KEY (`CategoryId`,`AccountId`), ADD KEY `FK_CARE2` (`AccountId`);

--
-- Indexes for table `career_objective`
--
ALTER TABLE `career_objective`
  ADD PRIMARY KEY (`CareerObjectiveId`), ADD KEY `FK_Relationship_5` (`ResumeId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`CompanyId`), ADD KEY `FK_Relationship_12` (`AccountId`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`EducationId`), ADD KEY `FK_Relationship_2` (`ResumeId`), ADD KEY `FK_Relationship_6` (`SchoolID`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`ExperienceId`), ADD KEY `FK_Relationship_4` (`ResumeId`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`JobId`), ADD KEY `FK_Relationship_11` (`CategoryId`), ADD KEY `FK_Relationship_14` (`AccountId`);

--
-- Indexes for table `job_reccomended`
--
ALTER TABLE `job_reccomended`
  ADD PRIMARY KEY (`AccountId`,`JobId`), ADD KEY `FK_JOB_RECCOMENDED2` (`JobId`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`LanguageId`), ADD KEY `FK_Relationship_16` (`ResumeId`);

--
-- Indexes for table `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`ReferenceId`), ADD KEY `FK_Relationship_8` (`ResumeId`);

--
-- Indexes for table `resume`
--
ALTER TABLE `resume`
  ADD PRIMARY KEY (`ResumeId`), ADD KEY `FK_Relationship_9` (`AccountId`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`SchoolID`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`SkillId`), ADD KEY `FK_Relationship_1` (`ResumeId`);

--
-- Indexes for table `xpath`
--
ALTER TABLE `xpath`
  ADD PRIMARY KEY (`home_url`), ADD KEY `FK_Relationship_15` (`CategoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `AccountId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `career_objective`
--
ALTER TABLE `career_objective`
  MODIFY `CareerObjectiveId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `CompanyId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `EducationId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `ExperienceId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `JobId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2774;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `LanguageId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reference`
--
ALTER TABLE `reference`
  MODIFY `ReferenceId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resume`
--
ALTER TABLE `resume`
  MODIFY `ResumeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `SchoolID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `SkillId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `care`
--
ALTER TABLE `care`
ADD CONSTRAINT `FK_CARE` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`),
ADD CONSTRAINT `FK_CARE2` FOREIGN KEY (`AccountId`) REFERENCES `account` (`AccountId`);

--
-- Constraints for table `career_objective`
--
ALTER TABLE `career_objective`
ADD CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`ResumeId`) REFERENCES `resume` (`ResumeId`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
ADD CONSTRAINT `FK_Relationship_12` FOREIGN KEY (`AccountId`) REFERENCES `account` (`AccountId`);

--
-- Constraints for table `education`
--
ALTER TABLE `education`
ADD CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`ResumeId`) REFERENCES `resume` (`ResumeId`),
ADD CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`SchoolID`) REFERENCES `school` (`SchoolID`);

--
-- Constraints for table `experience`
--
ALTER TABLE `experience`
ADD CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`ResumeId`) REFERENCES `resume` (`ResumeId`);

--
-- Constraints for table `job`
--
ALTER TABLE `job`
ADD CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`),
ADD CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`AccountId`) REFERENCES `account` (`AccountId`);

--
-- Constraints for table `job_reccomended`
--
ALTER TABLE `job_reccomended`
ADD CONSTRAINT `FK_JOB_RECCOMENDED` FOREIGN KEY (`AccountId`) REFERENCES `account` (`AccountId`),
ADD CONSTRAINT `FK_JOB_RECCOMENDED2` FOREIGN KEY (`JobId`) REFERENCES `job` (`JobId`);

--
-- Constraints for table `language`
--
ALTER TABLE `language`
ADD CONSTRAINT `FK_Relationship_16` FOREIGN KEY (`ResumeId`) REFERENCES `resume` (`ResumeId`);

--
-- Constraints for table `reference`
--
ALTER TABLE `reference`
ADD CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`ResumeId`) REFERENCES `resume` (`ResumeId`);

--
-- Constraints for table `resume`
--
ALTER TABLE `resume`
ADD CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`AccountId`) REFERENCES `account` (`AccountId`);

--
-- Constraints for table `skill`
--
ALTER TABLE `skill`
ADD CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`ResumeId`) REFERENCES `resume` (`ResumeId`);

--
-- Constraints for table `xpath`
--
ALTER TABLE `xpath`
ADD CONSTRAINT `FK_Relationship_15` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CategoryId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
