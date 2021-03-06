-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 13, 2020 at 03:06 PM
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
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `Adresse` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `auteur` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `efface` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `Adresse`, `Description`, `auteur`, `transaction_id`, `efface`) VALUES
(1, '1876, rue de la maniere', 'l\'interaction s\'est effectuer dans le jardin', '', 4, 0),
(2, '1876, rue de la maniere', 'l\'interaction s\'est effectuer dans le jardin', '', 4, 0),
(6, 'montreal', 'belle ville', 'xxx@sss.zz', 10, 0),
(7, 'Dans le parc', 'Il fesait froid', 'aa@aa.xx', 12, 0);

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

INSERT INTO `transactions` (`id`, `Daate`, `Prix`, `utilisateur_id`, `retourInformation`, `efface`) VALUES
(4, '2020-02-20', 54, 1, 'nul, vraiment nul', 0),
(5, '2020-02-28', 123, 1, 'vive la germanie', 0),
(7, '2020-02-19', 234, 1, 'L\'expérience était inoubiable!', 0),
(9, '2020-05-20', 25, 1, 'bien', 0),
(10, '2020-05-19', 25, 1, 'bien', 0),
(11, '2020-02-01', 72, 1, 'très très bien', 0),
(12, '2020-05-04', 345, 1, 'magnifique', 0),
(23, '2020-05-14', 23, 1, 'test', 0);

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
    
		INSERT INTO transactions_audit (transaction_id, typedechangement) VALUES (NEW.id, @changetype);
		
    END
$$
DELIMITER ;

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
(1, 4, 'Nouveau'),
(2, 23, 'Nouveau');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `type`) VALUES
(1, 'ActionScript'),
(2, 'AppleScript'),
(3, 'Asp'),
(4, 'BASIC'),
(5, 'C'),
(6, 'C++'),
(7, 'Clojure'),
(8, 'COBOL'),
(9, 'ColdFusion'),
(10, 'Erlang'),
(11, 'Fortran'),
(12, 'Groovy'),
(13, 'Haskell'),
(14, 'Java'),
(15, 'JavaScript'),
(16, 'Lisp'),
(17, 'Perl'),
(18, 'PHP'),
(19, 'Python'),
(20, 'Ruby'),
(21, 'Scala'),
(22, 'Scheme');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `identifiant` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `identifiant`, `mot_de_passe`) VALUES
(1, 'Bob', 'bob123', 'bobobob123321'),
(2, 'Bob', 'bob123', 'bobobob123321');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-de-transaction-est-place-id` (`transaction_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`,`utilisateur_id`),
  ADD KEY `ALTER TABLE Transaction DROP FOREIGN KEY Foreign_key_Utilisateur` (`utilisateur_id`);

--
-- Indexes for table `transactions_audit`
--
ALTER TABLE `transactions_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_transaction_id` (`transaction_id`),
  ADD KEY `ix_typedechangement` (`typedechangement`),
  ADD KEY `ix_moment` (`moment`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `transactions_audit`
--
ALTER TABLE `transactions_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `places`
--
ALTER TABLE `places`
  ADD CONSTRAINT `fk-de-transaction-est-place-id` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `ALTER TABLE Transaction DROP FOREIGN KEY Foreign_key_Utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `transactions_audit`
--
ALTER TABLE `transactions_audit`
  ADD CONSTRAINT `FK_audit_transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
