-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2020 at 09:12 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `locallibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add book', 7, 'add_book'),
(26, 'Can change book', 7, 'change_book'),
(27, 'Can delete book', 7, 'delete_book'),
(28, 'Can view book', 7, 'view_book'),
(29, 'Can add genre', 8, 'add_genre'),
(30, 'Can change genre', 8, 'change_genre'),
(31, 'Can delete genre', 8, 'delete_genre'),
(32, 'Can view genre', 8, 'view_genre'),
(33, 'Can add reader', 9, 'add_reader'),
(34, 'Can change reader', 9, 'change_reader'),
(35, 'Can delete reader', 9, 'delete_reader'),
(36, 'Can view reader', 9, 'view_reader'),
(37, 'Can add book instance', 10, 'add_bookinstance'),
(38, 'Can change book instance', 10, 'change_bookinstance'),
(39, 'Can delete book instance', 10, 'delete_bookinstance'),
(40, 'Can view book instance', 10, 'view_bookinstance'),
(41, 'Set book as returned', 10, 'can_mark_returned');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$180000$gHhAmi0w6Plc$H3AyQkVKt+3zh/GTeUw8R916P02lLdoydUimDUNvUK4=', '2020-07-27 09:00:35.556041', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2020-07-27 09:00:23.307954');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_book`
--

