-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2025 at 04:13 PM
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
-- Database: `digitech`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `subtitle`, `image`, `link_url`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Elevate Your Shots', 'Tripods and stabilizers', 'banners/hero_01.mp4', NULL, 1, 1, '2025-11-02 10:01:44', '2025-11-02 10:01:44'),
(2, 'Hero Video', NULL, 'banners/hero_01.mp4', NULL, 0, 1, '2025-11-02 10:28:00', '2025-11-02 10:28:00'),
(3, 'Hero Video', NULL, 'banners/hero_02.mp4', NULL, 1, 1, '2025-11-02 10:28:03', '2025-11-02 10:28:03'),
(4, 'Hero Slide', NULL, 'banners/slide_01.jpg', NULL, 10, 1, '2025-11-02 10:28:05', '2025-11-02 10:28:05'),
(5, 'Hero Slide', NULL, 'banners/slide_02.png', NULL, 11, 1, '2025-11-02 10:28:06', '2025-11-02 10:28:06');

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `published_at` timestamp NULL DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-tyagiarun92@gmail.com|127.0.0.1', 'i:1;', 1762274609),
('laravel-cache-tyagiarun92@gmail.com|127.0.0.1:timer', 'i:1762274609;', 1762274609);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `description`, `image`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Camera Accessories', 'camera-accessories', NULL, NULL, 1, 0, '2025-11-02 10:01:44', '2025-11-02 10:01:44'),
(2, NULL, 'Mobile Accessories', 'mobile-accessories', NULL, NULL, 1, 0, '2025-11-02 10:01:44', '2025-11-02 10:01:44'),
(3, NULL, 'Audio Gear', 'audio-gear', NULL, NULL, 1, 0, '2025-11-02 10:01:44', '2025-11-02 10:01:44'),
(4, NULL, 'Lighting', 'lighting', NULL, NULL, 1, 0, '2025-11-02 10:01:44', '2025-11-02 10:01:44'),
(5, NULL, 'Imported', 'imported', NULL, NULL, 1, 0, '2025-11-02 10:26:53', '2025-11-02 10:26:53');

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `status` varchar(255) NOT NULL DEFAULT 'new',
  `admin_notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`id`, `name`, `email`, `phone`, `message`, `items`, `status`, `admin_notes`, `created_at`, `updated_at`) VALUES
(1, 'Antonia Diaz', 'antoniadiaz0120@gmail.com', NULL, 'Hello,\r\nFollowing the completion of your website, we conducted a quick backend check to ensure everything was functioning smoothly. However, the results revealed that your website is currently not appearing on major search engines like Google and Bing when relevant keywords related to your business are searched.\r\nThis is primarily due to the lack of proper SEO (Search Engine Optimization), which is currently incomplete. Without it, your website will struggle to appear in search results, meaning your target audience won’t be able to find you and your site won’t receive the traffic or conversions it was designed to generate.\r\nPlease share your phone number and a convenient time for a brief call. We’d be happy to guide you on how we can help you attract more traffic.\r\nThanks,', '[]', 'new', NULL, '2025-11-06 18:31:53', '2025-11-06 18:31:53'),
(2, 'Cornelius Carmody', 'join@domainsindex.pro', NULL, 'Hello,\r\n\r\nAdd your solarsetupindia.com website to Google Search Index and have it displayed in Web Search Results.\r\n\r\nRegister solarsetupindia.com at https://searchregister.info', '[]', 'new', NULL, '2025-11-08 00:46:59', '2025-11-08 00:46:59'),
(3, 'King Stokes', 'add@domainindex.pro', NULL, 'Hello,\r\n\r\nAdd solarsetupindia.com website in Google Search Index to have it appear in Web Search Results.\r\n\r\nSubmit solarsetupindia.com at https://searchregister.net', '[]', 'new', NULL, '2025-11-09 05:38:39', '2025-11-09 05:38:39');

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_02_151601_create_categories_table', 1),
(5, '2025_11_02_151603_create_products_table', 1),
(6, '2025_11_02_151604_create_product_images_table', 1),
(7, '2025_11_02_151606_create_product_specifications_table', 1),
(8, '2025_11_02_151608_create_banners_table', 1),
(9, '2025_11_02_151621_create_blog_posts_table', 1),
(10, '2025_11_02_151624_create_enquiries_table', 1),
(11, '2025_11_02_151628_create_testimonials_table', 1),
(12, '2025_11_02_151630_add_is_admin_to_users_table', 1),
(13, '2025_11_02_160308_add_source_columns_to_products', 2),
(14, '2025_11_02_161028_create_orders_table', 3),
(15, '2025_11_02_161036_create_order_items_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(255) NOT NULL DEFAULT 'qr',
  `payment_reference` varchar(255) DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `email`, `phone`, `address`, `notes`, `subtotal`, `total`, `status`, `payment_method`, `payment_reference`, `paid_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'arun', 'aruntyagi@gmail.com', '9090909090', 'testing', 'testing', 11598.00, 11598.00, 'pending', 'qr', 'text', NULL, '2025-11-04 11:02:36', '2025-11-04 11:02:36'),
(2, NULL, 'arun', 'aruntyagi@fmail.com', '9999999999', 'test', 'test\nPayment screenshot: payments/screenshots/JwdGRE1fzzVH5Udevl7U2hPu7eLOYAbegVPyYbVV.webp', 399.00, 399.00, 'pending', 'qr', '90', NULL, '2025-11-09 17:16:06', '2025-11-09 17:16:06');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `line_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `name`, `price`, `quantity`, `line_total`, `created_at`, `updated_at`) VALUES
(1, 1, 12, 'Digitek (DSG 007F) 3 Axis Handheld Steady Gimbal PTZ Camera Mount for All Smart Phones with Face & Object Tracking Motion, Various Time Lapse Features', 5799.00, 2, 11598.00, '2025-11-04 11:02:36', '2025-11-04 11:02:36'),
(2, 2, 39, 'Digitek Type C to Type C Cable for Micropghones to be used with Android Smartphones / Tablets', 399.00, 1, 399.00, '2025-11-09 17:16:06', '2025-11-09 17:16:06');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `specs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`specs`)),
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `source_domain` varchar(255) DEFAULT NULL,
  `source_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `sku`, `short_description`, `description`, `price`, `is_featured`, `is_active`, `specs`, `tags`, `meta_title`, `meta_description`, `source_domain`, `source_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'Camera Accessories Pro', 'camera-accessories-pro', 'FN25K5ZW', 'Creator-grade performance in a compact form.', NULL, 70.23, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-02 10:01:44', '2025-11-04 11:54:08'),
