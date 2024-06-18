-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2023 at 10:48 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `solskemalice`
--

-- --------------------------------------------------------

--
-- Table structure for table `meniji`
--

CREATE TABLE `meniji` (
  `meni_id` int(11) NOT NULL,
  `opis` text NOT NULL,
  `datum_menija` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `vrstaMenija_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

--
-- Dumping data for table `meniji`
--

INSERT INTO `meniji` (`meni_id`, `opis`, `datum_menija`, `vrstaMenija_id`) VALUES
(55, 'piščanec z zelenjavno omako', '2023-06-19 22:00:00', 1),
(56, 'bučke z sirom in solata', '2023-06-19 22:00:00', 2),
(57, 'svinjska pečenka in solata', '2023-06-20 22:00:00', 1),
(58, 'pražena zelenjava s tofujem', '2023-06-20 22:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `narocila`
--

CREATE TABLE `narocila` (
  `narocila_id` int(11) NOT NULL,
  `datum_narocila` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `uporabnik_id` int(11) DEFAULT NULL,
  `meni_id` int(11) DEFAULT NULL,
  `vrstaMenija_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privilegiji`
--

CREATE TABLE `privilegiji` (
  `privilegij_id` int(11) NOT NULL,
  `ime` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

--
-- Dumping data for table `privilegiji`
--

INSERT INTO `privilegiji` (`privilegij_id`, `ime`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `slike`
--

CREATE TABLE `slike` (
  `slika_id` int(11) NOT NULL,
  `ime` varchar(255) NOT NULL,
  `meni_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

--
-- Dumping data for table `slike`
--

INSERT INTO `slike` (`slika_id`, `ime`, `meni_id`) VALUES
(46, 'njami.jpg', 55),
(47, 'bučke.jpg', 56),
(48, 'neki druzga.jpg', 57),
(49, 'vegi.jpg', 58);

-- --------------------------------------------------------

--
-- Table structure for table `uporabniki`
--

CREATE TABLE `uporabniki` (
  `uporabnik_id` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `priimek` varchar(50) NOT NULL,
  `email` varchar(128) NOT NULL,
  `geslo` varchar(255) NOT NULL,
  `privilegij_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

--
-- Dumping data for table `uporabniki`
--

INSERT INTO `uporabniki` (`uporabnik_id`, `ime`, `priimek`, `email`, `geslo`, `privilegij_id`) VALUES
(2, 'Jaka', 'Kosir', 'jaka.kosir05@gmail.com', 'geslo', 1),
(3, 'Nika', 'Kosir', 'nika.kosir12@gmail.com', 'gesloo', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vrstamenijev`
--

CREATE TABLE `vrstamenijev` (
  `vrstaMenija_id` int(11) NOT NULL,
  `ime` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

--
-- Dumping data for table `vrstamenijev`
--

INSERT INTO `vrstamenijev` (`vrstaMenija_id`, `ime`) VALUES
(1, 'mesni meni'),
(2, 'vegi meni'),
(3, 'pizza'),
(4, 'margarita'),
(5, 'hamburger');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `meniji`
--
ALTER TABLE `meniji`
  ADD PRIMARY KEY (`meni_id`),
  ADD KEY `vrstamenija` (`vrstaMenija_id`);

--
-- Indexes for table `narocila`
--
ALTER TABLE `narocila`
  ADD PRIMARY KEY (`narocila_id`),
  ADD KEY `IX_Relationship4` (`uporabnik_id`),
  ADD KEY `IX_Relationship9` (`meni_id`),
  ADD KEY `Relationship69` (`vrstaMenija_id`);

--
-- Indexes for table `privilegiji`
--
ALTER TABLE `privilegiji`
  ADD PRIMARY KEY (`privilegij_id`);

--
-- Indexes for table `slike`
--
ALTER TABLE `slike`
  ADD PRIMARY KEY (`slika_id`),
  ADD KEY `IX_Relationship12` (`meni_id`);

--
-- Indexes for table `uporabniki`
--
ALTER TABLE `uporabniki`
  ADD PRIMARY KEY (`uporabnik_id`),
  ADD KEY `IX_Relationship11` (`privilegij_id`);

--
-- Indexes for table `vrstamenijev`
--
ALTER TABLE `vrstamenijev`
  ADD PRIMARY KEY (`vrstaMenija_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `meniji`
--
ALTER TABLE `meniji`
  MODIFY `meni_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `narocila`
--
ALTER TABLE `narocila`
  MODIFY `narocila_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `privilegiji`
--
ALTER TABLE `privilegiji`
  MODIFY `privilegij_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `slike`
--
ALTER TABLE `slike`
  MODIFY `slika_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `uporabniki`
--
ALTER TABLE `uporabniki`
  MODIFY `uporabnik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vrstamenijev`
--
ALTER TABLE `vrstamenijev`
  MODIFY `vrstaMenija_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meniji`
--
ALTER TABLE `meniji`
  ADD CONSTRAINT `vrstamenija` FOREIGN KEY (`vrstaMenija_id`) REFERENCES `vrstamenijev` (`vrstaMenija_id`) ON UPDATE CASCADE;

--
-- Constraints for table `narocila`
--
ALTER TABLE `narocila`
  ADD CONSTRAINT `Relationship4` FOREIGN KEY (`uporabnik_id`) REFERENCES `uporabniki` (`uporabnik_id`),
  ADD CONSTRAINT `Relationship69` FOREIGN KEY (`vrstaMenija_id`) REFERENCES `vrstamenijev` (`vrstaMenija_id`),
  ADD CONSTRAINT `Relationship9` FOREIGN KEY (`meni_id`) REFERENCES `meniji` (`meni_id`);

--
-- Constraints for table `slike`
--
ALTER TABLE `slike`
  ADD CONSTRAINT `Relationship12` FOREIGN KEY (`meni_id`) REFERENCES `meniji` (`meni_id`);

--
-- Constraints for table `uporabniki`
--
ALTER TABLE `uporabniki`
  ADD CONSTRAINT `Relationship11` FOREIGN KEY (`privilegij_id`) REFERENCES `privilegiji` (`privilegij_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
