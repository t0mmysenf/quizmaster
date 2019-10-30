/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Export of table answers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) unsigned NOT NULL,
  `answerText` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isCorrect` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_question_id_foreign` (`question_id`),
  CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;

INSERT INTO `answers` (`id`, `question_id`, `answerText`, `isCorrect`, `created_at`, `updated_at`)
VALUES
	(16,9,'Bern',1,'2019-10-25 04:13:41','2019-10-25 04:13:41'),
	(17,9,'Lucerne',0,'2019-10-25 04:13:41','2019-10-25 04:13:41'),
	(18,9,'Zurich',0,'2019-10-25 04:13:41','2019-10-25 04:13:41'),
	(19,9,'Geneva',0,'2019-10-25 04:13:41','2019-10-25 04:13:41'),
	(20,10,'Palermo',0,'2019-10-25 04:15:22','2019-10-25 04:15:22'),
	(21,10,'Milan',0,'2019-10-25 04:15:22','2019-10-25 04:15:22'),
	(22,10,'Rome',1,'2019-10-25 04:15:22','2019-10-25 04:15:22'),
	(23,10,'Naples',0,'2019-10-25 04:15:22','2019-10-25 04:15:22'),
	(24,11,'Paris',1,'2019-10-25 04:16:37','2019-10-25 04:16:37'),
	(25,11,'Lyon',0,'2019-10-25 04:16:37','2019-10-25 04:16:37'),
	(26,11,'Toulouse',0,'2019-10-25 04:16:37','2019-10-25 04:16:37'),
	(27,11,'Marseille',0,'2019-10-25 04:16:37','2019-10-25 04:16:37'),
	(28,12,'Copenhagen',1,'2019-10-25 04:18:52','2019-10-25 04:18:52'),
	(29,12,'Malmö',0,'2019-10-25 04:18:52','2019-10-25 04:18:52'),
	(30,12,'Oslo',0,'2019-10-25 04:18:52','2019-10-25 04:18:52'),
	(31,12,'Helsinki',0,'2019-10-25 04:18:52','2019-10-25 04:18:52'),
	(32,13,'Pilsen',0,'2019-10-25 04:32:32','2019-10-25 04:32:32'),
	(33,13,'Prague',1,'2019-10-25 04:32:32','2019-10-25 04:32:32'),
	(34,13,'Krakow',0,'2019-10-25 04:32:32','2019-10-25 04:32:32'),
	(35,13,'Bratislava',0,'2019-10-25 04:32:32','2019-10-25 04:32:32'),
	(43,16,'CERN-Link',0,'2019-10-30 15:11:34','2019-10-30 15:11:34'),
	(44,16,'ARPAnet',1,'2019-10-30 15:11:34','2019-10-30 15:11:34'),
	(45,16,'WWW',0,'2019-10-30 15:11:34','2019-10-30 15:11:34'),
	(46,16,'DarkNet',0,'2019-10-30 15:11:34','2019-10-30 15:11:34'),
	(47,17,'1917',0,'2019-10-30 15:14:04','2019-10-30 15:14:04'),
	(48,17,'1971',1,'2019-10-30 15:14:04','2019-10-30 15:14:04'),
	(49,17,'1995',0,'2019-10-30 15:14:04','2019-10-30 15:14:04'),
	(50,17,'1959',0,'2019-10-30 15:14:04','2019-10-30 15:14:04'),
	(51,18,'Spicy Pork And Mushrooms',0,'2019-10-30 15:18:26','2019-10-30 15:18:26'),
	(52,18,'SPiced hAM',1,'2019-10-30 15:18:26','2019-10-30 15:18:26'),
	(53,18,'Specially Prepared Assorted Meat',0,'2019-10-30 15:18:26','2019-10-30 15:18:26'),
	(54,19,'Nestlé in Vevey',0,'2019-10-30 15:21:05','2019-10-30 15:21:05'),
	(55,19,'ETH in Zurich',0,'2019-10-30 15:21:05','2019-10-30 15:21:05'),
	(56,19,'CERN in Geneva',1,'2019-10-30 15:21:05','2019-10-30 15:21:05'),
	(57,19,'EPFL in Lausanne',0,'2019-10-30 15:21:05','2019-10-30 15:21:05'),
	(58,20,'Wikipedia',0,'2019-10-30 15:30:23','2019-10-30 15:30:23'),
	(59,20,'Facebook',0,'2019-10-30 15:30:23','2019-10-30 15:30:23'),
	(60,20,'Google',1,'2019-10-30 15:30:23','2019-10-30 15:30:23'),
	(61,20,'Netflix',0,'2019-10-30 15:30:23','2019-10-30 15:30:23'),
	(62,21,'Finland',0,'2019-10-30 15:35:27','2019-10-30 15:35:27'),
	(63,21,'Denmark',0,'2019-10-30 15:35:27','2019-10-30 15:35:27'),
	(64,21,'Norway',1,'2019-10-30 15:35:27','2019-10-30 15:35:27'),
	(65,21,'Sweden',0,'2019-10-30 15:35:27','2019-10-30 15:35:27'),
	(66,22,'o',0,'2019-10-30 15:37:25','2019-10-30 15:37:25'),
	(67,22,'O',0,'2019-10-30 15:37:25','2019-10-30 15:37:25'),
	(68,22,'0',1,'2019-10-30 15:37:25','2019-10-30 15:37:25'),
	(69,23,'Pi',0,'2019-10-30 15:40:32','2019-10-30 15:40:32'),
	(70,23,'3.14159',1,'2019-10-30 15:40:32','2019-10-30 15:40:32'),
	(71,23,'radiant of 180°',0,'2019-10-30 15:40:32','2019-10-30 15:40:32'),
	(72,23,'π',0,'2019-10-30 15:40:32','2019-10-30 15:40:32'),
	(73,24,'s',0,'2019-10-30 15:41:41','2019-10-30 15:41:41'),
	(74,24,'q',1,'2019-10-30 15:41:41','2019-10-30 15:41:41'),
	(75,24,'t',0,'2019-10-30 15:41:41','2019-10-30 15:41:41'),
	(76,24,'r',0,'2019-10-30 15:41:41','2019-10-30 15:41:41'),
	(77,25,'!',1,'2019-10-30 15:43:36','2019-10-30 15:43:36'),
	(78,25,'A',0,'2019-10-30 15:43:36','2019-10-30 15:43:36'),
	(79,25,'|',0,'2019-10-30 15:43:36','2019-10-30 15:43:36'),
	(80,25,'a',0,'2019-10-30 15:43:36','2019-10-30 15:43:36'),
	(81,26,'hexadecimal',1,'2019-10-30 15:45:19','2019-10-30 15:45:19'),
	(82,26,'decimal',0,'2019-10-30 15:45:19','2019-10-30 15:45:19'),
	(83,26,'ocal',0,'2019-10-30 15:45:19','2019-10-30 15:45:19'),
	(84,26,'binary',0,'2019-10-30 15:45:19','2019-10-30 15:45:19');

