-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 12, 2020 at 03:33 PM
-- Server version: 8.0.18
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fuel`
--

-- --------------------------------------------------------

--
-- Table structure for table `transactions_audit`
--

CREATE TABLE `transactions_audit` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `typedechangement` enum('Nouveau','Modifié','Effacé') NOT NULL,
  `moment` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions_audit`
--

INSERT INTO `transactions_audit` (`id`, `transaction_id`, `typedechangement`) VALUES
(1, 4, 'Nouveau');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transactions_audit`
--
ALTER TABLE `transactions_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_transaction_id` (`transaction_id`),
  ADD KEY `ix_typedechangement` (`typedechangement`),
  ADD KEY `ix_moment` (`moment`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions_audit`
--
ALTER TABLE `transactions_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions_audit`
--
ALTER TABLE `transactions_audit`
  ADD CONSTRAINT `FK_audit_transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
