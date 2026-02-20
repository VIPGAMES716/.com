-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 25, 2025 at 07:42 PM
-- Server version: 10.11.14-MariaDB-cll-lve
-- PHP Version: 8.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demotrus_kdx`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `role` varchar(32) NOT NULL DEFAULT 'admin',
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `phone`, `email`, `name`, `role`, `password_hash`, `created_at`) VALUES
(1, 'HYPER', '9905954332', NULL, 'Super Admin', 'super', '$2y$10$zzqF8fxrH8t.ZGIyI43EhOhEhEZMkhSi2xh6.CAHVg27G.niNJyPu', '2025-08-14 03:32:21'),
(2, 'YOLO', '7067964902', NULL, 'Admin', 'super', '$2y$10$ify4RNu8HXz9V5F29qq6oe.xuhuGxQSjh.DHTogQame6Lx8qPHtoK', '2025-08-14 03:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `key` varchar(64) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`key`, `value`, `updated_at`) VALUES
('GIFTCODES_ENABLED', '1', '2025-08-14 06:02:15'),
('SITE_MAINTENANCE', '0', '2025-08-14 05:34:21');

-- --------------------------------------------------------

--
-- Table structure for table `bets`
--

CREATE TABLE `bets` (
  `id` int(11) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `game_name` varchar(80) NOT NULL,
  `order_code` varchar(24) NOT NULL,
  `placed_at` datetime NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `net_result` decimal(12,2) NOT NULL,
  `status` enum('win','loss','await') NOT NULL DEFAULT 'await',
  `icon_hint` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bets`
--

INSERT INTO `bets` (`id`, `user_id`, `game_name`, `order_code`, `placed_at`, `amount`, `net_result`, `status`, `icon_hint`) VALUES
(1, '9999999999', 'Bingo Roll', 'S23E4ZM', '2025-08-13 04:21:50', 0.10, -0.10, 'loss', 'dice'),
(2, '9999999999', 'Bingo Roll', '34Y85AK', '2025-08-13 04:20:50', 0.10, -0.10, 'loss', 'shield'),
(3, '9999999999', 'Plinko', 'PLK9Q2', '2025-08-13 02:27:50', 5.00, 8.50, 'win', 'plinko'),
(4, '9999999999', 'Crash', 'CRH7M1', '2025-08-12 04:27:50', 3.00, 0.00, 'await', 'crash');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `user_id` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `method` varchar(50) NOT NULL,
  `txn_id` varchar(100) NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `provider`, `user_id`, `amount`, `method`, `txn_id`, `status`, `created_at`) VALUES
(35, 'Cola', '1234567890', 100.00, 'UPI', 'DP2508160519249943', 'Rejected', '2025-08-16 05:19:24'),
(36, 'Cola', '1234567890', 200.00, 'UPI', 'DP2508160519424915', 'Rejected', '2025-08-16 05:19:42'),
(37, 'Cola', '1234567890', 100.00, 'UPI', 'DP2508161045573158', 'Rejected', '2025-08-16 10:45:57'),
(38, 'Cola', '1234567890', 100.00, 'UPI', 'DP2508161051228296', 'Rejected', '2025-08-16 10:51:22'),
(39, 'Cola', '7067964902', 100.00, 'UPI', 'DP2508161147314285', 'Approved', '2025-08-16 11:47:31'),
(40, 'Cola', '7067964902', 100.00, 'UPI', 'DP2508161153464738', 'Approved', '2025-08-16 11:53:46'),
(41, 'Cola', '7067964902', 200.00, 'UPI', 'DP2508161224176090', 'Rejected', '2025-08-16 12:24:17'),
(42, 'Cola', '1234567890', 100.00, 'UPI', 'DP2508161226016642', 'Rejected', '2025-08-16 12:26:01'),
(43, 'Cola', '1234567890', 101.00, 'UPI', 'DP2508161228183203', 'Rejected', '2025-08-16 12:28:18'),
(44, 'Cola', '1234567890', 101.00, 'UPI', 'DP2508161231135967', 'Approved', '2025-08-16 12:31:13'),
(45, 'Cola', '7067964902', 20000.00, 'UPI', 'DP2508161353447306', 'Rejected', '2025-08-16 13:53:44'),
(46, 'Cola', '7067964902', 2000.00, 'UPI', 'DP2508161354098628', 'Rejected', '2025-08-16 13:54:09'),
(47, 'Cola', '7037620703', 100.00, 'UPI', 'DP2508161359586649', 'Rejected', '2025-08-16 13:59:58'),
(48, 'Cola', '7067964902', 100.00, 'UPI', 'DP2508162221553338', 'Approved', '2025-08-16 22:21:55'),
(49, 'Cola', '9639513088', 300.00, 'UPI', 'DP2508162231598676', 'Rejected', '2025-08-16 22:31:59'),
(50, 'Cola', '1234567890', 200.00, 'UPI', 'DP2508170013234832', 'Rejected', '2025-08-17 00:13:23'),
(51, 'Cola', '9474592447', 100.00, 'UPI', 'DP2508170213196169', 'Rejected', '2025-08-17 02:13:19'),
(52, 'Cola', '1234567890', 100.00, 'UPI', 'DP2508172331535852', 'Rejected', '2025-08-17 23:31:53'),
(53, 'Cola', '1234567890', 100.00, 'UPI', 'DP2508290225327693', 'Rejected', '2025-08-29 02:25:32'),
(54, 'Cola', '7067964902', 100.00, 'UPI', 'DP2508291523095757', 'Rejected', '2025-08-29 15:23:09'),
(55, 'Cola', '7067964902', 100.00, 'UPI', 'DP2508301315371508', 'Rejected', '2025-08-30 13:15:37'),
(56, 'Cola', '+916564767646', 500.00, 'UPI', 'DP2508301552361502', 'Rejected', '2025-08-30 15:52:36'),
(57, 'Cola', '7067964902', 100.00, 'UPI', 'DP2508301706264981', 'Rejected', '2025-08-30 17:06:26'),
(58, 'Cola', '1234567898', 2000.00, 'UPI', 'DP2508301725223298', 'Approved', '2025-08-30 17:25:22'),
(59, 'Cola', '7037620703', 200.00, 'UPI', 'DP2508301812435422', 'Rejected', '2025-08-30 18:12:43'),
(60, 'Cola', '1234567898', 200.00, 'UPI', 'DP2508301845064905', 'Rejected', '2025-08-30 18:45:06'),
(61, 'Cola', '7467074674', 300.00, 'UPI', 'DP2508302248399447', 'Rejected', '2025-08-30 22:48:39'),
(62, 'Cola', '9999999999', 100.00, 'UPI', 'DP2508302257488436', 'Approved', '2025-08-30 22:57:48'),
(63, 'Cola', '7037169933', 500.00, 'UPI', 'DP2508302336204222', 'Approved', '2025-08-30 23:36:20'),
(64, 'Cola', '9068683948', 180.00, 'UPI', 'DP2509010752142058', 'Pending', '2025-09-01 07:52:14'),
(65, 'Cola', '9068683948', 180.00, 'UPI', 'DP2509010753106187', 'Pending', '2025-09-01 07:53:10'),
(66, 'Cola', '9068683948', 120.00, 'UPI', 'DP2509010756321095', 'Pending', '2025-09-01 07:56:32'),
(67, 'Cola', '7091158973', 5000.00, 'UPI', 'DP2509011520137668', 'Approved', '2025-09-01 15:20:13'),
(68, 'Cola', '7037169933', 200.00, 'UPI', 'DP2509011934025412', 'Pending', '2025-09-01 19:34:02'),
(69, 'Cola', '7037169933', 500.00, 'UPI', 'DP2509011934543345', 'Pending', '2025-09-01 19:34:54'),
(70, 'Cola', '8101135036', 500.00, 'UPI', 'DP2509011937089770', 'Pending', '2025-09-01 19:37:08'),
(71, 'Cola', '8101135036', 500.00, 'UPI', 'DP2509011938065408', 'Pending', '2025-09-01 19:38:06'),
(72, 'Cola', '6205983320', 300.00, 'UPI', 'DP2509012159474482', 'Pending', '2025-09-01 21:59:47'),
(73, 'Cola', '6205983320', 200.00, 'UPI', 'DP2509012201013391', 'Pending', '2025-09-01 22:01:01'),
(74, 'Cola', '6205983320', 200.00, 'UPI', 'DP2509012201459722', 'Pending', '2025-09-01 22:01:45'),
(75, 'Cola', '6205983320', 300.00, 'UPI', 'DP2509012203314477', 'Approved', '2025-09-01 22:03:31'),
(76, 'Cola', '9756643540', 500.00, 'UPI', 'DP2509012207458092', 'Pending', '2025-09-01 22:07:45'),
(77, 'Cola', '8595371644', 500.00, 'UPI', 'DP2509012319439613', 'Pending', '2025-09-01 23:19:43'),
(78, 'Cola', '8595371644', 500.00, 'UPI', 'DP2509012320133955', 'Pending', '2025-09-01 23:20:13'),
(79, 'Cola', '8595371644', 200.00, 'UPI', 'DP2509012322204127', 'Rejected', '2025-09-01 23:22:20'),
(80, 'Cola', '8595371644', 200.00, 'UPI', 'DP2509012322377585', 'Pending', '2025-09-01 23:22:37'),
(81, 'Cola', '8595371644', 200.00, 'UPI', 'DP2509012322587803', 'Rejected', '2025-09-01 23:22:58'),
(82, 'Cola', '8595371644', 200.00, 'UPI', 'DP2509012323323054', 'Rejected', '2025-09-01 23:23:32'),
(83, 'Cola', '1234567898', 200.00, 'UPI', 'DP2509020011011521', 'Rejected', '2025-09-02 00:11:01'),
(84, 'Cola', '+916564767646', 2000.00, 'UPI', 'DP2509020040024989', 'Pending', '2025-09-02 00:40:02'),
(85, 'Cola', '7037169933', 200.00, 'UPI', 'DP2509020151367532', 'Pending', '2025-09-02 01:51:36'),
(86, 'Cola', '7037169933', 200.00, 'UPI', 'DP2509020153058139', 'Pending', '2025-09-02 01:53:05'),
(87, 'Cola', '1234567898', 200.00, 'UPI', 'DP2509020153501226', 'Pending', '2025-09-02 01:53:50'),
(88, 'Cola', '7037169933', 300.00, 'UPI', 'DP2509020240393254', 'Pending', '2025-09-02 02:40:39'),
(89, 'Cola', '7037169933', 300.00, 'UPI', 'DP2509021034524732', 'Pending', '2025-09-02 10:34:52'),
(90, 'Cola', '8668794042', 100.00, 'UPI', 'DP2509021132573081', 'Pending', '2025-09-02 11:32:57'),
(91, 'Cola', '8668794042', 100.00, 'UPI', 'DP2509021134361983', 'Pending', '2025-09-02 11:34:36'),
(92, 'Cola', '9475907870', 100.00, 'UPI', 'DP2509021137172484', 'Pending', '2025-09-02 11:37:17'),
(93, 'Cola', '1234567898', 1000.00, 'UPI', 'DP2509021201519038', 'Pending', '2025-09-02 12:01:51'),
(94, 'Cola', '8652621443', 200.00, 'UPI', 'DP2509021310522870', 'Pending', '2025-09-02 13:10:52'),
(95, 'Cola', '8652621443', 100.00, 'UPI', 'DP2509021405599337', 'Pending', '2025-09-02 14:05:59'),
(96, 'Cola', '8652621443', 200.00, 'UPI', 'DP2509021406288662', 'Pending', '2025-09-02 14:06:28'),
(97, 'Cola', '8652621443', 200.00, 'UPI', 'DP2509021406487009', 'Pending', '2025-09-02 14:06:48'),
(98, 'Cola', '8652621443', 150.00, 'UPI', 'DP2509021407096425', 'Pending', '2025-09-02 14:07:09'),
(99, 'Cola', '8652621443', 300.00, 'UPI', 'DP2509021407291237', 'Pending', '2025-09-02 14:07:29'),
(100, 'Cola', '8652621443', 200.00, 'UPI', 'DP2509021408061870', 'Pending', '2025-09-02 14:08:06'),
(101, 'Cola', '8652621443', 300.00, 'UPI', 'DP2509021408262076', 'Pending', '2025-09-02 14:08:26'),
(102, 'Cola', '8652621443', 100.00, 'UPI', 'DP2509021408538071', 'Pending', '2025-09-02 14:08:53'),
(103, 'Cola', '8652621443', 200.00, 'UPI', 'DP2509021409102842', 'Pending', '2025-09-02 14:09:10'),
(104, 'Cola', '8652621443', 200.00, 'UPI', 'DP2509021409388250', 'Pending', '2025-09-02 14:09:38'),
(105, 'Cola', '8652621443', 200.00, 'UPI', 'DP2509021411207512', 'Pending', '2025-09-02 14:11:20'),
(106, 'Cola', '8652621443', 100.00, 'UPI', 'DP2509021411593418', 'Pending', '2025-09-02 14:11:59'),
(107, 'Cola', '8652621443', 200.00, 'UPI', 'DP2509021412157279', 'Pending', '2025-09-02 14:12:15'),
(108, 'Cola', '8652621443', 300.00, 'UPI', 'DP2509021414478322', 'Pending', '2025-09-02 14:14:47'),
(109, 'Cola', '8652621443', 300.00, 'UPI', 'DP2509021420504415', 'Pending', '2025-09-02 14:20:50'),
(110, 'Cola', '8652621443', 300.00, 'UPI', 'DP2509021427364201', 'Pending', '2025-09-02 14:27:36'),
(111, 'Cola', '1234567898', 1000.00, 'UPI', 'DP2509021438271580', 'Pending', '2025-09-02 14:38:27'),
(112, 'Cola', '7757905980', 100.00, 'UPI', 'DP2509021509184138', 'Rejected', '2025-09-02 15:09:18'),
(113, 'Cola', '7860941019', 100.00, 'UPI', 'DP2509021519481364', 'Pending', '2025-09-02 15:19:48'),
(114, 'Cola', '7757905980', 200.00, 'UPI', 'DP2509021538589841', 'Approved', '2025-09-02 15:38:58'),
(115, 'Cola', '1234567898', 200.00, 'UPI', 'DP2509021957576180', 'Pending', '2025-09-02 19:57:57'),
(116, 'Cola', '+919212905139', 100.00, 'UPI', 'DP2509022021485240', 'Pending', '2025-09-02 20:21:48'),
(117, 'Cola', '1234567898', 100.00, 'UPI', 'DP2509022053567042', 'Pending', '2025-09-02 20:53:56'),
(118, 'Cola', '1234567898', 100.00, 'UPI', 'DP2509022054199849', 'Pending', '2025-09-02 20:54:19'),
(119, 'Cola', '6281674651', 100.00, 'UPI', 'DP2509022056292819', 'Pending', '2025-09-02 20:56:29'),
(120, 'Cola', '6281674651', 100.00, 'UPI', 'DP2509022057309797', 'Pending', '2025-09-02 20:57:30'),
(121, 'Cola', '6281674651', 200.00, 'UPI', 'DP2509022107445349', 'Approved', '2025-09-02 21:07:44'),
(122, 'Cola', '8148214945', 100.00, 'UPI', 'DP2509022306074474', 'Pending', '2025-09-02 23:06:07'),
(123, 'Cola', '8148214945', 100.00, 'UPI', 'DP2509022307524053', 'Pending', '2025-09-02 23:07:52'),
(124, 'Cola', '8148214945', 200.00, 'UPI', 'DP2509022308181573', 'Pending', '2025-09-02 23:08:18'),
(125, 'Cola', '9502700860', 1000.00, 'UPI', 'DP2509030234446330', 'Pending', '2025-09-03 02:34:44'),
(126, 'Cola', '9502700860', 1000.00, 'UPI', 'DP2509030235513736', 'Pending', '2025-09-03 02:35:51'),
(127, 'Cola', '9502700860', 1000.00, 'UPI', 'DP2509030236131163', 'Pending', '2025-09-03 02:36:13'),
(128, 'Cola', '7974133647', 100.00, 'UPI', 'DP2509030626297241', 'Pending', '2025-09-03 06:26:29'),
(129, 'Cola', '9653976319', 2000.00, 'UPI', 'DP2509030858206920', 'Pending', '2025-09-03 08:58:20'),
(130, 'Cola', '6378541805', 100.00, 'UPI', 'DP2509031023445766', 'Pending', '2025-09-03 10:23:44'),
(131, 'Cola', '6378541805', 100.00, 'UPI', 'DP2509031027273127', 'Pending', '2025-09-03 10:27:27'),
(132, 'Cola', '6393093553', 500.00, 'UPI', 'DP2509031301324121', 'Pending', '2025-09-03 13:01:32'),
(133, 'Cola', '+917803880239', 100.00, 'UPI', 'DP2509031434032239', 'Pending', '2025-09-03 14:34:03'),
(134, 'Cola', '9023034013', 100.00, 'UPI', 'DP2509031514136700', 'Pending', '2025-09-03 15:14:13'),
(135, 'Cola', '+917803880239', 100.00, 'UPI', 'DP2509031723089316', 'Pending', '2025-09-03 17:23:08'),
(136, 'Cola', '+917803880239', 100.00, 'UPI', 'DP2509031724431137', 'Pending', '2025-09-03 17:24:43'),
(137, 'Cola', '+917803880239', 100.00, 'UPI', 'DP2509031727245414', 'Pending', '2025-09-03 17:27:24'),
(138, 'Cola', '+917803880239', 100.00, 'UPI', 'DP2509031728094398', 'Pending', '2025-09-03 17:28:09'),
(139, 'Cola', '+917803880239', 100.00, 'UPI', 'DP2509031730328439', 'Pending', '2025-09-03 17:30:32'),
(140, 'Cola', '7879361147', 100.00, 'UPI', 'DP2509031745341540', 'Approved', '2025-09-03 17:45:34'),
(141, 'Cola', '7039848729', 1000.00, 'UPI', 'DP2509031815295690', 'Approved', '2025-09-03 18:15:29'),
(142, 'Cola', '+917428521979', 100.00, 'UPI', 'DP2509031825463306', 'Pending', '2025-09-03 18:25:46'),
(143, 'Cola', '+917428521979', 5000.00, 'UPI', 'DP2509031826118995', 'Pending', '2025-09-03 18:26:11'),
(144, 'Cola', '9692870075', 100000.00, 'UPI', 'DP2509031838252659', 'Pending', '2025-09-03 18:38:25'),
(145, 'Cola', '9653976319', 2000.00, 'UPI', 'DP2509031838382119', 'Pending', '2025-09-03 18:38:38'),
(146, 'Cola', '9653976319', 20000.00, 'UPI', 'DP2509031838523383', 'Pending', '2025-09-03 18:38:52'),
(147, 'Cola', '9653976319', 20000.00, 'UPI', 'DP2509031838592374', 'Pending', '2025-09-03 18:38:59'),
(148, 'Cola', '7037169933', 5000.00, 'UPI', 'DP2509031854506732', 'Approved', '2025-09-03 18:54:50'),
(149, 'Cola', '9631232152', 500.00, 'UPI', 'DP2509031857329586', 'Pending', '2025-09-03 18:57:32'),
(150, 'Cola', '9631232152', 500.00, 'UPI', 'DP2509031857559360', 'Pending', '2025-09-03 18:57:55'),
(151, 'Cola', '8859501057', 100.00, 'UPI', 'DP2509031902359452', 'Pending', '2025-09-03 19:02:35'),
(152, 'Cola', '+917428521979', 100.00, 'UPI', 'DP2509032031285191', 'Pending', '2025-09-03 20:31:28'),
(153, 'Cola', '+917428521979', 100.00, 'UPI', 'DP2509032032411883', 'Pending', '2025-09-03 20:32:41'),
(154, 'Cola', '7566635523', 100.00, 'UPI', 'DP2509032033336954', 'Pending', '2025-09-03 20:33:33'),
(155, 'Cola', '+917428521979', 100.00, 'UPI', 'DP2509032033551400', 'Approved', '2025-09-03 20:33:55'),
(156, 'Cola', '+917428521979', 100.00, 'UPI', 'DP2509032036359409', 'Pending', '2025-09-03 20:36:35'),
(157, 'Cola', '+919175842554', 100.00, 'UPI', 'DP2509032332372704', 'Pending', '2025-09-03 23:32:37'),
(158, 'Cola', '+919175842554', 100.00, 'UPI', 'DP2509032336428977', 'Pending', '2025-09-03 23:36:42'),
(159, 'Cola', '7566635523', 100.00, 'UPI', 'DP2509040903343474', 'Pending', '2025-09-04 09:03:34'),
(160, 'Cola', '7566635523', 100.00, 'UPI', 'DP2509040904034991', 'Pending', '2025-09-04 09:04:03'),
(161, 'Cola', '7307606195', 100.00, 'UPI', 'DP2509041202296708', 'Pending', '2025-09-04 12:02:29'),
(162, 'Cola', '9931413017', 200.00, 'UPI', 'DP2509041202435637', 'Pending', '2025-09-04 12:02:43'),
(163, 'Cola', '8929201456', 500.00, 'UPI', 'DP2509041207412011', 'Pending', '2025-09-04 12:07:41'),
(164, 'Cola', '8929201456', 500.00, 'UPI', 'DP2509041210071509', 'Pending', '2025-09-04 12:10:07'),
(165, 'Cola', '9643087266', 100.00, 'UPI', 'DP2509041210319986', 'Pending', '2025-09-04 12:10:31'),
(166, 'Cola', '8929201456', 500.00, 'UPI', 'DP2509041211388577', 'Pending', '2025-09-04 12:11:38'),
(167, 'Cola', '8827065605', 1000.00, 'UPI', 'DP2509041225022487', 'Pending', '2025-09-04 12:25:02'),
(168, 'Cola', '8929201456', 500.00, 'UPI', 'DP2509041227337900', 'Pending', '2025-09-04 12:27:33'),
(169, 'Cola', '8929201456', 500.00, 'UPI', 'DP2509041229077455', 'Pending', '2025-09-04 12:29:07'),
(170, 'Cola', '8827065605', 1000.00, 'UPI', 'DP2509041233414981', 'Approved', '2025-09-04 12:33:41'),
(171, 'Cola', '8929201456', 500.00, 'UPI', 'DP2509041239334943', 'Pending', '2025-09-04 12:39:33'),
(172, 'Cola', '8929201456', 499.00, 'UPI', 'DP2509041245157659', 'Pending', '2025-09-04 12:45:15'),
(173, 'Cola', '8827065605', 2000.00, 'UPI', 'DP2509041251421551', 'Approved', '2025-09-04 12:51:42'),
(174, 'Cola', '6262458701', 500.00, 'UPI', 'DP2509041309192232', 'Approved', '2025-09-04 13:09:19'),
(175, 'Cola', '+917428521979', 10000.00, 'UPI', 'DP2509041324283700', 'Pending', '2025-09-04 13:24:28'),
(176, 'Cola', '9302517670', 100.00, 'UPI', 'DP2509041327018487', 'Pending', '2025-09-04 13:27:01'),
(177, 'Cola', '8929201456', 500.00, 'UPI', 'DP2509041338475134', 'Pending', '2025-09-04 13:38:47'),
(178, 'Cola', '7263955291', 100.00, 'UPI', 'DP2509041343329807', 'Pending', '2025-09-04 13:43:32'),
(179, 'Cola', '6303307030', 100.00, 'UPI', 'DP2509041401365993', 'Pending', '2025-09-04 14:01:36'),
(180, 'Cola', '1234567898', 200.00, 'UPI', 'DP2509041458359335', 'Pending', '2025-09-04 14:58:35'),
(181, 'Cola', '9309210073', 1000.00, 'UPI', 'DP2509041509252933', 'Pending', '2025-09-04 15:09:25'),
(182, 'Cola', '7742631088', 100.00, 'UPI', 'DP2509041554463615', 'Pending', '2025-09-04 15:54:46'),
(183, 'Cola', '8827065605', 2000.00, 'UPI', 'DP2509041623226379', 'Approved', '2025-09-04 16:23:22'),
(184, 'Cola', '8974154166', 5003.00, 'UPI', 'DP2509041631269435', 'Pending', '2025-09-04 16:31:26'),
(185, 'Cola', '9303343945', 100.00, 'UPI', 'DP2509041846331523', 'Pending', '2025-09-04 18:46:33'),
(186, 'Cola', '9425731196', 100.00, 'UPI', 'DP2509041924182431', 'Pending', '2025-09-04 19:24:18'),
(187, 'Cola', '7408370171', 100.00, 'UPI', 'DP2509042039353595', 'Pending', '2025-09-04 20:39:35'),
(188, 'Cola', '+917803880239', 100.00, 'UPI', 'DP2509042100279279', 'Pending', '2025-09-04 21:00:27'),
(189, 'Cola', '+917803880239', 500.00, 'UPI', 'DP2509042211504445', 'Pending', '2025-09-04 22:11:50'),
(190, 'Cola', '+917803880239', 100.00, 'UPI', 'DP2509042212515127', 'Pending', '2025-09-04 22:12:51'),
(191, 'Cola', '9146004050', 100.00, 'UPI', 'DP2509042229284987', 'Pending', '2025-09-04 22:29:28'),
(192, 'Cola', '7701868680', 100.00, 'UPI', 'DP2509050208471564', 'Pending', '2025-09-05 02:08:47'),
(193, 'Cola', '7701868680', 100.00, 'UPI', 'DP2509050209085169', 'Pending', '2025-09-05 02:09:08'),
(194, 'Cola', '7701868680', 2000.00, 'UPI', 'DP2509050209379062', 'Pending', '2025-09-05 02:09:37'),
(195, 'Cola', '7701868680', 100.00, 'UPI', 'DP2509050209491770', 'Pending', '2025-09-05 02:09:49'),
(196, 'Cola', '6351101256', 100.00, 'UPI', 'DP2509050238169275', 'Pending', '2025-09-05 02:38:16'),
(197, 'Cola', '6351101256', 100.00, 'UPI', 'DP2509050238464909', 'Pending', '2025-09-05 02:38:46'),
(198, 'Cola', '9996917295', 40000.00, 'UPI', 'DP2509050336306035', 'Approved', '2025-09-05 03:36:30'),
(199, 'Cola', '9006258781', 100.00, 'UPI', 'DP2509050552028500', 'Pending', '2025-09-05 05:52:02'),
(200, 'Cola', '9775436603', 100.00, 'UPI', 'DP2509050822099344', 'Pending', '2025-09-05 08:22:09'),
(201, 'Cola', '6378541805', 100.00, 'UPI', 'DP2509051018229180', 'Pending', '2025-09-05 10:18:23'),
(202, 'Cola', '7611141478', 100.00, 'UPI', 'DP2509051313267901', 'Pending', '2025-09-05 13:13:26'),
(203, 'Cola', '+919982215821', 100.00, 'UPI', 'DP2509051317393745', 'Pending', '2025-09-05 13:17:39'),
(204, 'Cola', '8209122172', 200.00, 'UPI', 'DP2509051332437903', 'Pending', '2025-09-05 13:32:43'),
(205, 'Cola', '9674225560', 100.00, 'UPI', 'DP2509051451144597', 'Pending', '2025-09-05 14:51:14'),
(206, 'Cola', '9674225560', 100.00, 'UPI', 'DP2509051452358497', 'Approved', '2025-09-05 14:52:35'),
(207, 'Cola', '9674225560', 100.00, 'UPI', 'DP2509051456356137', 'Pending', '2025-09-05 14:56:35'),
(208, 'Cola', '9714878934', 100.00, 'UPI', 'DP2509051553017828', 'Approved', '2025-09-05 15:53:01'),
(209, 'Cola', '8115644275', 500.00, 'UPI', 'DP2509051713583253', 'Approved', '2025-09-05 17:13:58'),
(210, 'Cola', '8273850856', 100.00, 'UPI', 'DP2509051829405909', 'Pending', '2025-09-05 18:29:40'),
(211, 'Cola', '8273850856', 100.00, 'UPI', 'DP2509051830049294', 'Pending', '2025-09-05 18:30:04'),
(212, 'Cola', '8273850856', 200.00, 'UPI', 'DP2509051830122930', 'Pending', '2025-09-05 18:30:12'),
(213, 'Cola', '8273850856', 100.00, 'UPI', 'DP2509051830195492', 'Pending', '2025-09-05 18:30:19'),
(214, 'Cola', '7016968044', 500.00, 'UPI', 'DP2509052355098536', 'Pending', '2025-09-05 23:55:09'),
(215, 'Cola', '7016968044', 500.00, 'UPI', 'DP2509052355438360', 'Pending', '2025-09-05 23:55:43'),
(216, 'Cola', '7016968044', 100.00, 'UPI', 'DP2509052359135757', 'Pending', '2025-09-05 23:59:13'),
(217, 'Cola', '9674225560', 400.00, 'UPI', 'DP2509060045251396', 'Pending', '2025-09-06 00:45:25'),
(218, 'Cola', '9674225560', 400.00, 'UPI', 'DP2509060045558321', 'Pending', '2025-09-06 00:45:55'),
(219, 'Cola', '9674225560', 400.00, 'UPI', 'DP2509060046465503', 'Pending', '2025-09-06 00:46:46'),
(220, 'Cola', '9674225560', 400.00, 'UPI', 'DP2509060051167264', 'Pending', '2025-09-06 00:51:16'),
(221, 'Cola', '9674225560', 400.00, 'UPI', 'DP2509060106404545', 'Approved', '2025-09-06 01:06:40'),
(222, 'Cola', '+919903337354', 100.00, 'UPI', 'DP2509060149337891', 'Pending', '2025-09-06 01:49:33'),
(223, 'Cola', '9303343945', 100.00, 'UPI', 'DP2509060750552868', 'Pending', '2025-09-06 07:50:55'),
(224, 'Cola', '1234567898', 2000.00, 'UPI', 'DP2509061142323898', 'Pending', '2025-09-06 11:42:32'),
(225, 'Cola', '7069895461', 100.00, 'UPI', 'DP2509061219281944', 'Pending', '2025-09-06 12:19:28'),
(226, 'Cola', '9674225560', 600.00, 'UPI', 'DP2509061225485366', 'Pending', '2025-09-06 12:25:48'),
(227, 'Cola', '9674225560', 600.00, 'UPI', 'DP2509061228034064', 'Approved', '2025-09-06 12:28:03'),
(228, 'Cola', '9669814173', 1000.00, 'UPI', 'DP2509061230453721', 'Rejected', '2025-09-06 12:30:45'),
(229, 'Cola', '9669814173', 500.00, 'UPI', 'DP2509061313415348', 'Rejected', '2025-09-06 13:13:41');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `title` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `image_url` varchar(255) DEFAULT NULL,
  `category` varchar(32) DEFAULT 'Arcade',
  `external_id` varchar(64) DEFAULT NULL,
  `online_count` int(11) DEFAULT 0,
  `play_url` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `slug`, `title`, `enabled`, `created_at`, `image_url`, `category`, `external_id`, `online_count`, `play_url`) VALUES
