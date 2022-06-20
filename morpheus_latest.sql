-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 20, 2022 at 04:24 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `first_name`, `last_name`, `email`, `password`, `status`, `date_added`) VALUES
(1, 'Admin', 'Admin', 'admin@admin.com', 'admin123', 'Y', '2017-03-08 11:19:58'),
(2, 'Test', 'Test', 'admin12@admin.com', '12345678', 'Y', '2022-04-05 10:19:47');

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
  `display_order` int(11) NOT NULL DEFAULT '0',
  `clean_url` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `description`, `category_img`, `display_order`, `clean_url`, `meta_title`, `meta_description`, `status`, `date_added`) VALUES
(33, 'Real Estate', '<p>Real Estate related videos.</p>', 'real-estate.png', 3, 'real-estate', 'real estate', 'Real Estate', 'Y', '2022-04-15 09:05:55'),
(34, 'Sports', '<p>Sports related videos.</p>', 'sports.png', 9, 'sports', 'sports', 'Sports', 'Y', '2022-04-15 09:06:29'),
(35, 'Animation', '<p>Animation</p>', 'animation.png', 2, 'animation', 'animation', 'Animation', 'Y', '2022-04-15 09:07:20'),
(36, 'Commercial', '<p>Commercial related videos.</p>', 'commercial.png', 7, 'commercial', 'commercial', 'commercial', 'Y', '2022-04-15 09:08:12'),
(37, 'Business', '<p>Business related videos.</p>', 'business.png', 6, 'business', 'business', 'Business', 'Y', '2022-04-15 09:09:20'),
(38, 'Motion Graphics', '<p>Motion Graphics related videos.</p>', 'motion-graphics.png', 3, 'motion-graphics', 'motion graphics', 'Motion Graphics', 'Y', '2022-04-15 09:10:10'),
(39, 'testing', '<p>testing</p>', 'uber.jpg', 0, 'testing', 'testing', '', 'Y', '2022-06-15 07:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `company_details`
--

DROP TABLE IF EXISTS `company_details`;
CREATE TABLE IF NOT EXISTS `company_details` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) NOT NULL,
  `company_details` text NOT NULL,
  `company_email` varchar(50) NOT NULL,
  `company_logo` text NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `company_phone_no` varchar(20) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_details`
--

INSERT INTO `company_details` (`company_id`, `company_name`, `company_details`, `company_email`, `company_logo`, `company_address`, `company_phone_no`) VALUES
(1, 'Morpheus Marketplace', '', 'user@morpheus.com', 'logo.png', 'Test Address', '1567234590');

-- --------------------------------------------------------

--
-- Table structure for table `credits`
--

DROP TABLE IF EXISTS `credits`;
CREATE TABLE IF NOT EXISTS `credits` (
  `credits_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(50) NOT NULL,
  `credits` int(11) NOT NULL,
  `amount` varchar(15) NOT NULL,
  `description` text NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`credits_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credits`
--