/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;


# Export of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),
	(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),
	(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
	(6,'2016_06_01_000004_create_oauth_clients_table',1),
	(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
	(8,'2019_09_02_195700_initial_migration',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Export of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'QU!Z Personal Access Client','hdSyvIrQgBecnClQtZ48HIZw59Fcg5fb9Qv5ypVC','http://localhost',1,0,0,'2019-10-21 19:31:17','2019-10-21 19:31:17'),
	(2,NULL,'QU!Z Personal Access Client','08FMNJzbIWNz4Y6dk0Q1tQtMwmQT05YkKbUFkTPb','http://localhost',1,0,0,'2019-10-21 19:34:37','2019-10-21 19:34:37');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Export of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2019-10-21 19:31:17','2019-10-21 19:31:17'),
	(2,2,'2019-10-21 19:34:37','2019-10-21 19:34:37');

/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Export of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Export of table questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `questionText` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_quiz_id_foreign` (`quiz_id`),
  CONSTRAINT `questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;

INSERT INTO `questions` (`id`, `quiz_id`, `title`, `questionText`, `created_at`, `updated_at`)
VALUES
	(9,10,'Cheese and Chocolate','What\'s the capital of Switzerland?','2019-10-25 04:13:40','2019-10-25 04:13:40'),
	(10,10,'Do you like Pizza?','What\' the capital of Italy?','2019-10-25 04:15:22','2019-10-25 04:15:22'),
	(11,10,'Baguette anyone?','What\'s the capital of France?','2019-10-25 04:16:37','2019-10-25 04:16:37'),
	(12,10,'Smørrebrød','What\'s the capital of Danmark?','2019-10-25 04:18:52','2019-10-25 04:18:52'),
	(13,10,'A Pils for you?','What\'s the capital of Czech Republic','2019-10-25 04:32:32','2019-10-25 04:32:32'),
	(16,13,'Just before the internet came','What was the technical foundation of the internet?','2019-10-30 15:11:34','2019-10-30 15:11:34'),
	(17,13,'Birth of the e-mail','In which year was the first e-mail sent? (By the way: The inventor of the e-mail sent his first e-mail to... himself!)','2019-10-30 15:14:04','2019-10-30 15:14:04'),
	(18,13,'Birth of the SPAM e-mail','Seven years after the invention of the e-mail, in 1978, the first spam e-mail was sent. But: Why is ist called \"spam\"?','2019-10-30 15:18:26','2019-10-30 15:18:26'),
	(19,13,'Swiss made','At which swiss institution was the world wide web (www) developed?','2019-10-30 15:21:05','2019-10-30 15:21:05'),
	(20,13,'Giants of today','Which of these internet companies is the oldest?','2019-10-30 15:30:22','2019-10-30 15:30:22'),
	(21,13,'News? Fake News? Bubble?','In which country is Facebook more often visited than Google?','2019-10-30 15:35:27','2019-10-30 15:35:27'),
	(22,14,'Zero chance?','Click the number zero!','2019-10-30 15:37:25','2019-10-30 15:37:25'),
	(23,14,'Hungry? A Pi for you?','Which number is the smallest?','2019-10-30 15:40:31','2019-10-30 15:40:31'),
	(24,14,'Ordeeeeeeer!','Which is the first letter in latin alphabet?','2019-10-30 15:41:41','2019-10-30 15:41:41'),
	(25,14,'ASCII','Which character has the smallest ASCII value?','2019-10-30 15:43:36','2019-10-30 15:43:36'),
	(26,14,'Systematic numbering','Which number system has more different digits?','2019-10-30 15:45:18','2019-10-30 15:45:18');

/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;


# Export of table quizzes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `quizzes`;

CREATE TABLE `quizzes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quizzes_user_id_foreign` (`user_id`),
  CONSTRAINT `quizzes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;

INSERT INTO `quizzes` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`)
VALUES
	(10,22,'Capitals of Europe','Are you a frequent traveller? Have you been all over Europe? Take this QU!Z to show your fabulous knowledge in European capitals!','2019-10-25 04:12:37','2019-10-25 04:12:37'),
	(13,23,'History of the Internet','Are you a real geek? Do you know just about everything related to the internet? Show us!','2019-10-30 15:09:05','2019-10-30 15:09:05'),
	(14,24,'Click and Win','Here are some quite simple questions. Just try to answer them as fast as possible...','2019-10-30 15:36:45','2019-10-30 15:36:45');

/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;


# Export of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(22,'Trudi Gerster','rotkaeppchen@dunkler-wald.ch',NULL,'$2y$10$mw9uv3RTNgsub0XTsSYzM.8VzLKdzX6ZOmJhas6L4DyI/G5Pr62Ny',NULL,'2019-10-30 15:48:21','2019-10-30 15:48:21'),
	(23,'Donald Duck','donald@entenhausen.de',NULL,'$2y$10$Y8Fgl0xb5nuzjYM2Z50Pruud/tNgSIwmjc6FR.TD4Wi4QZRxmlf/y',NULL,'2019-10-30 15:48:47','2019-10-30 15:48:47'),
	(24,'Popeye','fucking-iron@spinach.io',NULL,'$2y$10$8iW/DswQs4yPcBVamkPFNOZUl8BCA2hYGv/VUXUZfZRGszG02W.hW',NULL,'2019-10-30 15:51:54','2019-10-30 15:51:54');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;