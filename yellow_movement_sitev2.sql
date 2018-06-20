-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 19, 2018 at 12:30 AM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `yellow_movement_site`
--
CREATE DATABASE IF NOT EXISTS `yellow_movement_site` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `yellow_movement_site`;

-- --------------------------------------------------------

--
-- Table structure for table `BlogComments`
--

CREATE TABLE `BlogComments` (
  `blogID` int(11) NOT NULL,
  `comment_text` varchar(255) NOT NULL,
  `comment_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `commenterID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `BlogComments`
--

INSERT INTO `BlogComments` (`blogID`, `comment_text`, `comment_time`, `commenterID`) VALUES
(1, 'here i am user 2 commenting for blog 1', '2018-06-09 16:55:48', 2),
(1, 'This is my secod comment again', '2018-06-09 17:03:59', 2),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,', '2018-06-17 02:15:08', 4),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,', '2018-06-17 02:15:16', 4);

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

--
-- Dumping data for table `Blogs`
--

INSERT INTO `Blogs` (`blogID`, `bloggerID`, `blog_title`, `blog_content`, `blog_time`) VALUES
(1, 4, 'This is Blog 1', 'Here we start to blog for the first time, what do we think?', '2018-06-09 03:59:23'),
(2, 4, 'Blog 2 ', 'And so it continues to grow a the hip wears off', '2018-06-09 04:00:07'),
(3, 4, 'Blog3 ', 'These bloggs are getting tiring.', '2018-06-09 04:00:42'),
(5, 4, 'Blog4', 'And so i keep blogging for the sake of humanity', '2018-06-09 16:26:00'),
(6, 4, 'Blog5', 'Blog 5 right now', '2018-06-16 03:16:39'),
(7, 4, 'Blog6', 'Continued to Blog 6 right now', '2018-06-16 03:17:12'),
(8, 4, 'Blog6', 'Continued to Blog 6 right now', '2018-06-17 04:43:19'),
(9, 4, 'Blog6', 'Continued to Blog 6 right now', '2018-06-17 04:43:22'),
(10, 4, 'Blog6', 'Continued to Blog 6 right now', '2018-06-17 04:44:05'),
(11, 4, 'Blog6', 'Continued to Blog 6 right now', '2018-06-17 04:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `ChatMembers`
--

CREATE TABLE `ChatMembers` (
  `chatID` int(11) NOT NULL,
  `memberID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ChatMembers`
--

INSERT INTO `ChatMembers` (`chatID`, `memberID`) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 2),
(2, 5),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(1, 1),
(2, 1),
(4, 1),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(14, 5),
(14, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Chats`
--

CREATE TABLE `Chats` (
  `chatID` int(11) NOT NULL,
  `chat_title` varchar(20) NOT NULL,
  `last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `chat_description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Chats`
--

INSERT INTO `Chats` (`chatID`, `chat_title`, `last_modified`, `chat_description`) VALUES
(1, 'First Chat', '2018-06-09 03:19:30', NULL),
(2, 'Second Chat', '2018-06-09 03:19:35', NULL),
(3, 'Third Chat', '2018-06-09 03:19:38', NULL),
(4, 'New Chat Added', '2018-06-17 01:31:24', NULL),
(14, 'Really new Chat Now', '2018-06-17 01:51:08', 'I am sure this one is not repeated.');

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

--
-- Dumping data for table `ChatTexts`
--

INSERT INTO `ChatTexts` (`chatID`, `texterID`, `content`, `text_time`) VALUES
(1, 2, 'And so my text starts', '2018-06-13 17:20:06'),
(1, 2, 'And so my text starts', '2018-06-13 17:20:16'),
(2, 4, 'Here a sample text sent now', '2018-06-17 03:08:44');

-- --------------------------------------------------------

--
-- Table structure for table `Posts`
--

CREATE TABLE `Posts` (
  `postID` int(11) NOT NULL,
  `post_title` varchar(20) DEFAULT NULL,
  `post_content` text NOT NULL,
  `post_image` blob,
  `post_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Posts`
--

INSERT INTO `Posts` (`postID`, `post_title`, `post_content`, `post_image`, `post_time`) VALUES
(1, 'post 1', 'here is the content of the first post.', NULL, '2018-06-09 14:28:12'),
(2, 'Post 2', 'here we have post 2 contents all together', NULL, '2018-06-09 14:45:49'),
(3, 'Post 3', 'here we have post 3 have fun with it', NULL, '2018-06-09 14:47:47'),
(4, 'Post 4', 'here we have post 4 have fun with it', NULL, '2018-06-16 02:14:23'),
(5, 'Post 4', 'here we have post 4 have fun with it', NULL, '2018-06-16 02:15:12'),
(6, 'Post 6', 'here we have post 6 have fun with it', NULL, '2018-06-16 02:24:23'),
(7, 'Post 7', 'here we have post 7 have fun with it', NULL, '2018-06-16 02:50:59'),
(8, 'Post 8', 'here we have post 8 have fun with it', NULL, '2018-06-16 02:51:01'),
(9, 'Post 9', 'here we have post 9 have fun with it', NULL, '2018-06-16 02:52:26'),
(10, 'Post 10', 'here we have post 10 have fun with it', NULL, '2018-06-16 02:58:06'),
(11, 'Post 11', 'here we have post 11 have fun with it', NULL, '2018-06-16 15:42:49');

-- --------------------------------------------------------

--
-- Table structure for table `Requests`
--

CREATE TABLE `Requests` (
  `requesterID` int(11) DEFAULT NULL,
  `time_requested` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `seen` tinyint(1) DEFAULT '0',
  `status` varchar(10) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Requests`
--

INSERT INTO `Requests` (`requesterID`, `time_requested`, `seen`, `status`) VALUES
(2, '2018-06-09 16:27:22', 0, 'granted'),
(5, '2018-06-16 21:09:08', 0, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `userID` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` char(64) NOT NULL,
  `name` varchar(30) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'user',
  `age` tinyint(4) DEFAULT NULL,
  `sex` varchar(7) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `member` tinyint(1) DEFAULT NULL,
  `profile_pic` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`userID`, `email`, `password`, `name`, `role`, `age`, `sex`, `occupation`, `member`, `profile_pic`) VALUES
(1, 'example1@example.com', '$1$yellowmo$/owda3WBC9hsUihcGngSW/', 'User 1', 'admin', 127, 'female', 'Administrator', 1, NULL),
(2, 'example2@example.com', '$1$yellowmo$/owda3WBC9hsUihcGngSW/', 'User 2', 'blogger', NULL, 'male', NULL, 0, NULL),
(3, 'example3@example.com', '$1$yellowmo$/owda3WBC9hsUihcGngSW/', 'User 3', 'user', 127, NULL, NULL, NULL, NULL),
(4, 'example4@example.com', '$1$yellowmo$/owda3WBC9hsUihcGngSW/', 'User 4', 'user', 127, NULL, 'Student', 1, NULL),
(5, 'example5@example.com', '$1$yellowmo$/owda3WBC9hsUihcGngSW/', 'User 5', 'user', NULL, 'male', 'Doctor', 0, NULL),
(6, 'example6@example.com', '$1$yellowmo$/owda3WBC9hsUihcGngSW/', 'User 6', 'user', NULL, 'female', 'Engineer', 0, NULL),
(8, 'exampleq11@example.com', '$1$yellowmo$/owda3WBC9hsUihcGngSW/', 'User 11', 'user', NULL, 'male', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BlogComments`
--
ALTER TABLE `BlogComments`
  ADD KEY `blogID` (`blogID`),
  ADD KEY `commenterID` (`commenterID`);

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
  ADD PRIMARY KEY (`chatID`),
  ADD UNIQUE KEY `chat_title` (`chat_title`);

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
  ADD PRIMARY KEY (`postID`);

--
-- Indexes for table `Requests`
--
ALTER TABLE `Requests`
  ADD UNIQUE KEY `requesterID` (`requesterID`);

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
  MODIFY `blogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Chats`
--
ALTER TABLE `Chats`
  MODIFY `chatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `Posts`
--
ALTER TABLE `Posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BlogComments`
--
ALTER TABLE `BlogComments`
  ADD CONSTRAINT `BlogComments_ibfk_1` FOREIGN KEY (`blogID`) REFERENCES `Blogs` (`blogID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `BlogComments_ibfk_2` FOREIGN KEY (`commenterID`) REFERENCES `Users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `Requests`
--
ALTER TABLE `Requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`requesterID`) REFERENCES `Users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