INSERT INTO `credits` (`credits_id`, `package_name`, `credits`, `amount`, `description`, `status`, `date_added`) VALUES
(7, 'Basic Package', 50, '520.00', '<p>Basic Package</p>', 'Y', '2022-03-31 08:27:42'),
(8, 'Standard Package', 100, '950.00', '<p>Standard Package</p>', 'Y', '2022-03-31 08:28:09'),
(9, 'Premium Package', 150, '1250.00', '<p>Premium Package</p>', 'Y', '2022-03-31 08:28:47'),
(10, 'VIP Package', 200, '1500.00', '<p>VIP Package</p>', 'Y', '2022-05-12 10:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `credits_cart`
--

DROP TABLE IF EXISTS `credits_cart`;
CREATE TABLE IF NOT EXISTS `credits_cart` (
  `credits_cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `total_credits` int(11) NOT NULL DEFAULT '0',
  `total_amount` varchar(50) NOT NULL DEFAULT '',
  `credits_details` longtext NOT NULL,
  PRIMARY KEY (`credits_cart_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credits_cart`
--

INSERT INTO `credits_cart` (`credits_cart_id`, `customer_id`, `total_credits`, `total_amount`, `credits_details`) VALUES
(11, 22, 350, '2750', 'a:2:{s:14:\"credits_item_2\";a:4:{s:12:\"credits_item\";s:14:\"credits_item_2\";s:10:\"credits_id\";s:2:\"10\";s:7:\"credits\";i:200;s:6:\"amount\";s:7:\"1500.00\";}s:14:\"credits_item_3\";a:4:{s:12:\"credits_item\";s:14:\"credits_item_3\";s:10:\"credits_id\";s:1:\"9\";s:7:\"credits\";s:3:\"150\";s:6:\"amount\";s:7:\"1250.00\";}}'),
(12, 20, 250, '2020', 'a:2:{s:14:\"credits_item_1\";a:4:{s:12:\"credits_item\";s:14:\"credits_item_1\";s:10:\"credits_id\";s:1:\"7\";s:7:\"credits\";i:50;s:6:\"amount\";s:6:\"520.00\";}s:14:\"credits_item_2\";a:4:{s:12:\"credits_item\";s:14:\"credits_item_2\";s:10:\"credits_id\";s:2:\"10\";s:7:\"credits\";i:200;s:6:\"amount\";s:7:\"1500.00\";}}'),
(13, 25, 150, '1470', 'a:2:{s:0:\"\";a:4:{s:12:\"credits_item\";s:15:\"credits_item__1\";s:10:\"credits_id\";s:1:\"8\";s:7:\"credits\";s:3:\"100\";s:6:\"amount\";s:6:\"950.00\";}s:14:\"credits_item_1\";a:4:{s:12:\"credits_item\";s:14:\"credits_item_1\";s:10:\"credits_id\";s:1:\"7\";s:7:\"credits\";s:2:\"50\";s:6:\"amount\";s:6:\"520.00\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL DEFAULT '',
  `last_name` varchar(50) NOT NULL DEFAULT '',
  `email_id` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `phone_no` varchar(20) NOT NULL DEFAULT '',
  `address1` varchar(255) NOT NULL DEFAULT '',
  `address2` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(28) NOT NULL DEFAULT '',
  `state` varchar(28) NOT NULL DEFAULT '',
  `country` varchar(28) DEFAULT '',
  `zipcode` int(11) NOT NULL DEFAULT '0',
  `total_credits` int(11) NOT NULL DEFAULT '0',
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `email_id`, `password`, `phone_no`, `address1`, `address2`, `city`, `state`, `country`, `zipcode`, `total_credits`, `status`, `date_added`) VALUES
(3, 'Darshit', 'Rajyaguru', 'darshit@gmail.com', 'Darshit@1', '8460388441', '12', '232', 'dasgfasfga', 'Gujarat', 'India', 364002, 812, 'Y', '2022-03-28 08:36:26'),
(7, 'Devid', 'white', 'dwhite@gmail.com', 'Devid@123', '7878878787', '45', 'add2', 'east-city', 'state', 'canada', 4545454, 715, 'Y', '2022-03-31 06:16:46'),
(9, 'Miriam', 'Tapia', 'MiriamBTapia@dayrep.com', 'Miri1234', '510-472-7322', '1944 Thompson Drive', 'Thompson Drive', 'Oakland', 'California', 'United States', 94607, 315, 'Y', '2022-04-05 12:13:26'),
(20, 'Kenneth', 'Bowman', 'admin1@admin.com', 'admin123', '', '', '', '', '', '', 0, 0, 'Y', '2022-05-11 07:22:30'),
(21, 'Kenneth', 'Bowman', 'admin23@admin.com', 'admin123', '', '', '', '', '', '', 0, 0, 'Y', '2022-05-11 07:22:54'),
(22, 'Kenneth', 'Bowman', 'admin@admin.com', 'admin123', '123-123-1234', '1944 Thompson Drive', 'Thompson Drive', 'Oakland', 'California', 'United States', 0, 200, 'Y', '2022-05-11 07:24:56'),
(23, 'Kenneth', 'Bowman', 'admin123@admin.com', 'admin123', '', '', '', '', '', '', 0, 0, 'Y', '2022-05-11 08:40:32'),
(24, 'Kenneth', 'Bowman', 'admin235252@admin.com', 'admin123', '', '', '', '', '', '', 0, 0, 'Y', '2022-05-11 09:54:48'),
(25, 'Morpheus', 'Morpheus', 'user@morpheus.com', '12345678', '3643643636', '3466', '346346', 'wertwtw', 'wetwt', 'wetwet', 345346, 515, 'Y', '2022-05-24 09:39:53'),
(26, 'Devendra', 'Agrawal', 'devendra@iclerisy.us', '12345678', '', '', '', '', '', '', 0, 100, 'Y', '2022-05-30 05:42:51'),
(30, 'Test', 'Test', 'user@morpheus12.com', '12345678', '', '', '', '', '', '', 0, 0, 'N', '2022-06-07 10:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `customers_cart`
--

DROP TABLE IF EXISTS `customers_cart`;
CREATE TABLE IF NOT EXISTS `customers_cart` (
  `customers_cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `total_credits` int(11) NOT NULL DEFAULT '0',
  `total_amount` varchar(50) NOT NULL DEFAULT '',
  `video_details` longtext NOT NULL,
  PRIMARY KEY (`customers_cart_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_credits_order`
--

DROP TABLE IF EXISTS `customer_credits_order`;
CREATE TABLE IF NOT EXISTS `customer_credits_order` (
  `cc_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT 'Customer ID',
  `final_credits` int(11) NOT NULL DEFAULT '0',
  `total_amount` varchar(50) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `order_date` datetime NOT NULL,
  PRIMARY KEY (`cc_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_credits_order_details`
--

DROP TABLE IF EXISTS `customer_credits_order_details`;
CREATE TABLE IF NOT EXISTS `customer_credits_order_details` (
  `cc_order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `cc_order_id` int(11) NOT NULL COMMENT 'Customer Credits Order ID',
  `credits_id` int(11) NOT NULL COMMENT 'Credits ID',
  `credits` int(11) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '0',
  `total_credits` int(11) NOT NULL DEFAULT '0',
  `amount` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`cc_order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `home_page`
--

DROP TABLE IF EXISTS `home_page`;
CREATE TABLE IF NOT EXISTS `home_page` (
  `home_page_id` int(11) NOT NULL AUTO_INCREMENT,
  `top_banner` varchar(255) NOT NULL,
  `personlized_video_generator` text NOT NULL,
  `about_info` text NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `links` longtext NOT NULL,
  PRIMARY KEY (`home_page_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `home_page`
--

INSERT INTO `home_page` (`home_page_id`, `top_banner`, `personlized_video_generator`, `about_info`, `copyright`, `links`) VALUES
(1, 'Testing123.mp4', '<p>&lt;section id=\"custom_video_generator\" class=\"custom_video_generator\"&gt;</p><p>&nbsp;&lt;div class=\"container\"&gt;</p><p>&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&lt;div class=\"section-title\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;h2&gt;Personalized Custom Video Generator&lt;/h2&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. &lt;/p&gt;</p><p>&nbsp;&nbsp;&lt;/div&gt;</p><p><br></p><p>&nbsp;&nbsp;&lt;div class=\"row\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;div class=\"col-lg-3 col-md-3 col-sm-6 icon-box\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;img src=\"assets/img/select_video.png\" title=\"Select your video template style\"&gt;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;h6 class=\"title\"&gt;1.&nbsp;Select your video template style&lt;/h6&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;/div&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;div class=\"col-lg-3 col-md-3 col-sm-6 icon-box\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;img src=\"assets/img/custom_detail.png\" title=\"Add name, contact, email, &amp;amp; other details in videos\"&gt;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;h6 class=\"title\"&gt;2.&nbsp;Add name, contact, email, &amp;amp; other details in videos&lt;/h6&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;/div&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;div class=\"col-lg-3 col-md-3 col-sm-6 icon-box\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;img src=\"assets/img/video_format.png\" title=\"Select your video format\"&gt;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;h6 class=\"title\"&gt;3.&nbsp;Select your video format, resolution &amp;amp; quality&lt;/h6&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;/div&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;div class=\"col-lg-3 col-md-3 col-sm-6 icon-box\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;img src=\"assets/img/checkout_now.png\" title=\"Checkout Now\"&gt;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;h6 class=\"title\"&gt;4.&nbsp;Checkout Now!&lt;/h6&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;/div&gt;</p><p>&nbsp;&nbsp;&lt;/div&gt;</p><p><br></p><p>&nbsp;&lt;/div&gt;</p><p>&lt;/section&gt;</p>', '<p>&lt;section id=\"custom_video_generator\" class=\"custom_video_generator\"&gt;</p><p>&nbsp;&lt;div class=\"container\"&gt;</p><p>&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&lt;div class=\"section-title\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;h2&gt;Personalized Custom Video Generator&lt;/h2&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. &lt;/p&gt;</p><p>&nbsp;&nbsp;&lt;/div&gt;</p><p><br></p><p>&nbsp;&nbsp;&lt;div class=\"row\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;div class=\"col-lg-3 col-md-3 col-sm-6 icon-box\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;img src=\"assets/img/select_video.png\" title=\"Select your video template style\"&gt;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;h6 class=\"title\"&gt;1.&nbsp;Select your video template style&lt;/h6&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;/div&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;div class=\"col-lg-3 col-md-3 col-sm-6 icon-box\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;img src=\"assets/img/custom_detail.png\" title=\"Add name, contact, email, &amp;amp; other details in videos\"&gt;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;h6 class=\"title\"&gt;2.&nbsp;Add name, contact, email, &amp;amp; other details in videos&lt;/h6&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;/div&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;div class=\"col-lg-3 col-md-3 col-sm-6 icon-box\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;img src=\"assets/img/video_format.png\" title=\"Select your video format\"&gt;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;h6 class=\"title\"&gt;3.&nbsp;Select your video format, resolution &amp;amp; quality&lt;/h6&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;/div&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;div class=\"col-lg-3 col-md-3 col-sm-6 icon-box\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;img src=\"assets/img/checkout_now.png\" title=\"Checkout Now\"&gt;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;h6 class=\"title\"&gt;4.&nbsp;Checkout Now!&lt;/h6&gt;</p><p>&nbsp;&nbsp;&nbsp;&lt;/div&gt;</p><p>&nbsp;&nbsp;&lt;/div&gt;</p><p><br></p><p>&nbsp;&lt;/div&gt;</p><p>&lt;/section&gt;</p>', '2022 © Morpheus', 'a:6:{i:0;a:4:{s:9:\"link_name\";s:6:\"abc123\";s:8:\"link_url\";s:10:\"abc213.com\";s:11:\"link_status\";s:2:\"on\";s:12:\"open_new_tab\";N;}i:1;a:4:{s:9:\"link_name\";s:6:\"xyz234\";s:8:\"link_url\";s:9:\"xyz234.in\";s:11:\"link_status\";s:2:\"on\";s:12:\"open_new_tab\";s:2:\"on\";}i:2;a:4:{s:9:\"link_name\";s:3:\"ttt\";s:8:\"link_url\";s:6:\"rtyrty\";s:11:\"link_status\";s:2:\"on\";s:12:\"open_new_tab\";s:2:\"on\";}i:3;a:4:{s:9:\"link_name\";s:3:\"dfg\";s:8:\"link_url\";s:9:\"dfgdfgdfg\";s:11:\"link_status\";N;s:12:\"open_new_tab\";s:2:\"on\";}i:4;a:4:{s:9:\"link_name\";s:3:\"www\";s:8:\"link_url\";s:9:\"ww123.com\";s:11:\"link_status\";s:2:\"on\";s:12:\"open_new_tab\";N;}i:5;a:4:{s:9:\"link_name\";s:4:\"test\";s:8:\"link_url\";s:7:\"test222\";s:11:\"link_status\";N;s:12:\"open_new_tab\";s:2:\"on\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `marketing`
--

DROP TABLE IF EXISTS `marketing`;
CREATE TABLE IF NOT EXISTS `marketing` (
  `market_id` int(11) NOT NULL AUTO_INCREMENT,
  `default_page_title` varchar(255) NOT NULL,
  `default_meta_description` varchar(255) NOT NULL,
  `seo_clean_url` varchar(255) NOT NULL,
  `google_analytics` longtext NOT NULL,
  `facebook_pixel_code` longtext NOT NULL,
  `other` longtext NOT NULL,
  PRIMARY KEY (`market_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marketing`
--

INSERT INTO `marketing` (`market_id`, `default_page_title`, `default_meta_description`, `seo_clean_url`, `google_analytics`, `facebook_pixel_code`, `other`) VALUES
(1, 'test1', 'description123', 'test_11', '<p>analytics 132</p>', '<p>Facebook11</p>', '<p>other 123</p>');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE IF NOT EXISTS `newsletter` (
  `newsletter_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`newsletter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`newsletter_id`, `email`, `date_added`) VALUES
(1, 'devendra@iclerisy.us', '2022-05-02 09:36:20'),
(2, 'devendra12@iclerisy.us', '2022-05-02 09:37:01'),
(3, 'dhvanit.upadhyay@gmail.com', '2022-05-02 09:37:33'),
(4, 'ankit.iclerisy@gmail.com', '2022-05-02 09:37:47'),
(5, 'jeff.small@flynncompanies.com', '2022-05-02 09:44:43'),
(6, 'devendra123@iclerisy.us', '2022-05-02 09:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `customer_info` longtext NOT NULL,
  `total_credits` int(11) NOT NULL DEFAULT '0',
  `video_details` longtext NOT NULL,
  `status` enum('Completed','Denied','Delivering','Cancelled','Pending') NOT NULL DEFAULT 'Pending',
  `order_date` date NOT NULL,
  `total` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `customer_id`, `customer_info`, `total_credits`, `video_details`, `status`, `order_date`, `total`) VALUES
(1, 3, '', 0, '', 'Completed', '2022-04-04', '$250.00'),
(5, 9, '', 0, '', 'Pending', '2022-04-04', '$500.00'),
(6, 7, '', 0, '', 'Cancelled', '2022-04-01', '$380.00'),
(7, 25, 'a:11:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:17:\"user@morpheus.com\";s:8:\"phone_no\";s:10:\"7176495515\";s:8:\"address1\";s:20:\"526 w. Market Street\";s:8:\"address2\";s:0:\"\";s:4:\"city\";s:12:\"Williamstown\";s:5:\"state\";s:12:\"Pennsylvania\";s:7:\"country\";s:13:\"United States\";s:7:\"zipcode\";s:5:\"19012\";s:5:\"notes\";s:10:\"test order\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:76:\"https://v.idomoo.com/4907/0000/bq35283k30j2ciahbk1xn2yb2n22ws66937e83o3e.mp4\";}}', 'Completed', '2022-06-06', ''),
(9, 25, 'a:11:{s:10:\"first_name\";s:8:\"Morpheus\";s:9:\"last_name\";s:8:\"Morpheus\";s:8:\"email_id\";s:17:\"user@morpheus.com\";s:8:\"phone_no\";s:10:\"7176495515\";s:8:\"address1\";s:20:\"526 w. Market Street\";s:8:\"address2\";s:0:\"\";s:4:\"city\";s:12:\"Williamstown\";s:5:\"state\";s:12:\"Pennsylvania\";s:7:\"country\";s:13:\"United States\";s:7:\"zipcode\";s:5:\"19012\";s:5:\"notes\";s:10:\"test notes\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:81:\"https://v.idomoo.com/4907/0000/q03h1ie2lp3j241vwah722x2o2y293g2a3bao0fz1i3dro.mp4\";}}', 'Completed', '2022-06-06', ''),
(10, 25, 'a:11:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:17:\"user@morpheus.com\";s:8:\"phone_no\";s:10:\"7176495515\";s:8:\"address1\";s:20:\"526 w. Market Street\";s:8:\"address2\";s:0:\"\";s:4:\"city\";s:12:\"Williamstown\";s:5:\"state\";s:12:\"Pennsylvania\";s:7:\"country\";s:13:\"United States\";s:7:\"zipcode\";s:5:\"19012\";s:5:\"notes\";s:8:\"sxbxcgbx\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:81:\"https://v.idomoo.com/4907/0000/q03h1ie2lp3j241vwah722x2o2y293g2a3bao0fz1i3dro.mp4\";}}', 'Completed', '2022-06-06', ''),
(11, 25, 'a:11:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:17:\"user@morpheus.com\";s:8:\"phone_no\";s:10:\"7176495515\";s:8:\"address1\";s:20:\"526 w. Market Street\";s:8:\"address2\";s:0:\"\";s:4:\"city\";s:12:\"Williamstown\";s:5:\"state\";s:12:\"Pennsylvania\";s:7:\"country\";s:13:\"United States\";s:7:\"zipcode\";s:5:\"19012\";s:5:\"notes\";s:0:\"\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:75:\"https://v.idomoo.com/4907/0000/lvo6169j2w341v6rndp6clcs1s1727w32j3g11i2.mp4\";}}', 'Completed', '2022-06-06', ''),
(12, 25, 'a:11:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:17:\"user@morpheus.com\";s:8:\"phone_no\";s:10:\"7176495515\";s:8:\"address1\";s:20:\"526 w. Market Street\";s:8:\"address2\";s:0:\"\";s:4:\"city\";s:12:\"Williamstown\";s:5:\"state\";s:12:\"Pennsylvania\";s:7:\"country\";s:13:\"United States\";s:7:\"zipcode\";s:5:\"19012\";s:5:\"notes\";s:0:\"\";}', 95, 'a:2:{i:123328;a:12:{s:10:\"product_id\";s:1:\"5\";s:13:\"storyboard_id\";s:6:\"123328\";s:12:\"product_name\";s:24:\"CB Dream Individual 12-3\";s:7:\"credits\";i:45;s:11:\"product_sku\";s:9:\"SKU123328\";s:13:\"product_image\";s:10:\"123328.jpg\";s:14:\"EMAIL_or_PHONE\";s:20:\"devendra@iclerisy.us\";s:7:\"DBA_URL\";s:8:\"test.com\";s:7:\"LICENSE\";s:9:\"licen1234\";s:6:\"CompID\";s:6:\"500254\";s:4:\"NAME\";s:8:\"devendra\";s:9:\"video_url\";s:77:\"https://v.idomoo.com/4907/0000/ne1w2m257g169k2p6201261ii2dub3g6bl73h20bof.mp4\";}i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:77:\"https://v.idomoo.com/4907/0000/qui3p62vp2h1qk1o4s1e1h1i3c3f2t13daxb2a2p1p.mp4\";}}', 'Completed', '2022-06-08', ''),
(13, 25, 'a:11:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:17:\"user@morpheus.com\";s:8:\"phone_no\";s:10:\"7176495515\";s:8:\"address1\";s:20:\"526 w. Market Street\";s:8:\"address2\";s:0:\"\";s:4:\"city\";s:12:\"Williamstown\";s:5:\"state\";s:12:\"Pennsylvania\";s:7:\"country\";s:13:\"United States\";s:7:\"zipcode\";s:5:\"19012\";s:5:\"notes\";s:10:\"test notes\";}', 95, 'a:2:{i:123328;a:12:{s:10:\"product_id\";s:1:\"5\";s:13:\"storyboard_id\";s:6:\"123328\";s:12:\"product_name\";s:24:\"CB Dream Individual 12-3\";s:7:\"credits\";i:45;s:11:\"product_sku\";s:9:\"SKU123328\";s:13:\"product_image\";s:10:\"123328.jpg\";s:14:\"EMAIL_or_PHONE\";s:24:\"ankit.iclerisy@gmail.com\";s:7:\"DBA_URL\";s:8:\"test.com\";s:7:\"LICENSE\";s:9:\"licen1234\";s:6:\"CompID\";s:6:\"500254\";s:4:\"NAME\";s:8:\"devendra\";s:9:\"video_url\";s:75:\"https://v.idomoo.com/4907/0000/xbe343d1j30im2m1zo1b198yj8t83dgb2hizz1i5.mp4\";}i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:73:\"https://v.idomoo.com/4907/0000/up1m1ea249m2r1z1v928dk1yen3a2k42fy17rg.mp4\";}}', 'Completed', '2022-06-08', ''),
(14, 25, 'a:11:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:17:\"user@morpheus.com\";s:8:\"phone_no\";s:10:\"7176495515\";s:8:\"address1\";s:20:\"526 w. Market Street\";s:8:\"address2\";s:0:\"\";s:4:\"city\";s:12:\"Williamstown\";s:5:\"state\";s:12:\"Pennsylvania\";s:7:\"country\";s:13:\"United States\";s:7:\"zipcode\";s:5:\"19012\";s:5:\"notes\";s:0:\"\";}', 95, 'a:2:{i:123328;a:12:{s:10:\"product_id\";s:1:\"5\";s:13:\"storyboard_id\";s:6:\"123328\";s:12:\"product_name\";s:24:\"CB Dream Individual 12-3\";s:7:\"credits\";i:45;s:11:\"product_sku\";s:9:\"SKU123328\";s:13:\"product_image\";s:10:\"123328.jpg\";s:14:\"EMAIL_or_PHONE\";s:24:\"ankit.iclerisy@gmail.com\";s:7:\"DBA_URL\";s:8:\"test.com\";s:7:\"LICENSE\";s:9:\"licen1234\";s:6:\"CompID\";s:6:\"500254\";s:4:\"NAME\";s:8:\"devendra\";s:9:\"video_url\";s:75:\"https://v.idomoo.com/4907/0000/xbe343d1j30im2m1zo1b198yj8t83dgb2hizz1i5.mp4\";}i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:73:\"https://v.idomoo.com/4907/0000/up1m1ea249m2r1z1v928dk1yen3a2k42fy17rg.mp4\";}}', 'Completed', '2022-06-08', ''),
(15, 22, 'a:12:{s:10:\"first_name\";s:3:\"rds\";s:9:\"last_name\";s:3:\"ssd\";s:8:\"email_id\";s:15:\"admin@admin.com\";s:8:\"phone_no\";s:0:\"\";s:8:\"address1\";s:3:\"rds\";s:8:\"address2\";s:5:\"rds33\";s:7:\"country\";s:2:\"US\";s:5:\"state\";s:0:\"\";s:14:\"checkout-state\";s:2:\"AK\";s:4:\"city\";s:3:\"ttt\";s:7:\"zipcode\";s:5:\"49210\";s:5:\"notes\";s:0:\"\";}', 35, 'a:1:{i:120859;a:12:{s:10:\"product_id\";s:1:\"3\";s:13:\"storyboard_id\";s:6:\"120859\";s:12:\"product_name\";s:36:\"CB Dream Individual Agent-Focus 26-4\";s:7:\"credits\";i:35;s:11:\"product_sku\";s:9:\"SKU120859\";s:13:\"product_image\";s:10:\"120859.jpg\";s:14:\"EMAIL_or_PHONE\";s:7:\"9898989\";s:7:\"DBA_URL\";s:3:\"asd\";s:7:\"LICENSE\";s:3:\"asd\";s:6:\"CompID\";s:6:\"901328\";s:4:\"NAME\";s:6:\"asdasd\";s:9:\"video_url\";s:81:\"https://v.idomoo.com/4907/0000/ir2pw1z2b1lryt171b211y28262ivi2818h6bv321z1t29.mp4\";}}', 'Completed', '2022-06-17', ''),
(16, 22, 'a:12:{s:10:\"first_name\";s:3:\"asd\";s:9:\"last_name\";s:3:\"das\";s:8:\"email_id\";s:15:\"admin@admin.com\";s:8:\"phone_no\";s:9:\"989989899\";s:8:\"address1\";s:5:\"asdas\";s:8:\"address2\";s:6:\"asdasd\";s:7:\"country\";s:2:\"US\";s:5:\"state\";s:0:\"\";s:14:\"checkout-state\";s:2:\"AL\";s:4:\"city\";s:2:\"tn\";s:7:\"zipcode\";s:6:\"320003\";s:5:\"notes\";s:0:\"\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:74:\"https://v.idomoo.com/4907/0000/ad732v1v01k81za3iwnat34w1b3k1g1n2f2e1iz.mp4\";}}', 'Completed', '2022-06-18', ''),
(17, 22, 'a:13:{s:8:\"img_name\";s:5:\"Array\";s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:15:\"admin@admin.com\";s:8:\"phone_no\";s:12:\"123-123-1234\";s:8:\"address1\";s:19:\"1944 Thompson Drive\";s:8:\"address2\";s:14:\"Thompson Drive\";s:7:\"country\";s:2:\"US\";s:5:\"state\";s:10:\"California\";s:14:\"checkout-state\";s:2:\"AL\";s:4:\"city\";s:7:\"Oakland\";s:7:\"zipcode\";s:1:\"0\";s:5:\"notes\";s:0:\"\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:83:\"https://v.idomoo.com/4907/0000/9hgg2q2zh8221tk1m963513k2o2o1t1r2b01m1a122651xss.mp4\";}}', 'Completed', '2022-06-18', ''),
(18, 22, 'a:13:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:15:\"admin@admin.com\";s:8:\"phone_no\";s:12:\"123-123-1234\";s:8:\"address1\";s:19:\"1944 Thompson Drive\";s:8:\"address2\";s:14:\"Thompson Drive\";s:7:\"country\";s:2:\"US\";s:5:\"state\";s:10:\"California\";s:14:\"checkout-state\";s:2:\"CA\";s:4:\"city\";s:7:\"Oakland\";s:7:\"zipcode\";s:1:\"0\";s:7:\"license\";s:6:\"132321\";s:5:\"notes\";s:0:\"\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:77:\"https://v.idomoo.com/4907/0000/5f24e1c2j10goechfo3e1ho23d1l36a3j2n762v20z.mp4\";}}', 'Completed', '2022-06-18', ''),
(19, 22, 'a:12:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:15:\"admin@admin.com\";s:8:\"phone_no\";s:12:\"123-123-1234\";s:8:\"address1\";s:19:\"1944 Thompson Drive\";s:8:\"address2\";s:14:\"Thompson Drive\";s:7:\"country\";s:2:\"US\";s:5:\"state\";s:10:\"California\";s:14:\"checkout-state\";s:2:\"AL\";s:4:\"city\";s:7:\"Oakland\";s:7:\"zipcode\";s:1:\"0\";s:5:\"notes\";s:0:\"\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:75:\"https://v.idomoo.com/4907/0000/d2311mhq2u6s6151o61f1uhgj3h6ptxch3bg1g29.mp4\";}}', 'Completed', '2022-06-18', ''),
(20, 22, 'a:12:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:15:\"admin@admin.com\";s:8:\"phone_no\";s:12:\"123-123-1234\";s:8:\"address1\";s:19:\"1944 Thompson Drive\";s:8:\"address2\";s:14:\"Thompson Drive\";s:7:\"country\";s:2:\"US\";s:5:\"state\";s:10:\"California\";s:14:\"checkout-state\";s:2:\"LA\";s:4:\"city\";s:7:\"Oakland\";s:7:\"zipcode\";s:1:\"0\";s:5:\"notes\";s:0:\"\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:78:\"https://v.idomoo.com/4907/0000/kgie3ek252x3e1d28152113j551wr1mhx93gw2s351z.mp4\";}}', 'Completed', '2022-06-18', ''),
(21, 22, 'a:12:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:15:\"admin@admin.com\";s:8:\"phone_no\";s:12:\"123-123-1234\";s:8:\"address1\";s:19:\"1944 Thompson Drive\";s:8:\"address2\";s:14:\"Thompson Drive\";s:7:\"country\";s:2:\"US\";s:5:\"state\";s:10:\"California\";s:14:\"checkout-state\";s:2:\"TX\";s:4:\"city\";s:7:\"Oakland\";s:7:\"zipcode\";s:1:\"0\";s:5:\"notes\";s:0:\"\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:78:\"https://v.idomoo.com/4907/0000/m81asd2tl02v1s72iiv2n13402r24826u2pv2rh7266.mp4\";}}', 'Completed', '2022-06-18', ''),
(22, 22, 'a:11:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:15:\"admin@admin.com\";s:8:\"phone_no\";s:12:\"123-123-1234\";s:8:\"address1\";s:19:\"1944 Thompson Drive\";s:8:\"address2\";s:14:\"Thompson Drive\";s:7:\"country\";s:2:\"US\";s:14:\"checkout-state\";s:2:\"GA\";s:4:\"city\";s:7:\"Oakland\";s:7:\"zipcode\";s:1:\"0\";s:5:\"notes\";s:0:\"\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:78:\"https://v.idomoo.com/4907/0000/m81asd2tl02v1s72iiv2n13402r24826u2pv2rh7266.mp4\";}}', 'Completed', '2022-06-18', ''),
(23, 22, 'a:11:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:15:\"admin@admin.com\";s:8:\"phone_no\";s:12:\"123-123-1234\";s:8:\"address1\";s:19:\"1944 Thompson Drive\";s:8:\"address2\";s:14:\"Thompson Drive\";s:7:\"country\";s:2:\"TN\";s:5:\"state\";s:2:\"uk\";s:4:\"city\";s:7:\"Oakland\";s:7:\"zipcode\";s:1:\"0\";s:5:\"notes\";s:0:\"\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:73:\"https://v.idomoo.com/4907/0000/lhj2p1jn2egyu1d3kvn25f267121411tb242b3.mp4\";}}', 'Completed', '2022-06-18', ''),
(24, 22, 'a:11:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:15:\"admin@admin.com\";s:8:\"phone_no\";s:12:\"123-123-1234\";s:8:\"address1\";s:19:\"1944 Thompson Drive\";s:8:\"address2\";s:14:\"Thompson Drive\";s:7:\"country\";s:2:\"US\";s:5:\"state\";s:2:\"IN\";s:4:\"city\";s:7:\"Oakland\";s:7:\"zipcode\";s:1:\"0\";s:5:\"notes\";s:0:\"\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:73:\"https://v.idomoo.com/4907/0000/lhj2p1jn2egyu1d3kvn25f267121411tb242b3.mp4\";}}', 'Completed', '2022-06-18', ''),
(25, 22, 'a:11:{s:10:\"first_name\";s:7:\"Kenneth\";s:9:\"last_name\";s:6:\"Bowman\";s:8:\"email_id\";s:15:\"admin@admin.com\";s:8:\"phone_no\";s:12:\"123-123-1234\";s:8:\"address1\";s:19:\"1944 Thompson Drive\";s:8:\"address2\";s:14:\"Thompson Drive\";s:7:\"country\";s:2:\"AE\";s:5:\"state\";s:5:\"dubai\";s:4:\"city\";s:7:\"Oakland\";s:7:\"zipcode\";s:1:\"0\";s:5:\"notes\";s:0:\"\";}', 50, 'a:1:{i:119918;a:8:{s:10:\"product_id\";s:1:\"6\";s:13:\"storyboard_id\";s:6:\"119918\";s:12:\"product_name\";s:23:\"Original CB Dream Setup\";s:7:\"credits\";i:50;s:11:\"product_sku\";s:9:\"SKU119918\";s:13:\"product_image\";s:10:\"119918.jpg\";s:6:\"CompID\";s:6:\"103001\";s:9:\"video_url\";s:73:\"https://v.idomoo.com/4907/0000/lhj2p1jn2egyu1d3kvn25f267121411tb242b3.mp4\";}}', 'Completed', '2022-06-18', '');

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
  `credits` int(11) NOT NULL DEFAULT '0',
  `static_video_link` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `product_img` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT '0',
  `clean_url` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `storyboard_id`, `name`, `sku`, `price`, `credits`, `static_video_link`, `description`, `product_img`, `display_order`, `clean_url`, `meta_title`, `meta_description`, `status`, `date_added`) VALUES
(1, 116486, 'CB Dream Agent Focus 26-4', 'SKU116486', '0.00', 50, '', '<p>CB Dream Agent Focus 26-4</p>', '116486.jpg', 0, 'cb-dream-agent-focus-26-4', 'cb dream agent focus 26-4', 'CB Dream Agent Focus 26-4', 'Y', '2022-05-12 09:23:05'),
(2, 125406, 'The CB DBA Way', 'SKU125406', '0.00', 50, '', '<p>The CB DBA Way</p>', '125406.jpg', 0, 'the-cb-dba-way', 'the cb dba way', 'The CB DBA Way', 'Y', '2022-05-12 09:24:16'),
(3, 120859, 'CB Dream Individual Agent-Focus 26-4', 'SKU120859', '0.00', 35, '', '<p>CB Dream Individual Agent-Focus 26-4</p>', '120859.jpg', 0, 'cb-dream-individual-agent-focus-26-4', 'cb dream individual agent-focus 26-4', 'CB Dream Individual Agent-Focus 26-4', 'Y', '2022-05-12 09:24:58'),
(4, 123329, 'CB Dream Individual dot-com 26-4', 'SKU123329', '0.00', 25, '', '<p>CB Dream Individual dot-com 26-4</p>', '123329.jpg', 0, 'cb-dream-individual-dot-com-26-4', 'cb dream individual dot-com 26-4', 'CB Dream Individual dot-com 26-4', 'Y', '2022-05-12 09:25:33'),
(5, 123328, 'CB Dream Individual 12-3', 'SKU123328', '0.00', 45, '', '<p>CB Dream Individual 12-3</p>', '123328.jpg', 0, 'cb-dream-individual-12-3', 'cb dream individual 12-3', 'CB Dream Individual 12-3', 'Y', '2022-05-12 09:26:09'),
(6, 119918, 'Original CB Dream Setup', 'SKU119918', '0.00', 50, 'https://player.vimeo.com/video/716000186', 'Original CB Dream Setup', '119918.jpg', 0, 'original-cb-dream-setup', 'original cb dream setup', 'Original CB Dream Setup', 'Y', '2022-05-12 09:26:41'),
(7, 48828, 'CB Way Chapter01', 'SKU48828', '0.00', 120, '', '<p>CB Way Chapter01</p>', '48828.jpg', 0, 'cb-way-chapter01', 'cb way chapter01', 'CB Way Chapter01', 'Y', '2022-05-12 09:27:16'),
(8, 127521, 'TCBW2-CH01', 'SKU127521', '0.00', 1, 'https://player.vimeo.com/video/716000186', '', '127521.jpg', 0, 'tcbw2-ch01', 'tcbw2-ch01', '', 'Y', '2022-06-02 10:06:44'),
(9, 127522, 'TCBW2-CH02', 'SKU127522', '0.00', 1, 'https://vimeo.com/716000213/7fc50463e6', '', '127522.jpg', 0, 'tcbw2-ch02', 'tcbw2-ch02', '', 'Y', '2022-06-02 10:08:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_category_id`, `product_id`, `category_id`) VALUES
(3, 3, 33),
(4, 4, 33),
(5, 5, 33),
(7, 7, 33),
(9, 2, 33),
(18, 9, 34),
(19, 8, 37),
(20, 6, 33),
(22, 1, 33);

-- --------------------------------------------------------

--
-- Table structure for table `product_extra_fields`
--

DROP TABLE IF EXISTS `product_extra_fields`;
CREATE TABLE IF NOT EXISTS `product_extra_fields` (
  `product_extra_fields_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT 'Product ID',
  `extra_field_name` varchar(128) NOT NULL DEFAULT '',
  `extra_field_label` varchar(128) NOT NULL DEFAULT '',
  `extra_field_value` varchar(128) NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_extra_fields_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_extra_fields`
--

INSERT INTO `product_extra_fields` (`product_extra_fields_id`, `product_id`, `extra_field_name`, `extra_field_label`, `extra_field_value`, `display_order`) VALUES
(1, 1, 'BG layer', 'BG layer', '', 0),
(2, 1, 'CompID', 'CompID', '', 0),
(3, 2, 'Sc_02_Disclaimer', 'Sc 02 Disclaimer', '', 0),
(4, 2, 'Sc_05_Disclaimer', 'Sc 05 Disclaimer', '', 0),
(5, 2, 'Sc_02_ClaimLine_01', 'Sc 02 ClaimLine 01', '', 0),
(6, 2, 'Sc_04_Disclaimer', 'Sc 04 Disclaimer', '', 0),
(7, 2, 'Email_Address', 'Email Address', '', 0),
(8, 2, 'Sc_02_ClaimLine_02', 'Sc 02 ClaimLine 02', '', 0),
(9, 2, 'Sc_03_ClaimLine_01', 'Sc 03 ClaimLine 01', '', 0),
(10, 2, 'Sc_03_ClaimLine_02', 'Sc 03 ClaimLine 02', '', 0),
(11, 2, 'Phone_Number', 'Phone Number', '', 0),
(12, 2, 'DBA_Company_ID', 'DBA Company ID', '', 0),
(13, 2, 'Sc_04_ClaimLine_02', 'Sc 04 ClaimLine 02', '', 0),
(14, 2, 'Web_URL', 'Web URL', '', 0),
(15, 2, 'Sc_02_BG', 'Sc 02 BG', '', 0),
(16, 2, 'Sc_05_LargeNumber', 'Sc 05 LargeNumber', '', 0),
(17, 2, 'Sc_03_BG', 'Sc 03 BG', '', 0),
(18, 2, 'Sc_05_BG', 'Sc 05 BG', '', 0),
(19, 2, 'Sc_05_ClaimLine_01', 'Sc 05 ClaimLine 01', '', 0),
(20, 2, 'Sc_04_BG', 'Sc 04 BG', '', 0),
(21, 2, 'Agent_or_Team_Name', 'Agent or Team Name', '', 0),
(22, 2, 'Sc_04_LargeNumber', 'Sc 04 LargeNumber', '', 0),
(23, 2, 'Sc_02_Number', 'Sc 02 Number', '', 0),
(24, 2, 'DBA_Company_Name', 'DBA Company Name', '', 0),
(25, 3, 'EMAIL_or_PHONE', 'EMAIL or PHONE', '', 0),
(26, 3, 'DBA_URL', 'DBA URL', '', 0),
(27, 3, 'LICENSE', 'LICENSE', '', 0),
(28, 3, 'CompID', 'CompID', '', 0),
(29, 3, 'NAME', 'NAME', '', 0),
(30, 4, 'EMAIL_or_PHONE', 'EMAIL or PHONE', '', 0),
(31, 4, 'DBA_URL', 'DBA URL', '', 0),
(32, 4, 'LICENSE', 'LICENSE', '', 0),
(33, 4, 'CompID', 'CompID', '', 0),
(34, 4, 'NAME', 'NAME', '', 0),
(35, 5, 'EMAIL_or_PHONE', 'EMAIL or PHONE', '', 0),
(36, 5, 'DBA_URL', 'DBA URL', '', 0),
(37, 5, 'LICENSE', 'LICENSE', '', 0),
(38, 5, 'CompID', 'CompID', '', 0),
(39, 5, 'NAME', 'NAME', '', 0),
(40, 6, 'CompID', 'CompID', '103001', 0),
(41, 7, 'Contact Info Line 3', 'Contact Info Line 3', '', 0),
(42, 7, 'Contact Info Line 2', 'Contact Info Line 2', '', 0),
(43, 7, 'CaRe or License Number', 'CaRe or License Number', '', 0),
(44, 7, 'Logo Placeholder', 'Logo Placeholder', '', 0),
(45, 7, 'Contact Info Line 1', 'Contact Info Line 1', '', 0),
(46, 7, 'Name', 'Name', '', 0),
(47, 8, 'textbox_DBA_URL', 'textbox DBA URL', '', 0),
(48, 8, 'textbox_EMAIL_or_PHONE', 'textbox EMAIL or PHONE', '', 0),
(49, 8, 'textbox_DBA_name', 'textbox DBA name', '', 0),
(50, 8, 'textbox_NAME', 'textbox NAME', '', 0),
(51, 8, 'textbox_DBA_Logo', 'textbox DBA Logo', '', 0),
(52, 8, 'textbox_LICENSE', 'textbox LICENSE', '', 0),
(53, 9, 'textbox_DBA_URL', 'textbox DBA URL', '', 0),
(54, 9, 'textbox_EMAIL_or_PHONE', 'textbox EMAIL or PHONE', '', 0),
(55, 9, 'textbox_DBA_name', 'textbox DBA name', '', 0),
(56, 9, 'textbox_NAME', 'textbox NAME', '', 0),
(57, 9, 'textbox_DBA_Logo', 'textbox DBA Logo', '', 0),
(58, 9, 'textbox_LICENSE', 'textbox LICENSE', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `webpage`
--

DROP TABLE IF EXISTS `webpage`;
CREATE TABLE IF NOT EXISTS `webpage` (
  `webpage_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `banner_img` varchar(255) NOT NULL,
  `clean_url` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`webpage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webpage`
--

INSERT INTO `webpage` (`webpage_id`, `page_title`, `description`, `banner_img`, `clean_url`, `meta_title`, `meta_description`, `status`, `date_added`) VALUES
(1, 'About Us', '<p><span style=\"color: rgb(0, 0, 0);\">Morpheus was created with YOU in mind. As video marketing professionals, we understand that one size does not fit all. We understand the challenges of creating high quality, branded video content at scale, while maintaining unique individuality.</span></p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">COLDWELL BANKER is proud to present MORPHEUS MARKETPLACE. A new video tool that gives brokers and marketing associates the power to amplify their reach like never before.</span></p><p><br></p><p><span style=\"color: rgb(0, 0, 0);\">With minimal effort and cost, you can create infinite video versions in an instant.</span></p><p><br></p><p><strong style=\"color: rgb(0, 0, 0);\">AMPLIFY YOUR MESSAGE AT SCALE</strong></p><ul><li>Instantaneously customize and download your videos to share with your network.</li><li>Infinite video versioning based on user input</li></ul><p><br></p><p><strong style=\"color: rgb(0, 0, 0);\">SO SIMPLE, ANYONE CAN USE IT</strong></p><ul><li><span style=\"color: rgb(60, 64, 67);\">No technical skill required to create engaging video content yourself</span></li></ul><p><br></p><p><strong style=\"color: rgb(0, 0, 0);\">HIGH QUALITY CONTENT</strong></p><ul><li>Brand compliant and pre-approved</li><li>Customizable elements to amplify your personalized brand identity</li></ul>', 'pexels-cátia-matos-1072179.jpg', 'about-us', 'About Us', 'About us content', 'Y', '2022-03-25 09:50:00'),
(2, 'Privacy Policy', '<p>At Morpheus, accessible from <a href=\"https://iclerisy.net/demo/morpheus/\" rel=\"noopener noreferrer\" target=\"_blank\">https://iclerisy.net/demo/morpheus/</a>, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Morpheus and how we use it.</p><p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.</p><p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Morpheus. This policy is not applicable to any information collected offline or via channels other than this website. Our Privacy Policy was created with the help of the <a href=\"https://www.termsfeed.com/privacy-policy-generator/\" rel=\"noopener noreferrer\" target=\"_blank\">Free Privacy Policy Generator</a>.</p><h4>Consent</h4><p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.</p><h4>Information we collect</h4><p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.</p><p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.</p><p>When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.</p><h4>How we use your information</h4><p>We use the information we collect in various ways, including to:</p><ul><li>Provide, operate, and maintain our website</li><li>Improve, personalize, and expand our website</li><li>Understand and analyze how you use our website</li><li>Develop new products, services, features, and functionality</li><li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes</li><li>Send you emails</li><li>Find and prevent fraud</li></ul><h4>Log Files</h4><p>Morpheus follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.</p><h4>Cookies and Web Beacons</h4><p>Like any other website, Morpheus uses \'cookies\'. These cookies are used to store information including visitors\' preferences, and the pages on the website that the visitor accessed or visited. The information is used to optimize the users\' experience by customizing our web page content based on visitors\' browser type and/or other information.</p><p>For more general information on cookies, please read <a href=\"https://www.termsfeed.com/blog/sample-cookies-policy-template/#What_Are_Cookies\" rel=\"noopener noreferrer\" target=\"_blank\">the Cookies article on TermsFeed website</a>.</p><h4>Advertising Partners Privacy Policies</h4><p>You may consult this list to find the Privacy Policy for each of the advertising partners of Morpheus.</p><p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Morpheus, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.</p><p>Note that Morpheus has no access to or control over these cookies that are used by third-party advertisers.</p><h4>Third Party Privacy Policies</h4><p>Morpheus\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.</p><p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.</p><h4>CCPA Privacy Rights (Do Not Sell My Personal Information)</h4><p>Under the CCPA, among other rights, California consumers have the right to:</p><p>Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.</p><p>Request that a business delete any personal data about the consumer that a business has collected.</p><p>Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.</p><p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p><h4>GDPR Data Protection Rights</h4><p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:</p><p>The right to access – You have the right to request copies of your personal data. We may charge you a small fee for this service.</p><p>The right to rectification – You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.</p><p>The right to erasure – You have the right to request that we erase your personal data, under certain conditions.</p><p>The right to restrict processing – You have the right to request that we restrict the processing of your personal data, under certain conditions.</p><p>The right to object to processing – You have the right to object to our processing of your personal data, under certain conditions.</p><p>The right to data portability – You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.</p><p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p><h4>Children\'s Information</h4><p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.</p><p>Morpheus does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.</p>', '1117426.jpg', 'privacy-policy', 'privacy policy', 'Privacy Policy', 'Y', '2022-03-25 09:52:48'),
(3, 'Terms and Condition', '<h5><strong>AGREEMENT TO TERMS:</strong></h5><ol><li>These Terms of Use constitute a legally binding agreement made between you, whether personally or on behalf of an entity (individually and collectively “You” or “Your”) and Morpheus Marketplace, Inc. (\"Company\" “We,\" “Us,\" or “Our”), concerning Your access to and use of the <strong>Morphme</strong>.io website as well as any other media form, media channel, mobile website or mobile application related, linked, or otherwise connected thereto (collectively, the “Site”). You agree that by accessing the Site, You have read, understood, and hereby agree to be bound by all of these Terms of Use. IF YOU DO NOT AGREE WITH ALL OF THESE TERMS OF USE, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE SITE AND YOU MUST DISCONTINUE USE IMMEDIATELY. <strong><u>BY ACCESSING THE SITE, YOU ARE AGREEING TO THESE TERMS OF USE.</u></strong></li><li>Supplemental terms and conditions or documents that may be posted on the Site from time to time are hereby expressly incorporated herein by reference. We reserve the right, in Our sole discretion, to make changes or modifications to these Terms of Use at any time and for any reason. We will use Our best efforts to alert You about any changes by updating the “Last updated” date of these Terms of Use; provided, however, that You waive any right to receive specific notice of each such change to these Terms of Use. Please ensure that You check the applicable Terms of Use every time You use Our Site so that You understand which Terms or Use apply. You agree that by Your continued use of the Site after the date such revised Terms of Use are posted that You are subject to and will be deemed to have been made aware of and to have accepted any and all such changes in any revised Terms of Use.</li><li>The information provided on the Site is not intended for distribution to or use by any person or entity in any jurisdiction or country where such distribution or use would be contrary to law or regulation or which would subject Us to any registration requirement within such jurisdiction or country (each being a “Foreign Jurisdiction”). Accordingly, those persons who choose to access the Site from any Foreign Jurisdiction do so on their own initiative and are solely responsible for compliance with local laws, if and to the extent local laws are applicable as well as being bound by these Terms of Use</li><li>The Site is not tailored to comply with industry-specific regulations (Health Insurance Portability and Accountability Act (HIPAA), Federal Information Security Management Act (FISMA), etc.), so if Your interactions would be subjected to such laws, You may not use this Site; provided, however, that in the event You continue to use the Site, You indemnify and hold Us harmless from any and all claims, damages or costs that We may be subject to on account of Your unauthorized use of the Site.</li><li>The Site is intended for users who are at least 18 years old. Persons under the age of 18 are not permitted to use or register for the Site without Our prior written consent.</li></ol><h5><strong>INTELLECTUAL PROPERTY RIGHTS:</strong></h5><ol><li>Unless otherwise indicated, the Site is Our proprietary property and all source code, databases, functionality, software, website designs, audio, video, text, photographs, and graphics on the Site (collectively, the “Content”) and the trademarks, service marks, and logos contained therein (the “Marks”) are owned or controlled by Us or licensed to Us, and are protected by copyright and trademark laws and various other intellectual property rights and unfair competition laws of the United States, international copyright laws, and international conventions. The Content and the Marks are provided on the Site “AS IS” for Your information and use solely as authorized herein or pursuant to the terms and conditions of any other written agreement that You and We enter into. Except as expressly provided in these Terms of Use or elsewhere, no part of the Site and no Content or Marks may be copied, reproduced, aggregated, republished, uploaded, duplicated, extracted, posted, publicly displayed, encoded, translated, transmitted, distributed, sold, licensed, or otherwise exploited for any commercial purpose whatsoever, without Our express prior written permission. In this regard, no Content may be placed on broadcast television without Our express prior written permission</li><li>Provided that You are eligible to use the Site, You are granted a limited license to access and use the Site and to download or print a copy of any portion of the Content to which You have properly gained access solely for Your personal, marketing, non-commercial (i.e. while You may use the Content to promote Your business, You may not commercially sell the Content), promotional use. As used herein, We reserve all rights not expressly granted to You in and to the Site, the Content and the Marks You cannot extract, copy, duplicate, use or otherwise separate any Content that you do not own from a video or any product that You have downloaded from the Site for any purpose. By way of example, music that is synced to Your video cannot be extracted and synced to other videos because, at the very least, this is copyright infringement and You do not have a license to engage in any such activities. Similarly, neither images nor video clips that You do not own cannot be extracted for any purpose as this is also copyright infringement. If You do engage in any such so-called ‘extraction’ activities, You do so at Your own risk, You agree to indemnify and hold Us harmless in the event You are liable to the copyright or trademark owner for damages resulting from Your infringing activities and You agree to be solely responsible for any and all damages that might occur on account of such so-called ‘extraction’ activities. Please allow this to serve as official notice that You cannot remove, alter, change or otherwise adapt any digital fingerprints from videos.</li></ol><h5><strong>USER REPRESENTATIONS: </strong></h5><p>By using the Site, You represent and warrant that: (1) You have the legal capacity and You agree to comply with these Terms of Use; (2) You are not a minor in the jurisdiction in which You reside; (3) You will not access the Site through automated or non-human means, whether through a bot, script, or otherwise; (4) You will not use the Site for any illegal or unauthorized purpose; (5) You agree that We will not be required to host, store or otherwise maintain on Our server or elsewhere Your work, product, videos or the like for more than thirty (30) days after Your order checkout is confirmed and that after such thirty (30) day period, We will not have access to nor will We be required to provide You with a copy of Your work, product, videos or the like; and (6) Your use of the Site will not violate any applicable law or regulation. If You provide any information to Us that is untrue, inaccurate, not current, or incomplete, We have the right to suspend or terminate Your account and refuse any and all current or future use of the Site (or any portion thereof).</p><h5><strong>PROHIBITED ACTIVITIES: </strong></h5><ol><li>You may not access or use the Site for any purpose other than that for which We make the Site available. The Site may not be used in connection with any commercial endeavors except those that are specifically endorsed or approved by Us.</li><li>As a user of the Site, You agree not to: (a) Systematically retrieve data or other content from the Site to create or compile, directly or indirectly, a collection, compilation, database, or directory without written permission from Us; (b) Trick, defraud, or mislead Us and other users, especially in any attempt to learn sensitive account information such as user passwords; (c) Circumvent, disable, or otherwise interfere with security-related features of the Site, including features that prevent or restrict the use or copying of any Content or enforce limitations on the use of the Site and/or the Content contained therein; (d) Disparage, tarnish, or otherwise harm, in Our reasonable good-faith opinion, Us and/or the Site; (e) Use any information obtained from the Site in order to harass, abuse, or harm another person; (f) Make improper use of Our support services or submit false reports of abuse or misconduct; (g) Use the Site in a manner inconsistent with any applicable laws or regulations; (h) Engage in unauthorized framing of or linking to the Site; (i) Upload or transmit (or attempt to upload or to transmit) viruses, Trojan horses, or other material, including excessive use of capital letters and spamming (continuous posting of repetitive text), that interferes with any party’s uninterrupted use and enjoyment of the Site or modifies, impairs, disrupts, alters, or interferes with the use, features, functions, operation, or maintenance of the Site; (j) Engage in any automated use of the system, such as using scripts to send comments or messages, or using any data mining, robots, or similar data gathering and extraction tools; (k) Delete the copyright or other proprietary rights notice from any Content; (l) Attempt to impersonate another user or person or use the username of another user; (m) Upload or transmit (or attempt to upload or to transmit) any material that acts as a passive or active information collection or transmission mechanism, including without limitation, clear graphics interchange formats (“gifs”), 1×1 pixels, web bugs, cookies, or other similar devices (sometimes referred to as “spyware” or “passive collection mechanisms” or “pcms”); (n) Interfere with, disrupt, or create an undue burden on the Site or the networks or services connected to the Site; (o) Harass, annoy, intimidate, or threaten any of Our employees or agents engaged in providing any portion of the Site to You; (p) Attempt to bypass any measures of the Site designed to prevent or restrict access to the Site, or any portion of the Site; (q). Copy, amend, adjust or adapt the Site’s software, including but not limited to Flash, PHP, HTML, JavaScript, or other code; (r) Except as permitted by applicable law, decipher, decompile, disassemble, or reverse engineer any of the software comprising or in any way making up a part of the Site; (s) Except as may be the result of standard search engine or Internet browser usage, use, launch, develop, or distribute any automated system, including without limitation, any spider, robot, cheat utility, scraper, or offline reader that accesses the Site, or using or launching any unauthorized script or other software; (t) Use a buying agent or purchasing agent to make purchases on the Site; (u) Make any unauthorized use of the Site, including collecting usernames and/or email addresses of users by electronic or other means for the purpose of sending unsolicited email, or creating user accounts by automated means or under false pretenses; (v) Use the Site as part of any effort to compete with us or otherwise use the Site and/or the Content for any revenue-generating endeavor or commercial enterprise or (w) make any changes to the items, materials, data, videos and work-product that You have downloaded (and You agree that once You engage and otherwise make a download but want to make changes, You will re-engage and start a new work-order). ONCE YOU HAVE DOWNLOADED A VIDEO, YOU AGREE NOT TO MAKE ANY CHANGES TO SUCH DOWNLOADED VIDEO.</li></ol><h5><strong>USER GENERATED CONTRIBUTIONS:</strong></h5><ol><li>Any and all communications You make to Us or on or through the Site may be viewable by other users of the Site and through third-party websites and may be treated as non-confidential and non-proprietary. When you create or make available any communication to Us or on or through the Site, You represent and warrant that: (a) The creation, distribution, transmission, public display, or performance, and the accessing, downloading, or copying of your communications do not and will not infringe the proprietary rights, including but not limited to the copyright, patent, trademark, trade secret, or moral rights of any third party; (b) You are the creator and owner of or have the necessary licenses, rights, consents, releases, and permissions to use and to authorize us, the Site, and other users of the Site to use your communications in any manner contemplated by the Site and these Terms of Use; (c) You have the written consent, release, and/or permission of each and every identifiable individual person in Your communications to use the name or likeness of each and every such identifiable individual person to enable inclusion and use of Your communications in any manner contemplated by the Site and these Terms of Use; (d) Your communications are not false, inaccurate, or misleading; (e) Your communications do not violate any applicable law, regulation, or rule; (f) Your communications do not violate the privacy or publicity rights of any third party; (g) Your communications do not violate any applicable law concerning child pornography, or otherwise intended to protect the health or well-being of minors and (h) Your communications do not otherwise violate, or link to material that violates, any provision of these Terms of Use, or any applicable law or regulation.</li><li>You acknowledge that any use of the Site in violation of the foregoing violates these Terms of Use and may result in, among other things, termination or suspension of Your rights to use the Site.</li><li>By posting Your communications to any part of the Site, You automatically grant, and You represent and warrant that You have the right to grant, to Us an unrestricted, unlimited, irrevocable, perpetual, non-exclusive, transferable, royalty-free, fully-paid, worldwide right, and license to host, use, copy, reproduce, disclose, sell, resell, publish, broadcast, retitle, archive, store, cache, publicly perform, publicly display, reformat, translate, transmit, excerpt (in whole or in part), and distribute such communications (including, without limitation, Your image and voice) for any purpose, commercial, advertising, or otherwise, and to prepare derivative works of, or incorporate into other works, such communications, and grant and authorize sublicenses of the foregoing. The use and distribution may occur in any media formats and through any media channels.</li><li>We do not assert any ownership over Your communications. We have the right, in Our sole and absolute discretion to edit, redact, or otherwise change any and all such communications.</li></ol><h5><strong>THIRD-PARTY WEBSITE AND CONTENT: </strong></h5><p>The Site may contain (or you may be sent via the Site) links to other websites (\"Third-Party Websites\") as well as articles, photographs, text, graphics, pictures, designs, music, sound, video, information, applications, software, and other content or items belonging to or originating from third parties (\"Third-Party Content\"). Such Third-Party Websites and Third-Party Content are not investigated, monitored, or checked for accuracy, appropriateness, or completeness by Us, and We are not responsible for any Third-Party Websites accessed through the Site or any Third-Party Content posted on, available through, or installed from the Site, including the content, accuracy, offensiveness, opinions, reliability, privacy practices, or other policies of or contained in the Third-Party Websites or the Third-Party Content. Inclusion of, linking to, or permitting the use or installation of any Third-Party Websites or any Third-Party Content does not imply approval or endorsement thereof by Us. If You decide to leave the Site and access the Third-Party Websites or to use or install any Third-Party Content, You do so at Your own risk, and You should be aware these Terms of Use no longer govern such Third-Party Websites or any Third-Party Content. You agree and acknowledge that we do not endorse the products or services offered on Third-Party Websites and You shall hold Us harmless from any harm caused by Your purchase of such products or services. Additionally, You shall hold Us harmless from any losses sustained by You or harm caused to You relating to or resulting in any way from any Third-Party Content or any contact with Third-Party Websites.</p><h5><strong>ADVERTISERS: </strong></h5><p>If we allow advertisers to display their advertisements and other information in certain areas of the Site, such as sidebar advertisements or banner advertisements and if You are an advertiser, You shall take full responsibility for any advertisements You place on the Site and any services provided on the Site or products sold through those advertisements. Further, as an advertiser, You warrant and represent that You possess all rights and authority to place advertisements on the Site, including, but not limited to, intellectual property rights, publicity rights, and contractual rights. We simply provide the space to place such advertisements, and We have no other relationship with advertisers.</p><h5><strong>SITE MANAGEMENT: </strong></h5><p>We reserve the right, but not the obligation, to: (1) monitor the Site for violations of these Terms of Use; (2) take appropriate legal action against anyone who, in Our sole discretion, violates the law or these Terms of Use; (3) in Our sole discretion and without limitation, refuse, restrict access to, limit the availability of, or disable (to the extent technologically feasible) any of Your communications or any portion thereof. and (4) otherwise manage the Site in a manner designed to protect Our rights and property and to facilitate the proper functioning of the Site.</p><h5><strong>PRIVACY POLICY: </strong></h5><p>By using the Site, You agree to be bound by Our Privacy Policy posted on the Site, which is incorporated into these Terms of Use. Please be advised the Site is hosted in the United States. If You access the Site from any other region of the world with laws or other requirements governing personal data collection, use, or disclosure that differ from applicable laws in the United States, then through Your continued use of the Site, You are transferring Your data to the United States, and You agree to have Your data transferred to and processed in the United States.</p><h5><strong>COPYRIGHT INFRINGEMENTS: </strong></h5><p>By using the Site, You agree to be bound by Our Privacy Policy posted on the Site, which is incorporated into these Terms of Use. Please be advised the Site is hosted in the United States. If You access the Site from any other region of the world with laws or other requirements governing personal data collection, use, or disclosure that differ from applicable laws in the United States, then through Your continued use of the Site, You are transferring Your data to the United States, and You agree to have Your data transferred to and processed in the United States.</p><h5><strong>COPYRIGHT INFRINGEMENTS: </strong></h5><p>If You believe that any material available on or through the Site infringes upon any copyright You own or control, please immediately notify Us using the contact information provided below (a “Notification”).</p><h5><strong>TERM AND TERMINATION: </strong></h5><p>These Terms of Use shall remain in full force and effect while You use the Site. WITHOUT LIMITING ANY OTHER PROVISION OF THESE TERMS OF USE, WE RESERVE THE RIGHT TO, IN OUR SOLE DISCRETION AND WITHOUT NOTICE OR LIABILITY, DENY ACCESS TO AND USE OF THE SITE (INCLUDING BLOCKING CERTAIN IP ADDRESSES), TO ANY PERSON FOR ANY REASON OR FOR NO REASON, INCLUDING WITHOUT LIMITATION FOR BREACH OF ANY REPRESENTATION, WARRANTY, OR COVENANT CONTAINED IN THESE TERMS OF USE OR OF ANY APPLICABLE LAW OR REGULATION. WE MAY TERMINATE YOUR USE OR PARTICIPATION IN THE SITE OR DELETE ANY CONTENT OR INFORMATION THAT YOU POSTED AT ANY TIME, WITHOUT WARNING, IN OUR SOLE DISCRETION. In this regard, if we terminate or suspend Your account for any reason, You are prohibited from registering and creating a new account under Your name, a fake or borrowed name, or the name of any third party, even if You may be acting on behalf of the third party. In addition to terminating or suspending Your account, We reserve the right to take appropriate legal action, including without limitation pursuing civil, criminal, and injunctive redress.</p><h5><strong>MODIFICATIONS AND INTERRUPTIONS: </strong></h5><p>We reserve the right to change, modify, or remove the contents of the Site at any time or for any reason at Our sole discretion without notice. However, We have no obligation to update any information on our Site. We also reserve the right to modify or discontinue all or part of the Site without notice at any time. We will not be liable to You or any third party for any modification, price change, suspension, or discontinuance of the Site. We cannot guarantee the Site will be available at all times. We may experience hardware, software, or other problems or need to perform maintenance related to the Site, resulting in interruptions, delays, or errors. We reserve the right to change, revise, update, suspend, discontinue, or otherwise modify the Site at any time or for any reason without notice to You. You agree that we have no liability whatsoever for any loss, damage, or inconvenience caused by Your inability to access or use the Site during any downtime or discontinuance of the Site. Nothing in these Terms of Use will be construed to obligate Us to maintain and support the Site or to supply any corrections, updates, or releases in connection therewith.</p><h5><strong>GOVERNING LAW: </strong></h5><p>These Terms of Use and your use of the Site are governed by and construed in accordance with the laws of the State of Florida applicable to agreements made and to be entirely performed within the State of Florida. without regard to its conflict of law principles.</p><h5><strong>DISPUTE RESOLUTION</strong></h5><ol><li>If You and We are unable to resolve any dispute, controversy or claim related to these Terms of Use (individually and collectively each being a “Dispute”) through informal negotiations, the Dispute (except those Disputes expressly excluded below) will be finally and exclusively resolved through binding arbitration. The arbitration shall be commenced and conducted under the Commercial Arbitration Rules of the American Arbitration Association (\"AAA\") and, where appropriate, the AAA’s Supplementary Procedures for Consumer Related Disputes (\"AAA Consumer Rules\"), both of which are available at the AAA website: <a href=\"https://www.adr.org/\" rel=\"noopener noreferrer\" target=\"_blank\">www.adr.org</a>. Your arbitration fees and Your share of arbitrator compensation shall be governed by the AAA Consumer Rules and, where appropriate, limited by the AAA Consumer Rules. The arbitration may be conducted in person, through the submission of documents, by phone, or online. The arbitrator will make a decision in writing but need not provide a statement of reasons unless requested by either You or Us. The arbitrator must follow applicable law, and any award may be challenged if the arbitrator fails to do so. Except where otherwise required by the applicable AAA rules or applicable law, the arbitration will take place in St. Petersburg, Florida. Except as otherwise provided herein, You and We may litigate in court to compel arbitration,stay proceedings pending arbitration, or to confirm, modify, vacate, or enter judgment on the award entered by the arbitrator.</li><li>If for any reason, a Dispute proceeds in court rather than arbitration, the Dispute shall be commenced or prosecuted in the state and federal courts located in St. Petersburg, Florida and You and We hereby consent to, and waive all defenses of lack of personal jurisdiction, and forum non conveniens (i.e. the discretionary power that would allow the courts located in St. Petersburg, Florida to dismiss a case where another court, or forum, may be better suited, in the opinion of such other court, to hear the case) with respect to venue and jurisdiction in such state and federal courts.</li><li>In no event shall any Dispute brought by either Party related in any way to the Site be commenced more than eighteen (18) months after the cause of action arose. If this provision is found to be illegal or unenforceable, then neither You nor We will elect to arbitrate any Dispute falling within that portion of this provision found to be illegal or unenforceable, and such Dispute shall be decided by a court of competent jurisdiction within the courts listed for jurisdiction above, and the Parties agree to submit to the personal jurisdiction of that court.</li><li>You and We agree that any arbitration shall be limited to the Dispute between You and Us individually. To the full extent permitted by law, (a) no arbitration shall be joined with any other proceeding; (b) there is no right or authority for any Dispute to be arbitrated on a class-action basis or to utilize class action procedures; and (c) there is no right or authority for any Dispute to be brought in a purported representative capacity on behalf of the general public or any other persons.</li><li>You and We agree that the following Disputes are not subject to the above provisions concerning informal negotiations and binding arbitration: (a) any Disputes seeking to enforce or protect, or concerning the validity of, any of the intellectual property rights of a Party; (b) any Dispute related to, or arising from, allegations of theft, piracy, invasion of privacy, or unauthorized use; and (c) any claim for injunctive relief. If this provision is found to be illegal or unenforceable, then neither Party will elect to arbitrate any Dispute falling within that portion of this provision found to be illegal or unenforceable and such Dispute shall be decided by a court of competent jurisdiction within the courts listed for jurisdiction above, and the Parties agree to submit to the personal jurisdiction of that court.</li></ol><h5><strong>CORRECTIONS: </strong></h5><p>There may be information on the Site that contains typographical errors, inaccuracies, or omissions, including descriptions, pricing, availability, and various other information. We reserve the right to correct any errors, inaccuracies, or omissions and to change or update the information on the Site at any time, without prior notice.</p><h5><strong>DISCLAIMER: </strong></h5><p>THE SITE IS PROVIDED ON AN AS-IS AND AS-AVAILABLE BASIS. YOU AGREE THAT YOUR USE OF THE SITE AND OUR SERVICES WILL BE AT YOUR SOLE RISK. TO THE FULLEST EXTENT PERMITTED BY LAW, WE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, IN CONNECTION WITH THE SITE AND YOUR USE THEREOF, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. WE MAKE NO WARRANTIES OR REPRESENTATIONS ABOUT THE ACCURACY OR COMPLETENESS OF THE SITE’S CONTENT OR THE CONTENT OF ANY WEBSITES LINKED TO THE SITE AND WE WILL ASSUME NO LIABILITY OR RESPONSIBILITY FOR ANY (1) ERRORS, MISTAKES, OR INACCURACIES OF CONTENT AND MATERIALS, (2) PERSONAL INJURY OR PROPERTY DAMAGE, OF ANY NATURE WHATSOEVER, RESULTING FROM YOUR ACCESS TO AND USE OF THE SITE, (3) ANY UNAUTHORIZED ACCESS TO OR USE OF OUR SECURE SERVERS AND/OR ANY AND ALL PERSONAL INFORMATION AND/OR FINANCIAL INFORMATION STORED THEREIN, (4) ANY INTERRUPTION OR CESSATION OF TRANSMISSION TO OR FROM THE SITE, (5) ANY BUGS, VIRUSES, TROJAN HORSES, OR THE LIKE WHICH MAY BE TRANSMITTED TO OR THROUGH THE SITE BY ANY THIRD PARTY, AND/OR (6) ANY ERRORS OR OMISSIONS IN ANY CONTENT AND MATERIALS OR FOR ANY LOSS OR DAMAGE OF ANY KIND INCURRED AS A RESULT OF THE USE OF ANY CONTENT POSTED, TRANSMITTED, OR OTHERWISE MADE AVAILABLE VIA THE SITE. WE DO NOT WARRANT, ENDORSE, GUARANTEE, OR ASSUME RESPONSIBILITY FOR ANY PRODUCT OR SERVICE ADVERTISED OR OFFERED BY A THIRD PARTY THROUGH THE SITE, ANY HYPERLINKED WEBSITE, OR ANY WEBSITE OR MOBILE APPLICATION FEATURED IN ANY BANNER OR OTHER ADVERTISING, AND WE WILL NOT BE A PARTY TO OR IN ANY WAY BE RESPONSIBLE FOR MONITORING ANY TRANSACTION BETWEEN YOU AND ANY THIRD-PARTY PROVIDERS OF PRODUCTS OR SERVICES. AS WITH THE PURCHASE OF A PRODUCT OR SERVICE THROUGH ANY MEDIUM OR IN ANY ENVIRONMENT, YOU SHOULD USE YOUR BEST JUDGMENT AND EXERCISE CAUTION WHERE APPROPRIATE.</p><h5><strong>LIMITATIONS OF LIABILITY: </strong></h5><p>IN NO EVENT WILL WE OR OUR DIRECTORS, EMPLOYEES, OR AGENTS BE LIABLE TO YOU OR ANY THIRD PARTY FOR ANY DIRECT, INDIRECT, CONSEQUENTIAL, EXEMPLARY, INCIDENTAL, SPECIAL, OR PUNITIVE DAMAGES, INCLUDING LOST PROFIT, LOST REVENUE, LOSS OF DATA, OR OTHER DAMAGES ARISING FROM YOUR USE OF THE SITE, EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. NOTWITHSTANDING ANYTHING TO THE CONTRARY CONTAINED HEREIN, OUR LIABILITY TO YOU FOR ANY CAUSE WHATSOEVER AND REGARDLESS OF THE FORM OF THE ACTION, WILL AT ALL TIMES BE LIMITED TO THE LESSER OF THE AMOUNT PAID, IF ANY, BY YOU TO US DURING THE SIX (6) MONTH PERIOD PRIOR TO ANY CAUSE OF ACTION ARISING OR $5,000.00 USD. CERTAIN US STATE LAWS AND INTERNATIONAL LAWS DO NOT ALLOW LIMITATIONS ON IMPLIED WARRANTIES OR THE EXCLUSION OR LIMITATION OF CERTAIN DAMAGES. IF THESE LAWS APPLY TO YOU, SOME OR ALL OF THE ABOVE DISCLAIMERS OR LIMITATIONS MAY NOT APPLY TO YOU, AND YOU MAY HAVE ADDITIONAL RIGHTS.</p><h5><strong>INDEMNIFICATION: </strong></h5><p>You agree to defend, indemnify, and hold us harmless, including our subsidiaries, affiliates, and all of our respective officers, agents, partners, and employees, from and against any loss, damage, liability, claim, or demand, including reasonable attorneys’ fees and expenses, made by any third party due to or arising out of: (1) your Contributions; (2) use of the Site; (3) breach of these Terms of Use; (4) any breach of your representations and warranties set forth in these Terms of Use; (5) your violation of the rights of a third party, including but not limited to intellectual property rights; or (6) any overt harmful act toward any other user of the Site with whom you connected via the Site. Notwithstanding the foregoing, we reserve the right, at your expense, to assume the exclusive defense and control of any matter for which you are required to indemnify us, and you agree to cooperate, at your expense, with our defense of such claims. We will use reasonable efforts to notify you of any such claim, action, or proceeding which is subject to this indemnification upon becoming aware of it.</p><h5><strong>USER DATA: </strong></h5><p>We will maintain certain data that you transmit to the Site for the purpose of managing the performance of the Site, as well as data relating to your use of the Site. Although we perform regular routine backups of data, you are solely responsible for all data that you transmit or that relates to any activity you have undertaken using the Site. You agree that we shall have no liability to you for any loss or corruption of any such data, and you hereby waive any right of action against us arising from any such loss or corruption of such data.</p><h5><strong>ELECTRONIC COMMUNICATIONS, TRANSACTIONS, AND SIGNATURES: </strong></h5><p>Visiting the Site, sending us emails, and completing online forms constitute electronic communications. You consent to receive electronic communications, and you agree that all agreements, notices, disclosures, and other communications we provide to you electronically, via email and on the Site, satisfy any legal requirement that such communication be in writing. YOU HEREBY AGREE TO THE USE OF ELECTRONIC SIGNATURES, CONTRACTS, ORDERS, AND OTHER RECORDS, AND TO ELECTRONIC DELIVERY OF NOTICES, POLICIES, AND RECORDS OF TRANSACTIONS INITIATED OR COMPLETED BY US OR VIA THE SITE. You hereby waive any rights or requirements under any statutes, regulations, rules, ordinances, or other laws in any jurisdiction which require an original signature or delivery or retention of non-electronic records, or to payments or the granting of credits by any means other than electronic means.</p><h5><strong>CALIFORNIA USERS AND RESIDENTS:</strong></h5><p>Under the California Consumer Protection Act, among other rights, California consumers have the right to: (i) request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers; (ii) request that a business delete any personal data about the consumer that a business has collected; and/or (iii) request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data. If We receive any such request from You, You grant us one (1) month from the date that We receive such request to respond to You. If You would like to exercise any of these rights, please contact Us.If any complaint with us is not satisfactorily resolved, you can contact the Complaint Assistance Unit of the Division of Consumer Services of the California Department of Consumer Affairs in writing at 1625 North Market Blvd., Suite N 112, Sacramento, California 95834 or by telephone at (800) 952-5210 or (916) 445-1254.</p><h5><strong>MISCELLANEOUS:</strong></h5><p>These Terms of Use and any policies or operating rules posted by us on the Site or in respect to the Site constitute the entire agreement and understanding between you and us. Our failure to exercise or enforce any right or provision of these Terms of Use shall not operate as a waiver of such right or provision. These Terms of Use operate to the fullest extent permissible by law. We may assign any or all of our rights and obligations to others at any time. We shall not be responsible or liable for any loss, damage, delay, or failure to act caused by any cause beyond our reasonable control. If any provision or part of a provision of these Terms of Use is determined to be unlawful, void, or unenforceable, that provision or part of the provision is deemed severable from these Terms of Use and does not affect the validity and enforceability of any remaining provisions. There is no joint venture, partnership, employment or agency relationship created between you and us as a result of these Terms of Use or use of the Site. You agree that these Terms of Use will not be construed against us by virtue of having drafted them. You hereby waive any and all defenses you may have based on the electronic form of these Terms of Use and the lack of signing by the parties hereto to execute these Terms of Use.</p><h5><strong>CONTACT US</strong></h5><p>In order to resolve a complaint regarding the Site or to receive further information regarding use of the Site. </p><p>Please contact Us at: <strong>Morpheus Marketplace, Inc.; 7901 Fourth Street North; Ste 300; St. Petersburg, Florida 33702; support@morphme.io</strong></p>', 'pexels-cátia-matos-1072179.jpg', 'terms-and-condition', 'terms and condition', 't&c', 'Y', '2022-03-25 09:53:20'),
(7, 'FAQs', '<p>Coming Soon...</p>', '', 'faqs', 'faqs', 'faqs', 'Y', '2022-04-26 10:17:13'),
(8, 'Contact Us', '<h2>General Inquiries: info@morphme.io</h2><h2>Support Inquiries:support@morphme.io</h2><p><br></p><h2>MORPHEUS MARKETPLACE INC.</h2><p><strong>7901 4th St. N</strong></p><p><strong>STE 300</strong></p><p><strong>St. Petersburg, FL 33702</strong></p>', '', 'contact-us', 'contact us', 'Contact Us', 'Y', '2022-04-26 10:18:21'),
(9, 'Sitemap', '<p>Coming Soon..</p>', '', 'sitemap', 'sitemap', 'Sitemap', 'Y', '2022-04-26 10:18:48'),
(10, 'Help Center', '<p>Coming Soon..</p>', '', 'help-center', 'help center', 'Help Center', 'Y', '2022-04-26 10:20:08'),
(11, 'Careers', '<p>Coming Soon..</p>', '', 'careers', 'careers', 'Careers', 'Y', '2022-04-26 10:20:51'),
(13, 'test12', '<p>testing</p>', 'pexels-cátia-matos-1072179.jpg', 'test12', 'test12', '', 'Y', '2022-06-15 07:13:01');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
