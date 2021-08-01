-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2018 at 01:27 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adminId` int(11) NOT NULL,
  `adminName` varchar(255) NOT NULL,
  `adminUser` varchar(255) NOT NULL,
  `adminEmail` varchar(255) NOT NULL,
  `adminPass` varchar(32) NOT NULL,
  `level` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminId`, `adminName`, `adminUser`, `adminEmail`, `adminPass`, `level`) VALUES
(1, 'Md.Manirul Islam', 'admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brandId` int(11) NOT NULL,
  `brandName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(3, 'SAMSUNG'),
(4, 'ACER'),
(5, 'IPHONE'),
(6, 'Canon'),
(7, 'Delly');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartId` int(11) NOT NULL,
  `sId` varchar(255) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catId` int(11) NOT NULL,
  `catName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`) VALUES
(1, 'Watch'),
(2, 'Shoe'),
(3, 'Desktop'),
(4, 'Laptop'),
(5, 'Accesories'),
(6, 'Software'),
(7, 'Sports &amp; Fitness'),
(8, 'Footwear'),
(9, 'Jewellery'),
(10, 'Clothing'),
(11, 'Home Decor &amp; Kitchen'),
(12, 'Beauty &amp; Healthcare'),
(13, 'Toys, Kids &amp; Babies'),
(14, 'Toys, Kids &amp; Babies'),
(15, 'Toys'),
(16, 'Software');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `pcode` varchar(30) NOT NULL,
  `phone` int(11) NOT NULL,
  `mobile` int(11) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `city`, `country`, `pcode`, `phone`, `mobile`, `password`) VALUES
(6, 'Salman Sadik Saif', 'Tarapur, puthia, rajshahi', 'Rajshahi,', 'India', '6260', 1915985336, 1915985336, '123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `cmrId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `cmrId`, `productId`, `productName`, `quantity`, `price`, `image`, `date`, `status`) VALUES
(49, 6, 16, 'Stylist Watch', 4, 4000.00, 'uploads/b8ecfe79c1.jpg', '2018-07-03 17:23:07', 1),
(50, 6, 15, 'Wrist Watch', 5, 15000.00, 'uploads/a4e27c4113.png', '2018-07-03 17:23:07', 1),
(51, 6, 17, 'Hand Watch ', 4, 12000.00, 'uploads/9470d451d5.jpg', '2018-07-03 17:27:03', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `catId` int(255) NOT NULL,
  `brandId` int(11) NOT NULL,
  `body` text NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` tinyint(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `catId`, `brandId`, `body`, `price`, `image`, `type`) VALUES
(1, 'ACER', 4, 4, '<p><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span></p>', 505.22, 'uploads/7623348760.png', 1),
(11, 'IPHONE', 9, 5, '<p><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span><span>Lorem ipsum dolor sit amet sed do eiusmod.</span></p>', 3000.00, 'uploads/f141c053e8.png', 1),
(12, 'SAMSUNG', 9, 3, '<p><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span></p>', 505.22, 'uploads/ca0ef7e7d4.png', 2),
(13, 'ACER', 12, 4, '<p><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span></p>', 1000.00, 'uploads/03a57ab28d.jpg', 1),
(14, 'CANON', 6, 6, '<p><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span><span>Lorem ipsum dolor sit amet, sed do eiusmod.</span></p>', 505.22, 'uploads/2c72e6a352.png', 2),
(15, 'Wrist Watch', 12, 7, '<p>Without the right tools, finding just the right product can be an almost impossible task for the user. E-commerce product lists and their filtering and sorting tools determine how easy or difficult it is for the user to browse the site&rsquo;s product catalog.</p>\r\n<p>This is why we at the Baymard Institute have conducted an extensive large-scale usability study of how users scan, evaluate, filter and sort products within a product listing page.</p>\r\n<p>A group of users age 21-56 were recruited to test 19 leading e-commerce sites across 8 different verticals. Despite testing multi-million dollar sites, more than 700 usability issues related to product lists, filtering and sorting, arose during testing. All these issues have been analyzed and distilled into 93 concise guidelines on product list usability.</p>\r\n<p>From this research study we&rsquo;ve uncovered exactly what users expect as they interact with product lists on e-commerce sites, what typically goes wrong in the process, why it goes wrong, and what changes e-commerce sites can make to avoid these issues. In short: how to design a high-performing product list experience for your users.</p>\r\n<p>After all, if users can&rsquo;t easily browse your product lists, they can&rsquo;t easily find what they are looking for &ndash; and if they can&rsquo;t find it, they can&rsquo;t buy it.</p>\r\n<p><em>This page provides you an overview of our research specific to Product Listings &amp; Filtering UX.</em></p>', 3000.00, 'uploads/a4e27c4113.png', 1),
(16, 'Stylist Watch', 14, 5, '<p>Without the right tools, finding just the right product can be an almost impossible task for the user. E-commerce product lists and their filtering and sorting tools determine how easy or difficult it is for the user to browse the site&rsquo;s product catalog.</p>\r\n<p>This is why we at the Baymard Institute have conducted an extensive large-scale usability study of how users scan, evaluate, filter and sort products within a product listing page.</p>\r\n<p>A group of users age 21-56 were recruited to test 19 leading e-commerce sites across 8 different verticals. Despite testing multi-million dollar sites, more than 700 usability issues related to product lists, filtering and sorting, arose during testing. All these issues have been analyzed and distilled into 93 concise guidelines on product list usability.</p>\r\n<p>From this research study we&rsquo;ve uncovered exactly what users expect as they interact with product lists on e-commerce sites, what typically goes wrong in the process, why it goes wrong, and what changes e-commerce sites can make to avoid these issues. In short: how to design a high-performing product list experience for your users.</p>\r\n<p>After all, if users can&rsquo;t easily browse your product lists, they can&rsquo;t easily find what they are looking for &ndash; and if they can&rsquo;t find it, they can&rsquo;t buy it.</p>\r\n<p><em>This page provides you an overview of our research specific to Product Listings &amp; Filtering UX.</em></p>', 1000.00, 'uploads/b8ecfe79c1.jpg', 1),
(17, 'Hand Watch ', 8, 5, '<p>Without the right tools, finding just the right product can be an almost impossible task for the user. E-commerce product lists and their filtering and sorting tools determine how easy or difficult it is for the user to browse the site&rsquo;s product catalog.</p>\r\n<p>This is why we at the Baymard Institute have conducted an extensive large-scale usability study of how users scan, evaluate, filter and sort products within a product listing page.</p>\r\n<p>A group of users age 21-56 were recruited to test 19 leading e-commerce sites across 8 different verticals. Despite testing multi-million dollar sites, more than 700 usability issues related to product lists, filtering and sorting, arose during testing. All these issues have been analyzed and distilled into 93 concise guidelines on product list usability.</p>\r\n<p>From this research study we&rsquo;ve uncovered exactly what users expect as they interact with product lists on e-commerce sites, what typically goes wrong in the process, why it goes wrong, and what changes e-commerce sites can make to avoid these issues. In short: how to design a high-performing product list experience for your users.</p>\r\n<p>After all, if users can&rsquo;t easily browse your product lists, they can&rsquo;t easily find what they are looking for &ndash; and if they can&rsquo;t find it, they can&rsquo;t buy it.</p>\r\n<p><em>This page provides you an overview of our research specific to Product Listings &amp; Filtering UX.</em></p>', 3000.00, 'uploads/9470d451d5.jpg', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartId`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catId`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
