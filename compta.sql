-- phpMyAdmin SQL Dump
-- version 5.2.2deb1+deb13u1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 10 déc. 2025 à 10:08
-- Version du serveur : 11.8.3-MariaDB-0+deb13u1 from Debian
-- Version de PHP : 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `compta`
--

-- --------------------------------------------------------

--
-- Structure de la table `ARTICLE`
--

CREATE TABLE `ARTICLE` (
  `ID` int(11) NOT NULL,
  `REF` varchar(20) DEFAULT NULL,
  `DESIGNATION` varchar(255) DEFAULT NULL,
  `PRIX` decimal(10,2) DEFAULT NULL,
  `ID_FOU` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `ARTICLE`
--

INSERT INTO `ARTICLE` (`ID`, `REF`, `DESIGNATION`, `PRIX`, `ID_FOU`) VALUES
(1, 'A01', 'Perceuse P1', 74.99, 1),
(2, 'F01', 'Boulon laiton 4 x 40 mm (sachet de 10)', 2.25, 2),
(3, 'F02', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.45, 2),
(4, 'D01', 'Boulon laiton 5 x 40 mm (sachet de 10)', 4.40, 3),
(5, 'A02', 'Meuleuse 125mm', 37.85, 1),
(6, 'D03', 'Boulon acier zingué 4 x 40mm (sachet de 10)', 1.80, 3),
(7, 'A03', 'Perceuse à colonne', 185.25, 1),
(8, 'D04', 'Coffret mêches à bois', 12.25, 3),
(9, 'F03', 'Coffret mêches plates', 6.25, 2),
(10, 'F04', 'Fraises d\'encastrement', 8.14, 2);

-- --------------------------------------------------------

--
-- Structure de la table `BON`
--

CREATE TABLE `BON` (
  `ID` int(11) NOT NULL,
  `NUMERO` varchar(20) DEFAULT NULL,
  `DATE_CMDE` date DEFAULT NULL,
  `DELAI` int(11) DEFAULT NULL,
  `ID_FOU` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `BON`
--

INSERT INTO `BON` (`ID`, `NUMERO`, `DATE_CMDE`, `DELAI`, `ID_FOU`) VALUES
(1, '001', '2025-12-10', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `COMPO`
--

CREATE TABLE `COMPO` (
  `ID` int(11) NOT NULL,
  `QTE` int(11) DEFAULT NULL,
  `ID_ART` int(11) DEFAULT NULL,
  `ID_BON` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `COMPO`
--

INSERT INTO `COMPO` (`ID`, `QTE`, `ID_ART`, `ID_BON`) VALUES
(1, 3, 1, 1),
(2, 4, 5, 1),
(3, 1, 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `FOURNISSEUR`
--

CREATE TABLE `FOURNISSEUR` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Déchargement des données de la table `FOURNISSEUR`
--

INSERT INTO `FOURNISSEUR` (`ID`, `NOM`) VALUES
(1, 'Française d\'Imports'),
(2, 'FDM SA'),
(3, 'Dubois & Fils');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ARTICLE`
--
ALTER TABLE `ARTICLE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_FOU` (`ID_FOU`);

--
-- Index pour la table `BON`
--
ALTER TABLE `BON`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_FOU` (`ID_FOU`);

--
-- Index pour la table `COMPO`
--
ALTER TABLE `COMPO`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_ART` (`ID_ART`),
  ADD KEY `ID_BON` (`ID_BON`);

--
-- Index pour la table `FOURNISSEUR`
--
ALTER TABLE `FOURNISSEUR`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `COMPO`
--
ALTER TABLE `COMPO`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ARTICLE`
--
ALTER TABLE `ARTICLE`
  ADD CONSTRAINT `ARTICLE_ibfk_1` FOREIGN KEY (`ID_FOU`) REFERENCES `FOURNISSEUR` (`ID`);

--
-- Contraintes pour la table `BON`
--
ALTER TABLE `BON`
  ADD CONSTRAINT `BON_ibfk_1` FOREIGN KEY (`ID_FOU`) REFERENCES `FOURNISSEUR` (`ID`);

--
-- Contraintes pour la table `COMPO`
--
ALTER TABLE `COMPO`
  ADD CONSTRAINT `COMPO_ibfk_1` FOREIGN KEY (`ID_ART`) REFERENCES `ARTICLE` (`ID`),
  ADD CONSTRAINT `COMPO_ibfk_2` FOREIGN KEY (`ID_BON`) REFERENCES `BON` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
