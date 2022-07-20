-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 20, 2022 at 06:18 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DBA`
--

-- --------------------------------------------------------

--
-- Table structure for table `basket_contents`
--

CREATE TABLE `basket_contents` (
  `basket_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `basket_contents`
--

INSERT INTO `basket_contents` (`basket_id`, `product_id`, `seller_id`, `quantity`, `price`) VALUES
(14, 3005955, 200005, 3, '107.50'),
(15, 3007676, 200000, 2, '249.00'),
(15, 3007679, 200000, 3, '721.00'),
(15, 3007689, 200010, 2, '331.00'),
(15, 3007767, 200000, 2, '299.99'),
(18, 3006033, 200009, 2, '232.76'),
(18, 3007676, 200000, 2, '249.00'),
(18, 3007762, 200003, 1, '319.99'),
(25, 3005955, 200000, 1, '109.00'),
(25, 3006033, 200000, 4, '244.00'),
(25, 3007689, 200010, 3, '331.00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_code` char(6) NOT NULL,
  `category_description` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_code`, `category_description`) VALUES
(1, 'MOBACC', 'Mobile phones and accessories'),
(2, 'TVHCIN', 'TV and Home Cinema'),
(3, 'CAMACC', 'Cameras and accessories'),
(4, 'AUDHIF', 'Audio and Hifi'),
(5, 'COMACC', 'Computers and accessories'),
(6, 'GAMING', 'Gaming');

-- --------------------------------------------------------

--
-- Table structure for table `ordered_products`
--

CREATE TABLE `ordered_products` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `ordered_product_status` varchar(10) DEFAULT NULL CHECK (`ordered_product_status` in ('Placed','Dispatched','Delivered','Cancelled'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordered_products`
--

INSERT INTO `ordered_products` (`order_id`, `product_id`, `seller_id`, `quantity`, `price`, `ordered_product_status`) VALUES
(6202000, 3000000, 200000, 4, '249.00', 'Delivered'),
(6202000, 3006033, 200005, 4, '249.00', 'Delivered'),
(6219001, 3006033, 200000, 1, '244.00', 'Delivered'),
(6221001, 3007734, 200000, 6, '26.99', 'Delivered'),
(6221001, 3007922, 200000, 1, '69.99', 'Delivered'),
(6402004, 3007734, 200004, 1, '26.99', 'Delivered'),
(6403000, 3005955, 200000, 5, '109.00', 'Delivered'),
(6428004, 3007689, 200010, 1, '331.00', 'Delivered'),
(6504004, 3007676, 200010, 2, '242.00', 'Delivered'),
(6512005, 3006033, 200000, 1, '244.00', 'Delivered'),
(6515005, 3007734, 200000, 9, '26.99', 'Delivered'),
(6609008, 3006033, 200000, 1, '244.00', 'Delivered'),
(6618000, 3007676, 200010, 3, '242.00', 'Delivered'),
(6618000, 3007779, 200009, 2, '164.99', 'Delivered'),
(6621000, 3000000, 200002, 1, '237.98', 'Delivered'),
(6628005, 3007905, 200007, 7, '299.00', 'Delivered'),
(6712005, 3007767, 200000, 4, '299.99', 'Delivered'),
(6712005, 3007786, 200011, 1, '325.55', 'Delivered'),
(6731009, 3007903, 200011, 8, '339.99', 'Delivered'),
(6731010, 3007922, 200000, 3, '69.99', 'Delivered'),
(6809009, 3007922, 200000, 1, '69.99', 'Delivered'),
(6811001, 3007676, 200010, 10, '242.00', 'Delivered'),
(6811001, 3007717, 200000, 1, '53.00', 'Delivered'),
(6830000, 3006033, 200009, 1, '232.76', 'Delivered'),
(6912004, 3007937, 200008, 8, '455.27', 'Delivered'),
(6915012, 3007689, 200010, 1, '331.00', 'Delivered'),
(6916013, 3007717, 200000, 12, '53.00', 'Delivered'),
(6916013, 3007903, 200000, 1, '325.89', 'Delivered'),
(6919012, 3005955, 200005, 4, '107.50', 'Delivered'),
(6925013, 3007905, 200000, 1, '279.99', 'Delivered'),
(7016013, 3007689, 200010, 5, '331.00', 'Delivered'),
(7016013, 3007922, 200000, 1, '69.99', 'Delivered'),
(7016013, 3007937, 200008, 6, '455.27', 'Delivered'),
(7023014, 3007717, 200004, 1, '46.89', 'Cancelled'),
(7027001, 3007786, 200000, 3, '329.99', 'Delivered'),
(7101017, 3007779, 200000, 1, '169.99', 'Delivered'),
(7102000, 3005955, 200005, 2, '107.50', 'Delivered'),
(7118017, 3007786, 200000, 5, '329.99', 'Delivered'),
(7119005, 3007689, 200000, 1, '331.66', 'Delivered'),
(7130010, 3007786, 200000, 6, '329.99', 'Delivered'),
(7208009, 3005955, 200005, 2, '107.50', 'Delivered'),
(7208009, 3007676, 200000, 1, '249.00', 'Delivered'),
(7208014, 3007779, 200009, 8, '164.99', 'Delivered'),
(7211009, 3007759, 200000, 1, '436.59', 'Delivered'),
(7217013, 3007676, 200000, 10, '249.00', 'Delivered'),
(7217013, 3007779, 200000, 1, '169.99', 'Delivered'),
(7218000, 3007903, 200000, 1, '325.89', 'Delivered'),
(7219001, 3007759, 200009, 7, '444.99', 'Delivered'),
(7221009, 3007786, 200011, 1, '325.55', 'Delivered'),
(7224010, 3006033, 200005, 4, '249.00', 'Delivered'),
(7224010, 3007679, 200000, 1, '721.00', 'Delivered'),
(7225018, 3007786, 200000, 2, '329.99', 'Delivered'),
(7229018, 3007759, 200009, 1, '444.99', 'Delivered'),
(7231004, 3007717, 200000, 2, '53.00', 'Delivered'),
(7231004, 3007779, 200000, 1, '169.99', 'Delivered'),
(7302005, 3005955, 200005, 10, '107.50', 'Delivered'),
(7302019, 3005955, 200000, 1, '107.50', 'Delivered'),
(7302019, 3007759, 200009, 1, '444.99', 'Delivered'),
(7304010, 3007676, 200000, 12, '249.00', 'Delivered'),
(7306000, 3007679, 200010, 1, '699.00', 'Delivered'),
(7306000, 3007717, 200000, 8, '53.00', 'Delivered'),
(7306000, 3007786, 200011, 1, '325.55', 'Delivered'),
(7306010, 3007759, 200009, 1, '444.99', 'Delivered'),
(7310019, 3006033, 200009, 5, '232.76', 'Delivered'),
(7316019, 3007717, 200000, 8, '53.00', 'Dispatched'),
(7317020, 3007679, 200000, 1, '721.00', 'Delivered'),
(7318019, 3007922, 200000, 9, '69.99', 'Delivered'),
(7321004, 3006033, 200005, 2, '249.00', 'Cancelled'),
(7327013, 3007786, 200011, 1, '325.55', 'Delivered'),
(7328021, 3000000, 200000, 1, '237.98', 'Delivered'),
(7328021, 3007786, 200000, 3, '329.99', 'Delivered'),
(7331018, 3007717, 200000, 2, '53.00', 'Placed'),
(7331018, 3007786, 200011, 1, '325.55', 'Delivered'),
(7404020, 3007717, 200000, 7, '53.00', 'Dispatched'),
(7408014, 3007734, 200004, 1, '26.99', 'Delivered'),
(7408014, 3007779, 200000, 8, '169.99', 'Dispatched'),
(7417022, 3005955, 200005, 12, '107.50', 'Placed'),
(7417022, 3007734, 200000, 1, '26.99', 'Placed'),
(7417024, 3007679, 200010, 5, '699.00', 'Placed'),
(7417024, 3007689, 200010, 2, '331.00', 'Placed'),
(7417025, 3006033, 200005, 3, '249.00', 'Placed'),
(7417025, 3007689, 200010, 2, '331.00', 'Placed'),
(7417026, 3006033, 200005, 3, '249.00', 'Placed'),
(7417026, 3007689, 200010, 2, '331.00', 'Placed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_code` char(10) NOT NULL,
  `product_description` varchar(70) NOT NULL,
  `product_manufacturer` varchar(20) NOT NULL,
  `product_model` varchar(35) DEFAULT NULL,
  `product_status` varchar(25) NOT NULL CHECK (`product_status` in ('Available','Temporarily Unavailable','Discontinued'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `product_code`, `product_description`, `product_manufacturer`, `product_model`, `product_status`) VALUES
(3000000, 2, 'TV30399302', 'Sony Bravia 32 inch HD TV Black', 'Sony', 'KDL32WE613BU', 'Available'),
(3000021, 2, 'TV30356743', 'Panasonic 55 inch OLED TV Black', 'LG', 'OLED55B9PLA', 'Available'),
(3005955, 1, 'MP45322289', 'Huawei Y6 32GB 6.09 inch Smartphone', 'Huawei', 'B07S268P1K', 'Available'),
(3006033, 1, 'MP56889550', 'Samsung Galaxy M30s SIM Free Smartphone', 'Samsung', 'SM-M307FZKUBTU', 'Available'),
(3007676, 3, 'CA067443', 'Canon DSLR Camera (Black)', 'Canon', 'EOS 4000D', 'Available'),
(3007679, 3, 'CA568333', 'Nikon Digital DSLR Camera Body (Black)', 'Nikon', 'D7500', 'Available'),
(3007689, 3, 'CA175555', 'Panasonic Lumix Camera, 12.1 Megapixel, 24x Optical Zoom, Black', 'Panasonic', 'DMC-FZ300', 'Temporarily Unavailable'),
(3007717, 4, 'AU353512', 'Sony Wireless Noise Cancelling Headphones', 'Sony', 'WH-1000XM3', 'Available'),
(3007734, 4, 'AU430303', 'Supereye MP3 Player, 16G Portable Lossless Sound MP3 Player', 'Supereye', 'B07PRG6QMV', 'Available'),
(3007759, 5, 'CO3930033', 'Lenovo V145 15.6\" FHD Laptop AMD A9-9425, 8GB RAM, 256GB SSD, Black', 'Lenovo', '81MT0015UK', 'Available'),
(3007762, 5, 'CO8920232', 'ASUS VivoBook X420 Full HD 14 Inch Laptop (128 GB SSD, 4 GB RAM)', 'Asus', 'X420UA-EK019T', 'Available'),
(3007767, 5, 'CO8920231', 'ASUS VivoBook X320 Full HD 14 Inch Laptop (128 GB SSD, 2 GB RAM)', 'Asus', 'X320UA-EK015T', 'Discontinued'),
(3007779, 5, 'CO6558555', 'Samsung Galaxy Tab A 10.1-Inch 32 GB Wi-Fi', 'Samsung', 'SM-T510NZKDBTU', 'Available'),
(3007786, 6, 'GA29002201', 'Nintendo Switch', 'Nintendo', 'B07W4CK8KR', 'Available'),
(3007903, 6, 'GA13949494', 'Sony PlayStation 4 Pro 1TB White', 'Sony', 'SP603033A', 'Available'),
(3007905, 6, 'GA84944050', 'Microsoft Xbox One 500GB Console - Black ', 'Microsoft', 'B00CM1KUVE', 'Available'),
(3007922, 6, 'GA22020026', 'Numskull Multi-Format Pro Steering Wheel', 'Numskull', 'NUMK83656', 'Temporarily Unavailable'),
(3007937, 6, 'GA33533688', 'Xbox One S 1TB Console - Minecraft Creators Bundle', 'Microsoft', 'B07MLWLYCN', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `product_id` int(11) NOT NULL,
  `shopper_id` int(11) NOT NULL,
  `title` varchar(35) DEFAULT NULL,
  `creation_time` datetime DEFAULT current_timestamp(),
  `modification_time` datetime DEFAULT NULL,
  `body` text NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` in (1,2,3,4,5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`product_id`, `shopper_id`, `title`, `creation_time`, `modification_time`, `body`, `rating`) VALUES
(3000021, 10001, 'Best product', '2022-01-05 21:05:05', NULL, 'Best product on the market....', 5),
(3005955, 10003, 'Good product', '2022-01-05 21:05:05', NULL, 'Half Yes, half No....', 3),
(3005955, 10004, 'Not too Good product', '2022-01-05 21:05:05', NULL, 'I can live without you....', 2),
(3006033, 10005, 'Bad product', '2022-01-05 21:06:43', NULL, 'A little nightmare....', 1);

--
-- Triggers `product_reviews`
--
DELIMITER $$
CREATE TRIGGER `set_mod_date` BEFORE UPDATE ON `product_reviews` FOR EACH ROW SET NEW.modification_time = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_sellers`
--

CREATE TABLE `product_sellers` (
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_sellers`
--

INSERT INTO `product_sellers` (`product_id`, `seller_id`, `price`) VALUES
(3000000, 200000, '249.00'),
(3000000, 200002, '237.98'),
(3000000, 200003, '239.99'),
(3000000, 200005, '270.99'),
(3000021, 200000, '1079.00'),
(3000021, 200002, '999.00'),
(3005955, 200000, '109.00'),
(3005955, 200005, '107.50'),
(3006033, 200000, '244.00'),
(3006033, 200005, '249.00'),
(3006033, 200009, '232.76'),
(3007676, 200000, '249.00'),
(3007676, 200010, '242.00'),
(3007679, 200000, '721.00'),
(3007679, 200010, '699.00'),
(3007689, 200000, '331.66'),
(3007689, 200010, '331.00'),
(3007717, 200000, '53.00'),
(3007717, 200001, '49.97'),
(3007717, 200004, '46.89'),
(3007734, 200000, '26.99'),
(3007734, 200004, '26.99'),
(3007759, 200000, '436.59'),
(3007759, 200003, '470.99'),
(3007759, 200009, '444.99'),
(3007762, 200000, '312.14'),
(3007762, 200001, '331.90'),
(3007762, 200003, '319.99'),
(3007762, 200009, '300.99'),
(3007767, 200000, '299.99'),
(3007779, 200000, '169.99'),
(3007779, 200009, '164.99'),
(3007786, 200000, '329.99'),
(3007786, 200008, '327.79'),
(3007786, 200009, '321.23'),
(3007786, 200011, '325.55'),
(3007903, 200000, '325.89'),
(3007903, 200002, '320.99'),
(3007903, 200007, '339.99'),
(3007903, 200011, '339.99'),
(3007905, 200000, '279.99'),
(3007905, 200002, '260.00'),
(3007905, 200007, '299.00'),
(3007922, 200000, '69.99'),
(3007937, 200002, '489.00'),
(3007937, 200008, '455.27');

-- --------------------------------------------------------

--
-- Stand-in structure for view `reviews`
-- (See below for the actual view)
--
CREATE TABLE `reviews` (
`shopper_id` int(11)
,`shopper_first_name` varchar(15)
,`shopper_surname` varchar(20)
,`description` varchar(70)
,`review` mediumtext
,`rating` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `seller_id` int(11) NOT NULL,
  `seller_account_ref` char(8) NOT NULL,
  `seller_name` varchar(20) NOT NULL,
  `seller_address_line1` varchar(30) NOT NULL,
  `seller_address_line2` varchar(30) DEFAULT NULL,
  `seller_address_line3` varchar(25) DEFAULT NULL,
  `seller_county` varchar(20) NOT NULL,
  `seller_post_code` char(8) NOT NULL,
  `seller_email_address` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`seller_id`, `seller_account_ref`, `seller_name`, `seller_address_line1`, `seller_address_line2`, `seller_address_line3`, `seller_county`, `seller_post_code`, `seller_email_address`) VALUES
(200000, 'ORI00001', 'Orinoco UK', 'Ford Industrial Park', 'Leighton Buzzard', NULL, 'Bedfordshire', 'LU7 6GB', 'sales_uk@orinoco.com'),
(200001, 'STU00550', 'Stuff UK', 'Unit 5', 'Cosmos Industrial Estate', 'Swindon', 'Wiltshire', 'SN12 0YQ', 'sales@stuffuk.co.uk'),
(200002, 'ELE00118', 'Electronics World', '20-30 Brick Lane', 'Slough', NULL, 'Berkshire', 'SL4 1TT', 'uk_enquiries@electronics_world.com'),
(200003, 'KLI00034', 'Kliktec', 'Unit 18', 'Trent Industrial Park', 'Nottingham', 'Nottinghamshire', 'NG1 2LM', 'sales@kliktec.co.uk'),
(200004, 'BAR00028', 'Barracuda', '1 Fulham Road', 'White City', NULL, 'London', 'W12 7EB', 'enquiries@barrcuda_uk.com'),
(200005, 'OUK00001', 'DigiTec Limited', 'Unit 5', 'Newlands Road', 'Hackney', 'London', 'E1 0AB', 'sales@digitec.co.uk'),
(200006, 'KIR00056', 'Kirby', '14 Cook Street', 'Reading', NULL, 'Berkshire', 'RG14 7AQ', 'sales@kirby.co.uk'),
(200007, 'GAM00188', 'GameOn', 'Unit 2', 'Totton Industrial Park', 'Southampton', 'Hampshire', 'SO40 5HB', 'sales@millenium-retailing.com'),
(200008, 'FUS00171', 'Fusion', '100 Grigg Road', 'Sheffield', NULL, 'Yorkshire', 'S3 1BC', 'orinoco.sales@fusion.com'),
(200009, 'INT00090', 'IntelliWorld', 'Unit 81', 'Branksome Park', 'Poole', 'Dorset', 'BH11 0SZ', 'sales@intelliworld.co.uk'),
(200010, 'CCL00061', 'CCL', 'Unit 1', 'Concord Industrial Estate', 'Bristol', 'Somerset', 'BS1 2LK', 'uk_sales@ccl.com'),
(200011, 'BLU00288', 'BlueShark Ltd', 'Unit 6', 'Hampton Industrial Park', 'Acton', 'London', 'W12 0NG', 'sales@blueshark.co.uk');

-- --------------------------------------------------------

--
-- Table structure for table `seller_reviews`
--

CREATE TABLE `seller_reviews` (
  `seller_id` int(11) NOT NULL,
  `shopper_id` int(11) NOT NULL,
  `title` varchar(35) DEFAULT NULL,
  `creation_time` datetime DEFAULT current_timestamp(),
  `modification_time` datetime DEFAULT current_timestamp(),
  `body` text NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` in (1,2,3,4,5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller_reviews`
--

INSERT INTO `seller_reviews` (`seller_id`, `shopper_id`, `title`, `creation_time`, `modification_time`, `body`, `rating`) VALUES
(200003, 10001, 'Trusted', '2022-01-16 22:51:26', '2022-01-16 22:51:26', 'Trusted seller on the market....', 4),
(200007, 10005, 'Bad', '2022-01-16 20:09:32', '2022-01-16 20:09:32', 'Do not make a deal, a lot of problems....', 1),
(200009, 10004, 'Not too Good seller', '2022-01-16 20:09:32', '2022-01-16 20:09:32', 'May have some problems....', 2),
(200011, 10003, 'Good seller', '2022-01-16 20:09:32', '2022-01-16 20:09:32', 'Has some issues....', 3);

--
-- Triggers `seller_reviews`
--
DELIMITER $$
CREATE TRIGGER `set_seller_date` BEFORE UPDATE ON `seller_reviews` FOR EACH ROW SET NEW.modification_time = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `shoppers`
--

CREATE TABLE `shoppers` (
  `shopper_id` int(11) NOT NULL,
  `shopper_account_ref` char(8) NOT NULL,
  `shopper_first_name` varchar(15) NOT NULL,
  `shopper_surname` varchar(20) NOT NULL,
  `shopper_email_address` varchar(35) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `date_joined` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoppers`
--

INSERT INTO `shoppers` (`shopper_id`, `shopper_account_ref`, `shopper_first_name`, `shopper_surname`, `shopper_email_address`, `date_of_birth`, `gender`, `date_joined`) VALUES
(10000, 'CB104093', 'Caroline', 'Bradley', 'cbradley@coldmail.co.uk', '1965-05-10', 'F', '2019-02-02'),
(10001, 'LC103202', 'Liam', 'Charlesworth', 'liam_charlesworth@wahoo.com', '1990-12-18', 'M', '2019-02-19'),
(10003, 'CL106755', 'Christian', 'Lovett', 'cvl2340@coldmail.co.uk', '1944-10-08', 'M', '2019-03-27'),
(10004, 'EC110404', 'Elliott', 'Chandler', 'ell_chandler20@geemail.com', '2000-03-27', 'M', '2019-04-02'),
(10005, 'AS102193', 'Abby', 'Smith', 'abbysmith12@.wahoo.com', '1998-11-04', 'F', '2019-05-12'),
(10006, 'TB107770', 'Thomas', 'Bradshaw', 'tb45600@coldmail.co.uk', '1992-03-31', 'M', '2019-05-22'),
(10008, 'FB113293', 'Francois', 'Bouillion', 'fbouillion@yoho.com.', '2001-09-12', 'M', '2019-06-08'),
(10009, 'AN118893', 'Adebe', 'Ndidi', 'andidi@bestmail.co.uk', '1999-04-09', 'M', '2019-07-31'),
(10010, 'LP122073', 'Lucy-Anne', 'Porter', 'laporter66@.coldmail.co.uk', '1987-04-19', 'F', '2019-07-31'),
(10011, 'LY108994', 'Lewis', 'Young', 'lew_young12@wahoo.com', '2001-01-11', 'M', '2019-08-08'),
(10012, 'BL114443', 'Brenda', 'La Porte', 'brenda_laporte@bestmail.co.uk', '1977-08-10', 'F', '2019-09-15'),
(10013, 'TD156773', 'Tanya', 'Divine', 'td14039@wahoo.com', '1997-06-27', 'F', '2019-09-16'),
(10014, 'BJ113230', 'Ben', 'Jones', 'bennyboy10@lol.co.uk', '1992-08-31', 'M', '2019-10-23'),
(10017, 'LN109090', 'Lisa', 'Newman', 'lisa.newman@coldmail.co.uk', '1959-12-28', 'F', '2019-11-01'),
(10018, 'PP110032', 'Paula', 'Patterson', 'pp67676@wahoo.com', '1971-01-12', 'F', '2019-12-25'),
(10019, 'FS108991', 'Frankie', 'Smith', 'frankie_m33@wahoo.com', '2001-01-10', NULL, '2020-01-02'),
(10020, 'GB122310', 'Gill', 'Bex', 'gb20201@lol.co.uk', '1969-07-05', 'F', '2020-01-17'),
(10021, 'MV156753', 'Martin', 'Venus', 'mvenus@coldmail.co.uk', '1989-06-11', 'M', '2020-01-18'),
(10022, 'MC115590', 'Matthias', 'Christiansson', 'mcsquared@lol.co.uk', '1997-08-28', 'M', '2020-02-10'),
(10023, 'AA124778', 'Ali', 'Al Fayed', 'ali_alfayed4405@wahoo.com', '1984-05-01', 'M', '2020-02-12');

-- --------------------------------------------------------

--
-- Table structure for table `shopper_baskets`
--

CREATE TABLE `shopper_baskets` (
  `basket_id` int(11) NOT NULL,
  `shopper_id` int(11) NOT NULL,
  `basket_created_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopper_baskets`
--

INSERT INTO `shopper_baskets` (`basket_id`, `shopper_id`, `basket_created_date_time`) VALUES
(1, 10003, '2021-12-29 10:57:39'),
(3, 10001, '2021-12-29 20:43:51'),
(10, 10004, '2021-12-29 21:25:31'),
(11, 10003, '2021-12-30 11:17:22'),
(12, 10001, '2021-12-30 11:51:42'),
(13, 10001, '2021-12-30 18:44:08'),
(14, 10001, '2021-12-30 19:24:21'),
(15, 10001, '2022-01-01 13:25:32'),
(16, 10003, '2022-01-02 15:30:43'),
(18, 10003, '2022-01-02 18:42:02'),
(19, 10001, '2022-01-02 19:02:58'),
(20, 10019, '2022-01-02 20:58:47'),
(21, 10001, '2022-01-03 17:55:46'),
(22, 10001, '2022-01-05 15:21:38'),
(24, 10003, '2022-01-06 17:05:35'),
(25, 10003, '2022-01-06 17:06:20');

-- --------------------------------------------------------

--
-- Table structure for table `shopper_orders`
--

CREATE TABLE `shopper_orders` (
  `order_id` int(11) NOT NULL,
  `shopper_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` varchar(10) NOT NULL CHECK (`order_status` in ('Placed','Incomplete','Complete','Cancelled'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shopper_orders`
--

INSERT INTO `shopper_orders` (`order_id`, `shopper_id`, `order_date`, `order_status`) VALUES
(6202000, 10000, '2019-02-02', 'Complete'),
(6219001, 10001, '2019-02-19', 'Complete'),
(6221001, 10001, '2019-02-21', 'Complete'),
(6402004, 10004, '2019-04-02', 'Complete'),
(6403000, 10000, '2019-04-03', 'Complete'),
(6428004, 10004, '2019-04-28', 'Complete'),
(6504004, 10004, '2019-05-04', 'Complete'),
(6512005, 10005, '2019-05-12', 'Complete'),
(6515005, 10005, '2019-05-15', 'Complete'),
(6609008, 10008, '2019-06-09', 'Complete'),
(6618000, 10000, '2019-06-18', 'Complete'),
(6621000, 10000, '2019-06-21', 'Complete'),
(6628005, 10005, '2019-06-28', 'Complete'),
(6712005, 10005, '2019-07-12', 'Complete'),
(6731009, 10009, '2019-07-31', 'Complete'),
(6731010, 10010, '2019-07-31', 'Complete'),
(6809009, 10009, '2019-08-09', 'Complete'),
(6811001, 10001, '2019-08-11', 'Complete'),
(6830000, 10009, '2019-08-30', 'Complete'),
(6912004, 10004, '2019-09-12', 'Complete'),
(6915012, 10012, '2019-09-15', 'Complete'),
(6916013, 10013, '2019-09-16', 'Complete'),
(6919012, 10012, '2019-09-19', 'Complete'),
(6925013, 10013, '2019-09-25', 'Complete'),
(7016013, 10013, '2019-10-16', 'Complete'),
(7023014, 10014, '2019-10-23', 'Cancelled'),
(7027001, 10001, '2019-10-27', 'Complete'),
(7101017, 10017, '2019-11-01', 'Complete'),
(7102000, 10010, '2019-11-02', 'Complete'),
(7118017, 10017, '2019-11-18', 'Complete'),
(7119005, 10005, '2019-11-19', 'Complete'),
(7130010, 10010, '2019-11-30', 'Complete'),
(7208009, 10009, '2019-12-08', 'Complete'),
(7208014, 10014, '2019-12-08', 'Complete'),
(7211009, 10009, '2019-12-11', 'Complete'),
(7217013, 10013, '2019-12-17', 'Complete'),
(7218000, 10000, '2019-12-18', 'Complete'),
(7219001, 10001, '2019-12-19', 'Complete'),
(7221009, 10009, '2019-12-21', 'Complete'),
(7224010, 10010, '2019-12-24', 'Complete'),
(7225018, 10018, '2019-12-25', 'Complete'),
(7229018, 10018, '2019-12-29', 'Complete'),
(7231004, 10004, '2019-12-31', 'Complete'),
(7302005, 10005, '2020-02-02', 'Complete'),
(7302019, 10019, '2020-01-02', 'Complete'),
(7304010, 10010, '2019-01-04', 'Complete'),
(7306000, 10000, '2020-01-06', 'Complete'),
(7306010, 10010, '2020-01-06', 'Complete'),
(7310019, 10019, '2020-01-10', 'Complete'),
(7316019, 10019, '2020-01-16', 'Incomplete'),
(7317020, 10020, '2020-01-17', 'Complete'),
(7318019, 10019, '2020-01-18', 'Complete'),
(7321004, 10004, '2020-01-21', 'Cancelled'),
(7327013, 10013, '2020-01-27', 'Complete'),
(7328021, 10021, '2020-01-28', 'Placed'),
(7331018, 10005, '2020-01-31', 'Incomplete'),
(7404020, 10020, '2020-02-04', 'Placed'),
(7408014, 10014, '2020-02-08', 'Incomplete'),
(7417022, 10022, '2020-02-17', 'Placed'),
(7417024, 10003, '2022-01-02', 'Placed'),
(7417025, 10001, '2022-01-05', 'Placed'),
(7417026, 10001, '2022-01-17', 'Placed');

-- --------------------------------------------------------

--
-- Structure for view `reviews`
--
DROP TABLE IF EXISTS `reviews`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reviews`  AS SELECT `s`.`shopper_id` AS `shopper_id`, `s`.`shopper_first_name` AS `shopper_first_name`, `s`.`shopper_surname` AS `shopper_surname`, `p`.`product_description` AS `description`, `pr`.`body` AS `review`, `pr`.`rating` AS `rating` FROM ((`product_reviews` `pr` join `shoppers` `s` on(`pr`.`shopper_id` = `s`.`shopper_id`)) join `products` `p` on(`pr`.`product_id` = `p`.`product_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basket_contents`
--
ALTER TABLE `basket_contents`
  ADD PRIMARY KEY (`basket_id`,`product_id`),
  ADD KEY `basket_contents_product_sellers_fk` (`seller_id`,`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_code` (`category_code`);

--
-- Indexes for table `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `ordered_products_product_sellers_fk` (`seller_id`,`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_code` (`product_code`),
  ADD KEY `products_categories_fk` (`category_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`product_id`,`shopper_id`),
  ADD KEY `product_reviews_shoppers_fk` (`shopper_id`);

--
-- Indexes for table `product_sellers`
--
ALTER TABLE `product_sellers`
  ADD PRIMARY KEY (`product_id`,`seller_id`),
  ADD KEY `product_sellers_sellers_fk` (`seller_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`),
  ADD UNIQUE KEY `seller_account_ref` (`seller_account_ref`);

--
-- Indexes for table `seller_reviews`
--
ALTER TABLE `seller_reviews`
  ADD PRIMARY KEY (`seller_id`,`shopper_id`),
  ADD KEY `seller_reviews_shoppers_fk` (`shopper_id`);

--
-- Indexes for table `shoppers`
--
ALTER TABLE `shoppers`
  ADD PRIMARY KEY (`shopper_id`),
  ADD UNIQUE KEY `shopper_account_ref` (`shopper_account_ref`);

--
-- Indexes for table `shopper_baskets`
--
ALTER TABLE `shopper_baskets`
  ADD PRIMARY KEY (`basket_id`),
  ADD KEY `shopper_baskets_shoppers_fk` (`shopper_id`);

--
-- Indexes for table `shopper_orders`
--
ALTER TABLE `shopper_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `shopper_orders_shoppers_fk` (`shopper_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3007938;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200012;

--
-- AUTO_INCREMENT for table `shoppers`
--
ALTER TABLE `shoppers`
  MODIFY `shopper_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10024;

--
-- AUTO_INCREMENT for table `shopper_baskets`
--
ALTER TABLE `shopper_baskets`
  MODIFY `basket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `shopper_orders`
--
ALTER TABLE `shopper_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7417027;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `basket_contents`
--
ALTER TABLE `basket_contents`
  ADD CONSTRAINT `basket_contents_product_sellers_fk` FOREIGN KEY (`seller_id`,`product_id`) REFERENCES `product_sellers` (`seller_id`, `product_id`),
  ADD CONSTRAINT `basket_contents_shopper_baskets_fk` FOREIGN KEY (`basket_id`) REFERENCES `shopper_baskets` (`basket_id`);

--
-- Constraints for table `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD CONSTRAINT `ordered_products_product_sellers_fk` FOREIGN KEY (`seller_id`,`product_id`) REFERENCES `product_sellers` (`seller_id`, `product_id`),
  ADD CONSTRAINT `ordered_products_shopper_orders_fk` FOREIGN KEY (`order_id`) REFERENCES `shopper_orders` (`order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categories_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_reviews_shoppers_fk` FOREIGN KEY (`shopper_id`) REFERENCES `shoppers` (`shopper_id`);

--
-- Constraints for table `product_sellers`
--
ALTER TABLE `product_sellers`
  ADD CONSTRAINT `product_sellers_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_sellers_sellers_fk` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`);

--
-- Constraints for table `seller_reviews`
--
ALTER TABLE `seller_reviews`
  ADD CONSTRAINT `seller_reviews_seller_fk` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`),
  ADD CONSTRAINT `seller_reviews_shoppers_fk` FOREIGN KEY (`shopper_id`) REFERENCES `shoppers` (`shopper_id`);

--
-- Constraints for table `shopper_baskets`
--
ALTER TABLE `shopper_baskets`
  ADD CONSTRAINT `shopper_baskets_shoppers_fk` FOREIGN KEY (`shopper_id`) REFERENCES `shoppers` (`shopper_id`);

--
-- Constraints for table `shopper_orders`
--
ALTER TABLE `shopper_orders`
  ADD CONSTRAINT `shopper_orders_shoppers_fk` FOREIGN KEY (`shopper_id`) REFERENCES `shoppers` (`shopper_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
