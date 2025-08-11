-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3307
-- Thời gian đã tạo: Th7 23, 2025 lúc 10:53 AM
-- Phiên bản máy phục vụ: 10.6.15-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `csdl_banhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
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
(25, 'Can add product', 7, 'add_product'),
(26, 'Can change product', 7, 'change_product'),
(27, 'Can delete product', 7, 'delete_product'),
(28, 'Can view product', 7, 'view_product'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add customer', 9, 'add_customer'),
(34, 'Can change customer', 9, 'change_customer'),
(35, 'Can delete customer', 9, 'delete_customer'),
(36, 'Can view customer', 9, 'view_customer'),
(37, 'Can add cart', 10, 'add_cart'),
(38, 'Can change cart', 10, 'change_cart'),
(39, 'Can delete cart', 10, 'delete_cart'),
(40, 'Can view cart', 10, 'view_cart'),
(41, 'Can add payment', 11, 'add_payment'),
(42, 'Can change payment', 11, 'change_payment'),
(43, 'Can delete payment', 11, 'delete_payment'),
(44, 'Can view payment', 11, 'view_payment'),
(45, 'Can add order placed', 12, 'add_orderplaced'),
(46, 'Can change order placed', 12, 'change_orderplaced'),
(47, 'Can delete order placed', 12, 'delete_orderplaced'),
(48, 'Can view order placed', 12, 'view_orderplaced'),
(49, 'Can add wishlist', 13, 'add_wishlist'),
(50, 'Can change wishlist', 13, 'change_wishlist'),
(51, 'Can delete wishlist', 13, 'delete_wishlist'),
(52, 'Can view wishlist', 13, 'view_wishlist'),
(53, 'Can add product', 14, 'add_product'),
(54, 'Can change product', 14, 'change_product'),
(55, 'Can delete product', 14, 'delete_product'),
(56, 'Can view product', 14, 'view_product'),
(57, 'Can add category', 15, 'add_category'),
(58, 'Can change category', 15, 'change_category'),
(59, 'Can delete category', 15, 'delete_category'),
(60, 'Can view category', 15, 'view_category'),
(61, 'Can add wishlist', 16, 'add_wishlist'),
(62, 'Can change wishlist', 16, 'change_wishlist'),
(63, 'Can delete wishlist', 16, 'delete_wishlist'),
(64, 'Can view wishlist', 16, 'view_wishlist'),
(65, 'Can add cart', 17, 'add_cart'),
(66, 'Can change cart', 17, 'change_cart'),
(67, 'Can delete cart', 17, 'delete_cart'),
(68, 'Can view cart', 17, 'view_cart'),
(69, 'Can add payment', 18, 'add_payment'),
(70, 'Can change payment', 18, 'change_payment'),
(71, 'Can delete payment', 18, 'delete_payment'),
(72, 'Can view payment', 18, 'view_payment'),
(73, 'Can add order placed', 19, 'add_orderplaced'),
(74, 'Can change order placed', 19, 'change_orderplaced'),
(75, 'Can delete order placed', 19, 'delete_orderplaced'),
(76, 'Can view order placed', 19, 'view_orderplaced'),
(77, 'Can add customer', 20, 'add_customer'),
(78, 'Can change customer', 20, 'change_customer'),
(79, 'Can delete customer', 20, 'delete_customer'),
(80, 'Can view customer', 20, 'view_customer');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$mxD35uLd3PObKjCQA3aDk4$n7IfXIPBMLnjnT/GEJekUt2uUEBetO07gC3QQUI+w+M=', '2025-07-20 15:47:43.275497', 1, 'admin1', '', '', 'quangtrongg03@gmail.com', 1, 1, '2025-06-25 08:12:14.000000'),
(2, 'pbkdf2_sha256$1000000$o7tAY2v4IergOWEHsM2icn$Nsx8pX/wPpAQGWcyQkmBvM9a1XmSowI+ZSJ4PiK2b6k=', '2025-07-20 15:50:10.500415', 0, 'trong', '', '', 'quangg03@gmail.com', 0, 1, '2025-06-29 03:17:54.000000'),
(3, 'pbkdf2_sha256$1000000$VDcn4UbJS8w6zrE3s5rFI1$sAQSeDXvMcDoKzzxVK861yHOEx7hvigIcPmptAIR/78=', '2025-07-20 15:48:59.031615', 0, 'tung', '', '', 'quangtrongg03@gmail.com', 0, 1, '2025-07-09 07:51:44.183223'),
(4, 'pbkdf2_sha256$1000000$VNY5jtIoOCwcnsWufdpQ2p$YC65BxL6k5Uc5CViVUR7Y2pQFUOQO34czio4vvfVLNo=', '2025-07-20 15:48:28.189801', 0, 'Dũng', '', '', 'quangtrongg03@gmail.com', 0, 1, '2025-07-09 07:57:42.396238'),
(5, 'pbkdf2_sha256$1000000$zIg8ZoDNbZYlftB4JAfrWU$pEoMapQf0dCa0MH2rtNCrC/awaXPAkI4IgFLK4POysI=', '2025-07-16 14:54:57.091265', 0, 'hậu', '', '', 'dinhthihauu@gmail.com', 0, 1, '2025-07-16 14:53:59.706701');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-06-25 09:00:32.310815', '1', 'Máy tính', 1, '[{\"added\": {}}]', 8, 1),
(2, '2025-06-25 09:00:50.772607', '2', 'Điện thoại', 1, '[{\"added\": {}}]', 8, 1),
(3, '2025-06-26 07:08:02.875401', '1', 'Product object (1)', 1, '[{\"added\": {}}]', 7, 1),
(4, '2025-06-26 07:24:24.655900', '2', 'Product object (2)', 1, '[{\"added\": {}}]', 7, 1),
(5, '2025-06-26 07:24:54.266894', '3', 'Product object (3)', 1, '[{\"added\": {}}]', 7, 1),
(6, '2025-06-26 07:25:27.989999', '4', 'Product object (4)', 1, '[{\"added\": {}}]', 7, 1),
(7, '2025-06-26 15:14:09.959492', '3', 'Phụ kiện', 1, '[{\"added\": {}}]', 8, 1),
(8, '2025-06-26 15:16:34.939507', '3', 'Phụ kiện', 2, '[{\"changed\": {\"fields\": [\"Is sub\"]}}]', 8, 1),
(9, '2025-06-28 02:30:23.465608', '1', 'Cow Milk', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(10, '2025-06-30 09:19:31.514761', '1', 'Đinh Quang Trọng', 3, '', 9, 1),
(11, '2025-06-30 09:20:43.593799', '2', 'Đinh Quang Trọng', 3, '', 9, 1),
(12, '2025-07-02 06:35:46.838793', '1', 'admin1', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 1),
(13, '2025-07-02 07:31:42.271614', '2', 'trong', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(14, '2025-07-02 07:31:47.101591', '2', 'trong', 2, '[]', 4, 1),
(15, '2025-07-02 08:53:37.080918', '1', 'Cow Milk', 2, '[{\"changed\": {\"fields\": [\"Discounted price\"]}}]', 7, 1),
(16, '2025-07-02 16:28:34.934068', '13', 'Cart object (13)', 3, '', 10, 1),
(17, '2025-07-02 16:28:39.208413', '12', 'Cart object (12)', 3, '', 10, 1),
(18, '2025-07-02 16:28:52.045507', '2', 'Cart object (2)', 3, '', 10, 1),
(19, '2025-07-02 16:28:56.295992', '8', 'Cart object (8)', 3, '', 10, 1),
(20, '2025-07-02 16:29:00.132777', '10', 'Cart object (10)', 3, '', 10, 1),
(21, '2025-07-02 16:29:03.968274', '9', 'Cart object (9)', 3, '', 10, 1),
(22, '2025-07-02 16:29:07.656283', '7', 'Cart object (7)', 3, '', 10, 1),
(23, '2025-07-02 16:29:12.408318', '11', 'Cart object (11)', 3, '', 10, 1),
(24, '2025-07-02 16:29:17.576346', '5', 'Cart object (5)', 3, '', 10, 1),
(25, '2025-07-02 16:29:21.481861', '1', 'Cart object (1)', 3, '', 10, 1),
(26, '2025-07-02 16:29:25.328362', '4', 'Cart object (4)', 3, '', 10, 1),
(27, '2025-07-02 16:29:30.272394', '3', 'Cart object (3)', 3, '', 10, 1),
(28, '2025-07-02 16:29:33.822653', '6', 'Cart object (6)', 3, '', 10, 1),
(29, '2025-07-02 16:32:53.488093', '14', 'Cart object (14)', 3, '', 10, 1),
(30, '2025-07-02 16:32:56.916334', '16', 'Cart object (16)', 3, '', 10, 1),
(31, '2025-07-02 16:33:00.418930', '15', 'Cart object (15)', 3, '', 10, 1),
(32, '2025-07-03 03:31:59.140330', '22', 'Cart object (22)', 3, '', 10, 1),
(33, '2025-07-03 08:37:58.401568', '24', 'Cart object (24)', 3, '', 10, 1),
(34, '2025-07-03 15:47:09.314998', '2', 'Wishlist object (2)', 3, '', 13, 1),
(35, '2025-07-03 15:47:13.663542', '1', 'Wishlist object (1)', 3, '', 13, 1),
(36, '2025-07-03 15:49:40.817253', '7', 'Wishlist object (7)', 3, '', 13, 1),
(37, '2025-07-03 15:49:44.752816', '6', 'Wishlist object (6)', 3, '', 13, 1),
(38, '2025-07-03 15:49:48.403902', '4', 'Wishlist object (4)', 3, '', 13, 1),
(39, '2025-07-03 15:49:51.243286', '3', 'Wishlist object (3)', 3, '', 13, 1),
(40, '2025-07-03 15:49:56.985106', '5', 'Wishlist object (5)', 3, '', 13, 1),
(41, '2025-07-03 15:55:55.232770', '8', 'Wishlist object (8)', 3, '', 13, 1),
(42, '2025-07-03 16:00:00.080497', '9', 'Wishlist object (9)', 3, '', 13, 1),
(43, '2025-07-04 10:08:35.459627', '27', 'Cart object (27)', 3, '', 10, 1),
(44, '2025-07-04 10:08:43.666110', '26', 'Cart object (26)', 3, '', 10, 1),
(45, '2025-07-06 01:34:38.415240', '29', 'Cart object (29)', 3, '', 10, 1),
(46, '2025-07-06 01:34:52.157919', '25', 'Cart object (25)', 3, '', 10, 1),
(47, '2025-07-06 01:34:52.157919', '23', 'Cart object (23)', 3, '', 10, 1),
(48, '2025-07-06 01:34:52.157919', '20', 'Cart object (20)', 3, '', 10, 1),
(49, '2025-07-06 01:35:17.032140', '17', 'Wishlist object (17)', 3, '', 13, 1),
(50, '2025-07-06 01:35:29.523224', '4', 'gggggggggggg', 3, '', 7, 1),
(51, '2025-07-06 01:35:29.523224', '3', 'sđsđ', 3, '', 7, 1),
(52, '2025-07-06 01:35:29.523224', '2', 'adas', 3, '', 7, 1),
(53, '2025-07-06 01:35:29.523224', '1', 'Cow Milk', 3, '', 7, 1),
(54, '2025-07-06 01:35:45.216301', '3', 'Phụ kiện', 3, '', 8, 1),
(55, '2025-07-06 01:35:45.216301', '2', 'Điện thoại', 3, '', 8, 1),
(56, '2025-07-06 01:35:45.216301', '1', 'Máy tính', 3, '', 8, 1),
(57, '2025-07-06 01:55:57.224951', '4', 'Mì ăn liền', 1, '[{\"added\": {}}]', 8, 1),
(58, '2025-07-06 01:58:19.877114', '5', 'Nước ngọt', 1, '[{\"added\": {}}]', 8, 1),
(59, '2025-07-06 01:59:36.717361', '6', 'Sữa', 1, '[{\"added\": {}}]', 8, 1),
(60, '2025-07-06 02:00:05.337257', '7', 'Bánh mì', 1, '[{\"added\": {}}]', 8, 1),
(61, '2025-07-06 02:05:53.222677', '8', 'Đồ dùng tiện ích', 1, '[{\"added\": {}}]', 8, 1),
(62, '2025-07-06 02:37:31.975000', '5', 'Mì tôm Hảo Hảo Tôm Chua Cay {Thùng 30 gói}', 1, '[{\"added\": {}}]', 7, 1),
(63, '2025-07-06 02:41:12.501429', '5', 'Mì tôm Hảo Hảo Tôm Chua Cay {Thùng 30 gói}', 2, '[{\"changed\": {\"fields\": [\"Selling price\"]}}]', 7, 1),
(64, '2025-07-06 03:04:18.569073', '6', 'Coca-Cola (lốc 6 lon)', 1, '[{\"added\": {}}]', 7, 1),
(65, '2025-07-06 03:07:52.023786', '6', 'Coca-Cola (lốc 6 lon)', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 7, 1),
(66, '2025-07-06 03:09:00.090021', '6', 'Coca-Cola (lốc 6 lon)', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 7, 1),
(67, '2025-07-06 03:10:03.871858', '5', 'Mì tôm Hảo Hảo Tôm Chua Cay {Thùng 30 gói}', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 7, 1),
(68, '2025-07-06 03:24:59.977801', '5', 'Mì tôm Hảo Hảo Tôm Chua Cay {Thùng 30 gói}', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 7, 1),
(69, '2025-07-06 03:50:55.054716', '5', 'Mì tôm Hảo Hảo Tôm Chua Cay {Thùng 30 gói}', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 7, 1),
(70, '2025-07-06 04:05:05.185029', '7', 'Bánh', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 8, 1),
(71, '2025-07-06 04:07:44.881372', '7', 'Thùng 2kg Bánh Sandwich nho', 1, '[{\"added\": {}}]', 7, 1),
(72, '2025-07-06 05:10:26.858327', '9', 'Thực phẩm', 1, '[{\"added\": {}}]', 8, 1),
(73, '2025-07-06 05:10:42.596507', '7', 'Bánh', 2, '[{\"changed\": {\"fields\": [\"Sub category\"]}}]', 8, 1),
(74, '2025-07-06 05:11:38.779253', '6', 'Sữa', 2, '[{\"changed\": {\"fields\": [\"Sub category\"]}}]', 8, 1),
(75, '2025-07-06 05:13:05.453876', '10', 'Đồ gia dụng', 1, '[{\"added\": {}}]', 8, 1),
(76, '2025-07-06 05:14:14.704342', '11', 'Hóa mỹ phẩm', 1, '[{\"added\": {}}]', 8, 1),
(77, '2025-07-06 05:14:28.964043', '12', 'Đồ uống', 1, '[{\"added\": {}}]', 8, 1),
(78, '2025-07-06 05:14:37.994123', '6', 'Sữa', 2, '[{\"changed\": {\"fields\": [\"Sub category\"]}}]', 8, 1),
(79, '2025-07-06 05:14:46.122898', '4', 'Mì ăn liền', 2, '[{\"changed\": {\"fields\": [\"Sub category\"]}}]', 8, 1),
(80, '2025-07-06 05:14:56.132766', '5', 'Nước ngọt', 2, '[{\"changed\": {\"fields\": [\"Sub category\"]}}]', 8, 1),
(81, '2025-07-06 05:15:22.802447', '8', 'Đồ dùng tiện ích', 2, '[{\"changed\": {\"fields\": [\"Is sub\"]}}]', 8, 1),
(82, '2025-07-06 05:29:30.743276', '12', 'Đồ uống', 2, '[{\"changed\": {\"fields\": [\"Is sub\"]}}]', 8, 1),
(83, '2025-07-06 05:29:34.842864', '11', 'Hóa mỹ phẩm', 2, '[{\"changed\": {\"fields\": [\"Is sub\"]}}]', 8, 1),
(84, '2025-07-06 05:29:38.482859', '10', 'Đồ gia dụng', 2, '[{\"changed\": {\"fields\": [\"Is sub\"]}}]', 8, 1),
(85, '2025-07-06 05:30:03.665641', '9', 'Thực phẩm', 2, '[{\"changed\": {\"fields\": [\"Is sub\"]}}]', 8, 1),
(86, '2025-07-06 05:30:08.490273', '8', 'Đồ dùng tiện ích', 2, '[{\"changed\": {\"fields\": [\"Is sub\"]}}]', 8, 1),
(87, '2025-07-06 05:30:11.403080', '7', 'Bánh', 2, '[{\"changed\": {\"fields\": [\"Is sub\"]}}]', 8, 1),
(88, '2025-07-06 05:30:15.228155', '6', 'Sữa', 2, '[{\"changed\": {\"fields\": [\"Is sub\"]}}]', 8, 1),
(89, '2025-07-06 05:30:19.562289', '4', 'Mì ăn liền', 2, '[{\"changed\": {\"fields\": [\"Is sub\"]}}]', 8, 1),
(90, '2025-07-06 05:31:24.120129', '5', 'Nước ngọt', 2, '[{\"changed\": {\"fields\": [\"Is sub\"]}}]', 8, 1),
(91, '2025-07-06 06:31:19.250178', '8', 'Nước ngọt Fanta', 1, '[{\"added\": {}}]', 7, 1),
(92, '2025-07-06 06:32:26.749847', '8', 'Nước ngọt Fanta', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 7, 1),
(93, '2025-07-06 06:39:57.770540', '6', 'Coca-Cola', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Product image\"]}}]', 7, 1),
(94, '2025-07-06 06:47:18.306362', '5', 'Mì tôm Hảo Hảo', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Product image\"]}}]', 7, 1),
(95, '2025-07-06 06:49:02.407582', '7', 'Bánh Sandwich nho', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Product image\"]}}]', 7, 1),
(96, '2025-07-06 08:57:25.235868', '32', 'Cart object (32)', 3, '', 10, 1),
(97, '2025-07-06 09:12:48.598219', '34', 'Cart object (34)', 3, '', 10, 1),
(98, '2025-07-06 09:23:00.267862', '4', 'OrderPlaced object (4)', 3, '', 12, 1),
(99, '2025-07-06 09:23:00.267862', '3', 'OrderPlaced object (3)', 3, '', 12, 1),
(100, '2025-07-06 09:23:00.267862', '2', 'OrderPlaced object (2)', 3, '', 12, 1),
(101, '2025-07-06 09:23:00.267862', '1', 'OrderPlaced object (1)', 3, '', 12, 1),
(102, '2025-07-06 09:23:18.320467', '1', 'Payment by trong (COD)', 3, '', 11, 1),
(103, '2025-07-06 09:47:06.941923', '6', 'OrderPlaced object (6)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(104, '2025-07-06 10:01:29.710852', '3', '3 - trong - Thanh toán khi nhận hàng - 155000.0₫', 2, '[{\"changed\": {\"fields\": [\"Payment method\"]}}]', 11, 1),
(105, '2025-07-06 10:03:00.106873', '2', '2 - trong - Thanh toán ngay - 145000.0₫', 2, '[{\"changed\": {\"fields\": [\"Payment method\"]}}]', 11, 1),
(106, '2025-07-06 10:14:12.062396', '6', 'OrderPlaced object (6)', 3, '', 12, 1),
(107, '2025-07-06 10:14:12.062396', '5', 'OrderPlaced object (5)', 3, '', 12, 1),
(108, '2025-07-06 10:14:18.302812', '3', '3 - trong - 155000.0₫', 3, '', 11, 1),
(109, '2025-07-06 10:14:18.302812', '2', '2 - trong - 145000.0₫', 3, '', 11, 1),
(110, '2025-07-06 10:16:02.872010', '4', '4 - trong - 290000.0₫', 2, '[{\"changed\": {\"fields\": [\"Paid\"]}}]', 11, 1),
(111, '2025-07-06 10:16:20.144030', '4', '4 - trong - 290000.0₫', 2, '[{\"changed\": {\"fields\": [\"Payment status\", \"Transaction id\"]}}]', 11, 1),
(112, '2025-07-07 07:57:44.695434', '6', '6 - trong - thanhToanSau - 290000.0₫', 2, '[{\"changed\": {\"fields\": [\"Payment status\"]}}]', 11, 1),
(113, '2025-07-07 07:57:52.798474', '6', '6 - trong - thanhToanSau - 290000.0₫', 2, '[{\"changed\": {\"fields\": [\"Paid\"]}}]', 11, 1),
(114, '2025-07-07 08:01:18.301916', '8', 'OrderPlaced object (8)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(115, '2025-07-07 08:03:48.378341', '7', 'OrderPlaced object (7)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 12, 1),
(116, '2025-07-07 08:04:35.279843', '7', '7 - trong - thanhToan - 155000.0₫', 3, '', 11, 1),
(117, '2025-07-07 08:04:35.279843', '6', '6 - trong - thanhToanSau - 290000.0₫', 3, '', 11, 1),
(118, '2025-07-07 08:04:35.279843', '5', '5 - trong - thanhToanSau - 145000.0₫', 3, '', 11, 1),
(119, '2025-07-07 08:04:35.279843', '4', '4 - trong - thanhToanSau - 290000.0₫', 3, '', 11, 1),
(120, '2025-07-07 08:20:20.960929', '9', 'Pin tiểu AA', 1, '[{\"added\": {}}]', 7, 1),
(121, '2025-07-07 08:41:24.961805', '10', 'Đèn pin mini', 1, '[{\"added\": {}}]', 7, 1),
(122, '2025-07-07 08:44:49.575614', '11', 'Khẩu trang y tế', 1, '[{\"added\": {}}]', 7, 1),
(123, '2025-07-07 08:48:06.015275', '12', 'Bật lửa', 1, '[{\"added\": {}}]', 7, 1),
(124, '2025-07-07 08:52:45.657097', '13', 'Xúc xích CP tiệt trùng', 1, '[{\"added\": {}}]', 7, 1),
(125, '2025-07-07 08:55:52.186421', '14', 'Gạo ST25', 1, '[{\"added\": {}}]', 7, 1),
(126, '2025-07-07 09:00:26.142186', '15', 'Sữa TH True Milk', 1, '[{\"added\": {}}]', 7, 1),
(127, '2025-07-08 01:47:20.240106', '12', 'Bật lửa', 2, '[{\"changed\": {\"fields\": [\"Selling price\"]}}]', 7, 1),
(128, '2025-07-08 01:47:28.882034', '11', 'Khẩu trang y tế', 2, '[{\"changed\": {\"fields\": [\"Selling price\"]}}]', 7, 1),
(129, '2025-07-08 01:48:45.245930', '11', 'Khẩu trang y tế', 2, '[{\"changed\": {\"fields\": [\"Discounted price\"]}}]', 7, 1),
(130, '2025-07-08 01:48:52.937749', '12', 'Bật lửa', 2, '[{\"changed\": {\"fields\": [\"Discounted price\"]}}]', 7, 1),
(131, '2025-07-08 01:49:18.624537', '5', 'Mì tôm Hảo Hảo', 2, '[{\"changed\": {\"fields\": [\"Discounted price\"]}}]', 7, 1),
(132, '2025-07-08 01:59:36.482482', '16', 'Mì tôm hảo hảo', 1, '[{\"added\": {}}]', 7, 1),
(133, '2025-07-08 01:59:51.641079', '16', 'Mì tôm Hảo Hảo', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 7, 1),
(134, '2025-07-08 02:03:38.121042', '5', 'Mì tôm Hảo Hảo', 2, '[]', 7, 1),
(135, '2025-07-08 02:05:10.385918', '5', 'Mì tôm Hảo Hảo', 2, '[{\"changed\": {\"fields\": [\"Discounted price\"]}}]', 7, 1),
(136, '2025-07-08 02:05:30.148526', '12', 'Bật lửa', 2, '[{\"changed\": {\"fields\": [\"Discounted price\"]}}]', 7, 1),
(137, '2025-07-08 02:05:44.977183', '11', 'Khẩu trang y tế', 2, '[{\"changed\": {\"fields\": [\"Discounted price\"]}}]', 7, 1),
(138, '2025-07-08 03:12:42.650022', '7', 'Bánh Sandwich nho (Thùng 2 kg)', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 7, 1),
(139, '2025-07-08 03:14:03.896286', '15', 'Sữa TH True Milk (Lốc 4 hộp)', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 7, 1),
(140, '2025-07-08 03:14:27.184067', '14', 'Gạo ST25 (Túi 5kg)', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 7, 1),
(141, '2025-07-08 03:15:16.200046', '13', 'Xúc xích Heo cao bồi', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 7, 1),
(142, '2025-07-08 03:15:30.628019', '12', 'Bật lửa', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(143, '2025-07-08 03:15:55.603637', '11', 'Khẩu trang y tế (Hộp 50 cái)', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 7, 1),
(144, '2025-07-08 03:16:13.576796', '10', 'Đèn pin mini', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(145, '2025-07-08 03:16:41.388536', '9', 'Pin tiểu AA', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(146, '2025-07-08 03:17:11.768433', '8', 'Nước ngọt Fanta (Lon)', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 7, 1),
(147, '2025-07-08 03:17:32.784363', '6', 'Coca-Cola (Lốc 6 lon)', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 7, 1),
(148, '2025-07-08 03:17:53.377527', '5', 'Mì tôm Hảo Hảo (Thùng 30 gói)', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]', 7, 1),
(149, '2025-07-08 08:54:32.520021', '50', 'Cart object (50)', 3, '', 10, 1),
(150, '2025-07-08 09:00:02.480360', '11', 'Khẩu trang y tế (Hộp 50 cái)', 2, '[{\"changed\": {\"fields\": [\"Discounted price\"]}}]', 7, 1),
(151, '2025-07-08 09:00:10.826483', '12', 'Bật lửa', 2, '[{\"changed\": {\"fields\": [\"Discounted price\"]}}]', 7, 1),
(152, '2025-07-08 09:00:18.551782', '16', 'Mì tôm Hảo Hảo', 2, '[{\"changed\": {\"fields\": [\"Discounted price\"]}}]', 7, 1),
(153, '2025-07-08 09:00:34.592576', '5', 'Mì tôm Hảo Hảo (Thùng 30 gói)', 2, '[{\"changed\": {\"fields\": [\"Discounted price\"]}}]', 7, 1),
(154, '2025-07-08 09:13:24.187131', '8', '8 - admin1 - thanhToan - 30000.0₫', 3, '', 11, 1),
(155, '2025-07-08 09:57:17.567106', '4', 'Đinh Quang Tùng', 2, '[]', 9, 1),
(156, '2025-07-08 09:57:22.644243', '3', 'Đinh Quang Trọng', 2, '[]', 9, 1),
(157, '2025-07-16 07:06:38.933416', '17', 'Kem nghệ', 1, '[{\"added\": {}}]', 14, 1),
(158, '2025-07-16 07:07:05.197832', '16', 'Mì tôm Hảo Hảo', 2, '[]', 14, 1),
(159, '2025-07-16 07:07:08.387492', '15', 'Sữa TH True Milk (Lốc 4 hộp)', 2, '[]', 14, 1),
(160, '2025-07-16 07:07:11.404680', '14', 'Gạo ST25 (Túi 5kg)', 2, '[]', 14, 1),
(161, '2025-07-16 07:07:16.660516', '13', 'Xúc xích Heo cao bồi', 2, '[]', 14, 1),
(162, '2025-07-16 07:07:22.158075', '12', 'Bật lửa', 2, '[]', 14, 1),
(163, '2025-07-16 07:07:25.565617', '11', 'Khẩu trang y tế (Hộp 50 cái)', 2, '[]', 14, 1),
(164, '2025-07-16 07:07:28.638439', '10', 'Đèn pin mini', 2, '[]', 14, 1),
(165, '2025-07-16 07:07:32.251312', '9', 'Pin tiểu AA', 2, '[]', 14, 1),
(166, '2025-07-16 07:07:35.619231', '8', 'Nước ngọt Fanta (Lon)', 2, '[]', 14, 1),
(167, '2025-07-16 07:07:39.957704', '7', 'Bánh Sandwich nho (Thùng 2 kg)', 2, '[]', 14, 1),
(168, '2025-07-16 07:07:44.472742', '6', 'Coca-Cola (Lốc 6 lon)', 2, '[]', 14, 1),
(169, '2025-07-16 07:07:47.489937', '5', 'Mì tôm Hảo Hảo (Thùng 30 gói)', 2, '[]', 14, 1),
(170, '2025-07-16 07:10:52.541247', '16', 'Mì tôm Hảo Hảo', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 14, 1),
(171, '2025-07-16 07:11:25.022895', '15', 'Sữa TH True Milk (Lốc 4 hộp)', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 14, 1),
(172, '2025-07-16 07:11:36.941652', '14', 'Gạo ST25 (Túi 5kg)', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 14, 1),
(173, '2025-07-16 07:11:48.405967', '13', 'Xúc xích Heo cao bồi', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 14, 1),
(174, '2025-07-16 07:12:00.487429', '12', 'Bật lửa', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 14, 1),
(175, '2025-07-16 07:12:16.069611', '11', 'Khẩu trang y tế (Hộp 50 cái)', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 14, 1),
(176, '2025-07-16 07:12:28.248341', '10', 'Đèn pin mini', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 14, 1),
(177, '2025-07-16 07:12:40.461981', '9', 'Pin tiểu AA', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 14, 1),
(178, '2025-07-16 07:12:50.073702', '8', 'Nước ngọt Fanta (Lon)', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 14, 1),
(179, '2025-07-16 07:13:03.338588', '7', 'Bánh Sandwich nho (Thùng 2 kg)', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 14, 1),
(180, '2025-07-16 07:13:14.085988', '6', 'Coca-Cola (Lốc 6 lon)', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 14, 1),
(181, '2025-07-16 07:13:24.438130', '5', 'Mì tôm Hảo Hảo (Thùng 30 gói)', 2, '[{\"changed\": {\"fields\": [\"Product image\"]}}]', 14, 1),
(182, '2025-07-16 15:37:15.447460', '14', 'OrderPlaced object (14)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 19, 1),
(183, '2025-07-16 15:39:53.604060', '12', '12 - trong - thanhToanSau - 30000.0₫', 2, '[{\"changed\": {\"fields\": [\"Payment status\", \"Paid\"]}}]', 18, 1),
(184, '2025-07-20 08:23:12.114340', '5', 'Đinh Quang Trọng', 3, '', 20, 1),
(185, '2025-07-20 08:29:21.194454', '8', 'Đinh Quang Trọng', 3, '', 20, 1),
(186, '2025-07-20 16:11:37.480980', '25', 'OrderPlaced object (25)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 19, 1),
(187, '2025-07-20 16:12:00.134576', '25', 'OrderPlaced object (25)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 19, 1),
(188, '2025-07-20 16:12:13.313502', '25', 'OrderPlaced object (25)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 19, 1),
(189, '2025-07-20 16:12:28.882854', '25', 'OrderPlaced object (25)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 19, 1),
(190, '2025-07-20 16:12:46.661788', '25', 'OrderPlaced object (25)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 19, 1),
(191, '2025-07-20 16:13:01.046619', '25', 'OrderPlaced object (25)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 19, 1),
(192, '2025-07-20 16:13:15.598411', '25', 'OrderPlaced object (25)', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 19, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(10, 'app_BanHang', 'cart'),
(8, 'app_BanHang', 'category'),
(9, 'app_BanHang', 'customer'),
(12, 'app_BanHang', 'orderplaced'),
(11, 'app_BanHang', 'payment'),
(7, 'app_BanHang', 'product'),
(13, 'app_BanHang', 'wishlist'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(17, 'orders', 'cart'),
(19, 'orders', 'orderplaced'),
(18, 'orders', 'payment'),
(16, 'orders', 'wishlist'),
(15, 'products', 'category'),
(14, 'products', 'product'),
(6, 'sessions', 'session'),
(20, 'users', 'customer');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-06-25 08:08:49.841346'),
(2, 'auth', '0001_initial', '2025-06-25 08:08:50.108257'),
(3, 'admin', '0001_initial', '2025-06-25 08:08:50.194802'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-06-25 08:08:50.203785'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-06-25 08:08:50.209661'),
(6, 'app_BanHang', '0001_initial', '2025-06-25 08:08:50.219313'),
(7, 'contenttypes', '0002_remove_content_type_name', '2025-06-25 08:08:50.267342'),
(8, 'auth', '0002_alter_permission_name_max_length', '2025-06-25 08:08:50.298417'),
(9, 'auth', '0003_alter_user_email_max_length', '2025-06-25 08:08:50.316997'),
(10, 'auth', '0004_alter_user_username_opts', '2025-06-25 08:08:50.322404'),
(11, 'auth', '0005_alter_user_last_login_null', '2025-06-25 08:08:50.348392'),
(12, 'auth', '0006_require_contenttypes_0002', '2025-06-25 08:08:50.350037'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2025-06-25 08:08:50.350037'),
(14, 'auth', '0008_alter_user_username_max_length', '2025-06-25 08:08:50.366645'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2025-06-25 08:08:50.398457'),
(16, 'auth', '0010_alter_group_name_max_length', '2025-06-25 08:08:50.416908'),
(17, 'auth', '0011_update_proxy_permissions', '2025-06-25 08:08:50.422385'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2025-06-25 08:08:50.439575'),
(19, 'sessions', '0001_initial', '2025-06-25 08:08:50.465166'),
(20, 'app_BanHang', '0002_remove_product_category_category_product_category', '2025-06-25 08:44:30.688684'),
(21, 'app_BanHang', '0003_remove_product_category_product_category', '2025-06-25 08:57:45.915358'),
(22, 'app_BanHang', '0004_alter_category_name_customer', '2025-06-29 08:52:11.770256'),
(23, 'app_BanHang', '0005_alter_customer_mobile', '2025-06-30 09:22:23.774209'),
(24, 'app_BanHang', '0006_cart', '2025-07-02 07:52:30.698416'),
(25, 'app_BanHang', '0007_payment_orderplaced', '2025-07-03 06:37:05.377381'),
(26, 'app_BanHang', '0008_wishlist', '2025-07-03 14:59:32.755362'),
(27, 'app_BanHang', '0009_alter_category_name_alter_category_sub_category', '2025-07-06 01:55:11.374890'),
(28, 'app_BanHang', '0010_alter_product_selling_price', '2025-07-06 02:36:03.115471'),
(29, 'app_BanHang', '0011_alter_product_composition_alter_product_prodapp', '2025-07-06 04:09:14.723738'),
(30, 'app_BanHang', '0012_remove_category_is_sub_remove_category_sub_category_and_more', '2025-07-06 04:34:03.192451'),
(31, 'app_BanHang', '0013_remove_category_parent_category_is_sub_and_more', '2025-07-06 04:49:56.334098'),
(32, 'app_BanHang', '0014_alter_category_sub_category', '2025-07-06 05:00:37.558962'),
(33, 'app_BanHang', '0015_remove_payment_razorpay_order_id_and_more', '2025-07-06 08:50:51.354691'),
(34, 'app_BanHang', '0016_alter_payment_payment_method', '2025-07-06 09:40:59.754837'),
(35, 'app_BanHang', '0017_alter_orderplaced_status_and_more', '2025-07-08 01:55:24.328745'),
(36, 'users', '0001_initial', '2025-07-16 05:59:48.825651'),
(37, 'products', '0001_initial', '2025-07-16 05:59:48.901041'),
(38, 'orders', '0001_initial', '2025-07-16 05:59:49.245453');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('dxi7n0b5sfqmqxe7w644t5mg4mszru6c', '.eJxVjDkOwjAUBe_iGll2vFPScwbrLwYHkCNlqRB3x5FSQPtm5r1Fhm2teVvKnEcWZ6HF6XdDoGdpO-AHtPskaWrrPKLcFXnQRV4nLq_L4f4dVFhqry07QhcGTGAV-wBIkVMKxhP7pDuxLoIJCJyYlFaxxDgYYtcLvDnx-QLlNzgS:1uc3pl:mO7F2gLuQiTdKPnSZwBdzzCifhZEuDHB5TOigldK7zY', '2025-07-30 15:14:13.216007'),
('eq5qe1pd5du90uhni6cjlynvq392g2es', '.eJxVjDsOwyAQRO9CHSHA4pcyfc6AdpclOImwZOzKyt1jSy6SbjTvzWwiwbrUtHae05jFVRhx-e0Q6MXtAPkJ7TFJmtoyjygPRZ60y_uU-X073b-DCr3uaxwiD8a6QkgMBbzN0SGSzgWVJ2eKMtpyCGw8gLY2mD2rEiMr0iqIzxcPADhn:1udWad:kEVFJXoPVuV_VVv_1ZIaoFl845Nhg4x-SyH3XPtXnQM', '2025-08-03 16:08:39.604343'),
('fgwxi6aosvlxqj1awq7jfvvxjz1sqjpv', '.eJxVjEEOwiAQRe_C2hCYAaEu3fcMZOgMUjVtUtqV8e7apAvd_vfef6lE21rT1mRJI6uLsur0u2UaHjLtgO803WY9zNO6jFnvij5o0_3M8rwe7t9BpVa_NWEsXIIzZF3GgM6fsyldALEgKBI4RySDAOxR2Et0HgcIpXQUgUC9P9_ON84:1uULUe:xj1xjTwvDUm2nATXcd6JXyDPkT4h6zehLG0xP-NrKC0', '2025-07-09 08:28:32.502891'),
('fvukq6jknlk83dc646c0n78pz2azei3l', '.eJxVjDkOwjAUBe_iGll2vFPScwbrLwYHkCNlqRB3x5FSQPtm5r1Fhm2teVvKnEcWZ6HF6XdDoGdpO-AHtPskaWrrPKLcFXnQRV4nLq_L4f4dVFhqry07QhcGTGAV-wBIkVMKxhP7pDuxLoIJCJyYlFaxxDgYYtcLvDnx-QLlNzgS:1udOtA:SFAjX2h_7QaoDxq-kGUbBDsb6rxuJ4VmT0MGvY1-XT4', '2025-08-03 07:55:16.982675'),
('g9szak3zhbq7ox87yi79qsbkt8hxptsw', '.eJxVjDkOwjAUBe_iGll2vFPScwbrLwYHkCNlqRB3x5FSQPtm5r1Fhm2teVvKnEcWZ6HF6XdDoGdpO-AHtPskaWrrPKLcFXnQRV4nLq_L4f4dVFhqry07QhcGTGAV-wBIkVMKxhP7pDuxLoIJCJyYlFaxxDgYYtcLvDnx-QLlNzgS:1ucxwW:rXWAF_9_AZEw0nWSbYvb3YIA_Pv8qwiOuV5p4t5Iwjo', '2025-08-02 03:08:56.427673'),
('mnuow2lks2fm759z9m8qc1xahtb5vp8r', '.eJxVjDkOwjAUBe_iGll2vFPScwbrLwYHkCNlqRB3x5FSQPtm5r1Fhm2teVvKnEcWZ6HF6XdDoGdpO-AHtPskaWrrPKLcFXnQRV4nLq_L4f4dVFhqry07QhcGTGAV-wBIkVMKxhP7pDuxLoIJCJyYlFaxxDgYYtcLvDnx-QLlNzgS:1ucnc0:IdbFCyWWTRwKKWysgm6FKB2lXUjh4wOjBYf_R72WUo0', '2025-08-01 16:07:04.793721'),
('rdry9a7tk1o9874qlh0vwbj69qmvpkmz', '.eJxVjDkOwjAUBe_iGll2vFPScwbrLwYHkCNlqRB3x5FSQPtm5r1Fhm2teVvKnEcWZ6HF6XdDoGdpO-AHtPskaWrrPKLcFXnQRV4nLq_L4f4dVFhqry07QhcGTGAV-wBIkVMKxhP7pDuxLoIJCJyYlFaxxDgYYtcLvDnx-QLlNzgS:1udWGN:ivgqpJeCD49h_oOJapimKpt31JmXKYFXdNd3NU--XKM', '2025-08-03 15:47:43.275497');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_cart`
--

