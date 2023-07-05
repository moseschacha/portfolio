-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2023 at 10:14 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `troms`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 1, 'App\\Domains\\Announcement\\Models\\Announcement', NULL, NULL, '{\"attributes\":{\"area\":null,\"type\":\"info\",\"message\":\"\",\"enabled\":true,\"starts_at\":null,\"ends_at\":null}}', '2023-06-12 05:37:24', '2023-06-12 05:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `po_box` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `area` enum('frontend','backend') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('info','danger','warning','success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'info',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `area`, `type`, `message`, `enabled`, `starts_at`, `ends_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'info', '', 1, NULL, NULL, '2023-06-12 05:37:24', '2023-06-12 05:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `approval_levels`
--

CREATE TABLE `approval_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `weight` int(11) NOT NULL,
  `can_mark_as_approved` tinyint(1) DEFAULT NULL,
  `departments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`departments`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `branches` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`branches`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `approval_logs`
--

CREATE TABLE `approval_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recovery_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `reason_code` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bparty` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`id`, `bparty`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'consignee', '2023-06-26 09:35:13', '2023-06-26 09:36:38', '2023-06-26 09:36:38'),
(2, 'consignee', '2023-06-30 07:07:19', '2023-06-30 07:07:22', '2023-06-30 07:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `bp`
--

CREATE TABLE `bp` (
  `bp_id` int(11) DEFAULT NULL,
  `bp_Company` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bp`
--

INSERT INTO `bp` (`bp_id`, `bp_Company`) VALUES
(1, 'BOLLORE  UGANDA'),
(2, 'BILLING PARTY'),
(3, 'BOLLORE CHINA'),
(4, 'BOLLORE FRANCE'),
(5, 'BOLLORE GERMANY'),
(6, 'BOLLORE INDIA'),
(7, 'BOLLORE J.BURG'),
(8, 'BOLLORE UGANDA'),
(9, 'BOLLORE USA'),
(10, 'BOLLORE VIETNAM'),
(11, 'CZARNIKOW'),
(12, 'GREENCARRIER FREIGHT'),
(13, 'LEADCOM UGANDA'),
(14, 'MANSONS U LTD'),
(15, 'NANAK TRUCKING'),
(16, 'WEC LINE'),
(17, 'WFP'),
(18, 'OTHER'),
(19, 'UNIMISS'),
(20, 'BOLLORE JAPAN'),
(21, 'LCL LOGISTICS'),
(22, 'DESIGNER GROUP'),
(23, 'BOLLORE SWEDEN'),
(24, 'ELGON KENYA LTD'),
(25, 'BTL RWANDA'),
(26, 'LEADCOM ISRAEL'),
(27, 'DIVERSY EASTERN & CENTRAL AFRICA'),
(28, 'GLOBE FLIGHT WORLDWIDE EXPRESS LTD'),
(29, 'BOLLORE BELGIUM'),
(30, 'DIMENSION DATA SOLUTIONS'),
(31, 'AIRLAND LOGISTICS'),
(32, 'BOLLORE TANZANIA LTD'),
(33, 'Nova Farm'),
(34, 'DASAN MERCHANT MARINE LTD'),
(35, 'BTL SOUTH AFRICA'),
(36, 'BTL SOUTH AFRICA'),
(37, 'BTL UK'),
(38, 'CERNY BUREAU ENTERPRISES'),
(39, 'SAFARI STATIONERS'),
(40, 'SAFARI STATIONERS'),
(1040, 'BOLLORE DRC'),
(1, 'BOLLORE  UGANDA'),
(2, 'BILLING PARTY'),
(3, 'BOLLORE CHINA'),
(4, 'BOLLORE FRANCE'),
(5, 'BOLLORE GERMANY'),
(6, 'BOLLORE INDIA'),
(7, 'BOLLORE J.BURG'),
(8, 'BOLLORE UGANDA'),
(9, 'BOLLORE USA'),
(10, 'BOLLORE VIETNAM'),
(11, 'CZARNIKOW'),
(12, 'GREENCARRIER FREIGHT'),
(13, 'LEADCOM UGANDA'),
(14, 'MANSONS U LTD'),
(15, 'NANAK TRUCKING'),
(16, 'WEC LINE'),
(17, 'WFP'),
(18, 'OTHER'),
(19, 'UNIMISS'),
(20, 'BOLLORE JAPAN'),
(21, 'LCL LOGISTICS'),
(22, 'DESIGNER GROUP'),
(23, 'BOLLORE SWEDEN'),
(24, 'ELGON KENYA LTD'),
(25, 'BTL RWANDA'),
(26, 'LEADCOM ISRAEL'),
(27, 'DIVERSY EASTERN & CENTRAL AFRICA'),
(28, 'GLOBE FLIGHT WORLDWIDE EXPRESS LTD'),
(29, 'BOLLORE BELGIUM'),
(30, 'DIMENSION DATA SOLUTIONS'),
(31, 'AIRLAND LOGISTICS'),
(32, 'BOLLORE TANZANIA LTD'),
(33, 'Nova Farm'),
(34, 'DASAN MERCHANT MARINE LTD'),
(35, 'BTL SOUTH AFRICA'),
(36, 'BTL SOUTH AFRICA'),
(37, 'BTL UK'),
(38, 'CERNY BUREAU ENTERPRISES'),
(39, 'SAFARI STATIONERS'),
(40, 'SAFARI STATIONERS'),
(1040, 'BOLLORE DRC');

-- --------------------------------------------------------

--
-- Table structure for table `cargo_types`
--

CREATE TABLE `cargo_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carriers`
--

CREATE TABLE `carriers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transporter_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `po_box` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kra_pin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `po_box` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consignee`
--

CREATE TABLE `consignee` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consignee`
--

INSERT INTO `consignee` (`id`, `cname`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'port', '2023-06-20 06:56:20', '2023-06-20 06:56:27', '2023-06-20 06:56:27'),
(2, 'port', '2023-06-20 06:57:26', '2023-06-20 06:57:31', '2023-06-20 06:57:31'),
(3, 'port', '2023-06-26 08:55:22', '2023-06-26 08:55:28', '2023-06-26 08:55:28'),
(4, 'port', '2023-06-30 07:06:35', '2023-06-30 07:06:39', '2023-06-30 07:06:39');

-- --------------------------------------------------------

--
-- Table structure for table `consignees`
--

CREATE TABLE `consignees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consignees`
--

INSERT INTO `consignees` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'underli', '2023-07-03 09:05:55', '2023-07-03 09:06:04', '2023-07-03 09:06:04');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departmental`
--

CREATE TABLE `departmental` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departmental`
--

INSERT INTO `departmental` (`id`, `dname`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'tt', '2023-06-20 06:57:49', '2023-06-20 06:57:52', '2023-06-20 06:57:52'),
(2, 'tt', '2023-06-26 09:39:21', '2023-06-26 09:39:24', '2023-06-26 09:39:24'),
(3, 'tt', '2023-06-30 07:08:32', '2023-06-30 07:08:36', '2023-06-30 07:08:36');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `com` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entry`
--

CREATE TABLE `entry` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `estatus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entry`
--

