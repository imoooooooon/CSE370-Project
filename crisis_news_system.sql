-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2026 at 09:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crisis_news_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert_region`
--

CREATE TABLE `alert_region` (
  `alert_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alert_region`
--

INSERT INTO `alert_region` (`alert_id`, `region_id`) VALUES
(1, 1),
(1, 3),
(2, 4),
(3, 1),
(4, 7),
(5, 11),
(6, 10),
(7, 1),
(8, 12),
(9, 8),
(10, 1),
(10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `app_user`
--

CREATE TABLE `app_user` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `preferred_language` varchar(50) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_live_location` tinyint(1) DEFAULT 0,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_user`
--

INSERT INTO `app_user` (`user_id`, `full_name`, `email`, `preferred_language`, `password_hash`, `latitude`, `longitude`, `created_at`, `is_live_location`, `region_id`) VALUES
(1, 'Mehrab Mugdho', 'mehrab@example.com', 'English', 'hash_001', 23.81030000, 90.41250000, '2026-04-01 09:00:00', 1, 1),
(2, 'Araf Rahman', 'araf.rahman@example.com', 'Bangla', 'hash_002', 22.35690000, 91.78320000, '2026-04-01 09:10:00', 1, 2),
(3, 'Nusrat Jahan', 'nusrat.jahan@example.com', 'Bangla', 'hash_003', 24.89490000, 91.86870000, '2026-04-01 09:20:00', 0, 3),
(4, 'Tahsin Ahmed', 'tahsin.ahmed@example.com', 'English', 'hash_004', 25.06580000, 91.39500000, '2026-04-01 09:30:00', 1, 4),
(5, 'Sadia Islam', 'sadia.islam@example.com', 'Bangla', 'hash_005', 23.92000000, 90.71760000, '2026-04-01 09:40:00', 1, 5),
(6, 'Rafi Chowdhury', 'rafi.chowdhury@example.com', 'English', 'hash_006', 23.62380000, 90.50000000, '2026-04-01 09:50:00', 0, 6),
(7, 'Maliha Khan', 'maliha.khan@example.com', 'Bangla', 'hash_007', 23.79370000, 90.40660000, '2026-04-01 10:00:00', 1, 7),
(8, 'Sakib Hossain', 'sakib.hossain@example.com', 'English', 'hash_008', 23.82230000, 90.36540000, '2026-04-01 10:10:00', 0, 8),
(9, 'Raisa Karim', 'raisa.karim@example.com', 'Bangla', 'hash_009', 21.42720000, 92.00580000, '2026-04-01 10:20:00', 1, 9),
(10, 'Farhan Kabir', 'farhan.kabir@example.com', 'English', 'hash_010', 24.87000000, 90.72000000, '2026-04-01 10:30:00', 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `article_region`
--

CREATE TABLE `article_region` (
  `region_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article_region`
--

INSERT INTO `article_region` (`region_id`, `article_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 8),
(1, 10),
(3, 13),
(4, 3),
(7, 5),
(7, 14),
(8, 12),
(9, 11),
(10, 7),
(11, 6),
(12, 9);

-- --------------------------------------------------------

--
-- Table structure for table `article_translation`
--

