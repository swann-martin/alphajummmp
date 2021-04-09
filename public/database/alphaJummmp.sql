-- phpMyAdmin SQL Dump
-- version 4.9.7deb1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 09 avr. 2021 à 16:45
-- Version du serveur :  10.3.25-MariaDB-0ubuntu1
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `alphaJummmp`
--

-- --------------------------------------------------------

--
-- Structure de la table `cv`
--

CREATE TABLE `cv` (
  `id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  `model` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_cv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `short_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cv`
--

INSERT INTO `cv` (`id`, `user_id_id`, `model`, `title`, `job_cv`, `about`, `created_at`, `updated_at`, `short_url`) VALUES
(1, 3, 3, 'CV-1', 'Dev Web', 'Mes amis sont des geeks alors je veux aussi le devenir', '2016-01-01 02:00:00', '2021-04-09 15:51:20', 'https://swannwho.com/'),
(6, 3, 1, 'Définis le titre de ton CV', 'Inscris ton poste visé', 'Descris ton profil : exemple jeune', '2021-04-09 11:26:39', '2021-04-09 16:03:55', ''),
(13, 3, 1, 'Définis le titre de ton CV', 'Inscris ton poste visé', 'Descris ton profil : exemple jeune', '2021-04-09 15:37:01', '2021-04-09 15:37:01', '');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210406162359', '2021-04-06 18:24:37', 62),
('DoctrineMigrations\\Version20210407101753', '2021-04-07 12:18:07', 325),
('DoctrineMigrations\\Version20210408135801', '2021-04-08 15:58:17', 26),
('DoctrineMigrations\\Version20210408141257', '2021-04-08 16:13:35', 24),
('DoctrineMigrations\\Version20210408145528', '2021-04-08 16:55:40', 58);

-- --------------------------------------------------------

--
-- Structure de la table `hobbies`
--

CREATE TABLE `hobbies` (
  `id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hobby_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `hobbies`
--

INSERT INTO `hobbies` (`id`, `user_id_id`, `icon`, `hobby_name`) VALUES
(1, 3, 'fas fa-running', 'Course à pied'),
(2, 3, 'fas fa-snowboarding', 'Skate'),
(3, 3, 'fas fa-running', 'Course de fond');

-- --------------------------------------------------------

--
-- Structure de la table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skill_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `training`
--

CREATE TABLE `training` (
  `id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  `training_date_from` date NOT NULL,
  `training_date_to` date NOT NULL,
  `diploma_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diploma_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`, `avatar`, `street_adress`, `post_code`, `city`, `phone`, `website`) VALUES
(1, 'test@test.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$Yf6jXz594UNKsKMFGmg8kw$0Y3aBtqzyT/tFDy2AcPBgdsmnV46RREPWiKwI2hzG74', 'Pierre', 'Martinez', 'https://randomuser.me/api/portraits/men/26.jpg', 'test', 33000, 'Bordeaux', '0556009999', 'https://swannwho.com/'),
(2, 'user1@user.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$STKMWegsYWfsfEoFZetr5w$IB6utrtdewSCudZPHcByVGTuvai5VrLtKb2f6e6uQeI', 'user1', 'user1', 'unstringdimage', 'la philo', 33000, 'Bordeaux', '0556009999', 'user1.com'),
(3, 'user2@user.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$NYGqJPZp6Y81BxwG31oKMA$zvntfhG4R8V/8QcBBS1Wcne6wsztEyAamrkd9dh9PNM', 'Jane', 'user2', 'https://randomuser.me/api/portraits/women/48.jpg', '12 route de la philo', 33000, 'Bordeaux', '0556009999', 'https://swannwho.com/');

-- --------------------------------------------------------

--
-- Structure de la table `xp`
--

CREATE TABLE `xp` (
  `id` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL,
  `job_date_from` date NOT NULL,
  `job_date_to` date NOT NULL,
  `job_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `xp`
--

INSERT INTO `xp` (`id`, `user_id_id`, `job_date_from`, `job_date_to`, `job_name`, `job_location`, `job_description`, `company_name`) VALUES
(1, 3, '2021-01-10', '2021-12-01', 'Happiness chief manager', 'Silicon Valley', 'J\'ai kiffé la vie ', 'Google');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B66FFE929D86650F` (`user_id_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_38CA341D9D86650F` (`user_id_id`);

--
-- Index pour la table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D53116709D86650F` (`user_id_id`);

--
-- Index pour la table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D5128A8F9D86650F` (`user_id_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `xp`
--
ALTER TABLE `xp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F63A903D9D86650F` (`user_id_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cv`
--
ALTER TABLE `cv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `training`
--
ALTER TABLE `training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `xp`
--
ALTER TABLE `xp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cv`
--
ALTER TABLE `cv`
  ADD CONSTRAINT `FK_B66FFE929D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `hobbies`
--
ALTER TABLE `hobbies`
  ADD CONSTRAINT `FK_38CA341D9D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `FK_D53116709D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `FK_D5128A8F9D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `xp`
--
ALTER TABLE `xp`
  ADD CONSTRAINT `FK_F63A903D9D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