INSERT INTO `entry` (`id`, `estatus`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ine', '2023-06-20 06:56:44', '2023-06-20 06:56:48', '2023-06-20 06:56:48'),
(2, 'ine', '2023-06-26 08:55:40', '2023-06-26 08:55:44', '2023-06-26 08:55:44'),
(3, 'ine', '2023-06-30 07:07:01', '2023-06-30 07:07:05', '2023-06-30 07:07:05');

-- --------------------------------------------------------

--
-- Table structure for table `exit`
--

CREATE TABLE `exit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `estatus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exit`
--

INSERT INTO `exit` (`id`, `estatus`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'rrr', '2023-06-20 06:58:44', '2023-06-20 06:58:47', '2023-06-20 06:58:47'),
(2, 'ine', '2023-06-26 09:40:23', '2023-06-26 09:40:26', '2023-06-26 09:40:26'),
(3, 'rrr', '2023-06-30 07:06:07', '2023-06-30 07:06:12', '2023-06-30 07:06:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `group`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'rrr', '2023-06-20 06:59:12', '2023-06-20 06:59:16', '2023-06-20 06:59:16'),
(2, 'rrr', '2023-06-26 09:39:49', '2023-06-26 09:39:53', '2023-06-26 09:39:53'),
(3, 'rrr', '2023-07-03 11:14:10', '2023-07-03 11:14:14', '2023-07-03 11:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `haulers`
--

CREATE TABLE `haulers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `haulers`
--

INSERT INTO `haulers` (`id`, `hname`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'to', '2023-06-30 07:05:09', '2023-06-30 07:05:13', '2023-06-30 07:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `hauliers`
--

CREATE TABLE `hauliers` (
  `Ha_ID` int(11) DEFAULT NULL,
  `Ha_Hauler` varchar(255) DEFAULT NULL,
  `Ha_HaulerCode` varchar(255) DEFAULT NULL,
  `Ha_Cdate` datetime DEFAULT NULL,
  `Ha_Cby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hauliers`
--

INSERT INTO `hauliers` (`Ha_ID`, `Ha_Hauler`, `Ha_HaulerCode`, `Ha_Cdate`, `Ha_Cby`) VALUES
(1, 'BOLLORE ??', 'BOL', '0000-00-00 00:00:00', '1'),
(2, 'BLUE JAY', 'BLU', '0000-00-00 00:00:00', '1'),
(3, 'PALM OIL', 'PAL', '0000-00-00 00:00:00', '1'),
(4, 'TRANSEAST', 'TRE', '0000-00-00 00:00:00', '1'),
(5, 'TRANSLOGISTICS', 'PTY', '0000-00-00 00:00:00', '1'),
(6, 'UTD', 'SEL', '0000-00-00 00:00:00', '1'),
(7, 'OTHER', 'OTR', '0000-00-00 00:00:00', '1'),
(8, 'MANSON', 'SIG', '0000-00-00 00:00:00', '1'),
(9, 'BIG ROAD', 'BIG', '0000-00-00 00:00:00', '1'),
(10, 'HAKIKA', 'HAK', '0000-00-00 00:00:00', '1'),
(11, 'TUDOR TRUCKS', 'TUD', '0000-00-00 00:00:00', '1'),
(12, 'DANROSE', 'DAN', '0000-00-00 00:00:00', '1'),
(13, 'AL KAMAR', 'ALK', '0000-00-00 00:00:00', '1'),
(14, 'BASHAEB', 'BAS', '0000-00-00 00:00:00', '1'),
(15, 'GLOBAL MOVEMENT', 'GMO', '0000-00-00 00:00:00', '1'),
(16, 'ABEBE', 'ABE', '0000-00-00 00:00:00', '1'),
(17, 'MANCO', 'MCO', '0000-00-00 00:00:00', '1'),
(18, 'TAHMED', 'TMD', '0000-00-00 00:00:00', '1'),
(19, 'SASA', 'SAS', '0000-00-00 00:00:00', '1'),
(20, 'DEEPCREEK', 'DEE', '2048-12-03 00:00:00', '1004'),
(21, 'TRUCKNOLOGY', 'TRU', '0000-00-00 00:00:00', '1004'),
(22, 'YALFA CARGO', 'YAL', '0000-00-00 00:00:00', '1004'),
(23, 'METRO LOGISTICS', 'MET', '2004-08-02 00:00:00', '1004'),
(24, 'BROADWAYS', 'BRO', '0000-00-00 00:00:00', '1004'),
(25, 'PRIMEFUELS', 'PRI', '0000-00-00 00:00:00', '1004'),
(26, 'HADAREB', 'HAD', '0000-00-00 00:00:00', '1004'),
(27, 'NANAK', 'NAN', '0000-00-00 00:00:00', '1004'),
(28, 'TECHNOCRATS', 'TEC', '0000-00-00 00:00:00', '1006'),
(29, 'TASAM', 'TAS', '0000-00-00 00:00:00', '1005'),
(30, 'TRAILINK', 'TRA', '0000-00-00 00:00:00', '1003'),
(31, 'CARGO FREX', 'CAR', '2001-07-07 00:00:00', '1003'),
(32, 'SIFA INVESTMENT', 'SIF', '0000-00-00 00:00:00', '1003'),
(33, 'DANKI VENTURES', 'DAN', '0000-00-00 00:00:00', '1005'),
(34, 'MASA', 'MAS', '0000-00-00 00:00:00', '1005'),
(35, 'TANAD', 'TAN', '0000-00-00 00:00:00', '1006'),
(36, 'JACONINOS', 'JAC', '0000-00-00 00:00:00', '1005'),
(37, 'GANDAY', 'GAN', '0000-00-00 00:00:00', '1006'),
(38, 'ELAD', 'ELA', '0000-00-00 00:00:00', '1005'),
(39, 'SAVEWAYS', 'SAV', '0000-00-00 00:00:00', '1005'),
(40, 'SAVEWAYS', 'SAV', '0000-00-00 00:00:00', '1005'),
(41, 'OAMS', 'OAM', '2040-02-02 00:00:00', '1005'),
(42, 'TANAAD', 'TAN', '0000-00-00 00:00:00', '1005'),
(43, 'CPK', 'CPK', '0000-00-00 00:00:00', '1005'),
(44, 'SASHCO', 'SAS', '2025-03-07 00:00:00', '1005'),
(45, 'TANAAD', 'TAN', '2021-11-01 00:00:00', '1005'),
(46, 'TANASUL', 'TAN', '0000-00-00 00:00:00', '1005'),
(47, 'A.O BAYUSUF', 'A.O', '0000-00-00 00:00:00', '1005'),
(1, 'BOLLORE ??', 'BOL', '0000-00-00 00:00:00', '1'),
(2, 'BLUE JAY', 'BLU', '0000-00-00 00:00:00', '1'),
(3, 'PALM OIL', 'PAL', '0000-00-00 00:00:00', '1'),
(4, 'TRANSEAST', 'TRE', '0000-00-00 00:00:00', '1'),
(5, 'TRANSLOGISTICS', 'PTY', '0000-00-00 00:00:00', '1'),
(6, 'UTD', 'SEL', '0000-00-00 00:00:00', '1'),
(7, 'OTHER', 'OTR', '0000-00-00 00:00:00', '1'),
(8, 'MANSON', 'SIG', '0000-00-00 00:00:00', '1'),
(9, 'BIG ROAD', 'BIG', '0000-00-00 00:00:00', '1'),
(10, 'HAKIKA', 'HAK', '0000-00-00 00:00:00', '1'),
(11, 'TUDOR TRUCKS', 'TUD', '0000-00-00 00:00:00', '1'),
(12, 'DANROSE', 'DAN', '0000-00-00 00:00:00', '1'),
(13, 'AL KAMAR', 'ALK', '0000-00-00 00:00:00', '1'),
(14, 'BASHAEB', 'BAS', '0000-00-00 00:00:00', '1'),
(15, 'GLOBAL MOVEMENT', 'GMO', '0000-00-00 00:00:00', '1'),
(16, 'ABEBE', 'ABE', '0000-00-00 00:00:00', '1'),
(17, 'MANCO', 'MCO', '0000-00-00 00:00:00', '1'),
(18, 'TAHMED', 'TMD', '0000-00-00 00:00:00', '1'),
(19, 'SASA', 'SAS', '0000-00-00 00:00:00', '1'),
(20, 'DEEPCREEK', 'DEE', '2048-12-03 00:00:00', '1004'),
(21, 'TRUCKNOLOGY', 'TRU', '0000-00-00 00:00:00', '1004'),
(22, 'YALFA CARGO', 'YAL', '0000-00-00 00:00:00', '1004'),
(23, 'METRO LOGISTICS', 'MET', '2004-08-02 00:00:00', '1004'),
(24, 'BROADWAYS', 'BRO', '0000-00-00 00:00:00', '1004'),
(25, 'PRIMEFUELS', 'PRI', '0000-00-00 00:00:00', '1004'),
(26, 'HADAREB', 'HAD', '0000-00-00 00:00:00', '1004'),
(27, 'NANAK', 'NAN', '0000-00-00 00:00:00', '1004'),
(28, 'TECHNOCRATS', 'TEC', '0000-00-00 00:00:00', '1006'),
(29, 'TASAM', 'TAS', '0000-00-00 00:00:00', '1005'),
(30, 'TRAILINK', 'TRA', '0000-00-00 00:00:00', '1003'),
(31, 'CARGO FREX', 'CAR', '2001-07-07 00:00:00', '1003'),
(32, 'SIFA INVESTMENT', 'SIF', '0000-00-00 00:00:00', '1003'),
(33, 'DANKI VENTURES', 'DAN', '0000-00-00 00:00:00', '1005'),
(34, 'MASA', 'MAS', '0000-00-00 00:00:00', '1005'),
(35, 'TANAD', 'TAN', '0000-00-00 00:00:00', '1006'),
(36, 'JACONINOS', 'JAC', '0000-00-00 00:00:00', '1005'),
(37, 'GANDAY', 'GAN', '0000-00-00 00:00:00', '1006'),
(38, 'ELAD', 'ELA', '0000-00-00 00:00:00', '1005'),
(39, 'SAVEWAYS', 'SAV', '0000-00-00 00:00:00', '1005'),
(40, 'SAVEWAYS', 'SAV', '0000-00-00 00:00:00', '1005'),
(41, 'OAMS', 'OAM', '2040-02-02 00:00:00', '1005'),
(42, 'TANAAD', 'TAN', '0000-00-00 00:00:00', '1005'),
(43, 'CPK', 'CPK', '0000-00-00 00:00:00', '1005'),
(44, 'SASHCO', 'SAS', '2025-03-07 00:00:00', '1005'),
(45, 'TANAAD', 'TAN', '2021-11-01 00:00:00', '1005'),
(46, 'TANASUL', 'TAN', '0000-00-00 00:00:00', '1005'),
(47, 'A.O BAYUSUF', 'A.O', '0000-00-00 00:00:00', '1005');

-- --------------------------------------------------------

--
-- Table structure for table `import`
--

CREATE TABLE `import` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `Tracking Code` varchar(255) DEFAULT NULL,
  `MBA Dept/Com` varchar(255) DEFAULT NULL,
  `Delivery Country` varchar(255) DEFAULT NULL,
  `Delivery Location` varchar(255) DEFAULT NULL,
  `Shipper` varchar(255) DEFAULT NULL,
  `Consignee` varchar(255) DEFAULT NULL,
  `Cargo Description` varchar(255) DEFAULT NULL,
  `Quantity` varchar(255) DEFAULT NULL,
  `Vessel` varchar(255) DEFAULT NULL,
  `Shipping Line` varchar(255) DEFAULT NULL,
  `Vessel ETA` datetime DEFAULT NULL,
  `Manifest Advised` datetime DEFAULT NULL,
  `Vessel Arrival` datetime DEFAULT NULL,
  `Vessel Berth` datetime DEFAULT NULL,
  `Cargo Transfered` datetime DEFAULT NULL,
  `Cargo Type` varchar(255) DEFAULT NULL,
  `CNTR/ Identification Number` varchar(255) DEFAULT NULL,
  `Size/Type` varchar(255) DEFAULT NULL,
  `Qty Loaded` varchar(255) DEFAULT NULL,
  `Wgt Loaded` varchar(255) DEFAULT NULL,
  `Teu` varchar(255) DEFAULT NULL,
  `File Validation` varchar(255) DEFAULT NULL,
  `Documents Ok` varchar(255) DEFAULT NULL,
  `Cargo Discharged` varchar(255) DEFAULT NULL,
  `OBL Received` varchar(255) DEFAULT NULL,
  `Entry Lodged` varchar(255) DEFAULT NULL,
  `Entry Passed` varchar(255) DEFAULT NULL,
  `Customs Release Order` varchar(255) DEFAULT NULL,
  `Ready for Dispatch` varchar(255) DEFAULT NULL,
  `Transport Mode` varchar(255) DEFAULT NULL,
  `Departure` datetime DEFAULT NULL,
  `Truck/Wagon` varchar(255) DEFAULT NULL,
  `Arrival Malaba` datetime DEFAULT NULL,
  `Departure Malaba` datetime DEFAULT NULL,
  `Arrival Malaba Ug` datetime DEFAULT NULL,
  `Departure Malaba UG` datetime DEFAULT NULL,
  `Arrival` datetime DEFAULT NULL,
  `TC Interchange` varchar(255) DEFAULT NULL,
  `Last Comment` varchar(255) DEFAULT NULL,
  `Cargo Manifest advised - SCT entry` varchar(255) DEFAULT NULL,
  `SCT entry - Cargo ready for dispatch` varchar(255) DEFAULT NULL,
  `Cargo ready for dispatch - Departure` varchar(255) DEFAULT NULL,
  `Departure - Destination` varchar(255) DEFAULT NULL,
  `Cargo Discharged - Cargo ready for dispatch` varchar(255) DEFAULT NULL,
  `Cargo ready for dispatch - Destination` varchar(255) DEFAULT NULL,
  `Cargo Discharged - Destination` varchar(255) DEFAULT NULL,
  `Border in (arrival malaba Ky side - departure)` varchar(255) DEFAULT NULL,
  `Border out (arrival Malaba Ug side - departure)` varchar(255) DEFAULT NULL,
  `Documentation vs Cargo Discharged` varchar(255) DEFAULT NULL,
  `Storage KPI` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_02_25_034148_create_permission_tables', 1),
(6, '2020_05_25_021239_create_announcements_table', 1),
(7, '2020_05_29_020244_create_password_histories_table', 1),
(8, '2020_07_06_215139_create_activity_log_table', 1),
(9, '2021_04_05_153840_create_two_factor_authentications_table', 1),
(10, '2022_07_03_100546_create_uploaded_transactions_table', 1),
(11, '2022_07_18_185851_create_agents_table', 1),
(12, '2022_07_18_185925_create_carriers_table', 1),
(13, '2022_07_18_190223_create_clients_table', 1),
(14, '2022_07_18_190304_create_shippers_table', 1),
(15, '2022_07_18_190342_create_vehicles_table', 1),
(16, '2022_07_18_190442_create_destinations_table', 1),
(17, '2022_07_18_190529_create_rates_table', 1),
(18, '2022_07_21_190116_create_cargo_types_table', 1),
(19, '2022_07_21_190151_create_consignees_table', 1),
(20, '2022_07_21_194203_create_transactions_table', 1),
(21, '2022_08_04_200837_create_transaction_invoices_table', 1),
(22, '2022_08_04_203842_add_status_to_transactions_table', 1),
(23, '2022_08_09_145050_add_delete_at_to_consignee_table', 1),
(24, '2022_08_16_051546_make_field_nullable', 1),
(25, '2022_09_01_002808_create_approval_levels_table', 1),
(26, '2022_09_01_013235_create_departments_table', 1),
(27, '2022_09_02_020631_create_rcn_approval_logs_table', 1),
(28, '2022_09_04_185735_add_user_id_to_transaction_invoices_table', 1),
(29, '2022_09_09_082043_create_recovery_invoices_table', 1),
(30, '2022_09_20_022425_add_in_cols_to_transaction_invoice', 1),
(31, '2022_09_21_025118_add_invoice_id_to_transaction', 1),
(32, '2022_09_22_005220_add_cols_to_transaction', 1),
(33, '2022_09_22_005704_make_invoice_id_nullable', 1),
(34, '2022_09_22_020545_alter_recovery_invoice_new_cols', 1),
(35, '2022_09_24_094226_add_user_id_to_recovery_invoices_table', 1),
(36, '2022_09_24_124516_update_approval_logs', 1),
(37, '2022_09_25_094927_add_status_to_recovery_invoice', 1),
(38, '2022_09_27_002308_add_type_to_approval_logs_table', 1),
(39, '2022_09_29_185831_add_soft_delete_to_departments', 1),
(40, '2022_10_05_065017_add_column_to_departments_table', 1),
(41, '2022_10_06_092720_add_department_code_to_transactions_table', 1),
(42, '2022_10_06_193412_add_credit_note_to_transaction_invoices_table', 1),
(43, '2022_10_06_195858_add_level_to_transaction_invoices_table', 1),
(44, '2022_10_06_204013_add_level_to_recovery_invoices_table', 1),
(45, '2022_10_11_192905_add_transporter_name_to_carriers_table', 1),
(46, '2022_10_13_084554_add_purchase_order_number_to_transactions_table', 1),
(47, '2022_10_16_090301_add_recalled_to_recovery_invoices_table', 1),
(48, '2022_10_16_124133_add_edit_fields_to_recovery_invoices_table', 1),
(49, '2022_10_31_193420_create_transfer_logs_table', 1),
(50, '2022_11_03_092749_create_reason_codes_table', 1),
(51, '2022_11_03_100259_add_reason_code_to_approval_logs_table', 1),
(52, '2022_11_11_003145_add_status_to_transaction_invoices_table', 1),
(53, '2022_11_16_130450_add_pod_column_to_recovery_invoices_table', 1),
(54, '2023_01_05_155639_add_column_to_recovery_invoices_table', 1),
(55, '2023_02_06_082513_add_column_to_approval_levels_table', 1),
(56, '2023_02_06_083444_add_column_to_transactions_table', 1),
(57, '2023_06_07_133705_create_trucks_table', 1),
(58, '2023_06_07_150659_create_consignee_table', 1),
(59, '2023_06_07_163335_create_entry_table', 1),
(60, '2023_06_08_041844_create_billing_table', 1),
(61, '2023_06_08_091732_add_deleted_at_to_trucks', 1),
(62, '2023_06_08_094733_add_deleted_at_to_consignee', 1),
(63, '2023_06_08_095122_add_deleted_at_to_billing', 1),
(64, '2023_06_08_095237_add_deleted_at_to_entry', 1),
(65, '2023_06_08_155434_create_departmental_table', 1),
(66, '2023_06_08_155742_add_deleted_at_to_departmental', 1),
(67, '2023_06_08_170337_create_haulers_table', 1),
(68, '2023_06_08_170556_add_deleted_at_to_haulers', 1),
(69, '2023_06_08_200155_create_pov_table', 1),
(70, '2023_06_08_200512_add_deleted_at_to_pov', 1),
(71, '2023_06_08_223754_create_exit_table', 1),
(72, '2023_06_08_224006_add_deleted_at_to_exit', 1),
(73, '2023_06_09_085217_create_group_table', 1),
(74, '2023_06_09_085354_add_deleted_at_to_group', 1),
(75, '2023_06_09_093421_create_user_table', 1),
(76, '2023_06_12_112204_add_deleted_at_to_users_table', 2),
(77, '2023_06_12_113036_add_deleted_at_column_to_users', 3),
(78, '2023_06_12_113322_add_deleted_at_to_users', 4),
(79, '2023_05_26_100856_create_import_table', 5),
(80, '2014_10_12_000000_create_new_users_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Domains\\Auth\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_histories`
--

CREATE TABLE `password_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_histories`
--

INSERT INTO `password_histories` (`id`, `model_type`, `model_id`, `password`, `created_at`, `updated_at`) VALUES
(1, 'App\\Domains\\Auth\\Models\\User', 1, '$2y$10$CVovFEKkyj96U2ULfIRGo.RxyKH2gPpGvMueG1x4tEMnyTdsjx3ou', '2023-06-12 05:37:23', '2023-06-12 05:37:23'),
(2, 'App\\Domains\\Auth\\Models\\User', 2, '$2y$10$6BnYRD6o38d88/TKqTsZK.i8BrrgdiQBl4Q7jUhsvHsD/UgH6ndze', '2023-06-30 08:09:08', '2023-06-30 08:09:08'),
(3, 'App\\Domains\\Auth\\Models\\User', 69, '$2y$10$ClGnyroWzK5Bxnfj/qN/T.l2LLG6uIPa9g7L0nQgM3jrZ9jGOlbje', '2023-06-30 15:32:27', '2023-06-30 15:32:27');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `type`, `guard_name`, `name`, `description`, `parent_id`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', 'admin.access.dashboard', 'Access and view dashboard', NULL, 1, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(2, 'admin', 'web', 'admin.access.user', 'All User Permissions', NULL, 1, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(3, 'admin', 'web', 'admin.access.user.list', 'View Users', 2, 1, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(4, 'admin', 'web', 'admin.access.user.deactivate', 'Deactivate Users', 2, 2, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(5, 'admin', 'web', 'admin.access.user.reactivate', 'Reactivate Users', 2, 3, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(6, 'admin', 'web', 'admin.access.user.clear-session', 'Clear User Sessions', 2, 4, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(7, 'admin', 'web', 'admin.access.user.impersonate', 'Impersonate Users', 2, 5, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(8, 'admin', 'web', 'admin.access.user.change-password', 'Change User Passwords', 2, 6, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(9, 'admin', 'web', 'admin.access.rcns', 'Access and view all rcns', NULL, 1, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(10, 'admin', 'web', 'admin.access.user', 'All User Permissions', 9, 1, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(11, 'admin', 'web', 'admin.access.rcns.list', 'View all rcns', 9, 1, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(12, 'admin', 'web', 'admin.access.rcns.create', 'Create manual rcn', 9, 2, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(13, 'admin', 'web', 'admin.access.rcns.attach_invoice', 'Attach invoice to rcn', 9, 3, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(14, 'admin', 'web', 'admin.access.rcns.upload_rcn', 'Upload rcns', 9, 4, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(15, 'admin', 'web', 'admin.access.rcns.approve_rcn', 'Approve rcn', 9, 5, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(16, 'admin', 'web', 'admin.access.rcns.add_recovery_invoice', 'Attach recovery invoice', 9, 5, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(17, 'admin', 'web', 'admin.access.rcns.invoices', 'View invoices', 9, 5, '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(18, 'admin', 'web', 'admin.access.rcns.recovery_invoices', 'View recovery invoices', 9, 5, '2023-06-12 05:37:24', '2023-06-12 05:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pov`
--

CREATE TABLE `pov` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pov`
--

INSERT INTO `pov` (`id`, `pname`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'rrr', '2023-06-20 06:58:24', '2023-06-20 06:58:27', '2023-06-20 06:58:27'),
(2, 'rrr', '2023-06-30 07:05:27', '2023-06-30 07:05:31', '2023-06-30 07:05:31');

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reason_codes`
--

CREATE TABLE `reason_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recovery_invoices`
--

CREATE TABLE `recovery_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_amount` double NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` tinyint(4) DEFAULT 1,
  `recalled_id` bigint(20) DEFAULT NULL,
  `edit_fields` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pod_available` smallint(6) NOT NULL DEFAULT 0,
  `ein_available` smallint(6) NOT NULL DEFAULT 0,
  `doc_printed` smallint(6) DEFAULT 0,
  `invoiced_date` date DEFAULT NULL,
  `final_user` int(10) UNSIGNED DEFAULT NULL,
  `final_comments` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `type`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', 'web', '2023-06-12 05:37:23', '2023-06-12 05:37:23'),
(3, 'admin', 'HBU', 'web', '2023-06-12 05:37:23', '2023-06-12 05:37:23'),
(4, 'admin', 'HOD', 'web', '2023-06-12 05:37:23', '2023-06-12 05:37:23'),
(5, 'admin', 'Transport Manager', 'web', '2023-06-12 05:37:23', '2023-06-12 05:37:23'),
(6, 'admin', 'OPs Control', 'web', '2023-06-12 05:37:24', '2023-06-12 05:37:24'),
(7, 'admin', 'COM', 'web', '2023-06-12 05:37:24', '2023-06-12 05:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shippers`
--

CREATE TABLE `shippers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `po_box` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `agent_departure` int(10) UNSIGNED NOT NULL,
  `agent_destination` int(10) UNSIGNED NOT NULL,
  `carrier` int(10) UNSIGNED NOT NULL,
  `shipper` int(10) UNSIGNED NOT NULL,
  `consignee` int(10) UNSIGNED NOT NULL,
  `vehicle` int(10) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `tracking_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cargo_type` int(10) UNSIGNED NOT NULL,
  `cargo_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `weight` int(10) UNSIGNED NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rcn_no` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_order_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customs_no` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `amount` double DEFAULT NULL,
  `source_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `department_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `department_com` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trailer_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `container_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agreed_rate` double DEFAULT NULL,
  `recovery_invoice_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_invoices`
--

CREATE TABLE `transaction_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_amount` double NOT NULL,
  `delivery_note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit_note` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_note_amount` int(11) DEFAULT NULL,
  `invoice_date` date NOT NULL,
  `dnote_date` date DEFAULT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `tracking_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_date` date DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `file_number` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_logs`
--

CREATE TABLE `transfer_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `from_user_id` int(10) UNSIGNED NOT NULL,
  `to_user_id` int(10) UNSIGNED NOT NULL,
  `from_department_code` int(10) UNSIGNED NOT NULL,
  `to_department_code` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','accepted','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `comments` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trucks`
--

CREATE TABLE `trucks` (
  `id` int(11) NOT NULL,
  `treg` varchar(50) DEFAULT NULL,
  `tr_hauler` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hreg` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `two_factor_authentications`
--

CREATE TABLE `two_factor_authentications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `authenticatable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticatable_id` bigint(20) UNSIGNED NOT NULL,
  `shared_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled_at` timestamp NULL DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `digits` tinyint(3) UNSIGNED NOT NULL DEFAULT 6,
  `seconds` tinyint(3) UNSIGNED NOT NULL DEFAULT 30,
  `window` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `algorithm` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sha1',
  `recovery_codes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`recovery_codes`)),
  `recovery_codes_generated_at` timestamp NULL DEFAULT NULL,
  `safe_devices` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`safe_devices`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_transactions`
--

CREATE TABLE `uploaded_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `com` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchasing_order_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rcn_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_on` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `po_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tro_status` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_author` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tro_comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unique_ref_of_loopssc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority_on` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tro_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_file_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_n` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_export` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `planned_quantity_20` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `planned_quantity_40` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `planned_quantity_bulk_and_parcel` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `planned_weight_kgs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goods_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goods_description_tro` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parcel_seal_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parcel_bulk_container_no` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `real_customer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consignee_shipper` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loading_country` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loading_place` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unloading_country` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unloading_place` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transporter_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transporter_nationality` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_equipment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vector` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trailer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_contact` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimated_rate` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advance` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advance_amount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_routing` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `escort_on` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dangerous_on` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dangerous_goods` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controlled_temp_on` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temperature` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `po_instructions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rcn_instructions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advance_reference_actual` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_advance_actual` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_reference_actual` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_invoice_actual` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shunting_ended_on` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_of_shunting_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anomaly_quantity` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anomaly_weight_kgs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gtp` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_gtp` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gtp_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `corridor_departure` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `corridor_destination` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ata_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ready_for_dispatch_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tro_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tro_author` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loading_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loading_author` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departure_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departure_author` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrival_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrival_author` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unloading_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unloading_author` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transit_time_departure_arrival` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transit_time_loading_unloading` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interchange_shipping_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `of_completed_interchange_shipping` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `printing_on` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `printing_date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `printing_user` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `stf_StaffID` int(11) DEFAULT NULL,
  `stf_uname` varchar(255) DEFAULT NULL,
  `stf_Names` varchar(255) DEFAULT NULL,
  `stf_pwd` varchar(255) DEFAULT NULL,
  `stf_email` varchar(255) DEFAULT NULL,
  `stf_Description` varchar(255) DEFAULT NULL,
  `stf_ProfilePic` varchar(255) DEFAULT NULL,
  `stf_theme` varchar(255) DEFAULT NULL,
  `stf_isReset` int(11) DEFAULT NULL,
  `stf_inactive` int(11) DEFAULT NULL,
  `stf_isAdmin` int(11) DEFAULT NULL,
  `stf_dept` varchar(255) DEFAULT NULL,
  `stf_Branch` varchar(255) DEFAULT NULL,
  `stf_Type` varchar(255) DEFAULT NULL,
  `stf_TabReg` varchar(255) DEFAULT NULL,
  `stf_TabCP2` varchar(255) DEFAULT NULL,
  `stf_cdate` datetime DEFAULT NULL,
  `stf_udate` datetime DEFAULT NULL,
  `stf_uby` varchar(255) DEFAULT NULL,
  `stf_cby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`stf_StaffID`, `stf_uname`, `stf_Names`, `stf_pwd`, `stf_email`, `stf_Description`, `stf_ProfilePic`, `stf_theme`, `stf_isReset`, `stf_inactive`, `stf_isAdmin`, `stf_dept`, `stf_Branch`, `stf_Type`, `stf_TabReg`, `stf_TabCP2`, `stf_cdate`, `stf_udate`, `stf_uby`, `stf_cby`) VALUES
(1, 'Richard', 'Richard Ndonye', '2iUUjsfoa2I7nu7YQoVXOBTlzl4/KWGgTTZxKi0taBEMIJY+bA5JR5ISp7kFFCrRC57iT+Jowx4ON9yuF7UjfMhwgZXHM7eMDhzm/FvwTd3FL2+9wwRnA6TGwcTpx4+x', 'ndonyengungu@gmail.com', 'Software Developer', 'Richard.jpg', '4', 0, 0, 1, '1', '1', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '0'),
(2, 'Martin', 'Martin Kimeu', 'Bu92ap4I+JtUxncOwkyRtWfmK8SI3nroBo1+lUI7xzJKK3XWDXIAySZmBfU/k7DfL9zQiNAe0bTgREOSbnbQ1MlENXmYPeYxzAZ1KxQxVvGXD/Rl2fQTsnDnogylrRNN', 'mkimeu@gmail.com', 'Ieng', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '1'),
(3, 'admin', 'Administrator', '/+C6M2tbPdUkcnQvztplHiEatKY4gRXdFD1JQzk2j76D4li0AZ95HhWhX9nT8VAsxepjD+veGypMu+Fov6AJdhdB4veD+GkqgQpOsdBqGAONKjc3ctC/HIufNG9m2Yox', 'mkimeu@outsourced.co.ke', 'admin', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '1'),
(1003, 'Gibson', 'Gibson Mkala', 'qLHnR9p70g7kSe9M1n0d0IVBsPuFGKqqU+yG40QS7UrIcGe2OB4G20qgkD27yeLKvWwstTpTg/1wNm0DtB2F6ym5+liNTfj9Pwq7A5D0dYyo++yy00sJfU1z2JXc0eCx', 'Gibson.Mkala@bollore.com', 'Transport Cordinator', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(1004, 'Njue', 'Njue Mwaniki', 'quySiGHx+HQJkyphtvyKkw7bNRlBEMOgA9UfQsv7hj9eVyPKv18oBwsRz5vWZA6elMT5PaEMwUb0/ZMeAwjKQ3d4VhtKaavcCaf5KhpS8F9CNAImTGEQlAy8++VGX0ef', 'njue.mwaniki@bollore.com', 'Transport Cordinator', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(1005, 'Alex', 'Alex Peter', '41CFWZ/V6uzwC+20JuJIAUVDsp8bXkAOIEPofDn1baCnKai399bSjluvguz6O4flR0kUr9zNb4GTkQxLOySAD1ToKcZ0A4OPUIlfNucu+F52ANucvIqLiKdqsd14fxrz', 'ext.alex.peter@bollore.com', 'Transport Cordinator', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(1006, 'Kigen', 'Gilbert. Kigen', '/ccypooQjcI8ZYxcmb/KatDmoOmqHxKQJfAPY2RqylUoFoNF92Ikrd5qIowso5W9O49avNh9nZTMCaoC7T7Vqz9JdBlkUgSkSxihw9k29h5IQT18F49cM6cX1LYTqmIO', 'ext.gilbert.kigen@bollore.com', 'Transport Cordinator', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '2'),
(1007, 'Mutisya', 'Boniface Mutisya', 'SzIRu71VofjJXlUq3fgup29Ko9UskTFePl7HOMEqAUP+YacSbOyQfc3WVmWq9qY+dkOTMClR7KVQ7WxrY6Hw0XYkM4ReJ5ufI7S12d2A+6TWhhgYo8jFqrv2RsuTFnxD', 'boniface.mutisya@bollore.com', 'Transport Cordinator', 'Male.JPG', '2', 1, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(1008, 'Cyrus', 'Cyrus Maundu', 'VdRWw4ymbA8wb+9Ki41c3iJJpVpoMfxZblrpz7iGs7Zjf8h/Hc9JEEbtEBm+FH3O2NN9M/6yNtBYyHMMWI/CWXCrcAk5wwDFhYcDShkK6bN8Xmz9bt6UaI99zrc5CjsW', 'mkimeu@gmail.com', 'Port Clerk', 'Male.JPG', '2', 0, 0, 0, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(1009, 'Robert', 'Robert Karima', 'VESucfOcfx3aSt4JbdNw/yhw2X+XJf2gzJ8UtHWaBntEEYsTdTRPF//sQdrXlwri10d7f1WpC+aoWubPfDMhULtmuqhyRp2xM77BCDmZuyjqBdEtuYBrf5OZBAvxmVd5', 'mkimeu@gmail.com', 'Port Clerk', 'Male.JPG', '2', 0, 0, 0, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(1010, 'Laban', 'Laban Nganga', 'E/Ok/X0/d+F714ERmdaeEZu5W77fTvO9AParLDBrE1PrEO98HHfzm8EpKywqnbAzvUDn4v7D6kP2NIwKHCmsVOX+sxxLkuPbDoJaruRxP2/omgTMKDio6U0RaMlzMInm', 'mkimeu@gmail.com', 'Port Clerk', 'Male.JPG', '2', 0, 0, 0, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(1011, 'shaban', 'shaban Khamisi', '+fsHvX1Qp90AyXWJLWtL0p0Hxt7Q+YiA3vg1izL12awlNMTg64IZYe/7g+o5vFp8xgP5j1EWGEMIUHx9j2fa6942eIaFMF+Ve0huQit5TjzHpt2F4axhfs4mTTLM22sh', 'mkimeu@gmail.com', 'Port Clerk', 'Male.JPG', '2', 0, 0, 0, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(1012, 'Philip', 'philip.mutuku@bollore.com', 'PZ5unck224ahGKfyf7ieLAsIf7HbSrypZMeRnVMhltsSQDvXLfloNFkRl4+9lrHYLQI3CA3W7shCrHmqKAf/fcC/P0iiBoaZ2PohH6x09sL2MPux+C4nm4vurIQObKSZ', 'mkimeu@gmail.com', 'Port Clerk', 'Male.JPG', '2', 0, 0, 0, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(1013, 'cornelius', 'Cornelius Mutonyi', 'iXyZoo+uJEybjIoNF3eXDTqy5LS/zEYzEeVIlR7npfnTG50eyUjgGdbcNPNepLwGG6+KAMqXdAnNcIr5HE5dwQyFmSteY3YwZEzMhEacrXjilwj+wVngPb9lXeK+MXlM', 'mkimeu@gmail.com', 'Port Clerk', 'Male.JPG', '2', 0, 0, 0, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(1014, 'Kennedy', 'Kennedy Wesonga', 'pFkzT0hqNCuZYmQGGZ6vYvuGueF2tTloxYp++tI+o+Wa6tJwaAjC5O1eQbpbq7Zpb6WFHDwI0WzSWi39pOjSdw2jaC3PXWJQAU/icJql9dUEavJdim4RBq/AxwDMymvY', 'mkimeu@gmail.com', 'Port Clerk', 'Male.JPG', '2', 0, 0, 0, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(2008, 'RIMAL', 'Rimal Patel', 'gfFMqHvQV+s1c3hTt8r7C/H2OF+Xh3U3N0Qu3ja1sVYKekeyXRlxujs3lnh4sRlq/QSiWgqgf0GMHuWv0E6A2YYDqOz0HZU8dlQxam3d8Fsf1k5MlRVzj75qHvSqlK3g', 'rimal.patel@bollore.com', 'Project & Workshop Manager', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '2'),
(2009, 'Chege', 'Alex Chege', 'cA9IJ6yberpIeNmrzDGzuP1Rbv7RE9mAnMOIpsxGXq5rEaHPTm2qp5Ee2C5v/4HcjK5B+AHu2rR5BfNCZlpvnsVhZE5BM4HYj1/tIR7CCm84U7uvD+5A/A5LxZ1nHVA5', 'Chege.ALEX@bollore.com', 'Port & Borders Operations Manager', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '2'),
(2010, 'K12949', 'Liza Mwendwa', 'YUVgQ5RI5TeYCtTJN4nPnMu+q1GF8tikC9iDupgHk52NtkiH9xEfUIbaFAbReKnxr7n1CA2IKjHEtCyTZ33WpdHi5xU8mBrtp49YBxyHclHTgcQBREEIuZqWv4hEwBM1', 'liza.mwendwa@bollore.com', 'COM 10', 'Male.JPG', '2', 0, 0, 1, '2', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '2'),
(2011, 'norman', 'Norman Wanjohi', 'BZdrXBdChHgdoMp6q65+vGALW6mQpOaTBB2bYF3Cr7obdMNircGocS6JYfUKh9PYUMiS08RWayzjp8keMWxkLQf5h3BylywEUVRvtzFPZ9PaHItV1EEQW6MoDGbTJNwq', 'norman.wanjohi@bollore.com', 'Client Operator', 'Male.JPG', '2', 0, 0, 1, '2', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '2'),
(2012, 'ALI SALIM', 'ALI SALIM', '1OM201uXmcO5498Hpp8tq0+dHeoQuBtVImB3KjpZpLwm7EYSXkcO0vp9c1wyK1SZmayLpgyqpkfy2CvSnxZ/0kkGahx2Htz4y2N1RJrlapqjUGEoZSQsUCkzBXZSJhA0', 'ali.salim@bollore.com', 'CLIENT OPERATOR', 'Male.JPG', '2', 0, 0, 1, '2', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '2'),
(2013, 'yhx286', 'Caleb Paul', 'bG2lfDtvD6rC5UBaAN+8M06Khho7GQJQGCp9PhTNKWa9ySP3VIn2O7WcHNmrbeJOqWIv5EBbiDBW3G+OHh8uMQy7cTU75Y2k0+GX2Jy0bBBQQNle3/0zISJjNOYxBCzY', 'ext.caleb.kingoo@bollore.com', 'Client Operator - COM11', 'Male.JPG', '2', 0, 0, 1, '3', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2013', '2'),
(2014, 'isc662', 'RONALD LIJODI', 'I2pwwI3m2NdxQNgrH+WOA8UtMFoCwSJB1s6bUXj8HqiDG4T7XpEvA3VTT7G13ba86JY45OfOs0Rald6j0SP239+VOs/YS15RVsy5y+Z9hkXW98bKe5hYIlq8C0JM6aRh', 'ronald.lijodi@bollore.com', 'CLIENT OPERATOR - COM 11', 'Male.JPG', '2', 0, 0, 1, '3', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '2'),
(2015, 'uwz851', 'emmanuel mbaji ngome', 'cwjmt++jJOWPHIleKepuswuALpHAekJcb3vUMZz3w+nPccQATwsqNpJZxr8rsKoziBoUnwaQ0NJynKTZqaKf4Ge9RBKJn6uG6QfZQpWDfNOLwEy90+dgbAjrSG/aBxZ4', 'emmanuel.ngome@bollore.com', 'Declaration officer -COM12', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '2'),
(2016, 'REX059', 'GILEAD MUTISO', 'LlJH7kNUVRxoeXmssTsUrLb+aprcl0M1de4T/uSyPy1ltBoF2xcOggCmxp/pRVes51/13OOJRMYCGd+Qz0OElAkPTUwLKiWnVXTXEcgAR1eN5S/auhkt7zOfmn6BaO6g', 'Gilead.mutiso@bollore.com', 'CLIENT OPERATIONS MANAGER', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2017', '2'),
(2017, 'George', 'George Gikandi', 'Bh2B50NjwFXiWyQgzUsywbV6hNIaTa0NwrXm4e63pxr60ASeZzz5XsrPVYNmYWNELv+V1CGK0EnqZNtTLWV77wWp7tou+6rWh/fAmwIMKkQPOtL+7XcdnxvNUGJMGCa0', 'george.gikandi@bollore.com', 'Shipping Clerk', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(2018, 'ASENA', 'JANET ASENA', 'QbEz4dd1OcLVvsMgu117JsvKay+hra5StmwXnRFzScaCenKkoYCgjJshWxwBeohcs0b8s5FzYmnuV2CkfdgQV5cagKaz/21whTVgSGpgS8AmWVCACqDREorSS5yoekBZ', 'janet.asena@bollore.com', 'CLERK', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '2'),
(2019, 'JUMA', 'BONFACE WAFULA', 'KRm4FJTwbWOt87cJCVpGL0WW2PgqlDZ+35Vn3471R0lP2lGzpUeV4Yv3YYONYjIxzOE5Bwj5rFuA/5Ad6IWHUMlq37V1u1mh6FR6fDvddAl4z+3YnQLOCOLR7qWxWgjY', 'ext.bonface.juma@bollore.com', 'INVOICING AGENT/OPERATOR', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(2020, 'K11505', 'BALDWIN MVUKO', 'F2zkEcJwFc3m4JsXsJaVm5e51qZgFlgwKJHT6h62jarPWKBPoE0djAogblBQxi7h60qte6QV7GWMLPRr4Xy+LXTttYGZDMxDVfDIOvw2BBCg/A8DIJrB4m1AWvlF13lW', 'baldwin.mvuko@bollore.com', 'DECLARANT', 'Male.JPG', '2', 0, 0, 1, '2', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '2010'),
(2021, 'mokaya', 'Robert Mokaya', '1u3SF6R5XsMJjCGyGkdvfzYvdYT8mgNZ8hAqKf4gWpLuyl0raWVJxk1xGJFbohAWP1qtWuLazEvz1QMI3Vv031n1UIWltIxrpjGtaygDsXMiT8RO8OgKnphQ8t3+x712', 'robert.mokaya@bollore.com', 'Shipping Clerk', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2017'),
(2022, 'NCB942', 'GEORGE ORUKO', '5vhs+eRCWZg04oyiBNlCSlMvyASe+wi28GUy89yuukFDQRvi0CndlS9xZ84j8OJPpmTwKV3fiEPjpeCIvmKrGxzYS9A+LqBaCO6VM13s1KkEldLIzzUI+4clZAQDXVyR', 'george.oruko@bollore.com', 'CLIENT OPERATION', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2016'),
(2023, 'jsh356', 'HALIMA TENDWA', 'gNuN1QHXWoS9w2BsKsdhdkRwfV4joPoduS7n4PvoR4dXhBXdLyJZASxQXL0v4pTuo3R2BhDYAcPx8i4vE4zhQ5h65FFtOihti/rvpjC1I2CdH2F4IxvDByejBRH8pwqR', 'halima.tendwa@bollore.com', 'COM', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2016'),
(2024, 'KTMP062', 'ANDREW MZAME', 'tyL9npBFeIf3XqZLmGngpNzQj8nBSFLsVy+tPc9r6JtkSZ98BXeeDcnK4L8LcphN1zGHdA6LlhleUMBdZGjeBidDfbqLOCsgJora5b6dsa63HmrmQB92lu9+/R/A9e6t', 'Andrew.Mzame@bollore.com', 'CLIENT OPERATOR/INVOICER', 'Male.JPG', '4', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2016'),
(2025, 'Support', 'MBA ICT', 'xI7B+y7FS9Qit3+DBSS4WvUUz1f8BHvyJay+Rv13ey2LmaHCDRWXob007grJmeS9hQyyKhyp99DwOfsoupm2SVTN/i0xSoPWhJ41E6nWBynNXg72kv6NOL+ZBr0LPq6S', 'eric.shigoli@bollore.com', 'ICT', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(2026, 'Alexandre', 'alexandre vincent', 'KxadDS4fc8YUWkzHlKYejB0nLDGh9JIvgjB1Q1DCsABHjkpuq5FgDZ/KHiNTvqV9afD2Dz/Ek6LQHIlAl9OAIWUYjXENPls/y3uUgiSWR5bdhKuVHgeiWGHF45FTww5v', 'alexandre.vincent@bollore.com', 'GM', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '2'),
(2027, 'NIHAD', 'Nihad Ahmed', 'b7BDSUoodb90L9POAs2/jT0GYxM49Uz+t9LfVj/S5vctBq5/sBOGyeGNperoEm8Vb6RYTSFdNE91QPXOvVyykNG8h9LAijhU4l/7qSoY4L4bapTTvzWgOvwIAyNoFXPT', 'nihad.ahmed@bollore.com', 'LINK / DENDI SUPERUSER (MBA) KENYA', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2010'),
(2028, 'Zubeida', 'Zubeida ABDUL', 'yTRjnWvz8/nve25CtxIUpGy/beP4gjWj0j8ixzUvbu0MG547EznLcMKcvJXTzK3Pur+MhNY33Zwn4Ba545fgy/6Kh/M2L1DPua5cMbsJLrBSUMFxGj1AP2kVfoFNvQk7', 'Zubeida.ABDUL@bollore.com', 'COMM', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(2029, 'Faustine', 'FAUSTINE MUEKE', '2fuyiTQTbS/9OvocW95kLTJbTJLzHDGR4KXePbMk7TGK9LaGPKiSRQqUEObe7f9r0nC4IZMDUFRJgck5eMvZtZi3KSwMM6gOn0tfAhUJUOs7oQ+PNOvWLW5q8Rk9bl2n', 'faustine.mueke@bollore.com', 'PORT CLERK', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '2010'),
(2030, 'DORINE', 'DORINE WAWUDA', 'WJzp5VtS1mjZ8vclc2lrfQ2s1To7cWI0DUdqBRPhu2Q57CbNN/8OooAWICkww2hS5QjkFJejz+8T1RZK4Zlwymg7kB94ERzCH7NjO678kAsCsh/DQTUp7GHMF3a1/re8', 'mkimeu@gmail.com', 'OPERATOR', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1', '2010'),
(2031, 'ELIUD', 'ELIUD MUSHIVOJI', '8xCVDVdQ8dStYN6hk4ITSrjGH1LC+F6jOYrWtD9nEK4rOz0BRNyDavS28nJWRawcYFBFlUklRQs9xX8c6M4/pHeocQqib+rG2sMbQboAbyJLqd9q8MROa4nlQnzYUDOD', 'eliud.mushivoji@bollore.com', 'PORT CLERK', 'Male.JPG', '2', 0, 0, 1, '6', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2', '2010'),
(2032, 'Kileta', 'Nathaniel Mwadime', 'mYyXyoxbSQkpE0xi0Ap223zUj9EQRCjiY3u74Lg1RpJUq2E05HwoApXQXVCcplWdn+K0wk8uSAZsr5Ax7x6ShDHAp5kfLS8JQSwXU7gVQM+Z9iEYMt2GFuaqZMvYaN3N', 'mwadime.kileta@bollore.com', 'Documentation Transport', 'Male.JPG', '2', 0, 0, 1, '4', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1004', '1004'),
(2033, 'ERNEST', 'ERNEST KIPTOO', 'vl2JEHhD731k3BnoqEW+rnbBjWHRtzBZ+j5cu6yyx/bqTENinoTWlj2T3muRPgRA0tFQsWuVoYRHSRRUR3HKdLiYpABotiUIGjTKYZOembiybJgd5l2L9NNkHyYOaM1G', 'Ernest.kiptoo@bollore.com', 'TRANSPORT INCHARGE MOMBASA', 'Male.JPG', '2', 1, 0, 1, '4', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2010'),
(2034, 'Okumu', 'Jacqueline', 'i6RWLEvNOTD6fyBQi0rH4DXUS2Y5lIwUFZgnBjAb6Z7KCqkSS6eJhfgxyfiJLXIiBVmenRnWrUD1sVj9lUkirXaISUnRjoW88ZE5ZQdMUUQMCJ/0Zlqgzd/otYi+qeZk', 'Jacqueline.OKUMU@bollore.com', 'Operations', 'Male.JPG', '2', 0, 0, 1, '6', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2034', '1'),
(2035, 'Kibor1', 'Marteu Kibor', 'QG/r8kwB7XmNYU6obXWRuiCojjDlxXcLOXBKpR64KmvLdBNOwmIqdOM/qFIAuWG7v/LGRm7uS1+UTz2r3z0w5aM0uhd2sb0WbDyg7QZ6YQ8wHxBMZc4I6m34clcsOJZ/', 'marteu.kibor@bollore.com', 'COM Manager', 'Male.JPG', '2', 1, 0, 1, '3', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(2036, 'Beatrice', 'Beatrice Masha', '0Z4gCeuonaXbGLjiGsvmJECf2gO9H5Q04EWTAZgCWekL9OTSIoUi4MXloPl+xz1AA0ExFO/wrZIcNzhA8NmZT9ynZbHZunj3A/kF0eRuxX75qiECjXqO9CvK+MPoqHAj', 'george.gikandi@bollore.com', 'Shipping Clerk', 'Male.JPG', '2', 0, 0, 1, '5', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2'),
(2037, 'ckimani', 'cyril Kimani', 'GgxS8HCEgckWWKdmE0qwja0QuXYHdVn7sIarIT4VI6/ONCWjMIEquNnV4pSHAMxwjolMF8ANsRSbq06IW8JU02ZOygFLuk5kglPZRYKnVziKq+mVM7Mm/CFM1BDkZN9U', 'Cyril.KIMANI@bollore.com', 'ICT', 'Male.JPG', '2', 0, 0, 1, '6', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '1'),
(2038, 'KTMP282', 'LYNNAH SANDE', 'bMUW/3GBlKh0bDYx6lU2O0CjOWalo552srkDJn1KhZ/m3FvieK93qRSCouyUerJj/S0BkfHpFJ2lu+b3d2vTI2tzcuJLCy8wY2hhsDlNbJre0IZ0sqcAlcnUlLiDNnrp', 'ext.lynnah.sande@bollore.com', 'OPERATOR', 'Male.JPG', '2', 0, 0, 1, '1', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1006', '2010'),
(2039, 'Bonface', 'Bonface Juma ', 'ySz3aBQ9LNJA8xmJym5OqCmqj7lluomaf2QRGIuYdVEKEgV3jooNGqDWonQgCMPSaaCxBGNVOytIA/a7kLxQtuwa6uGvPa9UByf3vqvtZVPn8nrzkqQ+napVHlm36nhz', 'ext.bonface.juma@bollore.com', 'client operator/Invoicing', 'Male.JPG', '2', 1, 0, 0, '6', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1006', '1006'),
(2040, 'WAIRIMU', 'Wairimu Kimani', 'wdXMXQqumOuXQ928U1KMIYKZeAa/mqPI09TxLYt3ERNxlsmUVJ4KtOLvy/YDE6OBgINAalIe/Fu/pCLW4PTGmagJzcx6XXCecXu5j6ion3UsIeOXHPQg/SJDnFeWf6Ty', 'wairimu.kimani@bollore.com', 'MIS', 'Male.JPG', '2', 1, 0, 1, '6', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '2');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_be_logged_out` tinyint(1) NOT NULL DEFAULT 0,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `type`, `name`, `email`, `email_verified_at`, `password`, `password_changed_at`, `active`, `timezone`, `last_login_at`, `last_login_ip`, `to_be_logged_out`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'Super Admin', 'admin@admin.com', '2023-06-08 09:05:16', '$2y$10$gFObspc3sxd19Uz9Ct72gufLwR5uGQt8OcTY43Eiw8.LQDzBMPmOa', NULL, 1, 'America/New_York', '2023-07-05 05:46:21', '127.0.0.1', 0, NULL, NULL, NULL, '2023-06-08 09:05:16', '2023-07-05 05:46:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `carrier_id` int(10) UNSIGNED NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trailer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`),
  ADD KEY `subject` (`subject_id`,`subject_type`),
  ADD KEY `causer` (`causer_id`,`causer_type`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `approval_levels`
--
ALTER TABLE `approval_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `approval_logs`
--
ALTER TABLE `approval_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cargo_types`
--
ALTER TABLE `cargo_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carriers`
--
ALTER TABLE `carriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consignee`
--
ALTER TABLE `consignee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consignees`
--
ALTER TABLE `consignees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departmental`
--
ALTER TABLE `departmental`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entry`
--
ALTER TABLE `entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exit`
--
ALTER TABLE `exit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `haulers`
--
ALTER TABLE `haulers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import`
--
ALTER TABLE `import`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_histories`
--
ALTER TABLE `password_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pov`
--
ALTER TABLE `pov`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reason_codes`
--
ALTER TABLE `reason_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recovery_invoices`
--
ALTER TABLE `recovery_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `recovery_invoices_invoice_number_unique` (`invoice_number`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `shippers`
--
ALTER TABLE `shippers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_invoices`
--
ALTER TABLE `transaction_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_logs`
--
ALTER TABLE `transfer_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trucks`
--
ALTER TABLE `trucks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `two_factor_authentications`
--
ALTER TABLE `two_factor_authentications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `2fa_auth_type_auth_id_index` (`authenticatable_type`,`authenticatable_id`);

--
-- Indexes for table `uploaded_transactions`
--
ALTER TABLE `uploaded_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `approval_levels`
--
ALTER TABLE `approval_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `approval_logs`
--
ALTER TABLE `approval_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cargo_types`
--
ALTER TABLE `cargo_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carriers`
--
ALTER TABLE `carriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consignee`
--
ALTER TABLE `consignee`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `consignees`
--
ALTER TABLE `consignees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departmental`
--
ALTER TABLE `departmental`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entry`
--
ALTER TABLE `entry`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exit`
--
ALTER TABLE `exit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `haulers`
--
ALTER TABLE `haulers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `import`
--
ALTER TABLE `import`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `password_histories`
--
ALTER TABLE `password_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pov`
--
ALTER TABLE `pov`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reason_codes`
--
ALTER TABLE `reason_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recovery_invoices`
--
ALTER TABLE `recovery_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shippers`
--
ALTER TABLE `shippers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_invoices`
--
ALTER TABLE `transaction_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_logs`
--
ALTER TABLE `transfer_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trucks`
--
ALTER TABLE `trucks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `two_factor_authentications`
--
ALTER TABLE `two_factor_authentications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uploaded_transactions`
--
ALTER TABLE `uploaded_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