CREATE TABLE `article_translation` (
  `article_id` int(11) NOT NULL,
  `language` varchar(50) NOT NULL,
  `translated_content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article_translation`
--

INSERT INTO `article_translation` (`article_id`, `language`, `translated_content`) VALUES
(1, 'Bangla', 'মণিপুরে ভূমিকম্পের পর ঢাকা ও বাংলাদেশের বিভিন্ন স্থানে কম্পন অনুভূত হয়েছে।'),
(2, 'Bangla', 'মণিপুরের মাঝারি ভূমিকম্পে ঢাকা ও আশপাশের এলাকায় কম্পন অনুভূত হয়।'),
(3, 'Bangla', 'সুনামগঞ্জে আগাম বন্যার আশঙ্কায় কৃষকদের দ্রুত বোরো ধান কাটার পরামর্শ দেওয়া হয়েছে।'),
(4, 'Bangla', 'ঢাকার শিশু হাসপাতালের বেজমেন্টে আগুন লাগে এবং পরে তা নিয়ন্ত্রণে আনা হয়।'),
(5, 'Bangla', 'বনানীর ১১ তলা ভবনে আগুন লাগে এবং ফায়ার সার্ভিস ঘটনাস্থলে যায়।'),
(6, 'Bangla', 'বাংলাদেশের কয়েকটি জেলায় বজ্রপাতে একাধিক মানুষের মৃত্যু হয়েছে।'),
(7, 'Bangla', 'নেত্রকোনায় শিলাবৃষ্টিতে বোরো ফসলের ক্ষতি হয়েছে।'),
(8, 'Bangla', 'বাংলাদেশে ভূমিকম্প ঝুঁকি বাড়ছে বলে বিশেষজ্ঞরা সতর্ক করেছেন।'),
(9, 'Bangla', 'ঢাকার কাছে গ্যাস লাইটার কারখানায় আগুনে হতাহতের ঘটনা ঘটেছে।'),
(10, 'Bangla', 'ঢাকার তাপ, জলাবদ্ধতা ও জলবায়ু ঝুঁকি কমাতে সহনশীল নগর পরিকল্পনা প্রয়োজন।'),
(11, 'Bangla', 'কক্সবাজার উপকূলীয় দুর্যোগ পর্যবেক্ষণের জন্য গুরুত্বপূর্ণ এলাকা।'),
(12, 'Bangla', 'ঢাকার মিরপুরে একটি বহুতল বাণিজ্যিক ভবনে আগুন লাগে।'),
(13, 'Bangla', 'বাংলাদেশে আবার মাঝারি মাত্রার ভূমিকম্প অনুভূত হয়েছে।'),
(14, 'Bangla', 'ঢাকার বস্তিতে ভয়াবহ আগুনে বহু মানুষ গৃহহীন হয়ে পড়ে।');

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`user_id`, `article_id`) VALUES
(1, 1),
(1, 8),
(2, 4),
(2, 6),
(3, 2),
(3, 10),
(4, 3),
(4, 11),
(5, 1),
(5, 13),
(6, 9),
(7, 5),
(8, 12),
(9, 11),
(10, 7);

-- --------------------------------------------------------

--
-- Table structure for table `crisis_alert`
--

