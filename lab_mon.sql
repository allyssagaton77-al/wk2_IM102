-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2026 at 04:32 AM
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
-- Database: `lab_mon`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Appliances'),
(2, 'Books'),
(3, 'Health & Beauty'),
(4, 'Sports Equipment'),
(5, 'Toys');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `category_id`, `supplier_id`, `created_at`) VALUES
(1, 'Refrigerator', 'Two-door inverter refrigerator', 28000.00, 5, 1, 1, '2026-06-15 02:27:29'),
(2, 'Microwave Oven', '20L digital microwave oven', 4500.00, 12, 1, 1, '2026-06-15 02:27:29'),
(3, 'Electric Fan', 'Stand fan with remote control', 1800.00, 20, 1, 1, '2026-06-15 02:27:29'),
(4, 'Science Book', 'Grade 10 Science textbook', 650.00, 40, 2, 2, '2026-06-15 02:27:29'),
(5, 'Notebook Planner', '2026 daily planner', 350.00, 60, 2, 2, '2026-06-15 02:27:29'),
(6, 'Children Storybook', 'Illustrated bedtime stories', 280.00, 35, 2, 2, '2026-06-15 02:27:29'),
(7, 'Shampoo', 'Herbal anti-dandruff shampoo', 180.00, 75, 3, 3, '2026-06-15 02:27:29'),
(8, 'Vitamin C', '1000mg immune booster tablets', 500.00, 50, 3, 3, '2026-06-15 02:27:29'),
(9, 'Face Cream', 'Moisturizing day cream SPF15', 320.00, 45, 3, 3, '2026-06-15 02:27:29'),
(10, 'Basketball', 'Official size basketball', 900.00, 25, 4, 3, '2026-06-15 02:27:29'),
(11, 'Yoga Mat', 'Non-slip exercise mat', 750.00, 30, 4, 3, '2026-06-15 02:27:29'),
(12, 'Toy Car', 'Remote control racing car', 1200.00, 15, 5, 3, '2026-06-15 02:27:29'),
(13, 'Building Blocks', '100-piece colorful blocks set', 850.00, 18, 5, 3, '2026-06-15 02:27:29');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `contact_person`, `phone`) VALUES
(1, 'HomeTech Industries', 'Carlos Mendoza', '0917-222-3344'),
(2, 'Bright Pages Publishing', 'Liza Romero', '0920-555-6677'),
(3, 'ActiveLife Distributors', 'Darren Lee', '0933-888-9900');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
