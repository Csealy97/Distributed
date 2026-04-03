-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2026 at 01:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` bigint(20) NOT NULL,
  `user_from` bigint(20) NOT NULL,
  `user_to` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `date_sent` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `user_from`, `user_to`, `message`, `date_sent`) VALUES
(1, 1, 2, 'Test', '2026-02-16 11:16:17'),
(2, 1, 2, 'yo', '2026-03-16 09:46:04'),
(3, 1, 2, 'vvvvvvvv', '2026-03-16 09:46:15'),
(4, 1, 2, 'v', '2026-03-16 09:46:19'),
(5, 1, 2, 'v', '2026-03-16 09:46:22'),
(6, 1, 2, 'jhello', '2026-03-16 10:02:22'),
(7, 1, 2, 'v', '2026-03-16 10:23:49'),
(8, 5, 1, 'hey ', '2026-03-29 22:07:46'),
(9, 5, 1, 'www', '2026-03-29 22:09:32'),
(10, 5, 1, 'WlooooooWOoooo', '2026-03-29 22:14:17'),
(11, 5, 2, 'Cal is here ', '2026-04-03 12:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `password`) VALUES
(1, 'Cal', '$2y$10$HPRlXW73HMLCzIklxdgtr.gd.n3i5g8iwpzEa.rFbQTxEdw1N1IpK'),
(2, 'Cal', '$2y$10$pn.7i9zOiq/OcHvbKDbDcudIQWFIWov0lwhwMfyAS0M7zBPg6Ifee'),
(3, 'Cal', '$2y$10$vhSpu6ipNN3AvcyuixMGPOsGxH8Ozd3O1Mfdq0HsZr8b7CL2J4Azq'),
(4, 'Cal', '$2y$10$vDUngbLQkiVQkXbbr9YdQejZzM/tihJCdvztDPqNH3qulMgwslAN6'),
(5, 'CallumSealy', '$2y$10$zF1Ss6P/mBK8rGxm9qfBO.t/6vHXwl/YWy1Xlcxb09/ROOCIE63eC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
