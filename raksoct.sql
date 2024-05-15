-- -------------------------------------------------------------
-- TablePlus 5.9.6(546)
--
-- https://tableplus.com/
--
-- Database: raksoct
-- Generation Time: 2024-05-15 14:15:50.1340
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `audit_trails`;
CREATE TABLE `audit_trails` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `current_data` json NOT NULL,
  `previous_data` json NOT NULL,
  `from_table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_table_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_trails_user_id_foreign` (`user_id`),
  CONSTRAINT `audit_trails_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_15_022029_create_personal_access_tokens_table', 1),
(5, '2024_05_15_022136_create_posts_table', 1),
(6, '2024_05_15_040927_create_audit_trails_table', 1),
(7, '2024_05_15_043339_add_type_column_to_users_table', 1);

INSERT INTO `posts` (`id`, `created_at`, `updated_at`, `deleted_at`, `user_id`, `title`, `slug`, `content`) VALUES
(1, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 1, 'Provident voluptatem consequatur omnis aperiam.', 'provident-voluptatem-consequatur-omnis-aperiam', 'Porro omnis accusamus a recusandae aperiam. Qui perferendis perferendis aut eligendi maiores fugit ut. Soluta doloremque hic iure sunt cupiditate sapiente non.'),
(2, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 1, 'Impedit et dolor atque ea modi nulla omnis.', 'impedit-et-dolor-atque-ea-modi-nulla-omnis', 'Dolores iste aspernatur accusamus quas qui quos. Dolore reiciendis eius ut laudantium aut. Est consequatur eaque doloribus aut velit dicta dolores.'),
(3, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 1, 'Velit sit explicabo debitis veritatis.', 'velit-sit-explicabo-debitis-veritatis', 'Qui est temporibus iste accusamus ipsam alias amet. Exercitationem quis sed quas veritatis vel. Et voluptatibus aut ex sunt.'),
(4, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 1, 'Est iusto quia sequi id.', 'est-iusto-quia-sequi-id', 'Amet quis reprehenderit iusto aut maxime. Ut et et aut harum aut fuga dolorem. Iure doloremque harum cumque sed ex.'),
(5, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 1, 'Consequuntur incidunt reiciendis vitae explicabo aut.', 'consequuntur-incidunt-reiciendis-vitae-explicabo-aut', 'Maxime quisquam hic deleniti molestiae quae. Ab ad rem labore quaerat inventore temporibus. At magni iste veritatis sunt.'),
(6, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 1, 'Animi assumenda esse sed et aliquam.', 'animi-assumenda-esse-sed-et-aliquam', 'Molestiae qui officia voluptatem deserunt ab sequi deleniti. Vero vero a ducimus aut natus odio. A fugit iste cum voluptates eos voluptates.'),
(7, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 1, 'Quia consectetur accusantium dolore est voluptates culpa.', 'quia-consectetur-accusantium-dolore-est-voluptates-culpa', 'Excepturi sint dolores animi et. Placeat voluptatem corporis pariatur laboriosam voluptas quis. Dicta quia placeat ut unde quia aut et.'),
(8, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 1, 'Nulla magni laudantium consequatur aut.', 'nulla-magni-laudantium-consequatur-aut', 'Unde ab hic beatae hic nemo. Odit dolorum perferendis explicabo aut nesciunt. A dolor molestiae numquam quod rerum quos dolor. Consequatur est aliquid necessitatibus sed consequatur.'),
(9, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 1, 'Magnam deleniti repudiandae alias qui quia qui commodi.', 'magnam-deleniti-repudiandae-alias-qui-quia-qui-commodi', 'Minus dolore eum saepe at architecto qui. Veritatis optio illum est velit similique. Minus sed sunt et recusandae. Cupiditate sint maxime dolorem tempora et assumenda animi. Ex est molestias saepe minus quibusdam magnam.'),
(10, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 1, 'Quis id facilis animi et.', 'quis-id-facilis-animi-et', 'Voluptas quis repellat ut excepturi quia maiores. Qui perferendis odit molestiae et. Et aut magnam esse amet ex id neque.'),
(11, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 2, 'Et dolor sed voluptatem sit autem quis sequi.', 'et-dolor-sed-voluptatem-sit-autem-quis-sequi', 'Ea neque minima accusamus omnis aspernatur aut ea. Veritatis unde assumenda aut qui in. Ipsa sed quis ex animi deleniti. Itaque vel harum libero illo perspiciatis quis omnis cupiditate.'),
(12, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 2, 'Eum quo placeat non soluta a porro.', 'eum-quo-placeat-non-soluta-a-porro', 'Nostrum sapiente corrupti nisi quia. Vero non quibusdam doloremque quia commodi. Expedita provident mollitia et autem.'),
(13, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 2, 'Odit soluta et odit qui fugit ratione.', 'odit-soluta-et-odit-qui-fugit-ratione', 'Sint aspernatur soluta fugiat. Laudantium et sed dignissimos nobis et. Quaerat autem tempora in magni esse ut. Et sit omnis ut ut et dolor corrupti.'),
(14, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 2, 'Facere maiores voluptates et quo nostrum.', 'facere-maiores-voluptates-et-quo-nostrum', 'Iure enim voluptatem autem esse repellat et. Blanditiis dolore quo dignissimos eveniet cum non in. Repellendus et qui et nulla nostrum voluptatem nam. Dolor sint quis rerum optio quia.'),
(15, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 2, 'Optio quis molestiae illo animi ab qui.', 'optio-quis-molestiae-illo-animi-ab-qui', 'Rerum reprehenderit optio quod ut saepe. Nam blanditiis quis deserunt rerum vel. Eligendi et iusto sequi nemo a expedita. Libero est amet numquam aut quia enim.'),
(16, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 2, 'Et et error ipsum.', 'et-et-error-ipsum', 'Pariatur earum quas reiciendis. Exercitationem sed qui voluptatem ullam.'),
(17, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 2, 'Delectus voluptatibus iste illo inventore.', 'delectus-voluptatibus-iste-illo-inventore', 'Voluptatibus in est eveniet aliquid laudantium exercitationem. Excepturi dolorum nobis natus ad quod beatae eius. Debitis ut maxime praesentium enim in voluptatum. Ipsam necessitatibus assumenda dolores asperiores.'),
(18, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 2, 'Eligendi tenetur pariatur quis rerum.', 'eligendi-tenetur-pariatur-quis-rerum', 'Assumenda dolores occaecati est sed nam. Id modi id et laboriosam culpa sed voluptas accusantium. Molestiae nihil nemo odio sint sed enim perspiciatis.'),
(19, '2024-05-15 06:08:35', '2024-05-15 06:08:35', NULL, 2, 'Eius unde non maxime minus qui qui omnis.', 'eius-unde-non-maxime-minus-qui-qui-omnis', 'Sapiente sit tempore unde officia maxime. Quod reprehenderit nobis et et iusto. Nihil harum in est ab enim dignissimos nulla.'),
(20, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 2, 'Consequatur est sunt aut omnis occaecati.', 'consequatur-est-sunt-aut-omnis-occaecati', 'In inventore dolor voluptatem assumenda. Minima et sed tempora officia. At amet fugit dicta eos et tenetur. Doloribus tenetur sit aliquam assumenda. Ratione dolores aut voluptatibus est libero nostrum aut qui.'),
(21, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 3, 'Quas pariatur minus atque nulla quos incidunt dolores.', 'quas-pariatur-minus-atque-nulla-quos-incidunt-dolores', 'Qui necessitatibus saepe sit eius sunt eveniet incidunt. Aliquid provident rerum non qui sed. Autem sed porro tempora qui corrupti molestiae sit. Numquam accusamus quae non labore accusamus repellat.'),
(22, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 3, 'Aut quos itaque possimus.', 'aut-quos-itaque-possimus', 'Incidunt animi non qui blanditiis aut magni et. Dolorem nulla enim fugiat cumque voluptas. Qui modi amet qui fuga doloribus corporis qui. Sed repudiandae ea ipsa eos.'),
(23, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 3, 'Assumenda et in vitae veritatis non excepturi molestiae.', 'assumenda-et-in-vitae-veritatis-non-excepturi-molestiae', 'Vero enim necessitatibus quo harum. Ullam et eum dolorem accusantium. Amet ea excepturi aut quis ab corrupti voluptatem.'),
(24, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 3, 'In quia aut quisquam quam dolores dolores.', 'in-quia-aut-quisquam-quam-dolores-dolores', 'Praesentium porro possimus voluptatem explicabo quia et fugiat. Eum et vitae et. Officia consectetur aut sunt necessitatibus totam ea.'),
(25, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 3, 'Quidem est ipsa possimus qui perspiciatis cum voluptas.', 'quidem-est-ipsa-possimus-qui-perspiciatis-cum-voluptas', 'Doloremque in incidunt soluta enim officiis neque. Fugit voluptatibus et officiis quis consequatur nisi. Perspiciatis sapiente tempora optio fugit modi et.'),
(26, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 3, 'Ea ipsa nobis omnis qui omnis quaerat ab.', 'ea-ipsa-nobis-omnis-qui-omnis-quaerat-ab', 'Laboriosam est qui vel ut repudiandae rem et voluptates. Soluta at doloribus dolorum non quasi nisi eos. Temporibus deleniti et vitae dignissimos quae dicta. Est voluptatibus officiis quod.'),
(27, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 3, 'Et modi minima possimus sed molestias dolore.', 'et-modi-minima-possimus-sed-molestias-dolore', 'Nihil maiores facilis accusantium sit. Consequatur voluptas iure in. Et sapiente voluptatibus ut. Dolor ut eaque minus in dolorum distinctio repudiandae.'),
(28, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 3, 'Voluptatibus voluptatem rerum eum ut quae necessitatibus.', 'voluptatibus-voluptatem-rerum-eum-ut-quae-necessitatibus', 'Voluptas nihil animi voluptatem ratione esse quos quia. Doloribus animi et qui voluptas sit. Quas ut suscipit velit pariatur voluptatem cupiditate. Nostrum quibusdam dolores provident qui repellendus. Quaerat suscipit explicabo libero aut corporis et.'),
(29, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 3, 'Ullam accusantium doloribus porro dolorem unde aut nulla.', 'ullam-accusantium-doloribus-porro-dolorem-unde-aut-nulla', 'Dolor assumenda ut quis saepe dolores. Ducimus deserunt corrupti et impedit vitae minima explicabo sed. Est esse vero voluptatibus exercitationem aut. Error voluptatibus qui voluptates voluptates iure eum corrupti nesciunt.'),
(30, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 3, 'Eaque in id veritatis sequi esse et quidem.', 'eaque-in-id-veritatis-sequi-esse-et-quidem', 'Ratione velit architecto qui ut non. Sequi consequuntur optio itaque corporis itaque in. Aut sunt optio magni soluta id. Odio impedit amet in maiores temporibus.'),
(31, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 4, 'Illo aut nobis et aut enim suscipit.', 'illo-aut-nobis-et-aut-enim-suscipit', 'Aut adipisci explicabo culpa illo nulla ut. Odio praesentium alias tenetur veniam. Beatae alias in libero et quaerat atque tenetur. Assumenda ratione ex sint non labore modi facere.'),
(32, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 4, 'Vitae voluptatum minus animi perferendis et.', 'vitae-voluptatum-minus-animi-perferendis-et', 'Voluptas culpa accusamus est recusandae unde quasi inventore aut. Assumenda earum possimus corporis et. Totam pariatur eveniet similique natus.'),
(33, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 4, 'Qui omnis aut aliquid aperiam sit laboriosam magnam est.', 'qui-omnis-aut-aliquid-aperiam-sit-laboriosam-magnam-est', 'Officia cum commodi exercitationem dignissimos beatae itaque. Cupiditate quis quaerat saepe non rerum enim itaque. A sequi a nesciunt hic eaque numquam odio. Autem ut rem rerum rerum qui fugiat necessitatibus.'),
(34, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 4, 'Sequi excepturi quisquam suscipit vero.', 'sequi-excepturi-quisquam-suscipit-vero', 'Dignissimos ipsum ut sunt cumque. Et eum ipsa at. Quibusdam placeat aut commodi ut. Sequi praesentium rerum rem.'),
(35, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 4, 'Veritatis expedita officia quam excepturi illo velit dolor.', 'veritatis-expedita-officia-quam-excepturi-illo-velit-dolor', 'Cumque voluptatem molestias error quae enim. Voluptas rerum dignissimos laudantium nemo unde modi veritatis. Dolores quae recusandae iusto dolor molestiae velit earum aut.'),
(36, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 4, 'Possimus sed delectus et ducimus eum.', 'possimus-sed-delectus-et-ducimus-eum', 'Nam dolore esse atque minus doloribus rem. Dolor omnis est sint dolore nostrum. Velit quibusdam qui libero deserunt. Eligendi sed delectus nemo.'),
(37, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 4, 'Qui deserunt consequuntur est porro quo optio dolores animi.', 'qui-deserunt-consequuntur-est-porro-quo-optio-dolores-animi', 'Et nostrum veritatis odio atque. Tenetur nesciunt iure atque vel magni nesciunt eius non. Qui non rerum consectetur ducimus at enim voluptatibus. Expedita neque tenetur tempore ex.'),
(38, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 4, 'Recusandae pariatur unde dolore reprehenderit commodi.', 'recusandae-pariatur-unde-dolore-reprehenderit-commodi', 'Debitis porro laboriosam asperiores repellendus vero ut aut porro. Aspernatur amet fugit dolor ipsa officiis. Hic harum consequatur id rerum quo. Voluptas sit numquam temporibus id doloremque.'),
(39, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 4, 'Est nisi natus iure.', 'est-nisi-natus-iure', 'Laudantium atque qui provident maiores eius occaecati sit. Ea quasi non cumque cumque iure laborum. Ipsum quo illo hic aperiam porro ipsum facilis repellendus. Et similique eum eum nostrum sapiente voluptatem aut.'),
(40, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 4, 'Adipisci a velit deserunt soluta et ipsa tenetur.', 'adipisci-a-velit-deserunt-soluta-et-ipsa-tenetur', 'Velit labore quaerat illo repellat soluta. Nihil voluptatem sit ab et autem tempora. Iure commodi reiciendis ab quisquam. Necessitatibus et reprehenderit est ut magni consequatur. Quia vel alias est ipsam recusandae est libero.'),
(41, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 5, 'Eveniet laudantium sit tempora unde repudiandae at.', 'eveniet-laudantium-sit-tempora-unde-repudiandae-at', 'Enim temporibus accusamus ut. Qui veniam labore debitis consectetur quisquam quisquam. Sunt animi velit qui ut atque dicta sed sed. Quod maxime corporis minus et hic occaecati.'),
(42, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 5, 'Itaque voluptates ex unde et.', 'itaque-voluptates-ex-unde-et', 'Beatae doloremque officiis hic unde velit aut. Voluptas molestias sint qui ipsam vel consectetur. Voluptatibus tempora ab aut sed sunt.'),
(43, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 5, 'Ullam voluptas enim id soluta.', 'ullam-voluptas-enim-id-soluta', 'Delectus eaque a recusandae eum iste id. Ratione corrupti rerum quidem aperiam accusantium aspernatur.'),
(44, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 5, 'Nihil rerum placeat amet a magnam aut qui repudiandae.', 'nihil-rerum-placeat-amet-a-magnam-aut-qui-repudiandae', 'Inventore expedita omnis molestiae qui omnis a. Sunt expedita saepe aspernatur.'),
(45, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 5, 'Doloribus earum sit itaque.', 'doloribus-earum-sit-itaque', 'Sit sed amet voluptas. Unde rem et nemo reprehenderit. Rem magni temporibus dolores fugit temporibus.'),
(46, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 5, 'Quidem velit et doloribus ea quae ut.', 'quidem-velit-et-doloribus-ea-quae-ut', 'Quam a ipsa deleniti et non numquam molestiae. Est ipsa est doloremque reiciendis enim ea vero. Repellat iure et non sunt aperiam enim officia.'),
(47, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 5, 'Rem unde consequatur et voluptas.', 'rem-unde-consequatur-et-voluptas', 'Adipisci sunt est architecto nostrum sed. Odio explicabo voluptate ut rem. Possimus facere magnam pariatur perspiciatis earum consequuntur.'),
(48, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 5, 'Aspernatur odio nesciunt aut est id.', 'aspernatur-odio-nesciunt-aut-est-id', 'Quia dolore aut ut blanditiis sunt beatae. Facilis sapiente et qui molestiae voluptas dolore non. Molestiae incidunt dicta corporis earum nam consequatur culpa odit. Et quibusdam ut blanditiis qui recusandae eum velit est.'),
(49, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 5, 'Maiores eos explicabo exercitationem ipsum libero vel.', 'maiores-eos-explicabo-exercitationem-ipsum-libero-vel', 'Magni consectetur qui deleniti eos possimus est sit. Voluptas impedit laboriosam voluptatum. Repellendus repellat voluptas vel cum saepe distinctio.'),
(50, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 5, 'Libero voluptas ad illum et deleniti.', 'libero-voluptas-ad-illum-et-deleniti', 'Modi aut ullam at autem culpa. Aut itaque et laborum aut dolorum. Et id molestiae quos excepturi est odio. Sed facilis aut maxime similique.'),
(51, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 6, 'Mollitia corporis laborum quo sint temporibus.', 'mollitia-corporis-laborum-quo-sint-temporibus', 'Voluptatibus molestiae debitis distinctio nam hic occaecati. Laudantium ab aliquid iusto veritatis quo voluptas nulla. Necessitatibus porro et nihil.'),
(52, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 6, 'Suscipit est perferendis exercitationem consequatur.', 'suscipit-est-perferendis-exercitationem-consequatur', 'Et id omnis expedita velit nihil vero consequatur. Maiores cum nobis suscipit cupiditate sed vero. Quia dolor distinctio rerum deserunt eum. Assumenda omnis id voluptas ullam maxime sit et.'),
(53, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 6, 'Quae quam consequatur inventore impedit fugit.', 'quae-quam-consequatur-inventore-impedit-fugit', 'Nihil labore debitis vitae reprehenderit sit beatae. Consequatur harum ut adipisci impedit. Inventore et vel ab quae qui reiciendis. Alias est culpa voluptate quisquam.'),
(54, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 6, 'Dolorem voluptates magnam sit tempora eveniet quia provident.', 'dolorem-voluptates-magnam-sit-tempora-eveniet-quia-provident', 'Ut maiores aut voluptas et. Veritatis sapiente harum repellendus aut odit doloremque modi. Ut nisi temporibus reprehenderit dignissimos natus temporibus.'),
(55, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 6, 'Quo mollitia numquam eos ea qui.', 'quo-mollitia-numquam-eos-ea-qui', 'Qui odio enim error non saepe placeat. Architecto quos iusto consequuntur nesciunt. Sit fuga sunt cumque pariatur laudantium officia. At ipsa laboriosam voluptas laboriosam.'),
(56, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 6, 'Illo dicta aut nesciunt eveniet explicabo.', 'illo-dicta-aut-nesciunt-eveniet-explicabo', 'Voluptate corporis ad commodi laudantium. Recusandae possimus repellendus maiores et qui quia. Cumque rerum veniam a officia magni in nam. Vero quas nostrum accusamus harum et eveniet et. Illum deserunt quidem deleniti et repellat sequi doloremque.'),
(57, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 6, 'Ut et aliquam ea provident esse.', 'ut-et-aliquam-ea-provident-esse', 'Ullam saepe accusamus odio sint impedit ut. In totam architecto omnis provident saepe dolor. Ipsa est minima illo reiciendis.'),
(58, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 6, 'Doloremque facilis facere adipisci necessitatibus.', 'doloremque-facilis-facere-adipisci-necessitatibus', 'Ratione totam vel eveniet enim corporis doloribus totam. Dolorum dolores voluptas eveniet vitae harum quia aliquid consequatur. Perspiciatis praesentium dolorum esse nam. Et iste quo ut accusantium ad modi quia.'),
(59, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 6, 'Explicabo molestiae corrupti veritatis vitae voluptatum rerum quod.', 'explicabo-molestiae-corrupti-veritatis-vitae-voluptatum-rerum-quod', 'Distinctio aut veritatis sint rem optio. Ipsa vero qui temporibus blanditiis esse. Modi illum velit a minus placeat dolorum.'),
(60, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 6, 'Et corrupti facere nostrum.', 'et-corrupti-facere-nostrum', 'Id magnam repudiandae error qui. Autem et beatae atque doloremque hic eligendi et. Nostrum maiores maiores et beatae nihil quia sequi. Numquam quo aliquid est ut.'),
(61, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 7, 'Sunt autem asperiores ducimus consequatur nam tenetur error.', 'sunt-autem-asperiores-ducimus-consequatur-nam-tenetur-error', 'Sint neque nobis et. Aut quis est delectus repellendus nam perspiciatis. Odio ut quos cupiditate accusantium. Tenetur numquam aliquid laudantium minus impedit aut quos. Consequatur vitae tenetur sunt qui et optio.'),
(62, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 7, 'Nihil maiores natus deserunt quia libero.', 'nihil-maiores-natus-deserunt-quia-libero', 'Ipsam fuga aperiam omnis et quibusdam qui nostrum. Nobis aperiam et perspiciatis illum mollitia praesentium. Ut voluptatem odio ex iste sit non commodi.'),
(63, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 7, 'Voluptatem ex esse aut corporis amet.', 'voluptatem-ex-esse-aut-corporis-amet', 'Eos voluptatem provident laborum eos doloribus. Temporibus tempora qui numquam laboriosam veniam totam. Doloribus quidem veniam veritatis qui molestiae. Facilis ipsam quaerat eius optio quia. Repellat recusandae ut itaque non quia nemo libero.'),
(64, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 7, 'Ipsum dolores ex aliquam neque sunt delectus qui.', 'ipsum-dolores-ex-aliquam-neque-sunt-delectus-qui', 'Quaerat consequuntur laborum dolor ipsum ea quidem aspernatur. Rerum quas quasi vel illo. Voluptatem facere optio voluptas possimus vel consequuntur voluptatibus voluptatum. Rerum deserunt odit inventore odio fugiat cum.'),
(65, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 7, 'Dolor sed rerum consequuntur officiis exercitationem quod fugiat.', 'dolor-sed-rerum-consequuntur-officiis-exercitationem-quod-fugiat', 'Et recusandae hic perspiciatis et dignissimos. Qui nihil voluptas delectus aut repellat sed. Qui consectetur aut qui voluptas autem.'),
(66, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 7, 'Accusamus nesciunt porro sit non quod qui rem.', 'accusamus-nesciunt-porro-sit-non-quod-qui-rem', 'Quibusdam impedit dolor porro ea. Saepe nam dolor nihil quibusdam ab quis. Repellat magnam distinctio temporibus culpa officia consequatur.'),
(67, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 7, 'Dolor et quia velit cumque praesentium fugiat.', 'dolor-et-quia-velit-cumque-praesentium-fugiat', 'Et recusandae tempora unde. Dolore tempora placeat nihil maxime ab ipsam nobis. Qui explicabo voluptatibus unde recusandae. Ut quidem adipisci beatae at nisi.'),
(68, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 7, 'Magnam facere laudantium eum error aspernatur modi.', 'magnam-facere-laudantium-eum-error-aspernatur-modi', 'Et ipsa ut nostrum sit reiciendis at. Tempora est iusto id vitae.'),
(69, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 7, 'Enim omnis ab quo autem necessitatibus beatae.', 'enim-omnis-ab-quo-autem-necessitatibus-beatae', 'Quasi aut ipsum laborum mollitia eos sit voluptates architecto. Facere sint molestiae et ut nemo. Repellendus pariatur perferendis ut corrupti suscipit enim similique.'),
(70, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 7, 'Corrupti dolor et delectus quaerat repellat eaque.', 'corrupti-dolor-et-delectus-quaerat-repellat-eaque', 'Omnis corrupti reiciendis ex illo et. Laborum sequi non aut quo. Sunt rem et eveniet accusamus adipisci. Et ut quae tempora.'),
(71, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 8, 'Ea qui reiciendis voluptatem impedit aut illo eligendi et.', 'ea-qui-reiciendis-voluptatem-impedit-aut-illo-eligendi-et', 'Assumenda cupiditate sed ut explicabo. Illum fugit at aut. Qui quisquam earum doloremque optio quo sint rerum. Porro tempora unde et aliquid eius atque voluptatem adipisci.'),
(72, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 8, 'Repellendus magni reiciendis ut doloremque provident.', 'repellendus-magni-reiciendis-ut-doloremque-provident', 'Ipsum delectus iusto quisquam illum. Culpa soluta eos velit molestiae eligendi sint corporis velit. Porro recusandae accusantium omnis molestias reprehenderit aperiam voluptates adipisci.'),
(73, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 8, 'Quisquam nobis qui iusto a aut sunt.', 'quisquam-nobis-qui-iusto-a-aut-sunt', 'Perspiciatis et placeat quam occaecati maiores. Qui facere qui nam et est praesentium. Voluptatem optio ipsa numquam sit.'),
(74, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 8, 'Vero expedita ratione esse voluptatem ad.', 'vero-expedita-ratione-esse-voluptatem-ad', 'Facilis quia harum et perspiciatis commodi aspernatur enim. Itaque optio sequi error explicabo harum inventore. Quia et omnis ut saepe enim qui maxime.'),
(75, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 8, 'Consequatur enim harum quia id enim et omnis.', 'consequatur-enim-harum-quia-id-enim-et-omnis', 'Aut earum dolorem enim et iusto ipsam qui. Ducimus odio dolor pariatur.'),
(76, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 8, 'Ex est aut natus nihil eaque quas modi.', 'ex-est-aut-natus-nihil-eaque-quas-modi', 'Inventore qui architecto porro facilis dolorem. Impedit est ad nostrum debitis. Quod occaecati delectus qui.'),
(77, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 8, 'Nihil et hic ut recusandae magni commodi.', 'nihil-et-hic-ut-recusandae-magni-commodi', 'Sunt incidunt hic sed rerum mollitia. Eum accusamus distinctio quod mollitia quo. Officiis temporibus consectetur quisquam dignissimos accusamus voluptate. Quaerat ea vel fugit ut rem. Quo voluptatem excepturi eos ipsa quo officiis.'),
(78, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 8, 'Et tenetur rerum maxime et.', 'et-tenetur-rerum-maxime-et', 'Ut et ut a ab quae. Rerum ratione eius error doloremque. Asperiores alias ullam officiis debitis possimus in.'),
(79, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 8, 'Atque hic aspernatur quis corrupti soluta quia beatae odit.', 'atque-hic-aspernatur-quis-corrupti-soluta-quia-beatae-odit', 'Aut adipisci voluptas eum eum autem quia dignissimos. Necessitatibus autem et et rerum ipsam aut vero. Et quidem ea optio dolore accusantium. Nostrum voluptate hic incidunt iure animi qui dolorum. Dolor esse vel laudantium vitae possimus.'),
(80, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 8, 'Quo autem tempora libero harum culpa.', 'quo-autem-tempora-libero-harum-culpa', 'Sed accusamus repellat atque ipsa ut sint. Aut harum qui adipisci dolores voluptatem ab. Cumque quia ullam distinctio praesentium nam minima et. Voluptatem nihil eaque fugit sit doloribus inventore.'),
(81, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 9, 'Nesciunt pariatur nulla et repellendus architecto autem optio.', 'nesciunt-pariatur-nulla-et-repellendus-architecto-autem-optio', 'Recusandae expedita quibusdam totam earum pariatur molestiae. Iusto maiores et aliquam nam. Nisi voluptas autem eum quis molestiae in et nobis.'),
(82, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 9, 'A perspiciatis et beatae suscipit saepe sint.', 'a-perspiciatis-et-beatae-suscipit-saepe-sint', 'Consequuntur vel molestiae est porro blanditiis delectus et. Impedit eligendi ut consequatur est corporis. Ex quam expedita aperiam ipsa numquam excepturi debitis.'),
(83, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 9, 'Doloremque magni sint nam doloribus.', 'doloremque-magni-sint-nam-doloribus', 'Facilis totam reiciendis laboriosam dolor provident quia. Id architecto ab commodi enim sit voluptas rerum.'),
(84, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 9, 'Tempora dignissimos quia adipisci consequatur.', 'tempora-dignissimos-quia-adipisci-consequatur', 'Qui ex quibusdam magnam beatae sunt expedita dolores dicta. Temporibus quaerat non praesentium voluptas praesentium non. Magnam reiciendis quidem et velit vel dignissimos optio. Voluptatibus rerum sit quas odio a voluptas ut.'),
(85, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 9, 'Aut quo est enim.', 'aut-quo-est-enim', 'Voluptate voluptatum sed nisi. Harum voluptatem enim non veritatis illum id. Qui accusantium hic facilis laboriosam magnam est aspernatur.'),
(86, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 9, 'Animi autem eum quisquam quo voluptatem.', 'animi-autem-eum-quisquam-quo-voluptatem', 'Unde voluptatem suscipit nostrum deleniti assumenda voluptatem quis. Repellendus assumenda et tempora odit non fuga. Magni odio est quia rerum qui adipisci necessitatibus nostrum. Molestiae nesciunt ipsa et et recusandae.'),
(87, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 9, 'Omnis quia veritatis id voluptatem error nulla voluptatem.', 'omnis-quia-veritatis-id-voluptatem-error-nulla-voluptatem', 'Ex non provident eaque praesentium odit consequatur. Commodi nisi voluptatem ea error voluptatem voluptatem ut.'),
(88, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 9, 'Ex et dignissimos soluta optio ab.', 'ex-et-dignissimos-soluta-optio-ab', 'Aut ut unde atque. Molestiae facere deserunt mollitia voluptate aut.'),
(89, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 9, 'Expedita eum at sunt quibusdam.', 'expedita-eum-at-sunt-quibusdam', 'Facere ex sed quos eligendi consectetur perspiciatis consectetur. Ratione omnis maxime officiis consequatur. Est placeat velit impedit atque et maiores dolorum. Eum aperiam incidunt ea sunt quis.'),
(90, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 9, 'Nihil aliquam esse at odit.', 'nihil-aliquam-esse-at-odit', 'Ea quod est nihil aperiam accusantium voluptatem error et. Delectus consectetur voluptas sit et consequatur consequuntur doloribus. Tempora et minus et nisi quaerat enim ut.'),
(91, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 10, 'Quia rem qui molestias enim culpa nihil.', 'quia-rem-qui-molestias-enim-culpa-nihil', 'Dolorem incidunt explicabo repudiandae delectus eligendi rerum cupiditate. Et incidunt molestiae facilis occaecati eveniet. Suscipit consectetur doloribus dolores accusamus minima.'),
(92, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 10, 'Quae ipsa eveniet aliquid et.', 'quae-ipsa-eveniet-aliquid-et', 'Dolorum dolores adipisci expedita quo fuga. Et beatae iste dolor dolor culpa nisi perspiciatis. Itaque quis ut ipsam mollitia.'),
(93, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 10, 'Qui aut rerum dolores natus.', 'qui-aut-rerum-dolores-natus', 'Nihil architecto laborum distinctio quam ipsam ad laborum. Nemo reprehenderit velit similique adipisci quisquam neque dolorem. Ipsam rerum aut et voluptatem.'),
(94, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 10, 'Nulla sint sint ex occaecati et ut aut quos.', 'nulla-sint-sint-ex-occaecati-et-ut-aut-quos', 'Ut libero provident sint omnis. Tempora nihil fugiat cumque dignissimos earum. Cupiditate illum id quasi quae est.'),
(95, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 10, 'Dolorum voluptas debitis ex sunt voluptate.', 'dolorum-voluptas-debitis-ex-sunt-voluptate', 'Accusamus quaerat blanditiis ducimus omnis amet facilis eum. Porro iste recusandae nobis est. Voluptas nam quis aut minima est repellendus.'),
(96, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 10, 'Magni praesentium quo sed quia laboriosam.', 'magni-praesentium-quo-sed-quia-laboriosam', 'Explicabo consequuntur sapiente cum totam nobis. Nam officiis a et aut laborum. Placeat sequi aut magni odio optio. Natus pariatur tenetur aut quidem.'),
(97, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 10, 'Et ab fugiat voluptatum facilis voluptatem.', 'et-ab-fugiat-voluptatum-facilis-voluptatem', 'Voluptatem quia accusamus cumque. Exercitationem quod ipsum quo et similique quod cumque. Maxime qui veritatis cumque. Facilis labore eum id blanditiis.'),
(98, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 10, 'Voluptates rerum excepturi similique.', 'voluptates-rerum-excepturi-similique', 'Possimus commodi dolorem beatae laboriosam quae. Quod ullam omnis explicabo aut. Architecto repellat sint esse et. Quia aut non non consequatur quod nesciunt in.'),
(99, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 10, 'Minus autem nostrum aspernatur quo dolorem repudiandae.', 'minus-autem-nostrum-aspernatur-quo-dolorem-repudiandae', 'Non quia deleniti et non ullam et. Minus qui cumque id enim sint rerum voluptas. Optio sit laboriosam aut autem nam.'),
(100, '2024-05-15 06:08:36', '2024-05-15 06:08:36', NULL, 10, 'Repellendus quia quibusdam et.', 'repellendus-quia-quibusdam-et', 'Sed sapiente id voluptatem earum earum sit. Numquam itaque nostrum inventore. Sit aut earum laboriosam repellat.');

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('fyoK0iDbYjokbfWP6Vd8nSeXakNj0Zq5ei93mCoT', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidjVRN3JlY2lpb3FkZ2tvaXFabkZ2RjdxMG5icFRRc2V3TzJ6a29aSCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vc2Vjb25kLnRlc3QvcG9zdHM/cGFnZT0yIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1715753352);

INSERT INTO `users` (`id`, `name`, `type`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Albertha Bartoletti DVM', 'user', 'malika.schuppe@example.org', '2024-05-15 06:08:35', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', '0Ahr36W984', '2024-05-15 06:08:35', '2024-05-15 06:08:35'),
(2, 'Kariane Rosenbaum', 'user', 'nlesch@example.net', '2024-05-15 06:08:35', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'm7bEELC3mG', '2024-05-15 06:08:35', '2024-05-15 06:08:35'),
(3, 'Maximus Weissnat', 'user', 'dgreenfelder@example.com', '2024-05-15 06:08:35', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'RNjdSOkvOZ', '2024-05-15 06:08:35', '2024-05-15 06:08:35'),
(4, 'Stefan Kris', 'user', 'dgusikowski@example.org', '2024-05-15 06:08:35', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'g6wD1sKt4y', '2024-05-15 06:08:35', '2024-05-15 06:08:35'),
(5, 'Gretchen Volkman', 'user', 'christine.cassin@example.org', '2024-05-15 06:08:35', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'F7Wqc5TuRv', '2024-05-15 06:08:35', '2024-05-15 06:08:35'),
(6, 'Vito Hoppe', 'user', 'kris.vaughn@example.org', '2024-05-15 06:08:35', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'VR5Xj21IjW', '2024-05-15 06:08:35', '2024-05-15 06:08:35'),
(7, 'Wilhelmine Cummings', 'user', 'emarvin@example.com', '2024-05-15 06:08:35', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'Wwple9ePgo', '2024-05-15 06:08:35', '2024-05-15 06:08:35'),
(8, 'Dewitt Block', 'user', 'zabernathy@example.org', '2024-05-15 06:08:35', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'HzOFbICkQf', '2024-05-15 06:08:35', '2024-05-15 06:08:35'),
(9, 'Joanne Mann DDS', 'user', 'vmccullough@example.com', '2024-05-15 06:08:35', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'E5Fbw63Pzf', '2024-05-15 06:08:35', '2024-05-15 06:08:35'),
(10, 'Prof. Nathen Koelpin', 'user', 'ffay@example.org', '2024-05-15 06:08:35', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'KRu6SPzBEf', '2024-05-15 06:08:35', '2024-05-15 06:08:35'),
(11, 'Lacy Bernhard', 'admin', 'johns.uriah@example.com', '2024-05-15 06:08:36', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', '1XnXU1aGme', '2024-05-15 06:08:36', '2024-05-15 06:08:36'),
(12, 'Lacy Donnelly', 'admin', 'jmcclure@example.com', '2024-05-15 06:08:36', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', '875hrFiv3B', '2024-05-15 06:08:36', '2024-05-15 06:08:36'),
(13, 'Jermain Hirthe', 'publisher', 'wisoky.marcelino@example.org', '2024-05-15 06:08:36', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'YjEqeTr3jH', '2024-05-15 06:08:36', '2024-05-15 06:08:36'),
(14, 'Mr. Alec Bruen Sr.', 'publisher', 'amiya.monahan@example.net', '2024-05-15 06:08:36', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'w68GIaDgzs', '2024-05-15 06:08:36', '2024-05-15 06:08:36'),
(15, 'Prof. Gladys Heidenreich PhD', 'manager', 'johann.leffler@example.net', '2024-05-15 06:08:36', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'TjY7Fokgw5', '2024-05-15 06:08:36', '2024-05-15 06:08:36'),
(16, 'Isai Feil', 'manager', 'otis.nikolaus@example.org', '2024-05-15 06:08:36', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'tdBL6zZPjN', '2024-05-15 06:08:36', '2024-05-15 06:08:36'),
(17, 'Test User', 'user', 'test@example.com', '2024-05-15 06:08:36', '$2y$12$V//iWm.qA15W/3BO3ew3cOH3LS41bsA2CBEekjmXQABfW46glSn6C', 'cMGJ7gSBX0', '2024-05-15 06:08:36', '2024-05-15 06:08:36');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;