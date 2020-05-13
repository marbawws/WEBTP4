-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 12, 2020 at 03:37 PM
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
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `Daate` date NOT NULL,
  `Prix` double NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `retourInformation` varchar(255) DEFAULT NULL,
  `efface` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `Daate`, `Prix`, `utilisateur_id`, `retourInformation`) VALUES
(4, '2020-02-20', 54, 1, 'nul, vraiment nul'),
(5, '2020-02-28', 123, 1, 'vive la germanie'),
(7, '2020-02-19', 234, 1, 'L\'expérience était inoubiable!'),
(9, '2020-05-20', 25, 1, 'bien'),
(10, '2020-05-19', 25, 1, 'bien'),
(11, '2020-02-01', 72, 1, 'très bien'),
(12, '2020-05-04', 345, 1, 'magnifique');

--
-- Triggers `transactions`
--
DELIMITER $$
CREATE TRIGGER `transactions_after_insert` AFTER INSERT ON `transactions` FOR EACH ROW BEGIN
	
		IF NEW.efface THEN
			SET @changetype = 'Effacé';
		ELSE
			SET @changetype = 'Nouveau';
		END IF;
    
		INSERT INTO commentaires_audit (transaction_id, typedechangement) VALUES (NEW.id, @changetype);
		
    END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`,`utilisateur_id`),
  ADD KEY `ALTER TABLE Transaction DROP FOREIGN KEY Foreign_key_Utilisateur` (`utilisateur_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `ALTER TABLE Transaction DROP FOREIGN KEY Foreign_key_Utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
