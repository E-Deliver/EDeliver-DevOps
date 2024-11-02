-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le : sam. 02 nov. 2024 à 01:51
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `edeliver`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `adresse` varchar(255) DEFAULT NULL,
  `id_client` bigint(20) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`adresse`, `id_client`, `telephone`, `id`) VALUES
('Martil Al Bayt Al Atiq', NULL, '0612345678', 2),
('Bd Anfa, Casablanca', NULL, '0623456789', 3),
('Derb Omar, Casablanca', NULL, '0634567890', 4),
('Hay Riad, Rabat', NULL, '0645678901', 5),
('Route de Meknès, Fès', NULL, '0656789012', 6),
('Avenue Mohammed V, Agadir', NULL, '0667890123', 7),
('Rue Oujda, Tanger', NULL, '0678901234', 8),
('Place Djemaa El Fna, Marrakech', NULL, '0689012345', 9),
('Quartier Palmier, Casablanca', NULL, '0690123456', 10),
('Boulevard Hassan II, Rabat', NULL, '0701234567', 11);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` bigint(20) NOT NULL,
  `adresse_livraison` varchar(255) DEFAULT NULL,
  `date_commande` varchar(255) DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `livreur_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `adresse_livraison`, `date_commande`, `statut`, `client_id`, `livreur_id`) VALUES
(1, 'Avenue Hassan II, Rabat', '2024-11-01T22:15:56.966984900', 'En cours', 2, 14),
(2, 'Bd Mohammed V, Casablanca', '2024-10-31T22:15:56.981002800', 'En cours', 3, 13),
(3, 'Rue Marrakech, Fès', '2024-10-30T22:15:56.991980700', 'Livrée', 4, 14),
(4, 'Rue de la Liberté, Tanger', '2024-10-29T22:15:57.001984', 'En cours', 2, 20),
(5, 'Boulevard Zerktouni, Casablanca', '2024-11-01T16:15:57.012982200', 'En cours', 3, 13),
(6, 'Quartier Agdal, Rabat', '2024-10-28T22:15:57.020024600', 'En cours', 4, 18),
(7, 'Avenue des Fleurs, Marrakech', '2024-10-27T22:15:57.030097500', 'Livrée', 2, 13),
(8, 'Rue des Palais, Rabat', '2024-10-26T22:15:57.036855800', 'En cours', 3, 14),
(9, 'Avenue Mohammed VI, Agadir', '2024-10-25T22:15:57.046814900', 'En cours', 4, 16),
(10, 'Place Jamaâ El Fna, Marrakech', '2024-10-24T22:15:57.053804200', 'Livrée', 2, 21);

-- --------------------------------------------------------

--
-- Structure de la table `commande_produits`
--

CREATE TABLE `commande_produits` (
  `id_commande` bigint(20) NOT NULL,
  `produit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande_produits`
--

INSERT INTO `commande_produits` (`id_commande`, `produit`) VALUES
(1, 'Livre'),
(1, 'Stylo'),
(2, 'Ordinateur'),
(2, 'Clavier'),
(3, 'Chaussures'),
(3, 'T-shirt'),
(4, 'Casque Audio'),
(4, 'Chargeur'),
(5, 'Sac à dos'),
(5, 'Bouteille d\'eau'),
(6, 'Clé USB'),
(6, 'Disque Dur Externe'),
(7, 'Bouquet de Fleurs'),
(7, 'Carte de Vœux'),
(8, 'Lampe de Bureau'),
(8, 'Agenda'),
(9, 'Parfum'),
(9, 'Montre'),
(10, 'Tajine'),
(10, 'Epices');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `etat` enum('DISPONIBLE','EN_LIVRAISON','INACTIF') DEFAULT NULL,
  `localisation` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`etat`, `localisation`, `id`) VALUES
('DISPONIBLE', 'Bd Al Qods, Casablanca', 12),
('DISPONIBLE', 'Hay Salam, Agadir', 13),
('DISPONIBLE', 'Avenue Mohammed V, Marrakech', 14),
('DISPONIBLE', 'Rue des Far, Fès', 15),
('DISPONIBLE', 'Boulevard Zerktouni, Casablanca', 16),
('DISPONIBLE', 'Quartier Hassan, Rabat', 17),
('DISPONIBLE', 'Boulevard Ghandi, Casablanca', 18),
('DISPONIBLE', 'Avenue de la Liberté, Tanger', 19),
('DISPONIBLE', 'Place El Massira, Laâyoune', 20),
('DISPONIBLE', 'Rue de Fès, Oujda', 21);

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `id_notification` bigint(20) NOT NULL,
  `date_envoi` datetime(6) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `id_client` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`id_notification`, `date_envoi`, `message`, `id_client`) VALUES
