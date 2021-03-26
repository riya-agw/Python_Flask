-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 26, 2021 at 07:17 AM
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
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `c_details`
--
-- Error reading structure for table restaurant.c_details: #1932 - Table 'restaurant.c_details' doesn't exist in engine
-- Error reading data for table restaurant.c_details: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `restaurant`.`c_details`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `c_info`
--

CREATE TABLE `c_info` (
  `SN` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Mobileno` text NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c_info`
--

INSERT INTO `c_info` (`SN`, `Name`, `Mobileno`, `Email`, `Message`) VALUES
(1, 'first', '8890797968', 'first@gmail.com', 'trial'),
(2, 'Riya Agarwal', '9462944501', 'riya30agarwal@gmail.com', 'Need to know if you have stay facility.'),
(7, 'Kanika Jain', '9876543210', 'kanika22@gmail.com', 'Need to know about restaurant closing time.'),
(8, 'Amit Agarwal', '9674823401', 'amitjain@gmail.com', 'What is approx for two peoples.'),
(9, 'Amit Agarwal', '9674823401', 'amitjain@gmail.com', 'What is approx for two peoples.'),
(10, 'Amit Agarwal', '9674823401', 'amitjain@gmail.com', 'What is approx for two peoples.'),
(11, 'Amit Agarwal', '9674823401', 'amitjain@gmail.com', 'What is approx for two peoples.'),
(12, 'Amit Agarwal', '9674823401', 'amitjain@gmail.com', 'What is approx for two peoples.');

-- --------------------------------------------------------

--
-- Table structure for table `c_new`
--

CREATE TABLE `c_new` (
  `SN` int(5) NOT NULL,
  `Name` text NOT NULL,
  `Mobileno` varchar(12) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `setpwd` varchar(15) NOT NULL,
  `confirmpwd` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `c_new`
--

INSERT INTO `c_new` (`SN`, `Name`, `Mobileno`, `Email`, `setpwd`, `confirmpwd`) VALUES
(1, 'Trial', '8890797968', 'trial@gmail.com', 'trial', 'trial'),
(10, 'Riya Agarwal', '6543217890', 'riya30agarwal@gmail.', 'riya000', 'riya000'),
(11, 'jhh', '', '', '', ''),
(12, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `menu_rates`
--

CREATE TABLE `menu_rates` (
  `SN` int(15) NOT NULL,
  `Dish` varchar(40) NOT NULL,
  `Price` float NOT NULL,
  `Ingredients` text NOT NULL,
  `Images` varchar(500) NOT NULL,
  `Category` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_rates`
--

INSERT INTO `menu_rates` (`SN`, `Dish`, `Price`, `Ingredients`, `Images`, `Category`) VALUES
(1, 'Veg. Pizza', 170, 'Capsicum,Onion,Tomato', 'vegpizza.jpg', 'Italian'),
(2, 'Veg. Margherita Pizza', 180, 'Cheese,Capsicum,onion,Mayonese', 'margheta.jpg', 'Italian'),
(3, 'Veg. Salad Sandwich', 70, 'Onion,Cucumber,Tomato,Cabbage', 'salasdsandwich.jpg', 'Sandwiches'),
(4, 'Veg. Masala Sandwich', 110, 'Potato,Chilli Flakes,Onion,Capsicum', 'Masala_Sandwich.jpg', 'Sandwiches'),
(5, 'Veg. Paneer Sandwich', 150, 'Paneer,Potato,Mayonese,Chesse,Onion', 'paneer_sandwich.jpg', 'Sandwiches'),
(6, 'Veg. Cheese Garlic Sandwich', 180, 'Cheese,Green Chutney,Garlic Chutney,Onion', 'cheese_garlic.jpg', 'Sandwiches'),
(7, 'Veg. Grilled Sandwich', 100, 'Potato,Tomato,Onion,Cabbage', 'griled_sandwich.jpg', 'Sandwiches'),
(8, 'Veg. Paneer Pizza', 200, 'Paneer,Onion,Capsicum,Chilli Sauce', 'paneer_pizza.jpg', 'Italian');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `c_info`
--
ALTER TABLE `c_info`
  ADD PRIMARY KEY (`SN`);

--
-- Indexes for table `c_new`
--
ALTER TABLE `c_new`
  ADD PRIMARY KEY (`SN`);

--
-- Indexes for table `menu_rates`
--
ALTER TABLE `menu_rates`
  ADD PRIMARY KEY (`SN`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `c_info`
--
ALTER TABLE `c_info`
  MODIFY `SN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `c_new`
--
ALTER TABLE `c_new`
  MODIFY `SN` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `menu_rates`
--
ALTER TABLE `menu_rates`
  MODIFY `SN` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
