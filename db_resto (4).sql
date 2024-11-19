-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 19 nov. 2024 à 11:22
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_resto`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `commande_id` int NOT NULL AUTO_INCREMENT,
  `numero_commande` datetime NOT NULL,
  `date_commande` date NOT NULL,
  `adresse_livraison` varchar(50) NOT NULL,
  `statut_commande` enum('En cours','Livrée','Annulée') NOT NULL,
  `total_commande` int NOT NULL,
  `numéro_client` int NOT NULL,
  PRIMARY KEY (`commande_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`commande_id`, `numero_commande`, `date_commande`, `adresse_livraison`, `statut_commande`, `total_commande`, `numéro_client`) VALUES
(1, '2024-06-02 03:20:06', '2024-06-02', 'Paris, Île-de-France, France', 'En cours', 37, 21156446),
(2, '2024-06-02 03:22:55', '2024-06-02', 'Paris, Île-de-France, France', 'En cours', 52, 21156446),
(3, '2024-06-02 03:24:55', '2024-06-02', 'Paris, Île-de-France, France', 'En cours', 15, 111111),
(4, '2024-06-02 03:26:27', '2024-06-02', 'Paris, Île-de-France, France', 'En cours', 15, 111111),
(5, '2024-06-06 20:51:08', '2024-06-06', 'Paris, Île-de-France, France', 'En cours', 0, 0),
(6, '2024-06-06 20:51:44', '2024-06-06', 'Paris, Île-de-France, France', 'En cours', 0, 0),
(7, '2024-06-06 20:51:58', '2024-06-06', 'Paris, Île-de-France, France', 'En cours', 0, 0),
(8, '2024-06-06 21:11:18', '2024-06-06', 'Paris, Île-de-France, France', 'En cours', 16, 2147483647),
(9, '2024-06-06 21:12:07', '2024-06-06', 'Paris, Île-de-France, France', 'En cours', 16, 2147483647),
(10, '2024-06-06 21:15:10', '2024-06-06', 'Paris, Île-de-France, France', 'En cours', 16, 2147483647),
(11, '2024-06-06 21:30:39', '2024-06-06', 'Paris, Île-de-France, France', 'En cours', 0, 0),
(12, '2024-06-06 21:32:34', '2024-06-06', 'Paris, Île-de-France, France', 'En cours', 0, 0),
(13, '2024-06-06 23:24:51', '2024-06-07', 'Paris, Île-de-France, France', 'En cours', 10, 48653213),
(14, '2024-06-06 23:39:29', '2024-06-07', 'zertfg', 'En cours', 15, 11111111),
(15, '2024-06-07 00:51:33', '2024-06-07', 'Paris, Île-de-France, France', 'En cours', 25, 6516512);

-- --------------------------------------------------------

--
-- Structure de la table `commandes_article`
--