CREATE TABLE `orders_cart` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders_cart`
--

INSERT INTO `orders_cart` (`id`, `quantity`, `product_id`, `user_id`) VALUES
(58, 1, 10, 4),
(59, 2, 9, 4),
(75, 1, 16, 1),
(77, 2, 17, 1),
(81, 1, 13, 1),
(90, 2, 10, 2),
(91, 1, 11, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_orderplaced`
--

CREATE TABLE `orders_orderplaced` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `ordered_date` datetime(6) NOT NULL,
  `status` varchar(50) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders_orderplaced`
--

INSERT INTO `orders_orderplaced` (`id`, `quantity`, `ordered_date`, `status`, `customer_id`, `product_id`, `user_id`, `payment_id`) VALUES
(12, 2, '2025-07-08 09:31:00.798847', 'Đang chờ', 3, 11, 1, 9),
(17, 1, '2025-07-16 07:40:50.347898', 'Đang chờ', 3, 6, 1, 13),
(18, 1, '2025-07-16 07:42:18.022740', 'Đang chờ', 4, 8, 1, 14),
(20, 1, '2025-07-16 15:01:31.060132', 'Đang chờ', 7, 7, 5, 16),
(21, 2, '2025-07-16 15:02:47.556586', 'Đang chờ', 7, 7, 5, 17),
(22, 1, '2025-07-16 15:02:47.559932', 'Đang chờ', 7, 8, 5, 17),
(23, 1, '2025-07-16 15:02:47.562649', 'Đang chờ', 7, 9, 5, 17),
(24, 1, '2025-07-20 08:34:32.279312', 'Đang chờ', 9, 9, 2, 18),
(25, 1, '2025-07-20 08:34:57.727997', 'Đã đóng gói', 9, 16, 2, 19),
(26, 1, '2025-07-20 08:43:28.670144', 'Đang chờ', 10, 10, 2, 20),
(27, 4, '2025-07-20 08:45:51.527943', 'Đang chờ', 10, 13, 2, 21),
(28, 2, '2025-07-20 08:45:51.527943', 'Đang chờ', 10, 7, 2, 21),
(29, 1, '2025-07-20 08:45:51.539395', 'Đang chờ', 10, 5, 2, 21),
(30, 1, '2025-07-20 09:05:28.795058', 'Đang chờ', 10, 9, 2, 22),
(31, 3, '2025-07-20 09:05:58.472778', 'Đang chờ', 10, 16, 2, 23),
(32, 1, '2025-07-20 09:05:58.472778', 'Đang chờ', 10, 5, 2, 23),
(33, 1, '2025-07-20 09:07:04.954022', 'Đang chờ', 10, 8, 2, 24),
(34, 1, '2025-07-22 08:20:39.180769', 'Đang chờ', 9, 6, 2, 25),
(35, 0, '2025-07-22 08:20:39.180769', 'Đang chờ', 9, 8, 2, 25),
(36, 1, '2025-07-22 08:21:42.861335', 'Đang chờ', 9, 16, 2, 26);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_payment`
--

