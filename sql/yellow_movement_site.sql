-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 01, 2018 at 07:22 PM
-- Server version: 10.1.31-MariaDB
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
-- Database: `yellow_movement_site`
--

-- --------------------------------------------------------

--
-- Table structure for table `BlogComments`
--

CREATE TABLE `BlogComments` (
  `blogID` int(11) NOT NULL,
  `comment_text` varchar(255) NOT NULL,
  `comment_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Blogs`
--

CREATE TABLE `Blogs` (
  `blogID` int(11) NOT NULL,
  `bloggerID` int(11) NOT NULL,
  `blog_title` varchar(20) DEFAULT NULL,
  `blog_content` text NOT NULL,
  `blog_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ChatMembers`
--

CREATE TABLE `ChatMembers` (
  `chatID` int(11) NOT NULL,
  `memberID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Chats`
--

CREATE TABLE `Chats` (
  `chatID` int(11) NOT NULL,
  `chat_title` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ChatTexts`
--

CREATE TABLE `ChatTexts` (
  `chatID` int(11) NOT NULL,
  `texterID` int(11) NOT NULL,
  `content` text NOT NULL,
  `text_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Posts`
--

CREATE TABLE `Posts` (
  `postID` int(11) NOT NULL,
  `posterID` int(11) NOT NULL,
  `post_title` varchar(20) DEFAULT NULL,
  `post_content` text NOT NULL,
  `post_image` blob,
  `post_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `userID` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'user',
  `date_of_birth` date DEFAULT NULL,
  `sex` varchar(7) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `member` tinyint(1) DEFAULT NULL,
  `profile_pic` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BlogComments`
--
ALTER TABLE `BlogComments`
  ADD KEY `blogID` (`blogID`);

--
-- Indexes for table `Blogs`
--
ALTER TABLE `Blogs`
  ADD PRIMARY KEY (`blogID`),
  ADD KEY `bloggerID` (`bloggerID`);

--
-- Indexes for table `ChatMembers`
--
ALTER TABLE `ChatMembers`
  ADD KEY `chatID` (`chatID`),
  ADD KEY `memberID` (`memberID`);

--
-- Indexes for table `Chats`
--
ALTER TABLE `Chats`
  ADD PRIMARY KEY (`chatID`);

--
-- Indexes for table `ChatTexts`
--
ALTER TABLE `ChatTexts`
  ADD KEY `chatID` (`chatID`),
  ADD KEY `texterID` (`texterID`);

--
-- Indexes for table `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `posterID` (`posterID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Blogs`
--
ALTER TABLE `Blogs`
  MODIFY `blogID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Chats`
--
ALTER TABLE `Chats`
  MODIFY `chatID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Posts`
--
ALTER TABLE `Posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BlogComments`
--
ALTER TABLE `BlogComments`
  ADD CONSTRAINT `BlogComments_ibfk_1` FOREIGN KEY (`blogID`) REFERENCES `Users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Blogs`
--
ALTER TABLE `Blogs`
  ADD CONSTRAINT `Blogs_ibfk_1` FOREIGN KEY (`bloggerID`) REFERENCES `Users` (`userID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `ChatMembers`
--
ALTER TABLE `ChatMembers`
  ADD CONSTRAINT `ChatMembers_ibfk_1` FOREIGN KEY (`chatID`) REFERENCES `Chats` (`chatID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ChatMembers_ibfk_2` FOREIGN KEY (`memberID`) REFERENCES `Users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ChatTexts`
--
ALTER TABLE `ChatTexts`
  ADD CONSTRAINT `ChatTexts_ibfk_1` FOREIGN KEY (`chatID`) REFERENCES `Chats` (`chatID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ChatTexts_ibfk_2` FOREIGN KEY (`texterID`) REFERENCES `Users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Posts`
--
ALTER TABLE `Posts`
  ADD CONSTRAINT `Posts_ibfk_1` FOREIGN KEY (`posterID`) REFERENCES `Users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
