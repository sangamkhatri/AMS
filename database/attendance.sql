-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2023 at 11:53 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(20) NOT NULL,
  `log_type` tinyint(1) NOT NULL COMMENT '1 = AM IN, 4= PM out\r\n',
  `datetime_log` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `log_type`, `datetime_log`, `date_updated`, `latitude`, `longitude`) VALUES
(18, 6, 4, '2023-05-26 15:28:32', '2023-05-26 15:28:32', NULL, NULL),
(24, 3, 4, '2023-05-30 15:41:12', '2023-05-30 15:41:12', NULL, NULL),
(25, 6, 1, '2023-05-30 15:45:36', '2023-05-30 15:45:36', NULL, NULL),
(26, 6, 4, '2023-05-30 15:49:58', '2023-05-30 15:49:58', NULL, NULL),
(27, 3, 1, '2023-05-30 17:22:19', '2023-05-30 17:22:19', NULL, NULL),
(28, 3, 4, '2023-05-30 17:24:15', '2023-05-30 17:24:15', NULL, NULL),
(30, 7, 1, '2023-05-31 12:26:07', '2023-05-31 12:26:07', NULL, NULL),
(35, 6, 1, '2023-06-06 15:11:33', '2023-06-06 15:11:33', NULL, NULL),
(38, 3, 4, '2023-06-13 13:36:15', '2023-06-13 13:36:15', '27.69740000', '85.33180000'),
(39, 2, 1, '2023-06-13 13:36:27', '2023-06-13 13:36:27', '27.69740000', '85.33180000'),
(40, 3, 1, '2023-06-13 13:39:30', '2023-06-13 13:39:30', '27.69740000', '85.33180000'),
(41, 3, 1, '2023-06-13 13:51:08', '2023-06-13 13:51:08', '27.69740000', '85.33180000'),
(42, 3, 4, '2023-06-13 13:55:13', '2023-06-13 13:55:13', '27.69740000', '85.33180000'),
(43, 6, 1, '2023-06-16 14:35:46', '2023-06-16 14:35:46', '27.67727040', '85.34902180'),
(44, 6, 4, '2023-06-16 14:37:24', '2023-06-16 14:37:24', '27.67727040', '85.34902180');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(20) NOT NULL,
  `employee_no` varchar(100) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(20) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `department` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `employee_no`, `firstname`, `middlename`, `lastname`, `department`, `position`, `username`, `password`) VALUES
(2, '2023-01', 'Mahendra', '', 'Ratna', 'IT', 'Programmer', 'mahendra', '12345'),
(3, '2023-2', 'Jamuna', '', 'Karki', 'IT', 'Programmer', 'jamuna', '23456'),
(5, '2023-2', 'Puja', 'Kumari', 'Gupta', 'IT', 'Admin', 'puja', '78910'),
(6, '2023-4', 'Hari', '', 'Gyawali', 'HR', 'Staff', 'hari', '12345'),
(7, '202-4', 'fulkumaari', 'kjkkj', 'waiwa', 'IT', 'Programmer', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supervisior`
--

CREATE TABLE `supervisior` (
  `id` int(11) NOT NULL,
  `supervisior_no` int(11) NOT NULL,
  `firstname` varchar(1000) NOT NULL,
  `lastname` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `position` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supervisior`
--

INSERT INTO `supervisior` (`id`, `supervisior_no`, `firstname`, `lastname`, `password`, `username`, `position`) VALUES
(1, 120001, 'rohan', 'maharjan', '12345', 'rohan', 'supervisoir'),
(101, 12000, 'sangam', 'khatri', '12345', '', 'sangamkhatri'),
(102, 1003, 'sangam', 'khatri', '12345', 'sangamk', 'Programmer');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`) VALUES
(1, 'admin', 'admin123', 'Admin', 'Administrator'),
(2, 'Sample', 'sample123', 'Sample', 'Sample'),
(5, 'alphanepal', '12345', 'Alpha', 'Nepal'),
(6, 'fulkumari', '12345', 'fulkumaari', 'waiwa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supervisior`
--
ALTER TABLE `supervisior`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `supervisior`
--
ALTER TABLE `supervisior`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
