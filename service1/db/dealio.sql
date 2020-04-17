-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dealio
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_login` date DEFAULT NULL,
  `date_logout` date DEFAULT NULL,
  `time_login` time DEFAULT NULL,
  `time_logout` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'dyo','123','2020-04-08','2020-04-08','16:55:33','16:55:36'),(2,'ronald','123',NULL,NULL,NULL,NULL),(5,'james','123',NULL,'2020-04-08',NULL,'17:22:48');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_log`
--

DROP TABLE IF EXISTS `admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `admin_log_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_log`
--

LOCK TABLES `admin_log` WRITE;
/*!40000 ALTER TABLE `admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audience`
--

DROP TABLE IF EXISTS `audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age_start` int(11) NOT NULL,
  `age_end` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audience`
--

LOCK TABLES `audience` WRITE;
/*!40000 ALTER TABLE `audience` DISABLE KEYS */;
INSERT INTO `audience` VALUES (1,'Jakarta Male Audience','Jakarta Selatan','male',21,30,NULL,NULL),(3,'test audience','Jakarta','all',10,22,'2020-04-16','11:05:43'),(5,'Bekasi Female Audience','Bekasi','female',20,25,'2020-04-16','11:07:59');
/*!40000 ALTER TABLE `audience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_slot`
--

DROP TABLE IF EXISTS `campaign_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_slot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `source_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_slot`
--

LOCK TABLES `campaign_slot` WRITE;
/*!40000 ALTER TABLE `campaign_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'F&B'),(3,'Health & Beauty'),(4,'Supermarket'),(5,'Accessories, Jewelry and Watches'),(6,'Bag and Shoes'),(7,'Electronic and Gadget'),(8,'Departement Store'),(9,'Fashion and Sport Fashion'),(10,'Hobbies, Gift and Books'),(11,'Home and Furnishing'),(12,'Kids Fashion and Toys'),(13,'Optical Store'),(14,'Service and Travel');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deals`
--

DROP TABLE IF EXISTS `deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `audience_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_link` varchar(255) DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `hot_deals` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `audience_id` (`audience_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `deals_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`),
  CONSTRAINT `deals_ibfk_2` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`),
  CONSTRAINT `deals_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deals`
--

LOCK TABLES `deals` WRITE;
/*!40000 ALTER TABLE `deals` DISABLE KEYS */;
INSERT INTO `deals` VALUES (22,'test deals',1,'2020-04-13','2020-04-18','testung',NULL,'Install','test link',6,'2020-04-16','10:29:52',NULL,'offline',1,1),(23,'testing deal',1,'2020-04-09','2020-04-11','asdf',NULL,'Click through url','asdasdas',4,'2020-04-16','10:48:45',NULL,'online',1,0),(27,'test deals',1,'2020-04-09','2020-04-10','asdf',NULL,'Click through url','asdasdas',4,'2020-04-16','10:43:27',NULL,'online',1,0),(28,'test deals',1,'2020-04-09','2020-04-10','asdf',NULL,'Click through url','asdasdas',4,'2020-04-16','10:51:14',NULL,'online',1,0),(29,'merchant deal BKs',1,'2020-04-14','2020-04-17','test',NULL,'Install','test link',9,'2020-04-16','10:58:57',NULL,'online',1,1);
/*!40000 ALTER TABLE `deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `earn`
--

DROP TABLE IF EXISTS `earn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `earn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `audience_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_link` varchar(255) DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `best_activities` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `audience_id` (`audience_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `earn_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`),
  CONSTRAINT `earn_ibfk_2` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`),
  CONSTRAINT `earn_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earn`
--

LOCK TABLES `earn` WRITE;
/*!40000 ALTER TABLE `earn` DISABLE KEYS */;
INSERT INTO `earn` VALUES (19,'test deals',1,'2020-04-09','2020-04-10','asdf',NULL,'Click through url','asdasdas',4,'2020-04-15','19:19:31',NULL,'online',1,1);
/*!40000 ALTER TABLE `earn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `action_link` varchar(255) NOT NULL,
  `audience_id` int(11) NOT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audience_id` (`audience_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (3,'nama event','2020-04-06','2020-04-09',NULL,NULL,'2020-04-14','19:29:53','test','contoh koordinat','Click through url','link testing',1,50);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forget_phone_number`
--

DROP TABLE IF EXISTS `forget_phone_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forget_phone_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_manual_id` int(11) NOT NULL,
  `status_forget` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_manual_id` (`user_manual_id`),
  CONSTRAINT `forget_phone_number_ibfk_1` FOREIGN KEY (`user_manual_id`) REFERENCES `user_manual` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forget_phone_number`
--

LOCK TABLES `forget_phone_number` WRITE;
/*!40000 ALTER TABLE `forget_phone_number` DISABLE KEYS */;
INSERT INTO `forget_phone_number` VALUES (17,5,1,'2020-04-13','04:14:24');
/*!40000 ALTER TABLE `forget_phone_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horoscope`
--

DROP TABLE IF EXISTS `horoscope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horoscope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zodiac_sign` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `description` text DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horoscope`
--

LOCK TABLES `horoscope` WRITE;
/*!40000 ALTER TABLE `horoscope` DISABLE KEYS */;
INSERT INTO `horoscope` VALUES (4,'Gemini','title horoscope','2020-04-06','2020-04-09',NULL,NULL,'2020-04-14','20:08:22','testing',50);
/*!40000 ALTER TABLE `horoscope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_user`
--

DROP TABLE IF EXISTS `login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user`
--

LOCK TABLES `login_user` WRITE;
/*!40000 ALTER TABLE `login_user` DISABLE KEYS */;
INSERT INTO `login_user` VALUES (1,5,'2020-04-08','17:21:02'),(2,5,'2020-04-08','17:22:08'),(3,5,'2020-04-08','17:23:17'),(4,5,'2020-04-09','13:08:19'),(5,5,'2020-04-09','13:32:49'),(6,5,'2020-04-13','04:12:14'),(7,5,'2020-04-13','04:13:54'),(8,5,'2020-04-13','04:15:30'),(9,5,'2020-04-13','04:25:08'),(10,5,'2020-04-13','12:00:08'),(11,6,'2020-04-13','12:04:12'),(12,9,'2020-04-13','13:59:22'),(13,9,'2020-04-13','14:00:17'),(14,11,'2020-04-13','14:02:02');
/*!40000 ALTER TABLE `login_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lottery`
--

DROP TABLE IF EXISTS `lottery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lottery_code` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `lottery_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lottery`
--

LOCK TABLES `lottery` WRITE;
/*!40000 ALTER TABLE `lottery` DISABLE KEYS */;
/*!40000 ALTER TABLE `lottery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant`
--

LOCK TABLES `merchant` WRITE;
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
INSERT INTO `merchant` VALUES (3,'A & W',NULL),(4,'Ace Hardware',NULL),(5,'Alfamart',NULL),(6,'Alfamidi',NULL),(7,'Bakmi GM',NULL),(8,'Blibli',NULL),(9,'Burger King',NULL),(10,'CGV',NULL),(11,'Cinema XXI',NULL),(12,'Dunkin Donuts',NULL),(13,'Hypermart',NULL),(15,'Starbucks',NULL),(16,'Pizza Hut',NULL);
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_location`
--

DROP TABLE IF EXISTS `merchant_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `coordinate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `merchant_location_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_location`
--

LOCK TABLES `merchant_location` WRITE;
/*!40000 ALTER TABLE `merchant_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `source_link` varchar(255) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (13,'news title','2020-04-14','2020-04-18','contoh source','testing','2020-04-14','14:57:27',NULL,NULL,'contoh source link',50);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_forgot_password`
--

DROP TABLE IF EXISTS `otp_forgot_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otp_forgot_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_manual_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `otp_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_forgot_password`
--

LOCK TABLES `otp_forgot_password` WRITE;
/*!40000 ALTER TABLE `otp_forgot_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp_forgot_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_regis`
--

DROP TABLE IF EXISTS `otp_regis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otp_regis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regis_phone_number_id` int(11) NOT NULL,
  `otp_code` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `regis_phone_number_id` (`regis_phone_number_id`),
  CONSTRAINT `otp_regis_ibfk_1` FOREIGN KEY (`regis_phone_number_id`) REFERENCES `regis_phone_number` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_regis`
--

LOCK TABLES `otp_regis` WRITE;
/*!40000 ALTER TABLE `otp_regis` DISABLE KEYS */;
INSERT INTO `otp_regis` VALUES (12,14,'0319','2020-04-08','17:17:04'),(13,15,'0755','2020-04-13','12:03:21'),(14,16,'0319','2020-04-13','12:22:07'),(15,17,'0631','2020-04-13','13:55:45'),(16,18,'0770','2020-04-13','13:58:24'),(17,19,'8931','2020-04-13','13:58:36'),(18,20,'0965','2020-04-13','14:00:50'),(19,21,'0765','2020-04-13','14:01:57'),(20,22,'0621','2020-04-13','14:02:41'),(21,23,'8942','2020-04-13','14:02:57'),(22,24,'0764','2020-04-13','14:03:05'),(23,25,'8917','2020-04-13','14:03:42'),(24,26,'0345','2020-04-13','14:04:22');
/*!40000 ALTER TABLE `otp_regis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_number_list`
--

DROP TABLE IF EXISTS `phone_number_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_number_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_number_list`
--

LOCK TABLES `phone_number_list` WRITE;
/*!40000 ALTER TABLE `phone_number_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_number_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_deals`
--

DROP TABLE IF EXISTS `product_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `audience_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `hot_deals` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `audience_id` (`audience_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_deals_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`),
  CONSTRAINT `product_deals_ibfk_2` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`),
  CONSTRAINT `product_deals_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_deals`
--

LOCK TABLES `product_deals` WRITE;
/*!40000 ALTER TABLE `product_deals` DISABLE KEYS */;
INSERT INTO `product_deals` VALUES (4,'testings',1,'2020-04-06','2020-04-10','deskripsi','undefined',3,5,2,'2020-04-16','11:19:18','undefined','offline',1,1),(7,'product deal test',1,'2020-04-13','2020-04-17','testing deskripsi',NULL,7,50,10,'2020-04-16','11:20:16',NULL,'offline',1,1);
/*!40000 ALTER TABLE `product_deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refcode_input`
--

DROP TABLE IF EXISTS `refcode_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refcode_input` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refcode_list_id` int(11) NOT NULL,
  `phone_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refcode_list_id` (`refcode_list_id`),
  KEY `phone_id` (`phone_id`),
  CONSTRAINT `refcode_input_ibfk_1` FOREIGN KEY (`refcode_list_id`) REFERENCES `refcode_list` (`id`),
  CONSTRAINT `refcode_input_ibfk_2` FOREIGN KEY (`phone_id`) REFERENCES `regis_phone_number` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refcode_input`
--

LOCK TABLES `refcode_input` WRITE;
/*!40000 ALTER TABLE `refcode_input` DISABLE KEYS */;
/*!40000 ALTER TABLE `refcode_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refcode_list`
--

DROP TABLE IF EXISTS `refcode_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refcode_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_refcode` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `refcode_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refcode_list`
--

LOCK TABLES `refcode_list` WRITE;
/*!40000 ALTER TABLE `refcode_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `refcode_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regis_phone_number`
--

DROP TABLE IF EXISTS `regis_phone_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regis_phone_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status_regis` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regis_phone_number`
--

LOCK TABLES `regis_phone_number` WRITE;
/*!40000 ALTER TABLE `regis_phone_number` DISABLE KEYS */;
INSERT INTO `regis_phone_number` VALUES (14,'082299392596','2020-04-08','17:17:03',1),(15,'087771805500','2020-04-13','12:03:20',1),(16,'081381085380','2020-04-13','12:22:07',1),(17,'081806802482','2020-04-13','13:55:44',1),(18,'085323991877','2020-04-13','13:58:24',1),(19,'081283386332','2020-04-13','13:58:35',1),(20,'087878752519','2020-04-13','14:00:50',1),(21,'087889882977','2020-04-13','14:01:56',0),(22,'087889882977','2020-04-13','14:02:41',0),(23,'081398769737','2020-04-13','14:02:57',2),(24,'087889882977','2020-04-13','14:03:04',0),(25,'081398769737','2020-04-13','14:03:42',2),(26,'081398769737','2020-04-13','14:04:21',1);
/*!40000 ALTER TABLE `regis_phone_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stream`
--

DROP TABLE IF EXISTS `stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stream`
--

LOCK TABLES `stream` WRITE;
/*!40000 ALTER TABLE `stream` DISABLE KEYS */;
INSERT INTO `stream` VALUES (4,'nama stream','2020-04-06','2020-04-09','link video url',NULL,NULL,'2020-04-14','15:25:52',10),(6,'test stream','2020-04-14','2020-04-18','youtube.com',NULL,NULL,'2020-04-14','15:29:12',500);
/*!40000 ALTER TABLE `stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_detail`
--

DROP TABLE IF EXISTS `user_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_detail`
--

LOCK TABLES `user_detail` WRITE;
/*!40000 ALTER TABLE `user_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_facebook`
--

DROP TABLE IF EXISTS `user_facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_facebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_facebook`
--

LOCK TABLES `user_facebook` WRITE;
/*!40000 ALTER TABLE `user_facebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_facebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_google`
--

DROP TABLE IF EXISTS `user_google`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_google` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `google_id` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `given_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_google`
--

LOCK TABLES `user_google` WRITE;
/*!40000 ALTER TABLE `user_google` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_google` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_manual`
--

DROP TABLE IF EXISTS `user_manual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_manual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_manual`
--

LOCK TABLES `user_manual` WRITE;
/*!40000 ALTER TABLE `user_manual` DISABLE KEYS */;
INSERT INTO `user_manual` VALUES (5,'082299392596','123456','2020-04-08','17:17:25','hanindyo.herbowo@gmail.com'),(6,'087771805500','dainton1','2020-04-13','12:03:53','gilesttmt@gmail.com'),(7,'081381085380','dealio03','2020-04-13','12:23:14','@adeseptian7@gmail.com'),(8,'081806802482','dewantoro98','2020-04-13','13:56:22','gunawanbayu98@gmail.com'),(9,'081283386332','dealio','2020-04-13','13:59:05','bartonjakarta@gmail.com'),(10,'085323991877','kabur123','2020-04-13','13:59:13','iheh69@gmail.com'),(11,'087878752519','dazza1','2020-04-13','14:01:43','Darren@digitalvisionpublishing.com '),(12,'081398769737','KakekNenek!','2020-04-13','14:05:05','deswidia@gmail.com');
/*!40000 ALTER TABLE `user_manual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `login_method` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'Hanindyo Herbowo','hanindyo.herbowo@gmail.com','082299392596','2020-04-08','17:17:25','manual'),(6,'Giles Adam Taarland','gilesttmt@gmail.com','087771805500','2020-04-13','12:03:53','manual'),(7,'Septian Ade','@adeseptian7@gmail.com','081381085380','2020-04-13','12:23:14','manual'),(8,'Gunawan','gunawanbayu98@gmail.com','081806802482','2020-04-13','13:56:22','manual'),(9,'Philip Barton','bartonjakarta@gmail.com','081283386332','2020-04-13','13:59:05','manual'),(10,'Syifa Abdurrozak','iheh69@gmail.com','085323991877','2020-04-13','13:59:13','manual'),(11,'Darren ','Darren@digitalvisionpublishing.com ','087878752519','2020-04-13','14:01:43','manual'),(12,'Desi widiastuti','deswidia@gmail.com','081398769737','2020-04-13','14:05:05','manual');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `win`
--

DROP TABLE IF EXISTS `win`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `win` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `audience_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `point_redeem` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audience_id` (`audience_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `win_ibfk_1` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`),
  CONSTRAINT `win_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `win`
--

LOCK TABLES `win` WRITE;
/*!40000 ALTER TABLE `win` DISABLE KEYS */;
INSERT INTO `win` VALUES (7,'testWin',1,'2020-04-06','2020-04-09','test deskripsi','link_gambar',200,'2020-04-14','12:57:45','link_banner','offline',1);
/*!40000 ALTER TABLE `win` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-17 13:25:14
