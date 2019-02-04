-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2018 at 09:08 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eionic`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', '2017-01-24 16:21:18', '21-11-2018 11:45:31 AM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Books', 'Test anuj', '2017-01-24 19:17:37', '30-01-2017 12:22:24 AM'),
(4, 'Electronics', 'Electronic Products', '2017-01-24 19:19:32', ''),
(5, 'Furniture', 'test', '2017-01-24 19:19:54', ''),
(6, 'Fashion', 'Fashion', '2017-02-20 19:18:52', ''),
(7, 'Grocery', 'Grocery', '2018-09-05 06:20:25', NULL),
(8, 'Movies', 'movies', '2018-11-22 05:25:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` int(100) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` char(50) NOT NULL,
  `ordernumber` varchar(50) NOT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `total`, `orderDate`, `paymentMethod`, `ordernumber`, `orderStatus`) VALUES
(235, 1, '19', 1, 379, '2018-10-02 11:29:20', 'Cash On Delivery', 'gu4yipfg', 'Delivered'),
(239, 1, '21', 1, 90, '2018-10-05 02:52:17', 'Cash On Delivery', '50usnfyn', 'Delivered'),
(243, 1, '1', 1, 139900, '2018-10-05 08:23:51', 'Cash On Delivery', '2jgvdhob', NULL),
(244, 56, '17', 1, 32566, '2018-11-21 13:03:58', 'Cash On Delivery', 'q6cg5x7r', 'in Process');

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36'),
(5, 235, 'in Process', 'g', '2018-11-02 04:02:16'),
(6, 235, 'Delivered', 'order has been delivered', '2018-11-03 09:06:04'),
(7, 244, 'in Process', 'on time', '2018-11-22 05:24:26'),
(8, 239, 'Delivered', 'delivered suceesully', '2018-11-22 07:21:13');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `categoryid`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 4, 3, 'Micromax 81cm (32) HD Ready LED TV  (32T6175MHD, 2 x HDMI, 2 x USB)', 'Micromax test', 139900, 0, '<div class="HoUsOy" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 18px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;">General</div><ul style="box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;"><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);">Sales Package</div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;">1 TV Unit, Remote Controller, Battery (For Remote Controller), Quick Installation Guide and User Manual: All in One, Wall Mount Support</li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);">Model Name</div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;">32T6175MHD</li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);">Display Size</div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;">81 cm (32)</li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);">Screen Type</div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;">LED</li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);">HD Technology &amp; Resolutiontest</div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;">HD Ready, 1366 x 768</li></ul></li></ul>', 'micromax1.jpeg', 'micromax main image.jpg', 'micromax main image.jpg', 1200, 'In Stock', '2017-01-30 16:54:35', ''),
(2, 4, 4, 'Apple iPhone 6 (Silver, 16 GB)', 'Apple INC', 36990, 0, '<div class="_2PF8IO" style="box-sizing: border-box; margin: 0px 0px 0px 110px; padding: 0px; flex: 1 1 0%; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;"><ul style="box-sizing: border-box; margin-bottom: 0px; margin-left: 0px;"><li class="_1tMfkh" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">1 GB RAM | 16 GB ROM |</li><li class="_1tMfkh" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">4.7 inch Retina HD Display</li><li class="_1tMfkh" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">8MP Primary Camera | 1.2MP Front</li><li class="_1tMfkh" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">Li-Ion Battery</li><li class="_1tMfkh" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">A8 Chip with 64-bit Architecture and M8 Motion Co-processor Processor</li></ul></div>', 'apple-iphone-6-1.jpeg', 'apple-iphone-6-2.jpeg', 'apple-iphone-6-3.jpeg', 0, 'In Stock', '2017-01-30 16:59:00', ''),
(3, 4, 4, 'Redmi Note 4 (Gold, 32 GB)  (With 3 GB RAM)', 'Redmi', 10999, 0, '<br><div><ol><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5.5 inch Full HD Display<br></li><li>13MP Primary Camera | 5MP Front<br></li><li>4100 mAh Li-Polymer Battery<br></li><li>Qualcomm Snapdragon 625 64-bit Processor<br></li></ol></div>', 'mi-redmi-note-4-1.jpeg', 'mi-redmi-note-4-2.jpeg', 'mi-redmi-note-4-3.jpeg', 0, 'In Stock', '2017-02-04 04:03:15', ''),
(4, 4, 4, 'Lenovo K6 Power (Silver, 32 GB) ', 'Lenovo', 9999, 0, '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5 inch Full HD Display<br></li><li>13MP Primary Camera | 8MP Front<br></li><li>4000 mAh Li-Polymer Battery<br></li><li>Qualcomm Snapdragon 430 Processor<br></li></ul>', 'lenovo-k6-power-k33a42-1.jpeg', 'lenovo-k6-power-k33a42-2.jpeg', 'lenovo-k6-power-k33a42-3.jpeg', 45, 'In Stock', '2017-02-04 04:04:43', ''),
(5, 4, 4, 'Lenovo Vibe K5 Note (Gold, 32 GB)  ', 'Lenovo', 11999, 0, '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5.5 inch Full HD Display<br></li><li>13MP Primary Camera | 8MP Front<br></li><li>3500 mAh Li-Ion Polymer Battery<br></li><li>Helio P10 64-bit Processor<br></li></ul>', 'lenovo-k5-note-pa330010in-1.jpeg', 'lenovo-k5-note-pa330116in-2.jpeg', 'lenovo-k5-note-pa330116in-3.jpeg', 0, 'In Stock', '2017-02-04 04:06:17', ''),
(6, 4, 4, 'Micromax Canvas Mega 4G', 'Micromax', 6999, 0, '<ul><li>3 GB RAM | 16 GB ROM |<br></li><li>5.5 inch HD Display<br></li><li>13MP Primary Camera | 5MP Front<br></li><li>2500 mAh Battery<br></li><li>MT6735 Processor<br></li></ul>', 'micromax-canvas-mega-4g-1.jpeg', 'micromax-canvas-mega-4g-2.jpeg', 'micromax-canvas-mega-4g-3.jpeg', 35, 'In Stock', '2017-02-04 04:08:07', ''),
(7, 4, 4, 'SAMSUNG Galaxy On5', 'SAMSUNG', 7490, 0, '<ul><li>1.5 GB RAM | 8 GB ROM | Expandable Upto 128 GB<br></li><li>5 inch HD Display<br></li><li>8MP Primary Camera | 5MP Front<br></li><li>2600 mAh Li-Ion Battery<br></li><li>Exynos 3475 Processor<br></li></ul>', 'samsung-galaxy-on7-sm-1.jpeg', 'samsung-galaxy-on5-sm-2.jpeg', 'samsung-galaxy-on5-sm-3.jpeg', 20, 'In Stock', '2017-02-04 04:10:17', ''),
(9, 4, 5, 'Affix Back Cover for Mi Redmi Note 4', 'Techguru', 259, 0, '<ul><li>Suitable For: Mobile<br></li><li>Material: Polyurethane<br></li><li>Theme: No Theme<br></li><li>Type: Back Cover<br></li><li>Waterproof<br></li></ul>', 'amzer-amz98947-original-1.jpeg', 'amzer-amz98947-original-2.jpeg', 'amzer-amz98947-original-3.jpeg', 10, 'In Stock', '2017-02-04 04:17:03', ''),
(11, 4, 6, 'Acer ES 15 Pentium Quad Core', 'Acer', 19990, 0, '<ul><li>Intel Pentium Quad Core Processor ( )<br></li><li>4 GB DDR3 RAM<br></li><li>Linux/Ubuntu Operating System<br></li><li>1 TB HDD<br></li><li>15.6 inch Display<br></li></ul>', 'acer-aspire-notebook-original-1.jpeg', 'acer-aspire-notebook-original-2.jpeg', 'acer-aspire-notebook-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:26:17', ''),
(12, 4, 6, 'Micromax Canvas Laptab II (WIFI) Atom 4th Gen', 'Micromax', 10999, 0, '<ul><li>Intel Atom Processor ( 4th Gen )<br></li><li>2 GB DDR3 RAM<br></li><li>32 bit Windows 10 Operating System<br></li><li>11.6 inch Touchscreen Display<br></li></ul>', 'micromax-lt777w-2-in-1-laptop-original-1.jpeg', 'micromax-lt777w-2-in-1-laptop-original-2.jpeg', 'micromax-lt777w-2-in-1-laptop-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:28:17', ''),
(13, 4, 6, 'HP Core i5 5th Gen', 'HP', 41990, 0, '<span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">HP Core i5 5th Gen - (4 GB/1 TB HDD/Windows 10 Home/2 GB Graphics) N8M28PA 15-ac123tx Notebook</span><span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">&nbsp;&nbsp;(15.6 inch, Turbo SIlver, 2.19 kg)</span><br><div><ul><li>Intel Core i5 Processor ( 5th Gen )<br></li><li>4 GB DDR3 RAM<br></li><li>64 bit Windows 10 Operating System<br></li><li>1 TB HDD<br></li><li>15.6 inch Display<br></li></ul></div>', 'hp-notebook-original-1.jpeg', 'hp-notebook-original-2.jpeg', 'hp-notebook-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:30:24', ''),
(14, 4, 6, 'Lenovo Ideapad 110 APU Quad Core A6 6th Gen', 'Lenovo', 22990, 0, '<span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">Lenovo Ideapad 110 APU Quad Core A6 6th Gen - (4 GB/500 GB HDD/Windows 10 Home) 80TJ00D2IH IP110 15ACL Notebook</span><span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">&nbsp;&nbsp;(15.6 inch, Black, 2.2 kg)</span><br><div><ul><li>AMD APU Quad Core A6 Processor ( 6th Gen )<br></li><li>4 GB DDR3 RAM<br></li><li>64 bit Windows 10 Operating System<br></li><li>500 GB HDD<br></li><li>15.6 inch Display<br></li></ul></div>', 'lenovo-ideapad-notebook-original-1.jpeg', 'lenovo-ideapad-notebook-original-2.jpeg', 'lenovo-ideapad-notebook-3.jpeg', 0, 'In Stock', '2017-02-04 04:32:15', ''),
(15, 3, 8, 'The Wimpy Kid Do -It- Yourself Book', 'ABC', 205, 250, '<span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">The Wimpy Kid Do -It- Yourself Book</span><span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">&nbsp;&nbsp;(English, Paperback, Jeff Kinney)</span><br><div><ul><li>Language: English<br></li><li>Binding: Paperback<br></li><li>Publisher: Penguin Books Ltd<br></li><li>ISBN: 9780141339665, 0141339667<br></li><li>Edition: 1<br></li></ul></div>', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 50, 'In Stock', '2017-02-04 04:35:13', ''),
(16, 3, 8, 'Thea Stilton and the Tropical Treasure ', 'XYZ', 240, 0, '<ul><li>Language: English<br></li><li>Binding: Paperback<br></li><li>Publisher: Scholastic<br></li><li>ISBN: 9789351032083, 9351032086<br></li><li>Edition: 2015<br></li><li>Pages: 176<br></li></ul>', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', 30, 'In Stock', '2017-02-04 04:36:23', ''),
(17, 5, 9, 'Induscraft Solid Wood King Bed With Storage', 'Induscraft', 32566, 0, '<span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">Induscraft Solid Wood King Bed With Storage</span><span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">&nbsp;&nbsp;(Finish Color - Honey Brown)</span><br><div><ul><li>Material Subtype: Rosewood (Sheesham)<br></li><li>W x H x D: 1850 mm x 875 mm x 2057.5 mm<br></li><li>Floor Clearance: 8 mm<br></li><li>Delivery Condition: Knock Down<br></li></ul></div>', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-1.jpeg', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-2.jpeg', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:40:37', ''),
(18, 5, 10, 'Nilkamal Ursa Metal Queen Bed', 'Nilkamal', 6523, 0, '<span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">@home by Nilkamal Ursa Metal Queen Bed</span><span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">&nbsp;&nbsp;(Finish Color - NA)</span><br><div><ul><li>Material Subtype: Carbon Steel<br></li><li>W x H x D: 1590 mm x 910 mm x 2070 mm<br></li><li>Floor Clearance: 341 mm<br></li><li>Delivery Condition: Knock Down<br></li></ul></div>', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-1.jpeg', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-2.jpeg', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:42:27', ''),
(19, 6, 12, 'Asian Casuals  (White, White)', 'Asian', 379, 0, '<ul style="box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;"><li class="_2-riNZ" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">Colour: White, White</li><li class="_2-riNZ" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; list-style: none; position: relative;">Outer Material: Denim</li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);"><br></div></li></ul>', '1.jpeg', '2.jpeg', '3.jpeg', 45, 'In Stock', '2017-03-10 20:16:03', ''),
(20, 6, 12, 'Adidas MESSI 16.3 TF Football turf Shoes  (Blue)', 'Adidas', 4129, 5000, '<ul style="box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;"><li class="_2-riNZ" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">Colour: Blue</li><li class="_2-riNZ" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; list-style: none; position: relative;">Closure: Laced</li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);"><b>Weight</b></div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;"><b>200 g (per single Shoe) - Weight of the product may vary depending on size.</b></li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);"><b>Style</b></div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;"><b>Panel and Stitch Detail, Textured Detail</b></li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);"><b>Tip Shape</b></div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;"><b>Round</b></li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);"><b>Season</b></div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;"><b>AW16</b></li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);"><b>Closure</b></div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;"><b>Laced</b></li></ul></li></ul>', '1.jpeg', '2.jpeg', '3.jpeg', 0, 'In Stock', '2017-03-10 20:19:22', ''),
(21, 7, 13, 'Tomato', 'D-mart', 90, 150, 'fresh and farmed', 'tomato.jpg', 'tomato.jpg', 'tomato.jpg', 20, 'In Stock', '2018-09-05 06:24:08', NULL),
(23, 4, 4, 'oppo', 'oppo', 12999, 14990, '<ol><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5.5 inch Full HD Display<br></li><li>13MP Primary Camera | 5MP Front<br></li><li>4100 mAh Li-Polymer Battery<br></li><li>Qualcomm Snapdragon 625 64-bit Processor</li></ol>', 'oppo1.jpeg', 'oppo2.jpeg', 'oppo3.jpeg', 0, 'In Stock', '2018-11-22 07:20:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `id` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `Address1` varchar(255) NOT NULL,
  `Address2` varchar(255) NOT NULL,
  `country` char(30) NOT NULL,
  `state` char(30) NOT NULL,
  `city` char(30) NOT NULL,
  `postalcode` int(15) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`id`, `userId`, `Address1`, `Address2`, `country`, `state`, `city`, `postalcode`, `phone`) VALUES
(45, 1, 'e101 millenium', 'residency', 'India', 'Gujarat', 'surat', 395009, '9687799817'),
(46, 56, 'plot 808/1 sector 6c', 'near Sant rohitdas temple', 'India', 'Gujarat', 'Gandhinagar', 395009, '8974567214');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 4, 'Led Television', '2017-01-26 16:24:52', '26-01-2017 11:03:40 PM'),
(3, 4, 'Television', '2017-01-26 16:29:09', ''),
(4, 4, 'Mobiles', '2017-01-30 16:55:48', ''),
(5, 4, 'Mobile Accessories', '2017-02-04 04:12:40', ''),
(6, 4, 'Laptops', '2017-02-04 04:13:00', ''),
(7, 4, 'Computers', '2017-02-04 04:13:27', ''),
(8, 3, 'Comics', '2017-02-04 04:13:54', ''),
(9, 5, 'Beds', '2017-02-04 04:36:45', ''),
(10, 5, 'Sofas', '2017-02-04 04:37:02', ''),
(11, 5, 'Dining Tables', '2017-02-04 04:37:51', ''),
(12, 6, 'Men Footwears', '2017-03-10 20:12:59', ''),
(13, 7, 'vegetables', '2018-09-05 06:20:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `name` char(30) NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `confirmpassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `name`, `username`, `email`, `password`, `confirmpassword`) VALUES
(1, 'harshbhatt', 'harsh6768', '14bit008@nirmauni.ac.in', 'bhatt6768', 'bhatt6768'),
(5, 'vishal sailor', 'sailor7', 'vishal234@gmail.com', 'sailor123', 'sailor123'),
(7, 'payal prajapati', 'payal123', 'payal.prajapati@gmail.com', 'payal123', 'payal123'),
(9, 'Dvijesh', 'Bhatt', 'dvijesh.bhatt@nirmauni.ac.in', 'dvijesh123', 'dvijesh123'),
(22, 'Riv nehariwala', 'Riva', 'riv5432@gmail.com', 'riv123', 'riv123'),
(23, 'abhay', 'abhay123', 'abhayrathod8@gmail.com', 'abha', 'abha'),
(52, 'Yash', 'Yash123', 'yash@gmail.com', 'bhatt', 'bhatt'),
(54, 'akhilesh', 'ladha', 'akhilesh.ladha@nirmauni.ac.in', 'akhilesh123', 'akhilesh123'),
(56, 'utsav', 'oza', 'oza@123.com', '123', '123'),
(58, 'Raj', 'Rajjani', 'rajjani@gmail.com', 'raj123', 'raj123'),
(60, 'dev', 'dev', 'dev@gmail.com', 'dev12', 'dev123');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-16 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2018-04-29 09:30:40', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Anuj Kumar', 'anuj.lpu1@gmail.com', 9009857868, 'f925916e2754e5e03f75dd58a5733251', 'CS New Delhi', 'New Delhi', 'Delhi', 110001, 'New Delhi', 'New Delhi', 'Delhi', 110092, '2017-02-04 19:30:50', ''),
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '', 0, '', '', '', 0, '2017-03-15 17:21:22', ''),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0, '', '', '', 0, '2018-04-29 09:30:32', '');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17');

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_commentmeta`
--

INSERT INTO `wp_commentmeta` (`meta_id`, `comment_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_trash_meta_status', '1'),
(2, 2, '_wp_trash_meta_time', '1540202431'),
(3, 9, '_wp_trash_meta_status', '1'),
(4, 9, '_wp_trash_meta_time', '1540218312'),
(5, 8, '_wp_trash_meta_status', '0'),
(6, 8, '_wp_trash_meta_time', '1540218314'),
(7, 7, '_wp_trash_meta_status', '1'),
(8, 7, '_wp_trash_meta_time', '1540218315'),
(9, 6, '_wp_trash_meta_status', '0'),
(10, 6, '_wp_trash_meta_time', '1540218317'),
(11, 5, '_wp_trash_meta_status', '0'),
(12, 5, '_wp_trash_meta_time', '1540218320'),
(13, 4, '_wp_trash_meta_status', '0'),
(14, 4, '_wp_trash_meta_time', '1540218321'),
(15, 3, '_wp_trash_meta_status', '0'),
(16, 3, '_wp_trash_meta_time', '1540218325');

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-09-02 16:45:45', '2018-09-02 16:45:45', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, 'post-trashed', '', '', 0, 0),
(2, 34, 'admin', '14bit008@nirmauni.ac.in', '', '::1', '2018-10-22 09:59:44', '2018-10-22 09:59:44', 'nice', 0, 'trash', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '', 0, 1),
(3, 31, '', '', '', '::1', '2018-10-22 14:13:49', '2018-10-22 14:13:49', 'good', 0, 'trash', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '', 0, 0),
(4, 31, 'harsh', 'harshbhatt1997@yahoo.in', '', '::1', '2018-10-22 14:14:25', '2018-10-22 14:14:25', 'good', 0, 'trash', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '', 0, 0),
(5, 31, 'harsh', '15bit016@nirmauni.ac.in', 'http://www.g.com', '::1', '2018-10-22 14:14:58', '2018-10-22 14:14:58', 'ggood', 0, 'trash', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '', 0, 0),
(6, 31, '', '', '', '::1', '2018-10-22 14:15:51', '2018-10-22 14:15:51', 'ijjjjj', 0, 'trash', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '', 0, 0),
(7, 25, 'h', '', 'http://h', '::1', '2018-10-22 14:16:56', '2018-10-22 14:16:56', 'h', 0, 'trash', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '', 0, 0),
(8, 25, '', '', '', '::1', '2018-10-22 14:19:24', '2018-10-22 14:19:24', 't', 0, 'trash', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '', 0, 0),
(9, 25, 'admin', '14bit008@nirmauni.ac.in', '', '::1', '2018-10-22 14:24:37', '2018-10-22 14:24:37', 'ok', 0, 'trash', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '', 7, 1),
(10, 25, 'harsh', '', '', '::1', '2018-10-22 14:26:29', '2018-10-22 14:26:29', 'is it free?', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '', 0, 0),
(11, 37, 'harsh', '', '', '::1', '2018-10-23 05:56:14', '2018-10-23 05:56:14', 'is it free?', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost:81/wordpress', 'yes'),
(2, 'home', 'http://localhost:81/wordpress', 'yes'),
(3, 'blogname', 'Build without &lt;Code/&gt; Blog', 'yes'),
(4, 'blogdescription', 'Free Video tutorial on how to Build website without writing Code', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', '14bit008@nirmauni.ac.in', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:147:{s:24:"^wc-auth/v([1]{1})/(.*)?";s:63:"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]";s:22:"^wc-api/v([1-3]{1})/?$";s:51:"index.php?wc-api-version=$matches[1]&wc-api-route=/";s:24:"^wc-api/v([1-3]{1})(.*)?";s:61:"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]";s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:32:"category/(.+?)/wc-api(/(.*))?/?$";s:54:"index.php?category_name=$matches[1]&wc-api=$matches[3]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:29:"tag/([^/]+)/wc-api(/(.*))?/?$";s:44:"index.php?tag=$matches[1]&wc-api=$matches[3]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:55:"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:50:"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:31:"product-category/(.+?)/embed/?$";s:44:"index.php?product_cat=$matches[1]&embed=true";s:43:"product-category/(.+?)/page/?([0-9]{1,})/?$";s:51:"index.php?product_cat=$matches[1]&paged=$matches[2]";s:25:"product-category/(.+?)/?$";s:33:"index.php?product_cat=$matches[1]";s:52:"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:47:"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:28:"product-tag/([^/]+)/embed/?$";s:44:"index.php?product_tag=$matches[1]&embed=true";s:40:"product-tag/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?product_tag=$matches[1]&paged=$matches[2]";s:22:"product-tag/([^/]+)/?$";s:33:"index.php?product_tag=$matches[1]";s:35:"product/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"product/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"product/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:24:"product/([^/]+)/embed/?$";s:40:"index.php?product=$matches[1]&embed=true";s:28:"product/([^/]+)/trackback/?$";s:34:"index.php?product=$matches[1]&tb=1";s:36:"product/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&paged=$matches[2]";s:43:"product/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&cpage=$matches[2]";s:33:"product/([^/]+)/wc-api(/(.*))?/?$";s:48:"index.php?product=$matches[1]&wc-api=$matches[3]";s:39:"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:50:"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:32:"product/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?product=$matches[1]&page=$matches[2]";s:24:"product/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"product/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"product/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:17:"wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:26:"comments/wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:29:"search/(.+)/wc-api(/(.*))?/?$";s:42:"index.php?s=$matches[1]&wc-api=$matches[3]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:32:"author/([^/]+)/wc-api(/(.*))?/?$";s:52:"index.php?author_name=$matches[1]&wc-api=$matches[3]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:54:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:82:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:41:"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:66:"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:28:"([0-9]{4})/wc-api(/(.*))?/?$";s:45:"index.php?year=$matches[1]&wc-api=$matches[3]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:25:"(.?.+?)/wc-api(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&wc-api=$matches[3]";s:28:"(.?.+?)/order-pay(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&order-pay=$matches[3]";s:33:"(.?.+?)/order-received(/(.*))?/?$";s:57:"index.php?pagename=$matches[1]&order-received=$matches[3]";s:25:"(.?.+?)/orders(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&orders=$matches[3]";s:29:"(.?.+?)/view-order(/(.*))?/?$";s:53:"index.php?pagename=$matches[1]&view-order=$matches[3]";s:28:"(.?.+?)/downloads(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&downloads=$matches[3]";s:31:"(.?.+?)/edit-account(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-account=$matches[3]";s:31:"(.?.+?)/edit-address(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-address=$matches[3]";s:34:"(.?.+?)/payment-methods(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&payment-methods=$matches[3]";s:32:"(.?.+?)/lost-password(/(.*))?/?$";s:56:"index.php?pagename=$matches[1]&lost-password=$matches[3]";s:34:"(.?.+?)/customer-logout(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&customer-logout=$matches[3]";s:37:"(.?.+?)/add-payment-method(/(.*))?/?$";s:61:"index.php?pagename=$matches[1]&add-payment-method=$matches[3]";s:40:"(.?.+?)/delete-payment-method(/(.*))?/?$";s:64:"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]";s:45:"(.?.+?)/set-default-payment-method(/(.*))?/?$";s:69:"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]";s:31:".?.+?/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:25:"([^/]+)/wc-api(/(.*))?/?$";s:45:"index.php?name=$matches[1]&wc-api=$matches[3]";s:31:"[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:53:"accesspress-social-share/accesspress-social-share.php";i:1;s:27:"woocommerce/woocommerce.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'alizee', 'yes'),
(41, 'stylesheet', 'alizee', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:6:{i:2;a:4:{s:5:"title";s:7:"Find Us";s:4:"text";s:168:"<strong>Address</strong>\n123 Main Street\nNew York, NY 10001\n\n<strong>Hours</strong>\nMonday&mdash;Friday: 9:00AM&ndash;5:00PM\nSaturday &amp; Sunday: 11:00AM&ndash;3:00PM";s:6:"filter";b:1;s:6:"visual";b:1;}i:3;a:4:{s:5:"title";s:15:"About This Site";s:4:"text";s:85:"This may be a good place to introduce yourself and your site or include some credits.";s:6:"filter";b:1;s:6:"visual";b:1;}i:4;a:4:{s:5:"title";s:7:"Find Us";s:4:"text";s:168:"<strong>Address</strong>\n123 Main Street\nNew York, NY 10001\n\n<strong>Hours</strong>\nMonday&mdash;Friday: 9:00AM&ndash;5:00PM\nSaturday &amp; Sunday: 11:00AM&ndash;3:00PM";s:6:"filter";b:1;s:6:"visual";b:1;}i:5;a:4:{s:5:"title";s:15:"About This Site";s:4:"text";s:85:"This may be a good place to introduce yourself and your site or include some credits.";s:6:"filter";b:1;s:6:"visual";b:1;}i:6;a:4:{s:5:"title";s:10:"Contact us";s:4:"text";s:105:"We''d love to hear from you! Drop us a line at\r\n\r\nEmail:contact@buildwithoutcode.com Mobile:+9196877999817";s:6:"filter";b:1;s:6:"visual";b:1;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '42', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '', 'yes'),
(93, 'initial_db_version', '38590', 'yes'),
(94, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:114:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:1:{s:4:"read";b:1;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop manager";s:12:"capabilities";a:92:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_users";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:3:{s:5:"title";s:15:"Recent Tutorial";s:6:"number";i:5;s:9:"show_date";b:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'sidebars_widgets', 'a:6:{s:19:"wp_inactive_widgets";a:4:{i:0;s:6:"text-2";i:1;s:6:"text-3";i:2;s:6:"text-4";i:3;s:6:"text-5";}s:9:"sidebar-1";a:3:{i:0;s:8:"search-2";i:1;s:21:"alizee_recent_posts-2";i:2;s:12:"categories-2";}s:9:"sidebar-3";a:1:{i:0;s:6:"text-6";}s:9:"sidebar-4";a:1:{i:0;s:10:"nav_menu-2";}s:9:"sidebar-5";a:1:{i:0;s:14:"recent-posts-2";}s:13:"array_version";i:3;}', 'yes'),
(102, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'widget_nav_menu', 'a:2:{i:2;a:2:{s:5:"title";s:9:"Follow us";s:8:"nav_menu";i:20;}s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(111, 'cron', 'a:12:{i:1540315231;a:1:{s:30:"woocommerce_tracker_send_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1540326021;a:1:{s:24:"woocommerce_cleanup_logs";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1540339200;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1541073600;a:1:{s:25:"woocommerce_geoip_updater";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:7:"monthly";s:4:"args";a:0:{}s:8:"interval";i:2635200;}}}i:1541083546;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1541084270;a:1:{s:32:"woocommerce_cancel_unpaid_orders";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1541090746;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1541092808;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1541092821;a:1:{s:33:"woocommerce_cleanup_personal_data";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1541114421;a:1:{s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1541150059;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(112, 'theme_mods_twentyseventeen', 'a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1540189602;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(116, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.9.8.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.9.8.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.9.8-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.9.8-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.9.8";s:7:"version";s:5:"4.9.8";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.7";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1541080672;s:15:"version_checked";s:5:"4.9.8";s:12:"translations";a:0:{}}', 'no'),
(124, 'can_compress_scripts', '1', 'no'),
(139, 'recently_activated', 'a:0:{}', 'yes'),
(143, 'woocommerce_store_address', '', 'yes'),
(144, 'woocommerce_store_address_2', '', 'yes'),
(145, 'woocommerce_store_city', '', 'yes'),
(146, 'woocommerce_default_country', 'GB', 'yes'),
(147, 'woocommerce_store_postcode', '', 'yes'),
(148, 'woocommerce_allowed_countries', 'all', 'yes'),
(149, 'woocommerce_all_except_countries', '', 'yes'),
(150, 'woocommerce_specific_allowed_countries', '', 'yes'),
(151, 'woocommerce_ship_to_countries', '', 'yes'),
(152, 'woocommerce_specific_ship_to_countries', '', 'yes'),
(153, 'woocommerce_default_customer_address', 'geolocation', 'yes'),
(154, 'woocommerce_calc_taxes', 'no', 'yes'),
(155, 'woocommerce_enable_coupons', 'yes', 'yes'),
(156, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(157, 'woocommerce_currency', 'GBP', 'yes'),
(158, 'woocommerce_currency_pos', 'left', 'yes'),
(159, 'woocommerce_price_thousand_sep', ',', 'yes'),
(160, 'woocommerce_price_decimal_sep', '.', 'yes'),
(161, 'woocommerce_price_num_decimals', '2', 'yes'),
(162, 'woocommerce_shop_page_id', '', 'yes'),
(163, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(164, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(165, 'woocommerce_weight_unit', 'kg', 'yes'),
(166, 'woocommerce_dimension_unit', 'cm', 'yes'),
(167, 'woocommerce_enable_reviews', 'yes', 'yes'),
(168, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(169, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(170, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(171, 'woocommerce_review_rating_required', 'yes', 'no'),
(172, 'woocommerce_manage_stock', 'yes', 'yes'),
(173, 'woocommerce_hold_stock_minutes', '60', 'no'),
(174, 'woocommerce_notify_low_stock', 'yes', 'no'),
(175, 'woocommerce_notify_no_stock', 'yes', 'no'),
(176, 'woocommerce_stock_email_recipient', '14bit008@nirmauni.ac.in', 'no'),
(177, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(178, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(179, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(180, 'woocommerce_stock_format', '', 'yes'),
(181, 'woocommerce_file_download_method', 'force', 'no'),
(182, 'woocommerce_downloads_require_login', 'no', 'no'),
(183, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(184, 'woocommerce_prices_include_tax', 'no', 'yes'),
(185, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(186, 'woocommerce_shipping_tax_class', 'inherit', 'yes'),
(187, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(188, 'woocommerce_tax_classes', 'Reduced rate\r\nZero rate', 'yes'),
(189, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(190, 'woocommerce_tax_display_cart', 'excl', 'yes'),
(191, 'woocommerce_price_display_suffix', '', 'yes'),
(192, 'woocommerce_tax_total_display', 'itemized', 'no'),
(193, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(194, 'woocommerce_shipping_cost_requires_address', 'no', 'yes'),
(195, 'woocommerce_ship_to_destination', 'billing', 'no'),
(196, 'woocommerce_shipping_debug_mode', 'no', 'yes'),
(197, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(198, 'woocommerce_enable_checkout_login_reminder', 'no', 'no'),
(199, 'woocommerce_enable_signup_and_login_from_checkout', 'no', 'no'),
(200, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(201, 'woocommerce_registration_generate_username', 'yes', 'no'),
(202, 'woocommerce_registration_generate_password', 'yes', 'no'),
(203, 'woocommerce_erasure_request_removes_order_data', 'no', 'no'),
(204, 'woocommerce_erasure_request_removes_download_data', 'no', 'no'),
(205, 'woocommerce_registration_privacy_policy_text', 'Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].', 'yes'),
(206, 'woocommerce_checkout_privacy_policy_text', 'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].', 'yes'),
(207, 'woocommerce_delete_inactive_accounts', 'a:2:{s:6:"number";s:0:"";s:4:"unit";s:6:"months";}', 'no'),
(208, 'woocommerce_trash_pending_orders', '', 'no'),
(209, 'woocommerce_trash_failed_orders', '', 'no'),
(210, 'woocommerce_trash_cancelled_orders', '', 'no'),
(211, 'woocommerce_anonymize_completed_orders', 'a:2:{s:6:"number";s:0:"";s:4:"unit";s:6:"months";}', 'no'),
(212, 'woocommerce_email_from_name', 'mystore', 'no'),
(213, 'woocommerce_email_from_address', '14bit008@nirmauni.ac.in', 'no'),
(214, 'woocommerce_email_header_image', '', 'no'),
(215, 'woocommerce_email_footer_text', '{site_title}', 'no'),
(216, 'woocommerce_email_base_color', '#96588a', 'no'),
(217, 'woocommerce_email_background_color', '#f7f7f7', 'no'),
(218, 'woocommerce_email_body_background_color', '#ffffff', 'no'),
(219, 'woocommerce_email_text_color', '#3c3c3c', 'no'),
(220, 'woocommerce_cart_page_id', '', 'yes'),
(221, 'woocommerce_checkout_page_id', '', 'yes'),
(222, 'woocommerce_myaccount_page_id', '', 'yes'),
(223, 'woocommerce_terms_page_id', '', 'no'),
(224, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(225, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(226, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(227, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(228, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(229, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(230, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(231, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(232, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(233, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(234, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(235, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(236, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(237, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(238, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(239, 'woocommerce_api_enabled', 'no', 'yes'),
(240, 'woocommerce_single_image_width', '600', 'yes'),
(241, 'woocommerce_thumbnail_image_width', '300', 'yes'),
(242, 'woocommerce_checkout_highlight_required_fields', 'yes', 'yes'),
(243, 'woocommerce_demo_store', 'no', 'no'),
(244, 'woocommerce_permalinks', 'a:5:{s:12:"product_base";s:7:"product";s:13:"category_base";s:16:"product-category";s:8:"tag_base";s:11:"product-tag";s:14:"attribute_base";s:0:"";s:22:"use_verbose_page_rules";b:1;}', 'yes'),
(245, 'current_theme_supports_woocommerce', 'no', 'yes'),
(246, 'woocommerce_queue_flush_rewrite_rules', 'no', 'yes'),
(247, '_transient_wc_attribute_taxonomies', 'a:0:{}', 'yes'),
(249, 'default_product_cat', '15', 'yes'),
(252, 'woocommerce_version', '3.4.5', 'yes'),
(253, 'woocommerce_db_version', '3.4.5', 'yes'),
(254, 'woocommerce_admin_notices', 'a:1:{i:0;s:20:"no_secure_connection";}', 'yes'),
(255, '_transient_woocommerce_webhook_ids', 'a:0:{}', 'yes'),
(256, 'widget_woocommerce_widget_cart', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(257, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(258, 'widget_woocommerce_layered_nav', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(259, 'widget_woocommerce_price_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(260, 'widget_woocommerce_product_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(261, 'widget_woocommerce_product_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(262, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(263, 'widget_woocommerce_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(264, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(265, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(266, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(267, 'widget_woocommerce_rating_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(270, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(440, 'product_cat_children', 'a:0:{}', 'yes'),
(443, '_transient_product_query-transient-version', '1537090374', 'yes'),
(444, '_transient_product-transient-version', '1537090374', 'yes'),
(590, '_transient_timeout_wc_low_stock_count', '1542780012', 'no'),
(591, '_transient_wc_low_stock_count', '0', 'no'),
(592, '_transient_timeout_wc_outofstock_count', '1542780012', 'no'),
(593, '_transient_wc_outofstock_count', '0', 'no'),
(616, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1541080682;s:7:"checked";a:6:{s:6:"alizee";s:4:"1.08";s:10:"spicepress";s:5:"1.5.1";s:5:"stacy";s:5:"1.2.4";s:13:"twentyfifteen";s:3:"2.0";s:15:"twentyseventeen";s:3:"1.7";s:13:"twentysixteen";s:3:"1.5";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'no'),
(617, 'current_theme', 'Alizee', 'yes'),
(618, 'theme_mods_alizee', 'a:14:{i:0;b:0;s:18:"nav_menu_locations";a:2:{s:6:"social";i:20;s:7:"primary";i:21;}s:18:"custom_css_post_id";i:-1;s:13:"primary_color";s:7:"#e96655";s:12:"header_image";s:130:"http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2.jpg";s:17:"header_image_data";O:8:"stdClass":5:{s:13:"attachment_id";i:54;s:3:"url";s:130:"http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2.jpg";s:13:"thumbnail_url";s:130:"http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2.jpg";s:6:"height";i:714;s:5:"width";i:1920;}s:9:"site_logo";s:0:"";s:12:"site_favicon";s:0:"";s:15:"alizee_scroller";s:0:"";s:14:"headings_fonts";s:32:"Arvo:400,700,400italic,700italic";s:16:"background_color";s:6:"ededed";s:10:"menu_color";s:7:"#3c3c3c";s:16:"site_title_color";s:7:"#e96655";s:15:"site_desc_color";s:7:"#230f00";}', 'yes'),
(619, 'theme_switched', '', 'yes'),
(620, 'woocommerce_maybe_regenerate_images_hash', '991b1ca641921cf0f5baf7a2fe85861b', 'yes'),
(630, 'widget_alizee_recent_posts', 'a:3:{i:1;a:0:{}i:2;a:3:{s:5:"title";s:16:"Recent Tutorials";s:6:"number";s:1:"5";s:9:"show_date";b:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(631, 'widget_alizee_video_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(634, 'WPLANG', '', 'yes'),
(635, 'new_admin_email', '14bit008@nirmauni.ac.in', 'yes'),
(658, 'category_children', 'a:0:{}', 'yes'),
(674, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(690, 'apss_share_settings', 'a:18:{s:13:"share_options";a:1:{i:0;s:4:"post";}s:15:"social_icon_set";s:1:"2";s:15:"share_positions";s:7:"on_both";s:15:"social_networks";a:8:{s:8:"facebook";i:1;s:7:"twitter";i:1;s:11:"google-plus";i:1;s:8:"linkedin";i:1;s:9:"pinterest";i:0;s:4:"digg";i:0;s:5:"email";i:0;s:5:"print";i:0;}s:23:"disable_frontend_assets";s:1:"0";s:10:"share_text";s:0:"";s:16:"twitter_username";s:0:"";s:22:"counter_enable_options";s:1:"0";s:19:"twitter_counter_api";s:1:"1";s:17:"api_configuration";a:1:{s:8:"facebook";a:2:{s:6:"app_id";s:0:"";s:10:"app_secret";s:0:"";}}s:28:"total_counter_enable_options";s:1:"0";s:17:"enable_http_count";s:1:"0";s:12:"enable_cache";s:1:"1";s:12:"cache_period";s:2:"24";s:18:"dialog_box_options";s:1:"1";s:18:"apss_email_subject";s:30:"Please visit this link %%url%%";s:15:"apss_email_body";s:110:"Hey Buddy!, I found this information for you: "%%title%%". Here is the website link: %%permalink%%. Thank you.";s:29:"apss_social_counts_transients";a:0:{}}', 'yes'),
(691, 'apss_social_counts_transients', 'a:16:{i:0;s:35:"fb_de4bfa25f770319b4785b23c19d7f4b3";i:1;s:40:"twitter_de4bfa25f770319b4785b23c19d7f4b3";i:2;s:35:"gp_de4bfa25f770319b4785b23c19d7f4b3";i:3;s:41:"linkedin_de4bfa25f770319b4785b23c19d7f4b3";i:4;s:35:"fb_f619777b6cc886cbedb9e7f062373202";i:5;s:40:"twitter_f619777b6cc886cbedb9e7f062373202";i:6;s:35:"gp_f619777b6cc886cbedb9e7f062373202";i:7;s:41:"linkedin_f619777b6cc886cbedb9e7f062373202";i:8;s:35:"fb_66e751cbc4d41245c3510db5dd5ecb3d";i:9;s:40:"twitter_66e751cbc4d41245c3510db5dd5ecb3d";i:10;s:35:"gp_66e751cbc4d41245c3510db5dd5ecb3d";i:11;s:41:"linkedin_66e751cbc4d41245c3510db5dd5ecb3d";i:12;s:35:"fb_c588a6c6c8675b726b8567e28191b9a3";i:13;s:40:"twitter_c588a6c6c8675b726b8567e28191b9a3";i:14;s:35:"gp_c588a6c6c8675b726b8567e28191b9a3";i:15;s:41:"linkedin_c588a6c6c8675b726b8567e28191b9a3";}', 'yes'),
(712, '_transient_shipping-transient-version', '1540203453', 'yes'),
(739, '_transient_is_multi_author', '0', 'yes'),
(749, '_transient_alizee_categories', '2', 'yes'),
(778, '_transient_wc_count_comments', 'O:8:"stdClass":7:{s:14:"total_comments";i:2;s:3:"all";i:2;s:8:"approved";s:1:"2";s:12:"post-trashed";s:1:"1";s:5:"trash";s:1:"8";s:9:"moderated";i:0;s:4:"spam";i:0;}', 'yes'),
(785, '_transient_timeout_external_ip_address_::1', '1541685469', 'no'),
(786, '_transient_external_ip_address_::1', '49.34.114.135', 'no'),
(788, '_transient_timeout_wc_related_17', '1541167072', 'no'),
(789, '_transient_wc_related_17', 'a:1:{s:50:"limit=5&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=17";a:0:{}}', 'no'),
(790, '_transient_timeout_wc_related_15', '1541167072', 'no'),
(791, '_transient_wc_related_15', 'a:1:{s:50:"limit=5&exclude_ids%5B0%5D=0&exclude_ids%5B1%5D=15";a:0:{}}', 'no'),
(794, '_site_transient_timeout_theme_roots', '1541082479', 'no'),
(795, '_site_transient_theme_roots', 'a:6:{s:6:"alizee";s:7:"/themes";s:10:"spicepress";s:7:"/themes";s:5:"stacy";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:15:"twentyseventeen";s:7:"/themes";s:13:"twentysixteen";s:7:"/themes";}', 'no'),
(796, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1541080684;s:7:"checked";a:4:{s:19:"akismet/akismet.php";s:5:"4.0.8";s:9:"hello.php";s:3:"1.7";s:53:"accesspress-social-share/accesspress-social-share.php";s:5:"4.4.0";s:27:"woocommerce/woocommerce.php";s:5:"3.4.5";}s:8:"response";a:1:{s:27:"woocommerce/woocommerce.php";O:8:"stdClass":12:{s:2:"id";s:25:"w.org/plugins/woocommerce";s:4:"slug";s:11:"woocommerce";s:6:"plugin";s:27:"woocommerce/woocommerce.php";s:11:"new_version";s:5:"3.5.1";s:3:"url";s:42:"https://wordpress.org/plugins/woocommerce/";s:7:"package";s:60:"https://downloads.wordpress.org/plugin/woocommerce.3.5.1.zip";s:5:"icons";a:2:{s:2:"2x";s:64:"https://ps.w.org/woocommerce/assets/icon-256x256.png?rev=1440831";s:2:"1x";s:64:"https://ps.w.org/woocommerce/assets/icon-128x128.png?rev=1440831";}s:7:"banners";a:2:{s:2:"2x";s:67:"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=1629184";s:2:"1x";s:66:"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=1629184";}s:11:"banners_rtl";a:0:{}s:6:"tested";s:5:"4.9.8";s:12:"requires_php";b:0;s:13:"compatibility";O:8:"stdClass":0:{}}}s:12:"translations";a:0:{}s:9:"no_update";a:3:{s:19:"akismet/akismet.php";O:8:"stdClass":9:{s:2:"id";s:21:"w.org/plugins/akismet";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"4.0.8";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.4.0.8.zip";s:5:"icons";a:2:{s:2:"2x";s:59:"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272";s:2:"1x";s:59:"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272";}s:7:"banners";a:1:{s:2:"1x";s:61:"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904";}s:11:"banners_rtl";a:0:{}}s:9:"hello.php";O:8:"stdClass":9:{s:2:"id";s:25:"w.org/plugins/hello-dolly";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";s:5:"icons";a:2:{s:2:"2x";s:63:"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907";s:2:"1x";s:63:"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907";}s:7:"banners";a:1:{s:2:"1x";s:65:"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342";}s:11:"banners_rtl";a:0:{}}s:53:"accesspress-social-share/accesspress-social-share.php";O:8:"stdClass":9:{s:2:"id";s:38:"w.org/plugins/accesspress-social-share";s:4:"slug";s:24:"accesspress-social-share";s:6:"plugin";s:53:"accesspress-social-share/accesspress-social-share.php";s:11:"new_version";s:5:"4.4.0";s:3:"url";s:55:"https://wordpress.org/plugins/accesspress-social-share/";s:7:"package";s:73:"https://downloads.wordpress.org/plugin/accesspress-social-share.4.4.0.zip";s:5:"icons";a:2:{s:2:"2x";s:77:"https://ps.w.org/accesspress-social-share/assets/icon-256x256.jpg?rev=1338635";s:2:"1x";s:77:"https://ps.w.org/accesspress-social-share/assets/icon-128x128.jpg?rev=1338635";}s:7:"banners";a:2:{s:2:"2x";s:80:"https://ps.w.org/accesspress-social-share/assets/banner-1544x500.jpg?rev=1338635";s:2:"1x";s:79:"https://ps.w.org/accesspress-social-share/assets/banner-772x250.jpg?rev=1338635";}s:11:"banners_rtl";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(29, 14, '_wp_attached_file', '2018/09/25.jpg'),
(30, 14, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1440;s:6:"height";i:670;s:4:"file";s:14:"2018/09/25.jpg";s:5:"sizes";a:11:{s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:14:"25-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:18:"woocommerce_single";a:4:{s:4:"file";s:14:"25-600x279.jpg";s:5:"width";i:600;s:6:"height";i:279;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:14:"25-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:14:"25-300x140.jpg";s:5:"width";i:300;s:6:"height";i:140;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:14:"25-768x357.jpg";s:5:"width";i:768;s:6:"height";i:357;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:15:"25-1024x476.jpg";s:5:"width";i:1024;s:6:"height";i:476;s:9:"mime-type";s:10:"image/jpeg";}s:32:"twentyseventeen-thumbnail-avatar";a:4:{s:4:"file";s:14:"25-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:14:"25-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:5:{s:4:"file";s:14:"25-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:11:"shop_single";a:4:{s:4:"file";s:14:"25-600x279.jpg";s:5:"width";i:600;s:6:"height";i:279;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:14:"25-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(31, 15, '_wc_review_count', '0'),
(32, 15, '_wc_rating_count', 'a:0:{}'),
(33, 15, '_wc_average_rating', '0'),
(34, 15, '_edit_last', '1'),
(35, 15, '_edit_lock', '1538213703:1'),
(36, 16, '_wp_attached_file', '2018/09/music.jpg'),
(37, 16, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1000;s:6:"height";i:1000;s:4:"file";s:17:"2018/09/music.jpg";s:5:"sizes";a:10:{s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:17:"music-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:18:"woocommerce_single";a:4:{s:4:"file";s:17:"music-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:17:"music-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:17:"music-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:17:"music-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:32:"twentyseventeen-thumbnail-avatar";a:4:{s:4:"file";s:17:"music-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:17:"music-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:5:{s:4:"file";s:17:"music-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:11:"shop_single";a:4:{s:4:"file";s:17:"music-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:17:"music-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(38, 16, '_wp_attachment_image_alt', 'music'),
(39, 15, '_thumbnail_id', '16'),
(40, 15, '_sku', ''),
(41, 15, '_regular_price', '150'),
(42, 15, '_sale_price', ''),
(43, 15, '_sale_price_dates_from', ''),
(44, 15, '_sale_price_dates_to', ''),
(45, 15, 'total_sales', '0'),
(46, 15, '_tax_status', 'taxable'),
(47, 15, '_tax_class', ''),
(48, 15, '_manage_stock', 'no'),
(49, 15, '_backorders', 'no'),
(50, 15, '_sold_individually', 'no'),
(51, 15, '_weight', ''),
(52, 15, '_length', ''),
(53, 15, '_width', ''),
(54, 15, '_height', ''),
(55, 15, '_upsell_ids', 'a:0:{}'),
(56, 15, '_crosssell_ids', 'a:0:{}'),
(57, 15, '_purchase_note', ''),
(58, 15, '_default_attributes', 'a:0:{}'),
(59, 15, '_virtual', 'no'),
(60, 15, '_downloadable', 'no'),
(61, 15, '_product_image_gallery', ''),
(62, 15, '_download_limit', '-1'),
(63, 15, '_download_expiry', '-1'),
(64, 15, '_stock', NULL),
(65, 15, '_stock_status', 'instock'),
(66, 15, '_product_version', '3.4.5'),
(67, 15, '_price', '150'),
(68, 17, '_wc_review_count', '0'),
(69, 17, '_wc_rating_count', 'a:0:{}'),
(70, 17, '_wc_average_rating', '0'),
(71, 17, '_edit_last', '1'),
(72, 17, '_edit_lock', '1538216963:1'),
(73, 18, '_wp_attached_file', '2018/09/clothing.jpg'),
(74, 18, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1000;s:6:"height";i:1000;s:4:"file";s:20:"2018/09/clothing.jpg";s:5:"sizes";a:10:{s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"clothing-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"clothing-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"clothing-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"clothing-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"clothing-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:32:"twentyseventeen-thumbnail-avatar";a:4:{s:4:"file";s:20:"clothing-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"clothing-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:5:{s:4:"file";s:20:"clothing-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:11:"shop_single";a:4:{s:4:"file";s:20:"clothing-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"clothing-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(75, 17, '_thumbnail_id', '18'),
(76, 17, '_sku', ''),
(77, 17, '_regular_price', '200'),
(78, 17, '_sale_price', ''),
(79, 17, '_sale_price_dates_from', ''),
(80, 17, '_sale_price_dates_to', ''),
(81, 17, 'total_sales', '0'),
(82, 17, '_tax_status', 'taxable'),
(83, 17, '_tax_class', ''),
(84, 17, '_manage_stock', 'no'),
(85, 17, '_backorders', 'no'),
(86, 17, '_sold_individually', 'no'),
(87, 17, '_weight', ''),
(88, 17, '_length', ''),
(89, 17, '_width', ''),
(90, 17, '_height', ''),
(91, 17, '_upsell_ids', 'a:0:{}'),
(92, 17, '_crosssell_ids', 'a:0:{}'),
(93, 17, '_purchase_note', ''),
(94, 17, '_default_attributes', 'a:0:{}'),
(95, 17, '_virtual', 'no'),
(96, 17, '_downloadable', 'no'),
(97, 17, '_product_image_gallery', ''),
(98, 17, '_download_limit', '-1'),
(99, 17, '_download_expiry', '-1'),
(100, 17, '_stock', NULL),
(101, 17, '_stock_status', 'instock'),
(102, 17, '_product_version', '3.4.5'),
(103, 17, '_price', '200'),
(104, 21, '_edit_last', '1'),
(105, 21, '_edit_lock', '1540195449:1'),
(106, 21, '_oembed_a83ec41182f770baaa5882bf1c2fd790', '<iframe width="995" height="560" src="https://www.youtube.com/embed/rUQUoxvo27E?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(107, 21, '_oembed_time_a83ec41182f770baaa5882bf1c2fd790', '1540191899'),
(108, 22, '_wp_attached_file', '2018/10/Capture.jpg'),
(109, 22, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2358;s:6:"height";i:1097;s:4:"file";s:19:"2018/10/Capture.jpg";s:5:"sizes";a:11:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"Capture-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:19:"Capture-300x140.jpg";s:5:"width";i:300;s:6:"height";i:140;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:19:"Capture-768x357.jpg";s:5:"width";i:768;s:6:"height";i:357;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:20:"Capture-1024x476.jpg";s:5:"width";i:1024;s:6:"height";i:476;s:9:"mime-type";s:10:"image/jpeg";}s:12:"alizee-thumb";a:4:{s:4:"file";s:19:"Capture-750x349.jpg";s:5:"width";i:750;s:6:"height";i:349;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:19:"Capture-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:18:"woocommerce_single";a:4:{s:4:"file";s:19:"Capture-600x279.jpg";s:5:"width";i:600;s:6:"height";i:279;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:19:"Capture-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"Capture-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"Capture-600x279.jpg";s:5:"width";i:600;s:6:"height";i:279;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:19:"Capture-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:9:"bhatt9697";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1540213642";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(110, 21, '_thumbnail_id', '30'),
(112, 21, '_oembed_f97c9413a2aac6a7f7f14bbac7f702a4', '<iframe width="1170" height="658" src="https://www.youtube.com/embed/rUQUoxvo27E?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(113, 21, '_oembed_time_f97c9413a2aac6a7f7f14bbac7f702a4', '1540194050'),
(114, 21, '_oembed_9f17c41469f8985dfd4c8192677f5c32', '<iframe width="999" height="562" src="https://www.youtube.com/embed/rUQUoxvo27E?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(115, 21, '_oembed_time_9f17c41469f8985dfd4c8192677f5c32', '1540194051'),
(117, 25, '_edit_last', '1'),
(118, 25, '_edit_lock', '1540195352:1'),
(119, 25, '_oembed_731afb031ac9294a3b2dde78fe88db9c', '<iframe width="995" height="560" src="https://www.youtube.com/embed/cW2-HqWLfjA?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(120, 25, '_oembed_time_731afb031ac9294a3b2dde78fe88db9c', '1540194989'),
(121, 26, '_wp_attached_file', '2018/10/Capture2.jpg'),
(122, 26, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1745;s:6:"height";i:992;s:4:"file";s:20:"2018/10/Capture2.jpg";s:5:"sizes";a:11:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"Capture2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"Capture2-300x171.jpg";s:5:"width";i:300;s:6:"height";i:171;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"Capture2-768x437.jpg";s:5:"width";i:768;s:6:"height";i:437;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:21:"Capture2-1024x582.jpg";s:5:"width";i:1024;s:6:"height";i:582;s:9:"mime-type";s:10:"image/jpeg";}s:12:"alizee-thumb";a:4:{s:4:"file";s:20:"Capture2-750x426.jpg";s:5:"width";i:750;s:6:"height";i:426;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"Capture2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"Capture2-600x341.jpg";s:5:"width";i:600;s:6:"height";i:341;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"Capture2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"Capture2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"Capture2-600x341.jpg";s:5:"width";i:600;s:6:"height";i:341;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"Capture2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:9:"bhatt9697";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1540214931";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(123, 25, '_thumbnail_id', '28'),
(125, 25, '_oembed_d142917b575697b028095eb3884f9e57', '<iframe width="1170" height="658" src="https://www.youtube.com/embed/cW2-HqWLfjA?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(126, 25, '_oembed_time_d142917b575697b028095eb3884f9e57', '1540195184'),
(127, 25, '_oembed_b411a0544b027231a0ddf7fcf688229c', '<iframe width="999" height="562" src="https://www.youtube.com/embed/cW2-HqWLfjA?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(128, 25, '_oembed_time_b411a0544b027231a0ddf7fcf688229c', '1540195184'),
(129, 28, '_wp_attached_file', '2018/10/home-office-438386_1920.jpg'),
(130, 28, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:450;s:6:"height";i:450;s:4:"file";s:35:"2018/10/home-office-438386_1920.jpg";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:35:"home-office-438386_1920-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:35:"home-office-438386_1920-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:35:"home-office-438386_1920-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:35:"home-office-438386_1920-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:35:"home-office-438386_1920-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:35:"home-office-438386_1920-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(132, 30, '_wp_attached_file', '2018/10/How-to-Make-a-Single-Page-Website-for-Freelancers-Agencies-Businesses.jpeg'),
(133, 30, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:450;s:6:"height";i:450;s:4:"file";s:82:"2018/10/How-to-Make-a-Single-Page-Website-for-Freelancers-Agencies-Businesses.jpeg";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:82:"How-to-Make-a-Single-Page-Website-for-Freelancers-Agencies-Businesses-150x150.jpeg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:82:"How-to-Make-a-Single-Page-Website-for-Freelancers-Agencies-Businesses-300x300.jpeg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:82:"How-to-Make-a-Single-Page-Website-for-Freelancers-Agencies-Businesses-300x300.jpeg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:82:"How-to-Make-a-Single-Page-Website-for-Freelancers-Agencies-Businesses-100x100.jpeg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:82:"How-to-Make-a-Single-Page-Website-for-Freelancers-Agencies-Businesses-300x300.jpeg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:82:"How-to-Make-a-Single-Page-Website-for-Freelancers-Agencies-Businesses-100x100.jpeg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(135, 31, '_edit_last', '1'),
(136, 31, '_edit_lock', '1540196079:1'),
(137, 31, '_oembed_efaf630e83ac7c55afc8c883899e2fb1', '<iframe width="995" height="560" src="https://www.youtube.com/embed/-wjWmyw5jAY?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(138, 31, '_oembed_time_efaf630e83ac7c55afc8c883899e2fb1', '1540195779'),
(139, 32, '_wp_attached_file', '2018/10/download.png'),
(140, 32, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:280;s:6:"height";i:180;s:4:"file";s:20:"2018/10/download.png";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"download-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"download-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"download-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(141, 31, '_thumbnail_id', '32'),
(143, 31, '_oembed_25aa88fad7134af5eeed957034d31a0a', '<iframe width="1170" height="658" src="https://www.youtube.com/embed/-wjWmyw5jAY?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(144, 31, '_oembed_time_25aa88fad7134af5eeed957034d31a0a', '1540195999'),
(145, 31, '_oembed_215bc3bdaf0ca7f46d8791cdb6e05c45', '<iframe width="999" height="562" src="https://www.youtube.com/embed/-wjWmyw5jAY?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(146, 31, '_oembed_time_215bc3bdaf0ca7f46d8791cdb6e05c45', '1540195999'),
(147, 34, '_edit_last', '1'),
(148, 34, '_edit_lock', '1540202519:1'),
(149, 34, '_oembed_3291185e5138d44a65e12a1792657383', '<iframe width="995" height="560" src="https://www.youtube.com/embed/3CvqRjQiapo?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(150, 34, '_oembed_time_3291185e5138d44a65e12a1792657383', '1540196333'),
(151, 35, '_wp_attached_file', '2018/10/How-to-Make-an-Online-Portfolio-Website-from-Scratch-For-Photographers-Designers-etc..jpeg'),
(152, 35, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:450;s:6:"height";i:450;s:4:"file";s:98:"2018/10/How-to-Make-an-Online-Portfolio-Website-from-Scratch-For-Photographers-Designers-etc..jpeg";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:98:"How-to-Make-an-Online-Portfolio-Website-from-Scratch-For-Photographers-Designers-etc.-150x150.jpeg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:98:"How-to-Make-an-Online-Portfolio-Website-from-Scratch-For-Photographers-Designers-etc.-300x300.jpeg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:98:"How-to-Make-an-Online-Portfolio-Website-from-Scratch-For-Photographers-Designers-etc.-300x300.jpeg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:98:"How-to-Make-an-Online-Portfolio-Website-from-Scratch-For-Photographers-Designers-etc.-100x100.jpeg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:98:"How-to-Make-an-Online-Portfolio-Website-from-Scratch-For-Photographers-Designers-etc.-300x300.jpeg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:98:"How-to-Make-an-Online-Portfolio-Website-from-Scratch-For-Photographers-Designers-etc.-100x100.jpeg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(153, 34, '_thumbnail_id', '35'),
(155, 34, '_oembed_60ef1242f904c24351bf6b8cfccaf1a7', '<iframe width="1170" height="658" src="https://www.youtube.com/embed/3CvqRjQiapo?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(156, 34, '_oembed_time_60ef1242f904c24351bf6b8cfccaf1a7', '1540196405'),
(157, 34, '_oembed_f3767d628bb8f1e0c844f23ea690cc4d', '<iframe width="999" height="562" src="https://www.youtube.com/embed/3CvqRjQiapo?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(158, 34, '_oembed_time_f3767d628bb8f1e0c844f23ea690cc4d', '1540196405'),
(159, 37, '_oembed_6d5525bd73c31d7ced55a4abf72252d0', '<iframe width="995" height="560" src="https://www.youtube.com/embed/4fIV_fIiANU?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(160, 37, '_oembed_time_6d5525bd73c31d7ced55a4abf72252d0', '1540196629'),
(161, 37, '_edit_last', '1'),
(162, 37, '_edit_lock', '1540196582:1'),
(163, 38, '_wp_attached_file', '2018/10/C.jpg'),
(164, 38, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1721;s:6:"height";i:963;s:4:"file";s:13:"2018/10/C.jpg";s:5:"sizes";a:11:{s:9:"thumbnail";a:4:{s:4:"file";s:13:"C-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:13:"C-300x168.jpg";s:5:"width";i:300;s:6:"height";i:168;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:13:"C-768x430.jpg";s:5:"width";i:768;s:6:"height";i:430;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:14:"C-1024x573.jpg";s:5:"width";i:1024;s:6:"height";i:573;s:9:"mime-type";s:10:"image/jpeg";}s:12:"alizee-thumb";a:4:{s:4:"file";s:13:"C-750x420.jpg";s:5:"width";i:750;s:6:"height";i:420;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:13:"C-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:18:"woocommerce_single";a:4:{s:4:"file";s:13:"C-600x336.jpg";s:5:"width";i:600;s:6:"height";i:336;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:13:"C-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:13:"C-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:13:"C-600x336.jpg";s:5:"width";i:600;s:6:"height";i:336;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:13:"C-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:9:"bhatt9697";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1540216366";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(165, 37, '_thumbnail_id', '38'),
(167, 37, '_oembed_3a5cc3d7c1c8be522c501d1f89dceeb9', '<iframe width="1170" height="658" src="https://www.youtube.com/embed/4fIV_fIiANU?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(168, 37, '_oembed_time_3a5cc3d7c1c8be522c501d1f89dceeb9', '1540196699'),
(169, 37, '_oembed_966131881f0313fbb5ea25d09eeea2e6', '<iframe width="999" height="562" src="https://www.youtube.com/embed/4fIV_fIiANU?feature=oembed" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>'),
(170, 37, '_oembed_time_966131881f0313fbb5ea25d09eeea2e6', '1540196699'),
(171, 1, '_wp_trash_meta_status', 'publish'),
(172, 1, '_wp_trash_meta_time', '1540196741'),
(173, 1, '_wp_desired_post_slug', 'hello-world'),
(174, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:"1";}'),
(175, 41, '_wp_attached_file', '2018/10/cropped-site-icon.png'),
(176, 41, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:512;s:6:"height";i:512;s:4:"file";s:29:"2018/10/cropped-site-icon.png";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:29:"cropped-site-icon-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:29:"cropped-site-icon-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:29:"cropped-site-icon-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";s:9:"uncropped";b:1;}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:29:"cropped-site-icon-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:29:"cropped-site-icon-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:29:"cropped-site-icon-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(177, 42, '_wp_attached_file', '2018/10/cropped-cropped-site-icon.png'),
(178, 42, '_wp_attachment_context', 'site-icon'),
(179, 42, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:512;s:6:"height";i:512;s:4:"file";s:37:"2018/10/cropped-cropped-site-icon.png";s:5:"sizes";a:10:{s:9:"thumbnail";a:4:{s:4:"file";s:37:"cropped-cropped-site-icon-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:37:"cropped-cropped-site-icon-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:37:"cropped-cropped-site-icon-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";s:9:"uncropped";b:1;}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:37:"cropped-cropped-site-icon-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:37:"cropped-cropped-site-icon-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:37:"cropped-cropped-site-icon-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}s:13:"site_icon-270";a:4:{s:4:"file";s:37:"cropped-cropped-site-icon-270x270.png";s:5:"width";i:270;s:6:"height";i:270;s:9:"mime-type";s:9:"image/png";}s:13:"site_icon-192";a:4:{s:4:"file";s:37:"cropped-cropped-site-icon-192x192.png";s:5:"width";i:192;s:6:"height";i:192;s:9:"mime-type";s:9:"image/png";}s:13:"site_icon-180";a:4:{s:4:"file";s:37:"cropped-cropped-site-icon-180x180.png";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:9:"image/png";}s:12:"site_icon-32";a:4:{s:4:"file";s:35:"cropped-cropped-site-icon-32x32.png";s:5:"width";i:32;s:6:"height";i:32;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(180, 43, '_wp_trash_meta_status', 'publish'),
(181, 43, '_wp_trash_meta_time', '1540198017'),
(182, 44, '_edit_lock', '1540198087:1'),
(183, 44, '_wp_trash_meta_status', 'publish'),
(184, 44, '_wp_trash_meta_time', '1540198117'),
(185, 45, '_wp_attached_file', '2018/10/c700x420.jpg'),
(186, 45, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:700;s:6:"height";i:420;s:4:"file";s:20:"2018/10/c700x420.jpg";s:5:"sizes";a:8:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"c700x420-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"c700x420-300x180.jpg";s:5:"width";i:300;s:6:"height";i:180;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"c700x420-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"c700x420-600x360.jpg";s:5:"width";i:600;s:6:"height";i:360;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"c700x420-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"c700x420-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"c700x420-600x360.jpg";s:5:"width";i:600;s:6:"height";i:360;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"c700x420-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(187, 46, '_wp_attached_file', '2018/10/website_design_screen_en_istock-827896866.260x0-is.jpg'),
(188, 46, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:260;s:6:"height";i:173;s:4:"file";s:62:"2018/10/website_design_screen_en_istock-827896866.260x0-is.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:62:"website_design_screen_en_istock-827896866.260x0-is-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:62:"website_design_screen_en_istock-827896866.260x0-is-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:62:"website_design_screen_en_istock-827896866.260x0-is-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:24:"Getty Images/iStockphoto";s:6:"camera";s:0:"";s:7:"caption";s:98:"Web Design layout sketch drawing Software Media WWW and Graphic Layout Website development project";s:17:"created_timestamp";s:10:"1496847978";s:9:"copyright";s:37:"This content is subject to copyright.";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:98:"Web Design layout sketch drawing Software Media WWW and Graphic Layout Website development project";s:11:"orientation";s:1:"0";s:8:"keywords";a:50:{i:0;s:13:"brainstorming";i:1;s:8:"business";i:2;s:8:"computer";i:3;s:7:"concept";i:4;s:7:"content";i:5;s:6:"design";i:6;s:11:"development";i:7;s:7:"devices";i:8;s:7:"digital";i:9;s:7:"graphic";i:10;s:8:"homepage";i:11;s:4:"html";i:12;s:5:"ideas";i:13;s:10:"innovation";i:14;s:8:"internet";i:15;s:6:"laptop";i:16;s:6:"layout";i:17;s:5:"light";i:18;s:5:"media";i:19;s:4:"memo";i:20;s:7:"network";i:21;s:2:"no";i:22;s:8:"notebook";i:23;s:7:"notepad";i:24;s:4:"page";i:25;s:5:"paper";i:26;s:9:"paperwork";i:27;s:6:"people";i:28;s:6:"plants";i:29;s:11:"programming";i:30;s:10:"responsive";i:31;s:6:"screen";i:32;s:4:"shop";i:33;s:8:"software";i:34;s:5:"space";i:35;s:10:"stationary";i:36;s:5:"style";i:37;s:5:"table";i:38;s:10:"technology";i:39;s:8:"template";i:40;s:2:"ui";i:41;s:3:"web";i:42;s:9:"webdesign";i:43;s:7:"webpage";i:44;s:7:"website";i:45;s:6:"window";i:46;s:6:"wooden";i:47;s:4:"word";i:48;s:9:"workplace";i:49;s:3:"www";}}}'),
(189, 47, '_wp_attached_file', '2018/10/cropped-website_design_screen_en_istock-827896866.260x0-is-1.jpg'),
(190, 47, '_wp_attachment_context', 'custom-header'),
(191, 47, '_wp_attachment_metadata', 'a:6:{s:5:"width";i:1920;s:6:"height";i:1277;s:4:"file";s:72:"2018/10/cropped-website_design_screen_en_istock-827896866.260x0-is-1.jpg";s:5:"sizes";a:11:{s:9:"thumbnail";a:4:{s:4:"file";s:72:"cropped-website_design_screen_en_istock-827896866.260x0-is-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:72:"cropped-website_design_screen_en_istock-827896866.260x0-is-1-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:72:"cropped-website_design_screen_en_istock-827896866.260x0-is-1-768x511.jpg";s:5:"width";i:768;s:6:"height";i:511;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:73:"cropped-website_design_screen_en_istock-827896866.260x0-is-1-1024x681.jpg";s:5:"width";i:1024;s:6:"height";i:681;s:9:"mime-type";s:10:"image/jpeg";}s:12:"alizee-thumb";a:4:{s:4:"file";s:72:"cropped-website_design_screen_en_istock-827896866.260x0-is-1-750x499.jpg";s:5:"width";i:750;s:6:"height";i:499;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:72:"cropped-website_design_screen_en_istock-827896866.260x0-is-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:18:"woocommerce_single";a:4:{s:4:"file";s:72:"cropped-website_design_screen_en_istock-827896866.260x0-is-1-600x399.jpg";s:5:"width";i:600;s:6:"height";i:399;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:72:"cropped-website_design_screen_en_istock-827896866.260x0-is-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:72:"cropped-website_design_screen_en_istock-827896866.260x0-is-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:72:"cropped-website_design_screen_en_istock-827896866.260x0-is-1-600x399.jpg";s:5:"width";i:600;s:6:"height";i:399;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:72:"cropped-website_design_screen_en_istock-827896866.260x0-is-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}s:17:"attachment_parent";i:46;}'),
(192, 47, '_wp_attachment_custom_header_last_used_alizee', '1540198347'),
(193, 47, '_wp_attachment_is_custom_header', 'alizee'),
(194, 48, '_edit_lock', '1540198952:1'),
(195, 49, '_wp_attached_file', '2018/10/cropped-c700x420.jpg'),
(196, 49, '_wp_attachment_context', 'custom-header'),
(197, 49, '_wp_attachment_metadata', 'a:6:{s:5:"width";i:1920;s:6:"height";i:551;s:4:"file";s:28:"2018/10/cropped-c700x420.jpg";s:5:"sizes";a:11:{s:9:"thumbnail";a:4:{s:4:"file";s:28:"cropped-c700x420-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:27:"cropped-c700x420-300x86.jpg";s:5:"width";i:300;s:6:"height";i:86;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:28:"cropped-c700x420-768x220.jpg";s:5:"width";i:768;s:6:"height";i:220;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:29:"cropped-c700x420-1024x294.jpg";s:5:"width";i:1024;s:6:"height";i:294;s:9:"mime-type";s:10:"image/jpeg";}s:12:"alizee-thumb";a:4:{s:4:"file";s:28:"cropped-c700x420-750x215.jpg";s:5:"width";i:750;s:6:"height";i:215;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:28:"cropped-c700x420-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:18:"woocommerce_single";a:4:{s:4:"file";s:28:"cropped-c700x420-600x172.jpg";s:5:"width";i:600;s:6:"height";i:172;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:28:"cropped-c700x420-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:28:"cropped-c700x420-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:28:"cropped-c700x420-600x172.jpg";s:5:"width";i:600;s:6:"height";i:172;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:28:"cropped-c700x420-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}s:17:"attachment_parent";i:45;}'),
(198, 49, '_wp_attachment_custom_header_last_used_alizee', '1540198284'),
(199, 49, '_wp_attachment_is_custom_header', 'alizee'),
(200, 50, '_wp_attached_file', '2018/10/cropped-home-office-438386_1920.jpg'),
(201, 50, '_wp_attachment_context', 'custom-header'),
(202, 50, '_wp_attachment_metadata', 'a:6:{s:5:"width";i:1920;s:6:"height";i:1058;s:4:"file";s:43:"2018/10/cropped-home-office-438386_1920.jpg";s:5:"sizes";a:11:{s:9:"thumbnail";a:4:{s:4:"file";s:43:"cropped-home-office-438386_1920-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:43:"cropped-home-office-438386_1920-300x165.jpg";s:5:"width";i:300;s:6:"height";i:165;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:43:"cropped-home-office-438386_1920-768x423.jpg";s:5:"width";i:768;s:6:"height";i:423;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:44:"cropped-home-office-438386_1920-1024x564.jpg";s:5:"width";i:1024;s:6:"height";i:564;s:9:"mime-type";s:10:"image/jpeg";}s:12:"alizee-thumb";a:4:{s:4:"file";s:43:"cropped-home-office-438386_1920-750x413.jpg";s:5:"width";i:750;s:6:"height";i:413;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:43:"cropped-home-office-438386_1920-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:18:"woocommerce_single";a:4:{s:4:"file";s:43:"cropped-home-office-438386_1920-600x331.jpg";s:5:"width";i:600;s:6:"height";i:331;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:43:"cropped-home-office-438386_1920-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:43:"cropped-home-office-438386_1920-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:43:"cropped-home-office-438386_1920-600x331.jpg";s:5:"width";i:600;s:6:"height";i:331;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:43:"cropped-home-office-438386_1920-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}s:17:"attachment_parent";i:28;}'),
(203, 50, '_wp_attachment_custom_header_last_used_alizee', '1540198314'),
(204, 50, '_wp_attachment_is_custom_header', 'alizee'),
(205, 46, '_wp_attachment_custom_header_last_used_alizee', '1540198361'),
(206, 46, '_wp_attachment_is_custom_header', 'alizee'),
(207, 45, '_wp_attachment_custom_header_last_used_alizee', '1540198379'),
(208, 45, '_wp_attachment_is_custom_header', 'alizee'),
(209, 28, '_wp_attachment_custom_header_last_used_alizee', '1540198406'),
(210, 28, '_wp_attachment_is_custom_header', 'alizee'),
(211, 51, '_wp_attached_file', '2018/10/laptop-2557466_1920-560x420.jpg'),
(212, 51, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:560;s:6:"height";i:420;s:4:"file";s:39:"2018/10/laptop-2557466_1920-560x420.jpg";s:5:"sizes";a:6:{s:9:"thumbnail";a:4:{s:4:"file";s:39:"laptop-2557466_1920-560x420-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:39:"laptop-2557466_1920-560x420-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:39:"laptop-2557466_1920-560x420-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:39:"laptop-2557466_1920-560x420-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:39:"laptop-2557466_1920-560x420-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:39:"laptop-2557466_1920-560x420-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(213, 52, '_wp_attached_file', '2018/10/cropped-laptop-2557466_1920-560x420.jpg'),
(214, 52, '_wp_attachment_context', 'custom-header'),
(215, 52, '_wp_attachment_metadata', 'a:6:{s:5:"width";i:1920;s:6:"height";i:764;s:4:"file";s:47:"2018/10/cropped-laptop-2557466_1920-560x420.jpg";s:5:"sizes";a:11:{s:9:"thumbnail";a:4:{s:4:"file";s:47:"cropped-laptop-2557466_1920-560x420-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:47:"cropped-laptop-2557466_1920-560x420-300x119.jpg";s:5:"width";i:300;s:6:"height";i:119;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:47:"cropped-laptop-2557466_1920-560x420-768x306.jpg";s:5:"width";i:768;s:6:"height";i:306;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:48:"cropped-laptop-2557466_1920-560x420-1024x407.jpg";s:5:"width";i:1024;s:6:"height";i:407;s:9:"mime-type";s:10:"image/jpeg";}s:12:"alizee-thumb";a:4:{s:4:"file";s:47:"cropped-laptop-2557466_1920-560x420-750x298.jpg";s:5:"width";i:750;s:6:"height";i:298;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:47:"cropped-laptop-2557466_1920-560x420-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:18:"woocommerce_single";a:4:{s:4:"file";s:47:"cropped-laptop-2557466_1920-560x420-600x239.jpg";s:5:"width";i:600;s:6:"height";i:239;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:47:"cropped-laptop-2557466_1920-560x420-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:47:"cropped-laptop-2557466_1920-560x420-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:47:"cropped-laptop-2557466_1920-560x420-600x239.jpg";s:5:"width";i:600;s:6:"height";i:239;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:47:"cropped-laptop-2557466_1920-560x420-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}s:17:"attachment_parent";i:51;}'),
(216, 52, '_wp_attachment_custom_header_last_used_alizee', '1540198681'),
(217, 52, '_wp_attachment_is_custom_header', 'alizee'),
(218, 51, '_wp_attachment_custom_header_last_used_alizee', '1540198693'),
(219, 51, '_wp_attachment_is_custom_header', 'alizee'),
(220, 53, '_wp_attached_file', '2018/10/5-things-to-consider-when-selecting-a-web-design-agency-1-1.jpg'),
(221, 53, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1080;s:4:"file";s:71:"2018/10/5-things-to-consider-when-selecting-a-web-design-agency-1-1.jpg";s:5:"sizes";a:11:{s:9:"thumbnail";a:4:{s:4:"file";s:71:"5-things-to-consider-when-selecting-a-web-design-agency-1-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:71:"5-things-to-consider-when-selecting-a-web-design-agency-1-1-300x169.jpg";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:71:"5-things-to-consider-when-selecting-a-web-design-agency-1-1-768x432.jpg";s:5:"width";i:768;s:6:"height";i:432;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:72:"5-things-to-consider-when-selecting-a-web-design-agency-1-1-1024x576.jpg";s:5:"width";i:1024;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}s:12:"alizee-thumb";a:4:{s:4:"file";s:71:"5-things-to-consider-when-selecting-a-web-design-agency-1-1-750x422.jpg";s:5:"width";i:750;s:6:"height";i:422;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:71:"5-things-to-consider-when-selecting-a-web-design-agency-1-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:18:"woocommerce_single";a:4:{s:4:"file";s:71:"5-things-to-consider-when-selecting-a-web-design-agency-1-1-600x338.jpg";s:5:"width";i:600;s:6:"height";i:338;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:71:"5-things-to-consider-when-selecting-a-web-design-agency-1-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:71:"5-things-to-consider-when-selecting-a-web-design-agency-1-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:71:"5-things-to-consider-when-selecting-a-web-design-agency-1-1-600x338.jpg";s:5:"width";i:600;s:6:"height";i:338;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:71:"5-things-to-consider-when-selecting-a-web-design-agency-1-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(222, 54, '_wp_attached_file', '2018/10/cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2.jpg'),
(223, 54, '_wp_attachment_context', 'custom-header');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(224, 54, '_wp_attachment_metadata', 'a:6:{s:5:"width";i:1920;s:6:"height";i:714;s:4:"file";s:81:"2018/10/cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2.jpg";s:5:"sizes";a:11:{s:9:"thumbnail";a:4:{s:4:"file";s:81:"cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:81:"cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2-300x112.jpg";s:5:"width";i:300;s:6:"height";i:112;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:81:"cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2-768x286.jpg";s:5:"width";i:768;s:6:"height";i:286;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:82:"cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2-1024x381.jpg";s:5:"width";i:1024;s:6:"height";i:381;s:9:"mime-type";s:10:"image/jpeg";}s:12:"alizee-thumb";a:4:{s:4:"file";s:81:"cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2-750x279.jpg";s:5:"width";i:750;s:6:"height";i:279;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:81:"cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:1;}s:18:"woocommerce_single";a:4:{s:4:"file";s:81:"cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2-600x223.jpg";s:5:"width";i:600;s:6:"height";i:223;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:81:"cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:81:"cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:81:"cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2-600x223.jpg";s:5:"width";i:600;s:6:"height";i:223;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:81:"cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}s:17:"attachment_parent";i:53;}'),
(225, 54, '_wp_attachment_custom_header_last_used_alizee', '1540198979'),
(226, 54, '_wp_attachment_is_custom_header', 'alizee'),
(227, 48, '_wp_trash_meta_status', 'publish'),
(228, 48, '_wp_trash_meta_time', '1540198979'),
(229, 55, '_menu_item_type', 'custom'),
(230, 55, '_menu_item_menu_item_parent', '0'),
(231, 55, '_menu_item_object_id', '55'),
(232, 55, '_menu_item_object', 'custom'),
(233, 55, '_menu_item_target', ''),
(234, 55, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(235, 55, '_menu_item_xfn', ''),
(236, 55, '_menu_item_url', 'https://www.youtube.com/c/hokuho'),
(237, 55, '_menu_item_orphaned', '1540200755'),
(238, 56, '_menu_item_type', 'custom'),
(239, 56, '_menu_item_menu_item_parent', '0'),
(240, 56, '_menu_item_object_id', '56'),
(241, 56, '_menu_item_object', 'custom'),
(242, 56, '_menu_item_target', ''),
(243, 56, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(244, 56, '_menu_item_xfn', ''),
(245, 56, '_menu_item_url', 'https://www.youtube.com/c/hokuho'),
(246, 56, '_menu_item_orphaned', '1540200844'),
(247, 57, '_menu_item_type', 'custom'),
(248, 57, '_menu_item_menu_item_parent', '0'),
(249, 57, '_menu_item_object_id', '57'),
(250, 57, '_menu_item_object', 'custom'),
(251, 57, '_menu_item_target', ''),
(252, 57, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(253, 57, '_menu_item_xfn', ''),
(254, 57, '_menu_item_url', 'https://www.youtube.com/c/hokuho'),
(255, 57, '_menu_item_orphaned', '1540200961'),
(256, 58, '_menu_item_type', 'custom'),
(257, 58, '_menu_item_menu_item_parent', '0'),
(258, 58, '_menu_item_object_id', '58'),
(259, 58, '_menu_item_object', 'custom'),
(260, 58, '_menu_item_target', ''),
(261, 58, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(262, 58, '_menu_item_xfn', ''),
(263, 58, '_menu_item_url', 'http://www.youtube.com/c/hokuho'),
(264, 58, '_menu_item_orphaned', '1540201037'),
(265, 59, '_menu_item_type', 'custom'),
(266, 59, '_menu_item_menu_item_parent', '0'),
(267, 59, '_menu_item_object_id', '59'),
(268, 59, '_menu_item_object', 'custom'),
(269, 59, '_menu_item_target', ''),
(270, 59, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(271, 59, '_menu_item_xfn', ''),
(272, 59, '_menu_item_url', 'https://www.youtube.com/c/hokuho'),
(274, 60, '_menu_item_type', 'custom'),
(275, 60, '_menu_item_menu_item_parent', '0'),
(276, 60, '_menu_item_object_id', '60'),
(277, 60, '_menu_item_object', 'custom'),
(278, 60, '_menu_item_target', ''),
(279, 60, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(280, 60, '_menu_item_xfn', ''),
(281, 60, '_menu_item_url', 'https://twitter.com/buildwithoutcod'),
(283, 61, '_menu_item_type', 'custom'),
(284, 61, '_menu_item_menu_item_parent', '0'),
(285, 61, '_menu_item_object_id', '61'),
(286, 61, '_menu_item_object', 'custom'),
(287, 61, '_menu_item_target', ''),
(288, 61, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(289, 61, '_menu_item_xfn', ''),
(290, 61, '_menu_item_url', 'https://instagram.com/buildwithoutcode/'),
(292, 62, '_menu_item_type', 'custom'),
(293, 62, '_menu_item_menu_item_parent', '0'),
(294, 62, '_menu_item_object_id', '62'),
(295, 62, '_menu_item_object', 'custom'),
(296, 62, '_menu_item_target', ''),
(297, 62, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(298, 62, '_menu_item_xfn', ''),
(299, 62, '_menu_item_url', 'https://plus.google.com/b/100772025797790381877/+Buildwithoutcode/posts'),
(302, 34, 'apss_content_flag', '0'),
(303, 63, '_menu_item_type', 'custom'),
(304, 63, '_menu_item_menu_item_parent', '0'),
(305, 63, '_menu_item_object_id', '63'),
(306, 63, '_menu_item_object', 'custom'),
(307, 63, '_menu_item_target', ''),
(308, 63, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(309, 63, '_menu_item_xfn', ''),
(310, 63, '_menu_item_url', 'http://localhost:81/wordpress'),
(312, 64, '_menu_item_type', 'taxonomy'),
(313, 64, '_menu_item_menu_item_parent', '0'),
(314, 64, '_menu_item_object_id', '17'),
(315, 64, '_menu_item_object', 'category'),
(316, 64, '_menu_item_target', ''),
(317, 64, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(318, 64, '_menu_item_xfn', ''),
(319, 64, '_menu_item_url', ''),
(321, 65, '_menu_item_type', 'taxonomy'),
(322, 65, '_menu_item_menu_item_parent', '0'),
(323, 65, '_menu_item_object_id', '18'),
(324, 65, '_menu_item_object', 'category'),
(325, 65, '_menu_item_target', ''),
(326, 65, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(327, 65, '_menu_item_xfn', ''),
(328, 65, '_menu_item_url', ''),
(330, 66, '_menu_item_type', 'taxonomy'),
(331, 66, '_menu_item_menu_item_parent', '0'),
(332, 66, '_menu_item_object_id', '19'),
(333, 66, '_menu_item_object', 'category'),
(334, 66, '_menu_item_target', ''),
(335, 66, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(336, 66, '_menu_item_xfn', ''),
(337, 66, '_menu_item_url', ''),
(339, 67, '_edit_lock', '1540204211:1'),
(340, 67, '_wp_trash_meta_status', 'publish'),
(341, 67, '_wp_trash_meta_time', '1540204235'),
(342, 68, '_wp_trash_meta_status', 'publish'),
(343, 68, '_wp_trash_meta_time', '1540204357'),
(344, 69, '_wp_trash_meta_status', 'publish'),
(345, 69, '_wp_trash_meta_time', '1540204789');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-09-02 16:45:45', '2018-09-02 16:45:45', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'trash', 'open', 'open', '', 'hello-world__trashed', '', '', '2018-10-22 08:25:41', '2018-10-22 08:25:41', '', 0, 'http://localhost:81/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2018-09-02 16:45:45', '2018-09-02 16:45:45', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost:81/wordpress/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2018-09-02 16:45:45', '2018-09-02 16:45:45', '', 0, 'http://localhost:81/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2018-09-02 16:45:45', '2018-09-02 16:45:45', '<h2>Who we are</h2><p>Our website address is: http://localhost:81/wordpress.</p><h2>What personal data we collect and why we collect it</h2><h3>Comments</h3><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3>Media</h3><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><h3>Contact forms</h3><h3>Cookies</h3><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3>Embedded content from other websites</h3><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><h3>Analytics</h3><h2>Who we share your data with</h2><h2>How long we retain your data</h2><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2>What rights you have over your data</h2><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><h2>Where we send your data</h2><p>Visitor comments may be checked through an automated spam detection service.</p><h2>Your contact information</h2><h2>Additional information</h2><h3>How we protect your data</h3><h3>What data breach procedures we have in place</h3><h3>What third parties we receive data from</h3><h3>What automated decision making and/or profiling we do with user data</h3><h3>Industry regulatory disclosure requirements</h3>', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2018-09-02 16:45:45', '2018-09-02 16:45:45', '', 0, 'http://localhost:81/wordpress/?page_id=3', 0, 'page', '', 0),
(14, 1, '2018-09-16 04:49:50', '2018-09-16 04:49:50', '', '25', '', 'inherit', 'open', 'closed', '', '25', '', '', '2018-09-16 04:49:50', '2018-09-16 04:49:50', '', 0, 'http://localhost:81/wordpress/wp-content/uploads/2018/09/25.jpg', 0, 'attachment', 'image/jpeg', 0),
(15, 1, '2018-09-16 09:23:11', '2018-09-16 09:23:11', '', 'Headphones', 'Barcadi edm CD''s', 'publish', 'open', 'closed', '', 'headphones', '', '', '2018-09-16 09:23:11', '2018-09-16 09:23:11', '', 0, 'http://localhost:81/wordpress/?post_type=product&#038;p=15', 0, 'product', '', 0),
(16, 1, '2018-09-16 09:20:01', '2018-09-16 09:20:01', '', 'music', '', 'inherit', 'open', 'closed', '', 'music', '', '', '2018-09-16 09:20:14', '2018-09-16 09:20:14', '', 15, 'http://localhost:81/wordpress/wp-content/uploads/2018/09/music.jpg', 0, 'attachment', 'image/jpeg', 0),
(17, 1, '2018-09-16 09:32:53', '2018-09-16 09:32:53', 'hoodie', 'Hoodie', 'hoodie', 'publish', 'open', 'closed', '', 'hoodie', '', '', '2018-09-16 09:32:54', '2018-09-16 09:32:54', '', 0, 'http://localhost:81/wordpress/?post_type=product&#038;p=17', 0, 'product', '', 0),
(18, 1, '2018-09-16 09:32:02', '2018-09-16 09:32:02', '', 'clothing', '', 'inherit', 'open', 'closed', '', 'clothing', '', '', '2018-09-16 09:32:02', '2018-09-16 09:32:02', '', 17, 'http://localhost:81/wordpress/wp-content/uploads/2018/09/clothing.jpg', 0, 'attachment', 'image/jpeg', 0),
(19, 1, '2018-09-29 09:37:25', '2018-09-29 09:37:25', '', 'Headphones', '<p>Barcadi edm CD''s</p>', 'inherit', 'closed', 'closed', '', '15-autosave-v1', '', '', '2018-09-29 09:37:25', '2018-09-29 09:37:25', '', 15, 'http://localhost:81/wordpress/15-autosave-v1/', 0, 'revision', '', 0),
(21, 1, '2018-10-22 07:40:45', '2018-10-22 07:40:45', 'Learn to make a single page website from scratch with WordPress. No coding or experience required.<!--more-->\r\n\r\nhttps://youtu.be/rUQUoxvo27E\r\n\r\nFor more in-depth web development and WordPress training, check out: <a class="yt-uix-redirect-link" dir="ltr" title="http://course.buildwithoutcode.com" href="http://course.buildwithoutcode.com/" target="_blank" rel="nofollow noopener">http://course.buildwithoutcode.com</a>\r\n<h1>Tutorial Description</h1>\r\nIf you want to create a beautiful website to find more clients for your agency or freelance business, this is the tutorial for you.\r\n\r\nWe’ll build an actual single page, portfolio website together, step by step, from start to finish.\r\n\r\nYou’ll learn how to get your website live on the internet and how to customize it with WordPress. No experience and no coding is required.\r\n\r\nThe website we’ll build will have the following features:\r\n\r\n-Call-to-action header with beautiful image, text, and button\r\n-Simple contact form\r\n-Display email, phone, and dress contact info\r\n-‘What We Do’ section\r\n-‘Our Skills’ section\r\n-‘Recent Works’ section with image, logo, and link to project\r\n-Page for portfolio item with image gallery\r\n-Video blog posts\r\n-Blog sidebar widgets with contact info, recent posts, and search bar\r\n-Embedded YouTube videos\r\n-Page/post featured image\r\n-Testimonials section with photo, name, and quote\r\n-Custom footer\r\n-Parallax scrolling\r\n-One-page, freelance/agency theme\r\n-‘About Me’ widget\r\n-‘Follow Us’ widget with icons and links to profiles for Twitter, -Facebook, Pinterest, YouTube, Google Plus, Dribbble, Tumblr, Instagram\r\n-Custom favicon (site icon)\r\n-Custom domain name\r\n-Unlimited bandwidth web hosting\r\n-Responsive web design, so it will look good on any screen size or -mobile phone\r\n-Custom Navigation bar\r\n-Anchor links that jump to specific areas of the page\r\n\r\nDon’t have a programming background? No worries, we’ll start from scratch. You’ll learn how to register a domain name, set up web hosting, and install WordPress (in other words, everything you need to get your site live on the internet).\r\n\r\nThen we’ll start customizing the site with WordPress. You’ll be able to add content and customize the design quickly, easily, and without writing code. We’ll be using the Pixova WordPress theme, which is well designed, easy to use, and completely free', 'How to Make a Single Page Website for Freelancers, Agencies & Businesses', '', 'publish', 'open', 'open', '', 'how-to-make-a-single-page-website-for-freelancers-agencies-businesses', '', '', '2018-10-22 08:05:42', '2018-10-22 08:05:42', '', 0, 'http://localhost:81/wordpress/?p=21', 0, 'post', '', 0),
(22, 1, '2018-10-22 07:38:36', '2018-10-22 07:38:36', '', 'Capture', '', 'inherit', 'open', 'closed', '', 'capture', '', '', '2018-10-22 07:38:36', '2018-10-22 07:38:36', '', 21, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/Capture.jpg', 0, 'attachment', 'image/jpeg', 0),
(23, 1, '2018-10-22 07:40:45', '2018-10-22 07:40:45', 'Learn to make a single page website from scratch with WordPress. No coding or experience required.\r\n\r\nhttps://youtu.be/rUQUoxvo27E\r\n\r\nFor more in-depth web development and WordPress training, check out: <a class="yt-uix-redirect-link" dir="ltr" title="http://course.buildwithoutcode.com" href="http://course.buildwithoutcode.com/" target="_blank" rel="nofollow noopener">http://course.buildwithoutcode.com</a>\r\n<h1>Tutorial Description</h1>\r\nIf you want to create a beautiful website to find more clients for your agency or freelance business, this is the tutorial for you.\r\n\r\nWe’ll build an actual single page, portfolio website together, step by step, from start to finish.\r\n\r\nYou’ll learn how to get your website live on the internet and how to customize it with WordPress. No experience and no coding is required.\r\n\r\nThe website we’ll build will have the following features:\r\n\r\n-Call-to-action header with beautiful image, text, and button\r\n-Simple contact form\r\n-Display email, phone, and dress contact info\r\n-‘What We Do’ section\r\n-‘Our Skills’ section\r\n-‘Recent Works’ section with image, logo, and link to project\r\n-Page for portfolio item with image gallery\r\n-Video blog posts\r\n-Blog sidebar widgets with contact info, recent posts, and search bar\r\n-Embedded YouTube videos\r\n-Page/post featured image\r\n-Testimonials section with photo, name, and quote\r\n-Custom footer\r\n-Parallax scrolling\r\n-One-page, freelance/agency theme\r\n-‘About Me’ widget\r\n-‘Follow Us’ widget with icons and links to profiles for Twitter, -Facebook, Pinterest, YouTube, Google Plus, Dribbble, Tumblr, Instagram\r\n-Custom favicon (site icon)\r\n-Custom domain name\r\n-Unlimited bandwidth web hosting\r\n-Responsive web design, so it will look good on any screen size or -mobile phone\r\n-Custom Navigation bar\r\n-Anchor links that jump to specific areas of the page\r\n\r\nDon’t have a programming background? No worries, we’ll start from scratch. You’ll learn how to register a domain name, set up web hosting, and install WordPress (in other words, everything you need to get your site live on the internet).\r\n\r\nThen we’ll start customizing the site with WordPress. You’ll be able to add content and customize the design quickly, easily, and without writing code. We’ll be using the Pixova WordPress theme, which is well designed, easy to use, and completely free', 'How to Make a Single Page Website for Freelancers, Agencies & Businesses', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2018-10-22 07:40:45', '2018-10-22 07:40:45', '', 21, 'http://localhost:81/wordpress/21-revision-v1/', 0, 'revision', '', 0),
(24, 1, '2018-10-22 07:45:36', '2018-10-22 07:45:36', 'Learn to make a single page website from scratch with WordPress. No coding or experience required.<!--more-->\r\n\r\nhttps://youtu.be/rUQUoxvo27E\r\n\r\nFor more in-depth web development and WordPress training, check out: <a class="yt-uix-redirect-link" dir="ltr" title="http://course.buildwithoutcode.com" href="http://course.buildwithoutcode.com/" target="_blank" rel="nofollow noopener">http://course.buildwithoutcode.com</a>\r\n<h1>Tutorial Description</h1>\r\nIf you want to create a beautiful website to find more clients for your agency or freelance business, this is the tutorial for you.\r\n\r\nWe’ll build an actual single page, portfolio website together, step by step, from start to finish.\r\n\r\nYou’ll learn how to get your website live on the internet and how to customize it with WordPress. No experience and no coding is required.\r\n\r\nThe website we’ll build will have the following features:\r\n\r\n-Call-to-action header with beautiful image, text, and button\r\n-Simple contact form\r\n-Display email, phone, and dress contact info\r\n-‘What We Do’ section\r\n-‘Our Skills’ section\r\n-‘Recent Works’ section with image, logo, and link to project\r\n-Page for portfolio item with image gallery\r\n-Video blog posts\r\n-Blog sidebar widgets with contact info, recent posts, and search bar\r\n-Embedded YouTube videos\r\n-Page/post featured image\r\n-Testimonials section with photo, name, and quote\r\n-Custom footer\r\n-Parallax scrolling\r\n-One-page, freelance/agency theme\r\n-‘About Me’ widget\r\n-‘Follow Us’ widget with icons and links to profiles for Twitter, -Facebook, Pinterest, YouTube, Google Plus, Dribbble, Tumblr, Instagram\r\n-Custom favicon (site icon)\r\n-Custom domain name\r\n-Unlimited bandwidth web hosting\r\n-Responsive web design, so it will look good on any screen size or -mobile phone\r\n-Custom Navigation bar\r\n-Anchor links that jump to specific areas of the page\r\n\r\nDon’t have a programming background? No worries, we’ll start from scratch. You’ll learn how to register a domain name, set up web hosting, and install WordPress (in other words, everything you need to get your site live on the internet).\r\n\r\nThen we’ll start customizing the site with WordPress. You’ll be able to add content and customize the design quickly, easily, and without writing code. We’ll be using the Pixova WordPress theme, which is well designed, easy to use, and completely free', 'How to Make a Single Page Website for Freelancers, Agencies & Businesses', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2018-10-22 07:45:36', '2018-10-22 07:45:36', '', 21, 'http://localhost:81/wordpress/21-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2018-10-22 07:59:38', '2018-10-22 07:59:38', 'This post will teach you how to create a WordPress website from scratch. A step by step tutorial video is included at the end. You won’t need any prior experience 🙂<!--more-->\r\n\r\nTo create a website you need to do 3 main things:\r\n<ol>\r\n 	<li>Register a domain name</li>\r\n 	<li>Set up hosting</li>\r\n 	<li>Install WordPress</li>\r\n</ol>\r\n<h1>Register a Domain Name</h1>\r\nA domain name is just an address we use to get to a certain website. For example, www.amazon.com is the domain name to get to <a href="http://blog.buildwithoutcode.com/go/amazon/" target="_blank" rel="noopener">Amazon’s website</a>. To register a domain name you just need to find an available domain and purchase it through a domain registar (costs about 10 bucks a year). <a href="http://blog.buildwithoutcode.com/go/namecheap/" target="_blank" rel="noopener">NameCheap</a> is where I get all of my domain names. If you want more information on the subject, check out my post on <a href="http://blog.buildwithoutcode.com/register-domain-name-2015/">how to register a domain name</a>.\r\n<h1>Set Up Hosting</h1>\r\nWhen I upload a picture to Facebook, that picture is stored on Facebook’s computers. These storage computers are called servers. Every website has content on it such as text, pictures, or videos. This content also needs to be stored on servers. Lucky for us, we don’t have a to buy and set up a server for our website, we can just rent a space on someone else’s servers. So hosting is just when someone else <em>hosts</em> our website’s content on their servers. Hosting usually costs around $10 a month.\r\n\r\n<a href="http://blog.buildwithoutcode.com/go/hostgator/" target="_blank" rel="noopener">HostGator</a> is what I use for hosting. They’re cheap and easy to use. They’ve also hooked us up with some coupons.\r\n<div class="well ">\r\n\r\nCoupon Code: buildwithoutcode1Use if you’re want to pay month to month and you’ll get the first month for $0.01.\r\n\r\n</div>\r\n<div class="well ">\r\n\r\nCoupon Code: buildwithoutcodeUse if you choose to pay for more than one month in advance and you’ll get 25% off your first pay period.\r\n\r\n</div>\r\nIf you want more information on the subject, check out my post on <a href="http://blog.buildwithoutcode.com/get-web-hosting-one-cent-2015/">web hosting for beginners</a>.\r\n<h1>Install WordPress</h1>\r\nWordPress is what you’re going to use to build and customize your website without writing code. On the home page I explain why <a href="http://buildwithoutcode.com/#aboutus">WordPress is a great way to build websites</a>.\r\n\r\nTo get your website up and running with WordPress, you first need to <a href="http://blog.buildwithoutcode.com/connect-domain-name-web-host/" target="_blank" rel="noopener">point your domain to your web host</a>. Then with HostGator it’s just a <a href="http://blog.buildwithoutcode.com/install-wordpress-cpanel/">1-click WordPress installation</a>. After that you’ll have your site live on the internet and you can start customizing it through WordPress.\r\n\r\nThe tutorial below walks through the entire process of creating a website, from registering a domain to installing WordPress.\r\n\r\nhttps://youtu.be/cW2-HqWLfjA', 'How to Create a Website from Scratch', '', 'publish', 'open', 'open', '', 'how-to-create-a-website-from-scratch', '', '', '2018-10-22 08:03:08', '2018-10-22 08:03:08', '', 0, 'http://localhost:81/wordpress/?p=25', 0, 'post', '', 1),
(26, 1, '2018-10-22 07:59:19', '2018-10-22 07:59:19', '', 'Capture2', '', 'inherit', 'open', 'closed', '', 'capture2', '', '', '2018-10-22 07:59:19', '2018-10-22 07:59:19', '', 25, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/Capture2.jpg', 0, 'attachment', 'image/jpeg', 0),
(27, 1, '2018-10-22 07:59:38', '2018-10-22 07:59:38', 'This post will teach you how to create a WordPress website from scratch. A step by step tutorial video is included at the end. You won’t need any prior experience 🙂<!--more-->\r\n\r\nTo create a website you need to do 3 main things:\r\n<ol>\r\n 	<li>Register a domain name</li>\r\n 	<li>Set up hosting</li>\r\n 	<li>Install WordPress</li>\r\n</ol>\r\n<h1>Register a Domain Name</h1>\r\nA domain name is just an address we use to get to a certain website. For example, www.amazon.com is the domain name to get to <a href="http://blog.buildwithoutcode.com/go/amazon/" target="_blank" rel="noopener">Amazon’s website</a>. To register a domain name you just need to find an available domain and purchase it through a domain registar (costs about 10 bucks a year). <a href="http://blog.buildwithoutcode.com/go/namecheap/" target="_blank" rel="noopener">NameCheap</a> is where I get all of my domain names. If you want more information on the subject, check out my post on <a href="http://blog.buildwithoutcode.com/register-domain-name-2015/">how to register a domain name</a>.\r\n<h1>Set Up Hosting</h1>\r\nWhen I upload a picture to Facebook, that picture is stored on Facebook’s computers. These storage computers are called servers. Every website has content on it such as text, pictures, or videos. This content also needs to be stored on servers. Lucky for us, we don’t have a to buy and set up a server for our website, we can just rent a space on someone else’s servers. So hosting is just when someone else <em>hosts</em> our website’s content on their servers. Hosting usually costs around $10 a month.\r\n\r\n<a href="http://blog.buildwithoutcode.com/go/hostgator/" target="_blank" rel="noopener">HostGator</a> is what I use for hosting. They’re cheap and easy to use. They’ve also hooked us up with some coupons.\r\n<div class="well   ">Coupon Code: buildwithoutcode1Use if you’re want to pay month to month and you’ll get the first month for $0.01.\r\n\r\n</div>\r\n<div class="well   ">Coupon Code: buildwithoutcodeUse if you choose to pay for more than one month in advance and you’ll get 25% off your first pay period.\r\n\r\n</div>\r\nIf you want more information on the subject, check out my post on <a href="http://blog.buildwithoutcode.com/get-web-hosting-one-cent-2015/">web hosting for beginners</a>.\r\n<h1>Install WordPress</h1>\r\nWordPress is what you’re going to use to build and customize your website without writing code. On the home page I explain why <a href="http://buildwithoutcode.com/#aboutus">WordPress is a great way to build websites</a>.\r\n\r\nTo get your website up and running with WordPress, you first need to <a href="http://blog.buildwithoutcode.com/connect-domain-name-web-host/" target="_blank" rel="noopener">point your domain to your web host</a>. Then with HostGator it’s just a <a href="http://blog.buildwithoutcode.com/install-wordpress-cpanel/">1-click WordPress installation</a>. After that you’ll have your site live on the internet and you can start customizing it through WordPress.\r\n\r\nThe tutorial below walks through the entire process of creating a website, from registering a domain to installing WordPress.\r\n\r\nhttps://youtu.be/cW2-HqWLfjA', 'How to Create a Website from Scratch', '', 'inherit', 'closed', 'closed', '', '25-revision-v1', '', '', '2018-10-22 07:59:38', '2018-10-22 07:59:38', '', 25, 'http://localhost:81/wordpress/25-revision-v1/', 0, 'revision', '', 0),
(28, 1, '2018-10-22 08:02:50', '2018-10-22 08:02:50', '', 'home-office-438386_1920', '', 'inherit', 'open', 'closed', '', 'home-office-438386_1920', '', '', '2018-10-22 08:02:50', '2018-10-22 08:02:50', '', 25, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/home-office-438386_1920.jpg', 0, 'attachment', 'image/jpeg', 0),
(29, 1, '2018-10-22 08:03:08', '2018-10-22 08:03:08', 'This post will teach you how to create a WordPress website from scratch. A step by step tutorial video is included at the end. You won’t need any prior experience 🙂<!--more-->\r\n\r\nTo create a website you need to do 3 main things:\r\n<ol>\r\n 	<li>Register a domain name</li>\r\n 	<li>Set up hosting</li>\r\n 	<li>Install WordPress</li>\r\n</ol>\r\n<h1>Register a Domain Name</h1>\r\nA domain name is just an address we use to get to a certain website. For example, www.amazon.com is the domain name to get to <a href="http://blog.buildwithoutcode.com/go/amazon/" target="_blank" rel="noopener">Amazon’s website</a>. To register a domain name you just need to find an available domain and purchase it through a domain registar (costs about 10 bucks a year). <a href="http://blog.buildwithoutcode.com/go/namecheap/" target="_blank" rel="noopener">NameCheap</a> is where I get all of my domain names. If you want more information on the subject, check out my post on <a href="http://blog.buildwithoutcode.com/register-domain-name-2015/">how to register a domain name</a>.\r\n<h1>Set Up Hosting</h1>\r\nWhen I upload a picture to Facebook, that picture is stored on Facebook’s computers. These storage computers are called servers. Every website has content on it such as text, pictures, or videos. This content also needs to be stored on servers. Lucky for us, we don’t have a to buy and set up a server for our website, we can just rent a space on someone else’s servers. So hosting is just when someone else <em>hosts</em> our website’s content on their servers. Hosting usually costs around $10 a month.\r\n\r\n<a href="http://blog.buildwithoutcode.com/go/hostgator/" target="_blank" rel="noopener">HostGator</a> is what I use for hosting. They’re cheap and easy to use. They’ve also hooked us up with some coupons.\r\n<div class="well ">\r\n\r\nCoupon Code: buildwithoutcode1Use if you’re want to pay month to month and you’ll get the first month for $0.01.\r\n\r\n</div>\r\n<div class="well ">\r\n\r\nCoupon Code: buildwithoutcodeUse if you choose to pay for more than one month in advance and you’ll get 25% off your first pay period.\r\n\r\n</div>\r\nIf you want more information on the subject, check out my post on <a href="http://blog.buildwithoutcode.com/get-web-hosting-one-cent-2015/">web hosting for beginners</a>.\r\n<h1>Install WordPress</h1>\r\nWordPress is what you’re going to use to build and customize your website without writing code. On the home page I explain why <a href="http://buildwithoutcode.com/#aboutus">WordPress is a great way to build websites</a>.\r\n\r\nTo get your website up and running with WordPress, you first need to <a href="http://blog.buildwithoutcode.com/connect-domain-name-web-host/" target="_blank" rel="noopener">point your domain to your web host</a>. Then with HostGator it’s just a <a href="http://blog.buildwithoutcode.com/install-wordpress-cpanel/">1-click WordPress installation</a>. After that you’ll have your site live on the internet and you can start customizing it through WordPress.\r\n\r\nThe tutorial below walks through the entire process of creating a website, from registering a domain to installing WordPress.\r\n\r\nhttps://youtu.be/cW2-HqWLfjA', 'How to Create a Website from Scratch', '', 'inherit', 'closed', 'closed', '', '25-revision-v1', '', '', '2018-10-22 08:03:08', '2018-10-22 08:03:08', '', 25, 'http://localhost:81/wordpress/25-revision-v1/', 0, 'revision', '', 0),
(30, 1, '2018-10-22 08:05:19', '2018-10-22 08:05:19', '', 'How-to-Make-a-Single-Page-Website-for-Freelancers-Agencies-Businesses', '', 'inherit', 'open', 'closed', '', 'how-to-make-a-single-page-website-for-freelancers-agencies-businesses-2', '', '', '2018-10-22 08:05:19', '2018-10-22 08:05:19', '', 21, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/How-to-Make-a-Single-Page-Website-for-Freelancers-Agencies-Businesses.jpeg', 0, 'attachment', 'image/jpeg', 0),
(31, 1, '2018-10-22 08:13:11', '2018-10-22 08:13:11', 'Many people want to make a blog or website with WordPress but get confused when they discover that WordPress.com and WordPress.org aren’t the same thing. This post will explain the difference between <!--more-->WordPress.com and WordPress.org. It will also show you which one is best for your needs.\r\n<h1>Main Differences</h1>\r\n<div class="table-responsive">\r\n<table class="table " width="100%">\r\n<thead>\r\n<tr>\r\n<th></th>\r\n<th>WordPress.org</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td><strong>Domain Name</strong></td>\r\n<td>You can’t have your own domain name unless you pay $18/year. Your domain name will look like this: www.example.wordpress.com.</td>\r\n<td>You <a href="http://blog.buildwithoutcode.com/register-domain-name-2015/">register your own domain name</a>: www.example.com. It will cost about $10/year.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Hosting</strong></td>\r\n<td>Hosted for free but only 3 gb of space, can’t store videos, they may show ads on your site. Must pay to get more storage, add videos, or remove ads.</td>\r\n<td>Must <a href="http://blog.buildwithoutcode.com/get-web-hosting-one-cent-2015/">sign up for your own hosting</a> at about $8/month. Unlimited storage, store videos, no ads.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Flexibility</strong></td>\r\n<td>Not very flexible unless you pay for added features. Limited themes, no plugins, limited colors.</td>\r\n<td>Extremely flexible.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Restrictions</strong></td>\r\n<td>Can’t do eCommerce (online store) or most affiliate marketing.</td>\r\n<td>No restrictions.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Ease of use</strong></td>\r\n<td>Takes almost no time to get started but the lack of flexibility can be frustrating.</td>\r\n<td>Takes a little longer to <a href="http://blog.buildwithoutcode.com/create-website-scratch/">get your website live</a> at the beginning, but the added flexibility makes it easier to use in my opinion.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Total cost</strong></td>\r\n<td>Free if you don’t upgrade anything.</td>\r\n<td>About $10/month.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<h1>When to use WordPress.com</h1>\r\n<ul>\r\n 	<li>You cannot spend any money on your website</li>\r\n 	<li>You just want a small blog or website without videos or high quality images</li>\r\n 	<li>Your website will mostly be for personal, non-commercial uses</li>\r\n</ul>\r\n<h1>When to use WordPress.org</h1>\r\n<ul>\r\n 	<li>You want to have lots of flexibility over what your blog/website can do</li>\r\n 	<li>You want full control over what your blog/website looks like</li>\r\n 	<li>You’d like to have videos or high quality images on your site</li>\r\n 	<li>You want to make money from your blog/website</li>\r\n</ul>\r\n<h1>Conclusion</h1>\r\nOverall, I believe WordPress.org is usually the right way to go. The only instance where I might use WordPress.com is if I was just making a small, personal blog as a hobby (but even then I would use wordpress.org if I wanted the blog to really grow at all). If you want to use with WordPress.com just visit their website and getting started is pretty intuitive. If you want to use WordPress.org, check out our course on <a href="http://buildwithoutcode.com/product/make-a-website-without-code-course/">how to create a website from scratch using WordPress.org</a>.\r\n\r\nhttps://youtu.be/-wjWmyw5jAY', 'What’s the Difference Between WordPress.com and WordPress.org?', '', 'publish', 'open', 'open', '', 'whats-the-difference-between-wordpress-com-and-wordpress-org', '', '', '2018-10-22 08:13:11', '2018-10-22 08:13:11', '', 0, 'http://localhost:81/wordpress/?p=31', 0, 'post', '', 0),
(32, 1, '2018-10-22 08:12:46', '2018-10-22 08:12:46', '', 'download', '', 'inherit', 'open', 'closed', '', 'download', '', '', '2018-10-22 08:12:46', '2018-10-22 08:12:46', '', 31, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/download.png', 0, 'attachment', 'image/png', 0),
(33, 1, '2018-10-22 08:13:11', '2018-10-22 08:13:11', 'Many people want to make a blog or website with WordPress but get confused when they discover that WordPress.com and WordPress.org aren’t the same thing. This post will explain the difference between <!--more-->WordPress.com and WordPress.org. It will also show you which one is best for your needs.\r\n<h1>Main Differences</h1>\r\n<div class="table-responsive">\r\n<table class="table " width="100%">\r\n<thead>\r\n<tr>\r\n<th></th>\r\n<th>WordPress.org</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td><strong>Domain Name</strong></td>\r\n<td>You can’t have your own domain name unless you pay $18/year. Your domain name will look like this: www.example.wordpress.com.</td>\r\n<td>You <a href="http://blog.buildwithoutcode.com/register-domain-name-2015/">register your own domain name</a>: www.example.com. It will cost about $10/year.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Hosting</strong></td>\r\n<td>Hosted for free but only 3 gb of space, can’t store videos, they may show ads on your site. Must pay to get more storage, add videos, or remove ads.</td>\r\n<td>Must <a href="http://blog.buildwithoutcode.com/get-web-hosting-one-cent-2015/">sign up for your own hosting</a> at about $8/month. Unlimited storage, store videos, no ads.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Flexibility</strong></td>\r\n<td>Not very flexible unless you pay for added features. Limited themes, no plugins, limited colors.</td>\r\n<td>Extremely flexible.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Restrictions</strong></td>\r\n<td>Can’t do eCommerce (online store) or most affiliate marketing.</td>\r\n<td>No restrictions.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Ease of use</strong></td>\r\n<td>Takes almost no time to get started but the lack of flexibility can be frustrating.</td>\r\n<td>Takes a little longer to <a href="http://blog.buildwithoutcode.com/create-website-scratch/">get your website live</a> at the beginning, but the added flexibility makes it easier to use in my opinion.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Total cost</strong></td>\r\n<td>Free if you don’t upgrade anything.</td>\r\n<td>About $10/month.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<h1>When to use WordPress.com</h1>\r\n<ul>\r\n 	<li>You cannot spend any money on your website</li>\r\n 	<li>You just want a small blog or website without videos or high quality images</li>\r\n 	<li>Your website will mostly be for personal, non-commercial uses</li>\r\n</ul>\r\n<h1>When to use WordPress.org</h1>\r\n<ul>\r\n 	<li>You want to have lots of flexibility over what your blog/website can do</li>\r\n 	<li>You want full control over what your blog/website looks like</li>\r\n 	<li>You’d like to have videos or high quality images on your site</li>\r\n 	<li>You want to make money from your blog/website</li>\r\n</ul>\r\n<h1>Conclusion</h1>\r\nOverall, I believe WordPress.org is usually the right way to go. The only instance where I might use WordPress.com is if I was just making a small, personal blog as a hobby (but even then I would use wordpress.org if I wanted the blog to really grow at all). If you want to use with WordPress.com just visit their website and getting started is pretty intuitive. If you want to use WordPress.org, check out our course on <a href="http://buildwithoutcode.com/product/make-a-website-without-code-course/">how to create a website from scratch using WordPress.org</a>.\r\n\r\nhttps://youtu.be/-wjWmyw5jAY', 'What’s the Difference Between WordPress.com and WordPress.org?', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2018-10-22 08:13:11', '2018-10-22 08:13:11', '', 31, 'http://localhost:81/wordpress/31-revision-v1/', 0, 'revision', '', 0),
(34, 1, '2018-10-22 08:19:57', '2018-10-22 08:19:57', 'In this video we’ll create an actual portfolio website, step by step, from start to finish. The site uses the Fukasawa theme, which is designed to be minimalistic and clean<!--more-->, with a Pinterest-style grid for displaying images, posts, and videos. It’s the perfect site for photographers, designers, and other professionals to showcase their work.\r\n\r\nhttps://youtu.be/3CvqRjQiapo\r\n\r\nWeb Hosting- <a class="yt-uix-redirect-link" dir="ltr" title="http://www.HostGator.com" href="http://blog.buildwithoutcode.com/go/hostgator/" target="_blank" rel="nofollow noopener">HostGator.com</a> (25% coupon code: buildwithoutcode)\r\n\r\nDomain Name- <a class="yt-uix-redirect-link" dir="ltr" title="http://www.NameCheap.com" href="http://blog.buildwithoutcode.com/go/namecheap/" target="_blank" rel="nofollow noopener">NameCheap.com</a>\r\n\r\nFor more in-depth web development and WordPress training, check out: <a class="yt-uix-redirect-link" dir="ltr" title="http://course.buildwithoutcode.com" href="http://course.buildwithoutcode.com/" target="_blank" rel="nofollow noopener">http://course.buildwithoutcode.com</a>\r\n<h1>Topics covered:</h1>\r\nWhat do I need to do to get my website set up initially <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">2:02</a>\r\nWhat is a domain name, how to choose the right name <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">3:19</a>\r\nHow to register a domain name <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">9:08</a>\r\nWhat is web hosting <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">11:11</a>\r\nWhere to get web hosting, how to get the cheapest hosting <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">12:17</a>\r\nHow to connect your domain name and web host (point domain to hosting)<a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">16:50</a>\r\nHow to install WordPress <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">18:08</a>\r\nHow to deactivate and delete plugins <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">23:24</a>\r\nHow to customize the design of your site <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">24:13</a>\r\nHow to add / install a new theme (free theme) <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">24:38</a>\r\nHow to add image posts <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">26:10</a>\r\nHow to add an image gallery or photo album post <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">30:52</a>\r\nHow to add a responsive light box, how to add / install a plugin <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">36:09</a>\r\nHow to delete a post <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">38:18</a>\r\nHow to delete a page <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">40:38</a>\r\nHow to add a new page (about me and FAQs pages) <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">40:55</a>\r\nHow to add a Contact Us or Get in Touch page with contact form <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">43:08</a>\r\nHow to customize the sidebar, how to add your logo <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">46:30</a>\r\nWhat are widgets, how to add, remove, and customize widgets <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">47:18</a>\r\nHow to add one touch call and one touch email buttons on the mobile version of the site <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">49:13</a>', 'How to Make an Online Portfolio Website from Scratch', '', 'publish', 'open', 'open', '', 'how-to-make-an-online-portfolio-website-from-scratch', '', '', '2018-10-22 09:59:20', '2018-10-22 09:59:20', '', 0, 'http://localhost:81/wordpress/?p=34', 0, 'post', '', 0),
(35, 1, '2018-10-22 08:19:19', '2018-10-22 08:19:19', '', 'How-to-Make-an-Online-Portfolio-Website-from-Scratch-For-Photographers-Designers-etc.', '', 'inherit', 'open', 'closed', '', 'how-to-make-an-online-portfolio-website-from-scratch-for-photographers-designers-etc', '', '', '2018-10-22 08:19:19', '2018-10-22 08:19:19', '', 34, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/How-to-Make-an-Online-Portfolio-Website-from-Scratch-For-Photographers-Designers-etc..jpeg', 0, 'attachment', 'image/jpeg', 0),
(36, 1, '2018-10-22 08:19:57', '2018-10-22 08:19:57', 'In this video we’ll create an actual portfolio website, step by step, from start to finish. The site uses the Fukasawa theme, which is designed to be minimalistic and clean<!--more-->, with a Pinterest-style grid for displaying images, posts, and videos. It’s the perfect site for photographers, designers, and other professionals to showcase their work.\r\n\r\nhttps://youtu.be/3CvqRjQiapo\r\n\r\nWeb Hosting- <a class="yt-uix-redirect-link" dir="ltr" title="http://www.HostGator.com" href="http://blog.buildwithoutcode.com/go/hostgator/" target="_blank" rel="nofollow noopener">HostGator.com</a> (25% coupon code: buildwithoutcode)\r\n\r\nDomain Name- <a class="yt-uix-redirect-link" dir="ltr" title="http://www.NameCheap.com" href="http://blog.buildwithoutcode.com/go/namecheap/" target="_blank" rel="nofollow noopener">NameCheap.com</a>\r\n\r\nFor more in-depth web development and WordPress training, check out: <a class="yt-uix-redirect-link" dir="ltr" title="http://course.buildwithoutcode.com" href="http://course.buildwithoutcode.com/" target="_blank" rel="nofollow noopener">http://course.buildwithoutcode.com</a>\r\n<h1>Topics covered:</h1>\r\nWhat do I need to do to get my website set up initially <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">2:02</a>\r\nWhat is a domain name, how to choose the right name <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">3:19</a>\r\nHow to register a domain name <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">9:08</a>\r\nWhat is web hosting <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">11:11</a>\r\nWhere to get web hosting, how to get the cheapest hosting <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">12:17</a>\r\nHow to connect your domain name and web host (point domain to hosting)<a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">16:50</a>\r\nHow to install WordPress <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">18:08</a>\r\nHow to deactivate and delete plugins <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">23:24</a>\r\nHow to customize the design of your site <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">24:13</a>\r\nHow to add / install a new theme (free theme) <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">24:38</a>\r\nHow to add image posts <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">26:10</a>\r\nHow to add an image gallery or photo album post <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">30:52</a>\r\nHow to add a responsive light box, how to add / install a plugin <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">36:09</a>\r\nHow to delete a post <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">38:18</a>\r\nHow to delete a page <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">40:38</a>\r\nHow to add a new page (about me and FAQs pages) <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">40:55</a>\r\nHow to add a Contact Us or Get in Touch page with contact form <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">43:08</a>\r\nHow to customize the sidebar, how to add your logo <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">46:30</a>\r\nWhat are widgets, how to add, remove, and customize widgets <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">47:18</a>\r\nHow to add one touch call and one touch email buttons on the mobile version of the site <a href="https://www.youtube.com/watch?v=3CvqRjQiapo#">49:13</a>', 'How to Make an Online Portfolio Website from Scratch', '', 'inherit', 'closed', 'closed', '', '34-revision-v1', '', '', '2018-10-22 08:19:57', '2018-10-22 08:19:57', '', 34, 'http://localhost:81/wordpress/34-revision-v1/', 0, 'revision', '', 0),
(37, 1, '2018-10-22 08:24:52', '2018-10-22 08:24:52', 'https://youtu.be/4fIV_fIiANU', 'What is Web Hosting & Why Do You Need It?', '', 'publish', 'open', 'open', '', 'what-is-web-hosting-why-do-you-need-it', '', '', '2018-10-22 08:24:52', '2018-10-22 08:24:52', '', 0, 'http://localhost:81/wordpress/?p=37', 0, 'post', '', 1),
(38, 1, '2018-10-22 08:24:41', '2018-10-22 08:24:41', '', 'C', '', 'inherit', 'open', 'closed', '', 'c', '', '', '2018-10-22 08:24:41', '2018-10-22 08:24:41', '', 37, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/C.jpg', 0, 'attachment', 'image/jpeg', 0),
(39, 1, '2018-10-22 08:24:52', '2018-10-22 08:24:52', 'https://youtu.be/4fIV_fIiANU', 'What is Web Hosting & Why Do You Need It?', '', 'inherit', 'closed', 'closed', '', '37-revision-v1', '', '', '2018-10-22 08:24:52', '2018-10-22 08:24:52', '', 37, 'http://localhost:81/wordpress/37-revision-v1/', 0, 'revision', '', 0),
(40, 1, '2018-10-22 08:25:41', '2018-10-22 08:25:41', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2018-10-22 08:25:41', '2018-10-22 08:25:41', '', 1, 'http://localhost:81/wordpress/1-revision-v1/', 0, 'revision', '', 0),
(41, 1, '2018-10-22 08:46:28', '2018-10-22 08:46:28', '', 'cropped-site-icon', '', 'inherit', 'open', 'closed', '', 'cropped-site-icon', '', '', '2018-10-22 08:46:28', '2018-10-22 08:46:28', '', 0, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-site-icon.png', 0, 'attachment', 'image/png', 0),
(42, 1, '2018-10-22 08:46:32', '2018-10-22 08:46:32', 'http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-cropped-site-icon.png', 'cropped-cropped-site-icon.png', '', 'inherit', 'open', 'closed', '', 'cropped-cropped-site-icon-png', '', '', '2018-10-22 08:46:32', '2018-10-22 08:46:32', '', 0, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-cropped-site-icon.png', 0, 'attachment', 'image/png', 0),
(43, 1, '2018-10-22 08:46:57', '2018-10-22 08:46:57', '{\n    "site_icon": {\n        "value": 42,\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 08:46:57"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '40247634-5512-426b-864c-115ebb36b15a', '', '', '2018-10-22 08:46:57', '2018-10-22 08:46:57', '', 0, 'http://localhost:81/wordpress/40247634-5512-426b-864c-115ebb36b15a/', 0, 'customize_changeset', '', 0),
(44, 1, '2018-10-22 08:48:37', '2018-10-22 08:48:37', '{\n    "alizee::primary_color": {\n        "value": "#e96655",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 08:48:37"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '5c4cdb71-e0c1-4366-92e1-f0c90418f596', '', '', '2018-10-22 08:48:37', '2018-10-22 08:48:37', '', 0, 'http://localhost:81/wordpress/?p=44', 0, 'customize_changeset', '', 0),
(45, 1, '2018-10-22 08:50:00', '2018-10-22 08:50:00', '', 'c700x420', '', 'inherit', 'open', 'closed', '', 'c700x420', '', '', '2018-10-22 08:50:00', '2018-10-22 08:50:00', '', 0, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/c700x420.jpg', 0, 'attachment', 'image/jpeg', 0),
(46, 1, '2018-10-22 08:50:31', '2018-10-22 08:50:31', '', 'Web Design layout sketch drawing Software Media WWW and Graphic Layout Website development project', 'Web Design layout sketch drawing Software Media WWW and Graphic Layout Website development project', 'inherit', 'open', 'closed', '', 'web-design-layout-sketch-drawing-software-media-www-and-graphic-layout-website-development-project', '', '', '2018-10-22 08:50:31', '2018-10-22 08:50:31', '', 0, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/website_design_screen_en_istock-827896866.260x0-is.jpg', 0, 'attachment', 'image/jpeg', 0),
(47, 1, '2018-10-22 08:52:20', '2018-10-22 08:52:20', '', 'cropped-website_design_screen_en_istock-827896866.260x0-is-1.jpg', '', 'inherit', 'closed', 'closed', '', 'cropped-website_design_screen_en_istock-827896866-260x0-is-jpg', '', '', '2018-10-22 08:52:20', '2018-10-22 08:52:20', '', 0, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-website_design_screen_en_istock-827896866.260x0-is.jpg', 0, 'attachment', 'image/jpeg', 0),
(48, 1, '2018-10-22 09:02:59', '2018-10-22 09:02:59', '{\n    "alizee::header_image": {\n        "value": "http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2.jpg",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 09:02:59"\n    },\n    "alizee::header_image_data": {\n        "value": {\n            "url": "http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2.jpg",\n            "thumbnail_url": "http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2.jpg",\n            "timestamp": 1540198969851,\n            "attachment_id": 54,\n            "width": 1920,\n            "height": 714\n        },\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 09:02:59"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'd06101bd-1b31-45ec-bc1c-d2c16024fba5', '', '', '2018-10-22 09:02:59', '2018-10-22 09:02:59', '', 0, 'http://localhost:81/wordpress/?p=48', 0, 'customize_changeset', '', 0),
(49, 1, '2018-10-22 08:51:20', '2018-10-22 08:51:20', '', 'cropped-c700x420.jpg', '', 'inherit', 'open', 'closed', '', 'cropped-c700x420-jpg', '', '', '2018-10-22 08:51:20', '2018-10-22 08:51:20', '', 0, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-c700x420.jpg', 0, 'attachment', 'image/jpeg', 0),
(50, 1, '2018-10-22 08:51:48', '2018-10-22 08:51:48', '', 'cropped-home-office-438386_1920.jpg', '', 'inherit', 'open', 'closed', '', 'cropped-home-office-438386_1920-jpg', '', '', '2018-10-22 08:51:48', '2018-10-22 08:51:48', '', 0, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-home-office-438386_1920.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(51, 1, '2018-10-22 08:57:41', '2018-10-22 08:57:41', '', 'laptop-2557466_1920-560x420', '', 'inherit', 'open', 'closed', '', 'laptop-2557466_1920-560x420', '', '', '2018-10-22 08:57:41', '2018-10-22 08:57:41', '', 0, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/laptop-2557466_1920-560x420.jpg', 0, 'attachment', 'image/jpeg', 0),
(52, 1, '2018-10-22 08:57:56', '2018-10-22 08:57:56', '', 'cropped-laptop-2557466_1920-560x420.jpg', '', 'inherit', 'open', 'closed', '', 'cropped-laptop-2557466_1920-560x420-jpg', '', '', '2018-10-22 08:57:56', '2018-10-22 08:57:56', '', 0, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-laptop-2557466_1920-560x420.jpg', 0, 'attachment', 'image/jpeg', 0),
(53, 1, '2018-10-22 09:01:20', '2018-10-22 09:01:20', '', '5-things-to-consider-when-selecting-a-web-design-agency-1-1', '', 'inherit', 'open', 'closed', '', '5-things-to-consider-when-selecting-a-web-design-agency-1-1', '', '', '2018-10-22 09:01:20', '2018-10-22 09:01:20', '', 0, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/5-things-to-consider-when-selecting-a-web-design-agency-1-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(54, 1, '2018-10-22 09:02:47', '2018-10-22 09:02:47', '', 'cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-2.jpg', '', 'inherit', 'closed', 'closed', '', 'cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1-jpg', '', '', '2018-10-22 09:02:47', '2018-10-22 09:02:47', '', 0, 'http://localhost:81/wordpress/wp-content/uploads/2018/10/cropped-5-things-to-consider-when-selecting-a-web-design-agency-1-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(55, 1, '2018-10-22 09:32:35', '0000-00-00 00:00:00', '', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-10-22 09:32:35', '0000-00-00 00:00:00', '', 0, 'http://localhost:81/wordpress/?p=55', 1, 'nav_menu_item', '', 0),
(56, 1, '2018-10-22 09:34:04', '0000-00-00 00:00:00', '', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-10-22 09:34:04', '0000-00-00 00:00:00', '', 0, 'http://localhost:81/wordpress/?p=56', 1, 'nav_menu_item', '', 0),
(57, 1, '2018-10-22 09:36:00', '0000-00-00 00:00:00', '', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-10-22 09:36:00', '0000-00-00 00:00:00', '', 0, 'http://localhost:81/wordpress/?p=57', 1, 'nav_menu_item', '', 0),
(58, 1, '2018-10-22 09:37:16', '0000-00-00 00:00:00', '', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2018-10-22 09:37:16', '0000-00-00 00:00:00', '', 0, 'http://localhost:81/wordpress/?p=58', 1, 'nav_menu_item', '', 0),
(59, 1, '2018-10-22 09:38:39', '2018-10-22 09:38:39', '', 'Menu Item', '', 'publish', 'closed', 'closed', '', 'menu-item', '', '', '2018-10-22 09:42:13', '2018-10-22 09:42:13', '', 0, 'http://localhost:81/wordpress/?p=59', 1, 'nav_menu_item', '', 0),
(60, 1, '2018-10-22 09:41:12', '2018-10-22 09:41:12', '', 'Menu Item', '', 'publish', 'closed', 'closed', '', 'menu-item-2', '', '', '2018-10-22 09:42:13', '2018-10-22 09:42:13', '', 0, 'http://localhost:81/wordpress/?p=60', 2, 'nav_menu_item', '', 0),
(61, 1, '2018-10-22 09:41:12', '2018-10-22 09:41:12', '', 'Menu Item', '', 'publish', 'closed', 'closed', '', 'menu-item-3', '', '', '2018-10-22 09:42:13', '2018-10-22 09:42:13', '', 0, 'http://localhost:81/wordpress/?p=61', 3, 'nav_menu_item', '', 0),
(62, 1, '2018-10-22 09:41:13', '2018-10-22 09:41:13', '', 'Menu Item', '', 'publish', 'closed', 'closed', '', 'menu-item-4', '', '', '2018-10-22 09:42:13', '2018-10-22 09:42:13', '', 0, 'http://localhost:81/wordpress/?p=62', 4, 'nav_menu_item', '', 0),
(63, 1, '2018-10-22 10:10:49', '2018-10-22 10:10:49', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2018-10-22 10:11:55', '2018-10-22 10:11:55', '', 0, 'http://localhost:81/wordpress/?p=63', 1, 'nav_menu_item', '', 0),
(64, 1, '2018-10-22 10:10:49', '2018-10-22 10:10:49', ' ', '', '', 'publish', 'closed', 'closed', '', '64', '', '', '2018-10-22 10:11:55', '2018-10-22 10:11:55', '', 0, 'http://localhost:81/wordpress/?p=64', 2, 'nav_menu_item', '', 0),
(65, 1, '2018-10-22 10:10:49', '2018-10-22 10:10:49', ' ', '', '', 'publish', 'closed', 'closed', '', '65', '', '', '2018-10-22 10:11:55', '2018-10-22 10:11:55', '', 0, 'http://localhost:81/wordpress/?p=65', 3, 'nav_menu_item', '', 0),
(66, 1, '2018-10-22 10:10:49', '2018-10-22 10:10:49', ' ', '', '', 'publish', 'closed', 'closed', '', '66', '', '', '2018-10-22 10:11:55', '2018-10-22 10:11:55', '', 0, 'http://localhost:81/wordpress/?p=66', 4, 'nav_menu_item', '', 0),
(67, 1, '2018-10-22 10:30:34', '2018-10-22 10:30:34', '{\n    "alizee::site_logo": {\n        "value": "",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 10:19:46"\n    },\n    "alizee::site_favicon": {\n        "value": "",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 10:20:46"\n    },\n    "alizee::alizee_scroller": {\n        "value": false,\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 10:30:34"\n    },\n    "alizee::headings_fonts": {\n        "value": "Arvo:400,700,400italic,700italic",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 10:21:46"\n    },\n    "alizee::background_color": {\n        "value": "#ededed",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 10:30:34"\n    },\n    "alizee::menu_color": {\n        "value": "#3c3c3c",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 10:24:45"\n    },\n    "alizee::site_title_color": {\n        "value": "#9f4de2",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 10:25:46"\n    },\n    "alizee::site_desc_color": {\n        "value": "#ffafaf",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 10:27:46"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'dcaf045e-8797-4001-afcd-3c0a7108169b', '', '', '2018-10-22 10:30:34', '2018-10-22 10:30:34', '', 0, 'http://localhost:81/wordpress/?p=67', 0, 'customize_changeset', '', 0),
(68, 1, '2018-10-22 10:32:37', '2018-10-22 10:32:37', '{\n    "alizee::site_title_color": {\n        "value": "#e96655",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 10:32:37"\n    },\n    "alizee::site_desc_color": {\n        "value": "#230f00",\n        "type": "theme_mod",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 10:32:37"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '569218de-d113-4c81-a541-d1fe0173f856', '', '', '2018-10-22 10:32:37', '2018-10-22 10:32:37', '', 0, 'http://localhost:81/wordpress/569218de-d113-4c81-a541-d1fe0173f856/', 0, 'customize_changeset', '', 0),
(69, 1, '2018-10-22 10:39:49', '2018-10-22 10:39:49', '{\n    "blogname": {\n        "value": "Build without <Code/> Blog",\n        "type": "option",\n        "user_id": 1,\n        "date_modified_gmt": "2018-10-22 10:39:49"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '873dfb02-5261-4447-bc92-47365128ebe4', '', '', '2018-10-22 10:39:49', '2018-10-22 10:39:49', '', 0, 'http://localhost:81/wordpress/873dfb02-5261-4447-bc92-47365128ebe4/', 0, 'customize_changeset', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_termmeta`
--

INSERT INTO `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(1, 16, 'order', '0'),
(2, 16, 'display_type', 'products'),
(3, 16, 'thumbnail_id', '0'),
(4, 15, 'display_type', ''),
(5, 15, 'thumbnail_id', '0'),
(6, 15, 'product_count_product_cat', '1'),
(7, 16, 'product_count_product_cat', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'simple', 'simple', 0),
(3, 'grouped', 'grouped', 0),
(4, 'variable', 'variable', 0),
(5, 'external', 'external', 0),
(6, 'exclude-from-search', 'exclude-from-search', 0),
(7, 'exclude-from-catalog', 'exclude-from-catalog', 0),
(8, 'featured', 'featured', 0),
(9, 'outofstock', 'outofstock', 0),
(10, 'rated-1', 'rated-1', 0),
(11, 'rated-2', 'rated-2', 0),
(12, 'rated-3', 'rated-3', 0),
(13, 'rated-4', 'rated-4', 0),
(14, 'rated-5', 'rated-5', 0),
(15, 'music', 'music', 0),
(16, 'clothing', 'clothing', 0),
(17, 'Mini courses', 'mini-courses', 0),
(18, 'wordpress', 'wordpress', 0),
(19, 'Hosting', 'hosting', 0),
(20, 'Social Media', 'social-media', 0),
(21, 'Primary', 'primary', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(15, 2, 0),
(15, 15, 0),
(17, 2, 0),
(17, 16, 0),
(21, 17, 0),
(25, 17, 0),
(31, 18, 0),
(34, 17, 0),
(37, 19, 0),
(59, 20, 0),
(60, 20, 0),
(61, 20, 0),
(62, 20, 0),
(63, 21, 0),
(64, 21, 0),
(65, 21, 0),
(66, 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'product_type', '', 0, 2),
(3, 3, 'product_type', '', 0, 0),
(4, 4, 'product_type', '', 0, 0),
(5, 5, 'product_type', '', 0, 0),
(6, 6, 'product_visibility', '', 0, 0),
(7, 7, 'product_visibility', '', 0, 0),
(8, 8, 'product_visibility', '', 0, 0),
(9, 9, 'product_visibility', '', 0, 0),
(10, 10, 'product_visibility', '', 0, 0),
(11, 11, 'product_visibility', '', 0, 0),
(12, 12, 'product_visibility', '', 0, 0),
(13, 13, 'product_visibility', '', 0, 0),
(14, 14, 'product_visibility', '', 0, 0),
(15, 15, 'product_cat', 'music', 0, 1),
(16, 16, 'product_cat', 'gadgets mobile phone and laptops', 0, 1),
(17, 17, 'category', '', 0, 3),
(18, 18, 'category', '', 0, 1),
(19, 19, 'category', '', 0, 1),
(20, 20, 'nav_menu', '', 0, 4),
(21, 21, 'nav_menu', '', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '20'),
(18, 1, '_woocommerce_persistent_cart_1', 'a:1:{s:4:"cart";a:0:{}}'),
(19, 1, 'wc_last_active', '1540252800'),
(20, 1, 'wp_user-settings', 'mfold=o&libraryContent=browse&editor=tinymce&hidetb=1'),
(21, 1, 'wp_user-settings-time', '1540195176'),
(22, 1, 'dismissed_install_notice', '1'),
(24, 1, 'closedpostboxes_product', 'a:0:{}'),
(25, 1, 'metaboxhidden_product', 'a:2:{i:0;s:10:"postcustom";i:1;s:7:"slugdiv";}'),
(26, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(27, 1, 'metaboxhidden_nav-menus', 'a:5:{i:0;s:21:"add-post-type-product";i:1;s:12:"add-post_tag";i:2;s:15:"add-post_format";i:3;s:15:"add-product_cat";i:4;s:15:"add-product_tag";}'),
(28, 1, 'nav_menu_recently_edited', '21'),
(29, 1, 'closedpostboxes_post', 'a:0:{}'),
(30, 1, 'metaboxhidden_post', 'a:6:{i:0;s:11:"postexcerpt";i:1;s:13:"trackbacksdiv";i:2;s:10:"postcustom";i:3;s:11:"commentsdiv";i:4;s:7:"slugdiv";i:5;s:9:"authordiv";}'),
(32, 1, 'session_tokens', 'a:3:{s:64:"cb5003cd1fd435279d66575e97cd4996780f113cd0fd7600157bf4d91eb7ca03";a:4:{s:10:"expiration";i:1540375530;s:2:"ip";s:3:"::1";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36";s:5:"login";i:1540202730;}s:64:"ca05ca6a85fc5d938ac34a6e5ab0441c8956b03032fa11bbdf7b308f652b785d";a:4:{s:10:"expiration";i:1540390817;s:2:"ip";s:3:"::1";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36";s:5:"login";i:1540218017;}s:64:"472c90734d8838e6716561fd81a86e70981f7d79a7e3c12b852ed608266db75b";a:4:{s:10:"expiration";i:1540447004;s:2:"ip";s:3:"::1";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36";s:5:"login";i:1540274204;}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$Br75NfLg3JweGD1EwpiQlZP4C04TE11', 'admin', '14bit008@nirmauni.ac.in', '', '2018-09-02 16:45:44', '', 0, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_download_log`
--

CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_webhooks`
--

CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT '0',
  `pending_delivery` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_api_keys`
--

CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_woocommerce_api_keys`
--

INSERT INTO `wp_woocommerce_api_keys` (`key_id`, `user_id`, `description`, `permissions`, `consumer_key`, `consumer_secret`, `nonces`, `truncated_key`, `last_access`) VALUES
(1, 1, 'mystore', 'read_write', '1f0beb4a1421116bee07b99afdd456d9235b87a922ee4c225a0914e36d16ae82', 'cs_3b2d8e1d14e46eddf223a0df37615aa20594fcf3', 'a:1:{i:1541080649;s:32:"ioBEXExG7qgZw215P2ClvTp8Wh0pH2u3";}', '7adf4e0', '2018-11-01 13:57:52');

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_attribute_taxonomies`
--

CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_downloadable_product_permissions`
--

CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_log`
--

CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_order_itemmeta`
--

CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_order_items`
--

CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_payment_tokenmeta`
--

CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `payment_token_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_payment_tokens`
--

CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_sessions`
--

CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_shipping_zones`
--

CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_shipping_zone_locations`
--

CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_shipping_zone_methods`
--

CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_tax_rates`
--

CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_tax_rate_locations`
--

CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10)),
  ADD KEY `woo_idx_comment_type` (`comment_type`);

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `wp_wc_download_log`
--
ALTER TABLE `wp_wc_download_log`
  ADD PRIMARY KEY (`download_log_id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `wp_wc_webhooks`
--
ALTER TABLE `wp_wc_webhooks`
  ADD PRIMARY KEY (`webhook_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `consumer_key` (`consumer_key`),
  ADD KEY `consumer_secret` (`consumer_secret`);

--
-- Indexes for table `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `attribute_name` (`attribute_name`(20));

--
-- Indexes for table `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  ADD KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `wp_woocommerce_log`
--
ALTER TABLE `wp_woocommerce_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indexes for table `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `wp_woocommerce_payment_tokenmeta`
--
ALTER TABLE `wp_woocommerce_payment_tokenmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `payment_token_id` (`payment_token_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indexes for table `wp_woocommerce_payment_tokens`
--
ALTER TABLE `wp_woocommerce_payment_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  ADD PRIMARY KEY (`session_key`),
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- Indexes for table `wp_woocommerce_shipping_zones`
--
ALTER TABLE `wp_woocommerce_shipping_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `wp_woocommerce_shipping_zone_locations`
--
ALTER TABLE `wp_woocommerce_shipping_zone_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- Indexes for table `wp_woocommerce_shipping_zone_methods`
--
ALTER TABLE `wp_woocommerce_shipping_zone_methods`
  ADD PRIMARY KEY (`instance_id`);

--
-- Indexes for table `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `tax_rate_country` (`tax_rate_country`),
  ADD KEY `tax_rate_state` (`tax_rate_state`(2)),
  ADD KEY `tax_rate_class` (`tax_rate_class`(10)),
  ADD KEY `tax_rate_priority` (`tax_rate_priority`);

--
-- Indexes for table `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;
--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=797;
--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;
--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_wc_download_log`
--
ALTER TABLE `wp_wc_download_log`
  MODIFY `download_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_wc_webhooks`
--
ALTER TABLE `wp_wc_webhooks`
  MODIFY `webhook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  MODIFY `key_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  MODIFY `permission_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_log`
--
ALTER TABLE `wp_woocommerce_log`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  MODIFY `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_payment_tokenmeta`
--
ALTER TABLE `wp_woocommerce_payment_tokenmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_payment_tokens`
--
ALTER TABLE `wp_woocommerce_payment_tokens`
  MODIFY `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  MODIFY `session_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_shipping_zones`
--
ALTER TABLE `wp_woocommerce_shipping_zones`
  MODIFY `zone_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_shipping_zone_locations`
--
ALTER TABLE `wp_woocommerce_shipping_zone_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_shipping_zone_methods`
--
ALTER TABLE `wp_woocommerce_shipping_zone_methods`
  MODIFY `instance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  MODIFY `tax_rate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `wp_wc_download_log`
--
ALTER TABLE `wp_wc_download_log`
  ADD CONSTRAINT `fk_wc_download_log_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `wp_woocommerce_downloadable_product_permissions` (`permission_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
