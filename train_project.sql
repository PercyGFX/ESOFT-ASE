-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 26, 2023 at 05:17 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `train_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_locations`
--

DROP TABLE IF EXISTS `live_locations`;
CREATE TABLE IF NOT EXISTS `live_locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ticket_id` int NOT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_live_locations_tickets1_idx` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_discounts`
--

DROP TABLE IF EXISTS `loyalty_discounts`;
CREATE TABLE IF NOT EXISTS `loyalty_discounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `badge` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `ticket_count` int DEFAULT NULL,
  `dicount_precentage` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
CREATE TABLE IF NOT EXISTS `passengers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `nic` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `city` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_passengers_users_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `order_id` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `payment_id` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `payhere_amount` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `payhere_currency` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `status_message` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `card_expiry` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `card_no` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `method` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `card_holder_name` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `ticket_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payments_tickets1_idx` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `passenger_id` int NOT NULL,
  `train_id` int NOT NULL,
  `qty` int DEFAULT NULL,
  `discount` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `ticket_price` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `totle_price` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tickets_passengers1_idx` (`passenger_id`),
  KEY `fk_tickets_trains1_idx` (`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
CREATE TABLE IF NOT EXISTS `trains` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `image` varchar(245) COLLATE utf8mb3_bin DEFAULT NULL,
  `from` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `to` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `from_time` double DEFAULT NULL,
  `to_time` timestamp NULL DEFAULT NULL,
  `ticket_price` double DEFAULT NULL,
  `is_active` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `seats` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `fame` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lname` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `live_locations`
--
ALTER TABLE `live_locations`
  ADD CONSTRAINT `fk_live_locations_tickets1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`);

--
-- Constraints for table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `fk_passengers_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_tickets1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `fk_tickets_passengers1` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`),
  ADD CONSTRAINT `fk_tickets_trains1` FOREIGN KEY (`train_id`) REFERENCES `trains` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
