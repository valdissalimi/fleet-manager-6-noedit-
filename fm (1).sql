-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2021 at 07:21 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fm`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_settings`
--

CREATE TABLE `api_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_settings`
--

INSERT INTO `api_settings` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'api', '1', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(2, 'anyone_register', '0', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(3, 'region_availability', 'region one, region two, region three', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(4, 'driver_review', '0', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(5, 'booking', '3', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(6, 'cancel', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(7, 'max_trip', '1', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(8, 'api_key', '', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(9, 'db_url', '', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(10, 'db_secret', '', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(11, 'server_key', '', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(12, 'google_api', '0', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `pickup` timestamp NULL DEFAULT NULL,
  `dropoff` timestamp NULL DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `pickup_addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `travellers` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `customer_id`, `user_id`, `vehicle_id`, `driver_id`, `pickup`, `dropoff`, `duration`, `pickup_addr`, `dest_addr`, `note`, `travellers`, `status`, `payment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 1, 1, 7, '2021-11-13 07:25:17', '2021-11-15 00:14:35', 2880, '1436 Reina Summit Apt. 579\nKunzefort, WY 04680', '9723 Lynch Spur Apt. 101\nNorth Williamburgh, PA 22648-7595', 'sample note', 3, 1, 1, '2021-11-25 01:28:29', '2021-11-25 01:28:30', NULL),
(2, 4, 1, 1, 6, '2021-11-24 16:20:05', '2021-11-25 15:08:39', 2880, '773 Kathleen Glens Apt. 854\nEstherborough, SD 78741', '9500 Krystal Trafficway\nNorth Arely, RI 31015-6014', 'sample note', 1, 0, 0, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookings_meta`
--

CREATE TABLE `bookings_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'null',
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bookings_meta`
--

INSERT INTO `bookings_meta` (`id`, `booking_id`, `type`, `key`, `value`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'integer', 'tax_total', '500', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(2, 1, 'integer', 'total_tax_percent', '0', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(3, 1, 'integer', 'total_tax_charge_rs', '0', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(4, 1, 'string', 'ride_status', 'Completed', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(5, 1, 'string', 'journey_date', '13-11-2021', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(6, 1, 'string', 'journey_time', '14:25:17', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(7, 1, 'integer', 'customerid', '4', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(8, 1, 'integer', 'vehicleid', '1', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(9, 1, 'integer', 'day', '1', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(10, 1, 'integer', 'mileage', '10', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(11, 1, 'integer', 'waiting_time', '0', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(12, 1, 'string', 'date', '2021-11-25', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(13, 1, 'integer', 'total', '500', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(14, 1, 'integer', 'receipt', '1', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(15, 2, 'string', 'ride_status', 'Upcoming', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(16, 2, 'string', 'journey_date', '24-11-2021', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(17, 2, 'string', 'journey_time', '23:20:05', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `booking_income`
--

CREATE TABLE `booking_income` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `income_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `booking_income`
--

INSERT INTO `booking_income` (`id`, `booking_id`, `income_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking_payments`
--

CREATE TABLE `booking_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_quotation`
--

CREATE TABLE `booking_quotation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `pickup` timestamp NULL DEFAULT NULL,
  `dropoff` timestamp NULL DEFAULT NULL,
  `pickup_addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `travellers` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment` int(11) NOT NULL DEFAULT 0,
  `day` int(11) DEFAULT NULL,
  `mileage` double DEFAULT NULL,
  `waiting_time` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `tax_total` double(10,2) DEFAULT NULL,
  `total_tax_percent` double(10,2) DEFAULT NULL,
  `total_tax_charge_rs` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_services`
--

CREATE TABLE `company_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_services`
--

INSERT INTO `company_services` (`id`, `title`, `image`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Best price guranteed', 'fleet-bestprice.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.Neque at, nobis repudiandae dolores.', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29'),
(2, '24/7 Customer care', 'fleet-care.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.Neque at, nobis repudiandae dolores.', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29'),
(3, 'Home pickups', 'fleet-homepickup.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.Neque at, nobis repudiandae dolores.', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29'),
(4, 'Easy Bookings', 'fleet-easybooking.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.Neque at, nobis repudiandae dolores.', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `driver_logs`
--

CREATE TABLE `driver_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `driver_logs`
--

INSERT INTO `driver_logs` (`id`, `vehicle_id`, `driver_id`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 6, '2021-11-25 01:28:30', '2021-11-25 01:28:30', '2021-11-25 01:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `driver_vehicle`
--

CREATE TABLE `driver_vehicle` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `driver_vehicle`
--

INSERT INTO `driver_vehicle` (`id`, `vehicle_id`, `driver_id`, `created_at`, `updated_at`) VALUES
(1, 1, 6, '2021-11-25 01:28:30', '2021-11-25 01:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `email_content`
--

CREATE TABLE `email_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_content`
--

INSERT INTO `email_content` (`id`, `key`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'insurance', 'vehicle insurance email content', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(2, 'vehicle_licence', 'vehicle licence email content', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(3, 'driving_licence', 'driving licence email content', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(4, 'registration', 'vehicle registration email content', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(5, 'service_reminder', 'service reminder email content', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(6, 'users', '', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(7, 'options', '', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(8, 'email', '0', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `exp_id` int(11) DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'e',
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `user_id` int(11) DEFAULT NULL,
  `expense_type` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `vehicle_id`, `exp_id`, `type`, `amount`, `user_id`, `expense_type`, `comment`, `date`, `created_at`, `updated_at`, `deleted_at`, `vendor_id`) VALUES
(1, 1, NULL, 'e', 4491.00, 2, 1, 'Sample Comment', '2021-11-24', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, NULL),
(2, 2, NULL, 'e', 3877.00, 3, 4, 'Sample Comment', '2021-11-20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, NULL),
(3, 1, 1, 'e', 500.00, 2, 8, 'Sample Comment', '2021-11-23', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, NULL),
(4, 1, 2, 'e', 500.00, 2, 8, 'Sample Comment', '2021-12-05', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expense_cat`
--

CREATE TABLE `expense_cat` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `expense_cat`
--

INSERT INTO `expense_cat` (`id`, `name`, `user_id`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Insurance', 1, 'd', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(2, 'Patente', 1, 'd', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(3, 'Mechanics', 1, 'd', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(4, 'Car wash', 1, 'd', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(5, 'Vignette', 1, 'd', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(6, 'Maintenance', 1, 'd', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(7, 'Parking', 1, 'd', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(8, 'Fuel', 1, 'd', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(9, 'Car Services', 1, 'd', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fare_settings`
--

CREATE TABLE `fare_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fare_settings`
--

INSERT INTO `fare_settings` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`, `deleted_at`, `type_id`) VALUES
(1, 'hatchback_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 18:59:45', NULL, 1),
(2, 'hatchback_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 18:59:45', NULL, 1),
(3, 'hatchback_base_time', '2', '2021-11-25 01:28:30', '2021-11-25 18:59:45', NULL, 1),
(4, 'hatchback_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 18:59:45', NULL, 1),
(5, 'hatchback_weekend_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 18:59:45', NULL, 1),
(6, 'hatchback_weekend_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 18:59:45', NULL, 1),
(7, 'hatchback_weekend_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 18:59:45', NULL, 1),
(8, 'hatchback_weekend_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 18:59:45', NULL, 1),
(9, 'hatchback_night_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 18:59:45', NULL, 1),
(10, 'hatchback_night_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 18:59:45', NULL, 1),
(11, 'hatchback_night_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 18:59:45', NULL, 1),
(12, 'hatchback_night_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 18:59:45', NULL, 1),
(13, 'sedan_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 2),
(14, 'sedan_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 2),
(15, 'sedan_base_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 2),
(16, 'sedan_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 2),
(17, 'sedan_weekend_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 2),
(18, 'sedan_weekend_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 2),
(19, 'sedan_weekend_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 2),
(20, 'sedan_weekend_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 2),
(21, 'sedan_night_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 2),
(22, 'sedan_night_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 2),
(23, 'sedan_night_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 2),
(24, 'sedan_night_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 2),
(25, 'minivan_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 3),
(26, 'minivan_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 3),
(27, 'minivan_base_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 3),
(28, 'minivan_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 3),
(29, 'minivan_weekend_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 3),
(30, 'minivan_weekend_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 3),
(31, 'minivan_weekend_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 3),
(32, 'minivan_weekend_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 3),
(33, 'minivan_night_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 3),
(34, 'minivan_night_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 3),
(35, 'minivan_night_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 3),
(36, 'minivan_night_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 3),
(37, 'saloon_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 4),
(38, 'saloon_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 4),
(39, 'saloon_base_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 4),
(40, 'saloon_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 4),
(41, 'saloon_weekend_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 4),
(42, 'saloon_weekend_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 4),
(43, 'saloon_weekend_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 4),
(44, 'saloon_weekend_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 4),
(45, 'saloon_night_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 4),
(46, 'saloon_night_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 4),
(47, 'saloon_night_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 4),
(48, 'saloon_night_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 4),
(49, 'suv_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 5),
(50, 'suv_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 5),
(51, 'suv_base_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 5),
(52, 'suv_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 5),
(53, 'suv_weekend_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 5),
(54, 'suv_weekend_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 5),
(55, 'suv_weekend_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 5),
(56, 'suv_weekend_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 5),
(57, 'suv_night_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 5),
(58, 'suv_night_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 5),
(59, 'suv_night_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 5),
(60, 'suv_night_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 5),
(61, 'bus_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 6),
(62, 'bus_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 6),
(63, 'bus_base_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 6),
(64, 'bus_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 6),
(65, 'bus_weekend_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 6),
(66, 'bus_weekend_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 6),
(67, 'bus_weekend_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 6),
(68, 'bus_weekend_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 6),
(69, 'bus_night_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 6),
(70, 'bus_night_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 6),
(71, 'bus_night_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 6),
(72, 'bus_night_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 6),
(73, 'truck_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 7),
(74, 'truck_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 7),
(75, 'truck_base_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 7),
(76, 'truck_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 7),
(77, 'truck_weekend_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 7),
(78, 'truck_weekend_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 7),
(79, 'truck_weekend_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 7),
(80, 'truck_weekend_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 7),
(81, 'truck_night_base_fare', '500', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 7),
(82, 'truck_night_base_km', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 7),
(83, 'truck_night_wait_time', '2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 7),
(84, 'truck_night_std_fare', '20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `frontend`
--

CREATE TABLE `frontend` (
  `id` int(10) UNSIGNED NOT NULL,
  `key_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `frontend`
--

INSERT INTO `frontend` (`id`, `key_name`, `key_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'about_us', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(2, 'contact_email', 'master@admin.com', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(3, 'contact_phone', '0123456789', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(4, 'customer_support', '0999988888', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(5, 'about_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(6, 'about_title', 'Proudly serving you', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(7, 'facebook', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(8, 'twitter', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(9, 'instagram', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(10, 'linkedin', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(11, 'faq_link', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(12, 'cities', '5', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(13, 'vehicles', '10', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(14, 'cancellation', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(15, 'terms', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(16, 'privacy_policy', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(17, 'enable', '1', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(18, 'language', 'English-en', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(19, 'admin_approval', '1', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fuel`
--

CREATE TABLE `fuel` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `start_meter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_meter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `fuel_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost_per_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `consumption` int(11) DEFAULT NULL,
  `complete` int(11) DEFAULT 0,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fuel`
--

INSERT INTO `fuel` (`id`, `vehicle_id`, `user_id`, `start_meter`, `end_meter`, `reference`, `province`, `note`, `vendor_name`, `qty`, `fuel_from`, `cost_per_unit`, `consumption`, `complete`, `date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, '1000', '2000', NULL, 'Gujarat', 'sample note', NULL, 10, 'Fuel Tank', '50', 100, 0, '2021-11-23', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(2, 1, 2, '2000', '0', NULL, 'Gujarat', 'sample note', NULL, 10, 'Fuel Tank', '50', 0, 0, '2021-12-05', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `income_id` int(11) DEFAULT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `user_id` int(11) DEFAULT NULL,
  `income_cat` int(11) DEFAULT NULL,
  `mileage` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `tax_percent` double(10,2) DEFAULT NULL,
  `tax_charge_rs` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`id`, `vehicle_id`, `income_id`, `amount`, `user_id`, `income_cat`, `mileage`, `date`, `created_at`, `updated_at`, `deleted_at`, `tax_percent`, `tax_charge_rs`) VALUES
(1, 1, NULL, 2167.00, 2, 1, NULL, '2021-11-20', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 0.00, 0.00),
(2, 2, NULL, 4886.00, 3, 1, NULL, '2021-11-24', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 0.00, 0.00),
(3, 1, 1, 500.00, 1, 1, 10, '2021-11-25', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `income_cat`
--

CREATE TABLE `income_cat` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `income_cat`
--

INSERT INTO `income_cat` (`id`, `name`, `user_id`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Booking', 1, 'd', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mechanics`
--

CREATE TABLE `mechanics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mechanics`
--

INSERT INTO `mechanics` (`id`, `user_id`, `name`, `email`, `contact_number`, `category`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Prof. Lamar Smith', 'hilario51@example.net', '(394) 774-5850 x6553', 'Electrical Engineering', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(2, 1, 'Nikita Daugherty', 'rhea10@example.org', '576-619-2439 x58051', 'Electrical Engineering', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(10) UNSIGNED NOT NULL,
  `fcm_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2017_06_03_134331_create_expense_table', 1),
(7, '2017_06_03_134332_create_expense_cat_table', 1),
(8, '2017_06_03_134332_create_income_table', 1),
(9, '2017_06_03_134333_create_income_cat_table', 1),
(10, '2017_06_03_134336_create_password_resets_table', 1),
(11, '2017_06_03_134337_create_users_table', 1),
(12, '2017_06_03_134338_create_vehicles_table', 1),
(13, '2017_07_24_080537_create_booking_table', 1),
(14, '2017_07_24_080643_create_settings_table', 1),
(15, '2017_08_01_073926_create_booking_income_table', 1),
(16, '2017_10_30_064357_create_notifications_table', 1),
(17, '2017_10_30_094858_create_fuel_table', 1),
(18, '2017_11_09_105729_create_vendors_table', 1),
(19, '2017_11_10_062609_create_work_orders_table', 1),
(20, '2017_11_10_095438_create_notes_table', 1),
(21, '2017_11_22_093559_create_vehicle_group_table', 1),
(22, '2017_12_28_091600_create_service_items_table', 1),
(23, '2017_12_28_122952_create_service_reminder_table', 1),
(24, '2017_12_28_174333_create_api_settings_table', 1),
(25, '2018_01_08_062105_create_driver_vehicle_table', 1),
(26, '2018_01_10_130517_users_meta', 1),
(27, '2018_01_13_050018_bookings_meta', 1),
(28, '2018_01_16_095657_fare_settings', 1),
(29, '2018_01_25_050939_create_vehicles_meta_table', 1),
(30, '2018_02_06_052302_create_message_table', 1),
(31, '2018_02_06_125252_create_reviews_table', 1),
(32, '2018_03_13_124424_create_addresses_table', 1),
(33, '2018_03_28_085735_create_reasons_table', 1),
(34, '2018_04_28_073004_create_email_content_table', 1),
(35, '2018_08_14_061757_create_vehicle_review_table', 1),
(36, '2019_01_18_063916_add_vendor_id_to_expense', 1),
(37, '2019_01_19_080738_add_udf_to_vendors', 1),
(38, '2019_01_19_103826_create_parts_table', 1),
(39, '2019_01_19_110823_create_vehicle_types_table', 1),
(40, '2019_01_22_101948_create_driver_logs_table', 1),
(41, '2019_01_23_113852_add_type_id_to_vehicles_table', 1),
(42, '2019_01_24_095115_add_type_id_to_fare_settings_table', 1),
(43, '2019_04_12_092111_create_parts_category_table', 1),
(44, '2019_04_19_053314_create_work_order_logs_table', 1),
(45, '2019_05_13_062039_create_push_notification_table', 1),
(46, '2019_07_18_110031_add_column_to_vendors', 1),
(47, '2019_07_31_082514_create_testimonials_table', 1),
(48, '2019_07_31_102801_create_frontend_table', 1),
(49, '2019_08_01_045837_add_columns_to_message_table', 1),
(50, '2019_08_19_101509_create_booking_quotation_table', 1),
(51, '2019_08_22_052138_create_parts_used_table', 1),
(52, '2019_08_22_113138_add_parts_price_to_work_order_logs_table', 1),
(53, '2019_08_29_104613_create_company_services_table', 1),
(54, '2019_09_16_085700_create_teams_table', 1),
(55, '2019_12_10_083547_add_columns_to_booking_quotation_table', 1),
(56, '2019_12_16_064152_add_indexes_to_users_table', 1),
(57, '2019_12_16_064951_add_indexes_to_addresses_table', 1),
(58, '2019_12_16_065511_add_indexes_to_bookings_table', 1),
(59, '2019_12_16_083315_add_indexes_to_booking_income_table', 1),
(60, '2019_12_16_084539_add_indexes_to_booking_quotation_table', 1),
(61, '2019_12_16_085312_add_indexes_to_driver_logs_table', 1),
(62, '2019_12_16_085505_add_indexes_to_driver_vehicle_table', 1),
(63, '2019_12_16_091010_add_indexes_to_email_content_table', 1),
(64, '2019_12_16_091713_add_indexes_to_expense_table', 1),
(65, '2019_12_16_094305_add_indexes_to_expense_cat_table', 1),
(66, '2019_12_16_094651_add_indexes_to_fare_settings_table', 1),
(67, '2019_12_16_095024_add_indexes_to_frontend_table', 1),
(68, '2019_12_16_095339_add_indexes_to_fuel_table', 1),
(69, '2019_12_16_095634_add_indexes_to_income_table', 1),
(70, '2019_12_16_095953_add_indexes_to_income_cat_table', 1),
(71, '2019_12_16_100221_add_indexes_to_notes_table', 1),
(72, '2019_12_16_100437_add_indexes_to_notifications_table', 1),
(73, '2019_12_16_100545_add_indexes_to_parts_table', 1),
(74, '2019_12_16_101113_add_indexes_to_parts_used_table', 1),
(75, '2019_12_16_101540_add_indexes_to_push_notification_table', 1),
(76, '2019_12_16_101851_add_indexes_to_reviews_table', 1),
(77, '2019_12_16_102259_add_indexes_to_service_reminder_table', 1),
(78, '2019_12_16_102555_add_indexes_to_vehicles_table', 1),
(79, '2019_12_16_104209_add_indexes_to_vehicle_review_table', 1),
(80, '2019_12_16_104440_add_indexes_to_vendors_table', 1),
(81, '2019_12_16_104704_add_indexes_to_work_orders_table', 1),
(82, '2019_12_16_105013_add_indexes_to_work_order_logs_table', 1),
(83, '2019_12_16_115309_add_indexes_to_api_settings_table', 1),
(84, '2019_12_17_080649_add_taxes_to_income_table', 1),
(85, '2019_12_19_052248_create_payment_settings_table', 1),
(86, '2019_12_19_063520_create_booking_payments_table', 1),
(87, '2021_01_04_113449_create_twilio_settings_table', 1),
(88, '2021_06_29_052236_add_udf_field_to_vehicle_review_table', 1),
(89, '2021_06_29_115538_create_mechanics_table', 1),
(90, '2021_07_02_051340_create_permission_tables', 1),
(91, '2021_07_02_052117_add_mechanic_work_order_table', 1),
(92, '2021_07_02_055514_add_mechanic_work_order_log_table', 1),
(93, '2021_07_22_071412_create_push_subscriptions_table', 1),
(94, '2021_07_22_113433_add_provider_to_oauth_clients_table', 1),
(95, '2021_08_27_050813_create_vehicle_make_table', 1),
(96, '2021_08_27_050840_create_vehicle_colors_table', 1),
(97, '2021_08_27_050857_create_vehicle_model_table', 1),
(98, '2021_08_27_051918_add_make_model_color_table', 1),
(99, '2021_08_27_121756_add_user_id_to_mechanics_table', 1),
(100, '2021_08_27_121856_add_user_id_to_parts_category_table', 1),
(101, '2021_08_27_121941_add_user_id_to_service_items_table', 1),
(102, '2021_08_27_122008_add_user_id_to_service_reminder_table', 1),
(103, '2021_08_27_122045_add_user_id_to_vehicle_group_table', 1),
(104, '2021_08_27_122127_add_user_id_to_vendors_table', 1),
(105, '2021_08_27_122155_add_user_id_to_work_orders_table', 1),
(106, '2021_08_27_122217_add_user_id_to_work_order_logs_table', 1),
(107, '2021_08_27_122259_add_user_id_to_notes_table', 1),
(108, '2021_09_07_070458_add_user_id_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(9, 'App\\Model\\User', 6),
(9, 'App\\Model\\User', 7),
(71, 'App\\Model\\User', 4),
(71, 'App\\Model\\User', 5),
(72, 'App\\Model\\User', 4),
(72, 'App\\Model\\User', 5),
(73, 'App\\Model\\User', 4),
(73, 'App\\Model\\User', 5),
(74, 'App\\Model\\User', 4),
(74, 'App\\Model\\User', 5),
(81, 'App\\Model\\User', 6),
(81, 'App\\Model\\User', 7),
(82, 'App\\Model\\User', 6),
(82, 'App\\Model\\User', 7),
(83, 'App\\Model\\User', 6),
(83, 'App\\Model\\User', 7),
(84, 'App\\Model\\User', 6),
(84, 'App\\Model\\User', 7),
(101, 'App\\Model\\User', 6),
(101, 'App\\Model\\User', 7),
(102, 'App\\Model\\User', 6),
(102, 'App\\Model\\User', 7),
(103, 'App\\Model\\User', 6),
(103, 'App\\Model\\User', 7),
(104, 'App\\Model\\User', 6),
(104, 'App\\Model\\User', 7);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Model\\User', 1),
(2, 'App\\Model\\User', 2),
(2, 'App\\Model\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `submitted_on` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Fleet Manager Personal Access Client', 'iFj8vaPtyKDzOMcQesk6vIbPwY8PzpF5TaEo1W6B', NULL, 'http://localhost', 1, 0, 0, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(2, NULL, 'Fleet Manager Password Grant Client', 'KQnEEWJhAmzF2VGzWJ34tNoJWBUMS3SUdEDf1mpS', 'users', 'http://localhost', 0, 1, 0, '2021-11-25 01:28:30', '2021-11-25 01:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-11-25 01:28:30', '2021-11-25 01:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `availability` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_cost` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `manufacturer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `udf` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parts_category`
--

CREATE TABLE `parts_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parts_category`
--

INSERT INTO `parts_category` (`id`, `user_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Engine Parts', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(2, 1, 'Electricals', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parts_used`
--

CREATE TABLE `parts_used` (
  `id` int(10) UNSIGNED NOT NULL,
  `part_id` int(11) DEFAULT NULL,
  `work_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_settings`
--

INSERT INTO `payment_settings` (`id`, `name`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'method', '[\"cash\"]', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(2, 'currency_code', 'INR', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(3, 'stripe_publishable_key', '', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(4, 'stripe_secret_key', '', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(5, 'razorpay_key', '', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(6, 'razorpay_secret', '', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Users add', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(2, 'Users edit', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(3, 'Users delete', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(4, 'Users list', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(5, 'Users import', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(6, 'Drivers add', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(7, 'Drivers edit', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(8, 'Drivers delete', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(9, 'Drivers list', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(10, 'Drivers import', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(11, 'Customer add', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(12, 'Customer edit', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(13, 'Customer delete', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(14, 'Customer list', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(15, 'Customer import', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(16, 'VehicleType add', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(17, 'VehicleType edit', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(18, 'VehicleType delete', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(19, 'VehicleType list', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(20, 'VehicleType import', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(21, 'VehicleMaker add', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(22, 'VehicleMaker edit', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(23, 'VehicleMaker delete', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(24, 'VehicleMaker list', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(25, 'VehicleMaker import', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(26, 'VehicleModels add', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(27, 'VehicleModels edit', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(28, 'VehicleModels delete', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(29, 'VehicleModels list', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(30, 'VehicleModels import', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(31, 'VehicleColors add', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(32, 'VehicleColors edit', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(33, 'VehicleColors delete', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(34, 'VehicleColors list', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(35, 'VehicleColors import', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(36, 'VehicleGroup add', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(37, 'VehicleGroup edit', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(38, 'VehicleGroup delete', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(39, 'VehicleGroup list', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(40, 'VehicleGroup import', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(41, 'VehicleInspection add', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(42, 'VehicleInspection edit', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(43, 'VehicleInspection delete', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(44, 'VehicleInspection list', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(45, 'VehicleInspection import', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(46, 'BookingQuotations add', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(47, 'BookingQuotations edit', 'web', '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(48, 'BookingQuotations delete', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(49, 'BookingQuotations list', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(50, 'BookingQuotations import', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(51, 'PartsCategory add', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(52, 'PartsCategory edit', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(53, 'PartsCategory delete', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(54, 'PartsCategory list', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(55, 'PartsCategory import', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(56, 'Mechanics add', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(57, 'Mechanics edit', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(58, 'Mechanics delete', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(59, 'Mechanics list', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(60, 'Mechanics import', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(61, 'Vehicles add', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(62, 'Vehicles edit', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(63, 'Vehicles delete', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(64, 'Vehicles list', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(65, 'Vehicles import', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(66, 'Transactions add', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(67, 'Transactions edit', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(68, 'Transactions delete', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(69, 'Transactions list', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(70, 'Transactions import', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(71, 'Bookings add', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(72, 'Bookings edit', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(73, 'Bookings delete', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(74, 'Bookings list', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(75, 'Bookings import', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(76, 'Reports add', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(77, 'Reports edit', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(78, 'Reports delete', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(79, 'Reports list', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(80, 'Reports import', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(81, 'Fuel add', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(82, 'Fuel edit', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(83, 'Fuel delete', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(84, 'Fuel list', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(85, 'Fuel import', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(86, 'Vendors add', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(87, 'Vendors edit', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(88, 'Vendors delete', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(89, 'Vendors list', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(90, 'Vendors import', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(91, 'Parts add', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(92, 'Parts edit', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(93, 'Parts delete', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(94, 'Parts list', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(95, 'Parts import', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(96, 'WorkOrders add', 'web', '2021-11-25 01:28:32', '2021-11-25 01:28:32'),
(97, 'WorkOrders edit', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(98, 'WorkOrders delete', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(99, 'WorkOrders list', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(100, 'WorkOrders import', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(101, 'Notes add', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(102, 'Notes edit', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(103, 'Notes delete', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(104, 'Notes list', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(105, 'Notes import', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(106, 'ServiceReminders add', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(107, 'ServiceReminders edit', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(108, 'ServiceReminders delete', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(109, 'ServiceReminders list', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(110, 'ServiceReminders import', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(111, 'ServiceItems add', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(112, 'ServiceItems edit', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(113, 'ServiceItems delete', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(114, 'ServiceItems list', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(115, 'ServiceItems import', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(116, 'Testimonials add', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(117, 'Testimonials edit', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(118, 'Testimonials delete', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(119, 'Testimonials list', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(120, 'Testimonials import', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(121, 'Team add', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(122, 'Team edit', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(123, 'Team delete', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(124, 'Team list', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(125, 'Team import', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(126, 'Settings add', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(127, 'Settings edit', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(128, 'Settings delete', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(129, 'Settings list', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(130, 'Settings import', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(131, 'Inquiries add', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(132, 'Inquiries edit', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(133, 'Inquiries delete', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(134, 'Inquiries list', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(135, 'Inquiries import', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33');

-- --------------------------------------------------------

--
-- Table structure for table `push_notification`
--

CREATE TABLE `push_notification` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authtoken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contentencoding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endpoint` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publickey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_subscriptions`
--

CREATE TABLE `push_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscribable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subscribable_id` bigint(20) UNSIGNED NOT NULL,
  `endpoint` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `public_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_encoding` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reasons`
--

CREATE TABLE `reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `reason` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reasons`
--

INSERT INTO `reasons` (`id`, `reason`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'No fuel', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29'),
(2, 'Tire punctured', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `ratings` double(8,2) DEFAULT NULL,
  `review_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2021-11-25 01:28:33', '2021-11-25 01:28:33'),
(2, 'Admin', 'web', '2021-11-25 01:28:34', '2021-11-25 01:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_items`
--

CREATE TABLE `service_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_interval` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'off',
  `overdue_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `overdue_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meter_interval` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'off',
  `overdue_meter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'off',
  `duesoon_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duesoon_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_meter` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'off',
  `duesoon_meter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_items`
--

INSERT INTO `service_items` (`id`, `user_id`, `description`, `time_interval`, `overdue_time`, `overdue_unit`, `meter_interval`, `overdue_meter`, `show_time`, `duesoon_time`, `duesoon_unit`, `show_meter`, `duesoon_meter`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Change oil', 'on', '60', 'day(s)', 'off', NULL, 'on', '2', 'day(s)', 'off', NULL, NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `service_reminder`
--

CREATE TABLE `service_reminder` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `last_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_meter` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `label`, `name`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Website Name', 'app_name', 'Fleet Manager', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(2, 'Business Address 1', 'badd1', 'Company Address 1', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(3, 'Business Address 2', 'badd2', 'Company Address 2', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(4, 'Email Address', 'email', 'master@admin.com', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(5, 'City', 'city', 'Bhavnagar', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(6, 'State', 'state', 'Gujarat', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(7, 'Country', 'country', 'India', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(8, 'Distence Format', 'dis_format', 'km', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(9, 'Language', 'language', 'English-en', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(10, 'Currency', 'currency', '₹', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(11, 'Tax No', 'tax_no', 'ABCD8735XXX', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(12, 'Invoice Text', 'invoice_text', 'Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(13, 'Small Logo', 'icon_img', 'logo-40.png', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(14, 'Main Logo', 'logo_img', 'logo.png', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(15, 'Time Interval', 'time_interval', '30', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(16, 'Tax Charge', 'tax_charge', 'null', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(17, 'Fuel Unit', 'fuel_unit', 'gallon', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(18, 'Date Format', 'date_format', 'd-m-Y', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(19, 'Website Footer', 'web_footer', '<p><span style=\"font-size: 16px;\">© Hyvikk Solutions 2021. All Rights Reserved.&nbsp;<span class=\"vertical-spacer d-none d-lg-inline\">|</span>&nbsp;Powered By&nbsp;</span><a href=\"https://hyvikk.com/\" target=\"_blank\" class=\"link\"><span style=\"font-size: 16px;\">Hyvikk</span></a></p>', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(20, 'Fuel enable for Driver', 'fuel_enable_driver', '0', '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `details`, `designation`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Jaylan Torp', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus neque est nemo et ipsum fugiat, ab facere adipisci. Aliquam quibusdam molestias quisquam distinctio? Culpa, voluptatem voluptates exercitationem sequi velit quaerat.', 'Owner', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(2, 'Prof. Randall Will', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus neque est nemo et ipsum fugiat, ab facere adipisci. Aliquam quibusdam molestias quisquam distinctio? Culpa, voluptatem voluptates exercitationem sequi velit quaerat.', 'Owner', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(3, 'Aidan Morar V', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus neque est nemo et ipsum fugiat, ab facere adipisci. Aliquam quibusdam molestias quisquam distinctio? Culpa, voluptatem voluptates exercitationem sequi velit quaerat.', 'Owner', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(4, 'Mr. Harrison Dicki', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus neque est nemo et ipsum fugiat, ab facere adipisci. Aliquam quibusdam molestias quisquam distinctio? Culpa, voluptatem voluptates exercitationem sequi velit quaerat.', 'Owner', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(5, 'Carissa Murphy', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus neque est nemo et ipsum fugiat, ab facere adipisci. Aliquam quibusdam molestias quisquam distinctio? Culpa, voluptatem voluptates exercitationem sequi velit quaerat.', 'Owner', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `details`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Prof. Levi Howe', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet animi doloribus, repudiandae iusto magnam soluta voluptates, expedita aspernatur consectetur! Ex fugit ducimus itaque, quibusdam nemo in animi quae libero repellendus!', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(2, 'Pearl McCullough', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet animi doloribus, repudiandae iusto magnam soluta voluptates, expedita aspernatur consectetur! Ex fugit ducimus itaque, quibusdam nemo in animi quae libero repellendus!', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(3, 'Dr. Javonte Yundt PhD', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet animi doloribus, repudiandae iusto magnam soluta voluptates, expedita aspernatur consectetur! Ex fugit ducimus itaque, quibusdam nemo in animi quae libero repellendus!', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(4, 'Prof. Alena Runolfsson', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet animi doloribus, repudiandae iusto magnam soluta voluptates, expedita aspernatur consectetur! Ex fugit ducimus itaque, quibusdam nemo in animi quae libero repellendus!', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(5, 'Nathanael Wisozk', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet animi doloribus, repudiandae iusto magnam soluta voluptates, expedita aspernatur consectetur! Ex fugit ducimus itaque, quibusdam nemo in animi quae libero repellendus!', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `twilio_settings`
--

CREATE TABLE `twilio_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `twilio_settings`
--

INSERT INTO `twilio_settings` (`id`, `name`, `value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'sid', '', '2021-11-25 01:28:31', '2021-11-25 01:28:31', NULL),
(2, 'token', '', '2021-11-25 01:28:31', '2021-11-25 01:28:31', NULL),
(3, 'from', '', '2021-11-25 01:28:31', '2021-11-25 01:28:31', NULL),
(4, 'customer_message', '', '2021-11-25 01:28:31', '2021-11-25 01:28:31', NULL),
(5, 'driver_message', '', '2021-11-25 01:28:31', '2021-11-25 01:28:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `name`, `email`, `password`, `user_type`, `group_id`, `api_token`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Super Administrator', 'master@admin.com', '$2y$10$YPB6ZSH8FalSQ2kUMGcAfu7iHz.uTz5y0IJ9N5m/9trHQ5hq2tLvC', 'S', NULL, 'l4JQff7X04kmUC9b4LkhpFfV7yWvn83KnSztAv6AnQdJyXQ6pXJ2pwbusdCD', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(2, 1, 'User One', 'user1@admin.com', '$2y$10$oudN6fiqyvOpQKqQOmXlBuzBZQwUb0O19zKpa6cTI/gZc3pCmRfD2', 'O', 1, 'WYx9094ymcyDyZ9DObdPlihL4OHXj1gDA8Gg8c91pYCTWFkgc8gtlepT4yVu', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(3, 1, 'User Two', 'user2@admin.com', '$2y$10$MKZqafMTO.r5XBvZ2ecZ8ebJaPha1t47YeWL0FbQZVW54YlIK7Oem', 'O', 1, 'E8c8rhBKtt4yZphSnSWtdYv3vcAPvThzqFOhwkgcr2o598dou9JoAhMe7v3B', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(4, 1, 'Customer One', 'customer1@gmail.com', '$2y$10$1GP7vDR9BJBggZzYFoaUde3rtV3M.RSLkYbhvSZ1PmhiUpnWcFoMy', 'C', NULL, '50SBKiFyL2WaaypXnIZmIcQ2toi6MI0lfAnAQPPE18k1W5dti4DnjPU30IsP', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(5, 1, 'Customer Two', 'customer2@gmail.com', '$2y$10$aR4rECMnBt5ND7DDAmqGpetMroFNLXq7FBCjUUCHVz7DEPAQKb/42', 'C', NULL, 'cDijfY1laOUVphtegrR7VexCWC00nxgh296XGTZKaU7T22EP8xxvBj4QSQNC', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL),
(6, 1, 'Ike Swaniawski', 'vzieme@example.net', '$2y$10$YZcOmp/7XRV.Cg/AZTEbg.D8LT0Y4cGego7Lk6DPHEveLx37mDfea', 'D', NULL, 'ULjR12GygcUR56GrYm6hQyHafWCM1X4xzw1TPAqOpl0wB69VY1lz6ubD1Leb', 'wUN295KO3V', '2021-11-25 01:28:31', '2021-11-25 01:28:31', NULL),
(7, 1, 'Eugene Collier V', 'murazik.jayson@example.com', '$2y$10$qbkym7CGg3pkz02EOb35Luu.WKFJoUWR6NXWYC3LKL4pzhPodbxYi', 'D', NULL, 'fyGWOWdE6dPWPLpL2EAT9b9nQcGb0Qtpf74SgZsuQITwzTLD1ts6QDkr5Azv', 'PXTsFZaTma', '2021-11-25 01:28:31', '2021-11-25 01:28:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_meta`
--

CREATE TABLE `users_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'null',
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users_meta`
--

INSERT INTO `users_meta` (`id`, `user_id`, `type`, `key`, `value`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'string', 'profile_image', 'no-user.jpg', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(2, 1, 'string', 'module', 'a:15:{i:0;i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;i:5;i:6;i:6;i:7;i:7;i:8;i:8;i:9;i:9;i:10;i:10;i:11;i:12;i:12;i:13;i:13;i:14;i:14;i:15;}', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(3, 2, 'string', 'module', 'a:15:{i:0;i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;i:5;i:6;i:6;i:7;i:7;i:8;i:8;i:9;i:9;i:10;i:10;i:11;i:12;i:12;i:13;i:13;i:14;i:14;i:15;}', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(4, 3, 'string', 'module', 'a:15:{i:0;i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;i:5;i:6;i:6;i:7;i:7;i:8;i:8;i:9;i:9;i:10;i:10;i:11;i:12;i:12;i:13;i:13;i:14;i:14;i:15;}', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(5, 4, 'string', 'first_name', 'Customer', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(6, 4, 'string', 'last_name', 'One', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(7, 4, 'string', 'address', '728 Evalyn Knolls Apt. 119 Lake Jaydenville, MD 74979-3406', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(8, 4, 'string', 'mobno', '8639379915669', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(9, 4, 'integer', 'gender', '0', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(10, 5, 'string', 'first_name', 'Customer', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(11, 5, 'string', 'last_name', 'Two', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(12, 5, 'string', 'address', '91158 Luigi Cliffs Lake Darby, MA 39627-1727', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(13, 5, 'string', 'mobno', '9773607007903', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(14, 5, 'integer', 'gender', '1', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(15, 6, 'string', 'first_name', 'Ike', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(16, 6, 'string', 'last_name', 'Swaniawski', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(17, 6, 'string', 'address', '86424 Bergstrom Corner\nJaquanburgh, AR 31925', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(18, 6, 'string', 'phone', '08891333688288', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(19, 6, 'string', 'issue_date', '2021-11-25', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(20, 6, 'string', 'exp_date', '2022-01-25', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(21, 6, 'string', 'start_date', '2021-11-25', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(22, 6, 'string', 'end_date', '2021-12-25', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(23, 6, 'integer', 'license_number', '179004', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(24, 6, 'integer', 'contract_number', '1934', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(25, 6, 'integer', 'emp_id', '27754993', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(26, 7, 'string', 'first_name', 'Eugene', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(27, 7, 'string', 'last_name', 'Collier', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(28, 7, 'string', 'address', '79780 Jarrett Passage\nLake Gerardo, OK 57587-7623', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(29, 7, 'string', 'phone', '05408626755554', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(30, 7, 'string', 'issue_date', '2021-11-25', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(31, 7, 'string', 'exp_date', '2022-01-25', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(32, 7, 'string', 'start_date', '2021-11-25', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(33, 7, 'string', 'end_date', '2021-12-25', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(34, 7, 'integer', 'license_number', '699097', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(35, 7, 'integer', 'contract_number', '5472', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(36, 7, 'integer', 'emp_id', '275', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(37, 6, 'integer', 'vehicle_id', '1', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31'),
(38, 1, 'string', 'language', 'English-en', NULL, '2021-11-25 01:30:17', '2021-11-25 01:34:05');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `make_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `lic_exp_date` date DEFAULT NULL,
  `reg_exp_date` date DEFAULT NULL,
  `vehicle_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `engine_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `horse_power` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license_plate` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mileage` int(11) DEFAULT NULL,
  `in_service` tinyint(4) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `int_mileage` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `make_id`, `model_id`, `color_id`, `year`, `group_id`, `lic_exp_date`, `reg_exp_date`, `vehicle_image`, `engine_type`, `horse_power`, `vin`, `license_plate`, `mileage`, `in_service`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `int_mileage`, `type_id`) VALUES
(1, 1, 1, 1, '2015', 1, '2022-08-02', '2022-04-24', 'car1.jpeg', 'Petrol', '190', '2342342', '9191bh', 45464, 1, 1, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 50, 3),
(2, 2, 2, 2, '2012', 1, '2022-11-25', '2022-02-23', 'car2.jpeg', 'Petrol', '150', '124578', '1245ab', 45464, 1, 1, '2021-11-25 01:28:30', '2021-11-25 01:28:30', NULL, 40, 3);

-- --------------------------------------------------------

--
-- Table structure for table `vehicles_meta`
--

CREATE TABLE `vehicles_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'null',
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vehicles_meta`
--

INSERT INTO `vehicles_meta` (`id`, `vehicle_id`, `type`, `key`, `value`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'integer', 'driver_id', '6', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(2, 1, 'double', 'average', '35.45', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(3, 1, 'string', 'ins_number', '70651', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(4, 1, 'string', 'ins_exp_date', '2022-06-03', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(5, 2, 'double', 'average', '42.5', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(6, 2, 'string', 'ins_number', '36945', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30'),
(7, 2, 'string', 'ins_exp_date', '2022-06-03', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_colors`
--

CREATE TABLE `vehicle_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vehicle_colors`
--

INSERT INTO `vehicle_colors` (`id`, `color`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'red', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29'),
(2, 'white', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_group`
--

CREATE TABLE `vehicle_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vehicle_group`
--

INSERT INTO `vehicle_group` (`id`, `user_id`, `name`, `description`, `note`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'Default vehicle group', 'Default vehicle group', NULL, '2021-11-25 01:28:30', '2021-11-25 01:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_make`
--

CREATE TABLE `vehicle_make` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `make` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vehicle_make`
--

INSERT INTO `vehicle_make` (`id`, `make`, `image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Tata', NULL, NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29'),
(2, 'Maruti', NULL, NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_model`
--

CREATE TABLE `vehicle_model` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `make_id` int(11) DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vehicle_model`
--

INSERT INTO `vehicle_model` (`id`, `make_id`, `model`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nano', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29'),
(2, 2, 'Suzuki', NULL, '2021-11-25 01:28:29', '2021-11-25 01:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_review`
--

CREATE TABLE `vehicle_review` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reg_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kms_outgoing` int(11) DEFAULT NULL,
  `kms_incoming` int(11) DEFAULT NULL,
  `fuel_level_out` int(11) DEFAULT NULL,
  `fuel_level_in` int(11) DEFAULT NULL,
  `datetime_outgoing` datetime DEFAULT NULL,
  `datetime_incoming` datetime DEFAULT NULL,
  `petrol_card` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lights` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `invertor` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `car_mats` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `int_damage` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `int_lights` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ext_car` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tyre` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ladder` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `leed` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `power_tool` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ac` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `head_light` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lock` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `windows` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `condition` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `oil_chk` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `suspension` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tool_box` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `udf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_types`
--

CREATE TABLE `vehicle_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicletype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isenable` int(11) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vehicle_types`
--

INSERT INTO `vehicle_types` (`id`, `vehicletype`, `displayname`, `icon`, `isenable`, `seats`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Hatchback', 'Hatchback', NULL, 1, 4, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(2, 'Sedan', 'Sedan', NULL, 1, 4, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(3, 'Mini van', 'Mini van', NULL, 1, 7, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(4, 'Saloon', 'Saloon', NULL, 1, 4, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(5, 'SUV', 'SUV', NULL, 1, 4, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(6, 'Bus', 'Bus', NULL, 1, 40, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL),
(7, 'Truck', 'Truck', NULL, 1, 3, '2021-11-25 01:28:29', '2021-11-25 01:28:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `udf` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `user_id`, `name`, `photo`, `type`, `website`, `custom_type`, `note`, `phone`, `address1`, `address2`, `city`, `province`, `email`, `deleted_at`, `created_at`, `updated_at`, `udf`, `country`, `postal_code`) VALUES
(1, 1, 'Dr. Ressie Haag', NULL, 'Parts', 'http://www.example.com', NULL, 'default vendor', '07258377555490', '76051 Zion Shore\nModestomouth, WV 10554', NULL, 'South Constance', NULL, 'oziemann@example.com', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31', NULL, NULL, NULL),
(2, 1, 'Dr. Mason Schmitt', NULL, 'Machinaries', 'http://www.example.com', NULL, 'default vendor', '05005138329092', '6457 Buckridge Lights Apt. 484\nDanykaview, AR 13910-7451', NULL, 'Lake Ariannaton', NULL, 'cschowalter@example.org', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `work_orders`
--

CREATE TABLE `work_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `required_by` date DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meter` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mechanic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `work_orders`
--

INSERT INTO `work_orders` (`id`, `user_id`, `created_on`, `required_by`, `vehicle_id`, `vendor_id`, `price`, `status`, `description`, `meter`, `note`, `deleted_at`, `created_at`, `updated_at`, `mechanic_id`) VALUES
(1, 1, '2021-11-25', '2021-11-30', 1, 1, 3000.00, 'Completed', 'Sample work order', 1476, 'sample work order', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31', 1),
(2, 1, '2021-11-25', '2021-11-30', 2, 2, 3000.00, 'Pending', 'Sample work order', 1571, 'sample work order', NULL, '2021-11-25 01:28:31', '2021-11-25 01:28:31', 2);

-- --------------------------------------------------------

--
-- Table structure for table `work_order_logs`
--

CREATE TABLE `work_order_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `required_by` date DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meter` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parts_price` double DEFAULT 0,
  `mechanic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_customer_id_index` (`customer_id`);

--
-- Indexes for table `api_settings`
--
ALTER TABLE `api_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_settings_key_name_index` (`key_name`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_customer_id_driver_id_vehicle_id_user_id_index` (`customer_id`,`driver_id`,`vehicle_id`,`user_id`),
  ADD KEY `bookings_payment_status_index` (`payment`,`status`);

--
-- Indexes for table `bookings_meta`
--
ALTER TABLE `bookings_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_meta_booking_id_index` (`booking_id`),
  ADD KEY `bookings_meta_key_index` (`key`);

--
-- Indexes for table `booking_income`
--
ALTER TABLE `booking_income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_income_booking_id_income_id_index` (`booking_id`,`income_id`);

--
-- Indexes for table `booking_payments`
--
ALTER TABLE `booking_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_quotation`
--
ALTER TABLE `booking_quotation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_quotation_customer_id_user_id_vehicle_id_driver_id_index` (`customer_id`,`user_id`,`vehicle_id`,`driver_id`),
  ADD KEY `booking_quotation_status_payment_index` (`status`,`payment`);

--
-- Indexes for table `company_services`
--
ALTER TABLE `company_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_logs`
--
ALTER TABLE `driver_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_logs_driver_id_vehicle_id_index` (`driver_id`,`vehicle_id`);

--
-- Indexes for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_vehicle_driver_id_vehicle_id_index` (`driver_id`,`vehicle_id`);

--
-- Indexes for table `email_content`
--
ALTER TABLE `email_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_content_key_index` (`key`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_vehicle_id_exp_id_user_id_expense_type_index` (`vehicle_id`,`exp_id`,`user_id`,`expense_type`),
  ADD KEY `expense_type_index` (`type`),
  ADD KEY `expense_date_index` (`date`);

--
-- Indexes for table `expense_cat`
--
ALTER TABLE `expense_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_cat_name_type_index` (`name`,`type`);

--
-- Indexes for table `fare_settings`
--
ALTER TABLE `fare_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fare_settings_key_name_index` (`key_name`),
  ADD KEY `fare_settings_type_id_index` (`type_id`);

--
-- Indexes for table `frontend`
--
ALTER TABLE `frontend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `frontend_key_name_index` (`key_name`);

--
-- Indexes for table `fuel`
--
ALTER TABLE `fuel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fuel_vehicle_id_user_id_index` (`vehicle_id`,`user_id`),
  ADD KEY `fuel_date_index` (`date`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`id`),
  ADD KEY `income_vehicle_id_income_id_user_id_income_cat_index` (`vehicle_id`,`income_id`,`user_id`,`income_cat`),
  ADD KEY `income_date_index` (`date`);

--
-- Indexes for table `income_cat`
--
ALTER TABLE `income_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `income_cat_name_type_index` (`name`,`type`);

--
-- Indexes for table `mechanics`
--
ALTER TABLE `mechanics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
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
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_vehicle_id_customer_id_index` (`vehicle_id`,`customer_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  ADD KEY `notifications_type_index` (`type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parts_category_id_user_id_availability_index` (`category_id`,`user_id`,`availability`);

--
-- Indexes for table `parts_category`
--
ALTER TABLE `parts_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parts_used`
--
ALTER TABLE `parts_used`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parts_used_part_id_work_id_index` (`part_id`,`work_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_settings_name_unique` (`name`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_notification`
--
ALTER TABLE `push_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `push_notification_user_id_index` (`user_id`),
  ADD KEY `push_notification_user_type_index` (`user_type`);

--
-- Indexes for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `push_subscriptions_endpoint_unique` (`endpoint`),
  ADD KEY `push_subscriptions_subscribable_type_subscribable_id_index` (`subscribable_type`,`subscribable_id`);

--
-- Indexes for table `reasons`
--
ALTER TABLE `reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_booking_id_driver_id_index` (`user_id`,`booking_id`,`driver_id`);

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
-- Indexes for table `service_items`
--
ALTER TABLE `service_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_reminder`
--
ALTER TABLE `service_reminder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_reminder_vehicle_id_service_id_index` (`vehicle_id`,`service_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `twilio_settings`
--
ALTER TABLE `twilio_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `twilio_settings_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_user_type_index` (`user_type`);

--
-- Indexes for table `users_meta`
--
ALTER TABLE `users_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_meta_user_id_index` (`user_id`),
  ADD KEY `users_meta_key_index` (`key`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicles_group_id_type_id_user_id_in_service_index` (`group_id`,`type_id`,`user_id`,`in_service`),
  ADD KEY `vehicles_lic_exp_date_reg_exp_date_index` (`lic_exp_date`,`reg_exp_date`),
  ADD KEY `vehicles_license_plate_index` (`license_plate`);

--
-- Indexes for table `vehicles_meta`
--
ALTER TABLE `vehicles_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicles_meta_vehicle_id_index` (`vehicle_id`),
  ADD KEY `vehicles_meta_key_index` (`key`);

--
-- Indexes for table `vehicle_colors`
--
ALTER TABLE `vehicle_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_group`
--
ALTER TABLE `vehicle_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_make`
--
ALTER TABLE `vehicle_make`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_model`
--
ALTER TABLE `vehicle_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_review`
--
ALTER TABLE `vehicle_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_review_vehicle_id_user_id_index` (`vehicle_id`,`user_id`);

--
-- Indexes for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendors_type_index` (`type`);

--
-- Indexes for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_orders_vehicle_id_vendor_id_index` (`vehicle_id`,`vendor_id`),
  ADD KEY `work_orders_status_index` (`status`);

--
-- Indexes for table `work_order_logs`
--
ALTER TABLE `work_order_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_order_logs_vehicle_id_vendor_id_index` (`vehicle_id`,`vendor_id`),
  ADD KEY `work_order_logs_status_index` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_settings`
--
ALTER TABLE `api_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings_meta`
--
ALTER TABLE `bookings_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `booking_income`
--
ALTER TABLE `booking_income`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking_payments`
--
ALTER TABLE `booking_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_quotation`
--
ALTER TABLE `booking_quotation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_services`
--
ALTER TABLE `company_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `driver_logs`
--
ALTER TABLE `driver_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `driver_vehicle`
--
ALTER TABLE `driver_vehicle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_content`
--
ALTER TABLE `email_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expense_cat`
--
ALTER TABLE `expense_cat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `fare_settings`
--
ALTER TABLE `fare_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `frontend`
--
ALTER TABLE `frontend`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `fuel`
--
ALTER TABLE `fuel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `income`
--
ALTER TABLE `income`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `income_cat`
--
ALTER TABLE `income_cat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mechanics`
--
ALTER TABLE `mechanics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parts_category`
--
ALTER TABLE `parts_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `parts_used`
--
ALTER TABLE `parts_used`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `push_notification`
--
ALTER TABLE `push_notification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reasons`
--
ALTER TABLE `reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_items`
--
ALTER TABLE `service_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_reminder`
--
ALTER TABLE `service_reminder`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `twilio_settings`
--
ALTER TABLE `twilio_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users_meta`
--
ALTER TABLE `users_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicles_meta`
--
ALTER TABLE `vehicles_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vehicle_colors`
--
ALTER TABLE `vehicle_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicle_group`
--
ALTER TABLE `vehicle_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicle_make`
--
ALTER TABLE `vehicle_make`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicle_model`
--
ALTER TABLE `vehicle_model`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicle_review`
--
ALTER TABLE `vehicle_review`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_types`
--
ALTER TABLE `vehicle_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `work_orders`
--
ALTER TABLE `work_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `work_order_logs`
--
ALTER TABLE `work_order_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