(1, '2024-11-01 22:15:57.000000', 'Votre commande No. 3 est désormais livrée avec succès !', 2),
(2, '2024-11-01 20:15:57.000000', 'Votre commande No. 2 est en cours de livraison.', 3),
(3, '2024-10-31 22:15:57.000000', 'Votre commande a été annulée', 4),
(4, '2024-11-01 19:15:57.000000', 'Votre commande No. 1 est en attente de livraison.', 2),
(5, '2024-11-01 17:15:57.000000', 'Votre commande No. 6 est en attente de livraison.', 3),
(6, '2024-10-30 22:15:57.000000', 'Votre commande No. 2 est en cours de livraison.', 4),
(7, '2024-10-29 22:15:57.000000', 'Votre commande No. 10 est en attente de livraison.', 2),
(8, '2024-11-01 15:15:57.000000', 'Votre commande No. 9 est désormais livrée avec succès !', 3),
(9, '2024-10-28 22:15:57.000000', 'Votre commande No. 6 est en attente de livraison.', 4),
(10, '2024-10-31 20:15:57.000000', 'Votre commande No. 7 est désormais livrée avec succès !', 2),
(11, '2024-11-01 22:18:05.000000', 'Votre commande No. 1 est en cours de livraison.', 2),
(12, '2024-11-01 22:18:09.000000', 'Votre commande No. 4 est en cours de livraison.', 2),
(13, '2024-11-01 22:18:16.000000', 'Votre commande No. 6 est en cours de livraison.', 4),
(14, '2024-11-01 22:18:30.000000', 'Votre commande No. 9 est en cours de livraison.', 4);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `role` enum('ADMINISTRATEUR','CLIENT','LIVREUR') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `address`, `email`, `mot_de_passe`, `nom`, `photo`, `role`) VALUES
(1, NULL, 'ali.bennis@example.com', '$2a$10$nEDOXr0QXoOW.SaUGkFL6.8xlhDPxsAz8zs8TvVATjNaRDPjXVYX.', 'Ali Bennis', NULL, 'ADMINISTRATEUR'),
(2, NULL, 'omar.elmadani@example.com', '$2a$10$0lDb6zjUDgX0o4OkIsU0d.OOKseuCXCO9AnAQVIuOJufIkU2MMTi6', 'Omar El Madani', NULL, 'CLIENT'),
(3, NULL, 'sara.amrani@example.com', '$2a$10$6sTMIDFr3ltYk/Ib7D.q6ejjtBzoZ1fwbHtIKi94Eft4BmjytiCW6', 'Sara El Amrani', NULL, 'CLIENT'),
(4, NULL, 'khalid.fassi@example.com', '$2a$10$cJg2BFvL9QVdQQ03CyCQtu1Bi58A2Ch2/5OldomeD2thybZbLL5Ye', 'Khalid El Fassi', NULL, 'CLIENT'),
(5, NULL, 'yasmine.mouline@example.com', '$2a$10$/7EsMfYs/JS5KU2QziKgvu4Dn0jUjgxIuCkn4UT4iZq.5F8X2EQVS', 'Yasmine Mouline', NULL, 'CLIENT'),
(6, NULL, 'hamid.zemmouri@example.com', '$2a$10$hUgN3AHar0ucHncSzbmxFueAQjRGHt72HXiiZF9GaJpBm032Q8kQy', 'Hamid Zemmouri', NULL, 'CLIENT'),
(7, NULL, 'nora.baz@example.com', '$2a$10$KKOEKzCUI8qdQxBgClX8K.Wf5vx08fhnq4RL1P9ahUtReIs.oMTpe', 'Nora El Baz', NULL, 'CLIENT'),
(8, NULL, 'mehdi.darif@example.com', '$2a$10$XNQK5k3esLisuac3LBhsOu1wR2ECxRe7c9ILDwrCY4F91mhR2Lbae', 'Mehdi Darif', NULL, 'CLIENT'),
(9, NULL, 'fatima.zahra@example.com', '$2a$10$JrBsBWRa3ms.M79rZRUJcOWrXALfG8q73K0OWXC0yLHNnrkRZULtm', 'Fatima Zahra', NULL, 'CLIENT'),
(10, NULL, 'aziz.naciri@example.com', '$2a$10$KJS/rFIODCNK9tuZ9d4QfuPMelmmuqFxqtlnbNlCkePEzwu56N41q', 'Aziz Naciri', NULL, 'CLIENT'),
(11, NULL, 'leila.madi@example.com', '$2a$10$WGTCw/wmVIOW/DFJDjQH7uSwULLXvF3NZwyGnvEaEaDA30ZR0bNwS', 'Leila El Madi', NULL, 'CLIENT'),
(12, NULL, 'omar.karimi@example.com', '$2a$10$NqXOnfVqAuuAnl6SkBcG8./LIFYgX9b4sApvzxP26Z9Zt6HPaCCYK', 'Omar Karimi', NULL, 'LIVREUR'),
(13, NULL, 'salma.lahlou@example.com', '$2a$10$muJkRF/jMKV0rndhuKoO7OwfHFabf.dgnPAFIkkVGCF7lOkldi4ZO', 'Salma Lahlou', NULL, 'LIVREUR'),
(14, NULL, 'amine.jebli@example.com', '$2a$10$u5op7P0dGoYEQhHpLUXIvueJvxxUw/UwTEtDsrw4cOsjVfvUQeG1O', 'Amine Jebli', NULL, 'LIVREUR'),
(15, NULL, 'karima.fakhri@example.com', '$2a$10$SxRblGm8.UW71VBgKMpHH.TduD8XLzsHX/xrfuIo6mbHt9hzkPzNK', 'Karima Fakhri', NULL, 'LIVREUR'),
(16, NULL, 'hicham.kabbaj@example.com', '$2a$10$phxlTxxKHEH.MGH9Ggw57ePknPnRauECpUW4dbTjL97huEj5w60F2', 'Hicham Kabbaj', NULL, 'LIVREUR'),
(17, NULL, 'latifa.tazi@example.com', '$2a$10$Yf92kB6N9a/zyq.M7aXN4OjJDV6suQipG4ydQqpoFavydgalOf2/G', 'Latifa Tazi', NULL, 'LIVREUR'),
(18, NULL, 'rachid.maftoul@example.com', '$2a$10$EXNPPG13/GI32CbM6LlSS.In2Ks46TeX2hs936ljXa5C0MUZUNgVq', 'Rachid Maftoul', NULL, 'LIVREUR'),
(19, NULL, 'zineb.elalami@example.com', '$2a$10$XEEIeauzSVebqfU1ulAEi.LGIX2HtRhog5GLJOAfURRZw0QjnGib.', 'Zineb El Alami', NULL, 'LIVREUR'),
(20, NULL, 'ahmed.mansouri@example.com', '$2a$10$EILIgdhHkkM9yGlBJdC.ren/ya7gJ3TCNllSK9SlaKT6VRAwVrYKm', 'Ahmed El Mansouri', NULL, 'LIVREUR'),
(21, NULL, 'fatima.bouzid@example.com', '$2a$10$As/1YzdJ6LVw6WkEoe1KwObfKZCFEDvC11QZpEk6m5b6ZXfXVmk8m', 'Fatima Bouzid', NULL, 'LIVREUR');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `FK79q1nginx2k3m83vi3bt3rlon` (`client_id`),
  ADD KEY `FK11tarxikm1ylnu8bdpk15d5ix` (`livreur_id`);

--
-- Index pour la table `commande_produits`
--
ALTER TABLE `commande_produits`
  ADD KEY `FK1aw1duegetqx4qy94bqfa96dh` (`id_commande`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id_notification`),
  ADD KEY `FKiolfxvodofhk4a1p4mcqb922r` (`id_client`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `id_notification` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FKod74ye6k4t6qnirp5a5a8bkm9` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK11tarxikm1ylnu8bdpk15d5ix` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`),
  ADD CONSTRAINT `FK79q1nginx2k3m83vi3bt3rlon` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `commande_produits`
--
ALTER TABLE `commande_produits`
  ADD CONSTRAINT `FK1aw1duegetqx4qy94bqfa96dh` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`);

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `FK377q0o0mx43xjuxyw6bxpoykr` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FKiolfxvodofhk4a1p4mcqb922r` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
