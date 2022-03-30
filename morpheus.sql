-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 10, 2022 at 05:21 AM
-- Server version: 5.7.26
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `morpheus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` enum('Y','N') DEFAULT 'Y',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `first_name`, `last_name`, `email`, `password`, `status`, `date_added`) VALUES
(1, 'Admin', 'Admin', 'admin@admin.com', 'admin', 'Y', '2017-03-08 11:19:58'),
(8, 'Kenneth1', 'Bowman1', 'ml12@carlifemarketing.com', 'teamboca9', 'Y', '2022-03-03 11:48:08'),
(7, 'Kenneth', 'Bowman', 'ml@carlifemarketing.com', 'teamboca9', 'Y', '2022-03-03 11:47:38'),
(9, 'Kenneth43', 'Bowman4353', 'ml12342@carlifemarketing.com', 'teamboca9', 'Y', '2022-03-03 11:50:49'),
(10, 'Kenneth345', 'Bowman34636', 'ml@carlifemarketing.com', 'teamboca9', 'Y', '2022-03-03 11:52:01'),
(11, 'Test23', 'Test23', 'ml1234@carlifemarketing.com', 'teamboca9', 'Y', '2022-03-03 12:02:41');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
