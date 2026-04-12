-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2026 at 02:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `distributed`
--

-- --------------------------------------------------------

--
-- Table structure for table `group_chats`
--

CREATE TABLE `group_chats` (
  `group_id` bigint(20) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group_chats`
--

INSERT INTO `group_chats` (`group_id`, `group_name`, `created_by`, `created_at`) VALUES
(1, 'Course Group', 6, '2026-04-09 21:52:12'),
(2, 'Group', 10, '2026-04-11 17:38:33'),
(3, 'Lads', 10, '2026-04-11 20:20:52'),
(7, 'testing reload', 9, '2026-04-11 23:22:28'),
(8, 'test', 9, '2026-04-12 12:29:53');

-- --------------------------------------------------------

--
-- Table structure for table `group_chat_members`
--

CREATE TABLE `group_chat_members` (
  `group_member_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group_chat_members`
--

INSERT INTO `group_chat_members` (`group_member_id`, `group_id`, `user_id`) VALUES
(3, 1, 5),
(1, 1, 6),
(2, 1, 9),
(4, 2, 1),
(5, 2, 9),
(6, 2, 10),
(7, 3, 1),
(8, 3, 5),
(9, 3, 9),
(10, 3, 10),
(11, 4, 5),
(12, 4, 9),
(13, 4, 10),
(14, 5, 5),
(15, 5, 9),
(17, 6, 9),
(16, 6, 10),
(19, 7, 9),
(18, 7, 10),
(20, 8, 5),
(22, 8, 9),
(21, 8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` bigint(20) NOT NULL,
  `user_from` bigint(20) NOT NULL,
  `user_to` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `date_sent` datetime NOT NULL DEFAULT current_timestamp(),
  `file_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `user_from`, `user_to`, `group_id`, `message`, `date_sent`, `file_path`) VALUES
(1, 6, 9, NULL, 'hello!', '2026-04-07 12:05:14', NULL),
(2, 9, 6, NULL, 'hi josie', '2026-04-07 12:05:20', NULL),
(3, 6, 9, NULL, 'here is my file', '2026-04-09 12:27:14', 'uploads/sample_notes.txt'),
(4, 6, NULL, 1, 'Hello everyone', '2026-04-09 12:33:32', NULL),
(5, 9, NULL, 1, 'group chat works now', '2026-04-09 12:35:02', NULL),
(6, 6, 9, NULL, '', '2026-04-09 22:53:12', 'uploads/1775771592_Untitleddesign20.png'),
(7, 6, NULL, 1, 'hi', '2026-04-09 23:20:52', NULL),
(13, 10, NULL, 2, 'hii', '2026-04-11 17:38:43', NULL),
(14, 10, 9, NULL, 'how are you?', '2026-04-11 17:59:56', NULL),
(15, 9, 10, NULL, 'Hiyaaaa', '2026-04-11 18:04:03', NULL),
(16, 10, 1, NULL, 'hi', '2026-04-11 18:51:48', NULL),
(18, 10, NULL, 2, 'hh', '2026-04-11 19:38:02', NULL),
(19, 10, NULL, 3, 'Hiyaaa', '2026-04-11 20:21:00', NULL),
(26, 10, 9, NULL, 'th', '2026-04-11 20:26:19', NULL),
(27, 10, NULL, 4, 'new g', '2026-04-11 20:39:35', NULL),
(28, 9, NULL, 2, 'Hello', '2026-04-12 00:17:56', NULL),
(29, 9, NULL, 3, '', '2026-04-12 00:32:34', 'uploads/1775950354_Untitleddesign7.png'),
(30, 9, 10, NULL, 'hello!', '2026-04-12 00:55:18', NULL),
(34, 9, NULL, 2, 'sBoMPNtoE71MXQByCdXxWEtoRUdwWW52SGNPZkpsRVptNERPbWc9PQ==', '2026-04-12 12:09:44', NULL),
(35, 9, 5, NULL, 'RJLmL1NYDR7eTrChUSADunFXajN4REEza292cGtscFkzS2pJZ1E9PQ==', '2026-04-12 12:10:45', NULL),
(36, 9, NULL, 8, 'KzVxPNEa0PjKLUSDWP9ulFNieE5vSU9CSnR6cG1oQ25LbzJmaVE9PQ==', '2026-04-12 12:30:00', NULL),
(37, 9, 5, NULL, 'Wm93vCIRqjaUdgYcCNDIxWk3aGN0anFPYVdaMWxJdFYxSFppWHc9PQ==', '2026-04-12 13:14:30', NULL),
(38, 9, NULL, 7, 'v1c+upYfioO9dHjYaSArO3RLamRONDE1eHUrUE9kQTBHZ3UxTnc9PQ==', '2026-04-12 13:14:38', NULL),
(39, 9, NULL, 7, '', '2026-04-12 13:21:11', 'uploads/1775996471_Untitleddesign18.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `accent_color` varchar(20) DEFAULT '#4a76a8',
  `font_size` int(11) DEFAULT 16
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `password`, `profile_pic`, `accent_color`, `font_size`) VALUES
(1, 'Cal', '$2y$10$HPRlXW73HMLCzIklxdgtr.gd.n3i5g8iwpzEa.rFbQTxEdw1N1IpK', NULL, '#4a76a8', 16),
(5, 'CallumSealy', '$2y$10$zF1Ss6P/mBK8rGxm9qfBO.t/6vHXwl/YWy1Xlcxb09/ROOCIE63eC', NULL, '#4a76a8', 16),
(9, 'Test', '$2y$10$jDDO.dOdKFRh.iAAAS.A8uEDPMW8e3XEK/uxVsLXoE9I3wMgk7/L6', 'uploads/1775932159_belle-2April.png', '#4a76a8', 16),
(10, 'JosiePollard', '$2y$10$9URR212ZTdcXJOBPTzB3buOWAvwGAtIS92Dk6.aBldTS7NemL5.8y', 'uploads/1775927307_Untitled design (10).png', '#ff3dae', 16);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `group_chats`
--
ALTER TABLE `group_chats`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `group_chat_members`
--
ALTER TABLE `group_chat_members`
  ADD PRIMARY KEY (`group_member_id`),
  ADD UNIQUE KEY `unique_group_member` (`group_id`,`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `unique_user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `group_chats`
--
ALTER TABLE `group_chats`
  MODIFY `group_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `group_chat_members`
--
ALTER TABLE `group_chat_members`
  MODIFY `group_member_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
