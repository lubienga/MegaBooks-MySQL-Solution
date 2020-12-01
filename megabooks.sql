-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2020 at 10:01 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `megabooks`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` varchar(15) NOT NULL,
  `First_name` varchar(30) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` varchar(20) NOT NULL,
  `First_name` varchar(30) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Start_date` date NOT NULL,
  `Position_held` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inv_product`
--

CREATE TABLE `inv_product` (
  `Inv_Num` varchar(8) NOT NULL,
  `Product_ID` varchar(20) NOT NULL,
  `Item_price` decimal(6,2) NOT NULL,
  `Item_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` varchar(20) NOT NULL,
  `Product_description` varchar(30) NOT NULL,
  `Cost_excl` decimal(6,2) NOT NULL,
  `Cost_incl` decimal(6,2) NOT NULL,
  `Current_stock` int(11) NOT NULL,
  `Supplier_ID` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchage_info`
--

CREATE TABLE `purchage_info` (
  `Inv_Num` varchar(8) NOT NULL,
  `Customer_ID` varchar(15) NOT NULL,
  `Employee_ID` varchar(20) NOT NULL,
  `Inv_Date` date NOT NULL,
  `Payment_status` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_ID` varchar(15) NOT NULL,
  `Full_name` varchar(30) NOT NULL,
  `Supplier_Tel` varchar(30) NOT NULL,
  `Supplier_Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Indexes for table `inv_product`
--
ALTER TABLE `inv_product`
  ADD PRIMARY KEY (`Inv_Num`,`Product_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`);

--
-- Indexes for table `purchage_info`
--
ALTER TABLE `purchage_info`
  ADD PRIMARY KEY (`Inv_Num`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inv_product`
--
ALTER TABLE `inv_product`
  ADD CONSTRAINT `inv_product_ibfk_1` FOREIGN KEY (`Inv_Num`) REFERENCES `purchage_info` (`Inv_Num`),
  ADD CONSTRAINT `inv_product_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`Supplier_ID`);

--
-- Constraints for table `purchage_info`
--
ALTER TABLE `purchage_info`
  ADD CONSTRAINT `purchage_info_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `purchage_info_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