(2, 2, 'Mobile Accessories Pro', 'mobile-accessories-pro', 'XFK9UUCI', 'Creator-grade performance in a compact form.', NULL, 55.38, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-02 10:01:44', '2025-11-04 11:53:50'),
(3, 3, 'Audio Gear Pro', 'audio-gear-pro', 'U4ZQBH5E', 'Creator-grade performance in a compact form.', NULL, 79.96, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-02 10:01:44', '2025-11-04 11:53:32'),
(4, 4, 'Lighting Pro', 'lighting-pro', 'RV8GVN4V', 'Creator-grade performance in a compact form.', NULL, 63.32, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-02 10:01:44', '2025-11-04 11:53:15'),
(5, 5, 'Digitek® (DWM 101) Wireless Microphone System with ANC Noise Reduction, 360° Sound Capture, 100M Range, Upto 12 Hrs Working Time, for DSLR Camera, Android & iOS Smartphones, Seamless Audio Recording', 'digitek-dwm-101-wireless-microphone-system-with-anc-noise-red', 'DWM-101', '\nEnhanced headphone monitoring function, allowing you to monitor in real-time while shooting. with 3.5mm interface. with two 3.mm cables, can be used with laptop/PC/DSLR Camera / a...', '\nEnhanced headphone monitoring function, allowing you to monitor in real-time while shooting. with 3.5mm interface. with two 3.mm cables, can be used with laptop/PC/DSLR Camera / amplifier/ DV / Camcorder/ smartphone / mixer, etc.\n360 degrees Ultra-Clear pickup/receiver equal amount of sound from all directions\nCrystal-clear audio for any type of content creation.\nPlug and play-automatic pairing. the signal transmission with low latency &amp; without interruption. suitable for video shooting.\nHigh performance wireless transmission-effective up to 100 meters. Ultra stable signal; audio &amp; video synchronization.\n', 4399.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/wireless-microphone-system-for-dslr-dwm101', '2025-11-02 10:26:53', '2025-11-02 10:35:00'),
(6, 5, 'Digitek (LED-D6W RGB) Portable Mini RGB LED Video Light with inbuild Battery & 360° HSI, 3000K-6000K, 8-Level Control, 9 Special FX Modes, Type-C Charging, 1hr Battery, for Photography & Videoshoots', 'digitek-led-d6w-rgb-portable-mini-rgb-led-video-light-with-inb', 'LED-D6W RGB', '\nPORTABLE AND RECHARGEABLE: Multi-color mini LED video light with an inbuilt battery, perfect for on-the-go use and creative lighting effects.\nHSI 0-360° FULL-COLOR SPECTRUM: Enabl...', '\nPORTABLE AND RECHARGEABLE: Multi-color mini LED video light with an inbuilt battery, perfect for on-the-go use and creative lighting effects.\nHSI 0-360° FULL-COLOR SPECTRUM: Enables precise and vibrant color customization for professional-quality visuals.\nADJUSTABLE COLOR TEMPERATURE: Ranges from 3000K to 6000K, ensuring adaptability to different lighting environments.\n8-LEVEL BRIGHTNESS CONTROL: Allows fine-tuning of light intensity to suit diverse shooting scenarios.\n7 UNIQUE COLOR MODES: Adds dynamic and creative lighting options for photos and videos.\nWHITE OLED DISPLAY: Offers an intuitive interface and real-time visibility of settings for hassle-free operation.\n1 HOURS RUNTIME: Provides extended usage at 100% brightness, ideal for extended shoots and projects.\n', 1299.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-led-d6w-rgb-portable-mini-rgb-led-video-light-with-inbuild-battery-360-hsi-3000k-6000k-8-level-control-9-special-fx-modes-type-c-charging-2hr-battery-for-photography-videoshoots', '2025-11-02 10:26:55', '2025-11-02 10:35:03'),
(7, 5, 'DIGITEK® (DTR 550 LW) 67 Inch Foldable Tripod Stand with Phone Holder & 360° Ball Head, 5kg Load Capacity, Aluminum Alloy Legs with Rubberized Feet & Flip Locks, Carry Bag, for Photo & Video Shoots', 'digitek-dtr-550-lw-67-inch-foldable-tripod-stand-with-phone-h', 'DTR-550 LW', '\nPremium finish light weight professional tripod with adjustable height, multi level locking and steady rubberized legs\nCompatible with most video cameras, digital cameras, still c...', '\nPremium finish light weight professional tripod with adjustable height, multi level locking and steady rubberized legs\nCompatible with most video cameras, digital cameras, still cameras, GoPro devices and smartphones. Height Range: 615 mm - 1700 mm\nMultipurpose head with Quick Release helps ensure fast transitions between shots\nBuilt-in bubble head to adjust horizontal position and 3-way head with adjustable pan to allow for tilt and swivel motion with portrait or landscape options\nThis professional tripod features multipurpose head for DV camera\'s\nConvinient accessories hook to latch all your shoot belongings\nRecommended max load weight is 5kg for optimal performance\n', 1599.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/tripod-for-dslr-camera-with-operating-dtr550lw', '2025-11-02 10:26:58', '2025-11-02 10:35:05'),
(8, 5, 'Digitek (DRL-18RT C6) Professional 46cm LED Ring Light with Remote & 158cm Light Stand, Runs on AC Power with No Shadow apertures, Ideal use for Makeup, Video Shoot, Fashion Photography & Many More', 'digitek-drl-18rt-c6-professional-46cm-led-ring-light-with-remo', 'DRL-18RTC6', '\nMulti-angle: With a 360-degree rotated intelligent phone holder, you can angle vertically or horizontally without taking the phone out of the holder.\nFor photographers, a hot shoe...', '\nMulti-angle: With a 360-degree rotated intelligent phone holder, you can angle vertically or horizontally without taking the phone out of the holder.\nFor photographers, a hot shoe adapter included fits onto a standard accessory shoe on the stand.\nDual color modes: With color temperature variables from 3200 to 5600k\nButton controls: DRL-18RTC comes with Intensity control, Color temperature control &amp; power button making it easier to operate.\nIt comes with Ring Light stand &amp; Remote this Ring Light.\n', 3399.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/professional-46cm-led-ring-light-with-remote-158cm-light-stand-drl-18rtc6', '2025-11-02 10:27:00', '2025-11-02 10:35:06'),
(9, 5, 'DIGITEK® (DSL-25W RGB) Stick Light Portable Handheld RGB LED Light Wand with Barn Door & Remote Control, Color Temp 2700-7500K + RGB, 39 Special Lighting Effects & Carry Bag', 'digitek-dsl-25w-rgb-stick-light-portable-handheld-rgb-led-lig', 'DSL-25W RGB', '\nControl By Remote: You can control the RGB led light wirelessly using the remote or can easily adjust brightness and light effects using the control buttons.\nSpecial Lighting Effe...', '\nControl By Remote: You can control the RGB led light wirelessly using the remote or can easily adjust brightness and light effects using the control buttons.\nSpecial Lighting Effect: Features with 39 color modes, brightness adjustment, &amp; maximum 3000 lumens CRI &gt;96+2 with 25w &amp; Color temperature ranging from 2700 K - 7500K + RGB.\nCreative Music Mode: Colour temperature and brightness of the light are adjusted based on the situation and can also be changed as per the music.\nBattery &amp; Temperature: Operates on NP-F750 Li-ion Battery(Battery not include) &amp; AC both. Power Adapter DC 9V 3A Adapter. Easy to use at any temperature ( -10° to 60°C )\n\nFlexible Adjustment: Can be held in your hand to achieve more flexible lighting, or you can install the RGB LED light to a light stand or tripod via the bottom 1/4 inch screw hole for more stable usage. [ Light Stand Not Included]\n\n', 4199.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/portable-handheld-rgb-led-light-wand-with-barn-door-dsl-25wrgb', '2025-11-02 10:27:03', '2025-11-02 10:35:08'),
(10, 5, 'DIGITEK (DTR-555 SS) Foldable Tripod Selfie Stick for Smartphone & Action Cameras with 5.57ft Height, 360° Rotation & 3-Leg Base, 10m Wireless Remote, 7 Section Adjustable, For Android/iPhone & Gopro', 'digitek-dtr-555-ss-foldable-tripod-selfie-stick-for-smartphone', 'DTR-555 SS', '\nVersatile Extendable Length and Adjustable Sections: Long tripod selfie Stick cum tripod with a maximum height of 160cm and seven section adjustments, this selfie stick can be tai...', '\nVersatile Extendable Length and Adjustable Sections: Long tripod selfie Stick cum tripod with a maximum height of 160cm and seven section adjustments, this selfie stick can be tailored to your shooting needs, ranging from a compact folded height of 330.2mm for easy transportation to full extension for capturing wide-angle shots and group selfies.\nWireless Remote and 360° Ball Head: Includes a wireless remote with a 10-meter range, allowing you to capture photos and videos remotely. The 360° ball head ensures smooth panning and tilting, enabling shots from various angles with ease.\nDurable and Lightweight Construction: Made from a durable aluminum rod, this selfie stick is both sturdy and lightweight, weighing just 0.44kg, making it ideal for travel and outdoor adventures.\nStable Base and High Load Capacity: Features a tripod base with three legs for added stability on uneven surfaces and can support a maximum load of 2kg, providing steady support for your phone or action camera setup.\nWide Compatibility and GoPro Adapter: Compatible with phones and action cameras, including a GoPro adapter for versatile shooting options, ensuring flexibility for various photography and videography needs.\n', 1099.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-dtr-555-ss-foldable-tripod-selfie-stick-for-smartphone-action-cameras-with-5-57ft-height-360-rotation-3-leg-base-10m-wireless-remote-7-section-adjustable-for-android-iphone-gopro', '2025-11-02 10:27:05', '2025-11-02 10:35:09'),
(11, 5, 'Digitek (DSB-65 Bowens) Octagon Soft Box with Bowens Mount Lightweight & Portable Soft Box Comes with Diffuser Sheets | Carrying Case. DSB-65 Bowens', 'digitek-dsb-65-bowens-octagon-soft-box-with-bowens-mount-light', 'DSB-65 Bowens', '\nProvides classic soft but crisp light, for portrait and event photography; Ideal for shooting portraits or event such as weddings, proms or corporate events on location etc.\nHigh...', '\nProvides classic soft but crisp light, for portrait and event photography; Ideal for shooting portraits or event such as weddings, proms or corporate events on location etc.\nHigh Reflective; Made of collapsible nylon cover and proved to be high reflective; With silver particle inner baffle and 2 white diffuser, help your photography by softening the flash light and casting even lighting.\nQUICK OPENING AND FOLDING : Special design makes it quite easy to open or fold up, can be assembled or disassembled in a minute.\nCONVENIENCE : Light weight, foldable , and comes with a carrying case, convenient for storage or transportation.\n', 2299.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/octagon-soft-box-with-bowens-mount-lightweight-portable-softbox-dsb-65-bowens', '2025-11-02 10:27:07', '2025-11-02 10:35:11'),
(12, 5, 'Digitek (DSG 007F) 3 Axis Handheld Steady Gimbal PTZ Camera Mount for All Smart Phones with Face & Object Tracking Motion, Various Time Lapse Features', 'digitek-dsg-007f-3-axis-handheld-steady-gimbal-ptz-camera-moun', 'DSG-007F', '\nEasy operation: Switch between horizontal and vertical shooting, and capture fast movements without missing any details. No need to manually adjust the stand. Possess high-precisi...', '\nEasy operation: Switch between horizontal and vertical shooting, and capture fast movements without missing any details. No need to manually adjust the stand. Possess high-precision physical anti-shake technology, no need to change the balance, ready to use \n3 creative operation modes: All follow method, half follow mode, and all locking mode for precise shooting. Single button press to switch between horizontal and vertical shooting\nPotable and foldable: Easy to carry during travel, tilt angle: 160°, roll angle: 325°, pan angle: 340°, weighing only 362gms\nCompatible with most smartphones: Widely compatible with most smartphones like iPhone all models, Samsung, google pixel, Realme x, oppo, Vivo, Nokia, etc\nMake your own smooth &amp; professional videos with ease A3 - Axis gimbal stabilizes the camera for smooth video on the move. This technology is also great for a crisp photo at any time   \n', 5799.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/3-axis-handheld-steady-gimbal-ptz-camera-mount-for-all-smar-phones-dsg007f', '2025-11-02 10:27:11', '2025-11-02 10:35:12'),
(13, 5, 'Digitek GoCAM (DAC-101) 5K 30FPS 48MP WiFi Ultra HD Sports Action Camera| Dual TouchScreen|6-Axis Gyro EIS Stabilization | MIC Support Waterproof | 2 Batteries (Black)', 'digitek-gocam-dac-101-5k-30fps-48mp-wifi-ultra-hd-sports-actio', 'DAC-101', ' Watch the Official video\n\nDigitek DAC-101 GoCAM has features you\'ll love exploring and Native 5K 60FPS crystal explicit videos that will inspire the advanced photographer in you!...', ' Watch the Official video\n\nDigitek DAC-101 GoCAM has features you\'ll love exploring and Native 5K 60FPS crystal explicit videos that will inspire the advanced photographer in you! It comes with dual screens feature. You can capture selfies in any extreme environment with an intuitive 2″ LCD Touch Screen on the rare and a stunning new front 1.3″ LCD Colour screen.\n\n\nTaking 6-Axis Gyro EIS Stabilization to a new level of stabilization, Super Smooth brings you the capability to make crisp, shake-free, and butter-smooth image steadiness in the video like the camera is riding on its own rails.\n\n\nWater-resistant to depths of up to 30 meters to meet most underwater sports records (with waterproof case) &amp; With Wi-Fi support switch to the much faster on-demand to speed up file transfers and other app-based functions like low-latency image previews.\n\n\nWith 128GB U3 Class+ 10 memory card(not included) for Capture crisp, pro-quality photos with 24MP interpolated to 48MP clarity. Digitek GoCAM DAC-101 can automatically pick all the best image processing for you, so it’s super easy to nail the shot.\n\n\nThis camera almost covers all the functions that you need or can imagine. For example, loop recording, time-lapse recording, slow motion, self-timer, burst photo, screen saver, upside down, drone, travel vlogging, white balance and soon.\n', 8299.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/gocam-wifi-ultra-hd-sports-action-camera-dac-101', '2025-11-02 10:27:14', '2025-11-02 10:35:13'),
(14, 5, 'Digitek SmartFinder(DSF 001) Wireless Bluetooth Anti-Lost Anti-Theft Alarm Device Tracker Work with iOS Devices.', 'digitek-smartfinderdsf-001-wireless-bluetooth-anti-lost-anti-t', 'DSF-001', '\nSmart Tracking of your Valuables: Digitek SmartFinder ensures you never lose your valuables now. Effortlessly Tracking and Locating of your items through the Find My app. Attach t...', '\nSmart Tracking of your Valuables: Digitek SmartFinder ensures you never lose your valuables now. Effortlessly Tracking and Locating of your items through the Find My app. Attach tags to Keys, Wallet, Backpack, Luggage, Pets etc. &amp; keep them safe.\nTracking Range: With Bluetooth range up to 164 Feet, trigger the Built-in Speaker to locate your belongings via your iOS Phone.\nCompatible with iOS devices with Easy Tracking through (Not Compatible with Android Phones)\nLeft-Behind Reminder: Receive notifications on your iOS device when the SmartFinder is out of your Bluetooth range. Use the Find My App to view the SmartFinder\'s Current Location on the map.\nLost Mode: Activate Lost Mode of your SmartFinder. Find your belongings with the help of Millions of iOS Devices in the Find My network, when it\'s detected by a iOS device in the network, you\'ll automatically get a notification\n', 649.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-smartfinderdsf-001-wireless-bluetooth-anti-lost-anti-theft-alarm-device-tracker-work-with-ios-devices', '2025-11-02 10:27:17', '2025-11-02 10:35:15'),
(15, 5, 'Digitek (AB 35C) 35 Liters Capacity Digital Display Dry Cabinet with Humidity Controller (Black)', 'digitek-ab-35c-35-liters-capacity-digital-display-dry-cabinet', 'AB 35C', '\nRAPID DEHUMIDIFICATION - Digitek dry Cabinet has thermoelectric cooling technology which is quick, quiet, heatless and therefore protects your items from moisture, moth, mildew, r...', '\nRAPID DEHUMIDIFICATION - Digitek dry Cabinet has thermoelectric cooling technology which is quick, quiet, heatless and therefore protects your items from moisture, moth, mildew, rust, dust, mould, fungus, rust, oxidation, warping and etc\nSAFE &amp; ECONOMICAL - this camera lens storage is one of the safiest dry boxes available - it has safe direct current input therefore there is no leakage risks and potential fire danger\nBUILT-IN HYGROMETER -our camera dry cabinet has humidity sensor which offers accurate humidity control with ±5% differs.You can control the relative humidity level inside this camera lens storage in the range of 25% to 60%\nEASY TO USE - this dry dehumidification cabinet box begins to work the same second the power is supplied. It has adjustable shelves for easy storage and retrieval.\n', 5299.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/35-liters-capacity-digital-display-dry-cabinet-with-humidity-controlle-ab35cr', '2025-11-02 10:27:19', '2025-11-02 10:35:16'),
(16, 5, 'ENVIE (ECR 11MC+4xAA3200) SprintX Ultra Fast Rechargeable Batteries Charger for AA & AAA Ni-mh, with AA3200 Infinite Plus 4PL Rechargeable Batteries comes with Over Charge Protection', 'envie-ecr-11mc4xaa3200-sprintx-ultra-fast-rechargeable-batter', 'ECR 11MC+4xAA3200', '\nENVIE SprintX Ultra Fast Rechargeable Batteries Charger for AA &amp; AAA Ni-mh, with AA3200 Infinite Plus 4PL Rechargeable Batteries comes with Over Charge Protection\nComes with A...', '\nENVIE SprintX Ultra Fast Rechargeable Batteries Charger for AA &amp; AAA Ni-mh, with AA3200 Infinite Plus 4PL Rechargeable Batteries comes with Over Charge Protection\nComes with AA3200 Infinite Plus 4PL Ready to Use batteryLow Self Discharge: With low self-discharge technology, these batteries retain their charge when not in use, offering reliable performance whenever you need them and reducing the frequency of recharging.\nAdvanced Protection Features: Equipped with overcharge, short circuit, and overcurrent protection, this charger ensures the safety of both the batteries and the device, safeguarding against potential electrical hazards.\nAuto Cut &amp; Bad Cell Detection: The charger automatically detects and cuts off charging when batteries are fully charged, preventing overcharging and optimizing battery lifespan. Additionally, it identifies and handles bad cells, ensuring efficient and safe charging.\nLong-lasting Performance: Designed to last up to 5 years, these batteries provide consistent and reliable power over an extended period, offering durability and value for money.\n', 1299.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/envie-ecr-11mc-4xaa3200-sprintx-ultra-fast-rechargeable-batteries-charger-for-aa-aaa-ni-mh-with-aa3200-infinite-plus-4pl-rechargeable-batteries-comes-with-over-charge-protection', '2025-11-02 10:27:22', '2025-11-02 10:35:19'),
(17, 5, 'Digitek (DCR-007) USB-A 3.0 & Type C High-Speed Multi-Card Reader DCR-007', 'digitek-dcr-007-usb-a-30-type-c-high-speed-multi-card-reade', 'DCR-007', '\n USB-A 3.0 Port + Type C Port \n2 in 1 Connector Card Reader: \nCompact Card Reader: Supports All Standard SD / SDHC / SDXC and Micro SD / Micro SDHC / Micro SDXC Cards.\nType C OTG...', '\n USB-A 3.0 Port + Type C Port \n2 in 1 Connector Card Reader: \nCompact Card Reader: Supports All Standard SD / SDHC / SDXC and Micro SD / Micro SDHC / Micro SDXC Cards.\nType C OTG Support Function: Reads SD / T-Flash card directly on your \n\n USB C and OTG Supported Devices. When adding an Memory Cards,  your Card Reader is turned into a U Flash Disk.\n\nPlug and Play : No Driver Installation Required.\nSupports  Android Smartphones, Tablets, PCs, Laptops\nSystem Supports : Windows, Mac OS and Android Compatible.\nSpeed: Super Speed up to 5Gbps\n', 299.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-dcr-007-usb-a-3-0-type-c-high-speed-multi-card-reader-dcr-007', '2025-11-02 10:27:24', '2025-11-02 10:35:20'),
(18, 5, 'Digitek (DTR 540 BH) Heavy Duty Multi-Angle DV Tripod Cum Monopod, 360° Ball Head, 180° Tilt, Flip Leg Lock, 4-Section Adjustable, 8Kg Max Load, 6.26ft Height, 28mm Tube, Portable for DSLR, Camera & Videography', 'digitek-dtr-540-bh-heavy-duty-multi-angle-dv-tripod-cum-monopo', 'DTR 540 BH', '\n\nMulti-Angle Versatility – Functions as both a tripod and monopod, perfect for photography, videography, and professional shoots.\n\n360° Ball Head Rotation – Enables smooth panoram...', '\n\nMulti-Angle Versatility – Functions as both a tripod and monopod, perfect for photography, videography, and professional shoots.\n\n360° Ball Head Rotation – Enables smooth panoramic shots and creative angle adjustments with precise control.\n\n180° Tilt Movement – Shoot from top-down, low angles, or creative perspectives with flexible up-to-down positioning.\n\nHeavy-Duty Load Capacity – Supports up to 8kg, making it ideal for DSLR cameras, mirrorless setups, video gear, and accessories.\n\nAdjustable Height Range – Extends up to 6.26ft for overhead shots and folds down to 1.75ft for easy portability.\n\nStrong &amp; Durable Build – Sturdy aluminum alloy construction with 28mm max tube diameter ensures stability and long-lasting performance.\n\nQuick Flip Leg Lock System – 4-section adjustable legs with secure flip locks allow fast setup and hassle-free adjustments on the go.\n\nPortable &amp; Lightweight – Weighs just 2.35kg, making it easy to carry for travel, outdoor shoots, events, and professional work.\n\nWhat’s in the Box – Tripod, Carry Bag, and User Manual for easy setup.\n', 6499.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-tripod-dtr-540-bh', '2025-11-02 10:27:26', '2025-11-02 10:35:22'),
(19, 5, 'Digitek (DTR 630 SS) Extendable Tripod Selfie Stick with Fill Light, Quadpod Base, Wireless Remote, 5.25ft Max Height, 6-Section Telescopic Rod, 360° Rotation, 1Kg Load, Compatible with Android & iPhone', 'digitek-dtr-630-ss-extendable-tripod-selfie-stick-with-fill-li', 'DTR-630 SS', '\n\nAll-in-One Tripod &amp; Selfie Stick – Seamlessly switch between selfie stick and tripod mode with a stable quadpod base, ideal for vlogging, travel content, and group selfies....', '\n\nAll-in-One Tripod &amp; Selfie Stick – Seamlessly switch between selfie stick and tripod mode with a stable quadpod base, ideal for vlogging, travel content, and group selfies.\n\nBuilt-in Fill Light – Enhance your photos and videos with the integrated LED fill light, ideal for shooting in low-light conditions like indoor setups or night events.\n\nWireless Remote Control – Capture shots from a distance using the included Bluetooth remote, ideal for hands-free content creation, live streaming, and video calls.\n\nAdjustable Height &amp; Angles – 6-section telescopic rod extends up to 5.25 ft with 360° rotation and 180° tilt, ideal for getting the perfect frame in any setting.\n\nPortable &amp; Lightweight – Weighs under 1 kg and folds down to just 0.89 ft, ideal for creators on the go, travel bloggers, and everyday smartphone users.\n', 1699.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-dtr-630-ss-extendable-tripod-selfie-stick-with-fill-light', '2025-11-02 10:27:29', '2025-11-02 10:35:24'),
(20, 5, 'Digitek (DFL 400) High Speed 400W TTL Flash Strobe Light, Built-in TTL, 1/8000s HSS, 2.4G, 13W LED Modeling Lamp, Stroboscopic & Multi Flash, 5600K±200K, Fast Recycling, 500 Flashes, For Photo & Videography', 'digitek-dfl-400-high-speed-400w-ttl-flash-strobe-light-built', 'DFL-400 V5', '\n\n400W High Power Output – Provides bright and consistent light, powerful enough for professional studios, outdoor portrait sessions, and event photography. Whether you’re shooting...', '\n\n400W High Power Output – Provides bright and consistent light, powerful enough for professional studios, outdoor portrait sessions, and event photography. Whether you’re shooting products or people, this strobe ensures reliable illumination every time.\n\nBuilt-in TTL Receiver – Supports TTL auto exposure control for precise brightness without manual adjustments. This feature guarantees accurate, balanced shots even in changing light conditions, making it ideal for fast-paced shoots.\n\nHigh-Speed Sync 1/8000s – Allows photographers to capture sharp images of moving subjects or shoot in bright daylight without overexposure. Perfect for fashion, sports, and action photography.\n\nStroboscopic Flash Mode – Capable of up to 20 flashes at 30Hz frequency, this mode is excellent for creating motion sequences and experimental lighting effects that add drama to your work.\n\nFlexible Shooting Modes – Offers both Manual and Multi Flash modes, giving you complete creative control. Whether you need steady lighting or multiple bursts, this flash adapts to your shooting style.\n\n13W LED Modeling Lamp – Comes with 6-step brightness adjustment so you can preview light and shadow effects before capturing the final shot. Saves time by helping set up the perfect lighting in advance.\n\nAccurate Color Temperature 5600±200K – Ensures natural tones and true-to-life colors in portraits and product photography. Maintains consistent white balance across different shoots.\n\nFast Recycling Time (0.01–2.8s) – Delivers ultra-fast recharge between flashes, allowing continuous shooting without delays. Ideal for wedding, event, and fashion photographers who cannot afford to miss a moment.\n\n2.4G Wireless Remote Control – Offers 8 channels and 3 groups (A/B/C) with ID30 support, making it easy to control multiple strobes simultaneously. Provides flexibility and convenience for complex setups.\n\nComplete Ready-to-Use Kit – Includes the 400W flash unit, standard reflector, protective front cover, and universal charger. Everything you need to get started with professional lighting is included in the box.\n', 30999.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-flash-dfl-400-ttl-flash-strobe-light', '2025-11-02 10:27:32', '2025-11-02 10:35:27'),
(21, 5, 'Digitek (DWM 101 Mini) 2-in-1 Wireless Microphone, 2.4G Mic for iOS/Android, DSLR, PC/Laptop, 80m Range, TF Card Recording, 4.5hr Battery, Real-Time Monitoring, Ideal for Vlogging, Streaming, Meetings', 'digitek-dwm-101-mini-2-in-1-wireless-microphone-24g-mic-for', 'DWM-101 Mini', '2-in-1 Wireless Microphone System – Digitek DWM-101 Mini is a compact, lightweight wireless mic compatible with iOS/Android smartphones, DSLR cameras, PCs, and laptops. Ideal for v...', '2-in-1 Wireless Microphone System – Digitek DWM-101 Mini is a compact, lightweight wireless mic compatible with iOS/Android smartphones, DSLR cameras, PCs, and laptops. Ideal for vlogging, live streaming, video tutorials, meetings, and interviews.\nStable 2.4G Wireless Transmission – Enjoy seamless connectivity with an extended wireless range of up to 80 meters, ensuring freedom to move and record without signal drops or delays.\nProfessional Audio Quality – Equipped with an omnidirectional condenser mic for accurate sound pickup, paired with 32dB ± 2dB S/N ratio and intelligent noise reduction for crystal-clear audio output in any environment.\nExtended Battery Life with Fast Charging – Powered by a 100mAh battery, the microphone delivers over 4.5 hours of continuous working time and charges fully in just 1.5 hours via DC 5V/1A input.\nTF Card Slot &amp; Real-Time Monitoring – Record directly to a TF card without the need for external devices. Built-in real-time audio monitoring helps you ensure high-quality recordings on the spot.\nReliable Performance in All Conditions – Operates efficiently across a temperature range of -10°C to 50°C, with 20Hz–20kHz frequency response and high-fidelity 48kHz audio sampling rate for professional-grade recordings.\nVersatile Applications – Perfect for live interviews, online teaching, YouTube content creation, film production, and more. The back clip design makes it easy to attach the transmitter for hands-free use.', 4299.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-2-in-1-wireless-microphone-system-dwm-101-mini', '2025-11-02 10:27:35', '2025-11-02 10:35:29'),
(22, 5, 'Digitek (DTR 620 BH) Multi-Angle 6ft DV Tripod Cum Monopod, 3-Way Pan & Tilt Head, Central Column for Tabletop & Vertical Shots, 20Kg Max Load, 4-Section Adjustable, Quick Release & Flip Leg Lock', 'digitek-dtr-620-bh-multi-angle-6ft-dv-tripod-cum-monopod-3-wa', 'DTR 620 BH', '\n\nMulti-Angle Functionality – Use as a tripod or monopod with central column adjustment for tabletop, vertical, and overhead shooting.\n\nProfessional 3-Way Pan &amp; Tilt Head – Smo...', '\n\nMulti-Angle Functionality – Use as a tripod or monopod with central column adjustment for tabletop, vertical, and overhead shooting.\n\nProfessional 3-Way Pan &amp; Tilt Head – Smooth horizontal panning, vertical tilt, and angular positioning for perfect framing.\n\nStrong Load Capacity – Supports up to 20kg, ideal for DSLR cameras, video gear, lenses, spotting scopes, and heavy accessories.\n\nConvenient Quick Release Plate – Detach or mount your camera instantly with the quick release button, saving time during shoots.\n\nSturdy 4-Section Adjustable Legs – Flip leg locks allow fast setup and height adjustment from 2.29ft folded to 6ft extended.\n\nStable Build with Locking Knob – Heavy-duty 32mm max tube diameter ensures rock-solid stability even on uneven surfaces.\n\nCentral Column for Low-Angle Shots – Perfect for low-level, macro, and panning photography, giving you creative shooting flexibility.\n\nAdded Accessory Hook – Bottom shaft hook allows you to hang weights for extra stability during windy outdoor shoots.\n\nDurable &amp; Portable Design – Weighs 3.12kg with a strong aluminum alloy body, built to withstand long-term professional use.\n\nIdeal for All Photography Needs – Whether for studio work, outdoor shoots, videography, or travel, this tripod ensures reliable performance.\n', 7799.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-dtr-620-bh-professional-multiangle-dv-tripod-cum-monopod', '2025-11-02 10:27:37', '2025-11-02 10:35:31'),
(23, 5, 'Digitek (DCFA 240GB Gold Series) CFexpress Type A Memory Card – 800MB/s Read, 700MB/s Write, 8K Ultra HD Support, Nytro Boost, Perfect Frame, 5-Year Warranty, For High Speed 8K Videography', 'digitek-dcfa-240gb-gold-series-cfexpress-type-a-memory-card', 'DCFA-240', 'Blazing Fast Speeds – Enjoy ultra-fast read speeds up to 800MB/s and write speeds up to 700MB/s, delivering exceptional performance for high-speed photography and 8K videography.\nD...', 'Blazing Fast Speeds – Enjoy ultra-fast read speeds up to 800MB/s and write speeds up to 700MB/s, delivering exceptional performance for high-speed photography and 8K videography.\nDesigned for 8K Ultra HD – Built to handle 8K video recording with ease, ensuring seamless data capture without frame drops or delays.\nCFexpress Type A Format – Compatible with professional cameras supporting CFexpress Type A cards, ideal for creators demanding top-tier performance.\nNytro Boost Technology – Boosts performance during heavy workloads for a smoother, uninterrupted recording and playback experience.\nPerfect Frame Capture – Engineered to support continuous shooting and high-resolution video with zero lag and frame accuracy.\nDynamic Thermal Management – Smart thermal control system ensures stable operation and prevents overheating during long recording sessions.\nDurable &amp; Reliable – Comes with a 5-year warranty, shock resistance, and long-term durability for professional field use.\nGold Series Quality – Premium-grade construction for creators who demand speed, reliability, and uncompromised performance.', 10499.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-gold-series-240gb-cf-express-type-a-card-dcfa-240', '2025-11-02 10:27:41', '2025-11-02 10:35:33'),
(24, 5, 'Digitek (240GB) CFexpress Type a Card 240GB VPG200 Memory Card Black Series Read 800MB/s Flash Storage CFe a Card for Camera', 'digitek-240gb-cfexpress-type-a-card-240gb-vpg200-memory-card-b', '240GB Professional CFexpress Type A Card', '\n240GB Storage Capacity\nPCIe 3.0 x1 Bus\nMax Read Speed: 800 MB/s\nMax Write Speed: 700 MB/s\nSustained Write Speed: 600 MB/s\nMin. Write Speed: 200 MB/s (VPG-200)\nRecords 8K Video and...', '\n240GB Storage Capacity\nPCIe 3.0 x1 Bus\nMax Read Speed: 800 MB/s\nMax Write Speed: 700 MB/s\nSustained Write Speed: 600 MB/s\nMin. Write Speed: 200 MB/s (VPG-200)\nRecords 8K Video and Raw Photos\nCapture Rapid-Fire Shutter Bursts\nShock, Vibration, Temperature Proof\n', 10499.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-240gb-cfexpress-type-a-card-240gb-vpg200-memory-card-black-series-read-800mb-s-flash-storage-cfe-a-card-for-camera', '2025-11-02 10:27:44', '2025-11-02 10:35:35'),
(25, 5, 'Digitek (DCL 100WBC RGB) 100W LED Video Light with Mini Bowens, Reflector, CRI 97+, 2700-6500K, 13000LM, App Control, 4500mAh Battery, 1/4 Mount, 20 FX Modes, for Indoor and Outdoor Shoots', 'digitek-dcl-100wbc-rgb-100w-led-video-light-with-mini-bowens', 'DCL-100WBC RGB Combo', '\n\nPowerful 100W RGB LED Output – Delivers a strong and stable 13000 LM luminous flux, ideal for professional lighting needs across photography and videography setups.\n\nWide Color T...', '\n\nPowerful 100W RGB LED Output – Delivers a strong and stable 13000 LM luminous flux, ideal for professional lighting needs across photography and videography setups.\n\nWide Color Temperature Range – Adjustable from 2700K to 6500K ±200K, offering warm to cool lighting tones for creative flexibility in different shooting environments.\n\nHigh Color Accuracy – CRI 97+ ensures accurate color rendering, maintaining true-to-life tones for skin, objects, and backgrounds during shoots.\n\nMini Bowens Mount Compatibility – Easily attaches reflectors and other modifiers, offering creative control over light diffusion and direction.\n\nBuilt-in 4500mAh Li-ion Battery – Integrated 14.8V rechargeable battery supports extended cordless use, making it suitable for indoor and outdoor shoots.\n\nApp &amp; Remote Control – Control light settings via mobile app or included 60-meter range remote, allowing convenient adjustments on set.\n\nFull Brightness Control (1–100%) – Seamless dimming allows for precise lighting intensity based on scene requirements.\n\n20 Built-in Lighting FX Modes – Includes effects like Paparazzi, Fireworks, Fault Bulb, Campfire, Explosion, and SOS for cinematic lighting options.\n\nSmart Cooling System – Advanced heat dissipation technology keeps the unit cool and quiet, ensuring consistent performance during long shoots.\n\nComplete Accessory Kit Included – Comes with a reflector, silicone diffuser, handle grip, Type-C cable, power adapter, power cords, Type-C to DC cables, quick charger, and carry case for easy transport.\n', 14999.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-continuos-led-light-dcl-100-wbc-rgb', '2025-11-02 10:35:39', '2025-11-02 10:35:39'),
(26, 5, 'Digitek (DWM 120) Wireless Microphone System, Noise Reduction, 2.4G Mic with 50m Range & 4.5Hr Battery, for iPhone & Android Smartphones, Ideal for Vlogging, Streaming & Interviews', 'digitek-dwm-120-wireless-microphone-system-noise-reduction-2', 'DWM-120', 'Universal Compatibility – Seamlessly works with iOS and Android smartphones for effortless audio recording, whether you\'re using a Lightning or Type-C port.\nCrystal-Clear Sound Qua...', 'Universal Compatibility – Seamlessly works with iOS and Android smartphones for effortless audio recording, whether you\'re using a Lightning or Type-C port.\nCrystal-Clear Sound Quality – Designed for professional-grade audio, delivering rich, full-frequency sound ideal for content creation, podcasts, or live sessions.\nAdvanced Noise Reduction Chip – Built-in intelligent chip filters out background noise, ensuring crisp and clear audio in any environment.\nPlug &amp; Play with Auto Pairing – No apps or Bluetooth needed. Just plug in and start recording with low-latency, real-time signal transmission.\nHigh-Performance 2.4G Wireless Transmission – Enjoy stable and smooth audio with an effective range of up to 50 meters, perfect for both indoor and outdoor shoots.\nLong-Lasting 4.5Hr Battery Life – Capture more with a rechargeable battery that supports up to 4.5 hours of continuous recording time.\nPerfect for All Your Needs – Ideal for live interviews, vlogging, teaching videos, online meetings, live streaming, filmmaking, and more.', 2499.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-2-in-1-wireless-microphone-system-dwm-120', '2025-11-02 10:35:41', '2025-11-02 10:35:41'),
(27, 5, 'Digitek (LED-D40W) Portable 40W Bi-Color LED Video Light, 2700K-6500K, CRI 96+, 3600LM, 12 FX Lighting Effects, 120° Beam Angle, Built-in Battery & Type-C Charging, Ideal for Photo & Videography', 'digitek-led-d40w-portable-40w-bi-color-led-video-light-2700k', 'LED-D40W', '\n\n40W Bi-Color LED Light – Professional-grade 40W output with a wide 2700K–6500K color temperature range, giving you complete control over warm to cool lighting for any shoot.\n\nTru...', '\n\n40W Bi-Color LED Light – Professional-grade 40W output with a wide 2700K–6500K color temperature range, giving you complete control over warm to cool lighting for any shoot.\n\nTrue-to-Life Colors – With a CRI of 96+, this light ensures accurate color reproduction, making it ideal for product photography, portraits, and video production.\n\nBright &amp; Wide Coverage – Delivers up to 3600 lumens with a 120° beam angle, covering large areas with consistent and natural light.\n\n12 Creative Lighting Effects – Includes 12 special FX modes like Paparazzi, Candle, TV Flicker, Thunder, Fireworks, Welding, Bad Light Bulb, and more—perfect for filmmaking and creative shoots.\n\nDurable 200 LED Beads – Built with 200 premium LED chips, providing stable brightness and long-lasting performance without flicker.\n\nRechargeable Built-in Battery – Comes with a 7.4V 3000mAh in-built battery and Type-C charging port for reliable power on the go.\n\nSmart Cooling System – Features an induction cooling fan that prevents overheating, ensuring safe, long, and uninterrupted usage.\n\nPortable &amp; Easy Mounting – Lightweight design with a 1/4\" screw mount, making it compatible with tripods, light stands, and camera rigs. Package includes: LED-D40 Video Light, Type-C Cable &amp; Instruction Manual.\n', 2899.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-led-d40w-bi-color-portable-led-video-light-professional-grade-lighting-solution-designed-for-photographers-videographers-and-content-creators', '2025-11-02 10:35:43', '2025-11-02 10:35:43'),
(28, 5, 'Digitek® (DWM-106) 2-in-1 Wireless Microphone System, 80M Range, Noise Cancellation & Reverberation Mode, 360° Sound Capture, Lightning/Type-C/TRRS/TRS Adapter Support for DSLR/Camcorder/Android & iOS (White Color))', 'digitek-dwm-106-2-in-1-wireless-microphone-system-80m-range', 'DWM-106', '\nWireless Microphone System 1x Receiver &amp; 2 Transmitter &amp; 1x TRS, 1 x TRRS, 1 x Type-C &amp; 1 x Lightning Audio Adapter in single unit\nCharging Case. Charging Case has Typ...', '\nWireless Microphone System 1x Receiver &amp; 2 Transmitter &amp; 1x TRS, 1 x TRRS, 1 x Type-C &amp; 1 x Lightning Audio Adapter in single unit\nCharging Case. Charging Case has Type-C 5V input &amp; 1000mAh / 3.7V Battery Capacity to charge Receiver &amp; Transmitter\nNoise Cancellation function. Suitable for Broadcasting, Shooting, V-Logs, Karaoke Songs, Speeches, Conference etc\n', 6199.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-dmw-106-2-in-1-wireless-microphone', '2025-11-02 10:35:47', '2025-11-02 10:35:50'),
(29, 5, 'K&F Concept (ND2-ND32 ND Filter & CPL) Variable Fader ND2-ND32 ND Filter and CPL Circular Polarizing Filter 2 in 1 for Camera Lens Nano-X Spot Weather Sealed', 'kf-concept-nd2-nd32-nd-filter-cpl-variable-fader-nd2-nd32-n', NULL, '', NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/k-f-concept-nd2-nd32-nd-filter-cpl-variable-fader-nd2-nd32-nd-filter-and-cpl-circular-polarizing-filter-2-in-1-for-camera-lens-nano-x-spot-weather-sealed', '2025-11-02 10:35:52', '2025-11-02 10:35:52'),
(30, 5, 'Digitek (DM-201) Unidirectional Interview Microphone for Smartphone & DSLR Camera', 'digitek-dm-201-unidirectional-interview-microphone-for-smartph', 'DM-201', '\nIdle range compatibility with Smartphone / Camcorder / Digital DSLR Camera with 3.5mm Microphone input Socket &amp; Hotshoe.\nA Slim body Wireless Interview Microphone Allows for e...', '\nIdle range compatibility with Smartphone / Camcorder / Digital DSLR Camera with 3.5mm Microphone input Socket &amp; Hotshoe.\nA Slim body Wireless Interview Microphone Allows for extensive application in meeting, interview, recording and so on, very practical.\nWith Anti-Wind Foam to Eliminate Noise\n\nSensitivity : Short Range -45db Long Range -38db\nPower Supply : DC1.5V (1 AA Battery, not include)\n\nWhat is in the box?Microphone, Waterproof Sponge Cover,&amp;nbsp;5 Meter Audio Cable, Hot shoe Clip, Spiral Clip, Transfer Head', 2099.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/unidirectional-interview-microphone-for-smartphone-dslr-camera-dm-201', '2025-11-02 10:35:59', '2025-11-02 10:35:59'),
(31, 5, 'Digitek DM-601 Metal Desktop USB Microphone with Shock Mount & Adjustable Stand', 'digitek-dm-601-metal-desktop-usb-microphone-with-shock-mount-a', 'DM 601', 'Built-in Sound Card for instant High Quality Reproduction: Enhances Stereo &amp; Spatial Audio through its Digital Audio Technology of the Built in Sound Card. Only Plug &amp; Pla...', 'Built-in Sound Card for instant High Quality Reproduction: Enhances Stereo &amp; Spatial Audio through its Digital Audio Technology of the Built in Sound Card. Only Plug &amp; Play. Bringing Recording experience without latency\r\nDual-Channel: (24 bit/48k Hz) Studio Standard Audio Quality: Dual-channel (24 bit/48kHz) for High-Fidelity sound recording and layering\r\nMulti Capsule Array: Built-in Triple capsule Array for 360° sound sampling. Please keep the sound source straightly facing the triple capsule array for better sound quality.\r\nFour Pickup Modes: Stereo/ Omnidirectional/ Cardioid/ Bi-directional. Flexible for various recording scenes, meet different recording with your requirements.\r\nTriple Vibration Proof design for Noise Reduction: Design for Noise Reduction: including shock-absorbing Capsule Stand, Anti-Vibration Silicone Pad &amp; High- density Sponge at the Bottom, reducing noise resulting from vibration.', 3599.00, 1, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-dm-601', '2025-11-02 10:36:02', '2025-11-12 08:55:25'),
(32, 5, 'Digitek (DM 301) USB Professional Gaming RGB Microphone', 'digitek-dm-301-usb-professional-gaming-rgb-microphone', 'DM-301', '\nBrand:  Digitek\nModel Name: DM-301\nConnectivity Technology: USB\nSpecial Feature: Stand, Noise Reduction, Runs on Plug-In Power\nIncluded Components: Microphone, Joint Coupler, Shoc...', '\nBrand:  Digitek\nModel Name: DM-301\nConnectivity Technology: USB\nSpecial Feature: Stand, Noise Reduction, Runs on Plug-In Power\nIncluded Components: Microphone, Joint Coupler, Shock Mount, USB A to USB C Adapter, Microphone Disk Base Holder, Blow Out Prevention Net, 6 Feet USB C to A Cable..\n\n ', 3799.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-dm-301', '2025-11-02 10:36:06', '2025-11-02 10:36:06'),
(33, 5, 'Digitek (DM 302) USB Professional RGB Gaming Microphone', 'digitek-dm-302-usb-professional-rgb-gaming-microphone', 'DM 302', 'Operating Voltage DC 5V/100mA Power Supply Mode USB / Type-C data Cable for External Power Sensitivity Range -40dB+3dB Frequency Response 30Hz-20Khz Microphone 14mm Capacitive Mic...', 'Operating Voltage DC 5V/100mA Power Supply Mode USB / Type-C data Cable for External Power Sensitivity Range -40dB+3dB Frequency Response 30Hz-20Khz Microphone 14mm Capacitive Microphone\r\nSampling Frequency 48khz-192khz Signal to Noise Ratio &gt;70dB Connection Mode USB/TYPE-C Line Length 1.5m Pointing Heart Pointing\r\nPlug and Play : Compatible with Mac, PS4/5 and Windows PC Computer, Laptop that has USB-A or USB-C port. No extra driver is required.\r\nThe 6ft-long detachable USB cable can extend from the back of computer host to your gaming USB microphone body without restriction.\r\nSupports sample rates up to 192kHz/24bit, great for Presentations, Zoom Meetings, Podcasts, Recordings, Skype, YouTube, Instant Messaging, Gaming and Streaming.\r\nNoise Cancelling Accessories Rubber Elastic Bands are firmly clamped on the Shock Mount, which will reduce vibration noise caused by keyboard knocking and clicking the mouse.\r\nDetachable POP filter tightly clipped on Microphone, eliminate POPS sound produced by your exciting words during game.\r\nEasy to Reach Gain Knob: Easily adjust sensitivity by turning the bottom knob.', 2399.00, 1, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-dm-302-usb-professional-rgb-gaming-microphone', '2025-11-02 10:36:08', '2025-11-12 08:54:47'),
(34, 5, 'Digitek (DM-03Type-C) Lavalier Omnidirectional Microphone,Clip on Collar Microphone,Type-C Interface Connector,Low Handing Noise,Compatible with Digitek DAC – 101 & DAC-002', 'digitek-dm-03type-c-lavalier-omnidirectional-microphoneclip-o', 'DM 03', '\nDigitek Lavalier Microphone is compatible with Digitek GO CAM DAC-001/DAC-002.\nl Lavalier mic with Omni pickup pattern for full 360 Degrees  an integrated 5 Feet (60\") cable with...', '\nDigitek Lavalier Microphone is compatible with Digitek GO CAM DAC-001/DAC-002.\nl Lavalier mic with Omni pickup pattern for full 360 Degrees  an integrated 5 Feet (60\") cable with Type-C Interface. Can connect with only Digitek action camera  DAC - 002 &amp; DAC- 101.\n', 499.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitekdm-03type-clavalier-omnidirectional-microphone-clip-on-collar-microphone-type-c-interface-connector-low-handing-noise-compatible-with-digitek-go-dac-101-dac-002-digitek-microphone-dwm-101-also-usable-with-mobile-phones-laptop-dslr-more', '2025-11-02 10:36:10', '2025-11-02 10:36:10'),
(35, 5, 'Digitek 3.5mm TRRS Type-C Connector Audio Cable With Smartphone', 'digitek-35mm-trrs-type-c-connector-audio-cable-with-smartphone', 'C to Aux (Phone)', '\nAllow 3. 5mm self-powered microphones to be used on USB-C devices\n', '\nAllow 3. 5mm self-powered microphones to be used on USB-C devices\n', 299.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-3-5mm-trs-to-type-c-connector-audio-cable-boya-microphone-adapter-for-by-mm1-wm8-pro-uwmic9-wm4-pro-mics-compatible-with-samsung-galaxy-s9-note-9-essential-phone-huawei-xiaomi-youtube-video-live', '2025-11-02 10:36:12', '2025-11-02 10:36:12'),
(36, 5, 'Digitek 3.5mm Female to XLR Female Adapter', 'digitek-35mm-female-to-xlr-female-adapter', '3.5mm XLR Female Adapter', '\nProduct usage : To convert XLR interface to 3.5mm Female interface, or 3.5mm interface to XLR Female interface, Two-Way interconversion. Mostly used in Mixers, Power Amplifiers, H...', '\nProduct usage : To convert XLR interface to 3.5mm Female interface, or 3.5mm interface to XLR Female interface, Two-Way interconversion. Mostly used in Mixers, Power Amplifiers, Headphone Amplifiers, Microphones and other equipment.\n', 995.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-3-5mm-female-to-xlr-female-adapter', '2025-11-02 10:36:14', '2025-11-02 10:36:14');
INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `sku`, `short_description`, `description`, `price`, `is_featured`, `is_active`, `specs`, `tags`, `meta_title`, `meta_description`, `source_domain`, `source_url`, `created_at`, `updated_at`) VALUES
(37, 5, 'Digitek Type-C to Lightning cable for Microphones to be used with iOS Smartphones/ iPad', 'digitek-type-c-to-lightning-cable-for-microphones-to-be-used-wit', 'C to Lightning', '\n\nConnect your device with a Lightning connector to your Type-C– or Thunderbolt 3 Type-C)–enabled device for syncing and charging, or to your Type-C–enabled iPad for charging.\nYou...', '\n\nConnect your device with a Lightning connector to your Type-C– or Thunderbolt 3 Type-C)–enabled device for syncing and charging, or to your Type-C–enabled iPad for charging.\nYou can also use this cable with your Apple 18W, 20W, 29W, 30W, 61W, 87W or 96W Type‑C Power Adapter to charge your iOS device and even take advantage of the fast-charging feature on selected iPhone and iPad models.\n\n', 399.00, 0, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-type-c-to-lightning-dac-audio-adapter-cable-converter-for-iphone-ipad-ios-device-for-wireless-usb-c-lavalier-microphone-usb-c-digital-earbuds-headphones-microphone', '2025-11-02 10:36:16', '2025-11-02 10:36:16'),
(38, 5, 'Digitek Type-C to 3.5mm TRS cable for Microphones to be used with Camera', 'digitek-type-c-to-35mm-trs-cable-for-microphones-to-be-used-wit', 'C to Aux (Camera)', 'This Type C to 3.5mm AUX cable is designed to connect your type-C devices to headphones, car stereo, home stereo, external speaker, or other devices with standard 3.5mm audio jack...', 'This Type C to 3.5mm AUX cable is designed to connect your type-C devices to headphones, car stereo, home stereo, external speaker, or other devices with standard 3.5mm audio jack or Aux-in port..\r\n\r\nPlug N Play: No drivers required, easy to use.\r\nHi-Fi Sound Effect: Use this cable to connect phone with external speaker, bringing yourself a more immersive music experience.', 299.00, 1, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/type-c-to-3-5mm-trrs-cable-for-microphones-to-be-used-with-smartphones', '2025-11-02 10:36:19', '2025-11-04 11:52:40'),
(39, 5, 'Digitek Type C to Type C Cable for Micropghones to be used with Android Smartphones / Tablets', 'digitek-type-c-to-type-c-cable-for-micropghones-to-be-used-with', 'C to C Cable', 'APPLICATION] Allows you to connect your COMICA VP2, VP3 shotgun microphone and HRM-C interview microphone.\r\n[High-sensitivity signal transmission]: USB-C microphone cable uses gold...', 'APPLICATION] Allows you to connect your COMICA VP2, VP3 shotgun microphone and HRM-C interview microphone.\r\n[High-sensitivity signal transmission]: USB-C microphone cable uses gold-plated terminals to reduce distortion and signal loss; minimize return loss, so music, dialogue and sound effects are always clearly visible.\r\n[CNC TECHNOLOGY ] XLR to type c adapter, made by accurate CNC processing technology, metal mic for super shielding.\r\n[TPE material] USB to XLR female microphone cable has 19.7 feet of soft silicone wire, which is comfortable and easy to adjust\r\n[Confidence to Buy]: This XLR Microphone Cable are designed to ease your technical woes, not add to them. If you encounter any issues, please contact us. (Contact the seller or Ask a question). We will try our best to help you solve it until you are satisfied.', 399.00, 1, 1, NULL, NULL, NULL, NULL, 'www.digitek.net.in', 'https://www.digitek.net.in/products/digitek-type-c-to-c-microphone-cable-xlr-female-to-usb-c-audio-adapter-smartphone-adapter-for-sumsung-huawei-google-type-c', '2025-11-02 10:36:21', '2025-11-04 11:30:08');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `path`, `alt`, `sort_order`, `is_primary`, `created_at`, `updated_at`) VALUES
(21, 5, 'products/digitek-dwm-101-wireless-microphone-system-with-anc-noise-red/image_01.jpg', 'Digitek® (DWM 101) Wireless Microphone System with ANC Noise Reduction, 360° Sound Capture, 100M Range, Upto 12 Hrs Working Time, for DSLR Camera, Android & iOS Smartphones, Seamless Audio Recording', 0, 1, '2025-11-02 10:35:03', '2025-11-02 10:35:03'),
(22, 6, 'products/digitek-led-d6w-rgb-portable-mini-rgb-led-video-light-with-inb/image_01.png', 'Digitek (LED-D6W RGB) Portable Mini RGB LED Video Light with inbuild Battery & 360° HSI, 3000K-6000K, 8-Level Control, 9 Special FX Modes, Type-C Charging, 1hr Battery, for Photography & Videoshoots', 0, 1, '2025-11-02 10:35:04', '2025-11-02 10:35:04'),
(23, 7, 'products/digitek-dtr-550-lw-67-inch-foldable-tripod-stand-with-phone-h/image_01.jpg', 'DIGITEK® (DTR 550 LW) 67 Inch Foldable Tripod Stand with Phone Holder & 360° Ball Head, 5kg Load Capacity, Aluminum Alloy Legs with Rubberized Feet & Flip Locks, Carry Bag, for Photo & Video Shoots', 0, 1, '2025-11-02 10:35:06', '2025-11-02 10:35:06'),
(24, 8, 'products/digitek-drl-18rt-c6-professional-46cm-led-ring-light-with-remo/image_01.png', 'Digitek (DRL-18RT C6) Professional 46cm LED Ring Light with Remote & 158cm Light Stand, Runs on AC Power with No Shadow apertures, Ideal use for Makeup, Video Shoot, Fashion Photography & Many More', 0, 1, '2025-11-02 10:35:07', '2025-11-02 10:35:07'),
(25, 9, 'products/digitek-dsl-25w-rgb-stick-light-portable-handheld-rgb-led-lig/image_01.jpg', 'DIGITEK® (DSL-25W RGB) Stick Light Portable Handheld RGB LED Light Wand with Barn Door & Remote Control, Color Temp 2700-7500K + RGB, 39 Special Lighting Effects & Carry Bag', 0, 1, '2025-11-02 10:35:09', '2025-11-02 10:35:09'),
(26, 10, 'products/digitek-dtr-555-ss-foldable-tripod-selfie-stick-for-smartphone/image_01.png', 'DIGITEK (DTR-555 SS) Foldable Tripod Selfie Stick for Smartphone & Action Cameras with 5.57ft Height, 360° Rotation & 3-Leg Base, 10m Wireless Remote, 7 Section Adjustable, For Android/iPhone & Gopro', 0, 1, '2025-11-02 10:35:10', '2025-11-02 10:35:10'),
(27, 11, 'products/digitek-dsb-65-bowens-octagon-soft-box-with-bowens-mount-light/image_01.jpg', 'Digitek (DSB-65 Bowens) Octagon Soft Box with Bowens Mount Lightweight & Portable Soft Box Comes with Diffuser Sheets | Carrying Case. DSB-65 Bowens', 0, 1, '2025-11-02 10:35:11', '2025-11-02 10:35:11'),
(28, 12, 'products/digitek-dsg-007f-3-axis-handheld-steady-gimbal-ptz-camera-moun/image_01.jpg', 'Digitek (DSG 007F) 3 Axis Handheld Steady Gimbal PTZ Camera Mount for All Smart Phones with Face & Object Tracking Motion, Various Time Lapse Features', 0, 1, '2025-11-02 10:35:13', '2025-11-02 10:35:13'),
(29, 13, 'products/digitek-gocam-dac-101-5k-30fps-48mp-wifi-ultra-hd-sports-actio/image_01.png', 'Digitek GoCAM (DAC-101) 5K 30FPS 48MP WiFi Ultra HD Sports Action Camera| Dual TouchScreen|6-Axis Gyro EIS Stabilization | MIC Support Waterproof | 2 Batteries (Black)', 0, 1, '2025-11-02 10:35:14', '2025-11-02 10:35:14'),
(30, 14, 'products/digitek-smartfinderdsf-001-wireless-bluetooth-anti-lost-anti-t/image_01.jpg', 'Digitek SmartFinder(DSF 001) Wireless Bluetooth Anti-Lost Anti-Theft Alarm Device Tracker Work with iOS Devices.', 0, 1, '2025-11-02 10:35:16', '2025-11-02 10:35:16'),
(31, 15, 'products/digitek-ab-35c-35-liters-capacity-digital-display-dry-cabinet/image_01.jpg', 'Digitek (AB 35C) 35 Liters Capacity Digital Display Dry Cabinet with Humidity Controller (Black)', 0, 1, '2025-11-02 10:35:18', '2025-11-02 10:35:18'),
(32, 16, 'products/envie-ecr-11mc4xaa3200-sprintx-ultra-fast-rechargeable-batter/image_01.jpg', 'ENVIE (ECR 11MC+4xAA3200) SprintX Ultra Fast Rechargeable Batteries Charger for AA & AAA Ni-mh, with AA3200 Infinite Plus 4PL Rechargeable Batteries comes with Over Charge Protection', 0, 1, '2025-11-02 10:35:20', '2025-11-02 10:35:20'),
(33, 17, 'products/digitek-dcr-007-usb-a-30-type-c-high-speed-multi-card-reade/image_01.jpg', 'Digitek (DCR-007) USB-A 3.0 & Type C High-Speed Multi-Card Reader DCR-007', 0, 1, '2025-11-02 10:35:21', '2025-11-02 10:35:21'),
(34, 18, 'products/digitek-dtr-540-bh-heavy-duty-multi-angle-dv-tripod-cum-monopo/image_01.jpg', 'Digitek (DTR 540 BH) Heavy Duty Multi-Angle DV Tripod Cum Monopod, 360° Ball Head, 180° Tilt, Flip Leg Lock, 4-Section Adjustable, 8Kg Max Load, 6.26ft Height, 28mm Tube, Portable for DSLR, Camera & Videography', 0, 1, '2025-11-02 10:35:24', '2025-11-02 10:35:24'),
(35, 19, 'products/digitek-dtr-630-ss-extendable-tripod-selfie-stick-with-fill-li/image_01.jpg', 'Digitek (DTR 630 SS) Extendable Tripod Selfie Stick with Fill Light, Quadpod Base, Wireless Remote, 5.25ft Max Height, 6-Section Telescopic Rod, 360° Rotation, 1Kg Load, Compatible with Android & iPhone', 0, 1, '2025-11-02 10:35:26', '2025-11-02 10:35:26'),
(36, 20, 'products/digitek-dfl-400-high-speed-400w-ttl-flash-strobe-light-built/image_01.png', 'Digitek (DFL 400) High Speed 400W TTL Flash Strobe Light, Built-in TTL, 1/8000s HSS, 2.4G, 13W LED Modeling Lamp, Stroboscopic & Multi Flash, 5600K±200K, Fast Recycling, 500 Flashes, For Photo & Videography', 0, 1, '2025-11-02 10:35:29', '2025-11-02 10:35:29'),
(37, 21, 'products/digitek-dwm-101-mini-2-in-1-wireless-microphone-24g-mic-for/image_01.jpg', 'Digitek (DWM 101 Mini) 2-in-1 Wireless Microphone, 2.4G Mic for iOS/Android, DSLR, PC/Laptop, 80m Range, TF Card Recording, 4.5hr Battery, Real-Time Monitoring, Ideal for Vlogging, Streaming, Meetings', 0, 1, '2025-11-02 10:35:31', '2025-11-02 10:35:31'),
(38, 22, 'products/digitek-dtr-620-bh-multi-angle-6ft-dv-tripod-cum-monopod-3-wa/image_01.jpg', 'Digitek (DTR 620 BH) Multi-Angle 6ft DV Tripod Cum Monopod, 3-Way Pan & Tilt Head, Central Column for Tabletop & Vertical Shots, 20Kg Max Load, 4-Section Adjustable, Quick Release & Flip Leg Lock', 0, 1, '2025-11-02 10:35:33', '2025-11-02 10:35:33'),
(39, 23, 'products/digitek-dcfa-240gb-gold-series-cfexpress-type-a-memory-card/image_01.png', 'Digitek (DCFA 240GB Gold Series) CFexpress Type A Memory Card – 800MB/s Read, 700MB/s Write, 8K Ultra HD Support, Nytro Boost, Perfect Frame, 5-Year Warranty, For High Speed 8K Videography', 0, 1, '2025-11-02 10:35:34', '2025-11-02 10:35:34'),
(40, 24, 'products/digitek-240gb-cfexpress-type-a-card-240gb-vpg200-memory-card-b/image_01.jpg', 'Digitek (240GB) CFexpress Type a Card 240GB VPG200 Memory Card Black Series Read 800MB/s Flash Storage CFe a Card for Camera', 0, 1, '2025-11-02 10:35:39', '2025-11-02 10:35:39'),
(41, 25, 'products/digitek-dcl-100wbc-rgb-100w-led-video-light-with-mini-bowens/image_01.png', 'Digitek (DCL 100WBC RGB) 100W LED Video Light with Mini Bowens, Reflector, CRI 97+, 2700-6500K, 13000LM, App Control, 4500mAh Battery, 1/4 Mount, 20 FX Modes, for Indoor and Outdoor Shoots', 0, 1, '2025-11-02 10:35:40', '2025-11-02 10:35:40'),
(42, 26, 'products/digitek-dwm-120-wireless-microphone-system-noise-reduction-2/image_01.jpg', 'Digitek (DWM 120) Wireless Microphone System, Noise Reduction, 2.4G Mic with 50m Range & 4.5Hr Battery, for iPhone & Android Smartphones, Ideal for Vlogging, Streaming & Interviews', 0, 1, '2025-11-02 10:35:43', '2025-11-02 10:35:43'),
(43, 27, 'products/digitek-led-d40w-portable-40w-bi-color-led-video-light-2700k/image_01.png', 'Digitek (LED-D40W) Portable 40W Bi-Color LED Video Light, 2700K-6500K, CRI 96+, 3600LM, 12 FX Lighting Effects, 120° Beam Angle, Built-in Battery & Type-C Charging, Ideal for Photo & Videography', 0, 1, '2025-11-02 10:35:45', '2025-11-02 10:35:45'),
(45, 28, 'products/digitek-dwm-106-2-in-1-wireless-microphone-system-80m-range/image_01.png', 'Digitek® (DWM-106) 2-in-1 Wireless Microphone System, 80M Range, Noise Cancellation & Reverberation Mode, 360° Sound Capture, Lightning/Type-C/TRRS/TRS Adapter Support for DSLR/Camcorder/Android & iOS (White Color))', 0, 1, '2025-11-02 10:35:51', '2025-11-02 10:35:51'),
(46, 29, 'products/kf-concept-nd2-nd32-nd-filter-cpl-variable-fader-nd2-nd32-n/image_01.png', 'K&F Concept (ND2-ND32 ND Filter & CPL) Variable Fader ND2-ND32 ND Filter and CPL Circular Polarizing Filter 2 in 1 for Camera Lens Nano-X Spot Weather Sealed', 0, 1, '2025-11-02 10:35:53', '2025-11-02 10:35:53'),
(47, 29, 'products/kf-concept-nd2-nd32-nd-filter-cpl-variable-fader-nd2-nd32-n/image_02.png', 'K&F Concept (ND2-ND32 ND Filter & CPL) Variable Fader ND2-ND32 ND Filter and CPL Circular Polarizing Filter 2 in 1 for Camera Lens Nano-X Spot Weather Sealed', 1, 0, '2025-11-02 10:35:54', '2025-11-02 10:35:54'),
(48, 29, 'products/kf-concept-nd2-nd32-nd-filter-cpl-variable-fader-nd2-nd32-n/image_03.png', 'K&F Concept (ND2-ND32 ND Filter & CPL) Variable Fader ND2-ND32 ND Filter and CPL Circular Polarizing Filter 2 in 1 for Camera Lens Nano-X Spot Weather Sealed', 2, 0, '2025-11-02 10:35:55', '2025-11-02 10:35:55'),
(49, 29, 'products/kf-concept-nd2-nd32-nd-filter-cpl-variable-fader-nd2-nd32-n/image_04.jpg', 'K&F Concept (ND2-ND32 ND Filter & CPL) Variable Fader ND2-ND32 ND Filter and CPL Circular Polarizing Filter 2 in 1 for Camera Lens Nano-X Spot Weather Sealed', 3, 0, '2025-11-02 10:35:56', '2025-11-02 10:35:56'),
(50, 29, 'products/kf-concept-nd2-nd32-nd-filter-cpl-variable-fader-nd2-nd32-n/image_05.jpg', 'K&F Concept (ND2-ND32 ND Filter & CPL) Variable Fader ND2-ND32 ND Filter and CPL Circular Polarizing Filter 2 in 1 for Camera Lens Nano-X Spot Weather Sealed', 4, 0, '2025-11-02 10:35:57', '2025-11-02 10:35:57'),
(51, 29, 'products/kf-concept-nd2-nd32-nd-filter-cpl-variable-fader-nd2-nd32-n/image_06.jpg', 'K&F Concept (ND2-ND32 ND Filter & CPL) Variable Fader ND2-ND32 ND Filter and CPL Circular Polarizing Filter 2 in 1 for Camera Lens Nano-X Spot Weather Sealed', 5, 0, '2025-11-02 10:35:58', '2025-11-02 10:35:58'),
(52, 30, 'products/digitek-dm-201-unidirectional-interview-microphone-for-smartph/image_01.jpg', 'Digitek (DM-201) Unidirectional Interview Microphone for Smartphone & DSLR Camera', 0, 1, '2025-11-02 10:36:02', '2025-11-02 10:36:02'),
(53, 31, 'products/digitek-dm-601-metal-desktop-usb-microphone-with-shock-mount-a/image_01.png', 'Digitek DM-601 Metal Desktop USB Microphone with Shock Mount & Adjustable Stand', 0, 1, '2025-11-02 10:36:05', '2025-11-02 10:36:05'),
(54, 32, 'products/digitek-dm-301-usb-professional-gaming-rgb-microphone/image_01.jpg', 'Digitek (DM 301) USB Professional Gaming RGB Microphone', 0, 1, '2025-11-02 10:36:07', '2025-11-02 10:36:07'),
(55, 33, 'products/digitek-dm-302-usb-professional-rgb-gaming-microphone/image_01.jpg', 'Digitek (DM 302) USB Professional RGB Gaming Microphone', 0, 1, '2025-11-02 10:36:10', '2025-11-02 10:36:10'),
(56, 34, 'products/digitek-dm-03type-c-lavalier-omnidirectional-microphoneclip-o/image_01.jpg', 'Digitek (DM-03Type-C) Lavalier Omnidirectional Microphone,Clip on Collar Microphone,Type-C Interface Connector,Low Handing Noise,Compatible with Digitek DAC – 101 & DAC-002', 0, 1, '2025-11-02 10:36:11', '2025-11-02 10:36:11'),
(57, 35, 'products/digitek-35mm-trrs-type-c-connector-audio-cable-with-smartphone/image_01.jpg', 'Digitek 3.5mm TRRS Type-C Connector Audio Cable With Smartphone', 0, 1, '2025-11-02 10:36:13', '2025-11-02 10:36:13'),
(58, 36, 'products/digitek-35mm-female-to-xlr-female-adapter/image_01.jpg', 'Digitek 3.5mm Female to XLR Female Adapter', 0, 1, '2025-11-02 10:36:15', '2025-11-02 10:36:15'),
(59, 37, 'products/digitek-type-c-to-lightning-cable-for-microphones-to-be-used-wit/image_01.jpg', 'Digitek Type-C to Lightning cable for Microphones to be used with iOS Smartphones/ iPad', 0, 1, '2025-11-02 10:36:19', '2025-11-02 10:36:19'),
(60, 38, 'products/digitek-type-c-to-35mm-trs-cable-for-microphones-to-be-used-wit/image_01.jpg', 'Digitek Type-C to 3.5mm TRS cable for Microphones to be used with Camera', 0, 1, '2025-11-02 10:36:21', '2025-11-02 10:36:21'),
(61, 39, 'products/digitek-type-c-to-type-c-cable-for-micropghones-to-be-used-with/image_01.jpg', 'Digitek Type C to Type C Cable for Micropghones to be used with Android Smartphones / Tablets', 0, 1, '2025-11-02 10:36:24', '2025-11-02 10:36:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_specifications`
--

CREATE TABLE `product_specifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4nthmO7ECUN3nyRzHscEM0GiHBk5ANOLf6BqK6tq', NULL, '113.31.186.146', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11) AppleWebKit/601.1.27 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/601.1.27', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWJwTUFIZjJkT25kcGlMSU03WkxwallRNnlXb0VPVzhLblpMQjFhaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762909810),
('50Z32fyqPGOsxr6zw2fHC2iu5vqyrPqZ96pTLDYt', NULL, '20.204.24.240', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko); compatible; ChatGPT-User/1.0; +https://openai.com/bot', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0NFMGR0TmVHNjdSa01YM3Q1NHF6TWdZRDlFb3F3alR2SmJSNTNqMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTA6Imh0dHBzOi8vc29sYXJzZXR1cGluZGlhLmNvbS9wcm9kdWN0cy9kaWdpdGVrLWRtLTMwMi11c2ItcHJvZmVzc2lvbmFsLXJnYi1nYW1pbmctbWljcm9waG9uZSI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762924063),
('58oUIW87oPeX9Y0rCmCIlJ4d40eDjN9bz90eIPd7', NULL, '43.130.47.33', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEFnTEh1SDNWSzVPMWlqUER0OGJ4c0dOUk1UQW1GdXpWUnROV2FDVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbS9jYXRlZ29yeS9jYW1lcmEtYWNjZXNzb3JpZXMiO3M6NToicm91dGUiO3M6MTM6ImNhdGVnb3J5LnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762950622),
('5HGrGA1yTmlZbfrAltUN15PGWBdpAccW6XigB0Sx', NULL, '59.14.17.48', 'Mozilla/5.0 (Linux; Android 9; Mi A2 Lite) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1lTNDdaSHJKcmRGZFoxalBwdHJndU9zOFJyQlJEQmNwenZxN1dEbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762907295),
('664mOatcah2FfFT8s9KTmrRcdcODBedSEd4Co2k4', NULL, '43.164.197.224', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnI3bjN1S1dlaU1GYVZXT21GMGRJek45b3VUTGNydXhrb3JKNm9GTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762918398),
('7PvYDT0XjP0JFgQ8PZ3J0MlSdThaWRgANTb1L1NH', NULL, '59.14.17.48', 'Mozilla/5.0 (Linux; Android 9; Mi A2 Lite) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZThBdG5ZazhvVk5jZEJHcUJVeFVRUVZhQ3hMYkF0NVAxaGxpZ0xqRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762907295),
('7ULIIz9JmuiX20gRztny2wGQ32hUXUnQXS0nsbre', NULL, '205.169.39.184', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnBKNVVycVNRV3pLOEpYbndqcml3dVd5N1RvcnVtZGppMXRLbHRPeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762918511),
('9bT25j5QpYanI9GdBOhDyLotqHEcyT66rxIgFKHg', NULL, '43.155.26.193', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUtGN2tOSlJUWkhibzNTM1ZYZ1ZvaTdmaHY2V0tsaDloRzQ1T2MzWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762918907),
('A7fQLMVtW6U5K2Lw96Hh1oZrvtuFdeebOGJoMQX0', NULL, '66.249.73.6', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.7390.122 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGxYaTNiWGRtaWYxQjF0Y0RIQUFxcmp5bkNKY1BNNHY0MFN0VXRNNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTk6Imh0dHBzOi8vc29sYXJzZXR1cGluZGlhLmNvbS9wcm9kdWN0cy9kaWdpdGVrLWRtLTIwMS11bmlkaXJlY3Rpb25hbC1pbnRlcnZpZXctbWljcm9waG9uZS1mb3Itc21hcnRwaCI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762929478),
('AHq2qcsNJJjEpOzWOybWGpbmAkp96vj8XLwJbV8A', NULL, '143.198.217.165', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDBlOHAzcVF1NGhZUUxsUGVock44WkpDMlM4NHdLaWpqS1pZaHJrYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762900980),
('aMp04SURONIi7b5c8BVogIz631P274vJ3iEMYjrs', NULL, '124.156.225.181', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVpVVHQzMk1CQVNtYTRndXBObUhWdEM5aFBGMkRJMGtQVEFGdG40ViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762946553),
('atyXg5JAoxaD6G94ts9nqB7hno8dkTehppCxHFe1', NULL, '34.72.176.129', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzgxekRrb1loaDNMMEZPVXVoNlRBS09xRU1uanpkZTh0QWxMb1FUSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762918512),
('b74VqyGAxGwHJEh3oiAE3F2iVz1LbYHc0MZR7dQk', NULL, '91.227.68.158', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU1FBQ3Nka3NtR2VxQ2xBQzRlMmdXdVJleXFUQWRMbEFuR0w2alN6NiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762917543),
('bIRqlmbCDGUy44bzHXJbFWMt0yHLxx4FDM8fY4dx', NULL, '43.130.47.33', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2U4dDhOdTEzU1RWSlhVZ2twMXZPeG1MNFNNWmNBMVZJcU9iR082cSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbS9wcm9kdWN0cz9jYXRlZ29yeT1jYW1lcmEtYWNjZXNzb3JpZXMiO3M6NToicm91dGUiO3M6MTQ6InByb2R1Y3RzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762950623),
('bLzOCC988LBSxhXn64E8gjb0SwlEzM2qAWhUDwIH', NULL, '183.134.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11) AppleWebKit/601.1.27 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/601.1.27', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNm1VdmRUSkhiWFNPOXdLVFB5dndqaXNtQnJsVVBmSXhMOEVFRFl3bCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762909699),
('bOyV7hJTZ7tRXYhBEy0jWx0GeFEatUpjaV9fNs1J', NULL, '54.237.221.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmFDbUFBVFgwaUxJc1F1S1djNlcycFFrR3hINGJDUjl3SmZlaW9iWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762955407),
('bsf4dzp3L7rZuSMlJwtvJTwqDAIJRBEIcXuMgJ3q', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiVE4wWVhJSGpxanRqR0F0bEU5Z2o2N2lCNnZFNlNwS2xEckdUMVZEOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7czo1OiJyb3V0ZSI7czoxNDoicHJvZHVjdHMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImNhcnQiO2E6MTp7aTozMTtpOjE7fX0=', 1762960092),
('bYAKLhmhf2C3JP8ygNflfgNBmn2oPJkvj6fbpfGb', NULL, '205.169.39.184', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHM4WXp6YXp0cHdNWlJud3hUcDQ3VlpXd0xrOXNLdnVXc3RpTDZFYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762918531),
('c4ZSir4OJbrgsp0hppVV8IZTfoVhMg5zimtFUuZA', NULL, '43.135.144.81', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1FUUXpCbHNCeXFNVUQ3MVBSYlhONWhhcWZOQjJoanczZlYxcFdSVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tL2NvbnRhY3QiO3M6NToicm91dGUiO3M6MTM6ImNvbnRhY3QuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762957155),
('C8KBOgRX0h83DqdpkkwGBbsAuHZidiigdbfEQQIi', NULL, '49.51.178.45', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjZVQmlsdFN1RWp1a2JCbTlFVWpBRDRsUE5JS0libFhISFlQZ2ZBYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbS9ibG9nIjtzOjU6InJvdXRlIjtzOjEwOiJibG9nLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762953016),
('cwWZ4jzbE5DiGROao8h8l88sm8Van6rEbsdbtv2f', NULL, '113.31.186.146', 'Mozilla/5.0 (Linux; U; Android 8.0.0; zh-CN; BAC-AL00 Build/HUAWEIBAC-AL00) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.108 UCBrowser/12.0.6.986 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnZpaFZNU09tMzgzMlpaYklMSFBXQ0ZUV0QzOHJOTjN3cTJwclFFZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762909706),
('debBk69ViDpTiaDrkkTSJSx8FRMas2yYWOI0Ehfg', NULL, '91.134.54.94', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:115.0) Gecko/20100101 Chrome/115.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY2RBbHNIc3FFZjh2cDlwelpBQUNaaEZibXVueURjcGZ0UEFGRTdiMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762934094),
('DGAM7QYpQzaQz8xUnfkRt3zzcPVUX36gGY960wuG', NULL, '59.14.17.48', 'Mozilla/5.0 (Linux; Android 9; Mi A2 Lite) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXd3M01UaDQ0aVZmU3VFcTNic21yam56V0JuemdXd3dwejU1OXBWbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762907301),
('DgROWeSivnXJeB9Wo3JRLvGBiceTH5qjNnSPlHpW', NULL, '170.106.165.76', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWVXOU5rcmlaZDBrSFNUQlFCbkZjWGxVR25hQnJzdWh1UHAwQ1lBTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbS9hYm91dCI7czo1OiJyb3V0ZSI7czo1OiJhYm91dCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762952472),
('DgZuRKgnNlIt8axCNpFF7PC94gmdIE26PXFlBWda', NULL, '167.172.226.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaW1WMGRIT3p3ZWp5R3A1VGNqTmZHNDlYcTFoNmFHWjVFTnlwNUhNbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762932509),
('F5U8D4i58FhHz0to9m0u86pNQ1yeT2ZzYM8NPxHT', NULL, '43.135.140.225', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWtoZkphM01QTEpOOWN1OXVvNEdTR1h0N3lZa3FrQlEwWXdLUm56VyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbS9lbnF1aXJ5IjtzOjU6InJvdXRlIjtzOjEzOiJlbnF1aXJ5LmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762953602),
('fkFwokfdRjhZBpn3Fly1MBREzAhPEYMpqTLdxzBr', NULL, '54.237.221.245', 'Mozilla/5.0 (Linux; Android 8.1.0; TECNO LA7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.87 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlBieGpOdWlpYTNKUHNaWnhHYzd2VGc4N01Ob25uMU5Ld3RFWVVTZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762955407),
('FLC12rqyNt7mwqV7qRIRa0dLq8B9hSrcboLmdxBO', NULL, '43.157.38.131', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXNQYVpDTWJWemhIRlFrZzdLWmN4eHFnRkdaRE53cFZlcU02cVNUVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTM6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbS9wcm9kdWN0cy9kaWdpdGVrLWRtLTMwMS11c2ItcHJvZmVzc2lvbmFsLWdhbWluZy1yZ2ItbWljcm9waG9uZSI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762950045),
('g9th0wOYUPDkPNvflAVo3qMnrLiDQUFTIxiIuWXD', NULL, '113.31.186.146', 'Dalvik/2.1.0 (Linux; U; Android 9.0; ZTE BA520 Build/MRA58K)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3d2cWE4Szk2RzhrOUF3d1ZaVkJMdWk0TTJQRGNHVTFCYmdrWmkzRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762909868),
('IV3bpukkl3Ac1gVHcIRuAJlcDtGdeJUiVkrCSoLv', NULL, '113.31.186.146', 'Dalvik/2.1.0 (Linux; U; Android 9.0; ZTE BA520 Build/MRA58K)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTExvZlA3T0c2WU9FY0hjbW1ySE1hTjlORVFkNGlPVkJQTlh5OWF4SSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762909507),
('Ivu98NMRPaWtUihYTu2Ijm10Sao0FQe7w7EZ8qMi', NULL, '59.14.17.48', 'Mozilla/5.0 (Linux; Android 9; Mi A2 Lite) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXdtaDk2MnNNV1JkRUtpTGwzTGdFQjN5MUJyTElDcmJDNWVpS2tITCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762907295),
('kFEbTNdqlBWN8T3VgS1RqjPJSjQaT5W2NhYRN1Wy', NULL, '209.97.170.25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickM1WVlucFE2N095bTRuNVlKVkdldHFKMUdWbXpOZHhURElZRkRMSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762903707),
('KfmdqKrdJjDdh0ICwFomikv9hvcEuR6WWLUMvmHv', NULL, '149.102.234.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1d4andZRUptUXRTVEZ0YUZPWUw5aWdId1FkcGp4WFpDU3pKQVRtTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762937765),
('MK7PZOvBElCStKjQ9X45MX6czJuEYKbieEh7whA5', NULL, '183.134.59.131', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11) AppleWebKit/601.1.27 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/601.1.27', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHdlUWxFZGdCSWhnMU00R0VNdU5XTkdxY1Jyd0I1RTRBVUQ2NkZYMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762909659),
('NIrb7KpWhhajvN5JbxsIgaGISiFASiCXPpSTtJBE', NULL, '110.166.71.39', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidllUSU1hSEVLdk9xMDE5NDdLQlpnc0lTTzhlTUNoVkdMdzFKUTlHYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762936356),
('noSvjAcXwEnJhpEppgvOYBDjlF0NFj5aFTbxxtVG', NULL, '74.7.228.150', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36; compatible; OAI-SearchBot/1.3; +https://openai.com/searchbot', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzNEbTdQVDc1a2FpT3JKVGFtTndWV3VXSk1TTk5rUEo0bUsxeHRsTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTA6Imh0dHBzOi8vc29sYXJzZXR1cGluZGlhLmNvbS9wcm9kdWN0cy9kaWdpdGVrLWRtLTMwMi11c2ItcHJvZmVzc2lvbmFsLXJnYi1nYW1pbmctbWljcm9waG9uZSI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762924118),
('OtbHuMydMyBv6SeVs7cEUwkbY0A1e1Yjiiy1BXGd', NULL, '125.75.66.97', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDJvMGlSODV2TDNrbWl6SUdXTVI5UlpNUUhUY1M4eUowaWNISFdFQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762913249),
('OvxknEYG8sEvYErLBeToSYn9EzvsqJtoSFVOL1Dw', NULL, '91.134.54.94', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:115.0) Gecko/20100101 Chrome/115.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzhDUjJqb2VOVGdseFUxRko0V3A2Z0dUSnRVdEdDWXV6Y2FPb0VmWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762934337),
('PX2O4ScOkcWb2eJmnNz2PATHHEi2mD1ddc74NsKN', NULL, '59.14.17.48', 'Mozilla/5.0 (Linux; Android 9; Mi A2 Lite) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3d6M2pGOFI2dDZKNUtRMXNUYno3Zm5mTHNST3RWQ0xqTW1lUXBLYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vd3d3LnNvbGFyc2V0dXBpbmRpYS5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762907296),
('Q8cq8sRxvKsaInGESPyG1znxLjWtSm1pOKwcTydJ', NULL, '43.157.158.178', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDNwTGdVYkR1MFQ5ODdLenhOazE5Zmd2ams0Vzlkdzh4Y0duWkZaMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTk6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tL3Byb2R1Y3RzL2RpZ2l0ZWstdHlwZS1jLXRvLTM1bW0tdHJzLWNhYmxlLWZvci1taWNyb3Bob25lcy10by1iZS11c2VkLXdpdCI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762956402),
('r7OVwaoZxGAHECKrx9ENzJccQ6NuUz7wvsVmys70', NULL, '44.203.224.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWhYUE85TmpEbWZWUlVkMkdUR0Q5Nng4bnpsdVNPbmhtU0R5NDZNSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762918331),
('RnVNmU9YFPtLB8a8ej3Q7XHmgQrDqFTTTOH5cSmK', NULL, '205.169.39.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2t0bXVJU1RSMmhldWlwRDZVc2JnYkRSbjlTTUNyUXRpMmhjemlrYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762922611),
('u05L9KGXAqRBtb6HTRNCclioI89kkL6dR2blcPBD', NULL, '91.134.54.94', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:115.0) Gecko/20100101 Chrome/115.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUlKZFNQNjRWUGhzTGtGeDZwZmRKWkVxakFLVGhKZ0xSV1dLeFR0OCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762934222),
('vgx3QmT8QYgi3IyMQGN66tJdixtp0RH10P5Crem0', NULL, '43.133.69.37', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmFBSG5QamQ1YUZ6bUhaRE1XRjNKdlowT1lRQTdRN3VUdlVmTWh6TCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbS9jYXJ0IjtzOjU6InJvdXRlIjtzOjEwOiJjYXJ0LmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762955557),
('vQtOs62T1EdbAN6vo7ayCufVgxC14RQpmeWLdqNq', NULL, '43.157.95.239', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXJ5eWg3cG40enVLVkdJbFk4ODlSZDZWNU9VU3hHeTdZdFZmRmZLdSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762953261),
('W5CbAkmzJmy7ooGGiIkQWQpvmCNvK3gIlIDDDpot', NULL, '113.31.186.146', 'Mozilla/5.0 (Linux; Android 5.0.2; Redmi Note 3 Build/LRX22G; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.132 MQQBrowser/6.2 TBS/043906 Mobile Safari/537.36 V1_AND_SQ_7.3.0_758_YYB_D QQ/7.3.0.3340 NetType/WIFI WebP/0.3.0 Pixel/1080', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEJoNmVWRjFOVXJhbHhQSkNraWoxYjZrTDhtaU1FU3JHTnc3dVBKQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762909592),
('w9mm9uKfUwbgMxHQq0nt0T68YY0L4sWyjLUvg8ho', NULL, '113.31.186.146', 'Dalvik/2.1.0 (Linux; U; Android 9.0; ZTE BA520 Build/MRA58K)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2dxaVhPdVFXMkl3YzVQZzRxZzdNT2xvcVlQNEJuSXNmSVppdTI3ZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9zb2xhcnNldHVwaW5kaWEuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762909493),
('xBu4OWofbmQFnpqEjvDmXkyHwXliFjaPz4VePAFo', NULL, '43.130.110.130', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHZFeDVjc045bU1JWkx6QVROaURVMXM0YTlvRjlCVzF2R3hjZkV4biI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbS9wcm9kdWN0cyI7czo1OiJyb3V0ZSI7czoxNDoicHJvZHVjdHMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762954216),
('xI6UDYx36CszmSEkHXd3PAmSt0bIoxffiUinWtYm', NULL, '3.237.242.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnNueDZSQ0FQNXYzZUdxd05YTWRyNUFrOTdGbFpoY2FMRG9mVlZ5RiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762943691),
('XXW6RdzReDzTTWFaXGJDDdlaqjjpPkLtt36xyNq6', NULL, '43.164.197.177', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0duaGt1dDU5OERrSDhWSW04RWNseEI5ZDJoMXRNTFhGbVkxcnJjNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbS9jb250YWN0IjtzOjU6InJvdXRlIjtzOjEzOiJjb250YWN0LmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762949378),
('YpJiVVBM5IAttN2C5Pb0KdiBhjGriKuASZiE9sGk', NULL, '43.157.50.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHM2bHl5Z3o4Y0Z4ZnFNejlLbGRnMjFuSHh4Tk9qeENLZnRBY3BMMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly93d3cuc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762949602),
('ZnaL469nxUhN9uFiowI8yBNjDIWE8UjjCuOds1ne', NULL, '167.172.226.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFBFZ1BSR3JybkIyNkRleHFUeHRrU2xrRFJ2WU9HdkNlYmRwbms5cyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vc29sYXJzZXR1cGluZGlhLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762932511);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
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
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `is_admin`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', NULL, 1, '$2y$12$NYKdkExNw8Qt.L/5BRkfOebPVaGlLAwAa1J91e5NRXsmF21Z/2rcW', 'xV3Cgue1Q5mwQ5oXaDYB4tRTN106VfM1UT1mgRmVwdUzk4rgYE0HFS2X2h4I', '2025-11-02 10:01:44', '2025-11-02 10:01:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_posts_slug_unique` (`slug`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sku_index` (`sku`),
  ADD KEY `products_source_domain_index` (`source_domain`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_specifications_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD CONSTRAINT `product_specifications_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
