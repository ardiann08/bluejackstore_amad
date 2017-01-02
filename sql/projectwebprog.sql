-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2017 at 10:47 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `projectwebprog`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `cartid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `tprice` int(11) NOT NULL,
  UNIQUE KEY `cartid` (`cartid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `insertby` int(11) NOT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productid`, `name`, `price`, `weight`, `stock`, `image`, `insertby`) VALUES
(1, 'Cooler Master MasterKeys Pro Sa', 1750000, 100, 100, 'keyboard1.jpg', 2),
(2, 'Cooler Master MasterKeys Pro Sa', 1750000, 100, 100, 'keyboard2.jpg', 2),
(3, 'keyboard SA. ext. versi 2', 900000, 500, 50, 'keyboard1.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `trid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `tprice` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`trid`),
  UNIQUE KEY `trid` (`trid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`trid`, `userid`, `tprice`, `status`, `time`) VALUES
(7, 1, 7920000, 'approve', '2017-01-02 07:46:49');

-- --------------------------------------------------------

--
-- Table structure for table `transactiondetail`
--

CREATE TABLE IF NOT EXISTS `transactiondetail` (
  `dtid` int(11) NOT NULL AUTO_INCREMENT,
  `trid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotalprice` int(11) NOT NULL,
  PRIMARY KEY (`dtid`),
  UNIQUE KEY `dtid` (`dtid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `transactiondetail`
--

INSERT INTO `transactiondetail` (`dtid`, `trid`, `productid`, `qty`, `subtotalprice`) VALUES
(4, 7, 1, 3, 5250000),
(5, 7, 2, 3, 2670000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `role` varchar(15) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `fullname`, `phone`, `email`, `password`, `gender`, `dob`, `address`, `photo`, `role`) VALUES
(1, 'test123 123', '673412312', 'tes@tes.com', '123123', 'female', '2016-12-21', 'asdfasdfasdfasdfasd', 'avatar.jpg', 'member'),
(2, 'administrator', '08123321123321', 'administrator@gmail.com', 'qwerty123', 'male', '2017-01-03', 'jalan rumah administrator', 'avatar.jpg', 'administrator');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
