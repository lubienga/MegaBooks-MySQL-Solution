-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2020 at 08:12 AM
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

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `First_name`, `Last_name`, `Email`) VALUES
('100417548754', 'Thabo', 'Zet', 'thabo_zet@gmail.com'),
('2541417548752', 'Vivek', 'Ranchord', 'vivek.rand@yahoo.com'),
('3655417548758', 'Junior', 'Lubienga', 'juniorlubienga@gmail.com'),
('5685417548778', 'Romeo', 'nkosi', 'romeo_nko@gmail.com'),
('8965417548754', 'Marry', 'Vanheerden', 'Vanheerden@gmail.com');

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

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_ID`, `First_name`, `Last_name`, `Start_date`, `Position_held`) VALUES
('3203230938086', 'Fulufhelo', 'Zombene', '2019-01-17', 'Cashier'),
('3505100334081', 'Asanda', 'Motsinone', '2017-11-15', 'Cashier'),
('8512050670085', 'Tlou', 'Ramushi', '2016-06-16', 'Manager'),
('8612040918085', 'Tony ', 'Mgidi', '2019-08-15', 'Salesperson'),
('8902010959088', 'Job', 'Spengane', '2018-09-14', 'Salesperson');

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

--
-- Dumping data for table `inv_product`
--

INSERT INTO `inv_product` (`Inv_Num`, `Product_ID`, `Item_price`, `Item_quantity`) VALUES
('Inv001', 'education001', '1140.00', 2),
('Inv002', 'fiction001', '1197.00', 3),
('Inv003', 'fiction002', '1368.00', 4),
('Inv004', 'romance001', '285.00', 1),
('Inv005', 'romance002', '513.00', 1);

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

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Product_description`, `Cost_excl`, `Cost_incl`, `Current_stock`, `Supplier_ID`) VALUES
('education001', 'Math-Book 01', '500.00', '570.00', 60, '1902060828085'),
('education002', 'English book for africa', '500.00', '570.00', 45, '1902060828085'),
('fiction001', 'Lord of the reign', '350.00', '399.00', 50, '1002550239088'),
('fiction002', 'End of the world', '300.00', '342.00', 15, '1002550239088'),
('romance001', 'Love story', '250.00', '285.00', 25, '1308190287088'),
('romance002', 'Romeo and Juliet', '450.00', '513.00', 30, '1308190287088');

-- --------------------------------------------------------

--
-- Table structure for table `purchage_info`
--

CREATE TABLE `purchage_info` (
  `Inv_Num` varchar(8) NOT NULL,
  `Customer_ID` varchar(15) NOT NULL,
  `Employee_ID` varchar(20) NOT NULL,
  `Inv_Date` date NOT NULL,
  `Payment_status` varchar(3) NOT NULL,
  `Comments` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchage_info`
--

INSERT INTO `purchage_info` (`Inv_Num`, `Customer_ID`, `Employee_ID`, `Inv_Date`, `Payment_status`, `Comments`) VALUES
('Inv001', '100417548754', '3203230938086', '2020-11-04', 'Yes', ''),
('Inv002', '2541417548752', '3505100334081', '2020-11-10', 'Yes', ''),
('Inv003', '5685417548778', '8612040918085', '2020-11-12', 'Yes', ''),
('Inv004', '8965417548754', '8902010959088', '2020-11-13', 'Yes', ''),
('Inv005', '5685417548778', '8612040918085', '2020-11-18', 'No', '');

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
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_ID`, `Full_name`, `Supplier_Tel`, `Supplier_Email`) VALUES
('1002550239088', 'Brian Kekana', '(067)-(773)-(5345)', 'BKekana@myweb.co.za'),
('1308190287088', 'Josaya Chabvonga', '(079)-(644)-(8637)', 'JosayChabvo@mememail.org.za'),
('1902060828085', 'Xolile Gungudoo', '(076)-(526)-(1444)', 'Gungudoo@gmail.com'),
('2207010632083', 'Nyakallo Kupke', '(081)-(667)-(4505)', 'NKupk@privatemail.co.za'),
('9609270686085', 'Charl Wamala', '(063)-(856)-(5967)', 'Charl-g@yahoo.co.za');

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
  ADD UNIQUE KEY `Inv_Num` (`Inv_Num`),
  ADD UNIQUE KEY `Inv_Num_2` (`Inv_Num`),
  ADD KEY `Product_ID` (`Product_ID`),
  ADD KEY `Inv_Num_3` (`Inv_Num`),
  ADD KEY `Inv_Num_4` (`Inv_Num`);

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