CREATE TABLE `catalog_book` (
  `id` int(11) NOT NULL,
  `sign` varchar(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `decsription` longtext NOT NULL,
  `amount` int(11) NOT NULL,
  `taken` int(11) NOT NULL,
  `returned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catalog_book`
--

INSERT INTO `catalog_book` (`id`, `sign`, `title`, `image`, `decsription`, `amount`, `taken`, `returned`) VALUES
(1, 'VV 380', '100 câu hỏi và giải đáp về luật ngân sách nhà nước', 'book_image/sach-luat-du-lich-hien-hanh-nxb-chinh-tri-quoc-gia-su-that_ph6zdYG.jpg', '100 câu hỏi và giải đáp về luật ngân sách nhà nước; Bộ Tài chính; 2003; 122tr', 3, 3, 0),
(2, 'VL 503', '225 tình huống giải đáp và quy định mới nhất về quản lý hệ thống thanh toán điện tử liên ngân hàng', 'book_image/sach-luat-du-lich-hien-hanh-nxb-chinh-tri-quoc-gia-su-that_I3BNx0D.jpg', '225 tình huống giải đáp và quy định mới nhất về quản lý hệ thống thanh toán điện tử liên ngân hàng, chế độ báo cáo thống kê, kiểm toán, chính sách tiền tệ trong các hoạt động ngân hàng và các tổ chức tín dụng; Bộ Tài chính; Nxb Tài chính; 2010; 541tr', 3, 2, 0),
(3, 'VL40', 'Oxford Advanced Learner’s Dictionary', 'book_image/1434446991_Oxford-Advanced-Learners-Dictionary-9th-Edition_mKfcPFS.jpg', 'FREE Oxford Advanced Learner’s Dictionary premium\r\nTake your English skills to the next level with free access to the extra resources in Oxford Advanced Learner’s Dictionary premium.\r\n\r\nImprove your pronunciation and speaking skills with the iSpeaker: watch videos, listen to audio, and study useful language\r\nPractise your writing with the iWriter: study model texts and complete guided writing activities\r\nCreate lists of words to learn with My Word Lists, and more!\r\nAccess expires 31 August 2020.', 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_bookinstance`
--

CREATE TABLE `catalog_bookinstance` (
  `id` char(32) NOT NULL,
  `imprint` varchar(200) NOT NULL,
  `borrow_date` date DEFAULT NULL,
  `due_back` date DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catalog_bookinstance`
--

INSERT INTO `catalog_bookinstance` (`id`, `imprint`, `borrow_date`, `due_back`, `book_id`, `borrower_id`) VALUES
('04b4624bd31c4d7e988e63f9b851d080', 'muon tam', '2020-07-24', '2020-07-26', 3, 3),
('5b4cd6d30a434952901fa162c66d88d7', 'tham khao', '2020-07-27', '2020-07-28', 1, 2),
('da1622da59414205860e1e6396c74edf', 'doc tham khao', '2020-07-28', '2020-07-31', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_book_genre`
--

CREATE TABLE `catalog_book_genre` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catalog_book_genre`
--

INSERT INTO `catalog_book_genre` (`id`, `book_id`, `genre_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_genre`
--

CREATE TABLE `catalog_genre` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catalog_genre`
--

INSERT INTO `catalog_genre` (`id`, `name`) VALUES
(3, 'Chính trị'),
(4, 'Kinh tế'),
(1, 'Luật'),
(2, 'Từ điển');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_reader`
--

CREATE TABLE `catalog_reader` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `idcard` varchar(12) NOT NULL,
  `phonenumber` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catalog_reader`
--

INSERT INTO `catalog_reader` (`id`, `name`, `idcard`, `phonenumber`) VALUES
(1, 'Trần Thị Khánh Ly', '197391828', '0971075256'),
(2, 'Lê Phú Ngọc', '201746434', '0708802002'),
(3, 'Lê Hồng Phúc', '251166666', '0384013378');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-07-27 09:01:38.255375', '1', 'Luật', 1, '[{\"added\": {}}]', 8, 1),
(2, '2020-07-27 09:01:49.929826', '2', 'Từ điển', 1, '[{\"added\": {}}]', 8, 1),
(3, '2020-07-27 09:01:57.556325', '3', 'Chính trị', 1, '[{\"added\": {}}]', 8, 1),
(4, '2020-07-27 09:02:31.211377', '4', 'Kinh tế', 1, '[{\"added\": {}}]', 8, 1),
(5, '2020-07-27 09:03:10.900421', '1', 'Trần Thị Khánh Ly', 1, '[{\"added\": {}}]', 9, 1),
(6, '2020-07-27 09:03:28.309250', '2', 'Lê Phú Ngọc', 1, '[{\"added\": {}}]', 9, 1),
(7, '2020-07-27 09:03:55.214145', '3', 'Lê Hồng Phúc', 1, '[{\"added\": {}}]', 9, 1),
(8, '2020-07-27 09:04:41.510602', '1', '100 câu hỏi và giải đáp về luật ngân sách nhà nước', 1, '[{\"added\": {}}]', 7, 1),
(9, '2020-07-27 09:06:07.267630', '2', '225 tình huống giải đáp và quy định mới nhất về quản lý hệ thống thanh toán điện tử liên ngân hàng', 1, '[{\"added\": {}}]', 7, 1),
(10, '2020-07-27 09:07:01.410971', '3', 'Kỷ  yếu kỳ họp thứ 10', 1, '[{\"added\": {}}]', 7, 1),
(11, '2020-07-27 09:27:38.803113', '5b4cd6d3-0a43-4952-901f-a162c66d88d7', '5b4cd6d3-0a43-4952-901f-a162c66d88d7 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 1, '[{\"added\": {}}]', 10, 1),
(12, '2020-07-27 09:33:07.286342', 'da1622da-5941-4205-860e-1e6396c74edf', 'da1622da-5941-4205-860e-1e6396c74edf (225 tình huống giải đáp và quy định mới nhất về quản lý hệ thống thanh toán điện tử liên ngân hàng)', 1, '[{\"added\": {}}]', 10, 1),
(13, '2020-07-27 09:33:38.389024', '04b4624b-d31c-4d7e-988e-63f9b851d080', '04b4624b-d31c-4d7e-988e-63f9b851d080 (Kỷ  yếu kỳ họp thứ 10)', 1, '[{\"added\": {}}]', 10, 1),
(14, '2020-07-27 09:36:05.928191', '04b4624b-d31c-4d7e-988e-63f9b851d080', '04b4624b-d31c-4d7e-988e-63f9b851d080 (Kỷ  yếu kỳ họp thứ 10)', 2, '[]', 10, 1),
(15, '2020-07-29 04:03:50.955658', '04b4624b-d31c-4d7e-988e-63f9b851d080', '04b4624b-d31c-4d7e-988e-63f9b851d080 (Kỷ  yếu kỳ họp thứ 10)', 2, '[]', 10, 1),
(16, '2020-07-29 04:04:19.393104', '3', 'Kỷ  yếu kỳ họp thứ 10', 2, '[{\"changed\": {\"fields\": [\"Taken\"]}}]', 7, 1),
(17, '2020-07-29 04:11:20.262151', '5b4cd6d3-0a43-4952-901f-a162c66d88d7', '5b4cd6d3-0a43-4952-901f-a162c66d88d7 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(18, '2020-07-29 04:11:23.027436', '04b4624b-d31c-4d7e-988e-63f9b851d080', '04b4624b-d31c-4d7e-988e-63f9b851d080 (Kỷ  yếu kỳ họp thứ 10)', 2, '[]', 10, 1),
(19, '2020-07-29 04:11:25.703582', 'da1622da-5941-4205-860e-1e6396c74edf', 'da1622da-5941-4205-860e-1e6396c74edf (225 tình huống giải đáp và quy định mới nhất về quản lý hệ thống thanh toán điện tử liên ngân hàng)', 2, '[]', 10, 1),
(20, '2020-07-29 04:12:19.033633', '3', 'Kỷ  yếu kỳ họp thứ 10', 2, '[{\"changed\": {\"fields\": [\"Taken\"]}}]', 7, 1),
(21, '2020-07-29 04:12:26.592916', '2', '225 tình huống giải đáp và quy định mới nhất về quản lý hệ thống thanh toán điện tử liên ngân hàng', 2, '[{\"changed\": {\"fields\": [\"Taken\"]}}]', 7, 1),
(22, '2020-07-29 04:12:32.707903', '1', '100 câu hỏi và giải đáp về luật ngân sách nhà nước', 2, '[{\"changed\": {\"fields\": [\"Taken\"]}}]', 7, 1),
(23, '2020-07-29 04:12:46.779165', 'da1622da-5941-4205-860e-1e6396c74edf', 'da1622da-5941-4205-860e-1e6396c74edf (225 tình huống giải đáp và quy định mới nhất về quản lý hệ thống thanh toán điện tử liên ngân hàng)', 2, '[]', 10, 1),
(24, '2020-07-29 04:12:50.076617', '04b4624b-d31c-4d7e-988e-63f9b851d080', '04b4624b-d31c-4d7e-988e-63f9b851d080 (Kỷ  yếu kỳ họp thứ 10)', 2, '[]', 10, 1),
(25, '2020-07-29 04:12:52.785552', '5b4cd6d3-0a43-4952-901f-a162c66d88d7', '5b4cd6d3-0a43-4952-901f-a162c66d88d7 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(26, '2020-07-29 04:14:30.826465', '3', 'Kỷ  yếu kỳ họp thứ 10', 2, '[{\"changed\": {\"fields\": [\"Taken\"]}}]', 7, 1),
(27, '2020-07-29 04:14:37.849463', '2', '225 tình huống giải đáp và quy định mới nhất về quản lý hệ thống thanh toán điện tử liên ngân hàng', 2, '[{\"changed\": {\"fields\": [\"Taken\"]}}]', 7, 1),
(28, '2020-07-29 04:14:44.538138', '1', '100 câu hỏi và giải đáp về luật ngân sách nhà nước', 2, '[{\"changed\": {\"fields\": [\"Taken\"]}}]', 7, 1),
(29, '2020-07-29 04:14:51.435420', '04b4624b-d31c-4d7e-988e-63f9b851d080', '04b4624b-d31c-4d7e-988e-63f9b851d080 (Kỷ  yếu kỳ họp thứ 10)', 2, '[]', 10, 1),
(30, '2020-07-29 04:14:53.679911', '5b4cd6d3-0a43-4952-901f-a162c66d88d7', '5b4cd6d3-0a43-4952-901f-a162c66d88d7 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(31, '2020-07-29 04:14:55.971803', 'da1622da-5941-4205-860e-1e6396c74edf', 'da1622da-5941-4205-860e-1e6396c74edf (225 tình huống giải đáp và quy định mới nhất về quản lý hệ thống thanh toán điện tử liên ngân hàng)', 2, '[]', 10, 1),
(32, '2020-07-29 04:15:07.914905', '04b4624b-d31c-4d7e-988e-63f9b851d080', '04b4624b-d31c-4d7e-988e-63f9b851d080 (Kỷ  yếu kỳ họp thứ 10)', 2, '[]', 10, 1),
(33, '2020-07-29 04:16:01.719132', 'bf2215f4-bc28-4480-bb7f-7ea2654c4003', 'bf2215f4-bc28-4480-bb7f-7ea2654c4003 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 1, '[{\"added\": {}}]', 10, 1),
(34, '2020-07-29 04:16:55.847131', 'bf2215f4-bc28-4480-bb7f-7ea2654c4003', 'bf2215f4-bc28-4480-bb7f-7ea2654c4003 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(35, '2020-07-29 04:17:02.051510', 'bf2215f4-bc28-4480-bb7f-7ea2654c4003', 'bf2215f4-bc28-4480-bb7f-7ea2654c4003 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 3, '', 10, 1),
(36, '2020-07-29 04:24:32.578383', 'adb51db4-0a0c-498a-9c1c-29fdbf74a8dc', 'adb51db4-0a0c-498a-9c1c-29fdbf74a8dc (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 1, '[{\"added\": {}}]', 10, 1),
(37, '2020-07-29 04:25:04.820148', '1', '100 câu hỏi và giải đáp về luật ngân sách nhà nước', 2, '[{\"changed\": {\"fields\": [\"Amount\"]}}]', 7, 1),
(38, '2020-07-29 04:25:18.262282', 'adb51db4-0a0c-498a-9c1c-29fdbf74a8dc', 'adb51db4-0a0c-498a-9c1c-29fdbf74a8dc (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(39, '2020-07-29 04:26:46.439185', '5b4cd6d3-0a43-4952-901f-a162c66d88d7', '5b4cd6d3-0a43-4952-901f-a162c66d88d7 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(40, '2020-07-29 04:26:57.423160', 'adb51db4-0a0c-498a-9c1c-29fdbf74a8dc', 'adb51db4-0a0c-498a-9c1c-29fdbf74a8dc (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(41, '2020-07-29 04:27:13.385563', '5087f408-8fa3-4730-b628-956c031ac4e2', '5087f408-8fa3-4730-b628-956c031ac4e2 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 1, '[{\"added\": {}}]', 10, 1),
(42, '2020-07-29 04:28:07.789751', 'adb51db4-0a0c-498a-9c1c-29fdbf74a8dc', 'adb51db4-0a0c-498a-9c1c-29fdbf74a8dc (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(43, '2020-07-29 04:28:10.406820', '5087f408-8fa3-4730-b628-956c031ac4e2', '5087f408-8fa3-4730-b628-956c031ac4e2 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(44, '2020-07-29 04:29:16.746986', 'adb51db4-0a0c-498a-9c1c-29fdbf74a8dc', 'adb51db4-0a0c-498a-9c1c-29fdbf74a8dc (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 3, '', 10, 1),
(45, '2020-07-29 04:29:16.752028', '5087f408-8fa3-4730-b628-956c031ac4e2', '5087f408-8fa3-4730-b628-956c031ac4e2 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 3, '', 10, 1),
(46, '2020-07-29 06:34:34.712617', 'a8c88adc-4bc8-4b3c-b920-b65ecdda66f1', 'a8c88adc-4bc8-4b3c-b920-b65ecdda66f1 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 1, '[{\"added\": {}}]', 10, 1),
(47, '2020-07-29 06:35:24.787926', '5b4cd6d3-0a43-4952-901f-a162c66d88d7', '5b4cd6d3-0a43-4952-901f-a162c66d88d7 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(48, '2020-07-29 06:36:14.670654', '1', '100 câu hỏi và giải đáp về luật ngân sách nhà nước', 2, '[{\"changed\": {\"fields\": [\"Taken\"]}}]', 7, 1),
(49, '2020-07-29 06:37:20.172774', '5b4cd6d3-0a43-4952-901f-a162c66d88d7', '5b4cd6d3-0a43-4952-901f-a162c66d88d7 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(50, '2020-07-29 06:37:23.106759', '5b4cd6d3-0a43-4952-901f-a162c66d88d7', '5b4cd6d3-0a43-4952-901f-a162c66d88d7 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(51, '2020-07-29 06:37:25.372384', '5b4cd6d3-0a43-4952-901f-a162c66d88d7', '5b4cd6d3-0a43-4952-901f-a162c66d88d7 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(52, '2020-07-29 06:38:02.823439', '517c1325-c655-455a-938a-e24b05d3f311', '517c1325-c655-455a-938a-e24b05d3f311 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 1, '[{\"added\": {}}]', 10, 1),
(53, '2020-07-29 06:38:06.450384', '5b4cd6d3-0a43-4952-901f-a162c66d88d7', '5b4cd6d3-0a43-4952-901f-a162c66d88d7 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(54, '2020-07-29 06:38:35.846702', 'a8c88adc-4bc8-4b3c-b920-b65ecdda66f1', 'a8c88adc-4bc8-4b3c-b920-b65ecdda66f1 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 3, '', 10, 1),
(55, '2020-07-29 06:38:35.854659', '517c1325-c655-455a-938a-e24b05d3f311', '517c1325-c655-455a-938a-e24b05d3f311 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 3, '', 10, 1),
(56, '2020-07-29 06:40:26.302277', '5b4cd6d3-0a43-4952-901f-a162c66d88d7', '5b4cd6d3-0a43-4952-901f-a162c66d88d7 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(57, '2020-07-29 06:40:47.390817', '1', '100 câu hỏi và giải đáp về luật ngân sách nhà nước', 2, '[{\"changed\": {\"fields\": [\"Taken\"]}}]', 7, 1),
(58, '2020-07-29 06:40:55.766373', '1', '100 câu hỏi và giải đáp về luật ngân sách nhà nước', 2, '[{\"changed\": {\"fields\": [\"Taken\"]}}]', 7, 1),
(59, '2020-07-29 07:02:52.416762', '5b4cd6d3-0a43-4952-901f-a162c66d88d7', '5b4cd6d3-0a43-4952-901f-a162c66d88d7 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(60, '2020-07-29 07:02:55.503570', '5b4cd6d3-0a43-4952-901f-a162c66d88d7', '5b4cd6d3-0a43-4952-901f-a162c66d88d7 (100 câu hỏi và giải đáp về luật ngân sách nhà nước)', 2, '[]', 10, 1),
(61, '2020-07-30 08:54:47.795622', '2', '225 tình huống giải đáp và quy định mới nhất về quản lý hệ thống thanh toán điện tử liên ngân hàng', 2, '[{\"changed\": {\"fields\": [\"Amount\"]}}]', 7, 1),
(62, '2020-07-31 04:13:02.935277', '3', 'Kỷ  yếu kỳ họp thứ 10', 2, '[{\"changed\": {\"fields\": [\"Amount\"]}}]', 7, 1),
(63, '2020-07-31 04:17:19.653015', '3', 'Oxford Advanced Learner’s Dictionary', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Decsription\"]}}]', 7, 1),
(64, '2020-07-31 04:32:45.806146', 'da1622da-5941-4205-860e-1e6396c74edf', 'da1622da-5941-4205-860e-1e6396c74edf (225 tình huống giải đáp và quy định mới nhất về quản lý hệ thống thanh toán điện tử liên ngân hàng)', 2, '[]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'catalog', 'book'),
(10, 'catalog', 'bookinstance'),
(8, 'catalog', 'genre'),
(9, 'catalog', 'reader'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-07-27 08:59:45.239679'),
(2, 'auth', '0001_initial', '2020-07-27 08:59:45.703052'),
(3, 'admin', '0001_initial', '2020-07-27 08:59:46.785229'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-07-27 08:59:47.005160'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-07-27 08:59:47.018288'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-07-27 08:59:47.133279'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-07-27 08:59:47.330960'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-07-27 08:59:47.360609'),
(9, 'auth', '0004_alter_user_username_opts', '2020-07-27 08:59:47.373538'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-07-27 08:59:47.475874'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-07-27 08:59:47.482856'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-07-27 08:59:47.495825'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-07-27 08:59:47.526828'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-07-27 08:59:47.571673'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-07-27 08:59:47.602557'),
(16, 'auth', '0011_update_proxy_permissions', '2020-07-27 08:59:47.622803'),
(17, 'catalog', '0001_initial', '2020-07-27 08:59:47.911095'),
(18, 'sessions', '0001_initial', '2020-07-27 08:59:48.488408');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('815s9xg0v6z0ns31gngy85v41hq6on2l', 'ZTZmZTEyZTllMTQ1MWYxYmEzMTZmMTkyNzIzOTk1NDZmYWE5ZjUwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YTYzMjI1ZGVlOWNlOTkwNjI3MGJlNjgyYmM1MGEzZmIwZWY1MGU4In0=', '2020-08-10 09:00:35.565134');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `catalog_book`
--
ALTER TABLE `catalog_book`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sign` (`sign`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `catalog_bookinstance`
--
ALTER TABLE `catalog_bookinstance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_bookinstance_book_id_69f93415_fk_catalog_book_id` (`book_id`),
  ADD KEY `catalog_bookinstance_borrower_id_0d71c37c_fk_catalog_reader_id` (`borrower_id`);

--
-- Indexes for table `catalog_book_genre`
--
ALTER TABLE `catalog_book_genre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `catalog_book_genre_book_id_genre_id_d15f6922_uniq` (`book_id`,`genre_id`),
  ADD KEY `catalog_book_genre_genre_id_77d7ffde_fk_catalog_genre_id` (`genre_id`);

--
-- Indexes for table `catalog_genre`
--
ALTER TABLE `catalog_genre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `catalog_reader`
--
ALTER TABLE `catalog_reader`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idcard` (`idcard`),
  ADD UNIQUE KEY `phonenumber` (`phonenumber`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_book`
--
ALTER TABLE `catalog_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `catalog_book_genre`
--
ALTER TABLE `catalog_book_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `catalog_genre`
--
ALTER TABLE `catalog_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `catalog_reader`
--
ALTER TABLE `catalog_reader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `catalog_bookinstance`
--
ALTER TABLE `catalog_bookinstance`
  ADD CONSTRAINT `catalog_bookinstance_book_id_69f93415_fk_catalog_book_id` FOREIGN KEY (`book_id`) REFERENCES `catalog_book` (`id`),
  ADD CONSTRAINT `catalog_bookinstance_borrower_id_0d71c37c_fk_catalog_reader_id` FOREIGN KEY (`borrower_id`) REFERENCES `catalog_reader` (`id`);

--
-- Constraints for table `catalog_book_genre`
--
ALTER TABLE `catalog_book_genre`
  ADD CONSTRAINT `catalog_book_genre_book_id_e5a77c43_fk_catalog_book_id` FOREIGN KEY (`book_id`) REFERENCES `catalog_book` (`id`),
  ADD CONSTRAINT `catalog_book_genre_genre_id_77d7ffde_fk_catalog_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `catalog_genre` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