(75, 'plinko', 'plinko', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_plinko.png', 'Arcade', NULL, 500, NULL),
(76, 'hot-mines', 'hotmines', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_hot-mines.png', 'Arcade', NULL, 500, NULL),
(77, 'lucky-mines', 'luckymines', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_lucky-mines.png', 'Arcade', NULL, 500, NULL),
(78, 'squid-game', 'squidgame', 1, '2025-08-30 08:06:23', 'https://wuttsghdijsbbsh.yrehdjsfiafkjgkjgfsasc.yachts/images/squid-game.png', 'Arcade', NULL, 500, NULL),
(79, 'ballonix', 'ballonix', 1, '2025-08-30 08:06:23', 'https://wuttsghdijsbbsh.yrehdjsfiafkjgkjgfsasc.yachts/images/ballonix.png', 'Arcade', NULL, 500, NULL),
(80, 'new-hilo', 'newhilo', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_new-hilo.png', 'Arcade', NULL, 500, NULL),
(81, 'bubbles', 'bubbles', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_bubbles.png', 'Arcade', NULL, 500, NULL),
(82, 'plinko-aztec', 'plinkoaztec', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_plinko-aztec.png', 'Arcade', NULL, 500, NULL),
(83, 'platform-mines', 'platformmines', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_platform-mines.png', 'Arcade', NULL, 500, NULL),
(84, 'roulette', 'roulette', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_roulette.png', 'Arcade', NULL, 500, NULL),
(85, 'keno', 'keno', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_keno.png', 'Arcade', NULL, 500, NULL),
(86, 'penalty-unlimited', 'penaltyunlimited', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_penalty-unlimited.png', 'Arcade', NULL, 500, NULL),
(87, 'triple', 'triple', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_triple.png', 'Arcade', NULL, 500, NULL),
(88, 'crash', 'crash', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_crash.png', 'Arcade', NULL, 500, NULL),
(89, 'cryptos', 'cryptos', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_cryptos.png', 'Arcade', NULL, 500, NULL),
(90, 'diver', 'diver', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_diver.png', 'Arcade', NULL, 500, NULL),
(91, 'new-double', 'newdouble', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_new-double.png', 'Arcade', NULL, 500, NULL),
(92, 'sugar-daddy', 'sugardaddy', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_sugar-daddy.png', 'Arcade', NULL, 500, NULL),
(93, 'robo-dice', 'robodice', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_robo-dice.png', 'Arcade', NULL, 500, NULL),
(94, 'coinflip', 'coinflip', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_coinflip.png', 'Arcade', NULL, 500, NULL),
(95, 'stairs', 'stairs', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_stairs.png', 'Arcade', NULL, 500, NULL),
(96, 'hamster-run', 'hamsterrun', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_hamster-run.png', 'Arcade', NULL, 500, NULL),
(97, 'forest-fortune-v1', 'forestfortunev1', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_forest-arrow.png', 'Arcade', NULL, 500, NULL),
(98, 'goblin-tower', 'goblintower', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_goblin-tower.png', 'Arcade', NULL, 500, NULL),
(99, 'joker-poker', 'jokerpoker', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_joker-poker.png', 'Arcade', NULL, 500, NULL),
(100, 'aviafly', 'aviafly', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_aviafly.png', 'Arcade', NULL, 500, NULL),
(101, 'tower', 'tower', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_tower.png', 'Arcade', NULL, 500, NULL),
(102, 'wheel', 'wheel', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_wheel.png', 'Arcade', NULL, 500, NULL),
(103, 'limbo', 'limbo', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_limbo.png', 'Arcade', NULL, 500, NULL),
(104, 'jogo-do-bicho', 'jogodobicho', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_jogo-do-bicho.png', 'Arcade', NULL, 500, NULL),
(105, 'chicken-road', 'chickenroad', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_chicken-road.png', 'Chicken road ', NULL, 500, NULL),
(106, 'chicken-road-two', 'chickenroadtwo', 1, '2025-08-30 08:06:23', 'https://icons.inout.games/408_544/io_chicken-road-two.png', 'Chicken road ', NULL, 500, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_categories`
--

CREATE TABLE `game_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lot_bets`
--

CREATE TABLE `lot_bets` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `lottery_id` int(11) NOT NULL,
  `numbers_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`numbers_json`)),
  `stake` decimal(12,2) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `status` enum('placed','won','lost','void') NOT NULL DEFAULT 'placed',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lot_bets`
--

INSERT INTO `lot_bets` (`id`, `user_id`, `lottery_id`, `numbers_json`, `stake`, `total`, `status`, `created_at`) VALUES
(1, '1234567890', 1, '[1,4,12,15,17]', 4.00, 20.00, 'placed', '2025-08-12 22:13:27'),
(2, '1234567890', 2, '[6,8,11,14,19]', 1.00, 5.00, 'placed', '2025-08-12 22:13:43'),
(3, '7067964902', 1, '[3,6,9,15,17]', 100.00, 500.00, 'placed', '2025-08-13 05:01:36'),
(4, '1234567890', 3, '[3,7,10,15,18]', 5.00, 25.00, 'placed', '2025-08-13 06:47:38'),
(5, '1234567890', 6, '[1,5,8,9,16]', 10.00, 50.00, 'placed', '2025-08-13 06:52:54'),
(6, '7067964902', 5, '[3,4,6,13,18]', 10.00, 50.00, 'placed', '2025-08-15 08:33:38'),
(7, '7067964902', 6, '[5,8,12,17,20]', 10.00, 50.00, 'placed', '2025-08-15 08:34:01'),
(8, '1234567890', 5, '[3,4,12,17,20]', 10.00, 50.00, 'placed', '2025-08-15 08:40:19'),
(9, '9999999999', 8, '[3,12,14,18,20]', 10.00, 50.00, 'placed', '2025-08-30 18:41:40'),
(10, '9244994919', 5, '[1,5,7,16,18]', 1571618.00, 7858090.00, 'placed', '2025-09-01 09:15:09'),
(11, '9244994919', 5, '[1,5,7,16,18]', 1571618.00, 7858090.00, 'placed', '2025-09-01 09:15:10'),
(12, '9244994919', 5, '[7,8,14,15,20]', 78141520.00, 390707600.00, 'placed', '2025-09-01 09:15:45'),
(13, '7870078843', 5, '[1,2,3,4,5]', 10.00, 50.00, 'placed', '2025-09-05 19:04:11'),
(14, '7870078843', 5, '[6,7,8,9,10]', 50.00, 250.00, 'placed', '2025-09-05 19:04:29'),
(15, '7870078843', 7, '[5,6,7,8,9]', 100.00, 500.00, 'placed', '2025-09-05 19:04:52'),
(16, '7870078843', 8, '[1,2,3,4,5]', 500.00, 2500.00, 'placed', '2025-09-05 19:06:09'),
(17, '7870078843', 7, '[1,2,3,4,5]', 500.00, 2500.00, 'placed', '2025-09-05 19:06:26'),
(18, '7870078843', 7, '[2,3,5,6,7]', 500.00, 2500.00, 'placed', '2025-09-05 19:06:38'),
(19, '7043522872', 5, '[2,4,10,16,17]', 24101617.00, 120508085.00, 'placed', '2025-09-05 21:10:18'),
(20, '7043522872', 5, '[3,4,12,14,20]', 34121420.00, 170607100.00, 'placed', '2025-09-05 21:10:59'),
(21, '7069895461', 8, '[6,7,10,11,16]', 28.00, 140.00, 'placed', '2025-09-06 06:52:32'),
(22, '7069895461', 8, '[6,7,10,11,16]', 28.00, 140.00, 'placed', '2025-09-06 06:52:33'),
(23, '7069895461', 8, '[5,7,11,13,20]', 8000.00, 40000.00, 'placed', '2025-09-06 06:52:51');

-- --------------------------------------------------------

--
-- Table structure for table `lot_lotteries`
--

CREATE TABLE `lot_lotteries` (
  `id` int(11) NOT NULL,
  `code` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `jackpot` int(11) NOT NULL DEFAULT 0,
  `cycle_secs` int(11) NOT NULL DEFAULT 10800,
  `next_start_ts` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lot_lotteries`
--

INSERT INTO `lot_lotteries` (`id`, `code`, `name`, `jackpot`, `cycle_secs`, `next_start_ts`, `is_active`) VALUES
(5, 'q5_morning', 'Quick-5 Morning', 200000, 5400, 1755073366, 1),
(6, 'q5_noon', 'Quick-5 Noon', 300000, 10800, 1755078766, 1),
(7, 'q5_evening', 'Quick-5 Evening', 500000, 16200, 1755084166, 1),
(8, 'q5_midnight', 'Quick-5 Midnight', 1000000, 21600, 1755089566, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lot_passes`
--

CREATE TABLE `lot_passes` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `plan` varchar(40) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `starts_at` date NOT NULL,
  `ends_at` date NOT NULL,
  `status` enum('active','expired','cancelled') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `reward_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `max_uses` int(11) DEFAULT NULL,
  `per_user_limit` int(11) NOT NULL DEFAULT 1,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `code`, `reward_amount`, `max_uses`, `per_user_limit`, `starts_at`, `ends_at`, `is_active`, `created_at`) VALUES
(8, 'WELCOME50', 50.00, 10, 1, NULL, NULL, 1, '2025-08-15 23:51:20'),
(9, '1', 1000.00, 1, 1, '2025-09-03 02:40:00', NULL, 1, '2025-09-02 21:10:39'),
(10, 'Giftcode', 1000.00, 1, 1, '2025-09-03 02:41:00', '2025-09-03 02:41:00', 1, '2025-09-02 21:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `promo_redemptions`
--

CREATE TABLE `promo_redemptions` (
  `id` int(11) NOT NULL,
  `code_id` int(11) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `ip_address` varchar(64) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promo_redemptions`
--

INSERT INTO `promo_redemptions` (`id`, `code_id`, `user_id`, `amount`, `ip_address`, `created_at`) VALUES
(8, 8, '1234567890', 50.00, '2409:40d0:10ca:9ab0:fdd9:f08f:47ca:9ab2', '2025-08-15 23:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` int(11) NOT NULL,
  `referrer_id` varchar(64) NOT NULL,
  `referred_id` varchar(64) DEFAULT NULL,
  `referred_mobile` varchar(32) DEFAULT NULL,
  `status` enum('pending','paid','failed') DEFAULT 'pending',
  `amount` decimal(12,2) DEFAULT 0.00,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `referrals`
--

INSERT INTO `referrals` (`id`, `referrer_id`, `referred_id`, `referred_mobile`, `status`, `amount`, `note`, `created_at`) VALUES
(4, '1234567890', '1234567891', NULL, 'paid', 50.00, 'signup bonus', '2025-08-15 23:52:26'),
(5, '7067964902', '9756669856', NULL, 'paid', 50.00, 'signup bonus', '2025-08-16 06:28:36'),
(6, '7067964902', '7037620703', NULL, 'paid', 50.00, 'signup bonus', '2025-08-16 08:28:42'),
(7, '7037620703', '7037136910', NULL, 'paid', 50.00, 'signup bonus', '2025-08-16 08:48:40'),
(8, '7067964902', '9639513088', NULL, 'paid', 50.00, 'signup bonus', '2025-08-16 16:47:00'),
(9, '7067964902', '9012007105', NULL, 'paid', 50.00, 'signup bonus', '2025-08-16 20:35:25'),
(10, '7067964902', '9474592447', NULL, 'paid', 50.00, 'signup bonus', '2025-08-16 20:41:33'),
(11, '7067964902', '8529100034', NULL, 'paid', 50.00, 'signup bonus', '2025-08-17 14:30:19'),
(12, '1234567898', '9599100513', NULL, 'paid', 50.00, 'signup bonus', '2025-08-30 12:09:44'),
(13, '9599100513', '9202669594', NULL, 'paid', 50.00, 'signup bonus', '2025-08-30 12:56:27'),
(14, '1234567898', '7037169933', NULL, 'paid', 50.00, 'signup bonus', '2025-08-30 17:08:02'),
(15, '7037169933', '7467074674', NULL, 'paid', 50.00, 'signup bonus', '2025-08-30 17:16:55'),
(16, '1234567898', '9138946353', NULL, 'paid', 50.00, 'signup bonus', '2025-08-30 17:24:32'),
(17, '1234567898', '9999999999', NULL, 'paid', 50.00, 'signup bonus', '2025-08-30 17:25:03'),
(18, '1234567898', '9112222737', NULL, 'paid', 50.00, 'signup bonus', '2025-08-30 20:10:46'),
(19, '7037169933', '8102518213', NULL, 'paid', 50.00, 'signup bonus', '2025-08-30 23:32:59'),
(20, '7037169933', '9235797988', NULL, 'paid', 50.00, 'signup bonus', '2025-08-31 02:32:18'),
(21, '7037169933', '9076862875', NULL, 'paid', 50.00, 'signup bonus', '2025-08-31 03:32:33'),
(22, '7037169933', '7326936997', NULL, 'paid', 50.00, 'signup bonus', '2025-08-31 04:26:20'),
(23, '7037169933', '9692859474', NULL, 'paid', 50.00, 'signup bonus', '2025-08-31 06:52:45'),
(24, '7037169933', '7477248668', NULL, 'paid', 50.00, 'signup bonus', '2025-08-31 07:13:37'),
(25, '9599100513', '9671511376', NULL, 'paid', 50.00, 'signup bonus', '2025-08-31 07:16:09'),
(26, '7037169933', '7078005455', NULL, 'paid', 50.00, 'signup bonus', '2025-08-31 08:21:28'),
(27, '7078005455', '6006542381', NULL, 'paid', 50.00, 'signup bonus', '2025-08-31 11:25:58'),
(28, '7078005455', '8923561148', NULL, 'paid', 50.00, 'signup bonus', '2025-08-31 12:48:16'),
(29, '7078005455', '8445429950', NULL, 'paid', 50.00, 'signup bonus', '2025-08-31 12:52:18'),
(30, '7078005455', '7905989374', NULL, 'paid', 50.00, 'signup bonus', '2025-08-31 13:13:13'),
(31, '7078005455', '7501383639', NULL, 'paid', 50.00, 'signup bonus', '2025-08-31 13:55:56'),
(32, '7078005455', '9068683948', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 02:21:42'),
(33, '7037169933', '9244994919', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 09:12:08'),
(34, '7037169933', '7091158973', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 09:48:01'),
(35, '7037169933', '9508298771', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 10:32:02'),
(36, '7078005455', '9119611125', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 11:19:55'),
(37, '7037169933', '8429712006', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 12:25:22'),
(38, '7037169933', '8101135036', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 14:03:40'),
(39, '7037169933', '7082460366', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 14:07:39'),
(40, '7037169933', '8016029337', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 14:47:30'),
(41, '7078005455', '6205983320', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 16:27:44'),
(42, '7078005455', '9756643540', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 16:37:04'),
(43, '6205983320', '9128534135', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 16:50:11'),
(44, '6205983320', '9631942928', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 16:51:16'),
(45, '7037169933', '8595371644', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 17:48:08'),
(46, '1234567898', '1234567897', NULL, 'paid', 50.00, 'signup bonus', '2025-09-01 18:26:42'),
(47, '7078005455', '6281674651', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 03:12:57'),
(48, '7078005455', '+918080589675', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 03:41:42'),
(49, '7037169933', '8268920000', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 05:23:41'),
(50, '7078005455', '8668794042', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 06:00:24'),
(51, '7037169933', '+919734205844', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 06:03:32'),
(52, '7037169933', '9475907870', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 06:04:52'),
(53, '7037169933', '8652621443', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 07:09:57'),
(54, '7037169933', '6269038863', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 09:18:18'),
(55, '7037169933', '7757905980', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 09:38:19'),
(56, '7037169933', '9939404785', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 09:48:54'),
(57, '7037169933', '7860941019', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 09:48:58'),
(58, '7037169933', '7505107917', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 10:02:33'),
(59, '7037169933', '8273436121', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 10:27:14'),
(60, '7037169933', '8237436121', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 10:34:35'),
(61, '7078005455', '+919760114701', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 10:48:03'),
(62, '7037169933', '7351382296', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 11:10:06'),
(63, '7078005455', '+919212905139', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 14:48:17'),
(64, '7078005455', '8148214945', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 17:28:47'),
(65, '7037169933', '8235100003', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 19:29:22'),
(66, '7037169933', '8889037028', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 20:44:06'),
(67, '7037169933', '+918003942836', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 20:56:55'),
(68, '7037169933', '9502700860', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 21:02:59'),
(69, '7037169933', '+917737747239', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 21:07:26'),
(70, '7037169933', '8974154166', NULL, 'paid', 50.00, 'signup bonus', '2025-09-02 23:36:20'),
(71, '7037169933', '8475070714', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 00:22:56'),
(72, '7037169933', '7296978107', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 00:47:56'),
(73, '7037169933', '7974133647', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 00:55:08'),
(74, '7037169933', '9675377035', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 01:53:08'),
(75, '7037169933', '8812927005', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 02:16:48'),
(76, '7078005455', '9783050228', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 02:38:03'),
(77, '7037169933', '9653976319', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 03:27:05'),
(78, '7037169933', '+916378541805', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 04:44:50'),
(79, '7037169933', '6378541805', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 04:46:23'),
(80, '7037169933', '+919072759570', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 04:58:44'),
(81, '7037169933', '8329832484', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 06:57:13'),
(82, '7037169933', '6393093553', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 07:27:44'),
(83, '7037169933', '+919991858678', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 07:31:21'),
(84, '7037169933', '+918524369845', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 08:13:49'),
(85, '7037169933', '+917803880239', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 08:44:31'),
(86, '7037169933', '9146004050', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 08:53:24'),
(87, '7037169933', '7419222255', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 09:18:42'),
(88, '7037169933', '9023034013', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 09:43:37'),
(89, '7037169933', '7206682681', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 12:01:52'),
(90, '7037169933', '+919045434969', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 12:06:25'),
(91, '7037169933', '9045434969', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 12:07:33'),
(92, '7037169933', '7879361147', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 12:14:51'),
(93, '7037169933', '7983925196', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 12:34:24'),
(94, '7037169933', '7039848729', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 12:44:58'),
(95, '7037169933', '7091965395', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 12:51:27'),
(96, '7037169933', '+917428521979', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 12:54:25'),
(97, '7037169933', '+919523603793', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 12:58:20'),
(98, '7037169933', '9692870075', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 13:05:50'),
(99, '7037169933', '+919660612317', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 13:08:39'),
(100, '7037169933', '6396632750', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 13:20:29'),
(101, '7037169933', '9631232152', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 13:25:00'),
(102, '7037169933', '+919243959427', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 13:26:24'),
(103, '7037169933', '8859501057', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 13:30:49'),
(104, '7037169933', '7635965626', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 13:33:40'),
(105, '7037169933', '+919546110812', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 13:34:58'),
(106, '7037169933', '+919546110813', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 13:37:32'),
(107, '7037169933', '7757073054', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 14:53:54'),
(108, '7037169933', '+917566635523', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 14:59:23'),
(109, '7037169933', '8093842495', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 16:30:37'),
(110, '7037169933', '7820950835', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 16:42:18'),
(111, '7037169933', '7820879404', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 16:43:36'),
(112, '7037169933', '9610835576', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 16:56:49'),
(113, '7037169933', '+919175842554', NULL, 'paid', 50.00, 'signup bonus', '2025-09-03 17:54:25'),
(114, '7037169933', '8249286763', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 01:20:31'),
(115, '7037169933', '9931413017', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 03:15:04'),
(116, '7078005455', '8817620336', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 03:30:37'),
(117, '7037169933', '9958764419', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 04:39:43'),
(118, '7078005455', '+917725892447', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 05:21:30'),
(119, '7078005455', '7354310881', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 05:59:39'),
(120, '7037169933', '7745925711', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 06:25:16'),
(121, '7037169933', '7307606195', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 06:30:58'),
(122, '7037169933', '8929201456', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 06:36:58'),
(123, '7037169933', '03703092458', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 06:38:45'),
(124, '7037169933', '7984472177', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 06:40:18'),
(125, '7037169933', '6289892135', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 06:45:37'),
(126, '7037169933', '8827065605', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 06:48:01'),
(127, '7037169933', '9451576428', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 06:54:49'),
(128, '7037169933', '9674225560', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 07:05:31'),
(129, '7037169933', '6262458701', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 07:30:08'),
(130, '7078005455', '9302517670', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 07:53:27'),
(131, '7037169933', '7263955291', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 08:12:46'),
(132, '7037169933', '6303307030', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 08:28:53'),
(133, '7037169933', '9848678588', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 08:58:41'),
(134, '7037169933', '9309210073', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 09:38:10'),
(135, '7037169933', '9425731196', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 10:10:03'),
(136, '9425731196', '9111710096', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 10:19:56'),
(137, '7037169933', '7742631088', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 10:23:57'),
(138, '7037169933', '917984724772', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 10:44:27'),
(139, '9425731196', '9111799685', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 10:48:30'),
(140, '7037169933', '8874495781', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 10:55:54'),
(141, '7037169933', '9138219454', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 11:20:09'),
(142, '9425731196', '9292636398', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 11:22:16'),
(143, '7037169933', '+919668660660', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 12:41:15'),
(144, '7037169933', '+923197498837', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 12:43:07'),
(145, '7078005455', '9303343945', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 13:15:27'),
(146, '7037169933', '+918755932047', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 13:26:16'),
(147, '7037169933', '9302483791', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 13:34:08'),
(148, '7037169933', '8876727088', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 13:35:38'),
(149, '7037169933', '7409962773', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 13:38:45'),
(150, '9425731196', '9691728454', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 13:52:45'),
(151, '7078005455', '8421175405', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 14:14:09'),
(152, '7037169933', '9006258781', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 14:55:58'),
(153, '7037169933', '7408370171', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 15:08:36'),
(154, '7037169933', '8302392288', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 15:34:12'),
(155, '7037169933', '9012981620', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 15:58:36'),
(156, '7037169933', '9209563757', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 16:32:03'),
(157, '7037169933', '9678790115', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 19:03:05'),
(158, '7037169933', '9508949484', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 19:49:16'),
(159, '7037169933', '7701868680', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 20:38:23'),
(160, '7037169933', '6351101256', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 20:59:06'),
(161, '7078005455', '+917500068335', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 21:28:25'),
(162, '7037169933', '9996917295', NULL, 'paid', 50.00, 'signup bonus', '2025-09-04 22:05:42'),
(163, '7037169933', '9775436603', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 02:50:26'),
(164, '7037169933', '8858472674', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 07:24:47'),
(165, '7037169933', '7611141478', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 07:39:21'),
(166, '7037169933', '+919982215821', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 07:47:16'),
(167, '7037169933', '9395025696', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 07:50:04'),
(168, '7037169933', '8871591363', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 07:55:14'),
(169, '7037169933', '+1918265037537', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 07:59:41'),
(170, '7037169933', '8209122172', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 08:01:51'),
(171, '7037169933', '9728934372', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 08:08:29'),
(172, '7037169933', '+919610826824', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 09:12:39'),
(173, '7037169933', '9135694680', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 09:19:20'),
(174, '7037169933', '8875643872', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 09:43:02'),
(175, '7037169933', '+918099385168', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 09:46:06'),
(176, '7037169933', '9714878934', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 10:07:19'),
(177, '7037169933', '9016743560', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 10:20:44'),
(178, '7037169933', '+918970638838', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 11:21:15'),
(179, '7037169933', '9668517058', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 11:29:56'),
(180, '7037169933', '8115644275', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 11:36:14'),
(181, '7037169933', '+917733832670', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 12:08:24'),
(182, '7078005455', '9142792836', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 12:15:59'),
(183, '7078005455', '+1919142792836', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 12:20:03'),
(184, '7037169933', '8273850856', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 12:58:41'),
(185, '7037169933', '+919341272117', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 13:03:20'),
(186, '7037169933', '+918658825561', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 14:00:52'),
(187, '7037169933', '7583813035', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 14:17:48'),
(188, '7037169933', '6398662639', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 14:19:48'),
(189, '7037169933', '8791627262', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 14:36:43'),
(190, '7037169933', '9145695814', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 16:10:48'),
(191, '7037169933', '9936605574', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 16:20:14'),
(192, '7037169933', '6396807687', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 16:55:13'),
(193, '7078005455', '+919236010829', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 17:09:27'),
(194, '7037169933', '9931736111', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 17:57:05'),
(195, '7037169933', '7016968044', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 18:20:38'),
(196, '7037169933', '9250185589', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 18:25:22'),
(197, '7037169933', '7870078843', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 18:59:15'),
(198, '7037169933', '+919887367194', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 19:29:50'),
(199, '7037169933', '+919903337354', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 20:16:46'),
(200, '7037169933', '7043522872', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 20:54:50'),
(201, '7037169933', '+919239539024', NULL, 'paid', 50.00, 'signup bonus', '2025-09-05 22:54:54'),
(202, '7078005455', '9758360698', NULL, 'paid', 50.00, 'signup bonus', '2025-09-06 01:18:17'),
(203, '7037169933', '7505896270', NULL, 'paid', 50.00, 'signup bonus', '2025-09-06 02:44:54'),
(204, '8115644275', '9565295540', NULL, 'paid', 50.00, 'signup bonus', '2025-09-06 02:45:23'),
(205, '9303343945', '9424248112', NULL, 'paid', 50.00, 'signup bonus', '2025-09-06 03:22:08'),
(206, '7037169933', '+919546110851', NULL, 'paid', 50.00, 'signup bonus', '2025-09-06 04:17:33'),
(207, '8115644275', '+918305325139', NULL, 'paid', 50.00, 'signup bonus', '2025-09-06 04:46:34'),
(208, '7037169933', '8209688327', NULL, 'paid', 50.00, 'signup bonus', '2025-09-06 05:11:52'),
(209, '8115644275', '9264986864', NULL, 'paid', 50.00, 'signup bonus', '2025-09-06 05:49:58'),
(210, '9303343945', '9343662322', NULL, 'paid', 50.00, 'signup bonus', '2025-09-06 06:30:38'),
(211, '7037169933', '9669814173', NULL, 'paid', 50.00, 'signup bonus', '2025-09-06 06:48:18'),
(212, '7037169933', '7069895461', NULL, 'paid', 50.00, 'signup bonus', '2025-09-06 06:48:34'),
(213, '7037169933', '9321844046', NULL, 'paid', 50.00, 'signup bonus', '2025-09-06 07:35:17'),
(214, '7037169933', '7347406348', NULL, 'paid', 50.00, 'signup bonus', '2025-09-06 07:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `referral_codes`
--

CREATE TABLE `referral_codes` (
  `user_id` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `referral_codes`
--

INSERT INTO `referral_codes` (`user_id`, `code`, `created_at`) VALUES
('+1918265037537', '4B3BFA082C32', '2025-09-05 07:59:41'),
('+1919142792836', '2390E74F4789', '2025-09-05 12:20:03'),
('+916003135024', 'C3C0875B4B60', '2025-11-25 14:09:47'),
('+916284508061', '938FF51AB7A5', '2025-11-25 14:10:21'),
('+916378541805', '65DDDE2F6315', '2025-09-03 04:44:50'),
('+916564767646', '1858F90CACB8', '2025-08-30 10:20:37'),
('+917428521979', 'AFCD63DE3630', '2025-09-03 12:54:25'),
('+917500068335', '5B934D6F9857', '2025-09-04 21:28:25'),
('+917566635523', '2214F9697560', '2025-09-03 14:59:23'),
('+917725892447', '8809FFAB755C', '2025-09-04 05:21:30'),
('+917733832670', '57A5C0571E66', '2025-09-05 12:08:24'),
('+917737747239', '246D9F906EEA', '2025-09-02 21:07:26'),
('+917803880239', '662B12958697', '2025-09-03 08:44:31'),
('+917976983611', '727D665DEC93', '2025-09-05 08:31:39'),
('+917986425308', '238F5BB24F5B', '2025-09-01 19:09:11'),
('+918003942836', 'B00C9A83CA97', '2025-09-02 20:56:55'),
('+918080589675', 'C174B429B43A', '2025-09-02 03:41:42'),
('+918099385168', '7BF504B20E69', '2025-09-05 09:46:06'),
('+918305325139', '9BC96A9FA1B4', '2025-09-06 04:46:34'),
('+918524369845', '324C411C1AD4', '2025-09-03 08:13:49'),
('+918658825561', 'FBFB14AE4210', '2025-09-05 14:00:52'),
('+918755932047', '2EC35D7AD271', '2025-09-04 13:26:16'),
('+918970638838', '108CBE0FEFCF', '2025-09-05 11:21:15'),
('+919045434969', '74CDC7F7EE15', '2025-09-03 12:06:25'),
('+919072759570', '41666BAA2400', '2025-09-03 04:58:44'),
('+919175842554', '0730DCCF0AB4', '2025-09-03 17:54:25'),
('+919212905139', '677D075DD6B5', '2025-09-02 14:48:17'),
('+919236010829', '141D4D72B5F5', '2025-09-05 17:09:27'),
('+919239539024', '7D130FB765B1', '2025-09-05 22:54:54'),
('+919243959427', '930FDA341C36', '2025-09-03 13:26:24'),
('+919341272117', '3E45CC81412A', '2025-09-05 13:03:20'),
('+919523603793', 'AA1BB6D691F7', '2025-09-03 12:58:20'),
('+919546110812', '6ED75B6C9C3E', '2025-09-03 13:34:58'),
('+919546110813', '53806C2E4E29', '2025-09-03 13:37:32'),
('+919546110851', 'C0BC4A6D6939', '2025-09-06 04:17:33'),
('+919610826824', 'CEE6B092EB55', '2025-09-05 09:12:39'),
('+919660612317', 'AF5F71A99973', '2025-09-03 13:08:39'),
('+919668660660', '678128A3B775', '2025-09-04 12:41:15'),
('+919734205844', '726BCCEA0A61', '2025-09-02 06:03:32'),
('+919760114701', '67203A298116', '2025-09-02 10:48:03'),
('+919887367194', '14E7463306F4', '2025-09-05 19:29:50'),
('+919903337354', '9D0B84DF65DC', '2025-09-05 20:16:46'),
('+91990595433233', 'A89B8D63259D', '2025-09-01 18:14:40'),
('+919982215821', 'AF855434A240', '2025-09-05 07:47:16'),
('+919991858678', '3896BA20BC13', '2025-09-03 07:31:21'),
('+923197498837', '8478C583FD5E', '2025-09-04 12:43:07'),
('03703092458', '907C27B9C787', '2025-09-04 06:38:45'),
('1111111111', 'E5B6C194E111', '2025-08-20 15:43:58'),
('1234567890', '47F09186e807', '2025-08-15 23:48:50'),
('1234567891', 'E408ADDF0F7E', '2025-08-15 23:52:26'),
('1234567897', 'FC3012D847C0', '2025-09-01 18:26:42'),
('1234567898', 'F21D14268C10', '2025-08-30 11:52:23'),
('6006542381', '4858901F6E97', '2025-08-31 11:25:58'),
('6205983320', 'D9CE4EF6086E', '2025-09-01 16:27:44'),
('6262458701', 'AF42B3D8C8F8', '2025-09-04 07:30:08'),
('6269038863', 'B79F9401E73D', '2025-09-02 09:18:18'),
('6281674651', '69FEFAA5BD1E', '2025-09-02 03:12:57'),
('6289892135', '49D8FCB70714', '2025-09-04 06:45:37'),
('6303307030', '1FA0D6757E37', '2025-09-04 08:28:53'),
('6351101256', 'DE31510E8D1D', '2025-09-04 20:59:06'),
('6378541805', 'F9CA5EA2B691', '2025-09-03 04:46:23'),
('6393093553', 'D8704EF28AB6', '2025-09-03 07:27:44'),
('6396632750', '5933910BCEA3', '2025-09-03 13:20:29'),
('6396807687', 'E7702F69480F', '2025-09-05 16:55:13'),
('6398662639', '155B792D2C83', '2025-09-05 14:19:48'),
('6398662669', '96B74FD50323', '2025-09-05 14:20:42'),
('7016968044', 'ACECFE29420A', '2025-09-05 18:20:38'),
('7037136910', 'FA40B1F98E03', '2025-08-16 08:48:40'),
('7037169933', '08B7FDE63B91', '2025-08-30 17:08:02'),
('7037620703', '9AE356173FA3', '2025-08-16 08:28:42'),
('7039848729', '45134F94DD42', '2025-09-03 12:44:58'),
('7043522872', '62B8D4DD5C38', '2025-09-05 20:54:50'),
('7055849866', 'CFD958CC35D3', '2025-09-02 20:04:53'),
('7067964902', '9032518C5419', '2025-08-16 06:15:28'),
('7069895461', '761B27952A3A', '2025-09-06 06:48:34'),
('7078005455', '93FE3C97DBDD', '2025-08-31 08:21:28'),
('7082460366', 'FF14B4E14064', '2025-09-01 14:07:39'),
('7091158973', '9E5F7FF0215A', '2025-09-01 09:48:01'),
('7091965395', 'EDE5A9303EC9', '2025-09-03 12:51:27'),
('7206682681', '717EEA51D96F', '2025-09-03 12:01:52'),
('7263955291', '485C119F3E07', '2025-09-04 08:12:46'),
('7296978107', 'CA862F3C1095', '2025-09-03 00:47:56'),
('7307606195', '5650944CE9DC', '2025-09-04 06:30:58'),
('7326936997', 'DEC6A2E193AA', '2025-08-31 04:26:20'),
('7347406348', '13EC45C333F2', '2025-09-06 07:36:26'),
('7351382296', '3FB950C04E08', '2025-09-02 11:10:06'),
('7354310881', '8A7A80E74991', '2025-09-04 05:59:39'),
('7408370171', '20EB1E350FE3', '2025-09-04 15:08:36'),
('7409962773', 'EAE1ABAF6151', '2025-09-04 13:38:45'),
('7419222255', 'D0074BDCDE11', '2025-09-03 09:18:42'),
('7467074674', 'EFDEA94DF6CD', '2025-08-30 17:16:55'),
('7477248668', 'CEF3E274A395', '2025-08-31 07:13:37'),
('7501383639', '34C32407479A', '2025-08-31 13:55:56'),
('7505107917', 'EAAF2A1A77A6', '2025-09-02 10:02:33'),
('7505896270', '34029FFEC5A2', '2025-09-06 02:44:54'),
('7566635523', '0055AEB7C65A', '2025-09-03 15:00:36'),
('7583813035', 'FC347C2F94B9', '2025-09-05 14:17:48'),
('7611141478', '209A68FEC254', '2025-09-05 07:39:21'),
('7635965626', '6FCD0B78DD46', '2025-09-03 13:33:40'),
('7701868680', '54BFEB044DCE', '2025-09-04 20:38:23'),
('7742631088', 'F8ADA0E60772', '2025-09-04 10:23:57'),
('7745925711', '06A7FF5B9107', '2025-09-04 06:25:16'),
('7757073054', 'C86B2947CFD5', '2025-09-03 14:53:54'),
('7757905980', '985CB2AA2C55', '2025-09-02 09:38:19'),
('7820879404', '2D26B1EFE8E0', '2025-09-03 16:43:36'),
('7820950835', '6C8D4EE44972', '2025-09-03 16:42:18'),
('7860941019', 'C91EB0B48CA6', '2025-09-02 09:48:58'),
('7870078843', '110633BE3EF1', '2025-09-05 18:59:15'),
('7879361147', '56A17867348F', '2025-09-03 12:14:51'),
('7905989374', 'C160F16CC576', '2025-08-31 13:13:13'),
('7974133647', '0674AC8EE62A', '2025-09-03 00:55:08'),
('7978602221', 'F8A363C43A41', '2025-09-01 10:41:22'),
('7983925196', 'A3026E93EB9C', '2025-09-03 12:34:24'),
('7984472177', 'C3B24E7799C0', '2025-09-04 06:40:18'),
('8003942836', 'F3F88B085D84', '2025-09-02 21:00:05'),
('8016029337', '5AC1937DCC55', '2025-09-01 14:47:30'),
('8093842495', 'EDF4480AFCA4', '2025-09-03 16:30:37'),
('8101135036', 'EC8C1702D730', '2025-09-01 14:03:40'),
('8102518213', 'BBE0825EE120', '2025-08-30 23:32:59'),
('8115644275', '00A6D8FAC55E', '2025-09-05 11:36:14'),
('8148214945', '4812B58E33FA', '2025-09-02 17:28:47'),
('8209122172', '0EB8DA8AD7AB', '2025-09-05 08:01:51'),
('8209688327', '925846695C1B', '2025-09-06 05:11:52'),
('8235100003', '87CFE6E7CCF4', '2025-09-02 19:29:22'),
('8237436121', '6CBB631CE75D', '2025-09-02 10:34:35'),
('8249286763', 'BC1EA04EB09E', '2025-09-04 01:20:31'),
('8268920000', '9157A3E3D741', '2025-09-02 05:23:41'),
('8273436121', 'FD36C70A9B47', '2025-09-02 10:27:14'),
('8273850856', 'A0F191ADDEDE', '2025-09-05 12:58:41'),
('8302392288', '6C58159E97DC', '2025-09-04 15:34:12'),
('8329832484', '0A5205465FA9', '2025-09-03 06:57:13'),
('8421175405', '64A50B61F997', '2025-09-04 14:14:09'),
('8429712006', '80D558240932', '2025-09-01 12:25:22'),
('8445429950', '53A0A72E0747', '2025-08-31 12:52:18'),
('8475070714', 'BAC13A54A2F3', '2025-09-03 00:22:56'),
('8529100034', '9E2C890DBAB2', '2025-08-17 14:30:19'),
('8595371644', '3B3021C738B1', '2025-09-01 17:48:08'),
('8638187703', '1AFD942061CF', '2025-11-23 14:25:10'),
('8638187708', '2B83AA107DEC', '2025-11-23 09:57:09'),
('8652621443', '570BD0B0BA07', '2025-09-02 07:09:57'),
('8668794042', '77D9538019BC', '2025-09-02 06:00:24'),
('8755932047', '68870B90C2D0', '2025-09-04 13:27:21'),
('8791627262', '19505E0E5FE0', '2025-09-05 14:36:43'),
('8812927005', '1DE8F42E792B', '2025-09-03 02:16:48'),
('8817620336', 'B79ED97F64DF', '2025-09-04 03:30:37'),
('8827065605', 'A382D55427D8', '2025-09-04 06:48:01'),
('8858472674', 'E307C40EF7DF', '2025-09-05 07:24:47'),
('8859501057', '9D953E1577F0', '2025-09-03 13:30:49'),
('8871591363', '2A0335C715EE', '2025-09-05 07:55:14'),
('8874495781', '96499097903E', '2025-09-04 10:55:54'),
('8875643872', '6B2866A5922F', '2025-09-05 09:43:02'),
('8876727088', '6EF130ACC05E', '2025-09-04 13:35:38'),
('8889037028', '89847D03055E', '2025-09-02 20:44:06'),
('8923561148', '93373C10DD0C', '2025-08-31 12:48:16'),
('8929201456', 'A9CA460E2AE2', '2025-09-04 06:36:58'),
('8974154166', '072F2C00A31A', '2025-09-02 23:36:20'),
('9006258781', 'F5CDB2B63ACE', '2025-09-04 14:55:58'),
('9012007105', '00D5012E5FD9', '2025-08-16 20:35:25'),
('9012981620', '4B6102E6B559', '2025-09-04 15:58:36'),
('9016743560', '3246028DE066', '2025-09-05 10:20:44'),
('9023034013', '35E48B6355A0', '2025-09-03 09:43:37'),
('9045434969', '58F3164445E6', '2025-09-03 12:07:33'),
('9068683948', '1FAA13A1C26B', '2025-09-01 02:21:42'),
('9076862875', '73D7CF2F3BD8', '2025-08-31 03:32:33'),
('9111710096', 'F9E831A05ABE', '2025-09-04 10:19:56'),
('9111799685', '4696521D4C23', '2025-09-04 10:48:30'),
('9112222737', '1A0075DAB3F1', '2025-08-30 20:10:46'),
('9119611125', 'F4C41D22F7A4', '2025-09-01 11:19:55'),
('9128534135', '658EC60C28B3', '2025-09-01 16:50:11'),
('9135694680', 'BB97A6947627', '2025-09-05 09:19:20'),
('9138219454', '6F608854D182', '2025-09-04 11:20:09'),
('9138946353', 'E2449ECD5469', '2025-08-30 17:24:32'),
('9142792836', 'F71EC80550DD', '2025-09-05 12:15:59'),
('9145695814', '546D4D4B3DAA', '2025-09-05 16:10:48'),
('9146004050', '478C1E05B3EE', '2025-09-03 08:53:24'),
('917984724772', '5E61A784C547', '2025-09-04 10:44:27'),
('9202669594', '3EDA122B9BB2', '2025-08-30 12:56:27'),
('9209563757', '8D8B79B96C75', '2025-09-04 16:32:03'),
('9235797988', '605B69D29631', '2025-08-31 02:32:18'),
('9244994919', '94F3D95691B0', '2025-09-01 09:12:08'),
('9250185589', '2AF8D5018AAB', '2025-09-05 18:25:22'),
('9264986864', 'FFB5F1393AE1', '2025-09-06 05:49:58'),
('9292636398', 'D28E66C77AF6', '2025-09-04 11:22:16'),
('9302483791', '529E6396BD12', '2025-09-04 13:34:08'),
('9302517670', 'C57C26D9CB96', '2025-09-04 07:53:27'),
('9303343945', '83DC24EC9AEE', '2025-09-04 13:15:27'),
('9309210073', '2A691F493A59', '2025-09-04 09:38:10'),
('9321844046', '143DD9518324', '2025-09-06 07:35:17'),
('9343662322', 'BF3D9DE8D42E', '2025-09-06 06:30:38'),
('9395025696', 'C6062658047F', '2025-09-05 07:50:04'),
('9424248112', '0A45C8E75FAF', '2025-09-06 03:22:08'),
('9425731196', '68E55A28A1AF', '2025-09-04 10:10:03'),
('9451576428', '004F33725DAC', '2025-09-04 06:54:49'),
('9474592447', '4F33B5089BD0', '2025-08-16 20:41:33'),
('9475907870', '2F42609C7F13', '2025-09-02 06:04:52'),
('9502700860', 'E1A0DE9F13DC', '2025-09-02 21:02:59'),
('9508298771', '6F2ECF69694E', '2025-09-01 10:32:02'),
('9508949484', '03729CA08BE7', '2025-09-04 19:49:16'),
('9565295540', '8B6134C28FBE', '2025-09-06 02:45:23'),
('9568115524', '286A3BA4CEE3', '2025-08-30 11:00:29'),
('9599100513', '94B8F9E6D0E5', '2025-08-30 12:09:44'),
('9610835576', '4C132782A9C2', '2025-09-03 16:56:49'),
('9631232152', '5ACBBD07B1A8', '2025-09-03 13:25:00'),
('9631942928', '03A35FB28BE3', '2025-09-01 16:51:16'),
('9639513088', '20D9BBE3C0DA', '2025-08-16 16:47:00'),
('9643087266', '7E3197203721', '2025-09-04 06:39:32'),
('9653976319', '185DC55CBF99', '2025-09-03 03:27:05'),
('9668517058', 'C4D1A01FBB33', '2025-09-05 11:29:56'),
('9669814173', '795F544401B4', '2025-09-06 06:48:18'),
('9671511376', 'BB9E4E7B42D0', '2025-08-31 07:16:09'),
('9674225560', '5643B27CD653', '2025-09-04 07:05:31'),
('9675377035', '92D0727BC78C', '2025-09-03 01:53:08'),
('9678790115', 'F9C42D84F359', '2025-09-04 19:03:05'),
('9691728454', 'B96001D086AB', '2025-09-04 13:52:45'),
('9692859474', '7BE272EBE8C3', '2025-08-31 06:52:45'),
('9692870075', '60DDF8F98A06', '2025-09-03 13:05:50'),
('9714878934', '9CFC421BA019', '2025-09-05 10:07:19'),
('9728934372', '36AF3D1ECB2F', '2025-09-05 08:08:29'),
('9756643540', '618E9BEAE7C9', '2025-09-01 16:37:04'),
('9756669856', 'B6699E8096BE', '2025-08-16 06:28:36'),
('9758360698', '1A5C9E266D19', '2025-09-06 01:18:17'),
('9775436603', '292BCC5F2DA3', '2025-09-05 02:50:26'),
('9783050228', '4F8966145D04', '2025-09-03 02:38:03'),
('9848678588', '06F4A181E49C', '2025-09-04 08:58:41'),
('9931413017', '223FFEBA0E5F', '2025-09-04 03:15:04'),
('9931736111', '2D281FB63750', '2025-09-05 17:57:05'),
('9936605574', '49FC01DDC6CB', '2025-09-05 16:20:14'),
('9939404785', '9C1C89480B0D', '2025-09-02 09:48:54'),
('9958764419', '29FC8921FF13', '2025-09-04 04:39:43'),
('9996917295', '6A5357F0C49C', '2025-09-04 22:05:42'),
('9999999999', '5CFBA95DE0EC', '2025-08-30 17:25:03');

-- --------------------------------------------------------

--
-- Table structure for table `shonu_kaichila`
--

CREATE TABLE `shonu_kaichila` (
  `id` int(11) NOT NULL,
  `balakedara` int(11) NOT NULL,
  `motta` varchar(500) NOT NULL,
  `token` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `shonu_kaichila`
--

INSERT INTO `shonu_kaichila` (`id`, `balakedara`, `motta`, `token`) VALUES
(1, 102032, '46385.611', '90f661bf4267906ca8985928ef3ca06f'),
(2, 102033, '9.54', 'dddd17cb6ae7430b5541d97ec31eb4b0'),
(3, 102034, '800.52', '6ee7b002f488939055eba8ea1ee2376c');

-- --------------------------------------------------------

--
-- Table structure for table `support_replies`
--

CREATE TABLE `support_replies` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` int(11) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `subject` varchar(160) NOT NULL,
  `message` text NOT NULL,
  `status` enum('open','pending','closed') NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(9, '1234567898', 'Hello', 'https://yoloplaygames.com/register.php?ref=F21D14268C10', 'open', '2025-08-30 11:57:59', NULL),
(10, '7091158973', 'Widthraw pending', 'Widthraw pending within hours', 'open', '2025-09-01 14:51:35', NULL),
(11, '6281674651', 'App', 'What is deposit pending', 'open', '2025-09-02 15:56:39', NULL),
(12, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:30', NULL),
(13, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:31', NULL),
(14, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:31', NULL),
(15, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:31', NULL),
(16, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:32', NULL),
(17, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:32', NULL),
(18, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:32', NULL),
(19, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:33', NULL),
(20, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:33', NULL),
(21, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:33', NULL),
(22, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:33', NULL),
(23, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:34', NULL),
(24, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:34', NULL),
(25, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:34', NULL),
(26, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:34', NULL),
(27, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:34', NULL),
(28, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:34', NULL),
(29, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:35', NULL),
(30, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:35', NULL),
(31, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:35', NULL),
(32, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:35', NULL),
(33, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:35', NULL),
(34, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:36', NULL),
(35, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:36', NULL),
(36, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:36', NULL),
(37, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:36', NULL),
(38, '+917428521979', 'It posit Nahin Aaya', 'Deposit Nahin Aaya UTR number 690107354014', 'open', '2025-09-03 15:07:37', NULL),
(39, '8827065605', 'Withdrawal issue', '2 ghante ho gaye but mera withdrawal amount process nhi hua \nplease jaldi karwa dijiye', 'open', '2025-09-04 17:07:43', NULL),
(40, '7037169933', 'Deposit not received', 'Hello team yoloplay', 'open', '2025-09-04 22:19:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `subject` varchar(180) NOT NULL,
  `priority` enum('low','normal','high','urgent') NOT NULL DEFAULT 'normal',
  `status` enum('open','pending','closed') NOT NULL DEFAULT 'open',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `author` enum('user','admin') NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `pass_hash` varchar(255) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `balance` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `token` char(32) DEFAULT NULL,
  `motta` varchar(500) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `pass_hash`, `name`, `role`, `balance`, `created_at`, `token`, `motta`) VALUES
(3, '1234567890', '$2y$10$FvanEJMgaTw4W7sFOVbzheGjbdkEjyT6hpG9QqsqzOuTaTRcG5.QK', 'Cute Priya', 'user', '0', '2025-08-12 19:46:54', '012161f932aae19fdf1308be27db4d74', '434.3799999999983'),
(5, '7067964902', '$2y$10$mYfQhmjhRSacC9DLXKtS5OR2ZXr5eEJKfWsgWYdyfJ75c9L.bCFT6', 'Piyushbond', 'user', '3637', '2025-08-12 21:01:19', '4315afd4afb25b3f2544cf1b778fc11b', ''),
(11, '9905954332', 'ff5d9c1ab28562b2ab97e87c93e983ae', 'HYPER', 'admin', '500.00', '2025-08-13 18:37:35', NULL, ''),
(17, '1234567891', '$2y$10$O1NEGTQbs3Ug3dPZ4Sp2.eTtoTrqMfJqsqKk9csmBLBZolQbch5g2', 'Cute Priya', 'user', '0.00', '2025-08-15 23:52:26', NULL, ''),
(18, '9756669856', '$2y$10$spGSKKVMwzHfdyrf.B4evuje10Iql80p8CoLMvxM1tfMY6HrNPJ.u', 'Uzair', 'user', '0.00', '2025-08-16 06:28:36', NULL, ''),
(19, '7037620703', '$2y$10$q4zZohwIAZJZTvAugWGlmu9ijOsiqvIf1EIn7bn.2Kt5HiiGT.izS', 'Creator', 'user', '50.00', '2025-08-16 08:28:42', NULL, ''),
(20, '7037136910', '$2y$10$qQs1YVMHX4xcGvBLyjokz.Uu501M388N.5ccsZedWjNWW2.OpHq52', 'Anas zayn', 'user', '0.00', '2025-08-16 08:48:40', NULL, ''),
(21, '9639513088', '$2y$10$hLtsHtIWpN.I6D4YFPJHBOop.3MD6fsxWSMY8KRB/skI9RGQCKjie', 'Sameer', 'user', '0.00', '2025-08-16 16:47:00', NULL, ''),
(22, '9012007105', '$2y$10$0Gi.iAhw1dsV.4axbfccbO1m/wELNFHnXIHiABAgon5qMBg9PwBK2', 'Priya', 'user', '0.00', '2025-08-16 20:35:25', NULL, ''),
(23, '9474592447', '$2y$10$4eJjPT6LPMpLLN0IFGuoPO8Jtr6y2Ap0HkF7tEsljRsnZO.r7Znx6', 'Rita', 'user', '0.00', '2025-08-16 20:41:33', NULL, ''),
(24, '8529100034', '$2y$10$xPuy9oUq.guJFqii/ST1a.hVZWA.VKp8G7i2HLvo9BN6D.zUGS1ki', 'Apoorva', 'user', '0.00', '2025-08-17 14:30:19', NULL, ''),
(25, '1111111111', '$2y$10$DxUKvEf/qTN0c4ZVsMjCJO72fxZaKnzyMEpuAE0oaeyWZgg7Jk1..', 'Demo', 'user', '0.00', '2025-08-20 15:43:58', NULL, ''),
(26, '+916564767646', '$2y$10$CrG5jzDCIeboXm15Xto45uH4fvUIO2Ut9Jl09tdwUacSwGOizMJj6', 'raghav arora', 'user', '0', '2025-08-30 10:20:37', '9d29f6a7623b8caeb3b9cbe66f0193e0', '0'),
(27, '9568115524', '$2y$10$xkgkChyFmHUHYToeDO/qs.vt1tCLM0Ovw/ItWpP5KXPUY/JAxnHIy', 'Sparsh  Bhardwaj', 'user', '0', '2025-08-30 11:00:29', '7fee3e109226f41e954392f47fc87713', '0'),
(28, '1234567898', '$2y$10$4Me1ztcIp.ItKknTDvEOFOlYxwSRmwLFphtxFtRvvFCifqlySl/3e', 'S', 'user', '0', '2025-08-30 11:52:23', '7d82d425e44930b8f901167b82642bbd', '4535.700000000001'),
(29, '9599100513', '$2y$10$ilP2VrtHPB6aj2GzZnHSH.OW50A6bvU2yrn0ao1MfVVxs7GcB5yzy', 'Kuldeep', 'user', '100', '2025-08-30 12:09:44', '08e5e732d926ec9e58e6fbb893094005', '0'),
(30, '9202669594', '$2y$10$BX1R4erFg2B73g8g8M.cxu.BGY2pmQjPTR.OuuLPXGlZ.yOvJSf5W', 'Disha', 'user', '0', '2025-08-30 12:56:27', '5b5f0b8b6ca4fe42844f8d541942f843', '0'),
(31, '7037169933', '$2y$10$BdH5ff046JGeQVo4A5W2meBb18KN58SdhO/gnLyLrZBvtHfXRwvd.', 'Main', 'user', '0', '2025-08-30 17:08:02', '23e9839fd97df15148d71fdff826dcee', '9611.02'),
(32, '7467074674', '$2y$10$LrRnf8XZ2ebvW6c.BDKJ5uP8HUPeZ0fgFsW3YTYhlvtlDzgAesOte', 'Salman', 'user', '0', '2025-08-30 17:16:55', '0f6812c2b5e7530bcb2f2696adfda72b', '0'),
(33, '9138946353', '$2y$10$JSBSF7OBIXnmkNmhp2E2LePfE5/SFAVA0wU1KqMrCa/l4Gmcv32sW', 'Rahul', 'user', '0.00', '2025-08-30 17:24:32', NULL, '0.00'),
(34, '9999999999', '$2y$10$G6vzuW3so1zfKXFPCAV50eAe/a5X/3FNCeG/eiD73MsOxMCY8uwtO', 'Rahul singh', 'user', '0.5999999999999943', '2025-08-30 17:25:03', '6893eb561724620e415db77b935ea8fb', '0'),
(35, '9112222737', '$2y$10$8eDuc/7KUGsJAUIMHPJP6eLQ65vHwnJIj1PIy2gXF.DUqhk7K2WDG', 'Dinesh', 'user', '0', '2025-08-30 20:10:46', '4c6cfc9a27053cb68cf33694f4545c32', '0'),
(36, '8102518213', '$2y$10$s2nu24Bca3VraNoijZNKMe0KHaPEKulApc4s2exVI9YesbViGVW3O', 'Karan Kumar', 'user', '0', '2025-08-30 23:32:59', '14497a3ffd764f3ca8924f468fbedece', '0'),
(37, '9235797988', '$2y$10$rCyD7O1nNHLytS1q/JMD3O63E0tPcWT0O4VVIql5oa9oII/b3dQWm', 'Irfna Qureshi', 'user', '0.00', '2025-08-31 02:32:18', NULL, '0.00'),
(38, '9076862875', '$2y$10$X.z6SAcoSosfBNYwbDbfuusN3qXmXgoFFuNwBo8sP2xdkMeNHtvXi', 'Karan7054', 'user', '0.00', '2025-08-31 03:32:33', NULL, '0.00'),
(39, '7326936997', '$2y$10$rFuzmXGJYdGDX/lpEUdYDeem66IuzQxMRo13FPBDJjBICyDBuVitu', 'Swayam suranjan Jena', 'user', '0.00', '2025-08-31 04:26:20', NULL, '0.00'),
(40, '9692859474', '$2y$10$4/3i/1Z6YzL/JSsSMFuMIuK6sYaZOZvyVfHD2s1nG.BsflzhRfS76', 'Sanjeeb kumar Naik', 'user', '0', '2025-08-31 06:52:45', '28fcc10b0abfe41155461cdbd0d75ac1', '0'),
(41, '7477248668', '$2y$10$qtAUiZqZtPD1IfLOXAdn/.0psRuAwnX94AyVdtj83e1C6nr3bFlJq', 'Satyapal Ingle', 'user', '0', '2025-08-31 07:13:37', '4231b30747e6af612aae9e294e9c9deb', '0'),
(42, '9671511376', '$2y$10$w5QE1I1laaA35HeOnq877uLvKlcUB2dzJvQbFR3chlD0vi77HHpM2', 'Fardeen', 'user', '0', '2025-08-31 07:16:09', '460ac04dc3ff7dc40abf47ff37e8ba8f', '0'),
(43, '7078005455', '$2y$10$ehypxWceVFIcRXm0ucMmZ.hSbfpATp99lu3bJuZJIAXfy0kJT9LK6', 'Shaan', 'user', '1350', '2025-08-31 08:21:28', '393b20da62deddcfe2dd354ac078f916', '0'),
(44, '6006542381', '$2y$10$x3YbKRA3zYDcwjZMcIsh0usavroo1QTqfsKqb/RyJc0eJTw9zyGM.', 'Zulfkar', 'user', '0', '2025-08-31 11:25:58', '0740ff03085a7838d39e2fff65c9912f', '0'),
(45, '8923561148', '$2y$10$8a9tGHsXRiO5rHw1ts88pOG8.V.FH/PtFXTpbeFi5NF5X//tX1zvO', 'Mohd arman', 'user', '0.00', '2025-08-31 12:48:16', NULL, '0.00'),
(46, '8445429950', '$2y$10$UVhASHUEYbZEzWZfoduH4.vaDRKE42Azpayrws.LfTXovIkMi.0e2', 'Mohd arman', 'user', '0.00', '2025-08-31 12:52:18', NULL, '0.00'),
(47, '7905989374', '$2y$10$xXvN0WwITVp7rmnH4wb5d.rtAFK5U7c1UIoa7zU.NA0SKAjo2gtJ6', 'Yugul Kishor das', 'user', '0.00', '2025-08-31 13:13:13', NULL, '0.00'),
(48, '7501383639', '$2y$10$yF0DCetva43noGixUXnMv.PLl9epjChdJB9ahyrV1ker6AvkNU4fS', 'Subho Mandal', 'user', '0', '2025-08-31 13:55:56', '0ccee608685faa61a208b3e483e47f5d', '0'),
(49, '9068683948', '$2y$10$t5SFUWAjkQSiPKUmEgL5g.H.m0GiuuCQxmrnKkmsLRC7x0PpGcJPm', 'Bala', 'user', '0.00', '2025-09-01 02:21:42', NULL, '0.00'),
(50, '9244994919', '$2y$10$i2SKVoa32oDswdvK7Si.z.3jFJKM62oPQKPbtj.h5OAxsPlJhuhre', 'Girraj dhakad', 'user', '0', '2025-09-01 09:12:08', '23e56dd282262790a51edfe0860d13b5', '0'),
(51, '7091158973', '$2y$10$.C1m3MxeIhfROeuglICud.9VyhRX0L7d3Zkg0Vdju7SNw/cxA/E82', 'Saurav Kumar Sahani', 'user', '2.5', '2025-09-01 09:48:01', '24cd61f8edb3ceed14dd1598c7c19c74', '0'),
(52, '9508298771', '$2y$10$5pSom7ZTTNHkdC.t0NOmBuYYbSG7Im6AeLAwzr4VavGUGJQ2tixEW', 'Mantu Kumar', 'user', '0', '2025-09-01 10:32:02', '495f520ae857fa31de08e870ad5fbf9c', '0'),
(53, '7978602221', '$2y$10$Rx3fXacvpgV4RubfLsXQSuplBgDGifBzZupzfr0QuNTlGqiUteK2e', 'Babul Nath', 'user', '0', '2025-09-01 10:41:22', 'f0415bf2e646eef396b25cea5118bd32', '0'),
(54, '9119611125', '$2y$10$dBakR2QPS5Nenk5RmGa6DuO7v1Hr.fcYjXOjEpidA/zlf6iEVsMT.', 'Pavan Kumar', 'user', '0', '2025-09-01 11:19:55', '306bb56582ee629b038a237696873c65', '0'),
(55, '8429712006', '$2y$10$ab3TRySKBgy5.M7KWp6N2ubAyiRAl0HEwuDkiEMY7qIi.ASwpIpA.', 'Aryan Chauhan', 'user', '0', '2025-09-01 12:25:22', '6d7c152044032ed09ee458628abcd3b5', '0'),
(56, '8101135036', '$2y$10$PDgHqAE9LfwwpjQ6wdrN6OUPqCSq16hAujWacsAk8w085irW0mJw2', 'Mitan ball', 'user', '0', '2025-09-01 14:03:40', NULL, '0'),
(57, '7082460366', '$2y$10$njRI2vbhcRYS4CGgOt61IuJ8sewIAaiNglSP1tUDWrKzuzQpRs74q', 'Ankit', 'user', '0.00', '2025-09-01 14:07:39', NULL, '0.00'),
(58, '8016029337', '$2y$10$GbKnt1NIsJtGRs6BGrFjJ.NlylK1Ipu.yz3DMsCnvyvYXqtMo5nKK', 'Dibyendu jana', 'user', '0', '2025-09-01 14:47:30', 'c7f3f2af97088452037b34d3d9d17058', '0'),
(59, '6205983320', '$2y$10$M5zHVjib33njKHvZHXlWn.Yq5i6RcUi/z4rragKSANEs9QknuUWTm', 'Daulak Ji', 'user', '0.009999999999863007', '2025-09-01 16:27:44', '4886a6839478a3195d48d1a61ebd9e95', '0'),
(60, '9756643540', '$2y$10$EOVc/8HPIq.L6zH1sbLC2u.NGXL8caoayZx1C5Ebm9251iZEDH.Wi', 'Mohd anas', 'user', '0.00', '2025-09-01 16:37:04', NULL, '0.00'),
(61, '9128534135', '$2y$10$EYAzNJGpH4kgyJeAmKwpaeJr8vPB4KgckiGrrIGmpmRxROFW9FmBa', 'Muskan kumar', 'user', '0.00', '2025-09-01 16:50:11', NULL, '0.00'),
(62, '9631942928', '$2y$10$nAeTymGEi3gqLOjMVaIKq.q2BUPHL3dXKkC6SmLYzTpQA20isQJnS', 'Muskan kumar', 'user', '0.00', '2025-09-01 16:51:16', NULL, '0.00'),
(63, '8595371644', '$2y$10$y.2map1e9LYoMS7hCUoGPeHeuHBxprYqFgp0OEtbGFyED/kJxAL0q', 'Rohit', 'user', '0.00', '2025-09-01 17:48:08', NULL, '0.00'),
(64, '+91990595433233', '$2y$10$VYhOIHENB1wwW0x3zTrx/ORQaIL.pBmGFKCELIhyykwHDy9fjdOnW', 'Gopal kumar jha', 'user', '0.00', '2025-09-01 18:14:40', NULL, '0.00'),
(65, '1234567897', '$2y$10$scTIVoZvakaZXdHV9pb.UOSIPE7VsYb34nqFuPb5xxJiXWJFjHkYe', 'Piyush7', 'user', '0.00', '2025-09-01 18:26:42', NULL, '0.00'),
(66, '+917986425308', '$2y$10$r139G57yqnrTbzz4x1Wp1.cazj8VN8i7gQcmszMHuOlR5ds9JtRpy', 'moneymine club', 'user', '0.00', '2025-09-01 19:09:11', NULL, '0.00'),
(67, '6281674651', '$2y$10$tjSe9ypHEOYU9F/sOWSOxeow41RXgDJ9jYQDcCtkz/mD1.RbEblnq', 'GOBINDA RAITA', 'user', '0.4399999999998339', '2025-09-02 03:12:57', '558ede2a7d9cf6e4eea7a387bf33ed99', '0'),
(68, '+918080589675', '$2y$10$q2zQ1G55Tpjzs2odAB/Cre8SBuw/9SgYsgjJIqDIa2x6JrrQpXH4m', 'Andresh Thapad', 'user', '0.00', '2025-09-02 03:41:42', NULL, '0.00'),
(69, '8268920000', '$2y$10$Ik5jQ/Ej999fr1TzMAV.8es6IMb3yELnJ9IxyvAfmDOfuyepjzh0W', 'ADITYA DHAYAL', 'user', '0.00', '2025-09-02 05:23:41', NULL, '0.00'),
(70, '8668794042', '$2y$10$ujkZvuc/c85HCMv0j0vpYOCrYpjiuLZSFAI45NkVj7V1aTR6PTyWy', 'Andresh Thapad', 'user', '0.00', '2025-09-02 06:00:24', NULL, '0.00'),
(71, '+919734205844', '$2y$10$2QbMRKFgCiz8AYPM.L01X.XM/fSNtpYCLkBbECs..sMSjJD3gvmYC', 'Sahil Khan', 'user', '0.00', '2025-09-02 06:03:32', NULL, '0.00'),
(72, '9475907870', '$2y$10$V6JBGG.PhhywmNLLJaZpVu8k09bxCqvVeoNx31E.Ei8GJKDIVpmz.', 'Abdul Hamid', 'user', '0', '2025-09-02 06:04:52', 'e2516badf4f76f2e94d20869a15d3dd9', '0'),
(73, '8652621443', '$2y$10$qxUL6L/huh0x3toiYjEBmOelxFjKGztiZEND2PPUjUjv3IikM2O0e', 'Ashok Dhangar', 'user', '0', '2025-09-02 07:09:57', '5b505a1d62ac42ae1c544d1624741b6b', '0'),
(74, '6269038863', '$2y$10$Y7XQQlUk.EIMwgk0CTeMbe.Qd2KRnBFAdZtDP9SCnrXT6tmtrR3eW', 'Arbind', 'user', '0', '2025-09-02 09:18:17', '81c7fb08da93f2db6cee7ab42f9df037', '0'),
(75, '7757905980', '$2y$10$T8.bj/C2ZFMHwiKt/Idb2uI/xzdUqJkLE1tzFjzutM.aFTIz6DjzO', 'Andresh Thapad', 'user', '101.2', '2025-09-02 09:38:19', '3136680a1fdd2dab7dea9d54715f8f31', '0'),
(76, '9939404785', '$2y$10$xqvPhyjAP4mJQM3ZhHjZ5e7eI8dm/sec4ciyLj/jmZVFjkgcoSSeW', 'SATYAM KUMAR', 'user', '0', '2025-09-02 09:48:54', 'bb52c8de0cd5429e3b580a39f60422ae', '0'),
(77, '7860941019', '$2y$10$bUKlErhZacEn00kC5kXV1evMRvkGK9.lJS6Q0F1mOri26lLqixOaS', 'Kailash kumar', 'user', '0.00', '2025-09-02 09:48:58', NULL, '0.00'),
(78, '7505107917', '$2y$10$6CxyuknrffRdFtRhWX/e5OFOTAfO7ghRFFTUr2E4K1VPEI7TdnHmK', 'Vishal Kumar', 'user', '0', '2025-09-02 10:02:33', '41762d7134caf677fb1f6fa83d82a3db', '0'),
(79, '8273436121', '$2y$10$JODPGZ1c/NfpJxYgHhvpoO9i429VWqDrEquPRNekWMvSWdHZPqVCS', 'An kit nishad', 'user', '0.00', '2025-09-02 10:27:14', NULL, '0.00'),
(80, '8237436121', '$2y$10$HYqym7YVxOFGjcru26GtPOXl4RWw3TDWjgXiBcexVyEj9BWlynFhW', 'Ankit Nisad', 'user', '0.00', '2025-09-02 10:34:35', NULL, '0.00'),
(81, '+919760114701', '$2y$10$4Y3Egp66mGEsvh4/0yaZBOjKp4PrdrEqSr2A7TPh14kXoulMhc0vS', 'Rahul Pal', 'user', '0', '2025-09-02 10:48:03', '25369cb806d92c304f1eef0a2ebfb63e', '0'),
(82, '7351382296', '$2y$10$RBOgASg6AbjDKF0sCL8uFe5G6Iw7gRYJMMM2Qr4n7kd6N9Q6TK5Ym', 'Lucky prajpati', 'user', '0.00', '2025-09-02 11:10:06', NULL, '0.00'),
(83, '+919212905139', '$2y$10$b.mCQLdz0MuVrYztC8mMd.YkrOWwMTWNdUeZrbcaRRe5kI13BBwQm', 'Tufel Khan', 'user', '0', '2025-09-02 14:48:17', '5c69f6c442764dfc93d198b6cf05041a', '0'),
(84, '8148214945', '$2y$10$b71yS5xTvNJvjfCcMr0mo..xUN00H19xbKDOohL4qqZVRYLDd02JK', 'S MOHAMMED FUZAIL', 'user', '0', '2025-09-02 17:28:47', '1c3fbf51d495beef769f354c06b02caf', '0'),
(85, '8235100003', '$2y$10$9APtRTKrV9HenfTl93UlWeUtecuUaCD0GjYs7zLrWVQV1oX2/0joG', 'Apoorva', 'user', '0', '2025-09-02 19:29:22', '7895cbbb3f0399be2adddbd2e77306f3', '0'),
(86, '7055849866', '$2y$10$H75BLcl0XUXMQjps5raQN.B64JWQ/xDNbbM233Xr399FO8QWPXsR6', 'Shayan Shamsi', 'user', '0', '2025-09-02 20:04:53', '389b0cfb556f551c32fe80bf600e2d9e', '0'),
(87, '8889037028', '$2y$10$yab1sY0V8/Lis7GdTVzGWubHM3VNHoNEHJyMP.1vOBXRFIqXp776e', 'Komal', 'user', '0', '2025-09-02 20:44:06', '4d9539ade1b2d44f67f6f2b6f8d2318a', '0'),
(88, '+918003942836', '$2y$10$YHs..CniG/U1VUiT3xTGLeuAgjZriMIRCo.kC/x9o0/fGOY5ncC3W', 'TARACHAND TELI', 'user', '0.00', '2025-09-02 20:56:55', NULL, '0.00'),
(89, '8003942836', '$2y$10$KSimFhefwazx36T5X9MLK.21h5VaBYgpm6OHZddiyUchvf.APiOqa', 'TARACHAND TELI', 'user', '0', '2025-09-02 21:00:05', 'dd65e4d1cd541029c6d4a038edb07000', '0'),
(90, '9502700860', '$2y$10$3Ym.fKLqH14kTw/kvKdRteGN4Cp8uxQbWsRPxhmjjNGJZ8ldLj4rG', 'md samimshek', 'user', '0.00', '2025-09-02 21:02:59', NULL, '0.00'),
(91, '+917737747239', '$2y$10$SOIS7SeGsdNgknSyqCEf0ubQ0uSCtC6JKa1Bu/PXiczIlmUIRyixa', 'Hemraj Meena', 'user', '0.00', '2025-09-02 21:07:26', NULL, '0.00'),
(92, '8974154166', '$2y$10$1ijlABc3LZSpyVtdQnp4Dubz8dr5fXN9ctlu06dM4xMrMj.vkvNLO', 'RAJDIP DAS', 'user', '0', '2025-09-02 23:36:20', 'bd9f109b8b517db6eddf1f9982181ab9', '0'),
(93, '8475070714', '$2y$10$YMjuPA/8JX7X4U1CkeJF5ugTdq3iKIrgpci4aFYE7urARyKBAEOly', 'Vashu Sharma', 'user', '0.00', '2025-09-03 00:22:56', NULL, '0.00'),
(94, '7296978107', '$2y$10$4fPBj1fdoT4h97DKH4MfIu4XuSWSfyrCaCmPxqGpZv16Cv1vqMq8i', 'Sanee', 'user', '0', '2025-09-03 00:47:56', '49f1d7041cdc3e0c592f4cf41eab8948', '0'),
(95, '7974133647', '$2y$10$rLWXDt1w9Op.atJjriHJiu.hME.ydmrtPjuY/Pey8pDLCmbLmiSUy', 'Ankit Mishra', 'user', '0', '2025-09-03 00:55:08', 'ed300235425afd36d3ea412d298e150e', '0'),
(96, '9675377035', '$2y$10$DbOYXrtygPei7WjyIwe5F.KaKYg6M8ednC0AvQIXn85Es9l0pWAda', 'Mohd Mudassir', 'user', '0', '2025-09-03 01:53:08', 'e7c87ff51a32bad69c2a01846fa94ac0', '0'),
(97, '8812927005', '$2y$10$hsjInidfuS4Z0rXdkQ4o2.jEL6EC6FsLeFUAJkVvKF5LeQ0FlAF0S', 'Bhoben Kurmi', 'user', '0', '2025-09-03 02:16:48', 'ec7199fd7adddec2b7888afca7d8ff5a', '0'),
(98, '9783050228', '$2y$10$QYw77.sdnJ5yiF8h52hwxeMOjs/KY3s377Fmuoo2q1Uy2L5PhhuAe', 'Aarav', 'user', '0', '2025-09-03 02:38:03', 'cbef41923cf967ce96bc6b0604557c69', '0'),
(99, '9653976319', '$2y$10$/p/u9aQEiTsuOBSMogPdzuzel.Bvgc3uGH/VRhf2w5PcyLnNIrUAy', 'deepak Kumar katija', 'user', '0', '2025-09-03 03:27:05', '96aa04259d5c7a657b354be9ec486fa1', '0'),
(100, '+916378541805', '$2y$10$4z3fupn5ItyuLykkwsNejeFF6DnnCPY5DqjF5SMuPde2iBpWNG4P2', 'Hardeep Singh', 'user', '0.00', '2025-09-03 04:44:50', NULL, '0.00'),
(101, '6378541805', '$2y$10$KLApzuUERfwabmNBq7I6D.otk1LFHIy99WTuxxSLwd82dtye6u8om', 'Hardeep Singh', 'user', '0', '2025-09-03 04:46:23', 'bb86b6372faa6ab81896b3e913066d21', '0'),
(102, '+919072759570', '$2y$10$.pThj8wDkB1PIpXAjDoRjec8Tlk.NQeD6/l4FFmgCP1mRU/iGPAGa', 'VIGNESH MM', 'user', '0', '2025-09-03 04:58:44', 'e630876f8c1bf9993e1e42f242082bfc', '0'),
(103, '8329832484', '$2y$10$vThfXbVWQkNxJo3LyHVUDO6by.9Z3rELeGYsVEKP7bBRYXEUfF8fq', 'Nikhil manoj kondekar', 'user', '0.00', '2025-09-03 06:57:13', NULL, '0.00'),
(104, '6393093553', '$2y$10$EJQUjwb9TO7KDburb.pGh.LOfvvKL8Nn5NkWPX.m11jyiBnqgLR8e', 'Surabhi', 'user', '0', '2025-09-03 07:27:44', '660e3e665f6fce3e69030be4800348b2', '0'),
(105, '+919991858678', '$2y$10$FpW.99leIfuC8uNyqVsMV.xDVJ/mNEAnvWeLO27uJ32X6VTTfnYp6', 'Bhawna', 'user', '0.00', '2025-09-03 07:31:21', NULL, '0.00'),
(106, '+918524369845', '$2y$10$Ck4yfuZl7crlDdg/SF6suudF8gSsK3So4TcHSzNskDAhrUDcO1D0y', 'shshsb', 'user', '0.00', '2025-09-03 08:13:49', NULL, '0.00'),
(107, '+917803880239', '$2y$10$GASAJ8VNh5nMkLdsU8p/z.Nlh27P5TJMRnDCPBP83CuopsURzv8jq', 'Harish Harish meda', 'user', '0', '2025-09-03 08:44:31', '9e28bcfac1e2c653a2f6db7c335cc291', '0'),
(108, '9146004050', '$2y$10$KEG/YYeRY68HeWFpUkL8jeBDFP0abRNoVs7ZdvHxnhZK.sL3adXaa', 'Kamlesh mangrule', 'user', '0', '2025-09-03 08:53:24', 'be1d9fcd027b38ab11412cd36cd222c6', '0'),
(109, '7419222255', '$2y$10$wS2mA79Ol8Eq5zfYukVBRO3ToIZVCrOncsYK91vG1dcBlbxhBHC5u', 'Ankit', 'user', '0', '2025-09-03 09:18:42', 'f55e599c9b7d1c26220d8a772cd43675', '0'),
(110, '9023034013', '$2y$10$3bdg9xqj44PY/Q0mrJaxFOq9qiwIl1ztZL9.tesR.C/ng7H2KjJvy', 'Krishna Jaybhaye', 'user', '0', '2025-09-03 09:43:37', '203478081cf7ff88e081a0ec6d9dbe66', '0'),
(111, '7206682681', '$2y$10$FuAsAwVW/puO/iRV8VVAxutfYjKqOzMyv8qITDtmBhyeCUtlI3UK6', 'Sunny Royal', 'user', '0', '2025-09-03 12:01:52', '416df66766991c35da99c60e7ec862e9', '0'),
(112, '+919045434969', '$2y$10$9faKCurWOVaiuK8wbnNBhOouvW4EoUS2zL.TqxcE3oRe51Fek/CWy', 'Aryan Gangwar', 'user', '0.00', '2025-09-03 12:06:25', NULL, '0.00'),
(113, '9045434969', '$2y$10$I0F.eG0SElu01ihENnqUCefp4jkgLLtQ2XQuAbvFxL0yfRVosKN0e', 'Aryan Gangwar', 'user', '0', '2025-09-03 12:07:33', '78c8f28807e8f386b9971a675eff2aee', '0'),
(114, '7879361147', '$2y$10$67Skk0DYEpxcUqYQzVkNQO6De2CjTU9AsmZT1ew/HvYG/YPCKXdUa', 'Aashu paikra', 'user', '0.19999999999998863', '2025-09-03 12:14:51', '17cd4a6d4fd4b98c23bb2e3db9d07efa', '0'),
(115, '7983925196', '$2y$10$xivxVdopJG7Bcro3SKBw7eYLdvV/bF7gBvKkLeXYpJFWx3abz2..O', 'Shivshant Pal', 'user', '0', '2025-09-03 12:34:24', '4b4f9d417c5cf9f243ab8ccf25272b34', '0'),
(116, '7039848729', '$2y$10$X3sboAFwFq/zs1IZ7I7lHuQD.wRf1NtqM8KGEyxKyrx3X9rVz2yUC', 'Soham kadam', 'user', '0', '2025-09-03 12:44:58', 'd5428dcf22cf3612df5ec39b7a4ed2f7', '0'),
(117, '7091965395', '$2y$10$.UO5DpLowXRVkbSyoRiEs.PdGKq5FhtC1iDC1B6pittQGtnVevJ2y', 'Sachidanand Yadav', 'user', '0.00', '2025-09-03 12:51:27', NULL, '0.00'),
(118, '+917428521979', '$2y$10$h8OGG2kRsKgsf.rYuNjDkeRFU8Eb8lPUkO6m/WM3tirz17b7nbmxG', 'Abc', 'user', '0', '2025-09-03 12:54:25', '23063b2662e68747bb43567f7ea3529d', '0'),
(119, '+919523603793', '$2y$10$xdKtQjq2ILo9gytES2bi5Ow/jmuKLkulYKzX2emdE8vj5Kc28jsq6', 'Sachidanand Yadav', 'user', '0.00', '2025-09-03 12:58:20', NULL, '0.00'),
(120, '9692870075', '$2y$10$ZCuhvS72N2nxBGTmyQPgeeduude8rlUFX4VsqLymrbkDN7U8jrop6', 'Dhanapati Hantal', 'user', '0', '2025-09-03 13:05:50', '3768af960b28113be1bd0c91424a15b6', '0'),
(121, '+919660612317', '$2y$10$/7g5vVxCN.Fe7qRF0XoRXukAmNgLA7hwnmLF99IXUX4al2zQTGOGC', 'Devesh Kewat', 'user', '0.00', '2025-09-03 13:08:39', NULL, '0.00'),
(122, '6396632750', '$2y$10$lTK8PgXAmQ8X0WzWC6wlseNmopjnPYxzmPVn2Iw4Hp15VWYREz0d2', 'Vivek', 'user', '0.00', '2025-09-03 13:20:29', NULL, '0.00'),
(123, '9631232152', '$2y$10$FsnbmS23V/G61Jqf9clnM.yAqzIEGXQF2mVGjZo5pR2x56lYghFUu', 'Vikash Kumar', 'user', '0', '2025-09-03 13:25:00', 'd25bc718ea5a4824648ff4f797d3a898', '0'),
(124, '+919243959427', '$2y$10$fx.NB.rVkvAHvVoZjNwWiu2vYmqAJe1yF3r1LOvbmNVmnXxp/Uzmi', 'Surajbhai Jee', 'user', '0.00', '2025-09-03 13:26:24', NULL, '0.00'),
(125, '8859501057', '$2y$10$HV5QS9ai3xS.yc3XfJxEgejMBc1XW5Bj49cqbe02uJBRCcjiMfhTC', 'Sjssjsj', 'user', '0', '2025-09-03 13:30:49', '2e67010d20e8ebc8d710fa44244d4eba', '0'),
(126, '7635965626', '$2y$10$5elCirAq15ceY1.VEZbgqe2m/QdKxwyOL1tRUhhSRD0u1NXwUOSPW', 'Borun', 'user', '0', '2025-09-03 13:33:40', 'eee0f38d64b45fc5fce96ebfafa9c57e', '0'),
(127, '+919546110812', '$2y$10$ps.XXBDfvMK2oFY26GZ3k.l9SeY.GCeF/G0mKfETaKbRr384TO5w.', 'Aakash kumar', 'user', '0.00', '2025-09-03 13:34:58', NULL, '0.00'),
(128, '+919546110813', '$2y$10$Bd3Vurh9RqgSvoKxWQsPVOcrAwekJQiFRqU6K/QwPmnhf8/FC4tNK', 'Aakaah', 'user', '0.00', '2025-09-03 13:37:32', NULL, '0.00'),
(129, '7757073054', '$2y$10$jvFGNOPoIjsqehb6Kx9jjOAlxsFWqG2YQazFbO4nx3ZoGjmmRNfN2', 'SAHIL sonawane', 'user', '0', '2025-09-03 14:53:54', '8d595fcd33c55db09965ea274f725125', '0'),
(130, '+917566635523', '$2y$10$/rBgzl1zfrDKnPD3idzOD.SoDDuinz2HePdJgdXMddUhvITIbSJOO', 'Deepak Chouhan', 'user', '0.00', '2025-09-03 14:59:23', NULL, '0.00'),
(131, '7566635523', '$2y$10$9B2vJXXxPfokK3R8WOZHv.eggL787gGAy9m6dC1NfYAbXaflTa/ve', 'Deepak Chouhan', 'user', '0', '2025-09-03 15:00:36', '4f213495649684afdd30248868c2a91a', '0'),
(132, '8093842495', '$2y$10$4t9R3QDwXBg0B1L9m/Fty.giC5t3v3UICBuFAHDX4Wf6gSBObnd7S', 'Ashim minz', 'user', '0', '2025-09-03 16:30:37', '9762958533fb0dfed0973c87391f922a', '0'),
(133, '7820950835', '$2y$10$lDLYtIXAGXuANraDeqQotuDzuO92wh8z1wfcMX9aD.XnKYDgTBu2m', 'Atharv', 'user', '0', '2025-09-03 16:42:18', 'c0aca173d97f29bcabaf388374d54c69', '0'),
(134, '7820879404', '$2y$10$f5wqXoiM9CRmx4wD2esr6.sykThfw6zwYxLIxlLe9.X1ZINUDvR/a', 'Vikas savar', 'user', '0.00', '2025-09-03 16:43:36', NULL, '0.00'),
(135, '9610835576', '$2y$10$qRX3lO1GQ4grJ2YQzcLYQ.qfsGhtIV5L8rdvY54vYp5FCsIffWBhy', 'Sunil Saini', 'user', '0', '2025-09-03 16:56:49', 'b6a13a2c059a59053f9694692c2bc355', '0'),
(136, '+919175842554', '$2y$10$6pAtfZSoOnqBiYVxhZeyWOoyqmoWeZf3450E47YsOesE8K6AxBKYS', 'Abdallah', 'user', '0', '2025-09-03 17:54:25', '37fc52fbc254c5c7dd0c246ae0373184', '0'),
(137, '8249286763', '$2y$10$MwI1n95VUVskMxQynhbVGuZK.fkSGJwMnwduuh35KJ9CsobsUlOrC', 'Salman Naik', 'user', '0', '2025-09-04 01:20:31', '36a253c450d27df1fadf8a8738554103', '0'),
(138, '9931413017', '$2y$10$LfhxxcNlj8hxNTJBK0nwbee1jdaNTvDs429nymoKrFjvxtxMoDmgG', 'Sandeep Chauhan', 'user', '0', '2025-09-04 03:15:04', '7c79fdb7d1df8e1ca812ad5c61e0fd79', '0'),
(139, '8817620336', '$2y$10$w.bcn2SSkKbaqKPm70Iluu7uq4S73/JMTE9t6qr7gsh2XylKjkAdy', 'Mukesh kaushik', 'user', '0', '2025-09-04 03:30:37', '696e829097ca0d5bd4fabb5b7ad0b7b8', '0'),
(140, '9958764419', '$2y$10$Ip67zIvLPKxBL2mpYLHqveXOoU8dSpQh8P1IU4Rbx91g.hw/BeH3i', 'athar', 'user', '0.00', '2025-09-04 04:39:43', NULL, '0.00'),
(141, '+917725892447', '$2y$10$qzni1Zpc8Hq.Yvz0Y0hPVu5bl8.T4pcQEFgAKsf7iRo1IvDYANVla', 'Pavan Hiwarkhede', 'user', '0.00', '2025-09-04 05:21:30', NULL, '0.00'),
(142, '7354310881', '$2y$10$H4XEX./ewQDg4kk9z1zF5OYluYA0Xm/N3ZA9ulB2ZJ7QwIaEGsq3y', 'Devraj I love u', 'user', '0', '2025-09-04 05:59:39', '64b9a22ed6e4e8412de5525f53903729', '0'),
(143, '7745925711', '$2y$10$sFxYXjxch5yEX44QCP2SlO9Z43nNBiUInw2yoOhPe2EthiNyBPY7G', 'Raja babu', 'user', '0', '2025-09-04 06:25:16', 'c49c1db926d488f7dc112e307845333f', '0'),
(144, '7307606195', '$2y$10$M.44Z0.DGcHrrU37fdNawO9faUHhePdGVT8oVJ4Fg.W0yHAR5Pmku', 'Ayan', 'user', '0', '2025-09-04 06:30:58', 'edf8879ae51d1d8e247e2a2d4e5c697b', '0'),
(145, '8929201456', '$2y$10$4AWO4WyaJqsuP/F3Er7FfuMIc/hyuJ8a5uH2ftzQUgUKJfQ9k90PK', 'Tanish bhati', 'user', '0', '2025-09-04 06:36:58', 'bf03f21474be235476d0ab2e769ffad5', '0'),
(146, '03703092458', '$2y$10$NTgY4c7IZobvjSn/QpsAcejvHBzi/FebN.1S0AhZ0b.kXCYiGHs4m', 'Abdul haq', 'user', '0.00', '2025-09-04 06:38:45', NULL, '0.00'),
(147, '9643087266', '$2y$10$A28G4qu8u/jrigsP6NLo1eakwAqN468ddGTAKk.HfQQjQioptu9RO', 'Asim', 'user', '0', '2025-09-04 06:39:32', 'a9c335db3b00df95adf47e846531c5ea', '0'),
(148, '7984472177', '$2y$10$laHjfHLD.ljFJ/uxQtqRbOlcTj2jMKskYki.fbHEujBPOsmJFwqRu', 'ZALA laluji kahalsang', 'user', '0', '2025-09-04 06:40:18', 'b94fe90efc02f621df88c8282e6b4aea', '0'),
(149, '6289892135', '$2y$10$s.mdAHeq6gYj3PnTuCXQuOfsNN9cD6qMYAvOJnLUhVgBEacO0iSy.', 'TanmoyDas', 'user', '0.00', '2025-09-04 06:45:37', NULL, '0.00'),
(150, '8827065605', '$2y$10$vnVJ5B9T9cC5cG84EQhzK.NaeqmPv2JUor7oNpqgo67cBt.2FvTH2', 'Manish Kumar Barman', 'user', '0.10000000000127329', '2025-09-04 06:48:01', 'af6788451d89bf013835551261f718bb', '0'),
(151, '9451576428', '$2y$10$8nXoXjG5PWPJM5ZovjxZMOm9ogiKqrabIRKeImA1CFIAIqm25cENu', 'Hssjsj', 'user', '0', '2025-09-04 06:54:49', '567c2f6c9eafc45d5b52aa214844eeb9', '0'),
(152, '9674225560', '$2y$10$5O2H8ZS9Jjklvuy.YJwYYOcMBX.JK3XoTolqIhZqnQM1lhUyzkfui', 'Tanmoydas112', 'user', '0', '2025-09-04 07:05:31', '2560c13ee8bc16e4e6be681e878b72b1', '0.5'),
(153, '6262458701', '$2y$10$hUqxLCZRjv4JDcQd87KaW.cGO8srDLHOsiU3dDMSvNgoB5DhQXcYC', 'Abhishek Patel', 'user', '0.00000000000005684341886080802', '2025-09-04 07:30:08', '68e8b77c0b41d902b33a58ca0ce4d507', '0'),
(154, '9302517670', '$2y$10$Z8y6M4BgS.EcfzimU/3YpufGl1c7j6dXhopaKyW2PLNA.IEQtYVtS', 'Pavan Hiwarkhede', 'user', '0', '2025-09-04 07:53:27', 'cca8022f9330735e586456887c7af07d', '0'),
(155, '7263955291', '$2y$10$yx44QqznlF3LG08e9.N/Yup8CixiO4cvFOYWZi.F.0vf7eSYzBy.2', 'PAVAN KORDE', 'user', '0.00', '2025-09-04 08:12:46', NULL, '0.00'),
(156, '6303307030', '$2y$10$0kx72la/gL3wUmzRgrhkP.RR8gxr5YQW0ZmFVN2WeRXvIfPrY7il6', 'Shaik Saleem', 'user', '0', '2025-09-04 08:28:53', '0cabe57608aa94c462729b513bc646ab', '0'),
(157, '9848678588', '$2y$10$6HxvfgwNnR7AzC4oA4kKPOwd7sILp5ONs0tYemqzqyDxq1Pxz0sDK', 'Nithin', 'user', '0', '2025-09-04 08:58:41', 'ed4faf6872c676adb0a25f529639153d', '0'),
(158, '9309210073', '$2y$10$QpGq5RSuxglKjuN5MqLSxOPLybjhr6bM1SBxI91x8FGo2PZyQbNte', 'Tausif Shaikh', 'user', '0.00', '2025-09-04 09:38:10', NULL, '0.00'),
(159, '9425731196', '$2y$10$7W62a/ZslVD1JcYxYnA2hOzR.naomjx152WRy7rvMnDBujTDk.auO', 'Raiyyan', 'user', '4.269999999999982', '2025-09-04 10:10:03', '941926dfe541973108e8fe6d159de1fd', '0'),
(160, '9111710096', '$2y$10$bNK3NMibdW739uU6wISOhuggpiDjcYeL.3C0unE2p1JJ4h94uCiuS', 'Zaid', 'user', '0', '2025-09-04 10:19:56', 'ca44f4f4e49b9a7cc14512caa7491835', '0'),
(161, '7742631088', '$2y$10$2K1QhMr7oLkjZ064hic/..xufv5LH9F2c4mrxdTaoJsT7KInAUaHO', 'Rao', 'user', '0.00', '2025-09-04 10:23:57', NULL, '0.00'),
(162, '917984724772', '$2y$10$o59dxHtlQEDj4lrMMn6ql.NeJIhg8rAE0a0UpssVwCihZX67WzlIm', 'Y', 'user', '0.00', '2025-09-04 10:44:27', NULL, '0.00'),
(163, '9111799685', '$2y$10$.vQlgXq7OxodwDekp3VK8.4FpuEndkwjdhRJIslryXVQGXpVWi5/6', 'Amit', 'user', '0.00', '2025-09-04 10:48:30', NULL, '0.00'),
(164, '8874495781', '$2y$10$rZ.pgBGxrrHb/aygE7KwAuxHqg8q/BsxiKNJTbXG05Yw9hIfoDAWe', 'Aksh', 'user', '0', '2025-09-04 10:55:54', 'b85198e3ba0d64bbcc7497907a066327', '0'),
(165, '9138219454', '$2y$10$x.OXr0.5mqVI88bRqdee7OJ5ZO6ULu3oCVExBkpYG/lyEQ7Gm3hGS', 'Pawan kumar', 'user', '0.00', '2025-09-04 11:20:09', NULL, '0.00'),
(166, '9292636398', '$2y$10$41OV/eeQgqW9xiWMcfE5teCPloTcZrthRO9fPTUYsQtDVFTdmPUQC', 'Kash', 'user', '0.00', '2025-09-04 11:22:16', NULL, '0.00'),
(167, '+919668660660', '$2y$10$jWZLkdmZq.dSKjd9vaUinuWPo6KVlo6VPEgQc7hj.QycOw6G1ARbe', 'Subhransu Mishra', 'user', '0.00', '2025-09-04 12:41:15', NULL, '0.00'),
(168, '+923197498837', '$2y$10$yZzJ1jsPbE0cdDwjtJy8OulDyVagJj.6wpS/46ReyEZ/yRUpcddra', 'Malik Muhammad sharjil', 'user', '0', '2025-09-04 12:43:07', 'd9a5017103b3ccd3831c8b7efddff804', '0'),
(169, '9303343945', '$2y$10$0JuRWWRunCpAWaB0BTjrP.iycWGSAVw4n.uqQZts.1MoXnRHDaXBG', 'Kunwar say', 'user', '6.3999999999999915', '2025-09-04 13:15:27', 'f0a6cde7a852183ca7b9d18bba31ab5b', '0'),
(170, '+918755932047', '$2y$10$QmFGRiQQjC3h6CV94ZAKv.T5WkrBKC5tl/Snz1gkv0LfzlTjlUGqW', 'Hulkan Singh', 'user', '0.00', '2025-09-04 13:26:16', NULL, '0.00'),
(171, '8755932047', '$2y$10$0SXgjM./6AK1R265qE/8Gehwb.ETYHH9CMNlj71laufSoLzkI10WC', 'Hulkan Singh', 'user', '0.00', '2025-09-04 13:27:21', NULL, '0.00'),
(172, '9302483791', '$2y$10$NLbV9F3HTTtJuHwr7ZWdp.M.fadYJ3RmTMZWT9Vjw8f1YpKF7R.ti', 'Karan nag', 'user', '0', '2025-09-04 13:34:08', '3e0b0842459adf2b6685bcc44dd31ad9', '0'),
(173, '8876727088', '$2y$10$lInuJfmi2NCve1Yau/gTFOWRPPspKloBfxFV45fGIK5c8pS04q.AS', 'Rupak Das', 'user', '0', '2025-09-04 13:35:38', '730ba5e077dd6bed1810081655af726d', '0'),
(174, '7409962773', '$2y$10$1HdzInjdSAdh0MJ0Vp7eT.RiwIraQ4PwDxh3yPQYwDc6YERsTY/gi', 'Gopal Gautam', 'user', '0.00', '2025-09-04 13:38:45', NULL, '0.00'),
(175, '9691728454', '$2y$10$RRhRyT8AP9.dIOlg6fuhBuqJaHs5TGa/DXQERty4p9mp5XR4X1QrK', 'Kajal', 'user', '0.00', '2025-09-04 13:52:45', NULL, '0.00'),
(176, '8421175405', '$2y$10$inm1slDCVvpJ28l3PzVYCOQ52SD1sT.2K/gsG897lAuQumo2Z3/.O', 'MOHAMMAD HUZAIFA', 'user', '0', '2025-09-04 14:14:09', 'c61ed81858edb09836b9e0c07ba9cee4', '0'),
(177, '9006258781', '$2y$10$sKsEfIDrrq1ObMKOVa0eGen2iDaNzaLTr.oCmiC/O1XPwRJvjYEre', 'Ritik Kumar Roy', 'user', '0', '2025-09-04 14:55:58', '7589e56f311a83fa458e05aad8a9003d', '0'),
(178, '7408370171', '$2y$10$cUWZscbEQuyGfQPbCewTQuPhCwOR/8.46RnCWF1Ap6MVPvav1Nzna', 'Shivam Pal', 'user', '0', '2025-09-04 15:08:36', 'c744b4c8436cf7e55648a5cc874233a7', '0'),
(179, '8302392288', '$2y$10$lXAfIs8GJs6I5wOBsWsoIOrm075nDJwuoM47ZciuF15TYAFt7e.ba', 'Ashu', 'user', '0', '2025-09-04 15:34:12', '248e8194666e04b9175fba8e592289a0', '0'),
(180, '9012981620', '$2y$10$EtsKmAf5bwrJ8B4jA8.yVektSFGdSpJ7C4eA0/M42WC9MawwXBVfi', 'Mankrit Siddhu', 'user', '0', '2025-09-04 15:58:36', '04fe328266e026d9a87ec04c4c263b05', '0'),
(181, '9209563757', '$2y$10$dQN1lv/RJK2JGW2fi0YMveFaM4KLqN7ZJCmODkMazFTPcqmna3TVC', 'Vaibhav Nanhe', 'user', '0', '2025-09-04 16:32:03', '57f082a7f1ea133da54a39bf7b11e69c', '0'),
(182, '9678790115', '$2y$10$TRynUM3TGRakB5tk0CJgo.KCCU3PLNLxGgJ/rC2TIbGUdHJmOZ1tS', 'Shu bty', 'user', '0', '2025-09-04 19:03:05', '20ec89bbbb3c3c3831842d858e038206', '0'),
(183, '9508949484', '$2y$10$SUQ38GYQ.G/84WU3WUI.jut44wjS74NnrVjVGJUOQCaM9MAOJXH36', 'Adhir Kumar', 'user', '0.00', '2025-09-04 19:49:16', NULL, '0.00'),
(184, '7701868680', '$2y$10$tfp/2xOGgsHWr6FwAcomuuVKA5dbIFNCyytdw7mwI5d015jvI3Sam', 'Piyush baghel', 'user', '0', '2025-09-04 20:38:23', '41446177ec5bb51481a6963fcd7eb245', '0'),
(185, '6351101256', '$2y$10$5J9fMczSzGguxhVgm8KcpezBKjwCQ3W.T.zD5ujlhDccBOEXx0K8G', 'Md Nadim', 'user', '0', '2025-09-04 20:59:06', 'f11f531b6b264d17eb978eaf2086207b', '0'),
(186, '+917500068335', '$2y$10$3ej41DhV.W538YYVssQwtOlKZnM1XvsoAB9LNPt5k2oPa0GB7D0Fa', 'Abbaskhan', 'user', '0', '2025-09-04 21:28:25', '25321d0e2543cac5bc1e3a4d8976aa85', '0'),
(187, '9996917295', '$2y$10$f0ksKVAZCgLBlQpyFLbVpOfKpH0bLGHRPhRSJKVpYLJj8L/F7sZli', 'Apoorva Winz', 'user', '40000', '2025-09-04 22:05:42', NULL, '0.00'),
(188, '9775436603', '$2y$10$CLu.ec6VSVqf3vQ4PmOA.OxU7sMoWAU57y4fvPv8tym0iGs5v9ASC', 'Ayud Mistri', 'user', '0', '2025-09-05 02:50:26', '877d606e94b2ca61b5fdef0bf0449e5e', '0'),
(189, '8858472674', '$2y$10$od2WIn1eQ35oHLsc1Q56a.1HIusryBi2IQEsRJED.lSitBK2FHBIa', 'Amanverma', 'user', '0.00', '2025-09-05 07:24:47', NULL, '0.00'),
(190, '7611141478', '$2y$10$28jtBUQP1pZAcXTyzudJMescCAZEmxFUe1py6WLeByG/KYea4mJam', 'Salman7770', 'user', '0', '2025-09-05 07:39:21', '57aebd276054d4001016c881c3bab9e9', '0'),
(191, '+919982215821', '$2y$10$Soz9SNn/mG5D4/sgL26ITeOwOHPlwZDdUYAWqhDWQnfGaka5fyo4q', 'Arvind Lohar', 'user', '0', '2025-09-05 07:47:16', '3e985bafb301f9be7f7c27cf6f22b409', '0'),
(192, '9395025696', '$2y$10$CxUj3eOSNRltvscZaPY6tuPGR4h1alOhLvCpBbc2IA32D3Oz8QV6y', 'Bhoben Kurmi', 'user', '0', '2025-09-05 07:50:04', 'b0a0b98c86d54d505446123adc548b48', '0'),
(193, '8871591363', '$2y$10$bB40NdeNEf8yScPcKt85nOc1ODzwZeUimaomEnKclgvyjNNYICL8y', 'Mitesh purwar', 'user', '0', '2025-09-05 07:55:14', 'e4fd4c1c7a8f2178ec71f3f79bd1e98f', '0'),
(194, '+1918265037537', '$2y$10$kbINQDAYowuosRKwGNs7teD2KRooCjE0RcpYfnxeMNEInfD.QkSbq', 'Dayaram Dhande', 'user', '0.00', '2025-09-05 07:59:41', NULL, '0.00'),
(195, '8209122172', '$2y$10$wMPKKXO3poj18vvDnwbqd.TspOouiDVlT9TxnyZInz1EkwUBz9v8e', 'Karan', 'user', '0.00', '2025-09-05 08:01:51', NULL, '0.00'),
(196, '9728934372', '$2y$10$hknPr0jXl3X4wJ2j0YD3b.CEPIavUZ.oMPq8aSqhktGgKNrNbuJ9y', 'Esak Kangadi', 'user', '0', '2025-09-05 08:08:29', '574db11e53b8a1437396131b1510a1eb', '0'),
(197, '+917976983611', '$2y$10$udtiLYDhWfOaqrDtHaroye5kxf0qmQ35Hx9rElDptyvZSPq16j74W', 'Dilkhuesh Verma', 'user', '0.00', '2025-09-05 08:31:39', NULL, '0.00'),
(198, '+919610826824', '$2y$10$Fak/NL6Q0MSryrJHC2Kr0.WQHY5Gm3evOiW8L.vaVE/qTyBr2aEP.', 'Bhanu Prakash', 'user', '0', '2025-09-05 09:12:39', '97d17a0b4c011c0e4e4087d015285b9e', '0'),
(199, '9135694680', '$2y$10$uE39vd/YHycFBG.wQhD3VeGv4KxBSXGWf5IOcOM3tb4VyD3N05sgS', 'Chandya Dinn', 'user', '0.00', '2025-09-05 09:19:20', NULL, '0.00'),
(200, '8875643872', '$2y$10$vqAYXvlB2CrSitR71jf3MONN4pLrO1.iNhI1wU1.pLkBaJj15taf2', 'Jaat', 'user', '0', '2025-09-05 09:43:02', 'd31411920e9a3178e29010ff1cf66a71', '0'),
(201, '+918099385168', '$2y$10$UykJrV27bJHZ1qtO18Ak0uLfDAU7yL0syDWwYSnX6mHpzPvsZ54NO', 'Daniel Sangma', 'user', '0.00', '2025-09-05 09:46:06', NULL, '0.00'),
(202, '9714878934', '$2y$10$YNiuknOlKiCvhIcojpPKPuePu2PtcV3ZgIJbXRp3q7R0rX0.uaVy2', 'Rajendra Deshmukh', 'user', '0.5', '2025-09-05 10:07:19', '05b724898ffa4a3b10f96fe420e6ec34', '0'),
(203, '9016743560', '$2y$10$OhvLs/J9OHEPmwLMAFGSzeN4/A3eCFtWxWEZMWHIhd8YBZKYY9QjW', 'Rahul Sharma', 'user', '0.00', '2025-09-05 10:20:44', NULL, '0.00'),
(204, '+918970638838', '$2y$10$Glt7kzk3jqEeH96k3JHHSuXl9wovwIPDxJpGnbo3UZRE2pFnxQm0O', 'Akbar Akku', 'user', '0', '2025-09-05 11:21:15', '6c237e3d8ff44e9befb1f762da117501', '0'),
(205, '9668517058', '$2y$10$ZrRtacNctpI/oSiIApcox.PycwsdefnCHnHZ3LQRQ9MFtcVUekwZO', 'Sarbeswar khanda', 'user', '0', '2025-09-05 11:29:56', '2390f014ce38b4599a20fe8243514019', '0'),
(206, '8115644275', '$2y$10$FIyXLP.DJtMCBpHbDYPczuDgweKarWYomU9NX3wO.JyWktNcHGo0.', 'Himanshu', 'user', '0.5499999999999545', '2025-09-05 11:36:14', '08b99348c72fc22e3e62fcc07e0b0202', '0'),
(207, '+917733832670', '$2y$10$w.qmwGqMzXqfKZw6CQInwee0qUHuQy8p2uiS4N9C9ZCgDQrblbxs6', 'SAJID', 'user', '0.00', '2025-09-05 12:08:24', NULL, '0.00'),
(208, '9142792836', '$2y$10$hqBcqs9KCb/VKnXrsWBs5.9fOmDA7.8sGCjCfTHgRPZ9oZ4P1q8ly', 'Pintu kumar', 'user', '0.00', '2025-09-05 12:15:59', NULL, '0.00'),
(209, '+1919142792836', '$2y$10$wz9lktvBji.FPzXb5pbllu7PEkGt.mSggUlLcFWcA5B2pG/qLJ/6a', 'Rahul', 'user', '0.00', '2025-09-05 12:20:03', NULL, '0.00'),
(210, '8273850856', '$2y$10$JSc2imhxeL0A6/8TK/E48.KppPIgL6wiCC/riuIE/xx5pPY7hLQHS', 'Vansh Tagore', 'user', '0', '2025-09-05 12:58:41', '5eff72938653caaa7c1a945fdc2e94d2', '0'),
(211, '+919341272117', '$2y$10$pvMmxRzG33Da2V7CNnGH0.7jut1R5FYi33OvNzTj4ExVyDM6zp7gO', 'Lily Birua', 'user', '0.00', '2025-09-05 13:03:20', NULL, '0.00'),
(212, '+918658825561', '$2y$10$H4t6UZY5ygqfuNa24A1Xl.3gNqrTSlsOBSWjnRIQO/JOwJCK9.HQC', 'Tirtharaj Nayak', 'user', '0.00', '2025-09-05 14:00:52', NULL, '0.00'),
(213, '7583813035', '$2y$10$r5762bVN2/Wo9OilMhJRLe/PhMyngtaci92/a4ltXz3bLKEt4le.6', 'Arun Jatav', 'user', '0', '2025-09-05 14:17:48', 'ebc651fa0f5b770eb454d381d4fa6965', '0'),
(214, '6398662639', '$2y$10$xgU8jjjZ4MG.QCOwSVMXXunMp9Y54M1Ilqy10uA1EOisYJ36SmsMW', 'Vipin Kumar', 'user', '0.00', '2025-09-05 14:19:48', NULL, '0.00'),
(215, '6398662669', '$2y$10$kvdWoe3HHTmt0xqEWwFWIuDHOtNEDegAUozOa.IKkHujWghFvEkPS', 'Vipin Kumar', 'user', '0', '2025-09-05 14:20:42', '164ee1a28cb021b6519e2378c5442d28', '0'),
(216, '8791627262', '$2y$10$qrPb5Bg6Ik2OFjnqpeCbH.vgCpZZd1LyZqzrEWEfh3UqNSS/paJFO', 'Anshul Saini', 'user', '0', '2025-09-05 14:36:43', 'ae3ef0ed42f02baae867f33e1836e2a2', '0'),
(217, '9145695814', '$2y$10$szAzaGXoBW7cl.PX2H4xEe8eDFQc7RggsP6R8QkYM7fgvKum77MqO', 'Azim shaikh', 'user', '0.00', '2025-09-05 16:10:48', NULL, '0.00'),
(218, '9936605574', '$2y$10$YuSf4VNFeMpD0mmqAlAq/ebE8o8wsDnOs8ctvh8wnU4HZOZYuGJ2y', 'Shivam yadav', 'user', '0.00', '2025-09-05 16:20:14', NULL, '0.00'),
(219, '6396807687', '$2y$10$cKmRdTIzrYL9kDbYCJ18vepAdRfX5fppkMQFc5NVn/63eIDmP7nG6', 'Shani', 'user', '0', '2025-09-05 16:55:13', 'c70b6111f0132fead2ea1b9749b87089', '0'),
(220, '+919236010829', '$2y$10$UuI63zbryIBEAF.Qq0CicuuzObEzzTuimi2V5hKAtE.MkGUBE4zXG', 'Ramesh', 'user', '0.00', '2025-09-05 17:09:27', NULL, '0.00'),
(221, '9931736111', '$2y$10$VXxrvxou.XwUZdVR7LI7WeuOQDnukXh.oSs9r1ni9kOe.p0rlHbO6', 'Aditya Kumar Gupta', 'user', '0', '2025-09-05 17:57:05', '0bcb37bcf994677728aedfc6e7be02c5', '0'),
(222, '7016968044', '$2y$10$wtZ1qE4oLAVcwz894AwpVe0W0c5q5pMGg018yt6AxSU9JgTfqL1Na', 'Samir valvi', 'user', '0', '2025-09-05 18:20:38', '16f872ad012b3edd9e0859474c09ab78', '0'),
(223, '9250185589', '$2y$10$/cjH57GxRKlDdaaNRDV7VefY3HN0heMXLGiSIjLQp/PM0vblh67UG', 'Aditya Kumar', 'user', '0', '2025-09-05 18:25:22', '17a2185589bbc2d85d32d4a19c6e22d0', '0'),
(224, '7870078843', '$2y$10$kduq/yXWndsketSLmPHXAe4QthaTi9zX90PUQ6vUO3GUDSpDICiRu', 'Manish Kumar', 'user', '0', '2025-09-05 18:59:15', '755ce6ecf57d381df19be655151bdf45', '0'),
(225, '+919887367194', '$2y$10$ulEpasw7H6ajbgA/l5.vsuAm5TkTDJRbYPTZeen8OWVkuCIw5HBea', 'Jujaram Parjapati', 'user', '0', '2025-09-05 19:29:50', 'b9350d32018c10056e9a2f979897644e', '0'),
(226, '+919903337354', '$2y$10$6uQ3fuqHuL.OhElcq0Ameukmvk0E3iFnvb9aZXroQld.QUEOSS78C', 'Arju hena', 'user', '0', '2025-09-05 20:16:46', 'a7bcefedf3ed82780ad8c0e4414a0a99', '0'),
(227, '7043522872', '$2y$10$HdrUM7miq/p2.gvKTS6PAurwxOusUcysEKl1iqJKqzKLahQAErIVK', 'Anshu', 'user', '0.00', '2025-09-05 20:54:50', NULL, '0.00'),
(228, '+919239539024', '$2y$10$i3dfPWvSzFi5QIs7BWtyo./r.YJMW9GVoy1apMuaw3f8CGm0aPcj2', 'Dark knight', 'user', '0', '2025-09-05 22:54:54', NULL, '0'),
(229, '9758360698', '$2y$10$1i40mUO.D9QP38QFNXoH6uTsT2q0ZNwhbI6x3a0BxbDnOhZZ0zAfm', 'Krishna kumar', 'user', '0', '2025-09-06 01:18:17', '33db7216788042f9ffc7cc6277dc1153', '0'),
(230, '7505896270', '$2y$10$f3IjkCShV12wgTNB0UCyM.cJxoI97mUHHNfsAl8ser05LBMdYcAeq', 'Aman kushwah', 'user', '0', '2025-09-06 02:44:54', 'fe3b11fd3cc59425574c81b792dc09cc', '0'),
(231, '9565295540', '$2y$10$ELku7tPhqMrfgfRoyfihsuL5o9HK/xQCWcK9VizA3ksmZ2ihcA.Ia', 'Granthpal', 'user', '0', '2025-09-06 02:45:23', '7d0477d55532e22097d04c13f7e54234', '0'),
(232, '9424248112', '$2y$10$F8C5x/o/Sq3oJ8svh6Gb.u2jTTmBDhS5nILoYxdWX/XuGLTyormkK', 'Sudeshwar Kumar', 'user', '0.00', '2025-09-06 03:22:08', NULL, '0.00'),
(233, '+919546110851', '$2y$10$GEzE5qKyyTYRnool3N2Rju.b3cX.Z9h2HFuyUpPW/1O0OFz0dKrzq', 'AnkEsh kumar', 'user', '0.00', '2025-09-06 04:17:33', NULL, '0.00'),
(234, '+918305325139', '$2y$10$czs2bzNlNfyah92B45JkmOrwoAdrvbsQe1fD9p87cEV2Zg6h0cZWa', 'Narendra Kumar', 'user', '0.00', '2025-09-06 04:46:34', NULL, '0.00'),
(235, '8209688327', '$2y$10$OFnPwBGp8YASKfGyTdxnOO03nvOyo4rMvMvr/hijVyNSxkaR9NHWS', 'Akash bairwa', 'user', '0.00', '2025-09-06 05:11:52', NULL, '0.00'),
(236, '9264986864', '$2y$10$/XCNY/JWsGAa881TZV3YVOyTUKwb0XGWZUHbIIT9L7JFIcBi/hLQy', 'Vikki bhai', 'user', '0', '2025-09-06 05:49:58', '4842cfebe4986b7083f0d5ab84fd7ec1', '0'),
(237, '9343662322', '$2y$10$HdSbXzwCSNeKZNMY20w0/.9N3e8ILJv62pxeh7v9QgUIQQQ7nRWHm', 'Guioooooo', 'user', '0.00', '2025-09-06 06:30:38', NULL, '0.00'),
(238, '9669814173', '$2y$10$4IAW3fFLFmQI0ZZVtfVbx.s5otc7.wbnckY/p/9MjcTq8WUOOBFBS', 'Kshitij tripathi', 'user', '0', '2025-09-06 06:48:18', 'cb64cdc6a4f428b2d987388941ed003e', '0'),
(239, '7069895461', '$2y$10$enrUFBtyOb6a710FQ7bQxuJjsis8PlDsKeYNiM9lcpPPXVdQXw.Di', 'Divyansh u', 'user', '0', '2025-09-06 06:48:34', 'b190707e52b4048962e0729772706436', '0'),
(240, '9321844046', '$2y$10$IgZqCpTc3BaYOT98PFE8.e0OeTxqlKZC9.wxmIDeQXXpNqatG1grC', 'Shebaz', 'user', '0', '2025-09-06 07:35:17', '05c5dec9d7fea9abe683c39545f9e161', '0'),
(241, '7347406348', '$2y$10$Ok.03t7UoTtzYvlCK5O6Kuy/RglQpupPkFud3T8AFA76oWQZUm2k.', 'Rohit Sandhu', 'user', '0.00', '2025-09-06 07:36:26', NULL, '0.00'),
(242, '8638187708', '$2y$10$9gByPHOIwuuVeMb1G10HJ.xWU6L2y9aFghVrMQlbzZNoJPAShrmti', '8638187708', 'user', '0', '2025-11-23 09:57:09', NULL, '0'),
(243, '8638187703', '$2y$10$i1Ov6w05hJGEFqaYfOABX.xBQ5DCdiORLphAg.wn2k/yKkZLHbB0m', '8638187703', 'user', '0.00', '2025-11-23 14:25:10', NULL, '0.00'),
(244, '+916003135024', '$2y$10$epyIN0PKZIx7TjhaPyDYxeSX6r.3huwIgLP38ZkLv1yP/0PO3UxAG', 'dipjouti kalita', 'user', '0.00', '2025-11-25 14:09:47', NULL, '0.00'),
(245, '+916284508061', '$2y$10$ry35wVr8Jv.P.B6HFFQ92.S3E4MnwLKTvSaLtXIVAS2JGGO32xoiG', 'aking329292 damo', 'user', '0.00', '2025-11-25 14:10:21', NULL, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `meta_key` varchar(100) NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_balances`
--

CREATE TABLE `wallet_balances` (
  `user_id` varchar(64) NOT NULL,
  `balance` decimal(14,2) NOT NULL DEFAULT 0.00,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_payments`
--

CREATE TABLE `wallet_payments` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `type` enum('deposit','withdraw') NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `method` varchar(40) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `method` varchar(20) DEFAULT NULL,
  `upi_id` varchar(120) DEFAULT NULL,
  `bank_holder` varchar(120) DEFAULT NULL,
  `bank_account` varchar(32) DEFAULT NULL,
  `bank_ifsc` varchar(16) DEFAULT NULL,
  `upi` varchar(120) DEFAULT NULL,
  `holder_name` varchar(120) DEFAULT NULL,
  `account_no` varchar(34) DEFAULT NULL,
  `ifsc` varchar(15) DEFAULT NULL,
  `order_id` varchar(64) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `acct_no` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `user_id`, `amount`, `status`, `method`, `upi_id`, `bank_holder`, `bank_account`, `bank_ifsc`, `upi`, `holder_name`, `account_no`, `ifsc`, `order_id`, `created_at`, `acct_no`) VALUES
(15, '7067964902', 409.00, 'pending', 'BANK', NULL, NULL, NULL, NULL, NULL, 'Piyush', '12345678998', 'SINI0001262', 'WD250816120535218', '2025-08-16 12:05:35', NULL),
(16, '7067964902', 1000.00, 'pending', 'UPI', '7067964902@ybl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WD250816120624358', '2025-08-16 12:06:24', NULL),
(17, '7067964902', 30000.00, 'pending', 'UPI', 'Fggd@ybl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WD250830172136877', '2025-08-30 17:21:36', NULL),
(18, '9999999999', 100.00, 'pending', 'UPI', 'Testdemo@ybl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WD250831001048919', '2025-08-31 00:10:48', NULL),
(19, '7091158973', 6000.00, 'completed', 'UPI', '7091158973-j0db-2@ibl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WD250901165316756', '2025-09-01 16:53:16', NULL),
(20, '7757905980', 100.00, 'pending', 'BANK', NULL, NULL, NULL, NULL, NULL, 'Andresh Ramesh Thapad', '923010035896899', 'UTIB0003922', 'WD250902180936568', '2025-09-02 18:09:36', NULL),
(21, '6281674651', 100.00, 'pending', 'UPI', '6281674651@ibl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WD250903101604268', '2025-09-03 10:16:04', NULL),
(22, '7879361147', 161.00, 'completed', 'BANK', NULL, NULL, NULL, NULL, NULL, 'Ashish', '42005069374', 'SBIN0006663', 'WD250903185054824', '2025-09-03 18:50:54', NULL),
(23, '7039848729', 1000.00, 'pending', 'UPI', 'sohamkadam965@oksbi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WD250903231149257', '2025-09-03 23:11:49', NULL),
(24, '9425731196', 50.00, 'pending', 'UPI', '7898135133@ptsbi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WD250904155353120', '2025-09-04 15:53:53', NULL),
(25, '8827065605', 3599.00, 'pending', 'UPI', 'harry0597@ybl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WD250904200706345', '2025-09-04 20:07:06', NULL),
(26, '8115644275', 500.00, 'pending', 'UPI', '8115644275-2@ibl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WD250905173308496', '2025-09-05 17:33:08', NULL),
(27, '9425731196', 150.00, 'pending', 'BANK', NULL, NULL, NULL, NULL, NULL, 'MoFejan', '33221629772', 'SBIN0001507', 'WD250905191451834', '2025-09-05 19:14:51', NULL),
(28, '8115644275', 91.00, 'pending', 'BANK', NULL, NULL, NULL, NULL, NULL, 'Himanshu', '060010305952', 'IPOS0000001', 'WD250906112021986', '2025-09-06 11:20:21', NULL),
(29, '9303343945', 10.00, 'pending', 'UPI', 'Kumar189@fam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WD250906120745403', '2025-09-06 12:07:45', NULL),
(30, '9303343945', 20.00, 'pending', 'UPI', '9303343945@fam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WD250906121652233', '2025-09-06 12:16:52', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `bets`
--
ALTER TABLE `bets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_user_order` (`user_id`,`order_code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `placed_at` (`placed_at`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_txn_id` (`txn_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `game_categories`
--
ALTER TABLE `game_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `lot_bets`
--
ALTER TABLE `lot_bets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `lottery_id` (`lottery_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `lot_lotteries`
--
ALTER TABLE `lot_lotteries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `lot_passes`
--
ALTER TABLE `lot_passes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`),
  ADD KEY `ends_at` (`ends_at`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `promo_redemptions`
--
ALTER TABLE `promo_redemptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code_id` (`code_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referrer_id` (`referrer_id`),
  ADD KEY `referred_id` (`referred_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `referral_codes`
--
ALTER TABLE `referral_codes`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `shonu_kaichila`
--
ALTER TABLE `shonu_kaichila`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_shonu_kaichila` (`balakedara`,`motta`);

--
-- Indexes for table `support_replies`
--
ALTER TABLE `support_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tickets_status` (`status`,`updated_at`);

--
-- Indexes for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `idx_users_role` (`role`),
  ADD KEY `motta` (`motta`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `wallet_balances`
--
ALTER TABLE `wallet_balances`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `wallet_payments`
--
ALTER TABLE `wallet_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wd_user_created` (`user_id`,`created_at`),
  ADD KEY `idx_wd_status` (`status`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bets`
--
ALTER TABLE `bets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1061;

--
-- AUTO_INCREMENT for table `game_categories`
--
ALTER TABLE `game_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lot_bets`
--
ALTER TABLE `lot_bets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `lot_lotteries`
--
ALTER TABLE `lot_lotteries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lot_passes`
--
ALTER TABLE `lot_passes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `promo_redemptions`
--
ALTER TABLE `promo_redemptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `shonu_kaichila`
--
ALTER TABLE `shonu_kaichila`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `support_replies`
--
ALTER TABLE `support_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_payments`
--
ALTER TABLE `wallet_payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `promo_redemptions`
--
ALTER TABLE `promo_redemptions`
  ADD CONSTRAINT `fk_pr_code` FOREIGN KEY (`code_id`) REFERENCES `promo_codes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD CONSTRAINT `ticket_messages_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD CONSTRAINT `ticket_replies_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD CONSTRAINT `fk_wd_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
