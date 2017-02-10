-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2017 at 10:19 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `join`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getbySeferSirket` (IN `sirketler` INT(11))  NO SQL
select * from seferler inner join sirketler on seferler.sirket_id=sirketler.id where sirketler.name='air1_baki'$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `name`) VALUES
(4, 1, 'baki'),
(5, 3, 'istanbul'),
(6, 2, 'moskva'),
(7, 2, 'istanbul'),
(8, 2, 'istanbul'),
(9, 2, 'istanbul'),
(10, 2, 'istanbul');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`) VALUES
(1, 'Azerbaijan'),
(2, 'Russia'),
(3, 'Turkey'),
(4, 'USA'),
(5, 'Sweden');

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

CREATE TABLE `gates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gates`
--

INSERT INTO `gates` (`id`, `name`) VALUES
(1, 'gate1'),
(2, 'gate2'),
(3, 'gate3');

-- --------------------------------------------------------

--
-- Stand-in structure for view `gelecek_seferler`
--
CREATE TABLE `gelecek_seferler` (
`id` int(11)
,`city_id` int(11)
,`code` varchar(255)
,`sirket_id` int(11)
,`ucus_vaxti` timestamp
,`terminal_id` int(11)
,`gate_id` int(11)
,`type` tinyint(1)
,`ucus_novu` tinyint(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `seferler`
--

CREATE TABLE `seferler` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sirket_id` int(11) NOT NULL,
  `ucus_vaxti` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `terminal_id` int(11) NOT NULL,
  `gate_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `ucus_novu` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seferler`
--

INSERT INTO `seferler` (`id`, `city_id`, `code`, `sirket_id`, `ucus_vaxti`, `terminal_id`, `gate_id`, `type`, `ucus_novu`) VALUES
(3, 4, 'xxx478', 1, '2017-02-07 09:52:00', 1, 1, 1, 1),
(4, 5, 'xxx478', 1, '2017-02-15 09:37:00', 1, 1, 1, 1),
(5, 4, 'xxx478', 1, '2017-03-14 03:18:24', 1, 1, 1, 1),
(6, 4, 'xxx478', 1, '2017-02-06 03:20:31', 1, 1, 1, 1),
(7, 6, 'xxx478', 2, '2017-02-06 06:51:00', 2, 1, 1, 1),
(8, 5, 'xxx478', 2, '2017-02-06 05:22:29', 1, 3, 1, 1),
(9, 4, 'xxx478', 2, '2017-04-10 08:34:54', 1, 1, 1, 1),
(10, 5, 'xxx478', 3, '2017-02-08 03:32:36', 2, 3, 1, 1),
(11, 4, 'xxx478', 3, '2017-02-11 00:34:20', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sirketler`
--

CREATE TABLE `sirketler` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sirketler`
--

INSERT INTO `sirketler` (`id`, `name`, `country_id`) VALUES
(1, 'air1_baki', 1),
(2, 'air1_moskva', 2),
(3, 'air1_istanbul', 3);

-- --------------------------------------------------------

--
-- Table structure for table `terminals`
--

CREATE TABLE `terminals` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `terminals`
--

INSERT INTO `terminals` (`id`, `name`) VALUES
(1, 'terminal1'),
(2, 'terminal2'),
(3, 'terminal3');

-- --------------------------------------------------------

--
-- Structure for view `gelecek_seferler`
--
DROP TABLE IF EXISTS `gelecek_seferler`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gelecek_seferler`  AS  select `seferler`.`id` AS `id`,`seferler`.`city_id` AS `city_id`,`seferler`.`code` AS `code`,`seferler`.`sirket_id` AS `sirket_id`,`seferler`.`ucus_vaxti` AS `ucus_vaxti`,`seferler`.`terminal_id` AS `terminal_id`,`seferler`.`gate_id` AS `gate_id`,`seferler`.`type` AS `type`,`seferler`.`ucus_novu` AS `ucus_novu` from `seferler` where (`seferler`.`ucus_vaxti` > now()) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_fk0` (`country_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gates`
--
ALTER TABLE `gates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seferler`
--
ALTER TABLE `seferler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seferler_fk0` (`city_id`),
  ADD KEY `seferler_fk1` (`sirket_id`),
  ADD KEY `seferler_fk2` (`terminal_id`),
  ADD KEY `seferler_fk3` (`gate_id`);

--
-- Indexes for table `sirketler`
--
ALTER TABLE `sirketler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sirketler_fk0` (`country_id`);

--
-- Indexes for table `terminals`
--
ALTER TABLE `terminals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `gates`
--
ALTER TABLE `gates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `seferler`
--
ALTER TABLE `seferler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sirketler`
--
ALTER TABLE `sirketler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `terminals`
--
ALTER TABLE `terminals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_fk0` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `seferler`
--
ALTER TABLE `seferler`
  ADD CONSTRAINT `seferler_fk0` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `seferler_fk1` FOREIGN KEY (`sirket_id`) REFERENCES `sirketler` (`id`),
  ADD CONSTRAINT `seferler_fk2` FOREIGN KEY (`terminal_id`) REFERENCES `terminals` (`id`),
  ADD CONSTRAINT `seferler_fk3` FOREIGN KEY (`gate_id`) REFERENCES `gates` (`id`);

--
-- Constraints for table `sirketler`
--
ALTER TABLE `sirketler`
  ADD CONSTRAINT `sirketler_fk0` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