DROP TABLE IF EXISTS `commandes_article`;
CREATE TABLE IF NOT EXISTS `commandes_article` (
  `menus_commandes` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`menus_commandes`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `desserts`
--

DROP TABLE IF EXISTS `desserts`;
CREATE TABLE IF NOT EXISTS `desserts` (
  `dessert_id` int NOT NULL AUTO_INCREMENT,
  `nom_dessert` varchar(250) NOT NULL,
  `commentaire_dessert` varchar(250) NOT NULL,
  `prix` int NOT NULL,
  `id_resto` int NOT NULL,
  PRIMARY KEY (`dessert_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `desserts`
--

INSERT INTO `desserts` (`dessert_id`, `nom_dessert`, `commentaire_dessert`, `prix`, `id_resto`) VALUES
(1, 'Mousse au chocolat Noir et aux Eclats de Pistaches', 'Et ses pralinés de Noisettes', 17, 3),
(2, 'Crème Brulée à la lavande', 'Accompagné de Sablé Bretonn et Fruits de saison caramélisés', 19, 3),
(3, 'Millefeuille Croustillant', 'Myrtilles et pâte  d\'amande', 21, 3),
(4, 'Ile Flottante', 'Coulis de Framboises', 7, 1),
(5, 'Tiramisu Maison', '', 5, 1),
(6, 'Panna Cotta à la Mangue', '', 9, 1),
(7, 'Assiette gourmande \"Délices des Sens\"', 'Mousse au chocolat noir, macaron à la framboise et sorbet citron basilic', 14, 4),
(8, 'Tartelette fine aux pommes caramélisées', 'Accompagnée d\'une boule de glace à la canelle', 6, 4),
(9, 'Trio de crèmes brûlées à la vanille', 'Au chocolat & à la fleur d\'oranger', 9, 4),
(10, 'Tarte au citron meringuée', 'Tartelette sablée garnie d\'une crème au citron acidulée et recouverte de meringue dorée', 11, 2),
(11, 'Fondant au chocolat', 'Gâteau moelleux et son cœur coulant accompagné d\'une boule de glace à la vanille', 9, 2),
(12, 'Crème Brulée à la vanille', 'Crème à la vanille onctueuse et légèrement caramélisée, servie avec des fruits rouges frais et un biscuit sablé.', 13, 2);

-- --------------------------------------------------------

--
-- Structure de la table `details_commande`
--

DROP TABLE IF EXISTS `details_commande`;
CREATE TABLE IF NOT EXISTS `details_commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_commande` varchar(250) NOT NULL,
  `nom_menu` varchar(250) NOT NULL,
  `prix_menu` int NOT NULL,
  `quantite_menu` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `entree`
--

DROP TABLE IF EXISTS `entree`;
CREATE TABLE IF NOT EXISTS `entree` (
  `entree_id` int NOT NULL AUTO_INCREMENT,
  `nom_entree` varchar(250) NOT NULL,
  `commentaire` varchar(250) NOT NULL,
  `prix` int NOT NULL,
  `id_resto` int NOT NULL,
  PRIMARY KEY (`entree_id`),
  KEY `id_resto` (`id_resto`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `entree`
--

INSERT INTO `entree` (`entree_id`, `nom_entree`, `commentaire`, `prix`, `id_resto`) VALUES
(1, 'Croustillant de Champignons Sauvages', 'Emulsion de Truffe Blanche', 16, 3),
(2, 'Velouté de Courge Musquée', 'Chips de Pancetta Croustillante', 15, 3),
(3, 'Tartare de Tomates d\'Eté', 'A la vinaigrette, aux Agrumes et Basilic Frais', 20, 3),
(4, 'Tartelette aux Champignon', '', 12, 1),
(5, 'Terrine de Foie Gras Maison', '', 16, 1),
(6, 'Soupe à l\'Oignon Gratinée', '', 15, 1),
(7, 'Tartare de Saumon mariné  à l\'aneth', 'Servi avec des blinis maison', 9, 4),
(8, 'Feuilleté Croustillant', 'Chèvre frais aux figues et miel de lavande', 10, 4),
(9, 'Carpaccio de courgettes et de tomates', 'Assaisonné d\'une vinaigrette balsamique aux herbes fraîches', 15, 4),
(10, 'Soupe de Potiron aux épices Enchantées', 'Soupe veloutée de potiron rehaussée d\'un mélange d\'épices maison, servie avec des croutons croûstillants.', 8, 2),
(11, 'Salade Magique de chèvre et Figues', 'Salades de jeunes pousses, chèvre chaud au miel, figues fraîches, noix caramélisées et vinaigrette au balsamique', 10, 2),
(12, 'Cassolette de Fruit de Mer à la Fée Verte', 'Mélange délicat de crevettes, moules et calamars dans une sauce crémeuse, gratinée au four', 15, 2);

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `menus_id` int NOT NULL AUTO_INCREMENT,
  `id_resto` int NOT NULL,
  PRIMARY KEY (`menus_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `plats`
--

DROP TABLE IF EXISTS `plats`;
CREATE TABLE IF NOT EXISTS `plats` (
  `plat_id` int NOT NULL AUTO_INCREMENT,
  `nom_plat` varchar(250) NOT NULL,
  `commentaire_plat` varchar(250) NOT NULL,
  `prix` int NOT NULL,
  `id_resto` int NOT NULL,
  PRIMARY KEY (`plat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `plats`
--

INSERT INTO `plats` (`plat_id`, `nom_plat`, `commentaire_plat`, `prix`, `id_resto`) VALUES
(1, 'Magret de Canard aux Baies Sauvages', 'Accompagné de sa purée de Patates Douces au miel de Fleurs', 35, 3),
(2, 'Pavé de Saumon en croûte d\'Amandes', 'Sauce au Vin Blanc et à la Vanille', 39, 3),
(3, 'Lasagnes aux légumes Grillés', 'Fromage de chèvre Fondue et Pesto Maison', 31, 3),
(4, 'Filet Mignon au Poivre Vert', 'Servi avec du riz et sauce au poivre', 25, 2),
(5, 'Risotto aux Champignons Sauvages', 'Risotto Crémeux préparé avec du riz Arborio, des champignons sauvages, du armesan rapé, du vin blanc et du bouillon de légumes', 28, 2),
(6, 'Poulet Teriyaki  Grillé', 'Morceaux de poulet servie avec des frites maison', 33, 2),
(7, 'Magret de Canard laqué au miel et aux épices', 'Accompagné de pommes de terres fondantes', 32, 1),
(8, 'Paëlla aux fruits de mer et chorizo', 'Inspirée des saveurs méditerranéennes.', 38, 1),
(9, 'Filet de Bar Grillé ', 'Et sa sauce vierge', 28, 1),
(10, 'Risotto crémeux aux champignons des bois', 'Parmesan et huile de truffes blanche', 30, 4),
(11, 'Filet mignon de veau rôti', 'et sa sauce aux morilles et écrasé de pommes de terre', 28, 4),
(12, 'Pavé de saumon grillé, sauce hollandaise', 'Accompagné de légumes de saison sautés', 37, 4);

-- --------------------------------------------------------

--
-- Structure de la table `restos`
--

DROP TABLE IF EXISTS `restos`;
CREATE TABLE IF NOT EXISTS `restos` (
  `id_resto` int NOT NULL AUTO_INCREMENT,
  `nom_resto` varchar(250) NOT NULL,
  `adresse_resto` varchar(250) NOT NULL,
  `image_resto` varchar(250) NOT NULL,
  PRIMARY KEY (`id_resto`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `restos`
--

INSERT INTO `restos` (`id_resto`, `nom_resto`, `adresse_resto`, `image_resto`) VALUES
(1, 'Le Jardin Gourmand', '12 Rue de la Gourmandise', 'Le-Jardin-Gourmand.jpg'),
(2, 'La Table Enchantée', '45 Boulevard de la Cuisine Fine', 'La-table-enchantée.jpg'),
(3, 'Délices de France', '8 Place du Palais des Délices', 'delices-de-France.jpg'),
(4, 'Saveurs Divines', '27 Avenue des Saveurs', 'Saveurs-Divines.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL,
  `nom` varchar(250) NOT NULL,
  `prenom` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `adresse` int NOT NULL,
  `numero` int NOT NULL,
  `type` enum('admin','client') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `email`, `password`, `adresse`, `numero`, `type`) VALUES
(2, 'benf', 'sandra', 'sandra@gmail.fr', '$2y$10$pTu0H8B9wn1HscozXbgukucfcz17uoLxs.yFYMmmnyXDJg2GsONn6', 0, 0, NULL),
(0, 'kassim', 'Assya', 'assya@gmail.fr', '$2y$10$eYJok9El1r/GlPcHxHeN1.sryN8nA.27Dl7rVeYyE.CI79qGNfgEm', 0, 0, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