CREATE TABLE `crisis_alert` (
  `alert_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `alert_message` text DEFAULT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crisis_alert`
--

INSERT INTO `crisis_alert` (`alert_id`, `created_at`, `alert_message`, `event_id`) VALUES
(1, '2026-04-21 09:45:00', 'Earthquake tremors felt near your area. Stay calm and avoid unsafe buildings.', 1),
(2, '2026-04-21 21:10:00', 'Possible early flood risk in Sunamganj haor areas. Farmers should harvest quickly.', 2),
(3, '2026-04-20 14:20:00', 'Fire reported near Shishu Hospital area. Avoid nearby roads and follow emergency instructions.', 3),
(4, '2026-04-15 19:40:00', 'Fire reported in Banani multi-storey building. Avoid the area.', 4),
(5, '2026-04-26 21:30:00', 'Lightning risk reported in multiple districts. Stay indoors during storms.', 5),
(6, '2026-04-10 03:00:00', 'Hailstorm damaged crop fields in Netrokona. Agricultural response may be needed.', 6),
(7, '2026-04-24 19:00:00', 'Earthquake preparedness alert: check building safety and emergency plans.', 7),
(8, '2026-04-05 17:20:00', 'Factory fire reported near Keraniganj. Avoid affected industrial area.', 8),
(9, '2026-03-09 15:10:00', 'Fire reported at Mirpur commercial building. Avoid nearby area.', 11),
(10, '2026-02-27 14:30:00', 'Moderate earthquake felt in Bangladesh. Stay alert for updates.', 12);

-- --------------------------------------------------------

--
-- Table structure for table `crisis_event`
--

CREATE TABLE `crisis_event` (
  `event_id` int(11) NOT NULL,
  `crisis_type` varchar(100) DEFAULT NULL,
  `severity_level` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crisis_event`
--

INSERT INTO `crisis_event` (`event_id`, `crisis_type`, `severity_level`) VALUES
(1, 'Earthquake', 'Medium'),
(2, 'Flood', 'Medium'),
(3, 'Fire', 'Medium'),
(4, 'Fire', 'High'),
(5, 'Lightning', 'High'),
(6, 'Hailstorm', 'Medium'),
(7, 'Earthquake Risk', 'High'),
(8, 'Fire', 'High'),
(11, 'Fire', 'Medium'),
(12, 'Earthquake', 'Medium');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `event_description` text DEFAULT NULL,
  `canonical_title` varchar(255) DEFAULT NULL,
  `event_type` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `region_id`, `event_description`, `canonical_title`, `event_type`, `created_at`) VALUES
(1, 1, 'Earthquake tremors were felt in Dhaka and other parts of Bangladesh after a quake in Manipur.', 'Manipur earthquake tremors felt in Bangladesh', 'Earthquake', '2026-04-21 09:36:00'),
(2, 4, 'Water Development Board warned farmers in Sunamganj haor areas about possible early flood and advised quick harvesting.', 'Possible early flood warning in Sunamganj', 'Flood Risk', '2026-04-21 21:03:00'),
(3, 1, 'A fire broke out in the basement of Bangladesh Shishu Hospital and Institute in Dhaka.', 'Fire at Shishu Hospital basement', 'Fire Incident', '2026-04-20 14:11:00'),
(4, 7, 'A fire broke out on the 10th floor of an 11-storey building in Banani, Dhaka.', 'Banani multi-storey building fire', 'Fire Incident', '2026-04-15 19:29:00'),
(5, 11, 'Lightning strikes killed people in several Bangladesh districts during stormy weather.', 'Lightning deaths across Bangladesh', 'Lightning', '2026-04-26 21:10:00'),
(6, 10, 'A hailstorm damaged boro crops in Netrokona, creating agricultural losses for farmers.', 'Netrokona hailstorm crop damage', 'Hailstorm', '2026-04-10 02:31:00'),
(7, 1, 'Experts warned that Bangladesh has recorded many tremors and faces growing earthquake vulnerability.', 'Bangladesh earthquake vulnerability warning', 'Disaster Preparedness', '2026-04-24 18:46:00'),
(8, 12, 'A gas lighter factory fire near Dhaka caused deaths and property damage.', 'Keraniganj gas lighter factory fire', 'Fire Incident', '2026-04-05 17:00:00'),
(9, 1, 'Dhaka faces climate pressure from heat, heavy rain, poor drainage, and urban flooding risk.', 'Dhaka climate resilience and flood risk', 'Climate Risk', '2026-04-19 09:30:00'),
(10, 9, 'Cox\'s Bazar remains important for coastal crisis monitoring because of storms, refugee settlements, and emergency response needs.', 'Cox\'s Bazar coastal risk monitoring', 'Regional Monitoring', '2026-04-22 11:00:00'),
(11, 8, 'A fire broke out at a multi-storey commercial building in Mirpur.', 'Mirpur commercial building fire', 'Fire Incident', '2026-03-09 14:58:00'),
(12, 3, 'A moderate earthquake affected Sylhet region and other parts of Bangladesh.', 'Moderate earthquake felt near Sylhet region', 'Earthquake', '2026-02-27 14:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `user_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`user_id`, `source_id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 4),
(3, 1),
(3, 3),
(4, 1),
(4, 5),
(5, 2),
(5, 3),
(6, 8),
(7, 2),
(8, 5),
(9, 6),
(10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `news_article`
--

CREATE TABLE `news_article` (
  `article_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `event_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `credibility_score` decimal(5,2) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `article_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_article`
--

INSERT INTO `news_article` (`article_id`, `title`, `event_id`, `source_id`, `content`, `summary`, `published_at`, `language`, `credibility_score`, `category`, `image_url`, `article_url`) VALUES
(1, 'Bangladesh feels tremors after quake in Manipur', 1, 2, 'Residents of Dhaka and other parts of Bangladesh reported tremors after a moderate earthquake in Manipur.', 'Dhaka and nearby areas felt earthquake tremors from Manipur.', '2026-04-21 16:01:00', 'English', 8.90, 'Earthquake', 'https://example.com/images/manipur-quake-bdnews.jpg', 'https://bdnews24.com/bangladesh/6c9242cddf77'),
(2, 'Dhaka jolted by moderate earthquake in Manipur', 1, 3, 'A moderate earthquake in Manipur was felt in Dhaka and surrounding areas.', 'Dhaka felt tremors from a moderate earthquake in Manipur.', '2026-04-21 10:26:00', 'English', 8.80, 'Earthquake', 'https://example.com/images/manipur-quake-unb.jpg', 'https://unb.com.bd/category/Environment/dhaka-jolted-by-moderate-earthquake-in-manipur/184129'),
(3, 'WDB warns of possible early flood, advises immediate harvest in Sunamganj', 2, 1, 'Water Development Board warned of possible early flood and advised farmers in Sunamganj to harvest Boro paddy quickly.', 'Sunamganj farmers were warned about possible early flood risk.', '2026-04-21 21:03:00', 'English', 8.85, 'Flood Risk', 'https://example.com/images/sunamganj-flood.jpg', 'https://www.thedailystar.net/news/environment/climate-crisis/natural-disaster/news/wdb-warns-possible-early-flood-advises-immediate-harvest-sunamganj-4157136'),
(4, 'Fire at basement of Shishu Hospital under control', 3, 2, 'A fire broke out in the basement of Bangladesh Shishu Hospital and Institute in Dhaka and was brought under control.', 'Fire at Shishu Hospital basement was controlled by firefighters.', '2026-04-20 14:11:00', 'English', 8.90, 'Fire', 'https://example.com/images/shishu-fire.jpg', 'https://bdnews24.com/bangladesh/16bed9041922'),
(5, 'Fire breaks out at 11-storey building in Banani', 4, 2, 'A fire broke out on the 10th floor of an 11-storey building in Banani, and multiple firefighting units responded.', 'Fire reported at an 11-storey building in Banani.', '2026-04-15 19:29:00', 'English', 8.80, 'Fire', 'https://example.com/images/banani-fire.jpg', 'https://bdnews24.com/bangladesh/dbdc3f08d258'),
(6, '12 killed in lightning strikes in 7 districts', 5, 1, 'Twelve people died in lightning strikes in several Bangladesh districts during stormy weather.', 'Lightning strikes caused multiple deaths across Bangladesh.', '2026-04-26 21:10:00', 'English', 9.05, 'Natural Disaster', 'https://example.com/images/lightning.jpg', 'https://www.thedailystar.net/news/environment/climate-crisis/natural-disaster/news/12-killed-lightning-strikes-7-districts-4161251'),
(7, '30-minute hailstorm ravages boro fields in Netrokona', 6, 1, 'A hailstorm damaged boro crops in Netrokona and affected farmers.', 'Hailstorm caused agricultural losses in Netrokona.', '2026-04-10 02:31:00', 'English', 8.65, 'Agriculture Disaster', 'https://example.com/images/netrokona-hailstorm.jpg', 'https://www.thedailystar.net/news/environment/climate-crisis/natural-disaster'),
(8, 'Over 100 quakes in 4 months spark fears of major disaster', 7, 2, 'Experts warned that Bangladesh is vulnerable to earthquakes after many tremors were recorded in and around the country.', 'Experts called for stronger earthquake preparedness in Bangladesh.', '2026-04-24 18:46:00', 'English', 9.00, 'Disaster Preparedness', 'https://example.com/images/earthquake-risk.jpg', 'https://bdnews24.com/bangladesh/4263faecf6f0'),
(9, 'A fire at a gas lighter factory near Bangladesh capital kills people', 8, 8, 'A fire at a gas lighter factory near Dhaka caused deaths and required multiple firefighting units.', 'Factory fire near Dhaka caused casualties.', '2026-04-05 17:00:00', 'English', 9.10, 'Fire', 'https://example.com/images/factory-fire.jpg', 'https://apnews.com/article/6ca79f7ce291fc9399e86065c7d56c10'),
(10, 'Cooling Dhaka: strategies for climate resilience', 9, 5, 'Dhaka needs stronger urban biodiversity and climate resilience to reduce heat and flooding risk.', 'Dhaka faces rising heat, flood risk, and urban climate pressure.', '2026-04-19 09:30:00', 'English', 8.40, 'Climate Risk', 'https://example.com/images/cooling-dhaka.jpg', 'https://en.prothomalo.com/opinion/op-ed/8onn8zbc1t'),
(11, 'Cox\'s Bazar coastal risk monitoring update', 10, 6, 'Cox\'s Bazar is important for coastal disaster monitoring because of storms, settlements, and emergency response needs.', 'Cox\'s Bazar remains a key coastal risk region.', '2026-04-22 11:00:00', 'English', 8.20, 'Regional Monitoring', 'https://example.com/images/coxs-bazar.jpg', 'https://www.bssnews.net/'),
(12, 'Fire at multi-storey commercial building in Dhaka Mirpur', 11, 2, 'A fire broke out at a multi-storey commercial building in Dhaka\'s Mirpur.', 'Fire reported in a Mirpur commercial building.', '2026-03-09 14:58:00', 'English', 8.70, 'Fire', 'https://example.com/images/mirpur-fire.jpg', 'https://bdnews24.com/bangladesh/8d77a35c93b1'),
(13, 'Moderate earthquake shakes Bangladesh again', 12, 2, 'A moderate earthquake jolted Dhaka and several other parts of Bangladesh.', 'Bangladesh felt another moderate earthquake.', '2026-02-27 14:18:00', 'English', 8.85, 'Earthquake', 'https://example.com/images/moderate-quake.jpg', 'https://bdnews24.com/bangladesh/51be4d40ed39'),
(14, 'Bangladesh slum fire leaves thousands homeless', 4, 7, 'A major slum fire in Dhaka left thousands homeless and highlighted fire safety risks in dense settlements.', 'Dense urban settlements remain highly vulnerable to fire disasters.', '2025-11-26 10:00:00', 'English', 9.20, 'Fire', 'https://example.com/images/slum-fire.jpg', 'https://www.reuters.com/world/asia-pacific/bangladesh-slum-fire-leaves-thousands-homeless-2025-11-26/');

-- --------------------------------------------------------

--
-- Table structure for table `news_source`
--

CREATE TABLE `news_source` (
  `source_id` int(11) NOT NULL,
  `rss_url` varchar(255) DEFAULT NULL,
  `source_url` varchar(255) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `source_name` varchar(150) NOT NULL,
  `trust_weight` decimal(5,2) DEFAULT NULL,
  `credibility_log_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_source`
--

INSERT INTO `news_source` (`source_id`, `rss_url`, `source_url`, `country`, `language`, `source_name`, `trust_weight`, `credibility_log_id`) VALUES
(1, 'https://www.thedailystar.net/rss.xml', 'https://www.thedailystar.net', 'Bangladesh', 'English', 'The Daily Star', 9.20, NULL),
(2, 'https://bdnews24.com/rss', 'https://bdnews24.com', 'Bangladesh', 'English', 'bdnews24.com', 9.00, NULL),
(3, 'https://unb.com.bd/rss', 'https://unb.com.bd', 'Bangladesh', 'English', 'UNB News', 8.70, NULL),
(4, 'https://www.dhakatribune.com/rss', 'https://www.dhakatribune.com', 'Bangladesh', 'English', 'Dhaka Tribune', 8.80, NULL),
(5, 'https://en.prothomalo.com/feed', 'https://en.prothomalo.com', 'Bangladesh', 'English', 'Prothom Alo English', 9.10, NULL),
(6, 'https://www.bssnews.net/rss', 'https://www.bssnews.net', 'Bangladesh', 'English', 'Bangladesh Sangbad Sangstha', 8.60, NULL),
(7, 'https://www.reuters.com/world/asia-pacific/', 'https://www.reuters.com', 'International', 'English', 'Reuters', 9.50, NULL),
(8, 'https://apnews.com/hub/bangladesh', 'https://apnews.com', 'International', 'English', 'Associated Press', 9.30, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `normal_event`
--

CREATE TABLE `normal_event` (
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `normal_event`
--

INSERT INTO `normal_event` (`event_id`) VALUES
(9),
(10);

-- --------------------------------------------------------

--
-- Table structure for table `receives`
--

CREATE TABLE `receives` (
  `user_id` int(11) NOT NULL,
  `alert_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receives`
--

INSERT INTO `receives` (`user_id`, `alert_id`) VALUES
(1, 1),
(1, 7),
(2, 3),
(2, 5),
(3, 1),
(3, 10),
(4, 2),
(4, 6),
(5, 1),
(5, 10),
(6, 8),
(7, 4),
(8, 9),
(9, 2),
(10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `region_id` int(11) NOT NULL,
  `region_name` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `division_or_state` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`region_id`, `region_name`, `country`, `division_or_state`) VALUES
(1, 'Dhaka', 'Bangladesh', 'Dhaka Division'),
(2, 'Chattogram', 'Bangladesh', 'Chattogram Division'),
(3, 'Sylhet', 'Bangladesh', 'Sylhet Division'),
(4, 'Sunamganj', 'Bangladesh', 'Sylhet Division'),
(5, 'Narsingdi', 'Bangladesh', 'Dhaka Division'),
(6, 'Narayanganj', 'Bangladesh', 'Dhaka Division'),
(7, 'Banani', 'Bangladesh', 'Dhaka Division'),
(8, 'Mirpur', 'Bangladesh', 'Dhaka Division'),
(9, 'Cox\'s Bazar', 'Bangladesh', 'Chattogram Division'),
(10, 'Netrokona', 'Bangladesh', 'Mymensingh Division'),
(11, 'Gaibandha', 'Bangladesh', 'Rangpur Division'),
(12, 'Keraniganj', 'Bangladesh', 'Dhaka Division');

-- --------------------------------------------------------

--
-- Table structure for table `source_credibility_log`
--

CREATE TABLE `source_credibility_log` (
  `credibility_log_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `source_contribution_score` decimal(5,2) DEFAULT NULL,
  `recorded_at` datetime DEFAULT current_timestamp(),
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `source_credibility_log`
--

INSERT INTO `source_credibility_log` (`credibility_log_id`, `source_id`, `source_contribution_score`, `recorded_at`, `event_id`) VALUES
(1, 2, 8.90, '2026-04-21 18:00:00', 1),
(2, 3, 8.80, '2026-04-21 18:05:00', 1),
(3, 1, 8.85, '2026-04-21 22:00:00', 2),
(4, 2, 8.90, '2026-04-20 18:00:00', 3),
(5, 2, 8.80, '2026-04-15 20:00:00', 4),
(6, 7, 9.20, '2025-11-26 12:00:00', 4),
(7, 1, 9.05, '2026-04-27 08:00:00', 5),
(8, 1, 8.65, '2026-04-10 08:00:00', 6),
(9, 2, 9.00, '2026-04-24 20:00:00', 7),
(10, 8, 9.10, '2026-04-05 20:00:00', 8),
(11, 5, 8.40, '2026-04-19 12:00:00', 9),
(12, 6, 8.20, '2026-04-22 14:00:00', 10),
(13, 2, 8.70, '2026-03-09 16:00:00', 11),
(14, 2, 8.85, '2026-02-27 16:00:00', 12);

-- --------------------------------------------------------

--
-- Table structure for table `trending_record`
--

CREATE TABLE `trending_record` (
  `trending_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `time_window` varchar(50) DEFAULT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  `calculated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trending_record`
--

INSERT INTO `trending_record` (`trending_id`, `article_id`, `time_window`, `score`, `calculated_at`) VALUES
(1, 1, '24 hours', 91.50, '2026-04-21 18:00:00'),
(2, 2, '24 hours', 88.40, '2026-04-21 18:00:00'),
(3, 3, '24 hours', 84.60, '2026-04-22 10:00:00'),
(4, 4, '24 hours', 83.75, '2026-04-20 18:00:00'),
(5, 5, '7 days', 80.30, '2026-04-16 10:00:00'),
(6, 6, '24 hours', 96.20, '2026-04-27 08:00:00'),
(7, 7, '7 days', 82.70, '2026-04-12 10:00:00'),
(8, 8, '24 hours', 94.30, '2026-04-25 09:00:00'),
(9, 9, '7 days', 89.50, '2026-04-06 10:00:00'),
(10, 10, '7 days', 73.50, '2026-04-20 12:00:00'),
(11, 11, '7 days', 61.00, '2026-04-23 10:00:00'),
(12, 12, '30 days', 78.40, '2026-03-10 10:00:00'),
(13, 13, '30 days', 85.10, '2026-02-28 10:00:00'),
(14, 14, '30 days', 87.60, '2025-11-27 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_activity`
--

CREATE TABLE `user_activity` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `activity_type` varchar(50) DEFAULT NULL,
  `reading_time` int(11) DEFAULT NULL,
  `activity_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_activity`
--

INSERT INTO `user_activity` (`activity_id`, `user_id`, `article_id`, `activity_type`, `reading_time`, `activity_time`) VALUES
(1, 1, 1, 'read', 180, '2026-04-21 11:00:00'),
(2, 1, 8, 'share', 90, '2026-04-24 20:00:00'),
(3, 2, 4, 'read', 120, '2026-04-20 15:00:00'),
(4, 3, 2, 'read', 100, '2026-04-21 11:30:00'),
(5, 4, 3, 'read', 150, '2026-04-21 22:00:00'),
(6, 5, 13, 'read', 160, '2026-02-27 16:00:00'),
(7, 6, 9, 'read', 140, '2026-04-05 18:00:00'),
(8, 7, 5, 'share', 80, '2026-04-15 21:00:00'),
(9, 8, 12, 'read', 105, '2026-03-09 16:00:00'),
(10, 9, 11, 'read', 95, '2026-04-22 12:00:00'),
(11, 10, 7, 'bookmark', 85, '2026-04-10 09:00:00'),
(12, 2, 6, 'share', 70, '2026-04-27 09:00:00'),
(13, 3, 10, 'read', 115, '2026-04-19 13:00:00'),
(14, 4, 11, 'read', 60, '2026-04-22 13:00:00'),
(15, 5, 1, 'click', 50, '2026-04-21 12:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert_region`
--
ALTER TABLE `alert_region`
  ADD PRIMARY KEY (`alert_id`,`region_id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `article_region`
--
ALTER TABLE `article_region`
  ADD PRIMARY KEY (`region_id`,`article_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `article_translation`
--
ALTER TABLE `article_translation`
  ADD PRIMARY KEY (`article_id`,`language`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`user_id`,`article_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `crisis_alert`
--
ALTER TABLE `crisis_alert`
  ADD PRIMARY KEY (`alert_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `crisis_event`
--
ALTER TABLE `crisis_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`user_id`,`source_id`),
  ADD KEY `source_id` (`source_id`);

--
-- Indexes for table `news_article`
--
ALTER TABLE `news_article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `source_id` (`source_id`);

--
-- Indexes for table `news_source`
--
ALTER TABLE `news_source`
  ADD PRIMARY KEY (`source_id`);

--
-- Indexes for table `normal_event`
--
ALTER TABLE `normal_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `receives`
--
ALTER TABLE `receives`
  ADD PRIMARY KEY (`user_id`,`alert_id`),
  ADD KEY `alert_id` (`alert_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`region_id`);

--
-- Indexes for table `source_credibility_log`
--
ALTER TABLE `source_credibility_log`
  ADD PRIMARY KEY (`credibility_log_id`),
  ADD KEY `source_id` (`source_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `trending_record`
--
ALTER TABLE `trending_record`
  ADD PRIMARY KEY (`trending_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Indexes for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `article_id` (`article_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_user`
--
ALTER TABLE `app_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `crisis_alert`
--
ALTER TABLE `crisis_alert`
  MODIFY `alert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `news_article`
--
ALTER TABLE `news_article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `news_source`
--
ALTER TABLE `news_source`
  MODIFY `source_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `source_credibility_log`
--
ALTER TABLE `source_credibility_log`
  MODIFY `credibility_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `trending_record`
--
ALTER TABLE `trending_record`
  MODIFY `trending_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_activity`
--
ALTER TABLE `user_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alert_region`
--
ALTER TABLE `alert_region`
  ADD CONSTRAINT `alert_region_ibfk_1` FOREIGN KEY (`alert_id`) REFERENCES `crisis_alert` (`alert_id`),
  ADD CONSTRAINT `alert_region_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`);

--
-- Constraints for table `app_user`
--
ALTER TABLE `app_user`
  ADD CONSTRAINT `app_user_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`);

--
-- Constraints for table `article_region`
--
ALTER TABLE `article_region`
  ADD CONSTRAINT `article_region_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`),
  ADD CONSTRAINT `article_region_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `news_article` (`article_id`);

--
-- Constraints for table `article_translation`
--
ALTER TABLE `article_translation`
  ADD CONSTRAINT `article_translation_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `news_article` (`article_id`);

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`),
  ADD CONSTRAINT `bookmarks_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `news_article` (`article_id`);

--
-- Constraints for table `crisis_alert`
--
ALTER TABLE `crisis_alert`
  ADD CONSTRAINT `crisis_alert_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`);

--
-- Constraints for table `crisis_event`
--
ALTER TABLE `crisis_event`
  ADD CONSTRAINT `crisis_event_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`);

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`),
  ADD CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `news_source` (`source_id`);

--
-- Constraints for table `news_article`
--
ALTER TABLE `news_article`
  ADD CONSTRAINT `news_article_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  ADD CONSTRAINT `news_article_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `news_source` (`source_id`);

--
-- Constraints for table `normal_event`
--
ALTER TABLE `normal_event`
  ADD CONSTRAINT `normal_event_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`);

--
-- Constraints for table `receives`
--
ALTER TABLE `receives`
  ADD CONSTRAINT `receives_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`),
  ADD CONSTRAINT `receives_ibfk_2` FOREIGN KEY (`alert_id`) REFERENCES `crisis_alert` (`alert_id`);

--
-- Constraints for table `source_credibility_log`
--
ALTER TABLE `source_credibility_log`
  ADD CONSTRAINT `source_credibility_log_ibfk_1` FOREIGN KEY (`source_id`) REFERENCES `news_source` (`source_id`),
  ADD CONSTRAINT `source_credibility_log_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`);

--
-- Constraints for table `trending_record`
--
ALTER TABLE `trending_record`
  ADD CONSTRAINT `trending_record_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `news_article` (`article_id`);

--
-- Constraints for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD CONSTRAINT `user_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`),
  ADD CONSTRAINT `user_activity_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `news_article` (`article_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
