-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 25, 2025 at 03:12 PM
-- Server version: 11.4.7-MariaDB-cll-lve
-- PHP Version: 8.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `donor424_donor_yuk_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood_stock`
--

CREATE TABLE `blood_stock` (
  `id` int(10) UNSIGNED NOT NULL,
  `hospital_id` int(10) UNSIGNED NOT NULL,
  `blood_group` varchar(5) NOT NULL,
  `quantity` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blood_stock`
--

INSERT INTO `blood_stock` (`id`, `hospital_id`, `blood_group`, `quantity`, `create_at`, `updated_at`) VALUES
(1, 1, 'A', 9, '2025-05-28 13:39:03', '2025-06-09 08:32:21'),
(2, 1, 'B', 7, '2025-05-29 02:31:57', '2025-05-29 02:31:57'),
(3, 1, 'O', 4, '2025-05-29 02:32:08', '2025-05-29 02:32:08'),
(4, 1, 'AB', 8, '2025-05-29 02:32:22', '2025-05-29 02:32:22'),
(5, 2, 'AB', 9, '2025-05-29 02:32:33', '2025-05-29 02:32:33'),
(6, 2, 'O', 6, '2025-05-29 02:32:45', '2025-05-29 02:32:45'),
(7, 2, 'B', 7, '2025-05-29 02:32:55', '2025-05-29 02:33:20'),
(8, 3, 'A', 5, '2025-05-29 02:33:08', '2025-05-29 02:33:08'),
(9, 3, 'B', 7, '2025-05-29 02:33:30', '2025-05-29 02:33:30'),
(10, 3, 'AB', 3, '2025-05-29 02:33:45', '2025-05-29 02:33:45'),
(11, 3, 'O', 10, '2025-06-25 07:30:53', '2025-06-25 07:30:53');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(20) DEFAULT NULL,
  `hours` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `address`, `create_at`, `update_at`, `phone`, `hours`, `latitude`, `longitude`) VALUES
(1, 'Rumah Sakit Umum Daerah (RSUD) Kota Yogyakarta', 'Jl. Ki Ageng Pemanahan No.1-6, Sorosutan, Kec. Umbulharjo, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55162', '2025-05-28 13:24:34', '2025-05-28 13:24:34', '(0274) 371195', '24 Jam', -7.80131400, 110.38096200),
(2, 'Rumah Sakit Umum Pusat Dr. Sardjito', 'Jl. Kesehatan Jl. Kesehatan Sendowo No.1, Sendowo, Sinduadi, Kec. Mlati, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281', '2025-05-29 02:31:09', '2025-05-29 02:31:09', '(0274) 587333', '24 Jam', -7.77121700, 110.37526900),
(3, 'Siloam Hospitals Yogyakarta', 'Jl. Laksda Adisucipto No.32-34, Demangan, Kec. Gondokusuman, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55221', '2025-05-29 02:31:43', '2025-05-29 02:31:43', '1 500 911', '24 Jam', -7.78160400, 110.39572600);

-- --------------------------------------------------------

--
-- Table structure for table `pendonor`
--

CREATE TABLE `pendonor` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `blood_group` enum('A','B','AB','O') NOT NULL,
  `rhesus` enum('Positif','Negatif') NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `last_donor_date` date DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT current_timestamp(),
  `hospital_id` int(11) DEFAULT NULL,
  `preferred_time` time DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pendonor`
--

INSERT INTO `pendonor` (`id`, `fullname`, `nik`, `birthdate`, `gender`, `blood_group`, `rhesus`, `phone`, `address`, `last_donor_date`, `registration_date`, `hospital_id`, `preferred_time`, `email`) VALUES
(9, 'Arafi asari', '2982831928347568', '2025-06-25', 'L', 'A', 'Positif', '08976568097', 'jetis', '2025-06-24', '2025-06-24 12:08:39', 1, '22:08:00', 'Arafiasari@gmail.com'),
(11, 'M. Ilham Satriawan Haykal', '1238582919512040', '2004-09-02', 'L', 'B', 'Positif', '082210218293', 'Jl. Sinduadi Jetis, RT.03/RW.02, Kutu Patran, Sinduadi, Kec. Mlati, Kabupaten Sleman, Daerah Istimewa Yogyakarta', NULL, '2025-06-25 07:28:33', 1, '16:30:00', 'satriawan.haykal@gmail.com'),
(12, 'Budi Siregar', '2149128591240103', '2005-10-06', 'L', 'A', 'Positif', '081234567890', 'Jl. Melati No.3', NULL, '2025-06-25 08:08:07', 2, '17:00:00', 'satriawan.haykal@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `role`, `create_at`, `update_at`) VALUES
(1, 'Administrator', 'admin@donoryuk.com', '$2y$10$SXGxV6zbqdaU8W/WH3Pwce8.RINOADBup6gBlhGsI4VsWKEKhedCS', 'admin', '2025-05-28 12:20:40', '2025-05-28 12:20:40'),
(2, 'M. Ilham Satriawan Haykal', 'satriawan.haykal@gmail.com', '$2y$10$mM.wwqFhtFOWP1mTEo4MKufAEgx3aThNAZQ56unnMjHOvkZClvgHq', 'user', '2025-05-28 12:50:23', '2025-05-28 12:50:23'),
(3, 'M. Ilham Satriawan Haykal', 'tatshumakistore02@gmail.com', '$2y$10$Br56n.nQ/cD9OYPm7UL2Tuh00s2VvK3ISrJ/quTupj1ke4zkzIXga', 'user', '2025-05-29 03:24:51', '2025-05-29 03:24:51'),
(4, 'Ismik Fimilatika Mala Ramdhani', 'malaramdhni6@gmail.com', '$2y$10$u.ecVWWNCNWPPGjcTQP1A.dj2xZ5jZ30PbOVtN7lLQrqKiyAu.HP2', 'user', '2025-06-12 08:58:10', '2025-06-12 08:58:10'),
(5, 'Ismik Fimilatika Mala Ramdhani', 'mala06@gmail.com', '$2y$10$p/OvKqoQ7ZIvhTFkWnBzdOraQCMab/mDBOzpv00bPC0AzwNqJxkU6', 'user', '2025-06-12 12:38:37', '2025-06-12 12:38:37'),
(6, 'aaa', 'sasasa@gmail.com', '$2y$10$vKPzS6H6qUxrAtyYO5KWjeKI1eIxYifm4SkJefD/X47caY2GJ2j9W', 'user', '2025-06-12 12:41:16', '2025-06-12 12:41:16'),
(7, 'haykal', 'haykalsetiawan12@gmail.com', '$2y$10$XagxvYsbXZ8BbWLfMIqeIOMoeodP9INP1ovRrMxQsZMIr/Jj9ghiC', 'user', '2025-06-12 15:52:05', '2025-06-12 15:52:05'),
(8, 'Rix', 'rizalkam1@gmail.com', '$2y$10$ezwbC0z3zTbzFLihpOfilOvQ7cJzqB2baMe/8VTtE.vxRBC5oCZuK', 'user', '2025-06-14 10:26:42', '2025-06-14 10:26:42'),
(9, 'Haykal', 'haykalbackupwa@gmail.com', '$2y$10$1OXEBfewCDhehBk5lohDOunsu0Y.5X.xJ.hN3aosmUhy70m45241i', 'user', '2025-06-14 10:51:14', '2025-06-14 10:51:14'),
(10, 'moon', 'moonlaght@gmail.com', '$2y$10$4vJmuGQb4DAxdemoKWXilOlP5aNujMVX7d3giiR8wjVSb.ILoL7Yu', 'user', '2025-06-16 00:10:22', '2025-06-16 00:10:22'),
(11, 'Lulu Andriani', 'luluandriani980@gmail.com', '$2y$10$YbrKxkV2NeLP5M2Zkz5usOiPKemB48ky3lz/iJPiV87qR0Dl09WFq', 'user', '2025-06-16 00:17:31', '2025-06-16 00:17:31'),
(12, 'Arafiasari', 'Arafiasari2005@gmail.com', '$2y$10$sXT4U/UF0pbPigkvx5IvAea0Sbmj/1UENkGjH4m9mQeuBzjZbmIJa', 'user', '2025-06-24 11:58:16', '2025-06-24 11:58:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_stock`
--
ALTER TABLE `blood_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pendonor`
--
ALTER TABLE `pendonor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blood_stock`
--
ALTER TABLE `blood_stock`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pendonor`
--
ALTER TABLE `pendonor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood_stock`
--
ALTER TABLE `blood_stock`
  ADD CONSTRAINT `fk_hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
