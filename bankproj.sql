-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 10, 2020 at 09:55 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankproj`
--

-- --------------------------------------------------------

--
-- Table structure for table `acntdetails`
--

DROP TABLE IF EXISTS `acntdetails`;
CREATE TABLE IF NOT EXISTS `acntdetails` (
  `user_id` int(10) NOT NULL,
  `branchcode` varchar(6) NOT NULL,
  `Account_no` varchar(15) NOT NULL,
  `Currency_type` text NOT NULL,
  `Opening_date` date NOT NULL,
  `Aadhar_card` varchar(14) NOT NULL,
  `Pan_no` varchar(10) NOT NULL,
  `balance` double DEFAULT NULL,
  PRIMARY KEY (`Account_no`),
  UNIQUE KEY `aacard` (`Aadhar_card`),
  UNIQUE KEY `pacar` (`Pan_no`),
  KEY `user_id` (`user_id`),
  KEY `branchcode` (`branchcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acntdetails`
--

INSERT INTO `acntdetails` (`user_id`, `branchcode`, `Account_no`, `Currency_type`, `Opening_date`, `Aadhar_card`, `Pan_no`, `balance`) VALUES
(1, '000001', '500010010000001', 'INR', '2015-04-11', '4212 3328 9354', 'ABCD49139P', 2.2299999999996),
(2, '000001', '500010010000002', 'INR', '2020-08-25', '441683932431', '2131231', 11468.56);

-- --------------------------------------------------------

--
-- Table structure for table `bankdetails`
--

DROP TABLE IF EXISTS `bankdetails`;
CREATE TABLE IF NOT EXISTS `bankdetails` (
  `branchcode` varchar(6) NOT NULL,
  `IFSCcode` varchar(11) NOT NULL,
  `branchname` text NOT NULL,
  `address` text NOT NULL,
  `district` tinytext,
  `country` tinytext,
  `pincode` varchar(6) DEFAULT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `state` tinytext,
  `bankname` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`branchcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bankdetails`
--

INSERT INTO `bankdetails` (`branchcode`, `IFSCcode`, `branchname`, `address`, `district`, `country`, `pincode`, `phone_no`, `email`, `state`, `bankname`) VALUES
('000001', 'KVRA0000001', 'Anna Nagar', 'KVR Bank, Thirumangalam, Anna Nagar West, Anna Nagar', 'Chennai', 'India', '600040', '04426460680', 'kvrangr01@gmail.com', 'Tamil Nadu', 'KVRA');

-- --------------------------------------------------------

--
-- Table structure for table `creditcardinfo`
--

DROP TABLE IF EXISTS `creditcardinfo`;
CREATE TABLE IF NOT EXISTS `creditcardinfo` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uni` (`username`),
  UNIQUE KEY `uni2` (`password`),
  UNIQUE KEY `uni3` (`email`),
  UNIQUE KEY `uni4` (`phone_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `creditcardinfo`
--

INSERT INTO `creditcardinfo` (`user_id`, `name`, `username`, `password`, `email`, `phone_no`, `dob`) VALUES
(1, 'test', 'test12', 'Test@123', 'test@gmail.com', '9873621383', '0000-00-00'),
(2, 'Vibhav Aakash', 'projectdefence', 'dvsfcv fcv', 'koushalvibhav@gmail.com', '9030651794', '2020-08-13'),
(12, 'dfbfbd', 'rsv', 'dvsdvdaxS123@', 'koushalvibav@gmail.com', '9030653794', '2020-08-20');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `profile_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `dob` date NOT NULL,
  `gender` text NOT NULL,
  `address` varchar(100) NOT NULL,
  `district` text NOT NULL,
  `state` text NOT NULL,
  `phone_no` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pincode` int(8) DEFAULT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`profile_id`, `user_id`, `dob`, `gender`, `address`, `district`, `state`, `phone_no`, `email`, `pincode`) VALUES
(1, 1, '1983-11-06', 'Male', '243, Prabhat Indl Estate, Sarita, W E Highway, Dahisar', 'Mumbai', 'Maharashtra', '9118971632', 'test@gmail.com', 400068);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `branchcode` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `branchcode` (`branchcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `name`, `branchcode`) VALUES
(1, 'test', '1a52e17fa899cf40fb04cfc42e6352f1', 'Bot', '000001'),
(2, 'admin', '3167f748abd7e549c164479796a1d510', 'admin', '000001');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acntdetails`
--
ALTER TABLE `acntdetails`
  ADD CONSTRAINT `acntdetails_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `acntdetails_ibfk_2` FOREIGN KEY (`branchcode`) REFERENCES `bankdetails` (`branchcode`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`branchcode`) REFERENCES `bankdetails` (`branchcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
