-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 27, 2024 at 05:53 PM
-- Server version: 10.5.25-MariaDB-cll-lve
-- PHP Version: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nikahos1_keycode`
--

-- --------------------------------------------------------

--
-- Table structure for table `automations`
--

CREATE TABLE `automations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `automations`
--

INSERT INTO `automations` (`id`, `created_at`, `updated_at`, `user_id`, `title`, `code`, `data`, `status`) VALUES
(1, '2024-09-27 14:34:42', '2024-09-27 14:34:42', 3, '1045 Strangle', '1045 Strangle', '{\n  \"strategy_name\": \"Options Buying Strategy\",\n  \"asset\": {\n    \"symbol\": \"NIFTY\",\n    \"type\": [\"CE\", \"PE\"],\n    \"expiry\": {\n      \"cycle\": \"current\",  \n      \"frequency\": \"weekly\"  \n    }\n  },\n  \"entry_trigger\": {\n    \"type\": \"time\",  \n    \"value\": \"2106\"  \n  },\n  \"contract_value\": {\n    \"type\": \"CLOSEST\",  \n    \"value\": 10  \n  },\n  \"lot_size\": 2,\n  \"risk_management\": {\n    \"stop_loss\": {\n      \"type\": \"percentage\",\n      \"value\": 500  \n    },\n    \"take_profit\": {\n      \"type\": \"percentage\",  \n      \"value\": 100  \n    }\n  },\n  \"exit_time\": \"15:30\",  \n  \"actions\": {\n    \"entry\": \"buy\",\n    \"exit\": \"sell\"\n  }\n}\n', 1),
(2, '2024-09-27 14:34:42', '2024-09-27 14:34:42', 3, '1420 Strangle', '1045 Strangle', '{\n  \"strategy_name\": \"Options Buying Strategy\",\n  \"asset\": {\n    \"symbol\": \"NIFTY\",\n    \"type\": [\"CE\", \"PE\"],\n    \"expiry\": {\n      \"cycle\": \"current\",  \n      \"frequency\": \"weekly\"  \n    }\n  },\n  \"entry_trigger\": {\n    \"type\": \"time\",  \n    \"value\": \"2106\"  \n  },\n  \"contract_value\": {\n    \"type\": \"CLOSEST\",  \n    \"value\": 5  \n  },\n  \"lot_size\": 5,\n  \"risk_management\": {\n    \"stop_loss\": {\n      \"type\": \"percentage\",\n      \"value\": 500  \n    },\n    \"take_profit\": {\n      \"type\": \"percentage\",  \n      \"value\": 100  \n    }\n  },\n  \"exit_time\": \"15:30\",  \n  \"actions\": {\n    \"entry\": \"buy\",\n    \"exit\": \"sell\"\n  }\n}\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
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
(5, '2022_10_30_063826_create_logs_table', 2),
(6, '2023_01_29_231658_create_automations_table', 3),
(7, '2023_01_31_003058_create_orders_table', 4),
(8, '2023_03_02_094535_create_stocks_table', 5),
(9, '2023_03_08_080909_create_top_movings_table', 6),
(10, '2023_03_19_001432_create_option_orders_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dt` date DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `automation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(55) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `symbol` varchar(55) DEFAULT NULL,
  `buy_price` double(8,2) DEFAULT NULL,
  `sell_price` double(8,2) DEFAULT NULL,
  `side` tinyint(4) DEFAULT NULL,
  `qty` mediumint(9) DEFAULT NULL,
  `profit` float DEFAULT NULL,
  `day` varchar(5) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `dt`, `user_id`, `automation_id`, `code`, `order_id`, `symbol`, `buy_price`, `sell_price`, `side`, `qty`, `profit`, `day`, `status`) VALUES
(3, '2023-02-03 14:29:02', '2023-02-03 14:29:02', '2023-02-03', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 1, 'Fri', '1'),
(4, '2023-02-03 14:30:33', '2023-02-03 14:30:33', '2023-02-03', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 1, 'Fri', '1'),
(8, '2023-02-06 14:19:08', '2023-02-06 14:19:08', '2023-02-06', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(10, '2023-02-06 14:24:18', '2023-02-06 14:24:18', '2023-02-06', 2, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(11, '2023-02-06 14:25:00', '2023-02-06 14:25:00', '2023-02-06', 2, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(12, '2023-02-06 14:56:12', '2023-02-06 14:56:12', '2023-02-06', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(13, '2023-02-06 15:44:05', '2023-02-06 15:44:05', '2023-02-06', 2, NULL, 'tatasteel_occ_1', NULL, 'NSE:TATASTEEL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(14, '2023-02-07 14:26:24', '2023-02-07 14:26:24', '2023-02-07', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(15, '2023-02-07 14:27:01', '2023-02-07 14:27:01', '2023-02-07', 2, NULL, 'tatasteel_occ_1', NULL, 'NSE:TATASTEEL-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(16, '2023-02-07 14:30:09', '2023-02-07 14:30:09', '2023-02-07', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(18, '2023-02-07 17:05:01', '2023-02-07 17:05:01', '2023-02-07', 2, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(19, '2023-02-07 17:29:01', '2023-02-07 17:29:01', '2023-02-07', 2, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(20, '2023-02-08 14:19:03', '2023-02-08 14:19:03', '2023-02-08', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(21, '2023-02-08 14:22:01', '2023-02-08 14:22:01', '2023-02-08', 2, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(23, '2023-02-08 14:45:33', '2023-02-08 14:45:33', '2023-02-08', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(24, '2023-02-08 14:46:16', '2023-02-08 14:46:16', '2023-02-08', 2, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(25, '2023-02-08 14:48:02', '2023-02-08 14:48:02', '2023-02-08', 2, NULL, 'tatasteel_occ_1', NULL, 'NSE:TATASTEEL-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(26, '2023-02-08 15:32:01', '2023-02-08 15:32:01', '2023-02-08', 2, NULL, 'icici_occ_1', NULL, 'NSE:ICICIBANK-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(27, '2023-02-09 14:20:13', '2023-02-09 14:20:13', '2023-02-09', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(28, '2023-02-09 14:20:19', '2023-02-09 14:20:19', '2023-02-09', 2, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(29, '2023-02-09 14:21:01', '2023-02-09 14:21:01', '2023-02-09', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(30, '2023-02-09 14:21:01', '2023-02-09 14:21:01', '2023-02-09', 2, NULL, 'tatasteel_occ_1', NULL, 'NSE:TATASTEEL-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(31, '2023-02-09 14:50:05', '2023-02-09 14:50:05', '2023-02-09', 2, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(33, '2023-02-09 15:02:01', '2023-02-09 15:02:01', '2023-02-09', 2, NULL, 'icici_occ_1', NULL, 'NSE:ICICIBANK-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(36, '2023-02-10 14:19:11', '2023-02-10 14:19:11', '2023-02-10', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(38, '2023-02-10 14:23:16', '2023-02-10 14:23:16', '2023-02-10', 2, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(40, '2023-02-10 14:24:02', '2023-02-10 14:24:02', '2023-02-10', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(41, '2023-02-10 14:35:01', '2023-02-10 14:35:01', '2023-02-10', 2, NULL, 'icici_occ_1', NULL, 'NSE:ICICIBANK-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(42, '2023-02-10 14:40:02', '2023-02-10 14:40:02', '2023-02-10', 2, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 1, 'Fri', '1'),
(44, '2023-02-10 15:22:43', '2023-02-10 15:22:43', '2023-02-10', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(45, '2023-02-10 16:29:02', '2023-02-10 16:29:02', '2023-02-10', 2, NULL, 'tatasteel_occ_1', NULL, 'NSE:TATASTEEL-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(47, '2023-02-13 14:19:24', '2023-02-13 14:19:24', '2023-02-13', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(48, '2023-02-13 14:20:02', '2023-02-13 14:20:02', '2023-02-13', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(49, '2023-02-13 14:21:50', '2023-02-13 14:21:50', '2023-02-13', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(51, '2023-02-13 14:25:05', '2023-02-13 14:25:05', '2023-02-13', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(52, '2023-02-13 14:31:02', '2023-02-13 14:31:02', '2023-02-13', 2, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(54, '2023-02-13 14:38:02', '2023-02-13 14:38:02', '2023-02-13', 2, NULL, 'icici_occ_1', NULL, 'NSE:ICICIBANK-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(55, '2023-02-13 14:53:15', '2023-02-13 14:53:15', '2023-02-13', 2, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(56, '2023-02-13 15:07:01', '2023-02-13 15:07:01', '2023-02-13', 2, NULL, 'tatasteel_occ_1', NULL, 'NSE:TATASTEEL-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(58, '2023-02-14 14:19:19', '2023-02-14 14:19:19', '2023-02-14', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(59, '2023-02-14 14:23:53', '2023-02-14 14:23:53', '2023-02-14', 3, NULL, 'manappuram_occ_1', NULL, 'NSE:MANAPPURAM-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(60, '2023-02-14 14:27:02', '2023-02-14 14:27:02', '2023-02-14', 3, NULL, 'tatasteel_occ_1', NULL, 'NSE:TATASTEEL-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(61, '2023-02-14 14:28:04', '2023-02-14 14:28:04', '2023-02-14', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(62, '2023-02-14 14:29:03', '2023-02-14 14:29:03', '2023-02-14', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(63, '2023-02-14 14:40:01', '2023-02-14 14:40:01', '2023-02-14', 2, NULL, 'icici_occ_1', NULL, 'NSE:ICICIBANK-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(64, '2023-02-14 14:53:01', '2023-02-14 14:53:01', '2023-02-14', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(66, '2023-02-14 15:04:39', '2023-02-14 15:04:39', '2023-02-14', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(67, '2023-02-14 15:16:01', '2023-02-14 15:16:01', '2023-02-14', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(70, '2023-02-14 15:48:01', '2023-02-14 15:48:01', '2023-02-14', 3, NULL, 'indusind_occ_1', NULL, 'NSE:INDUSINDBK-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(71, '2023-02-14 18:15:27', '2023-02-14 18:15:27', '2023-02-14', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(72, '2023-02-15 14:19:11', '2023-02-15 14:19:11', '2023-02-15', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(73, '2023-02-15 14:20:01', '2023-02-15 14:20:01', '2023-02-15', 2, NULL, 'icici_occ_1', NULL, 'NSE:ICICIBANK-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(74, '2023-02-15 14:26:05', '2023-02-15 14:26:05', '2023-02-15', 3, NULL, 'coalindia_occ_1', NULL, 'NSE:COALINDIA-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(75, '2023-02-15 14:26:10', '2023-02-15 14:26:10', '2023-02-15', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(76, '2023-02-15 14:27:23', '2023-02-15 14:27:23', '2023-02-15', 3, NULL, 'manappuram_occ_1', NULL, 'NSE:MANAPPURAM-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(78, '2023-02-15 14:36:14', '2023-02-15 14:36:14', '2023-02-15', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(79, '2023-02-15 14:38:01', '2023-02-15 14:38:01', '2023-02-15', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(80, '2023-02-15 14:38:02', '2023-02-15 14:38:02', '2023-02-15', 3, NULL, 'indusind_occ_1', NULL, 'NSE:INDUSINDBK-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(81, '2023-02-15 14:46:01', '2023-02-15 14:46:01', '2023-02-15', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(84, '2023-02-15 15:51:01', '2023-02-15 15:51:01', '2023-02-15', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(85, '2023-02-15 16:00:02', '2023-02-15 16:00:02', '2023-02-15', 3, NULL, 'tatasteel_occ_1', NULL, 'NSE:TATASTEEL-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(86, '2023-02-15 16:20:34', '2023-02-15 16:20:34', '2023-02-15', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(87, '2023-02-15 16:44:02', '2023-02-15 16:44:02', '2023-02-15', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(88, '2023-02-16 14:20:02', '2023-02-16 14:20:02', '2023-02-16', 3, NULL, 'indusind_occ_1', NULL, 'NSE:INDUSINDBK-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(89, '2023-02-16 14:21:03', '2023-02-16 14:21:03', '2023-02-16', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(90, '2023-02-16 14:21:06', '2023-02-16 14:21:06', '2023-02-16', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(91, '2023-02-16 14:24:01', '2023-02-16 14:24:01', '2023-02-16', 3, NULL, 'tatasteel_occ_1', NULL, 'NSE:TATASTEEL-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(93, '2023-02-16 14:26:02', '2023-02-16 14:26:02', '2023-02-16', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(94, '2023-02-16 14:29:16', '2023-02-16 14:29:16', '2023-02-16', 3, NULL, 'manappuram_occ_1', NULL, 'NSE:MANAPPURAM-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(96, '2023-02-16 14:47:45', '2023-02-16 14:47:45', '2023-02-16', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(98, '2023-02-16 14:58:05', '2023-02-16 14:58:05', '2023-02-16', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(99, '2023-02-16 15:00:02', '2023-02-16 15:00:02', '2023-02-16', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(100, '2023-02-16 15:10:02', '2023-02-16 15:10:02', '2023-02-16', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(101, '2023-02-16 15:12:01', '2023-02-16 15:12:01', '2023-02-16', 2, NULL, 'icici_occ_1', NULL, 'NSE:ICICIBANK-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(102, '2023-02-16 15:25:47', '2023-02-16 15:25:47', '2023-02-16', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(103, '2023-02-16 15:35:01', '2023-02-16 15:35:01', '2023-02-16', 3, NULL, 'coalindia_occ_1', NULL, 'NSE:COALINDIA-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(104, '2023-02-16 15:35:02', '2023-02-16 15:35:02', '2023-02-16', 2, NULL, 'bhartiartl_occ_1', NULL, 'NSE:BHARTIARTL-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(105, '2023-02-17 14:20:38', '2023-02-17 14:20:38', '2023-02-17', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 1, 'Fri', '1'),
(106, '2023-02-17 14:21:01', '2023-02-17 14:21:01', '2023-02-17', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(107, '2023-02-17 14:22:00', '2023-02-17 14:22:00', '2023-02-17', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(110, '2023-02-17 14:37:30', '2023-02-17 14:37:30', '2023-02-17', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(111, '2023-02-17 14:38:31', '2023-02-17 14:38:31', '2023-02-17', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(112, '2023-02-17 14:53:05', '2023-02-17 14:53:05', '2023-02-17', 3, NULL, 'indusind_occ_1', NULL, 'NSE:INDUSINDBK-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(113, '2023-02-17 14:55:01', '2023-02-17 14:55:01', '2023-02-17', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(114, '2023-02-17 14:57:01', '2023-02-17 14:57:01', '2023-02-17', 2, NULL, 'icici_occ_1', NULL, 'NSE:ICICIBANK-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(116, '2023-02-17 15:06:01', '2023-02-17 15:06:01', '2023-02-17', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(117, '2023-02-17 15:07:01', '2023-02-17 15:07:01', '2023-02-17', 3, NULL, 'coalindia_occ_1', NULL, 'NSE:COALINDIA-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(118, '2023-02-17 15:11:55', '2023-02-17 15:11:55', '2023-02-17', 3, NULL, 'manappuram_occ_1', NULL, 'NSE:MANAPPURAM-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(119, '2023-02-17 15:14:02', '2023-02-17 15:14:02', '2023-02-17', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(120, '2023-02-17 15:15:04', '2023-02-17 15:15:04', '2023-02-17', 3, NULL, 'tatasteel_occ_1', NULL, 'NSE:TATASTEEL-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(121, '2023-02-20 14:21:03', '2023-02-20 14:21:03', '2023-02-20', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(122, '2023-02-20 14:26:02', '2023-02-20 14:26:02', '2023-02-20', 3, NULL, 'indusind_occ_1', NULL, 'NSE:INDUSINDBK-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(123, '2023-02-20 14:28:33', '2023-02-20 14:28:33', '2023-02-20', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(124, '2023-02-20 14:38:01', '2023-02-20 14:38:01', '2023-02-20', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(125, '2023-02-20 14:38:31', '2023-02-20 14:38:31', '2023-02-20', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(126, '2023-02-20 14:42:02', '2023-02-20 14:42:02', '2023-02-20', 3, NULL, 'tatasteel_occ_1', NULL, 'NSE:TATASTEEL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(127, '2023-02-20 14:45:01', '2023-02-20 14:45:01', '2023-02-20', 2, NULL, 'bhartiartl_occ_1', NULL, 'NSE:BHARTIARTL-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(128, '2023-02-20 15:13:04', '2023-02-20 15:13:04', '2023-02-20', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(129, '2023-02-20 15:38:29', '2023-02-20 15:38:29', '2023-02-20', 3, NULL, 'manappuram_occ_1', NULL, 'NSE:MANAPPURAM-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(130, '2023-02-20 15:47:01', '2023-02-20 15:47:01', '2023-02-20', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(131, '2023-02-20 16:00:08', '2023-02-20 16:00:08', '2023-02-20', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(132, '2023-02-20 16:21:03', '2023-02-20 16:21:03', '2023-02-20', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(133, '2023-02-21 14:21:49', '2023-02-21 14:21:49', '2023-02-21', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(134, '2023-02-21 14:25:01', '2023-02-21 14:25:01', '2023-02-21', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(135, '2023-02-21 14:54:05', '2023-02-21 14:54:05', '2023-02-21', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(136, '2023-02-21 14:55:02', '2023-02-21 14:55:02', '2023-02-21', 2, NULL, 'bhartiartl_occ_1', NULL, 'NSE:BHARTIARTL-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(137, '2023-02-21 15:03:01', '2023-02-21 15:03:01', '2023-02-21', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(138, '2023-02-21 15:04:03', '2023-02-21 15:04:03', '2023-02-21', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(139, '2023-02-21 15:07:01', '2023-02-21 15:07:01', '2023-02-21', 3, NULL, 'indusind_occ_1', NULL, 'NSE:INDUSINDBK-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(140, '2023-02-21 15:32:02', '2023-02-21 15:32:02', '2023-02-21', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(141, '2023-02-21 15:55:20', '2023-02-21 15:55:20', '2023-02-21', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(142, '2023-02-21 16:02:04', '2023-02-21 16:02:04', '2023-02-21', 3, NULL, 'tatasteel_occ_1', NULL, 'NSE:TATASTEEL-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(143, '2023-02-21 18:57:09', '2023-02-21 18:57:09', '2023-02-21', 3, NULL, 'manappuram_occ_1', NULL, 'NSE:MANAPPURAM-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(144, '2023-02-22 14:19:29', '2023-02-22 14:19:29', '2023-02-22', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(145, '2023-02-22 14:25:01', '2023-02-22 14:25:01', '2023-02-22', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(146, '2023-02-22 14:29:02', '2023-02-22 14:29:02', '2023-02-22', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(147, '2023-02-22 15:31:10', '2023-02-22 15:31:10', '2023-02-22', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(148, '2023-02-22 16:05:01', '2023-02-22 16:05:01', '2023-02-22', 2, NULL, 'bhartiartl_occ_1', NULL, 'NSE:BHARTIARTL-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(149, '2023-02-22 16:09:07', '2023-02-22 16:09:07', '2023-02-22', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(150, '2023-02-22 16:20:01', '2023-02-22 16:20:01', '2023-02-22', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(152, '2023-02-23 14:19:16', '2023-02-23 14:19:16', '2023-02-23', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(153, '2023-02-23 14:20:01', '2023-02-23 14:20:01', '2023-02-23', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(154, '2023-02-23 14:27:13', '2023-02-23 14:27:13', '2023-02-23', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(155, '2023-02-23 14:32:04', '2023-02-23 14:32:04', '2023-02-23', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(156, '2023-02-23 14:33:03', '2023-02-23 14:33:03', '2023-02-23', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(158, '2023-02-23 15:16:02', '2023-02-23 15:16:02', '2023-02-23', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(159, '2023-02-23 17:55:02', '2023-02-23 17:55:02', '2023-02-23', 3, NULL, 'icici_occ_2', NULL, 'NSE:ICICIBANK-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(160, '2023-02-24 14:20:02', '2023-02-24 14:20:02', '2023-02-24', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(161, '2023-02-24 14:22:01', '2023-02-24 14:22:01', '2023-02-24', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(162, '2023-02-24 14:35:01', '2023-02-24 14:35:01', '2023-02-24', 3, NULL, 'icici_occ_2', NULL, 'NSE:ICICIBANK-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(163, '2023-02-24 14:38:00', '2023-02-24 14:38:00', '2023-02-24', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(164, '2023-02-24 14:44:05', '2023-02-24 14:44:05', '2023-02-24', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(165, '2023-02-24 15:18:02', '2023-02-24 15:18:02', '2023-02-24', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(166, '2023-02-24 16:53:01', '2023-02-24 16:53:01', '2023-02-24', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(168, '2023-02-27 14:19:03', '2023-02-27 14:19:03', '2023-02-27', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(169, '2023-02-27 14:21:01', '2023-02-27 14:21:01', '2023-02-27', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(170, '2023-02-27 14:21:05', '2023-02-27 14:21:05', '2023-02-27', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(171, '2023-02-27 14:24:01', '2023-02-27 14:24:01', '2023-02-27', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(172, '2023-02-27 14:37:50', '2023-02-27 14:37:50', '2023-02-27', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(173, '2023-02-27 16:09:02', '2023-02-27 16:09:02', '2023-02-27', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(174, '2023-02-27 19:25:05', '2023-02-27 19:25:05', '2023-02-27', 2, NULL, 'bhartiartl_occ_1', NULL, 'NSE:BHARTIARTL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(175, '2023-02-28 14:20:02', '2023-02-28 14:20:02', '2023-02-28', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(176, '2023-02-28 14:41:43', '2023-02-28 14:41:43', '2023-02-28', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(177, '2023-02-28 14:52:03', '2023-02-28 14:52:03', '2023-02-28', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(178, '2023-02-28 14:53:01', '2023-02-28 14:53:01', '2023-02-28', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(179, '2023-02-28 14:55:58', '2023-02-28 14:55:58', '2023-02-28', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(180, '2023-02-28 15:35:01', '2023-02-28 15:35:01', '2023-02-28', 2, NULL, 'bhartiartl_occ_1', NULL, 'NSE:BHARTIARTL-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(181, '2023-02-28 15:53:02', '2023-02-28 15:53:02', '2023-02-28', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(182, '2023-03-01 14:23:58', '2023-03-01 14:23:58', '2023-03-01', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(183, '2023-03-01 14:25:05', '2023-03-01 14:25:05', '2023-03-01', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(184, '2023-03-01 15:23:54', '2023-03-01 15:23:54', '2023-03-01', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(185, '2023-03-01 15:36:01', '2023-03-01 15:36:01', '2023-03-01', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(186, '2023-03-01 15:55:03', '2023-03-01 15:55:03', '2023-03-01', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(187, '2023-03-01 18:28:02', '2023-03-01 18:28:02', '2023-03-01', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(188, '2023-03-02 14:22:04', '2023-03-02 14:22:04', '2023-03-02', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(189, '2023-03-02 14:49:04', '2023-03-02 14:49:04', '2023-03-02', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(190, '2023-03-02 15:48:03', '2023-03-02 15:48:03', '2023-03-02', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(191, '2023-03-02 15:52:02', '2023-03-02 15:52:02', '2023-03-02', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(192, '2023-03-02 16:46:02', '2023-03-02 16:46:02', '2023-03-02', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(193, '2023-03-03 14:35:03', '2023-03-03 14:35:03', '2023-03-03', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(194, '2023-03-03 14:38:02', '2023-03-03 14:38:02', '2023-03-03', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(195, '2023-03-03 14:48:01', '2023-03-03 14:48:01', '2023-03-03', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(196, '2023-03-03 15:07:04', '2023-03-03 15:07:04', '2023-03-03', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, 1, NULL, 1, 'Fri', '1'),
(197, '2023-03-03 15:09:49', '2023-03-03 15:09:49', '2023-03-03', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(198, '2023-03-03 15:23:32', '2023-03-03 15:23:32', '2023-03-03', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(199, '2023-03-03 16:25:05', '2023-03-03 16:25:05', '2023-03-03', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(200, '2023-03-06 14:19:21', '2023-03-06 14:19:21', '2023-03-06', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(201, '2023-03-06 14:20:01', '2023-03-06 14:20:01', '2023-03-06', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(202, '2023-03-06 14:20:02', '2023-03-06 14:20:02', '2023-03-06', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(203, '2023-03-06 14:20:06', '2023-03-06 14:20:06', '2023-03-06', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(204, '2023-03-06 14:20:34', '2023-03-06 14:20:34', '2023-03-06', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(205, '2023-03-06 14:22:04', '2023-03-06 14:22:04', '2023-03-06', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(206, '2023-03-06 14:25:02', '2023-03-06 14:25:02', '2023-03-06', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(207, '2023-03-06 14:26:01', '2023-03-06 14:26:01', '2023-03-06', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(208, '2023-03-06 14:26:04', '2023-03-06 14:26:04', '2023-03-06', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(209, '2023-03-06 14:28:02', '2023-03-06 14:28:02', '2023-03-06', 3, NULL, 'rvnl_occ_1', NULL, 'NSE:RVNL-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(210, '2023-03-06 14:51:09', '2023-03-06 14:51:09', '2023-03-06', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(211, '2023-03-06 15:03:03', '2023-03-06 15:03:03', '2023-03-06', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(212, '2023-03-06 15:05:05', '2023-03-06 15:05:05', '2023-03-06', 3, NULL, 'lemontree_occ_1', NULL, 'NSE:LEMONTREE-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(213, '2023-03-06 17:46:01', '2023-03-06 17:46:01', '2023-03-06', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(214, '2023-03-08 14:20:03', '2023-03-08 14:20:03', '2023-03-08', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(215, '2023-03-08 14:21:07', '2023-03-08 14:21:07', '2023-03-08', 3, NULL, 'lemontree_occ_1', NULL, 'NSE:LEMONTREE-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(216, '2023-03-08 14:26:04', '2023-03-08 14:26:04', '2023-03-08', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(217, '2023-03-08 14:27:01', '2023-03-08 14:27:01', '2023-03-08', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(218, '2023-03-08 14:31:18', '2023-03-08 14:31:18', '2023-03-08', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(219, '2023-03-08 14:32:01', '2023-03-08 14:32:01', '2023-03-08', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(220, '2023-03-08 14:32:28', '2023-03-08 14:32:28', '2023-03-08', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(221, '2023-03-08 14:33:03', '2023-03-08 14:33:03', '2023-03-08', 3, NULL, 'rvnl_occ_1', NULL, 'NSE:RVNL-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(222, '2023-03-08 14:35:05', '2023-03-08 14:35:05', '2023-03-08', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(223, '2023-03-08 14:36:14', '2023-03-08 14:36:14', '2023-03-08', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(224, '2023-03-08 14:38:05', '2023-03-08 14:38:05', '2023-03-08', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(225, '2023-03-08 14:48:01', '2023-03-08 14:48:01', '2023-03-08', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(226, '2023-03-08 15:10:03', '2023-03-08 15:10:03', '2023-03-08', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(227, '2023-03-08 15:17:02', '2023-03-08 15:17:02', '2023-03-08', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(228, '2023-03-08 16:34:32', '2023-03-08 16:34:32', '2023-03-08', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(229, '2023-03-09 14:20:06', '2023-03-09 14:20:06', '2023-03-09', 3, NULL, 'rvnl_occ_1', NULL, 'NSE:RVNL-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(230, '2023-03-09 14:21:00', '2023-03-09 14:21:00', '2023-03-09', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(231, '2023-03-09 14:21:01', '2023-03-09 14:21:01', '2023-03-09', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(232, '2023-03-09 14:27:04', '2023-03-09 14:27:04', '2023-03-09', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(233, '2023-03-09 14:29:01', '2023-03-09 14:29:01', '2023-03-09', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(234, '2023-03-09 14:32:04', '2023-03-09 14:32:04', '2023-03-09', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(235, '2023-03-09 14:35:01', '2023-03-09 14:35:01', '2023-03-09', 3, NULL, 'lemontree_occ_1', NULL, 'NSE:LEMONTREE-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(236, '2023-03-09 14:36:01', '2023-03-09 14:36:01', '2023-03-09', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(237, '2023-03-09 14:39:46', '2023-03-09 14:39:46', '2023-03-09', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(238, '2023-03-09 14:41:01', '2023-03-09 14:41:01', '2023-03-09', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(239, '2023-03-09 14:42:02', '2023-03-09 14:42:02', '2023-03-09', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(240, '2023-03-09 14:44:01', '2023-03-09 14:44:01', '2023-03-09', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(241, '2023-03-09 15:14:04', '2023-03-09 15:14:04', '2023-03-09', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(242, '2023-03-09 15:22:03', '2023-03-09 15:22:03', '2023-03-09', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(243, '2023-03-09 16:30:24', '2023-03-09 16:30:24', '2023-03-09', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(244, '2023-03-10 14:20:05', '2023-03-10 14:20:05', '2023-03-10', 3, NULL, 'lemontree_occ_1', NULL, 'NSE:LEMONTREE-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(245, '2023-03-10 14:20:51', '2023-03-10 14:20:51', '2023-03-10', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 1, 'Fri', '1'),
(246, '2023-03-10 14:21:15', '2023-03-10 14:21:15', '2023-03-10', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 1, 'Fri', '1'),
(247, '2023-03-10 14:24:02', '2023-03-10 14:24:02', '2023-03-10', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(248, '2023-03-10 14:28:01', '2023-03-10 14:28:01', '2023-03-10', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(249, '2023-03-10 14:28:03', '2023-03-10 14:28:03', '2023-03-10', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(250, '2023-03-10 14:28:06', '2023-03-10 14:28:06', '2023-03-10', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 1, 'Fri', '1'),
(251, '2023-03-10 14:30:05', '2023-03-10 14:30:05', '2023-03-10', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(252, '2023-03-10 14:32:06', '2023-03-10 14:32:06', '2023-03-10', 3, NULL, 'rvnl_occ_1', NULL, 'NSE:RVNL-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(253, '2023-03-10 14:34:03', '2023-03-10 14:34:03', '2023-03-10', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(254, '2023-03-10 14:37:02', '2023-03-10 14:37:02', '2023-03-10', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(255, '2023-03-10 14:53:04', '2023-03-10 14:53:04', '2023-03-10', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, 1, NULL, 1, 'Fri', '1'),
(256, '2023-03-10 14:55:13', '2023-03-10 14:55:13', '2023-03-10', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Fri', '1'),
(257, '2023-03-10 16:03:02', '2023-03-10 16:03:02', '2023-03-10', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(258, '2023-03-13 13:21:01', '2023-03-13 13:21:01', '2023-03-13', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(259, '2023-03-13 13:23:02', '2023-03-13 13:23:02', '2023-03-13', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(260, '2023-03-13 13:26:06', '2023-03-13 13:26:06', '2023-03-13', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(261, '2023-03-13 13:27:47', '2023-03-13 13:27:47', '2023-03-13', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(262, '2023-03-13 13:29:01', '2023-03-13 13:29:01', '2023-03-13', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(263, '2023-03-13 13:31:02', '2023-03-13 13:31:02', '2023-03-13', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(264, '2023-03-13 13:31:13', '2023-03-13 13:31:13', '2023-03-13', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(265, '2023-03-13 13:34:03', '2023-03-13 13:34:03', '2023-03-13', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(266, '2023-03-13 13:35:03', '2023-03-13 13:35:03', '2023-03-13', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(267, '2023-03-13 13:36:05', '2023-03-13 13:36:05', '2023-03-13', 3, NULL, 'lemontree_occ_1', NULL, 'NSE:LEMONTREE-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(268, '2023-03-13 13:40:57', '2023-03-13 13:40:57', '2023-03-13', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(269, '2023-03-13 13:41:17', '2023-03-13 13:41:17', '2023-03-13', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(270, '2023-03-13 13:49:05', '2023-03-13 13:49:05', '2023-03-13', 3, NULL, 'rvnl_occ_1', NULL, 'NSE:RVNL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(271, '2023-03-13 14:00:02', '2023-03-13 14:00:02', '2023-03-13', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(272, '2023-03-14 13:20:02', '2023-03-14 13:20:02', '2023-03-14', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(273, '2023-03-14 13:20:08', '2023-03-14 13:20:08', '2023-03-14', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(274, '2023-03-14 13:21:01', '2023-03-14 13:21:01', '2023-03-14', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(275, '2023-03-14 13:21:01', '2023-03-14 13:21:01', '2023-03-14', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(276, '2023-03-14 13:21:03', '2023-03-14 13:21:03', '2023-03-14', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(277, '2023-03-14 13:21:38', '2023-03-14 13:21:38', '2023-03-14', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(278, '2023-03-14 13:22:01', '2023-03-14 13:22:01', '2023-03-14', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(279, '2023-03-14 13:22:19', '2023-03-14 13:22:19', '2023-03-14', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(281, '2023-03-14 13:25:02', '2023-03-14 13:25:02', '2023-03-14', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(282, '2023-03-14 13:31:06', '2023-03-14 13:31:06', '2023-03-14', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(284, '2023-03-14 13:55:27', '2023-03-14 13:55:27', '2023-03-14', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(285, '2023-03-14 14:05:02', '2023-03-14 14:05:02', '2023-03-14', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(286, '2023-03-14 14:36:01', '2023-03-14 14:36:01', '2023-03-14', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(288, '2023-03-15 13:19:24', '2023-03-15 13:19:24', '2023-03-15', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(289, '2023-03-15 13:20:02', '2023-03-15 13:20:02', '2023-03-15', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(290, '2023-03-15 13:20:11', '2023-03-15 13:20:11', '2023-03-15', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(291, '2023-03-15 13:22:30', '2023-03-15 13:22:30', '2023-03-15', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(293, '2023-03-15 13:25:03', '2023-03-15 13:25:03', '2023-03-15', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(294, '2023-03-15 13:31:39', '2023-03-15 13:31:39', '2023-03-15', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(295, '2023-03-15 13:35:02', '2023-03-15 13:35:02', '2023-03-15', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(296, '2023-03-15 13:38:01', '2023-03-15 13:38:01', '2023-03-15', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(297, '2023-03-15 13:38:01', '2023-03-15 13:38:01', '2023-03-15', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(298, '2023-03-15 13:39:02', '2023-03-15 13:39:02', '2023-03-15', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(299, '2023-03-15 13:40:02', '2023-03-15 13:40:02', '2023-03-15', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(301, '2023-03-15 13:59:01', '2023-03-15 13:59:01', '2023-03-15', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(303, '2023-03-15 16:17:01', '2023-03-15 16:17:01', '2023-03-15', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(304, '2023-03-16 13:19:49', '2023-03-16 13:19:49', '2023-03-16', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(306, '2023-03-16 13:32:02', '2023-03-16 13:32:02', '2023-03-16', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(307, '2023-03-16 13:32:11', '2023-03-16 13:32:11', '2023-03-16', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(308, '2023-03-16 13:41:02', '2023-03-16 13:41:02', '2023-03-16', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(310, '2023-03-16 13:48:05', '2023-03-16 13:48:05', '2023-03-16', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(311, '2023-03-16 13:50:21', '2023-03-16 13:50:21', '2023-03-16', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(312, '2023-03-16 13:56:21', '2023-03-16 13:56:21', '2023-03-16', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(313, '2023-03-16 14:04:05', '2023-03-16 14:04:05', '2023-03-16', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(315, '2023-03-16 14:13:18', '2023-03-16 14:13:18', '2023-03-16', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(316, '2023-03-16 14:19:01', '2023-03-16 14:19:01', '2023-03-16', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(317, '2023-03-16 14:19:02', '2023-03-16 14:19:02', '2023-03-16', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(318, '2023-03-16 14:19:29', '2023-03-16 14:19:29', '2023-03-16', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(319, '2023-03-16 14:20:01', '2023-03-16 14:20:01', '2023-03-16', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(320, '2023-03-16 15:10:03', '2023-03-16 15:10:03', '2023-03-16', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(321, '2023-03-17 13:22:04', '2023-03-17 13:22:04', '2023-03-17', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, 1, NULL, 1, 'Fri', '1'),
(322, '2023-03-17 13:23:38', '2023-03-17 13:23:38', '2023-03-17', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(323, '2023-03-17 13:24:04', '2023-03-17 13:24:04', '2023-03-17', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(324, '2023-03-17 13:27:10', '2023-03-17 13:27:10', '2023-03-17', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(325, '2023-03-17 13:27:44', '2023-03-17 13:27:44', '2023-03-17', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(326, '2023-03-17 13:31:47', '2023-03-17 13:31:47', '2023-03-17', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(328, '2023-03-17 13:37:03', '2023-03-17 13:37:03', '2023-03-17', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(329, '2023-03-17 13:39:02', '2023-03-17 13:39:02', '2023-03-17', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(330, '2023-03-17 13:48:02', '2023-03-17 13:48:02', '2023-03-17', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(331, '2023-03-17 13:52:01', '2023-03-17 13:52:01', '2023-03-17', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, 1, NULL, 1, 'Fri', '1'),
(333, '2023-03-17 14:00:03', '2023-03-17 14:00:03', '2023-03-17', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(335, '2023-03-17 14:46:02', '2023-03-17 14:46:02', '2023-03-17', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(336, '2023-03-17 15:00:04', '2023-03-17 15:00:04', '2023-03-17', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(337, '2023-03-17 15:53:02', '2023-03-17 15:53:02', '2023-03-17', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(338, '2023-03-20 13:19:09', '2023-03-20 13:19:09', '2023-03-20', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(339, '2023-03-20 13:19:44', '2023-03-20 13:19:44', '2023-03-20', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(340, '2023-03-20 13:22:03', '2023-03-20 13:22:03', '2023-03-20', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(341, '2023-03-20 13:24:05', '2023-03-20 13:24:05', '2023-03-20', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(342, '2023-03-20 13:25:57', '2023-03-20 13:25:57', '2023-03-20', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(343, '2023-03-20 13:27:02', '2023-03-20 13:27:02', '2023-03-20', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(344, '2023-03-20 13:46:05', '2023-03-20 13:46:05', '2023-03-20', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(345, '2023-03-20 14:11:13', '2023-03-20 14:11:13', '2023-03-20', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(346, '2023-03-20 14:16:02', '2023-03-20 14:16:02', '2023-03-20', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(347, '2023-03-20 14:40:01', '2023-03-20 14:40:01', '2023-03-20', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(348, '2023-03-20 14:40:02', '2023-03-20 14:40:02', '2023-03-20', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(349, '2023-03-20 14:54:01', '2023-03-20 14:54:01', '2023-03-20', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(350, '2023-03-20 15:00:03', '2023-03-20 15:00:03', '2023-03-20', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(351, '2023-03-20 15:08:03', '2023-03-20 15:08:03', '2023-03-20', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(352, '2023-03-21 13:19:03', '2023-03-21 13:19:03', '2023-03-21', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(353, '2023-03-21 13:19:05', '2023-03-21 13:19:05', '2023-03-21', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(354, '2023-03-21 13:20:06', '2023-03-21 13:20:06', '2023-03-21', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(355, '2023-03-21 13:21:00', '2023-03-21 13:21:00', '2023-03-21', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(356, '2023-03-21 13:22:01', '2023-03-21 13:22:01', '2023-03-21', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(357, '2023-03-21 13:24:04', '2023-03-21 13:24:04', '2023-03-21', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(358, '2023-03-21 13:28:01', '2023-03-21 13:28:01', '2023-03-21', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(359, '2023-03-21 13:29:04', '2023-03-21 13:29:04', '2023-03-21', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(360, '2023-03-21 13:36:04', '2023-03-21 13:36:04', '2023-03-21', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(361, '2023-03-21 13:59:03', '2023-03-21 13:59:03', '2023-03-21', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(362, '2023-03-21 14:17:39', '2023-03-21 14:17:39', '2023-03-21', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(363, '2023-03-21 14:20:01', '2023-03-21 14:20:01', '2023-03-21', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(364, '2023-03-21 14:34:04', '2023-03-21 14:34:04', '2023-03-21', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(365, '2023-03-21 14:51:01', '2023-03-21 14:51:01', '2023-03-21', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(366, '2023-03-22 13:20:03', '2023-03-22 13:20:03', '2023-03-22', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(367, '2023-03-22 13:21:08', '2023-03-22 13:21:08', '2023-03-22', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(368, '2023-03-22 13:22:02', '2023-03-22 13:22:02', '2023-03-22', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(369, '2023-03-22 13:22:17', '2023-03-22 13:22:17', '2023-03-22', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(370, '2023-03-22 13:22:42', '2023-03-22 13:22:42', '2023-03-22', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(371, '2023-03-22 13:30:03', '2023-03-22 13:30:03', '2023-03-22', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(372, '2023-03-22 13:34:01', '2023-03-22 13:34:01', '2023-03-22', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(373, '2023-03-22 13:35:30', '2023-03-22 13:35:30', '2023-03-22', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(374, '2023-03-22 13:38:02', '2023-03-22 13:38:02', '2023-03-22', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(375, '2023-03-22 13:51:01', '2023-03-22 13:51:01', '2023-03-22', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(376, '2023-03-22 13:58:02', '2023-03-22 13:58:02', '2023-03-22', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(377, '2023-03-22 13:59:05', '2023-03-22 13:59:05', '2023-03-22', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1');
INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `dt`, `user_id`, `automation_id`, `code`, `order_id`, `symbol`, `buy_price`, `sell_price`, `side`, `qty`, `profit`, `day`, `status`) VALUES
(378, '2023-03-22 14:10:02', '2023-03-22 14:10:02', '2023-03-22', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(379, '2023-03-22 14:15:04', '2023-03-22 14:15:04', '2023-03-22', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(380, '2023-03-23 13:19:24', '2023-03-23 13:19:24', '2023-03-23', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(381, '2023-03-23 13:20:28', '2023-03-23 13:20:28', '2023-03-23', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(382, '2023-03-23 13:21:03', '2023-03-23 13:21:03', '2023-03-23', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(383, '2023-03-23 13:30:05', '2023-03-23 13:30:05', '2023-03-23', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(384, '2023-03-23 13:31:02', '2023-03-23 13:31:02', '2023-03-23', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(385, '2023-03-23 13:33:57', '2023-03-23 13:33:57', '2023-03-23', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(386, '2023-03-23 13:34:04', '2023-03-23 13:34:04', '2023-03-23', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(387, '2023-03-23 13:35:06', '2023-03-23 13:35:06', '2023-03-23', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(388, '2023-03-23 13:36:26', '2023-03-23 13:36:26', '2023-03-23', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(389, '2023-03-23 13:46:04', '2023-03-23 13:46:04', '2023-03-23', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(390, '2023-03-23 13:52:04', '2023-03-23 13:52:04', '2023-03-23', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(391, '2023-03-23 13:58:02', '2023-03-23 13:58:02', '2023-03-23', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(392, '2023-03-23 15:01:01', '2023-03-23 15:01:01', '2023-03-23', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(393, '2023-03-23 15:57:03', '2023-03-23 15:57:03', '2023-03-23', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(394, '2023-03-24 13:19:11', '2023-03-24 13:19:11', '2023-03-24', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(395, '2023-03-24 13:20:01', '2023-03-24 13:20:01', '2023-03-24', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(396, '2023-03-24 13:20:02', '2023-03-24 13:20:02', '2023-03-24', 3, NULL, 'concor_occ_1', NULL, 'NSE:CONCOR-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(397, '2023-03-24 13:20:09', '2023-03-24 13:20:09', '2023-03-24', 2, NULL, 'crompton_occ_1', NULL, 'NSE:CROMPTON-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(398, '2023-03-24 13:20:11', '2023-03-24 13:20:11', '2023-03-24', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(399, '2023-03-24 13:20:30', '2023-03-24 13:20:30', '2023-03-24', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(400, '2023-03-24 13:21:01', '2023-03-24 13:21:01', '2023-03-24', 2, NULL, 'tatamoto_occ_1', NULL, 'NSE:TATAMOTORS-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(401, '2023-03-24 13:23:02', '2023-03-24 13:23:02', '2023-03-24', 3, NULL, 'itc_occ_1', NULL, 'NSE:ITC-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(402, '2023-03-24 13:24:06', '2023-03-24 13:24:06', '2023-03-24', 2, NULL, 'divislab_occ_1', NULL, 'NSE:DIVISLAB-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(403, '2023-03-24 13:55:01', '2023-03-24 13:55:01', '2023-03-24', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(404, '2023-03-24 13:55:08', '2023-03-24 13:55:08', '2023-03-24', 2, NULL, 'hindpetro_occ_1', NULL, 'NSE:HINDPETRO-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(405, '2023-03-24 13:59:01', '2023-03-24 13:59:01', '2023-03-24', 2, NULL, 'bpcl_occ_1', NULL, 'NSE:BPCL-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(406, '2023-03-24 15:14:04', '2023-03-24 15:14:04', '2023-03-24', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(407, '2023-03-24 15:19:01', '2023-03-24 15:19:01', '2023-03-24', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 0, 'Fri', '1'),
(408, '2023-03-27 13:21:02', '2023-03-27 13:21:02', '2023-03-27', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(409, '2023-03-27 13:25:49', '2023-03-27 13:25:49', '2023-03-27', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(410, '2023-03-27 13:34:06', '2023-03-27 13:34:06', '2023-03-27', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(411, '2023-03-27 14:16:01', '2023-03-27 14:16:01', '2023-03-27', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(412, '2023-03-27 14:32:01', '2023-03-27 14:32:01', '2023-03-27', 2, NULL, 'jindalstel_occ_1', NULL, 'NSE:JINDALSTEL-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(413, '2023-03-27 15:54:01', '2023-03-27 15:54:01', '2023-03-27', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(414, '2023-03-28 13:19:15', '2023-03-28 13:19:15', '2023-03-28', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(415, '2023-03-28 13:21:35', '2023-03-28 13:21:35', '2023-03-28', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(416, '2023-03-28 13:28:01', '2023-03-28 13:28:01', '2023-03-28', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(417, '2023-03-28 13:28:27', '2023-03-28 13:28:27', '2023-03-28', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(418, '2023-03-28 13:45:27', '2023-03-28 13:45:27', '2023-03-28', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(419, '2023-03-28 14:12:04', '2023-03-28 14:12:04', '2023-03-28', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(420, '2023-03-29 13:19:43', '2023-03-29 13:19:43', '2023-03-29', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(421, '2023-03-29 13:22:17', '2023-03-29 13:22:17', '2023-03-29', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(422, '2023-03-29 13:27:02', '2023-03-29 13:27:02', '2023-03-29', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(423, '2023-03-29 14:05:34', '2023-03-29 14:05:34', '2023-03-29', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(424, '2023-03-29 14:13:01', '2023-03-29 14:13:01', '2023-03-29', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(425, '2023-03-29 14:43:36', '2023-03-29 14:43:36', '2023-03-29', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(426, '2023-03-31 13:34:01', '2023-03-31 13:34:01', '2023-03-31', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(427, '2023-03-31 13:38:53', '2023-03-31 13:38:53', '2023-03-31', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(428, '2023-03-31 13:49:42', '2023-03-31 13:49:42', '2023-03-31', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(429, '2023-03-31 13:53:14', '2023-03-31 13:53:14', '2023-03-31', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(430, '2023-03-31 14:24:04', '2023-03-31 14:24:04', '2023-03-31', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 0, 'Fri', '1'),
(431, '2023-03-31 14:46:13', '2023-03-31 14:46:13', '2023-03-31', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(432, '2023-04-03 13:36:03', '2023-04-03 13:36:03', '2023-04-03', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(433, '2023-04-03 13:43:41', '2023-04-03 13:43:41', '2023-04-03', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(434, '2023-04-03 13:58:01', '2023-04-03 13:58:01', '2023-04-03', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(435, '2023-04-05 13:21:05', '2023-04-05 13:21:05', '2023-04-05', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(436, '2023-04-05 13:21:46', '2023-04-05 13:21:46', '2023-04-05', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(437, '2023-04-05 13:25:01', '2023-04-05 13:25:01', '2023-04-05', 3, NULL, 'vedl_occ_1', NULL, 'NSE:VEDL-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(438, '2023-04-05 13:25:06', '2023-04-05 13:25:06', '2023-04-05', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(439, '2023-04-05 13:29:44', '2023-04-05 13:29:44', '2023-04-05', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(440, '2023-04-05 15:13:57', '2023-04-05 15:13:57', '2023-04-05', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 1, 'Wed', '1'),
(441, '2023-04-06 13:21:56', '2023-04-06 13:21:56', '2023-04-06', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(442, '2023-04-06 13:24:01', '2023-04-06 13:24:01', '2023-04-06', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(443, '2023-04-06 13:24:46', '2023-04-06 13:24:46', '2023-04-06', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(444, '2023-04-06 13:25:10', '2023-04-06 13:25:10', '2023-04-06', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(445, '2023-04-06 13:43:04', '2023-04-06 13:43:04', '2023-04-06', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(446, '2023-04-10 13:20:34', '2023-04-10 13:20:34', '2023-04-10', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(447, '2023-04-10 13:21:18', '2023-04-10 13:21:18', '2023-04-10', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(448, '2023-04-10 13:21:55', '2023-04-10 13:21:55', '2023-04-10', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(449, '2023-04-10 13:29:51', '2023-04-10 13:29:51', '2023-04-10', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(450, '2023-04-10 13:31:05', '2023-04-10 13:31:05', '2023-04-10', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 0, 'Mon', '1'),
(451, '2023-04-11 13:20:03', '2023-04-11 13:20:03', '2023-04-11', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(452, '2023-04-11 13:21:14', '2023-04-11 13:21:14', '2023-04-11', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(453, '2023-04-11 13:25:50', '2023-04-11 13:25:50', '2023-04-11', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(454, '2023-04-11 13:28:48', '2023-04-11 13:28:48', '2023-04-11', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(455, '2023-04-11 15:03:02', '2023-04-11 15:03:02', '2023-04-11', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(456, '2023-04-12 13:21:13', '2023-04-12 13:21:13', '2023-04-12', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(457, '2023-04-12 13:22:29', '2023-04-12 13:22:29', '2023-04-12', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(458, '2023-04-12 13:27:04', '2023-04-12 13:27:04', '2023-04-12', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(459, '2023-04-12 13:29:53', '2023-04-12 13:29:53', '2023-04-12', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(460, '2023-04-12 13:34:35', '2023-04-12 13:34:35', '2023-04-12', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Wed', '1'),
(461, '2023-04-13 13:20:07', '2023-04-13 13:20:07', '2023-04-13', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(462, '2023-04-13 13:21:25', '2023-04-13 13:21:25', '2023-04-13', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(463, '2023-04-13 13:23:03', '2023-04-13 13:23:03', '2023-04-13', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(464, '2023-04-13 13:24:09', '2023-04-13 13:24:09', '2023-04-13', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 1, 'Thu', '1'),
(465, '2023-04-13 16:28:07', '2023-04-13 16:28:07', '2023-04-13', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(466, '2023-04-17 13:19:55', '2023-04-17 13:19:55', '2023-04-17', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(467, '2023-04-17 13:23:21', '2023-04-17 13:23:21', '2023-04-17', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(468, '2023-04-17 13:52:23', '2023-04-17 13:52:23', '2023-04-17', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(469, '2023-04-17 13:58:02', '2023-04-17 13:58:02', '2023-04-17', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Mon', '1'),
(470, '2023-04-17 14:22:48', '2023-04-17 14:22:48', '2023-04-17', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, 1, NULL, 0, 'Mon', '1'),
(471, '2023-04-18 13:21:47', '2023-04-18 13:21:47', '2023-04-18', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(472, '2023-04-18 13:38:47', '2023-04-18 13:38:47', '2023-04-18', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(473, '2023-04-18 13:40:01', '2023-04-18 13:40:01', '2023-04-18', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 1, 'Tue', '1'),
(474, '2023-04-18 13:42:56', '2023-04-18 13:42:56', '2023-04-18', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Tue', '1'),
(475, '2023-04-18 13:43:07', '2023-04-18 13:43:07', '2023-04-18', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1'),
(476, '2023-04-19 13:23:18', '2023-04-19 13:23:18', '2023-04-19', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(477, '2023-04-19 13:40:02', '2023-04-19 13:40:02', '2023-04-19', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(478, '2023-04-19 13:55:02', '2023-04-19 13:55:02', '2023-04-19', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(479, '2023-04-19 15:11:23', '2023-04-19 15:11:23', '2023-04-19', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Wed', '1'),
(480, '2023-04-19 15:13:35', '2023-04-19 15:13:35', '2023-04-19', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, -1, NULL, 1, 'Wed', '1'),
(481, '2023-04-20 13:21:11', '2023-04-20 13:21:11', '2023-04-20', 2, NULL, 'sbi_occ_1', NULL, 'NSE:SBIN-EQ', NULL, NULL, 1, NULL, 0, 'Thu', '1'),
(482, '2023-04-20 13:22:04', '2023-04-20 13:22:04', '2023-04-20', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(483, '2023-04-20 13:32:02', '2023-04-20 13:32:02', '2023-04-20', 2, NULL, 'moil_occ_1', NULL, 'NSE:MOIL-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(484, '2023-04-20 14:22:08', '2023-04-20 14:22:08', '2023-04-20', 2, NULL, 'mm_occ_1', NULL, 'NSE:M&M-EQ', NULL, NULL, -1, NULL, 0, 'Thu', '1'),
(485, '2023-04-20 16:45:25', '2023-04-20 16:45:25', '2023-04-20', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Thu', '1'),
(486, '2023-04-21 13:21:06', '2023-04-21 13:21:06', '2023-04-21', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 1, 'Fri', '1'),
(487, '2023-04-21 14:14:05', '2023-04-21 14:14:05', '2023-04-21', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Fri', '1'),
(488, '2023-04-24 13:21:02', '2023-04-24 13:21:02', '2023-04-24', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(489, '2023-04-24 13:22:35', '2023-04-24 13:22:35', '2023-04-24', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 1, 'Mon', '1'),
(490, '2023-04-25 13:19:29', '2023-04-25 13:19:29', '2023-04-25', 3, NULL, 'nmdc_occ_1', NULL, 'NSE:NMDC-EQ', NULL, NULL, 1, NULL, 0, 'Tue', '1'),
(491, '2023-04-25 13:24:03', '2023-04-25 13:24:03', '2023-04-25', 3, NULL, 'ibulhsgfin_occ_1', NULL, 'NSE:IBULHSGFIN-EQ', NULL, NULL, -1, NULL, 0, 'Tue', '1');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_id` text DEFAULT NULL,
  `app_secret` text DEFAULT NULL,
  `access_token` text DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `appid_hash` text DEFAULT NULL,
  `login_status` int(11) DEFAULT NULL,
  `redirect_uri` text DEFAULT NULL,
  `scalping_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `api_id`, `app_secret`, `access_token`, `refresh_token`, `appid_hash`, `login_status`, `redirect_uri`, `scalping_qty`) VALUES
(3, 'Mohammed Nezil', 'nezil@trade.com', NULL, '$2y$10$s1IhYjv485nDWNA5RTuwL.gfCnqD1AG/OfaYAidNxr4n1uEEtODHC', NULL, '2023-02-10 00:34:19', '2024-09-27 21:52:22', 'YM1RTDMPJ0-100', 'VINIZQ6EJ1', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuZnllcnMuaW4iLCJpYXQiOjE3Mjc0Mzk3NDIsImV4cCI6MTcyNzQ4MzQyMiwibmJmIjoxNzI3NDM5NzQyLCJhdWQiOlsieDowIiwieDoxIiwieDoyIiwiZDoxIiwiZDoyIiwieDoxIiwieDowIl0sInN1YiI6ImFjY2Vzc190b2tlbiIsImF0X2hhc2giOiJnQUFBQUFCbTlxTi1XcEZXQU5PVnVreG5yOUxMT3FJSTcwUWYwVVRRQlhDNmZwWmNlOTA4VFlOSXhpS2xhNUQ3amkxNnU4a0w0TDhiZ1o3NjZDUFRPVzRuR3l1THVsQ1I2bHlXbHp0TV85MkZ0YmdycWNqSWNWST0iLCJkaXNwbGF5X25hbWUiOiJNT0hBTU1FRCBORVpJTCIsIm9tcyI6IksxIiwiaHNtX2tleSI6ImU0NTEwYjc5YjEzZjBkZmYwMDUyMWJjMTBiM2I1ZDQ3ZGYzYTMzMDBlNmE2Yzc1YjRiZWZhODdkIiwiZnlfaWQiOiJYTTMyODczIiwiYXBwVHlwZSI6MTAwLCJwb2FfZmxhZyI6Ik4ifQ.onTDNpoJWOCF9JtXYeRML4unwh1JvjCNd21HjU8ySTQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcGkuZnllcnMuaW4iLCJpYXQiOjE3Mjc0Mzk3NDIsImV4cCI6MTcyODY5MzAyMiwibmJmIjoxNzI3NDM5NzQyLCJhdWQiOlsieDowIiwieDoxIiwieDoyIiwiZDoxIiwiZDoyIiwieDoxIiwieDowIl0sInN1YiI6InJlZnJlc2hfdG9rZW4iLCJhdF9oYXNoIjoiZ0FBQUFBQm05cU4tV3BGV0FOT1Z1a3hucjlMTE9xSUk3MFFmMFVUUUJYQzZmcFpjZTkwOFRZTkl4aUtsYTVEN2ppMTZ1OGtMNEw4YmdaNzY2Q1BUT1c0bkd5dUx1bENSNmx5V2x6dE1fOTJGdGJncnFjakljVkk9IiwiZGlzcGxheV9uYW1lIjoiTU9IQU1NRUQgTkVaSUwiLCJvbXMiOiJLMSIsImhzbV9rZXkiOiJlNDUxMGI3OWIxM2YwZGZmMDA1MjFiYzEwYjNiNWQ0N2RmM2EzMzAwZTZhNmM3NWI0YmVmYTg3ZCIsImZ5X2lkIjoiWE0zMjg3MyIsImFwcFR5cGUiOjEwMCwicG9hX2ZsYWciOiJOIn0.XjtfoixpaKuQWj1eiVKRhyBRibLj9M2fyTkZ5e-b_50', 'c0ff00b18c03cd68d43df58f19a93f6aab781fdec595f720accec9f741cea030', NULL, 'https://trade.a2hosted.com/keycode/login_success', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `automations`
--
ALTER TABLE `automations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `automations`
--
ALTER TABLE `automations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=492;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
