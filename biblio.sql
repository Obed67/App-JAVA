-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 15 fév. 2024 à 18:51
-- Version du serveur :  10.1.34-MariaDB
-- Version de PHP :  7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `biblio`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnee`
--

CREATE TABLE `abonnee` (
  `idabonnee` int(10) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `telephone` int(8) NOT NULL,
  `email` varchar(50) NOT NULL,
  `statut` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `idauteur` int(10) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `prenom` varchar(60) NOT NULL,
  `contact` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idcategorie` int(10) NOT NULL,
  `nomcategorie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ecrire`
--

CREATE TABLE `ecrire` (
  `idecrire` int(11) NOT NULL,
  `idlivre` int(11) NOT NULL,
  `idauteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `emplacement`
--

CREATE TABLE `emplacement` (
  `idemplacement` int(10) NOT NULL,
  `etagere` varchar(100) NOT NULL,
  `rayon` int(100) NOT NULL,
  `position` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `emprunter`
--

CREATE TABLE `emprunter` (
  `idemprunter` int(10) NOT NULL,
  `dateemprunte` date NOT NULL,
  `dateretour` date NOT NULL,
  `idlivre` int(10) NOT NULL,
  `idabonnee` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `idlivre` int(10) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `isbn` int(30) NOT NULL,
  `auteur` varchar(50) NOT NULL,
  `langue` varchar(50) NOT NULL,
  `anneepublication` int(4) NOT NULL,
  `idmaisonedition` int(10) NOT NULL,
  `idcategorie` int(10) NOT NULL,
  `idemplacement` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `maisonedition`
--

CREATE TABLE `maisonedition` (
  `idmaisonedition` int(10) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `contact` int(8) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `stocker`
--

CREATE TABLE `stocker` (
  `idstocker` int(10) NOT NULL,
  `qtesotock` int(30) NOT NULL,
  `datestock` date NOT NULL,
  `idlivre` int(10) NOT NULL,
  `idemplacement` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonnee`
--
ALTER TABLE `abonnee`
  ADD PRIMARY KEY (`idabonnee`);

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`idauteur`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idcategorie`);

--
-- Index pour la table `ecrire`
--
ALTER TABLE `ecrire`
  ADD KEY `idauteur` (`idauteur`),
  ADD KEY `idlivre` (`idlivre`);

--
-- Index pour la table `emplacement`
--
ALTER TABLE `emplacement`
  ADD PRIMARY KEY (`idemplacement`);

--
-- Index pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD PRIMARY KEY (`idemprunter`),
  ADD KEY `idlivre` (`idlivre`),
  ADD KEY `idabonnee` (`idabonnee`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`idlivre`),
  ADD KEY `idcategorie` (`idcategorie`),
  ADD KEY `idemplacement` (`idemplacement`),
  ADD KEY `idmaisonedition` (`idmaisonedition`);

--
-- Index pour la table `maisonedition`
--
ALTER TABLE `maisonedition`
  ADD PRIMARY KEY (`idmaisonedition`);

--
-- Index pour la table `stocker`
--
ALTER TABLE `stocker`
  ADD PRIMARY KEY (`idstocker`),
  ADD KEY `idlivre` (`idlivre`),
  ADD KEY `idemplacement` (`idemplacement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonnee`
--
ALTER TABLE `abonnee`
  MODIFY `idabonnee` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `idauteur` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idcategorie` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emplacement`
--
ALTER TABLE `emplacement`
  MODIFY `idemplacement` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emprunter`
--
ALTER TABLE `emprunter`
  MODIFY `idemprunter` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `idlivre` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `maisonedition`
--
ALTER TABLE `maisonedition`
  MODIFY `idmaisonedition` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `stocker`
--
ALTER TABLE `stocker`
  MODIFY `idstocker` int(10) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ecrire`
--
ALTER TABLE `ecrire`
  ADD CONSTRAINT `ecrire_ibfk_1` FOREIGN KEY (`idauteur`) REFERENCES `auteur` (`idauteur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ecrire_ibfk_2` FOREIGN KEY (`idlivre`) REFERENCES `livres` (`idlivre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD CONSTRAINT `emprunter_ibfk_1` FOREIGN KEY (`idlivre`) REFERENCES `livres` (`idlivre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emprunter_ibfk_2` FOREIGN KEY (`idabonnee`) REFERENCES `abonnee` (`idabonnee`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livres`
--
ALTER TABLE `livres`
  ADD CONSTRAINT `livres_ibfk_1` FOREIGN KEY (`idcategorie`) REFERENCES `categorie` (`idcategorie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livres_ibfk_2` FOREIGN KEY (`idemplacement`) REFERENCES `emplacement` (`idemplacement`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livres_ibfk_3` FOREIGN KEY (`idmaisonedition`) REFERENCES `maisonedition` (`idmaisonedition`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stocker`
--
ALTER TABLE `stocker`
  ADD CONSTRAINT `stocker_ibfk_1` FOREIGN KEY (`idlivre`) REFERENCES `livres` (`idlivre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stocker_ibfk_2` FOREIGN KEY (`idemplacement`) REFERENCES `emplacement` (`idemplacement`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
