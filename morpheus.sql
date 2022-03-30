-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 30, 2022 at 06:17 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `first_name`, `last_name`, `email`, `password`, `status`, `date_added`) VALUES
(1, 'Admin', 'Admin', 'admin@admin.com', 'admin123', 'Y', '2017-03-08 11:19:58');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category_img` varchar(255) NOT NULL,
  `clean_url` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `description`, `category_img`, `clean_url`, `meta_title`, `meta_description`, `status`, `date_added`) VALUES
(30, 'Real Estate', '<p><br></p>', 'Real_Estate.jpg', 'real-estate', 'real estate', '', 'Y', '2022-03-23 06:24:04'),
(31, 'Business', '<p><br></p>', 'Business.jpg', 'business', 'business', '', 'Y', '2022-03-23 06:24:34'),
(32, 'Sports', '<p><br></p>', 'Sports.jpg', 'sports', 'sports', '', 'Y', '2022-03-23 06:24:54');

-- --------------------------------------------------------

--
-- Table structure for table `credits`
--

DROP TABLE IF EXISTS `credits`;
CREATE TABLE IF NOT EXISTS `credits` (
  `credits_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(50) NOT NULL,
  `credits` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`credits_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credits`
--

INSERT INTO `credits` (`credits_id`, `package_name`, `credits`, `amount`, `description`, `status`, `date_added`) VALUES
(1, 'Testing', 50, 50, '<p>Testing</p>', 'Y', '2022-03-29 08:59:50'),
(2, 'demo1', 100, 120, '<p><br></p>', 'Y', '2022-03-29 09:10:35'),
(4, 'General', 120, 500, '<p>General Test</p>', 'Y', '2022-03-29 10:15:50'),
(5, 'Pack', 212, 100, '<p>pack</p>', 'N', '2022-03-29 10:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `total_credits` int(11) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `email_id`, `password`, `phone_no`, `address1`, `address2`, `city`, `state`, `country`, `zipcode`, `total_credits`, `status`, `date_added`) VALUES
(4, 'jack2', 'dean', 'admin1@admin.com', 'Jack@333', '7887877878', '45', '45', 'adsa', 'asda', 'asda', 364002, 222, 'Y', '2022-03-28 11:46:23'),
(2, 'www123', 'sss', 'qwqw@gmail.com', 'Rds@4444', '132-123-1234', 'awsw', 'wsw', 'sws', 'sssw', 'ss', 132456, 2222, 'Y', '2022-03-28 07:04:35'),
(3, 'Darshit', 'Rajyaguru', 'darshit@gmail.com', 'Darshit@1', '8460388441', '12', 'Akshar Park', 'Bhavnagar', 'Gujarat', 'India', 364002, 200, 'N', '2022-03-28 08:36:26'),
(6, '21212', '222', 'admin@admin.com', 'admin123', '4554545454', '12', '213', 'dfsd', 'sdfs', 'sdfs', 45455545, 2222, 'Y', '2022-03-28 12:03:31');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `storyboard_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(28) NOT NULL,
  `price` varchar(15) NOT NULL,
  `credits` int(11) NOT NULL,
  `description` text NOT NULL,
  `product_img` varchar(255) NOT NULL,
  `clean_url` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT 'Product ID',
  `category_id` int(11) NOT NULL COMMENT 'Category ID',
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_extra_fields`
--

DROP TABLE IF EXISTS `product_extra_fields`;
CREATE TABLE IF NOT EXISTS `product_extra_fields` (
  `product_extra_fields_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT 'Product ID',
  `extra_field_name` varchar(56) NOT NULL,
  `extra_field_value` varchar(128) NOT NULL,
  PRIMARY KEY (`product_extra_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `webpage`
--

DROP TABLE IF EXISTS `webpage`;
CREATE TABLE IF NOT EXISTS `webpage` (
  `webpage_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `meta_title` varchar(255) NOT NULL,
  `clean_url` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`webpage_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webpage`
--

INSERT INTO `webpage` (`webpage_id`, `page_title`, `description`, `status`, `meta_title`, `clean_url`, `meta_description`, `date_added`) VALUES
(1, 'About Us', '<p>About us content</p>', 'Y', 'about us', 'about-us', 'About us content', '2022-03-25 09:50:00'),
(2, 'privecy Policy', '<p>Privacy Policy content</p>', 'Y', 'privecy policy', 'privecy-policy', 'policy', '2022-03-25 09:52:48'),
(3, 'Terms and Condition', '<p>t', 'Y', 'terms and condition', 'terms-and-condition', 't&c', '2022-03-25 09:53:20'),
(4, 'Help', '<p>Help info</p>', 'Y', 'help', 'help', 'Help info', '2022-03-25 09:56:41'),
(5, 'test', '<p><br></p>', 'Y', 'test', 'test', '', '2022-03-28 05:52:55');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
