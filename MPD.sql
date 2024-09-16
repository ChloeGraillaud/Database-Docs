-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql:3306
-- Généré le : lun. 16 sep. 2024 à 09:48
-- Version du serveur : 8.0.39
-- Version de PHP : 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fil-rouge-chloe`
--

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `AjouterCommentaire`$$
CREATE DEFINER=`root`@`%` PROCEDURE `AjouterCommentaire` (IN `p_nomExpediteur` VARCHAR(50), IN `p_texte` VARCHAR(255))   BEGIN
    INSERT INTO Commentaire (Texte, CommentaireDate, NomExpediteur)
    VALUES (p_texte, NOW(), p_nomExpediteur);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
CREATE TABLE `Admin` (
  `idAdmin` int NOT NULL,
  `Nom` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Admin`
--

INSERT INTO `Admin` (`idAdmin`, `Nom`) VALUES
(1, 'Leonora'),
(2, 'Sabine'),
(3, 'Davide');

-- --------------------------------------------------------

--
-- Structure de la table `Categorie`
--

DROP TABLE IF EXISTS `Categorie`;
CREATE TABLE `Categorie` (
  `idCategorie` int NOT NULL,
  `Nom` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Categorie`
--

INSERT INTO `Categorie` (`idCategorie`, `Nom`) VALUES
(1, 'Portrait'),
(2, 'Paysage');

-- --------------------------------------------------------

--
-- Structure de la table `Commentaire`
--

DROP TABLE IF EXISTS `Commentaire`;
CREATE TABLE `Commentaire` (
  `idCommentaire` int NOT NULL,
  `Texte` varchar(255) DEFAULT NULL,
  `CommentaireDate` datetime DEFAULT NULL,
  `NomExpediteur` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Commentaire`
--

INSERT INTO `Commentaire` (`idCommentaire`, `Texte`, `CommentaireDate`, `NomExpediteur`) VALUES
(1, 'Service professionnel et photos magnifiques. Je recommande vivement !', '2024-09-08 16:14:40', 'Marie Dupont'),
(2, 'Une expérience incroyable, les photos sont sublimes !', '2024-09-08 16:14:40', 'Jean Martin'),
(3, 'Photographe talentueuse et à l\'écoute. Résultats au-delà de mes attentes', '2024-09-08 16:14:40', 'Sophie Durand'),
(4, 'Un service exceptionnel, nous sommes ravis du résultat.', '2024-09-08 16:14:40', 'Lucas Moreau'),
(5, 'Des photos magnifiques et une photographe très professionnelle.', '2024-09-08 16:14:40', 'Emma Leblanc'),
(6, 'Une expérience mémorable, les clichés de mon mariage sont magnifiques.', '2024-09-08 16:14:40', 'Thomas Girard'),
(7, 'Qualité irréprochable et résultats au-delà de mes espérances.', '2024-09-08 16:14:40', 'Julie Bernard\"'),
(8, 'Je suis ravi du résultat, un parfait souvenir de mon chien adoré.', '2024-09-08 16:14:40', 'Alexandre Petit'),
(9, 'Les photos de naissance de notre fils sont magnifiques, un souvenir précieux.', '2024-09-08 16:14:40', 'Camille Dubois'),
(10, 'Un travail fantastique, les images capturent parfaitement l\'esprit de notre fête.', '2024-09-08 16:14:40', 'Antoine Lefevre'),
(11, 'Je suis émerveillé par la qualité des photos de notre séance en famille.', '2024-09-08 16:14:40', 'Sophie Martin'),
(12, 'Un résultat exceptionnel, les portraits sont incroyables.', '2024-09-08 16:14:40', 'Laura Robinson'),
(13, 'Les photos de notre voyage sont splendides, merci pour ces souvenirs inoubliables.', '2024-09-08 16:14:40', 'Sarah Mitchell'),
(14, 'Une prestation de grande qualité, nous sommes très satisfaits des photos.', '2024-09-08 16:14:40', 'Michael Thompson'),
(15, 'Un service parfait du début à la fin, les photos sont tout simplement époustouflantes.', '2024-09-08 16:14:40', 'James Anderson');

--
-- Déclencheurs `Commentaire`
--
DROP TRIGGER IF EXISTS `BeforeInsertCommentaire`;
DELIMITER $$
CREATE TRIGGER `BeforeInsertCommentaire` BEFORE INSERT ON `Commentaire` FOR EACH ROW BEGIN
    IF NEW.Texte = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le commentaire ne peut pas être vide.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `Modification`
--

DROP TABLE IF EXISTS `Modification`;
CREATE TABLE `Modification` (
  `idModification` int NOT NULL,
  `idAdmin` int DEFAULT NULL,
  `idService` int DEFAULT NULL,
  `idPhoto` int DEFAULT NULL,
  `dateModification` datetime DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Modification`
--

INSERT INTO `Modification` (`idModification`, `idAdmin`, `idService`, `idPhoto`, `dateModification`, `commentaire`) VALUES
(1, 1, 1, NULL, '2024-09-08 16:22:40', 'Modification du prix du service Portrait'),
(2, 2, 2, 3, '2024-09-08 16:22:40', 'Suppression de la photo ID 3 du service Paysage'),
(3, 3, NULL, 4, '2024-09-08 16:22:40', 'Modification des détails de la photo ID 4'),
(4, 1, 5, NULL, '2024-09-08 16:22:40', 'Changement des paramètres du service Portrait'),
(5, 2, 6, NULL, '2024-09-08 16:22:40', 'Modification du service ID 6'),
(6, 3, NULL, 7, '2024-09-08 16:22:40', 'Ajout d’une photo ID 7 à la galerie de portraits');

-- --------------------------------------------------------

--
-- Structure de la table `Photo`
--

DROP TABLE IF EXISTS `Photo`;
CREATE TABLE `Photo` (
  `idPhoto` int NOT NULL,
  `photoDate` date DEFAULT NULL,
  `idService` int DEFAULT NULL,
  `idCategorie` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Photo`
--

INSERT INTO `Photo` (`idPhoto`, `photoDate`, `idService`, `idCategorie`) VALUES
(1, '2024-09-08', 1, 1),
(2, '2024-06-19', 3, 1),
(3, '2024-09-29', 5, 1),
(4, '2023-10-26', 2, 1),
(5, '2023-04-13', 4, 1),
(6, '2022-10-19', 6, 1),
(7, '2023-01-08', 1, 1),
(8, '2022-11-07', 3, 1),
(9, '2023-08-22', 1, 1),
(10, '2022-11-08', 2, 1),
(11, '2024-05-01', 2, 1),
(12, '2022-08-02', 2, 1),
(13, '2023-05-22', 9, 2),
(14, '2022-10-01', 9, 2),
(15, '2023-07-29', 9, 2),
(16, '2024-02-12', 9, 2),
(17, '2024-06-03', 9, 2),
(18, '2023-03-18', 9, 2),
(19, '2024-02-07', 9, 2),
(20, '2024-03-03', 9, 2),
(21, '2022-08-29', 9, 2),
(22, '2023-02-10', 9, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Service`
--

DROP TABLE IF EXISTS `Service`;
CREATE TABLE `Service` (
  `idService` int NOT NULL,
  `Nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `CategoriePrincipale` varchar(100) DEFAULT NULL,
  `SousCategorie1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `SousCategorie2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Prix` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Service`
--

INSERT INTO `Service` (`idService`, `Nom`, `Description`, `CategoriePrincipale`, `SousCategorie1`, `SousCategorie2`, `Prix`) VALUES
(1, 'Portrait', 'Portrait individuel humain en couleur', 'Humain', 'Couleur', 'Sujet seul', '120.00'),
(2, 'Portrait', 'Portrait individuel animal en couleur', 'Animal', 'Couleur', 'Sujet seul', '150.00'),
(3, 'Portrait', 'Portrait individuel humain en noir et blanc', 'Humain', 'Noir et Blanc', 'Sujet Seul', '100.00'),
(4, 'Portrait', 'Portrait individuel animal en noir et blanc', 'Animal', 'Noir et Blanc', 'Sujet Seul', '130.00'),
(5, 'Portrait', 'Portrait de groupe humain en couleur', 'Humain', 'Couleur', 'Groupe', '170.00'),
(6, 'Portrait', 'Portrait de groupe animal en couleur', 'Animal', 'Couleur', 'Groupe', '200.00'),
(7, 'Portrait', 'Portrait de groupe humain en noir et blanc', 'Humain', 'Noir et Blanc', 'Groupe', '150.00'),
(8, 'Portrait', 'Portrait de groupe animal en noir et blanc', 'Animal', 'Noir et Blanc', 'Groupe', '180.00'),
(9, 'Paysage', 'Photo de paysage naturel ou urbain', 'NULL', 'NULL', 'NULL', '200.00');

-- --------------------------------------------------------

--
-- Structure de la table `Verification`
--

DROP TABLE IF EXISTS `Verification`;
CREATE TABLE `Verification` (
  `idVerification` int NOT NULL,
  `idCommentaire` int DEFAULT NULL,
  `idAdmin` int DEFAULT NULL,
  `Statut` varchar(50) DEFAULT NULL,
  `DateVerification` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Verification`
--

INSERT INTO `Verification` (`idVerification`, `idCommentaire`, `idAdmin`, `Statut`, `DateVerification`) VALUES
(1, 1, 1, 'Approuvé', '2024-09-08 16:17:21'),
(2, 2, 2, 'En attente', '2024-09-08 16:17:21'),
(3, 3, 1, 'Rejeté', '2024-09-08 16:17:21'),
(4, 4, 3, 'Approuvé', '2024-09-08 16:17:21'),
(5, 5, 2, 'Approuvé', '2024-09-08 16:17:21');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_photos_categories`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_photos_categories`;
CREATE TABLE `vue_photos_categories` (
`idPhoto` int
,`photoDate` date
,`Categorie` varchar(25)
,`Service` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure de la vue `vue_photos_categories`
--
DROP TABLE IF EXISTS `vue_photos_categories`;

DROP VIEW IF EXISTS `vue_photos_categories`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vue_photos_categories`  AS SELECT `photo`.`idPhoto` AS `idPhoto`, `photo`.`photoDate` AS `photoDate`, `categorie`.`Nom` AS `Categorie`, `service`.`Nom` AS `Service` FROM ((`photo` join `categorie` on((`photo`.`idCategorie` = `categorie`.`idCategorie`))) join `service` on((`photo`.`idService` = `service`.`idService`)))  ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Index pour la table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `Commentaire`
--
ALTER TABLE `Commentaire`
  ADD PRIMARY KEY (`idCommentaire`);

--
-- Index pour la table `Modification`
--
ALTER TABLE `Modification`
  ADD PRIMARY KEY (`idModification`),
  ADD KEY `idAdmin` (`idAdmin`),
  ADD KEY `idService` (`idService`),
  ADD KEY `idPhoto` (`idPhoto`);

--
-- Index pour la table `Photo`
--
ALTER TABLE `Photo`
  ADD PRIMARY KEY (`idPhoto`),
  ADD KEY `idService` (`idService`),
  ADD KEY `FK_idCategorie` (`idCategorie`);

--
-- Index pour la table `Service`
--
ALTER TABLE `Service`
  ADD PRIMARY KEY (`idService`);

--
-- Index pour la table `Verification`
--
ALTER TABLE `Verification`
  ADD PRIMARY KEY (`idVerification`),
  ADD KEY `idCommentaire` (`idCommentaire`),
  ADD KEY `idAdmin` (`idAdmin`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Admin`
--
ALTER TABLE `Admin`
  MODIFY `idAdmin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `idCategorie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Commentaire`
--
ALTER TABLE `Commentaire`
  MODIFY `idCommentaire` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `Modification`
--
ALTER TABLE `Modification`
  MODIFY `idModification` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `Photo`
--
ALTER TABLE `Photo`
  MODIFY `idPhoto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `Service`
--
ALTER TABLE `Service`
  MODIFY `idService` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `Verification`
--
ALTER TABLE `Verification`
  MODIFY `idVerification` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Modification`
--
ALTER TABLE `Modification`
  ADD CONSTRAINT `modification_ibfk_1` FOREIGN KEY (`idAdmin`) REFERENCES `Admin` (`idAdmin`),
  ADD CONSTRAINT `modification_ibfk_2` FOREIGN KEY (`idService`) REFERENCES `Service` (`idService`),
  ADD CONSTRAINT `modification_ibfk_3` FOREIGN KEY (`idPhoto`) REFERENCES `Photo` (`idPhoto`);

--
-- Contraintes pour la table `Photo`
--
ALTER TABLE `Photo`
  ADD CONSTRAINT `FK_idCategorie` FOREIGN KEY (`idCategorie`) REFERENCES `Categorie` (`idCategorie`),
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`idService`) REFERENCES `Service` (`idService`);

--
-- Contraintes pour la table `Verification`
--
ALTER TABLE `Verification`
  ADD CONSTRAINT `verification_ibfk_1` FOREIGN KEY (`idCommentaire`) REFERENCES `Commentaire` (`idCommentaire`),
  ADD CONSTRAINT `verification_ibfk_2` FOREIGN KEY (`idAdmin`) REFERENCES `Admin` (`idAdmin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