CREATE TABLE `orders_payment` (
  `id` bigint(20) NOT NULL,
  `amount` double NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders_payment`
--

INSERT INTO `orders_payment` (`id`, `amount`, `paid`, `user_id`, `created_at`, `payment_method`, `payment_status`, `transaction_id`) VALUES
(9, 60000, 0, 1, '2025-07-08 09:31:00.794361', 'thanhToanSau', 'Chờ xử lý', NULL),
(10, 79000, 1, 2, '2025-07-08 11:32:07.096261', 'thanhToan', 'Thành công', 'MA67ac9ef4'),
(11, 15000, 0, 2, '2025-07-08 11:47:30.006101', 'thanhToanSau', 'Chờ xử lý', NULL),
(12, 30000, 1, 2, '2025-07-09 04:02:03.409082', 'thanhToanSau', 'Đã thanh toán', NULL),
(13, 55000, 1, 1, '2025-07-16 07:40:50.345899', 'thanhToan', 'Thành công', 'MA03d14162'),
(14, 45000, 0, 1, '2025-07-16 07:42:18.019945', 'thanhToanSau', 'Chờ xử lý', NULL),
(15, 15000, 0, 2, '2025-07-16 08:52:08.090808', 'thanhToanSau', 'Chờ xử lý', NULL),
(16, 155000, 0, 5, '2025-07-16 15:01:31.056097', 'thanhToanSau', 'Chờ xử lý', NULL),
(17, 370000, 1, 5, '2025-07-16 15:02:47.554559', 'thanhToan', 'Thành công', 'MAc635e4c5'),
(18, 15000, 0, 2, '2025-07-20 08:34:32.277118', 'thanhToanSau', 'Chờ xử lý', NULL),
(19, 17000, 1, 2, '2025-07-20 08:34:57.725305', 'thanhToan', 'Thành công', 'MAe8ab1a48'),
(20, 49000, 0, 2, '2025-07-20 08:43:28.667809', 'thanhToanSau', 'Chờ xử lý', NULL),
(21, 575000, 1, 2, '2025-07-20 08:45:51.524895', 'thanhToan', 'Thành công', 'MA1ec88b7d'),
(22, 15000, 0, 2, '2025-07-20 09:05:28.787070', 'thanhToanSau', 'Chờ xử lý', NULL),
(23, 196000, 0, 2, '2025-07-20 09:05:58.472778', 'thanhToanSau', 'Chờ xử lý', NULL),
(24, 45000, 1, 2, '2025-07-20 09:07:04.951021', 'thanhToan', 'Thành công', 'MAadbc7326'),
(25, 55000, 0, 2, '2025-07-22 08:20:39.180769', 'thanhToanSau', 'Chờ xử lý', NULL),
(26, 17000, 1, 2, '2025-07-22 08:21:42.858339', 'thanhToan', 'Thành công', 'MAe44641f3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_category`
--

CREATE TABLE `products_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `is_sub` tinyint(1) NOT NULL,
  `sub_category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products_category`
--

INSERT INTO `products_category` (`id`, `name`, `slug`, `is_sub`, `sub_category_id`) VALUES
(4, 'Mì ăn liền', 'mi-an-lien', 1, 9),
(5, 'Nước ngọt', 'nuoc-ngot', 1, 12),
(6, 'Sữa', 'sua', 1, 12),
(7, 'Bánh', 'banh', 1, 9),
(8, 'Đồ dùng tiện ích', 'do-dung-tien-ich', 0, NULL),
(9, 'Thực phẩm', 'thuc-pham', 0, NULL),
(10, 'Đồ gia dụng', 'do-gia-dung', 0, NULL),
(11, 'Hóa mỹ phẩm', 'hoa-my-pham', 0, NULL),
(12, 'Đồ uống', 'do-uong', 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_product`
--

CREATE TABLE `products_product` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `selling_price` double NOT NULL,
  `discounted_price` double DEFAULT NULL,
  `description` longtext NOT NULL,
  `composition` longtext DEFAULT NULL,
  `prodapp` longtext DEFAULT NULL,
  `product_image` varchar(100) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products_product`
--

INSERT INTO `products_product` (`id`, `title`, `selling_price`, `discounted_price`, `description`, `composition`, `prodapp`, `product_image`, `category_id`) VALUES
(5, 'Mì tôm Hảo Hảo (Thùng 30 gói)', 145000, 145000, 'Mì Hảo Hảo hương vị Tôm Chua Cay là sản phẩm nổi tiếng và quen thuộc với người tiêu dùng Việt Nam. Sợi mì dai ngon, kết hợp với vị nước súp đậm đà, chua cay hấp dẫn, dễ ăn, thích hợp cho mọi bữa ăn nhanh, đặc biệt tiện lợi khi bận rộn hoặc đi du lịch. Sản phẩm được đóng gói gọn nhẹ, dễ bảo quản.', 'Bột mì, dầu cọ tinh luyện, muối, đường, bột gia vị, hành lá sấy khô, ớt, chất điều vị (mononatri glutamat), chất chống oxy hóa.', 'Cho mì và các gói gia vị vào tô, chế khoảng 400ml nước sôi, đậy nắp trong vòng 3 phút. Mở nắp, trộn đều và thưởng thức ngay khi nóng.', 'product/thung_haohao.jpg', 4),
(6, 'Coca-Cola (Lốc 6 lon)', 60000, 55000, 'Coca-Cola là loại nước giải khát có ga với hương vị đặc trưng, sảng khoái, thích hợp dùng trong bữa ăn hoặc khi cần tỉnh táo. Sản phẩm nổi tiếng toàn cầu, an toàn và dễ uống.', 'Nước bão hòa CO2, đường, màu caramel, axit citric, caffeine, hương liệu cola.', 'Ngon hơn khi uống lạnh. Không nên lắc mạnh trước khi mở nắp để tránh trào nước.', 'product/coca1.jpg', 5),
(7, 'Bánh Sandwich nho (Thùng 2 kg)', 169000, 155000, 'Bánh mì sandwich mềm thơm với hương vị nhẹ nhàng, tiện lợi cho bữa sáng hoặc các bữa phụ. Có thể dùng trực tiếp hoặc kẹp cùng nhân mặn/ngọt tùy sở thích. Bánh được sản xuất đảm bảo vệ sinh an toàn thực phẩm.', 'Bột mì, nho, nước, đường, men nở, muối, bơ thực vật.', '', 'product/banhmi1.jpg', 7),
(8, 'Nước ngọt Fanta (Lon)', 50000, 45000, 'Com bo 6 lon Nước ngọt Fanta hương Xá xị. \r\nFanta là loại nước giải khát có gas với hương vị cam tươi mát, thơm ngon, sảng khoái. Sản phẩm phù hợp với mọi lứa tuổi, đặc biệt là giới trẻ yêu thích đồ uống ngọt và có ga. Với màu sắc rực rỡ và hương cam tự nhiên, Fanta là lựa chọn hoàn hảo cho những buổi tụ họp, tiệc nhỏ hoặc đơn giản chỉ để giải khát hàng ngày.', 'Nước bão hòa CO₂, đường, hương cam tự nhiên và tổng hợp, màu thực phẩm (E110), axit citric, chất bảo quản, hương liệu thực phẩm.', '+Lắc nhẹ trước khi uống (không lắc mạnh vì có gas).\r\n\r\n+Ngon hơn khi uống lạnh.\r\n\r\n+Bảo quản nơi khô mát, tránh ánh nắng trực tiếp.', 'product/fanta1.jpg', 5),
(9, 'Pin tiểu AA', 18000, 15000, 'Pin Energizer AA (Vỉ 4 viên ) là loại pin kiềm có độ bền cao, cung cấp năng lượng ổn định cho các thiết bị như điều khiển TV, chuột không dây, đồng hồ,... Sản phẩm có thể lưu trữ lâu mà không bị chảy nước, an toàn cho người dùng.', 'Hợp chất kiềm, kẽm, mangan, vỏ pin thép không gỉ.', 'Lắp pin đúng chiều (+/-) vào thiết bị điện tử. Bảo quản nơi khô ráo, tránh nhiệt độ cao.', 'product/pin1.jpg', 8),
(10, 'Đèn pin mini', 55000, 49000, 'Đèn pin mini sạc USB. \r\nĐèn pin LED mini có cổng sạc USB tiện lợi, thiết kế nhỏ gọn, phù hợp mang theo khi đi phượt, đi đêm hoặc cúp điện. Có thể sạc lại nhiều lần và dùng được trong nhiều giờ.', 'Vỏ nhựa ABS chịu lực, chip LED, pin lithium-ion, cổng sạc USB.', 'Sạc đầy trước khi sử dụng (qua sạc điện thoại/USB laptop), nhấn nút để bật/tắt đèn. Không dùng khi đang sạc.', 'product/denpin1.jpg', 8),
(11, 'Khẩu trang y tế (Hộp 50 cái)', 30000, 30000, 'Khẩu trang y tế 4 lớp chất lượng cao giúp ngăn ngừa bụi mịn, vi khuẩn, phù hợp sử dụng trong môi trường công cộng, bệnh viện, nơi đông người. Thiết kế ôm sát khuôn mặt, thoải mái khi đeo lâu.', 'Vải không dệt, lớp màng lọc kháng khuẩn, thanh nẹp mũi bằng nhựa mềm, dây thun co giãn.', 'Đeo đúng mặt ngoài (màu xanh ra ngoài), che kín mũi miệng, ấn nhẹ phần nẹp mũi. Thay mới sau mỗi 4–6 tiếng sử dụng.', 'product/khautrang1.jpg', 8),
(12, 'Bật lửa', 3000, 3000, 'Bật lửa mini dùng một lần.\r\nBật lửa mini tiện dụng, gọn nhẹ, dễ sử dụng. Dùng để nhóm lửa, đốt nhang, bếp gas,... Thích hợp cho nhu cầu sử dụng hàng ngày hoặc mang theo khi đi xa.', 'Vỏ nhựa, van đồng, đá lửa, khí gas butan nén.', 'Xoay bánh đá và nhấn để phát lửa. Tránh để gần nguồn nhiệt hoặc nơi có trẻ em.', 'product/batlua1.jpg', 8),
(13, 'Xúc xích Heo cao bồi', 35000, 30000, 'Xúc xích (gói 5 cây) là sản phẩm ăn liền tiện dụng, được làm từ nguyên liệu thịt tươi sạch, có vị ngon và độ dai phù hợp với mọi lứa tuổi. Được tiệt trùng đảm bảo an toàn thực phẩm, không cần bảo quản lạnh.', 'Thịt heo, tinh bột biến tính, muối, đường, hương liệu, chất ổn định.', 'Ăn liền ngay sau khi bóc bao bì, hoặc có thể chiên, nướng, luộc tùy khẩu vị.', 'product/xucxichheo1.jpg', 9),
(14, 'Gạo ST25 (Túi 5kg)', 130000, 120000, 'Gạo ST25 là giống gạo thơm nổi tiếng, đạt danh hiệu \"Ngon nhất thế giới\", được trồng tại Sóc Trăng. Hạt dài, trắng, cơm dẻo, mềm và có mùi thơm tự nhiên, đặc biệt không chứa chất bảo quản.', '100% gạo ST25 nguyên chất, không trộn tạp.', 'Vo nhẹ 1–2 lần với nước sạch, nấu với tỉ lệ 1 gạo : 1.2–1.5 nước. Có thể dùng nồi cơm điện hoặc nồi truyền thống.', 'product/GaoST25.jpg', 9),
(15, 'Sữa TH True Milk (Lốc 4 hộp)', 32000, 28000, 'Sữa TH True Milk 180ml – \r\nSữa tiệt trùng từ trang trại TH, được chế biến theo công nghệ hiện đại, bổ sung vi chất có lợi. Sản phẩm an toàn, phù hợp cho trẻ em và người lớn.', 'Sữa tươi nguyên chất 98%, đường, canxi, vitamin A, D3.', 'Uống trực tiếp, ngon hơn khi để lạnh. Lắc nhẹ trước khi dùng.', 'product/thmilk.jpg', 6),
(16, 'Mì tôm Hảo Hảo', 17000, 17000, 'aa', 'aa', 'aa', 'product/mihaohao2.jpg', 4),
(17, 'Kem nghệ', 25000, 20000, '11', 'sd', 'dsd', 'product/kemnghe1.jpg', 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_wishlist`
--

CREATE TABLE `products_wishlist` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products_wishlist`
--

INSERT INTO `products_wishlist` (`id`, `product_id`, `user_id`) VALUES
(30, 7, 5),
(31, 10, 1),
(34, 5, 1),
(35, 11, 2),
(46, 16, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_customer`
--

CREATE TABLE `users_customer` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `locality` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `state` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users_customer`
--

INSERT INTO `users_customer` (`id`, `name`, `locality`, `city`, `mobile`, `zipcode`, `state`, `user_id`) VALUES
(3, 'Đinh Quang Trọng', 'Thị trấn Quán Lào-Yên Định-Thanh Hóa', 'Thanh Hóa', '0352581845', 2345, 'Đắk Nông', 1),
(4, 'Đinh Quang Tùng', 'Thị trấn Quán Lào-Yên Định-Thanh Hóa', 'Thanh Hóa', '0352581845', 2345, 'Đắk Nông', 1),
(6, 'Đinh Quang Trọng', 'ad', 'aa', '12132323', 22221, 'Đồng Nai', 4),
(7, 'Đinh Quang Trọng', 'Thị trấn Quán Lào-Yên Định-Thanh Hóa', 'Thanh Hóa', '0352581845', 1233, 'Đắk Nông', 5),
(9, 'Đinh Quang Trọng', 'Thị trấn Quán Lào-Yên Định-Thanh Hóa', 'Thanh Hóa', '0352581845', 234, 'Cần Thơ', 2),
(10, 'dgg', 'Thị trấn Quán Lào-Yên Định-Thanh Hóa', 'ewe', '6767767', 433, 'Đắk Nông', 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `orders_cart`
--
ALTER TABLE `orders_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_BanHang_cart_product_id_1c801a7b_fk_app_BanHang_product_id` (`product_id`),
  ADD KEY `app_BanHang_cart_user_id_87addbe2_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orders_orderplaced`
--
ALTER TABLE `orders_orderplaced`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_BanHang_orderpla_customer_id_6c452122_fk_app_BanHa` (`customer_id`),
  ADD KEY `app_BanHang_orderpla_product_id_7465e965_fk_app_BanHa` (`product_id`),
  ADD KEY `app_BanHang_orderplaced_user_id_4a24f9a1_fk_auth_user_id` (`user_id`),
  ADD KEY `app_BanHang_orderpla_payment_id_23b1521a_fk_app_BanHa` (`payment_id`);

--
-- Chỉ mục cho bảng `orders_payment`
--
ALTER TABLE `orders_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_BanHang_payment_user_id_ca0a00a7_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `products_category`
--
ALTER TABLE `products_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `app_BanHang_category_sub_category_id_6d32f95d` (`sub_category_id`);

--
-- Chỉ mục cho bảng `products_product`
--
ALTER TABLE `products_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_BanHang_product_category_id_a7cbd1f9_fk_app_BanHa` (`category_id`);

--
-- Chỉ mục cho bảng `products_wishlist`
--
ALTER TABLE `products_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_BanHang_wishlist_product_id_4e752983_fk_app_BanHa` (`product_id`),
  ADD KEY `app_BanHang_wishlist_user_id_d43ceb29_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users_customer`
--
ALTER TABLE `users_customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_BanHang_customer_user_id_b1ee6afc_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `orders_cart`
--
ALTER TABLE `orders_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT cho bảng `orders_orderplaced`
--
ALTER TABLE `orders_orderplaced`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `orders_payment`
--
ALTER TABLE `orders_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `products_category`
--
ALTER TABLE `products_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `products_product`
--
ALTER TABLE `products_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `products_wishlist`
--
ALTER TABLE `products_wishlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `users_customer`
--
ALTER TABLE `users_customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `orders_cart`
--
ALTER TABLE `orders_cart`
  ADD CONSTRAINT `app_BanHang_cart_product_id_1c801a7b_fk_app_BanHang_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  ADD CONSTRAINT `app_BanHang_cart_user_id_87addbe2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `orders_orderplaced`
--
ALTER TABLE `orders_orderplaced`
  ADD CONSTRAINT `app_BanHang_orderpla_customer_id_6c452122_fk_app_BanHa` FOREIGN KEY (`customer_id`) REFERENCES `users_customer` (`id`),
  ADD CONSTRAINT `app_BanHang_orderpla_payment_id_23b1521a_fk_app_BanHa` FOREIGN KEY (`payment_id`) REFERENCES `orders_payment` (`id`),
  ADD CONSTRAINT `app_BanHang_orderpla_product_id_7465e965_fk_app_BanHa` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  ADD CONSTRAINT `app_BanHang_orderplaced_user_id_4a24f9a1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `orders_payment`
--
ALTER TABLE `orders_payment`
  ADD CONSTRAINT `app_BanHang_payment_user_id_ca0a00a7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `products_category`
--
ALTER TABLE `products_category`
  ADD CONSTRAINT `app_BanHang_category_sub_category_id_6d32f95d_fk_app_BanHa` FOREIGN KEY (`sub_category_id`) REFERENCES `products_category` (`id`);

--
-- Các ràng buộc cho bảng `products_product`
--
ALTER TABLE `products_product`
  ADD CONSTRAINT `app_BanHang_product_category_id_a7cbd1f9_fk_app_BanHa` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`);

--
-- Các ràng buộc cho bảng `products_wishlist`
--
ALTER TABLE `products_wishlist`
  ADD CONSTRAINT `app_BanHang_wishlist_product_id_4e752983_fk_app_BanHa` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  ADD CONSTRAINT `app_BanHang_wishlist_user_id_d43ceb29_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `users_customer`
--
ALTER TABLE `users_customer`
  ADD CONSTRAINT `app_BanHang_customer_user_id_b1ee6afc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
