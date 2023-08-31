-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 31 août 2023 à 11:07
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `video_center_josseline_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230727082041', '2023-07-27 10:20:52', 405);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `roles`, `password`, `is_verified`, `image_name`, `image_size`, `created_at`, `updated_at`) VALUES
(1, 'van', 'vanessa', 'vane@gmail.com', '[]', '$2y$13$x04/A7M/kzbci.zk9BybSueaB3fY0V045Hmy4srJIUwkHMKzmi8Pi', 1, NULL, NULL, '2023-07-27 10:24:00', '2023-07-27 10:24:55'),
(2, 'line', 'linaa', 'line@gmail.com', '[]', '$2y$13$8qJquhly/vCfTTuEHCZD3eWZO17sz/BjIN3jmT1ow.e.Fqsa6Zt42', 1, NULL, NULL, '2023-07-27 11:36:53', '2023-07-27 11:37:21'),
(3, 'sik', 'siko', 'sik@gmail.com', '[]', '$2y$13$0hKJtVNVhkhs30jVmLnYVuurMguQSwgF0daMOOrs3YW0sLRHxTFPu', 0, NULL, NULL, '2023-07-27 22:45:00', '2023-07-27 22:45:01'),
(4, 'san', 'sandi', 'san@gmail.com', '[]', '$2y$13$li9VffTtOrNbp1CckCScL.ts2cza/GjIUKjp2lamISFjhjkiL2s1a', 1, NULL, NULL, '2023-07-28 11:13:34', '2023-07-28 11:14:10'),
(5, 'aaaa', 'aaaaaaa', 'aa@gmail.com', '[]', '$2y$13$NyoUfINQLhFYO2wonskkNOJj.yQmuC7p3Js4PFRedjpcpZu58enKq', 1, 'acc1-64c3b234e7087471287375.png', 32006, '2023-07-28 13:11:17', '2023-07-28 14:19:00'),
(6, 'sandi', 'sandiii', 'sandi@gmail.com', '[]', '$2y$13$KDx0/mBmljcZaHwrOwU9.uIenASkFyEXBJaE5B8X6TTAFrH.uMgF6', 1, 'image9-64c3f37eab596284289012.png', 766859, '2023-07-28 18:51:39', '2023-08-30 10:34:46'),
(7, 'mama', 'mamane', 'mama@gmail.com', '[]', '$2y$13$yq2wZURO9E.tMYjk0ebMU.6bzpaX5YmXQdJYYFqxns9rgdqWw0nri', 1, NULL, NULL, '2023-07-29 16:30:17', '2023-07-29 16:31:04'),
(8, 'papa', 'ppppppppp', 'pa@gmail.com', '[]', '$2y$13$jVoFtLLxmbPjIK9Gyc7yFODFpkcWhoIX4LJUkWTqQeR8a90IrSRg2', 1, NULL, NULL, '2023-07-29 17:53:17', '2023-07-29 17:53:46'),
(9, 'bao', 'bao', 'bao@gmail.com', '[]', '$2y$13$SO1Drcwl9XghceHc.8YkLubFtNpY5.C84jdjbWp6Ps/j8ssUMzWiG', 0, NULL, NULL, '2023-07-30 01:44:05', '2023-07-30 01:44:07'),
(10, 'bao', 'bao', 'baoo@gmail.com', '[]', '$2y$13$1APuMge.t0.NwTt8kOkSZurcHNxoI7zcS53prkHeTug68K4txpN5m', 0, NULL, NULL, '2023-07-30 01:44:27', '2023-07-30 01:44:28'),
(11, 'lui', 'luilui', 'lui@gmail.com', '[]', '$2y$13$IaUnhwp5LpsIskmVaewc7OlO0lJ33wVlVj7cfzFN0e.pxa3Tw3yce', 1, NULL, NULL, '2023-07-30 01:58:36', '2023-07-30 01:59:03'),
(12, 'lili', 'liliane', 'lili@gmail.com', '[]', '$2y$13$L2LrBi0QlTYbpUnIzk15qOUzM9crQlgo1x7SjCmZHPcM5supXeWRG', 1, 'profile.png', NULL, '2023-07-31 00:35:03', '2023-07-31 00:35:33'),
(13, 'lou', 'loulou', 'lou@gmail.com', '[]', '$2y$13$R2FfGV6rOu/rp3vcjfh0c.x8Hc7dj.k9fEtgKyym9x6VsWf.x2v5m', 0, 'profile.png', NULL, '2023-08-19 23:16:07', '2023-08-19 23:16:09'),
(14, 'anna', 'annnaelle', 'ana@gmail.com', '[]', '$2y$13$GQLw7.xOGaD/3/5G8/7hYeruwxIw9xgkYYseDArGfmiMkxaHpgrs6', 0, 'profile.png', NULL, '2023-08-19 23:16:42', '2023-08-19 23:16:44'),
(15, 'gbe', 'guy be', 'gb@gmail.com', '[]', '$2y$13$gAbnulgRQOrA7rQWPnwKve.zdOuoT740EmYGvCGDwLNZvC7.UzjIa', 0, 'profile.png', NULL, '2023-08-19 23:17:54', '2023-08-19 23:17:56'),
(16, 'tou', 'toute', 'tou@gmail.com', '[]', '$2y$13$x5XZxMlF6kg8vnTrEDjVau1fDUnO1SAAalVbhwjL39I6e5hd80n.y', 1, 'image5-64e1f23bd0ab4360366228.jfif', 26582, '2023-08-20 02:27:23', '2023-08-20 13:00:11'),
(17, 'jason', 'jason uriel', 'jason@gmail.com', '[]', '$2y$13$O/mP7PzJLhGOvFXArmgUg.3bneSexA45iPSOdTk3zJfDWINggai/W', 1, 'image7-64e3d0ef41c79297141585.png', 491874, '2023-08-21 22:48:58', '2023-08-21 23:02:39'),
(18, 'bernard', 'viscotisch', 'berna@gmail.com', '[]', '$2y$13$t62LJa2MV9MaajcsynvdG.8OX4xlxVYqanRoQouFwPe.osUdzkPI6', 1, 'profile.png', NULL, '2023-08-21 23:37:15', '2023-08-21 23:37:55'),
(19, 'louise', 'melanchon', 'louise@gmail.com', '[]', '$2y$13$oINCIBDfXX/diFXZ8sW/yeGOorG8likvMjRLJP0fGX5pmVNU0dgaW', 1, 'profile.png', NULL, '2023-08-21 23:45:24', '2023-08-21 23:45:55'),
(20, 'mimi', 'mimimi', 'mi@gmail.com', '[]', '$2y$13$mvgDXl9jBU.YEaGNbW8TVOpEqDDaRJDX208fxA8LkpquKyxxhgLIu', 1, 'profile.png', NULL, '2023-08-26 14:08:39', '2023-08-26 14:10:11'),
(21, 'jojo', 'jojojo', 'jojo@gmail.com', '[]', '$2y$13$pRfanXR0svBxtzjsM2CCrOcku.EaXpy05oCWA/.EG05E4hEampesK', 1, 'profile.png', NULL, '2023-08-26 14:12:38', '2023-08-26 14:13:15');

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_link` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_premium_video` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_29AA6432A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `videos`
--

INSERT INTO `videos` (`id`, `user_id`, `title`, `video_link`, `description`, `is_premium_video`, `created_at`, `updated_at`) VALUES
(1, 1, 'video1', 'https://www.youtube.com/embed/UzTn2pPp_uY', 'voici une video premium1', 1, '2023-07-27 10:25:19', '2023-07-27 10:28:27'),
(2, 1, 'video non premium  1', 'https://www.youtube.com/embed/YSpxullRcGw', 'voici une premiere video non premium', 0, '2023-07-27 10:26:09', '2023-07-27 10:26:09'),
(4, 1, 'troisieme video', 'https://www.youtube.com/embed/xHyqnEVr3V4', 'mettons le en premium', 1, '2023-07-27 10:30:57', '2023-07-27 10:30:57'),
(5, 1, '4eme video', 'https://www.youtube.com/embed/AaG7vZgeZpE', 'voici une nouvelle video', 0, '2023-07-27 10:31:48', '2023-07-27 10:31:48'),
(6, 1, 'video', 'https://www.youtube.com/embed/UTusmVpwJXo', 'voici une bonne video', 1, '2023-07-27 10:32:45', '2023-07-27 10:32:45'),
(7, 1, 'video en premium', 'https://www.youtube.com/embed/UTusmVpwJXo', 'donc voici c\'est fait', 0, '2023-07-27 10:33:11', '2023-07-27 10:33:11'),
(8, 1, 'video premium', 'https://www.youtube.com/embed/XgVADKKb4jI', 'hdzahiujize hdhiueuzda', 1, '2023-07-27 10:37:14', '2023-07-27 10:37:14'),
(9, 6, '1erevideo', 'https://www.youtube.com/embed/7LdvZM_x5Yc', 'voici une video premium', 1, '2023-07-28 18:59:18', '2023-07-28 18:59:18'),
(10, 6, 'video 2 sandi', 'https://www.youtube.com/embed/7LdvZM_x5Yc', 'video nom premium de sandi', 1, '2023-07-28 19:00:21', '2023-07-28 19:00:21'),
(13, 7, 'video1', 'https://www.youtube.com/embed/6RUY724SJbE', 'voici une video en premium', 1, '2023-07-29 16:42:45', '2023-07-29 16:42:45'),
(14, 7, 'video pas premium', 'https://www.youtube.com/embed/3K6oBiQK8aA', 'voici une video qui n\'est pas premium', 0, '2023-07-29 16:45:45', '2023-07-29 16:45:45'),
(15, 7, 'videopremium', 'https://www.youtube.com/embed/6nACCFseqYI', 'voici une video premium 1', 1, '2023-07-29 16:50:44', '2023-07-29 16:50:44'),
(16, 7, 'videopremium', 'https://www.youtube.com/embed/6nACCFseqYI', 'voici une video premium 1', 1, '2023-07-29 16:50:45', '2023-07-29 16:50:45'),
(17, 7, 'videonon premium', 'https://www.youtube.com/embed/Xu4J2gB2qhU', 'voici une video non premiummmmmm', 0, '2023-07-29 16:52:16', '2023-07-29 16:52:16'),
(18, 6, 'video34premium', 'https://www.youtube.com/embed/6nACCFseqYI', 'premium video en deux fois', 1, '2023-07-29 17:42:33', '2023-07-29 17:42:33'),
(19, 6, 'video34nonpremium', 'https://www.youtube.com/embed/6nACCFseqYI', 'video non premiummm premiummm', 0, '2023-07-29 17:44:03', '2023-07-29 17:44:03'),
(20, 8, 'ma video1premium', 'https://www.youtube.com/embed/6RUY724SJbE', 'ma video 1 premiummmmmmmmm', 1, '2023-07-29 17:54:47', '2023-07-29 17:54:47'),
(21, 8, 'ma video1 nom premium', 'https://www.youtube.com/embed/6RUY724SJbE', 'ma video1 nom premium ma video1 nom premium', 0, '2023-07-29 17:55:23', '2023-07-29 17:55:23'),
(22, 8, 'ma video2 nom premium', 'https://www.youtube.com/embed/oUJolR5bX6g', 'ma deuxieme video non premium', 0, '2023-07-29 17:56:40', '2023-07-29 17:56:40'),
(23, 8, 'ma video2  premium', 'https://www.youtube.com/embed/oUJolR5bX6g', 'ma video2  premium ma video2  premium', 1, '2023-07-29 17:57:12', '2023-07-29 17:57:12'),
(24, 6, 'Votre propre homepage avec Symfony', 'https://www.youtube.com/embed/IM0Ss1wvLu0', 'guyyuiiu jghguoiuiouo cgyuuiui', 1, '2023-07-30 19:57:44', '2023-07-30 19:57:44'),
(25, 6, 'video portant sur symfony', 'https://www.youtube.com/embed/aqw1bgitDcE', 'vggyyuiyuyiuiiiuyyyttftrdrddff', 0, '2023-07-30 20:09:45', '2023-07-30 20:09:45'),
(26, 6, 'voici une video', 'https://www.youtube.com/embed/Ew7KG2j8eII', 'voici une nouvelle fois une video premium', 1, '2023-07-30 20:36:30', '2023-07-30 20:36:30'),
(27, 6, 'symfony chauque jour', 'https://www.youtube.com/embed/Ew7KG2j8eII', 'voici une video portant sur symfony non premium', 0, '2023-07-30 20:37:23', '2023-07-30 20:37:23'),
(28, 6, 'symfony  en 1heure', 'https://www.youtube.com/embed/_cgZheTv-FQ', 'voici une video premium en 1heure sur symfony', 1, '2023-08-19 20:51:42', '2023-08-19 20:51:42'),
(30, 16, 'Font Awesome', 'https://www.youtube.com/embed/Tc_hCouWMOk', 'Découvrez comment utiliser Font Awesome - CSS', 1, '2023-08-20 02:29:50', '2023-08-20 02:29:50'),
(31, 16, 'polic', 'https://www.youtube.com/embed/rUCElvC8EsU', 'Comment utiliser une police personnalisée en CSS ?', 1, '2023-08-20 02:32:20', '2023-08-20 02:32:20'),
(32, 17, 'Javascript de A à Z', 'https://www.youtube.com/embed/Ew7KG2j8eII', '[Cours / Tuto débutant] Apprendre Javascript de A à Z – Les bases', 1, '2023-08-21 23:04:42', '2023-08-21 23:04:42'),
(33, 17, 'PYTHON', 'https://www.youtube.com/embed/oUJolR5bX6g', 'APPRENDRE PYTHON [TUTO PROGRAMMATION COMPLET DÉBUTANT]', 0, '2023-08-21 23:06:35', '2023-08-21 23:06:35'),
(34, 17, 'Développeur', 'https://www.youtube.com/embed/ESIrs_lVPU0', 'Quel langage de programmation choisir pour débuter ? - [Devenir Développeur #7]', 1, '2023-08-21 23:08:25', '2023-08-21 23:08:25'),
(35, 17, 'code', 'https://www.youtube.com/embed/WrxJuqdmq8c', 'Ma méthode pour apprendre efficacement le code', 0, '2023-08-21 23:32:42', '2023-08-21 23:32:42'),
(36, 17, 'codage', 'https://www.youtube.com/embed/Fi5NcGYNKlw', 'Comment apprendre à CODER en partant de ZÉRO', 1, '2023-08-21 23:33:59', '2023-08-21 23:33:59'),
(37, 17, 'codage', 'https://www.youtube.com/embed/Fi5NcGYNKlw', 'Comment apprendre à CODER en partant de ZÉRO', 1, '2023-08-21 23:34:00', '2023-08-21 23:34:00'),
(38, 17, 'html/css', 'https://www.youtube.com/embed/rRt-yvGQST0', 'Apprendre le HTML - Tutoriel Pour Débutant', 0, '2023-08-21 23:35:56', '2023-08-21 23:35:56'),
(39, 19, 'Cybersecurité', 'https://www.youtube.com/embed/VLr0mTzYfRE', 'Cybersécurité [2023] : guide COMPLET pour démarrer rapidement | Sécurité informatique débutant', 1, '2023-08-21 23:51:10', '2023-08-21 23:51:10'),
(40, 19, 'symfony', 'https://www.youtube.com/embed/Ew7KG2j8eII', 'apprendre symfony est necessaire pour pouvoir develloper', 0, '2023-08-21 23:51:49', '2023-08-21 23:52:12'),
(41, 6, 'les derniers rebelles du Darfour | ARTE Reportage', 'https://www.youtube.com/embed/bTU8vYgv8OE?si=6uefUeZnsrf4bvWx', 'Bombardés à répétition, attaqués de toutes parts et assiégés par les militaires, les habitants du Djebel Marra vivent coupés du monde. Contrairement aux autres Darfouris, ces rebelles ne meurent pas de faim', 0, '2023-08-29 12:32:22', '2023-08-29 12:32:22'),
(42, 6, 'voici une video', 'https://www.youtube.com/watch?v=r4S05LXgpOg', 'n,bdzjaizihuefd eaiuoiauf ioezauifua', 0, '2023-08-30 11:01:54', '2023-08-30 11:01:54'),
(43, 6, 'voici une video', 'https://www.youtube.com/embed/Ew7KG2j8eII', 'eiuzauuoia ieiuu_eçyfha iua_u\"hkshdz_ueziudezd', 1, '2023-08-30 11:12:53', '2023-08-30 11:12:53');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `FK_29AA6432A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
