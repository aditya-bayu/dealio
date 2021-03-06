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
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` VALUES (1,'Install'),(2,'Click through url'),(3,'Upload receipt'),(4,'Watch video'),(5,'Web view'),(6,'Survey'),(7,'Ref code'),(8,'Take photo'),(9,'Take video');
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
UNLOCK TABLES;

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
  `time_login` time DEFAULT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'dyo','123','2020-05-11','12:16:50',1),(2,'ronald','123','2020-05-11','12:13:24',1),(5,'james','123',NULL,NULL,1);
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
-- Table structure for table `banner_deals`
--

DROP TABLE IF EXISTS `banner_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `campaign_source` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_deals`
--

LOCK TABLES `banner_deals` WRITE;
/*!40000 ALTER TABLE `banner_deals` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner_deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_earn`
--

DROP TABLE IF EXISTS `banner_earn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_earn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `earn_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `earn_id` (`earn_id`),
  CONSTRAINT `banner_earn_ibfk_1` FOREIGN KEY (`earn_id`) REFERENCES `earn` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_earn`
--

LOCK TABLES `banner_earn` WRITE;
/*!40000 ALTER TABLE `banner_earn` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner_earn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_entertainment`
--

DROP TABLE IF EXISTS `banner_entertainment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_entertainment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entertainment_id` int(11) NOT NULL,
  `entertainment_source` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_entertainment`
--

LOCK TABLES `banner_entertainment` WRITE;
/*!40000 ALTER TABLE `banner_entertainment` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner_entertainment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_win`
--

DROP TABLE IF EXISTS `banner_win`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_win` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `win_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `win_id` (`win_id`),
  CONSTRAINT `banner_win_ibfk_1` FOREIGN KEY (`win_id`) REFERENCES `win` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_win`
--

LOCK TABLES `banner_win` WRITE;
/*!40000 ALTER TABLE `banner_win` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner_win` ENABLE KEYS */;
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
INSERT INTO `category` VALUES (1,'F&B'),(3,'Beauty and Personal Care'),(4,'Supermarkets, Minimarkets, Convenience Stores'),(5,'Departement Stores'),(6,'Electronics and Gadgets'),(7,'Accessories, Jewelry and Watches'),(8,'Fashion'),(9,'Sports Fashion and Equipments'),(10,'Home and Furnishings'),(11,'Bag and Shoes'),(12,'Travel and Accomodations');
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
  `action` int(11) DEFAULT NULL,
  `action_link` varchar(255) DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `hot_deals` int(11) NOT NULL,
  `best_deals` int(11) NOT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `audience_id` (`audience_id`),
  KEY `category_id` (`category_id`),
  KEY `action` (`action`),
  CONSTRAINT `deals_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`),
  CONSTRAINT `deals_ibfk_2` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`),
  CONSTRAINT `deals_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `deals_ibfk_4` FOREIGN KEY (`action`) REFERENCES `action` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deals`
--

LOCK TABLES `deals` WRITE;
/*!40000 ALTER TABLE `deals` DISABLE KEYS */;
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
  `action` int(11) DEFAULT NULL,
  `action_link` varchar(255) DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `best_activities` int(11) DEFAULT NULL,
  `hot_activities` int(11) NOT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `audience_id` (`audience_id`),
  KEY `category_id` (`category_id`),
  KEY `action` (`action`),
  CONSTRAINT `earn_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`),
  CONSTRAINT `earn_ibfk_2` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`),
  CONSTRAINT `earn_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `earn_ibfk_4` FOREIGN KEY (`action`) REFERENCES `action` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earn`
--

LOCK TABLES `earn` WRITE;
/*!40000 ALTER TABLE `earn` DISABLE KEYS */;
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
  `action` int(11) DEFAULT NULL,
  `action_link` varchar(255) DEFAULT NULL,
  `audience_id` int(11) NOT NULL,
  `point` int(11) DEFAULT NULL,
  `hot_entertainment` int(11) NOT NULL,
  `hot_event` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `audience_id` (`audience_id`),
  KEY `action` (`action`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`),
  CONSTRAINT `event_ibfk_2` FOREIGN KEY (`action`) REFERENCES `action` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `forget_phone_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_lottery`
--

DROP TABLE IF EXISTS `group_lottery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lottery_code` varchar(255) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `win_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_group_id` (`user_group_id`),
  KEY `win_id` (`win_id`),
  CONSTRAINT `group_lottery_ibfk_1` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`),
  CONSTRAINT `group_lottery_ibfk_2` FOREIGN KEY (`win_id`) REFERENCES `win` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_lottery`
--

LOCK TABLES `group_lottery` WRITE;
/*!40000 ALTER TABLE `group_lottery` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_lottery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_member`
--

DROP TABLE IF EXISTS `group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `group_member_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group_member` (`id`),
  CONSTRAINT `group_member_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_member`
--

LOCK TABLES `group_member` WRITE;
/*!40000 ALTER TABLE `group_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_member` ENABLE KEYS */;
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
  `hot_entertainment` int(11) NOT NULL,
  `hot_horoscope` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horoscope`
--

LOCK TABLES `horoscope` WRITE;
/*!40000 ALTER TABLE `horoscope` DISABLE KEYS */;
INSERT INTO `horoscope` VALUES (4,'Gemini','title horoscope','2020-04-06','2020-04-09',NULL,NULL,'2020-04-14','20:08:22','testing',50,0,0);
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
  CONSTRAINT `login_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user`
--

LOCK TABLES `login_user` WRITE;
/*!40000 ALTER TABLE `login_user` DISABLE KEYS */;
INSERT INTO `login_user` VALUES (11,6,'2020-04-13','12:04:12'),(12,9,'2020-04-13','13:59:22'),(13,9,'2020-04-13','14:00:17'),(14,11,'2020-04-13','14:02:02');
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
  `win_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `win_id` (`win_id`),
  CONSTRAINT `lottery_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `lottery_ibfk_2` FOREIGN KEY (`win_id`) REFERENCES `win` (`id`)
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
-- Table structure for table `lovelist`
--

DROP TABLE IF EXISTS `lovelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lovelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `campaign_source` varchar(255) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `lovelist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lovelist`
--

LOCK TABLES `lovelist` WRITE;
/*!40000 ALTER TABLE `lovelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `lovelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `tier` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
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
  `hot_entertainment` int(11) NOT NULL,
  `hot_news` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (13,'news title','2020-04-14','2020-04-18','contoh source','testing','2020-04-14','14:57:27',NULL,NULL,'contoh source link',50,0,0);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocr_ktp_temp`
--

DROP TABLE IF EXISTS `ocr_ktp_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ocr_ktp_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ocr_ktp_temp_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocr_ktp_temp`
--

LOCK TABLES `ocr_ktp_temp` WRITE;
/*!40000 ALTER TABLE `ocr_ktp_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocr_ktp_temp` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_regis`
--

LOCK TABLES `otp_regis` WRITE;
/*!40000 ALTER TABLE `otp_regis` DISABLE KEYS */;
INSERT INTO `otp_regis` VALUES (13,15,'0755','2020-04-13','12:03:21'),(14,16,'0319','2020-04-13','12:22:07'),(15,17,'0631','2020-04-13','13:55:45'),(16,18,'0770','2020-04-13','13:58:24'),(17,19,'8931','2020-04-13','13:58:36'),(18,20,'0965','2020-04-13','14:00:50'),(19,21,'0765','2020-04-13','14:01:57'),(20,22,'0621','2020-04-13','14:02:41'),(21,23,'8942','2020-04-13','14:02:57'),(22,24,'0764','2020-04-13','14:03:05'),(23,25,'8917','2020-04-13','14:03:42'),(24,26,'0345','2020-04-13','14:04:22'),(27,30,'0319','2020-04-27','14:55:48'),(29,32,'0753','2020-05-11','13:48:04');
/*!40000 ALTER TABLE `otp_regis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_redeem_history`
--

DROP TABLE IF EXISTS `point_redeem_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point_redeem_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `reward_source` varchar(255) NOT NULL,
  `reward_id` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `point_redeem_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_redeem_history`
--

LOCK TABLES `point_redeem_history` WRITE;
/*!40000 ALTER TABLE `point_redeem_history` DISABLE KEYS */;
INSERT INTO `point_redeem_history` VALUES (1,18,'deals',1,100000,'0000-00-00','15:26:12');
/*!40000 ALTER TABLE `point_redeem_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_source`
--

DROP TABLE IF EXISTS `point_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `campaign_source` varchar(255) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `point_source_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_source`
--

LOCK TABLES `point_source` WRITE;
/*!40000 ALTER TABLE `point_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postpaid`
--

DROP TABLE IF EXISTS `postpaid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postpaid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  `merchant` varchar(255) DEFAULT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `product_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postpaid`
--

LOCK TABLES `postpaid` WRITE;
/*!40000 ALTER TABLE `postpaid` DISABLE KEYS */;
INSERT INTO `postpaid` VALUES (3,'Electricity PostPaid','MobilePulsa','PLN','PLNPOSTPAID',NULL,'PLN POSTPAID'),(4,'Electricity PostPaid','MobilePulsa','PLN','PLNPOSTPAIDB',NULL,'PLN POSTPAID'),(5,'Electricity PostPaid','MobilePulsa','GAS','PGAS',NULL,'PGN'),(6,'Phone PostPaid','MobilePulsa','Indosat','HPMTRIX',NULL,'MATRIX'),(7,'Phone PostPaid','MobilePulsa','Indosat','HPMTRIXB',NULL,'MATRIX B'),(8,'Phone PostPaid','MobilePulsa','SmartFren','HPSMART',NULL,'SMARTFREN POSTPAID'),(9,'Phone PostPaid','MobilePulsa','Three','HPTHREE',NULL,'THREE POSTPAID'),(10,'Phone PostPaid','MobilePulsa','Three','HPTHREEB',NULL,'THREE POSTPAID'),(11,'Phone PostPaid','MobilePulsa','Telkomsel Halo','HPTSEL',NULL,'HALO POSTPAID -2'),(12,'Phone PostPaid','MobilePulsa','Telkomsel Halo','HPTSELB',NULL,'HALO POSTPAID'),(13,'Phone PostPaid','MobilePulsa','Telkomsel Halo','HPTSELD',NULL,'HALO POSTPAID'),(14,'Phone PostPaid','MobilePulsa','XL','HPXL',NULL,'XL POSTPAID'),(15,'TV Cable Post Paid','MobilePulsa','Big TV','TVBIG',NULL,'BIG TV'),(16,'TV Cable Post Paid','MobilePulsa','FirstMedia','TVFIRST',NULL,'FIRSTMEDIA'),(17,'TV Cable Post Paid','MobilePulsa','Indovision','TVINDVS',NULL,'INDOVISION'),(18,'TV Cable Post Paid','MobilePulsa','Nex Media','TVNEX',NULL,'NEX MEDIA'),(19,'TV Cable Post Paid','MobilePulsa','Telkomvision','TVTLKMV',NULL,'TELKOMVISION'),(20,'Internet Cable Post Paid','MobilePulsa','My Republic','MYREPUBLIC',NULL,'MYREPRETAIL'),(21,'Internet Cable Post Paid','MobilePulsa','Indihome Speedy','SPEEDY',NULL,'INDIHOME (SPEEDY)'),(22,'BPJS Post Paid','MobilePulsa','BPJS Kesehatan','BPJS',NULL,'BPJS KESEHATAN'),(23,'BPJS Post Paid','MobilePulsa','BPJS Ketenagakerjaan','BPJSTK',NULL,'BPJS KETENAGAKERJAAN'),(24,'PDAM','MobilePulsa','undefined','AETRA',NULL,'AETRA'),(25,'PDAM','MobilePulsa','undefined','PALYJA',NULL,'PALYJA JAKARTA'),(26,'PDAM','MobilePulsa','undefined','PAM.ATBBATAM',NULL,'PAM ATB BATAM'),(27,'PDAM','MobilePulsa','undefined','PDAM.ATSPALEMBANG',NULL,'PDAM ATS PALEMBANG'),(28,'PDAM','MobilePulsa','undefined','PDAM.BATANG',NULL,'PDAM KABUPATEN BATANG'),(29,'PDAM','MobilePulsa','undefined','PDAM.INTANBANJAR',NULL,'PDAM INTAN BANJAR'),(30,'PDAM','MobilePulsa','undefined','PDAM.KERINCI',NULL,'PDAM TIRTA KHAYANGAN (KOTA SUNGAI PENUH)'),(31,'PDAM','MobilePulsa','undefined','PDAM.LAMPUNG',NULL,'PDAM LAMPUNG'),(32,'PDAM','MobilePulsa','undefined','PDAM.MATARAM',NULL,'PDAM GIRI MENANG MATARAM'),(33,'PDAM','MobilePulsa','undefined','PDAM.PANGKALANBUN',NULL,'PDAM PANGKALAN BUN(KOTAWARINGIN BARAT)'),(34,'PDAM','MobilePulsa','undefined','PDAM.TIRTANADIMEDAN',NULL,'PDAM TIRTANADI MEDAN'),(35,'PDAM','MobilePulsa','undefined','PDAMKAB.BADUNG',NULL,'PDAM KABUPATEN BADUNG'),(36,'PDAM','MobilePulsa','undefined','PDAMKAB.BALANGAN',NULL,'PDAM KABUPATEN BALANGAN (KALSEL)'),(37,'PDAM','MobilePulsa','undefined','PDAMKAB.BANDUNG',NULL,'PDAM KABUPATEN BANDUNG B'),(38,'PDAM','MobilePulsa','undefined','PDAMKAB.BANDUNGBARAT',NULL,'PDAM KABUPATEN BANDUNG BARAT'),(39,'PDAM','MobilePulsa','undefined','PDAMKAB.BANGKALAN',NULL,'PDAM KABUPATEN BANGKALAN (JATIM)'),(40,'PDAM','MobilePulsa','undefined','PDAMKAB.BANYUMAS',NULL,'PDAM KABUPATEN BANYUMAS'),(41,'PDAM','MobilePulsa','undefined','PDAMKAB.BANYUWANGI',NULL,'PDAM KABUPATEN BANYUWANGI'),(42,'PDAM','MobilePulsa','undefined','PDAMKAB.BARABAI',NULL,'PDAM KABUPATEN BARABAI'),(43,'PDAM','MobilePulsa','undefined','PDAMKAB.BATANG',NULL,'PDAM KABUPATEN BATANG'),(44,'PDAM','MobilePulsa','undefined','PDAMKAB.BERAU',NULL,'PDAM KABUPATEN BERAU'),(45,'PDAM','MobilePulsa','undefined','PDAMKAB.BLORA',NULL,'PDAM KABUPATEN BLORA'),(46,'PDAM','MobilePulsa','undefined','PDAMKAB.BOGOR',NULL,'PDAM KABUPATEN BOGOR (JABAR)'),(47,'PDAM','MobilePulsa','undefined','PDAMKAB.BOJONEGORO',NULL,'PDAM KABUPATEN BOJONEGORO (JATIM)'),(48,'PDAM','MobilePulsa','undefined','PDAMKAB.BONDOWOSO',NULL,'PDAM KABUPATEN BONDOWOSO (JATIM)'),(49,'PDAM','MobilePulsa','undefined','PDAMKAB.BOYOLALI',NULL,'PDAM KABUPATEN BOYOLALI'),(50,'PDAM','MobilePulsa','undefined','PDAMKAB.BREBES',NULL,'PDAM KABUPATEN BREBES'),(51,'PDAM','MobilePulsa','undefined','PDAMKAB.BULELENG',NULL,'PDAM KABUPATEN BULELENG (BALI)'),(52,'PDAM','MobilePulsa','undefined','PDAMKAB.CIAMIS',NULL,'PDAM KABUPATEN CIAMIS'),(53,'PDAM','MobilePulsa','undefined','PDAMKAB.CIANJUR',NULL,'PDAM KABUPATEN CIANJUR'),(54,'PDAM','MobilePulsa','undefined','PDAMKAB.CILACAP',NULL,'PDAM KABUPATEN CILACAP'),(55,'PDAM','MobilePulsa','undefined','PDAMKAB.CIREBON',NULL,'PDAM KABUPATEN CIREBON'),(56,'PDAM','MobilePulsa','undefined','PDAMKAB.DEMAK',NULL,'PDAM KABUPATEN DEMAK'),(57,'PDAM','MobilePulsa','undefined','PDAMKAB.GARUT',NULL,'PDAM TIRTA INTAN KABUPATEN GARUT'),(58,'PDAM','MobilePulsa','undefined','PDAMKAB.GRESIK',NULL,'PDAM KABUPATEN GRESIK'),(59,'PDAM','MobilePulsa','undefined','PDAMKAB.GROBOGAN',NULL,'PDAM KABUPATEN GROBOGAN'),(60,'PDAM','MobilePulsa','undefined','PDAMKAB.INDRAMAYU',NULL,'PDAM KABUPATEN INDRAMAYU'),(61,'PDAM','MobilePulsa','undefined','PDAMKAB.JEMBER',NULL,'PDAM KABUPATEN JEMBER (JATIM)'),(62,'PDAM','MobilePulsa','undefined','PDAMKAB.JEPARA',NULL,'PDAM KABUPATEN JEPARA'),(63,'PDAM','MobilePulsa','undefined','PDAMKAB.JOMBANG',NULL,'PDAM KABUPATEN JOMBANG'),(64,'PDAM','MobilePulsa','undefined','PDAMKAB.KARANGANYAR',NULL,'PDAM KABUPATEN KARANGANYAR'),(65,'PDAM','MobilePulsa','undefined','PDAMKAB.KARAWANG',NULL,'PDAM KABUPATEN KARAWANG'),(66,'PDAM','MobilePulsa','undefined','PDAMKAB.KEBUMEN',NULL,'PDAM KABUPATEN KEBUMEN'),(67,'PDAM','MobilePulsa','undefined','PDAMKAB.KENDAL',NULL,'PDAM KABUPATEN KENDAL'),(68,'PDAM','MobilePulsa','undefined','PDAMKAB.KISARAN',NULL,'PDAM KABUPATEN KISARAN'),(69,'PDAM','MobilePulsa','undefined','PDAMKAB.KLATEN',NULL,'PDAM KABUPATEN KLATEN'),(70,'PDAM','MobilePulsa','undefined','PDAMKAB.KLUNGKUNG',NULL,'PDAM KABUPATEN KLUNGKUNG'),(71,'PDAM','MobilePulsa','undefined','PDAMKAB.KUBURAYA',NULL,'PDAM KABUPATEN KUBU RAYA'),(72,'PDAM','MobilePulsa','undefined','PDAMKAB.KULONPROGO',NULL,'PDAM KABUPATEN KULONPROGO'),(73,'PDAM','MobilePulsa','undefined','PDAMKAB.KUNINGAN',NULL,'PDAM KABUPATEN KUNINGAN'),(74,'PDAM','MobilePulsa','undefined','PDAMKAB.LOMBOKTENGAH',NULL,'PDAM KABUPATEN LOMBOK TENGAH'),(75,'PDAM','MobilePulsa','undefined','PDAMKAB.LUMAJANG',NULL,'PDAM KABUPATEN LUMAJANG'),(76,'PDAM','MobilePulsa','undefined','PDAMKAB.MALANG',NULL,'PDAM KABUPATEN MALANG'),(77,'PDAM','MobilePulsa','undefined','PDAMKAB.MAMUJU',NULL,'PDAM KABUPATEN MAMUJU'),(78,'PDAM','MobilePulsa','undefined','PDAMKAB.MOJOKERTO',NULL,'PDAM KABUPATEN MOJOKERTO (JATIM)'),(79,'PDAM','MobilePulsa','undefined','PDAMKAB.NIAS',NULL,'PDAM KABUPATEN NIAS'),(80,'PDAM','MobilePulsa','undefined','PDAMKAB.PASAMAN',NULL,'PDAM KABUPATEN PASAMAN'),(81,'PDAM','MobilePulsa','undefined','PDAMKAB.PASER',NULL,'PDAM KABUPATEN PASER'),(82,'PDAM','MobilePulsa','undefined','PDAMKAB.PATI',NULL,'PDAM KABUPATEN PATI'),(83,'PDAM','MobilePulsa','undefined','PDAMKAB.PEKALONGAN',NULL,'PDAM KABUPATEN PEKALONGAN'),(84,'PDAM','MobilePulsa','undefined','PDAMKAB.POLEWALIMANDAR',NULL,'PDAM KABUPATEN POLEWALI MANDAR'),(85,'PDAM','MobilePulsa','undefined','PDAMKAB.PONOROGO',NULL,'PDAM KABUPATEN PONOROGO'),(86,'PDAM','MobilePulsa','undefined','PDAMKAB.PROBOLINGGO',NULL,'PDAM KABUPATEN PROBOLINGGO'),(87,'PDAM','MobilePulsa','undefined','PDAMKAB.PURBALINGGAB',NULL,'PDAM KABUPATEN PURBALINGGA'),(88,'PDAM','MobilePulsa','undefined','PDAMKAB.PURWOREJO',NULL,'PDAM KABUPATEN PURWOREJO'),(89,'PDAM','MobilePulsa','undefined','PDAMKAB.REMBANG',NULL,'PDAM KABUPATEN REMBANG'),(90,'PDAM','MobilePulsa','undefined','PDAMKAB.SAMPANG',NULL,'PDAM KABUPATEN SAMPANG'),(91,'PDAM','MobilePulsa','undefined','PDAMKAB.SEMARANG',NULL,'PDAM KABUPATEN SEMARANG'),(92,'PDAM','MobilePulsa','undefined','PDAMKAB.SIDOARJO',NULL,'PDAM KABUPATEN SIDOARJO (JATIM)'),(93,'PDAM','MobilePulsa','undefined','PDAMKAB.SITUBONDO',NULL,'PDAM KABUPATEN SITUBONDO (JATIM)'),(94,'PDAM','MobilePulsa','undefined','PDAMKAB.SLEMAN',NULL,'PDAM KABUPATEN SLEMAN'),(95,'PDAM','MobilePulsa','undefined','PDAMKAB.SUBANG',NULL,'PDAM KABUPATEN SUBANG'),(96,'PDAM','MobilePulsa','undefined','PDAMKAB.SUKABUMI',NULL,'PDAM KABUPATEN SUKABUMI'),(97,'PDAM','MobilePulsa','undefined','PDAMKAB.SUKOHARJO',NULL,'PDAM KABUPATEN SUKOHARJO'),(98,'PDAM','MobilePulsa','undefined','PDAMKAB.SUMEDANG',NULL,'PDAM KABUPATEN SUMEDANG'),(99,'PDAM','MobilePulsa','undefined','PDAMKAB.TAKALAR',NULL,'PDAM KABUPATEN TAKALAR'),(100,'PDAM','MobilePulsa','undefined','PDAMKAB.TAPIN',NULL,'PDAM KABUPATEN TAPIN (KALSEL)'),(101,'PDAM','MobilePulsa','undefined','PDAMKAB.TASIKMALAYA',NULL,'PDAM KABUPATEN TASIKMALAYA'),(102,'PDAM','MobilePulsa','undefined','PDAMKAB.TEGAL',NULL,'PDAM KABUPATEN TEGAL'),(103,'PDAM','MobilePulsa','undefined','PDAMKAB.TEMANGGUNG',NULL,'PDAM KABUPATEN TEMANGGUNG'),(104,'PDAM','MobilePulsa','undefined','PDAMKAB.WONOGIRI',NULL,'PDAM KABUPATEN WONOGIRI'),(105,'PDAM','MobilePulsa','undefined','PDAMKAB.WONOSOBO',NULL,'PDAM KABUPATEN WONOSOBO'),(106,'PDAM','MobilePulsa','undefined','PDAMKOTA.BALIKPAPAN',NULL,'PDAM KOTA BALIKPAPAN'),(107,'PDAM','MobilePulsa','undefined','PDAMKOTA.BANDARLAMPUNG',NULL,'PDAM KOTA BANDAR LAMPUNG'),(108,'PDAM','MobilePulsa','undefined','PDAMKOTA.BANDUNG',NULL,'PDAM KOTA BANDUNG'),(109,'PDAM','MobilePulsa','undefined','PDAMKOTA.BANDUNGB',NULL,'PDAM KOTA BANDUNG'),(110,'PDAM','MobilePulsa','undefined','PDAMKOTA.BANJAR',NULL,'PDAM KOTA BANJAR'),(111,'PDAM','MobilePulsa','undefined','PDAMKOTA.BANJARMASIN',NULL,'PDAM KOTA BANJARMASIN'),(112,'PDAM','MobilePulsa','undefined','PDAMKOTA.BEKASI',NULL,'PDAM KOTA BEKASI'),(113,'PDAM','MobilePulsa','undefined','PDAMKOTA.BOGOR',NULL,'PDAM KOTA BOGOR'),(114,'PDAM','MobilePulsa','undefined','PDAMKOTA.CIREBON',NULL,'PDAM KOTA CIREBON'),(115,'PDAM','MobilePulsa','undefined','PDAMKOTA.DENPASAR',NULL,'PDAM KOTA DENPASAR'),(116,'PDAM','MobilePulsa','undefined','PDAMKOTA.DEPOK',NULL,'PDAM KOTA DEPOK'),(117,'PDAM','MobilePulsa','undefined','PDAMKOTA.JAYAPURA',NULL,'PDAM KOTA JAYAPURA'),(118,'PDAM','MobilePulsa','undefined','PDAMKOTA.KEDIRI',NULL,'PDAM KOTA KEDIRI'),(119,'PDAM','MobilePulsa','undefined','PDAMKOTA.MADIUN',NULL,'PDAM KOTA MADIUN'),(120,'PDAM','MobilePulsa','undefined','PDAMKOTA.MAKASSAR',NULL,'PDAM KOTA MAKASSAR'),(121,'PDAM','MobilePulsa','undefined','PDAMKOTA.MALANG',NULL,'PDAM KOTA MALANG'),(122,'PDAM','MobilePulsa','undefined','PDAMKOTA.MALANGB',NULL,'PDAM KOTA MALANG'),(123,'PDAM','MobilePulsa','undefined','PDAMKOTA.MANADO',NULL,'PDAM KOTA MANADO (SULUT)'),(124,'PDAM','MobilePulsa','undefined','PDAMKOTA.MATARAM',NULL,'PDAM KOTA MATARAM (NTB)'),(125,'PDAM','MobilePulsa','undefined','PDAMKOTA.MEDAN',NULL,'PDAM KOTA MEDAN (SUMUT)'),(126,'PDAM','MobilePulsa','undefined','PDAMKOTA.PALEMBANG',NULL,'PDAM KOTA PALEMBANG'),(127,'PDAM','MobilePulsa','undefined','PDAMKOTA.PASURUAN',NULL,'PDAM KOTA PASURUAN (JATIM)'),(128,'PDAM','MobilePulsa','undefined','PDAMKOTA.PONTIANAK',NULL,'PDAM KOTA PONTIANAK'),(129,'PDAM','MobilePulsa','undefined','PDAMKOTA.PROBOLINGGO',NULL,'PDAM KOTA PROBOLINGGO'),(130,'PDAM','MobilePulsa','undefined','PDAMKOTA.SALATIGA',NULL,'PDAM KOTA SALATIGA'),(131,'PDAM','MobilePulsa','undefined','PDAMKOTA.SAMARINDA',NULL,'PDAM KOTA SAMARINDA'),(132,'PDAM','MobilePulsa','undefined','PDAMKOTA.SEMARANG',NULL,'PDAM KOTA SEMARANG (JATENG)'),(133,'PDAM','MobilePulsa','undefined','PDAMKOTA.SUKABUMI',NULL,'PDAM KOTA SUKABUMI'),(134,'PDAM','MobilePulsa','undefined','PDAMKOTA.SURABAYA',NULL,'PDAM KOTA SURABAYA'),(135,'PDAM','MobilePulsa','undefined','PDAMKOTA.SURAKARTA',NULL,'PDAM KOTA SURAKARTA'),(136,'PDAM','MobilePulsa','undefined','PDAMKOTA.TANGERANG',NULL,'PDAM TB KOTA TANGERANG'),(137,'PDAM','MobilePulsa','undefined','PDAMKOTA.TEGAL',NULL,'PDAM KOTA TEGAL'),(138,'PDAM','MobilePulsa','undefined','WABANJAR',NULL,'PDAM KOTA BANJAR'),(139,'PDAM','MobilePulsa','undefined','WABDG',NULL,'PDAM KABUPATEN BANDUNG'),(140,'PDAM','MobilePulsa','undefined','WABEKASI',NULL,'PDAM KOTA BEKASI'),(141,'PDAM','MobilePulsa','undefined','WACLCP',NULL,'PDAM KABUPATEN CILACAP'),(142,'PDAM','MobilePulsa','undefined','WAJPR',NULL,'PDAM KABUPATEN JEPARA');
/*!40000 ALTER TABLE `postpaid` ENABLE KEYS */;
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
  `best_deals` int(11) NOT NULL,
  `point` int(11) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `action_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `audience_id` (`audience_id`),
  KEY `category_id` (`category_id`),
  KEY `action` (`action`),
  CONSTRAINT `product_deals_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`),
  CONSTRAINT `product_deals_ibfk_2` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`),
  CONSTRAINT `product_deals_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `product_deals_ibfk_4` FOREIGN KEY (`action`) REFERENCES `action` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_deals`
--

LOCK TABLES `product_deals` WRITE;
/*!40000 ALTER TABLE `product_deals` DISABLE KEYS */;
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
  `user_id` int(11) NOT NULL,
  `regis_phone_number_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refcode_list_id` (`user_id`),
  KEY `phone_id` (`regis_phone_number_id`),
  CONSTRAINT `refcode_input_ibfk_2` FOREIGN KEY (`regis_phone_number_id`) REFERENCES `regis_phone_number` (`id`),
  CONSTRAINT `refcode_input_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regis_phone_number`
--

LOCK TABLES `regis_phone_number` WRITE;
/*!40000 ALTER TABLE `regis_phone_number` DISABLE KEYS */;
INSERT INTO `regis_phone_number` VALUES (15,'087771805500','2020-04-13','12:03:20',1),(16,'081381085380','2020-04-13','12:22:07',1),(17,'081806802482','2020-04-13','13:55:44',1),(18,'085323991877','2020-04-13','13:58:24',1),(19,'081283386332','2020-04-13','13:58:35',1),(20,'087878752519','2020-04-13','14:00:50',1),(21,'087889882977','2020-04-13','14:01:56',0),(22,'087889882977','2020-04-13','14:02:41',0),(23,'081398769737','2020-04-13','14:02:57',2),(24,'087889882977','2020-04-13','14:03:04',0),(25,'081398769737','2020-04-13','14:03:42',2),(26,'081398769737','2020-04-13','14:04:21',1),(30,'082299392596','2020-04-27','14:55:47',1),(32,'085782241627','2020-05-11','13:48:03',1);
/*!40000 ALTER TABLE `regis_phone_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_membership`
--

DROP TABLE IF EXISTS `status_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `changes` varchar(255) DEFAULT NULL,
  `tier_from` varchar(255) DEFAULT NULL,
  `tier_to` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `status_membership_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_membership`
--

LOCK TABLES `status_membership` WRITE;
/*!40000 ALTER TABLE `status_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `audience_id` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `prods` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `audience_id` (`audience_id`),
  CONSTRAINT `survey_ibfk_1` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (1,'Test Survey',NULL,NULL,0,'2020-05-03','14:44:12');
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_participant`
--

DROP TABLE IF EXISTS `survey_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_participant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(255) NOT NULL,
  `checkpoint` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_id` (`survey_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `survey_participant_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`),
  CONSTRAINT `survey_participant_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_participant`
--

LOCK TABLES `survey_participant` WRITE;
/*!40000 ALTER TABLE `survey_participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_question`
--

DROP TABLE IF EXISTS `survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `image_link` varchar(255) DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `important` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `survey_question_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_question`
--

LOCK TABLES `survey_question` WRITE;
/*!40000 ALTER TABLE `survey_question` DISABLE KEYS */;
INSERT INTO `survey_question` VALUES (1,1,'Seberapa tertarik anda dengan aplikasi Dealio?',NULL,NULL,'multiple',NULL,0),(2,1,'Apakah hobby anda?',NULL,NULL,'fill',NULL,0);
/*!40000 ALTER TABLE `survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_question_choice`
--

DROP TABLE IF EXISTS `survey_question_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_question_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_question_id` int(11) NOT NULL,
  `choice` varchar(255) NOT NULL,
  `image_link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_question_id` (`survey_question_id`),
  CONSTRAINT `survey_question_choice_ibfk_1` FOREIGN KEY (`survey_question_id`) REFERENCES `survey_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_question_choice`
--

LOCK TABLES `survey_question_choice` WRITE;
/*!40000 ALTER TABLE `survey_question_choice` DISABLE KEYS */;
INSERT INTO `survey_question_choice` VALUES (1,1,'Sangat Tertarik',NULL),(2,1,'Tertarik',NULL),(3,1,'Tidak Tertarik',NULL),(4,1,'Sangat Tidak Tertarik',NULL);
/*!40000 ALTER TABLE `survey_question_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_response`
--

DROP TABLE IF EXISTS `survey_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `response` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_question_id` (`survey_question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `survey_response_ibfk_1` FOREIGN KEY (`survey_question_id`) REFERENCES `survey_question` (`id`),
  CONSTRAINT `survey_response_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_response`
--

LOCK TABLES `survey_response` WRITE;
/*!40000 ALTER TABLE `survey_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topup_history`
--

DROP TABLE IF EXISTS `topup_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topup_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `topup_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topup_history`
--

LOCK TABLES `topup_history` WRITE;
/*!40000 ALTER TABLE `topup_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `topup_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `login_method` varchar(255) NOT NULL,
  `email_verified` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `ktp_url` varchar(255) DEFAULT NULL,
  `refcode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'Giles Adam Taarland','gilesttmt@gmail.com','087771805500','2020-04-13','12:03:53','manual',0,1,NULL,''),(7,'Septian Ade','@adeseptian7@gmail.com','081381085380','2020-04-13','12:23:14','manual',0,1,NULL,''),(8,'Gunawan','gunawanbayu98@gmail.com','081806802482','2020-04-13','13:56:22','manual',0,1,NULL,''),(9,'Philip Barton','bartonjakarta@gmail.com','081283386332','2020-04-13','13:59:05','manual',0,1,NULL,''),(10,'Syifa Abdurrozak','iheh69@gmail.com','085323991877','2020-04-13','13:59:13','manual',0,1,NULL,''),(11,'Darren ','Darren@digitalvisionpublishing.com ','087878752519','2020-04-13','14:01:43','manual',0,1,NULL,''),(12,'Desi widiastuti','deswidia@gmail.com','081398769737','2020-04-13','14:05:05','manual',0,1,NULL,''),(18,'Hanindyo Herbowo','hanindyo.herbowo@gmail.com','082299392596','2020-04-27','14:56:11','manual',0,1,NULL,'han24bk'),(19,'Aditya Bayu','adit@gmail.com','085782241627','2020-05-11','13:48:29','manual',0,0,NULL,'');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_click`
--

DROP TABLE IF EXISTS `user_click`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_click` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `campaign_source` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_click_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_click`
--

LOCK TABLES `user_click` WRITE;
/*!40000 ALTER TABLE `user_click` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_click` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_click_action`
--

DROP TABLE IF EXISTS `user_click_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_click_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `campaign_source` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_click_action_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_click_action`
--

LOCK TABLES `user_click_action` WRITE;
/*!40000 ALTER TABLE `user_click_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_click_action` ENABLE KEYS */;
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
  `age` int(11) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_detail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
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
  `name` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
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
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `group_point` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_manual`
--

LOCK TABLES `user_manual` WRITE;
/*!40000 ALTER TABLE `user_manual` DISABLE KEYS */;
INSERT INTO `user_manual` VALUES (6,'087771805500','dainton1','2020-04-13','12:03:53','gilesttmt@gmail.com'),(7,'081381085380','dealio03','2020-04-13','12:23:14','@adeseptian7@gmail.com'),(8,'081806802482','dewantoro98','2020-04-13','13:56:22','gunawanbayu98@gmail.com'),(9,'081283386332','dealio','2020-04-13','13:59:05','bartonjakarta@gmail.com'),(10,'085323991877','kabur123','2020-04-13','13:59:13','iheh69@gmail.com'),(11,'087878752519','dazza1','2020-04-13','14:01:43','Darren@digitalvisionpublishing.com '),(12,'081398769737','KakekNenek!','2020-04-13','14:05:05','deswidia@gmail.com'),(18,'082299392596','123','2020-04-27','14:56:11','hanindyo.herbowo@gmail.com'),(20,'085782241627','123','2020-05-11','13:48:29','adit@gmail.com');
/*!40000 ALTER TABLE `user_manual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_point`
--

DROP TABLE IF EXISTS `user_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_point_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_point`
--

LOCK TABLES `user_point` WRITE;
/*!40000 ALTER TABLE `user_point` DISABLE KEYS */;
INSERT INTO `user_point` VALUES (1,18,100000);
/*!40000 ALTER TABLE `user_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_qrcode_membership`
--

DROP TABLE IF EXISTS `user_qrcode_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_qrcode_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `qrcode` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_qrcode_membership_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_qrcode_membership`
--

LOCK TABLES `user_qrcode_membership` WRITE;
/*!40000 ALTER TABLE `user_qrcode_membership` DISABLE KEYS */;
INSERT INTO `user_qrcode_membership` VALUES (2,18,'8008259618728165','2020-04-27','14:56:11'),(3,19,'8008162777014633','2020-05-11','13:48:29');
/*!40000 ALTER TABLE `user_qrcode_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  `merchant` varchar(255) DEFAULT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `product_value` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `dealio_points` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
INSERT INTO `voucher` VALUES (6,'Pulsa','MobilePulsa','Axis','haxis50000','50000',49700,50000,NULL),(7,'Pulsa','MobilePulsa','','haxis100000','100000',99250,100000,NULL),(8,'Pulsa','MobilePulsa','','haxis200000','200000',198500,200000,NULL),(9,'Pulsa','MobilePulsa','','haxis300000','300000',299000,300000,NULL),(10,'Pulsa','MobilePulsa','','haxis500000','500000',498000,500000,NULL),(11,'Pulsa','MobilePulsa','','haxis1000000','1000000',995000,1000000,NULL),(12,'Pulsa','MobilePulsa','Indosat','hindosat50000','50000',49250,50000,NULL),(13,'Pulsa','MobilePulsa','','hindosat100000','100000',98000,100000,NULL),(14,'Pulsa','MobilePulsa','','hindosat150000','150000',143000,150000,NULL),(15,'Pulsa','MobilePulsa','','hindosat200000','200000',185500,200000,NULL),(16,'Pulsa','MobilePulsa','','hindosat250000','250000',232000,250000,NULL),(17,'Pulsa','MobilePulsa','','hindosat500000','500000',463000,500000,NULL),(18,'Pulsa','MobilePulsa','','hindosat1000000','1000000',926000,1000000,NULL),(19,'Pulsa','MobilePulsa','SmartFren','hsmart50000','50000',49500,50000,NULL),(20,'Pulsa','MobilePulsa','','hsmart100000','100000',99000,100000,NULL),(21,'Pulsa','MobilePulsa','','hsmart150000','150000',148500,150000,NULL),(22,'Pulsa','MobilePulsa','','hsmart200000','200000',198000,200000,NULL),(23,'Pulsa','MobilePulsa','','hsmart300000','300000',297000,300000,NULL),(24,'Pulsa','MobilePulsa','','hsmart500000','500000',495000,500000,NULL),(25,'Pulsa','MobilePulsa','','hsmart1000000','1000000',990000,1000000,NULL),(26,'Pulsa','MobilePulsa','Telkomsel','htelkomsel50000','50000',49750,50000,NULL),(27,'Pulsa','MobilePulsa','','htelkomsel100000','100000',98500,100000,NULL),(28,'Pulsa','MobilePulsa','','htelkomsel150000','150000',148750,150000,NULL),(29,'Pulsa','MobilePulsa','','htelkomsel200000','200000',198000,200000,NULL),(30,'Pulsa','MobilePulsa','','htelkomsel300000','300000',297500,300000,NULL),(31,'Pulsa','MobilePulsa','','htelkomsel500000','500000',495000,500000,NULL),(32,'Pulsa','MobilePulsa','','htelkomsel1000000','1000000',987500,1000000,NULL),(33,'Pulsa','MobilePulsa','Three','hthree50000','50000',49000,50000,NULL),(34,'Pulsa','MobilePulsa','','hthree100000','100000',98500,100000,NULL),(35,'Pulsa','MobilePulsa','','hthree150000','150000',148500,150000,NULL),(36,'Pulsa','MobilePulsa','','hthree200000','200000',199000,200000,NULL),(37,'Pulsa','MobilePulsa','','hthree300000','300000',297000,300000,NULL),(38,'Pulsa','MobilePulsa','','hthree500000','500000',495000,500000,NULL),(39,'Pulsa','MobilePulsa','','hthree1000000','1000000',990000,1000000,NULL),(40,'Pulsa','MobilePulsa','XL','xld50000','50000',49700,50000,NULL),(41,'Pulsa','MobilePulsa','','xld100000','100000',99250,100000,NULL),(42,'Pulsa','MobilePulsa','','xld200000','200000',198050,200000,NULL),(43,'Pulsa','MobilePulsa','','xld300000','300000',298500,300000,NULL),(44,'Pulsa','MobilePulsa','','xld500000','500000',495000,500000,NULL),(45,'Pulsa','MobilePulsa','','xld1000000','1000000',990000,1000000,NULL),(46,'Pulsa','MobilePulsa','','xld150000','150000',150000,150000,NULL),(47,'Electricity PrePaid','MobilePulsa','PLN','hpln50000','50000',50500,52000,NULL),(48,'Electricity PrePaid','MobilePulsa','','hpln100000','100000',100500,102000,NULL),(49,'Electricity PrePaid','MobilePulsa','','hpln200000','200000',200500,202000,NULL),(50,'Electricity PrePaid','MobilePulsa','','hpln500000','500000',500500,502000,NULL),(51,'Electricity PrePaid','MobilePulsa','','hpln1000000','1000000',1000,1002000,NULL),(52,'E-Money','MobilePulsa','Dana','dana50','DANA Rp 50.000',51500,52500,NULL),(53,'E-Money','MobilePulsa','','dana100','DANA Rp 100.000',101500,102500,NULL),(54,'E-Money','MobilePulsa','','dana200','DANA Rp 200.000',201500,202500,NULL),(55,'E-Money','MobilePulsa','','dana250','DANA Rp 250.000',251750,253000,NULL),(56,'E-Money','MobilePulsa','GoPay','go50','GO-PAY Rp 50.000',53000,55000,NULL),(57,'E-Money','MobilePulsa','','go100','GO-PAY Rp 100.000',103000,105000,NULL),(58,'E-Money','MobilePulsa','','go150','GO-PAY Rp 150.000',153000,155000,NULL),(59,'E-Money','MobilePulsa','LinkAja','linkaja50','LinkAja Rp 50.000',50750,52000,NULL),(60,'E-Money','MobilePulsa','','linkaja100','LinkAja Rp 100.000',100750,102000,NULL),(61,'E-Money','MobilePulsa','','linkaja200','LinkAja Rp 200.000',200750,202000,NULL),(62,'E-Money','MobilePulsa','','linkaja250','LinkAja Rp 250.000',250750,252000,NULL),(63,'E-Money','MobilePulsa','OVO','ovo50','OVO Cash Rp 50.000',51500,52500,NULL),(64,'E-Money','MobilePulsa','','ovo100','OVO Cash Rp 100.000',101500,102500,NULL),(65,'E-Money','MobilePulsa','','ovo200','OVO Cash Rp 200.000',201500,202500,NULL),(66,'E-Money','MobilePulsa','','ovo500','OVO Cash Rp 500.000',501500,502500,NULL),(67,'Digital Voucher','MobilePulsa','Alfamart','alfamart100','Voucher Alfamart Rp 100.000',99750,101000,NULL),(68,'Digital Voucher','MobilePulsa','Indomaret','indomaret100','Voucher Indomaret Rp 100.000',99750,101000,NULL),(69,'Digital Voucher','MobilePulsa','Carrefour','carrefour100','Voucher Transmart Carrefour Rp 100.000',99750,101000,NULL),(70,'Digital Voucher','Ultra Voucher','BreadLife','BFD00050','Breadlife Rp. 50.000',47500,50000,NULL),(71,'Digital Voucher','Ultra Voucher','FORE','FRC00050','Voucher Digital Fore Coffee Rp. 50.000',45000,50000,NULL),(72,'Digital Voucher','Ultra Voucher','Wakai','WKAI100','Voucher Digital Wakai Rp. 100.000',98000,100000,NULL),(73,'Digital Voucher','Ultra Voucher','Wakai','WKAI500','Voucher Digital Wakai Rp. 500.000',490000,500000,NULL),(74,'Digital Voucher','Ultra Voucher','The Little Things She Need','TLSN100','Voucher Digital The Little Things She Need Rp. 100.000',98000,100000,NULL),(75,'Digital Voucher','Ultra Voucher','The Little Things She Need','TLSN500','Voucher Digital The Little Things She Need Rp. 500.000',490000,500000,NULL),(76,'Digital Voucher','Ultra Voucher','Kintan Buffet','KNBF00100','Voucher Digital Kintan Buffet Rp. 100.000',94000,100000,NULL),(77,'Digital Voucher','Ultra Voucher','Kintan Buffet','KNBF00200','Voucher Digital Kintan Buffet Rp. 200.000',188000,200000,NULL),(78,'Digital Voucher','Ultra Voucher','Shaburi','SHBR00100','Voucher Digital Shaburi Rp. 100.000',94000,100000,NULL),(79,'Digital Voucher','Ultra Voucher','Shaburi','SHBR00200','Voucher Digital Shaburi Rp. 200.000',188000,200000,NULL),(80,'Digital Voucher','Ultra Voucher','Yoshinoya','YSNY00050','Voucher Digital Yoshinoya Rp. 50.000',46500,50000,NULL),(81,'Digital Voucher','Ultra Voucher','Yoshinoya','YSNY00100','Voucher Digital Yoshinoya Rp. 100.000',93000,100000,NULL),(82,'Digital Voucher','Ultra Voucher','Excelso','EXL00050','Voucher digital Excelso Rp. 50.000',47500,50000,NULL),(83,'Digital Voucher','Ultra Voucher','Excelso','EXL00100','Voucher digital Excelso Rp. 100.000',95000,100000,NULL),(84,'Digital Voucher','Ultra Voucher','Ta Wan','TWD00050','Voucher Digital Ta Wan Rp. 50.000',48000,50000,NULL),(85,'Digital Voucher','Ultra Voucher','Ta Wan','TWD00100','Voucher Digital Ta Wan Rp. 100.000',96000,100000,NULL),(86,'Digital Voucher','Ultra Voucher','H&M','HMD00050','Voucher Digital H&M Rp. 50.000',48500,50000,NULL),(87,'Digital Voucher','Ultra Voucher','H&M','HMD00100','Voucher Digital H&M Rp. 100.000',97000,100000,NULL);
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch`
--

DROP TABLE IF EXISTS `watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch` (
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
  `hot_entertainment` int(11) NOT NULL,
  `hot_watch` int(11) NOT NULL,
  `point_duration` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch`
--

LOCK TABLES `watch` WRITE;
/*!40000 ALTER TABLE `watch` DISABLE KEYS */;
INSERT INTO `watch` VALUES (4,'nama stream','2020-04-06','2020-04-09','link video url',NULL,NULL,'2020-04-14','15:25:52',10,0,0,0),(6,'test stream','2020-04-14','2020-04-18','youtube.com',NULL,NULL,'2020-04-14','15:29:12',500,0,0,0);
/*!40000 ALTER TABLE `watch` ENABLE KEYS */;
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
  `hot_prize` int(11) NOT NULL,
  `best_prize` int(11) NOT NULL,
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
INSERT INTO `win` VALUES (7,'testWin',1,'2020-04-06','2020-04-09','test deskripsi','link_gambar',200,'2020-04-14','12:57:45','link_banner','offline',1,0,0);
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

-- Dump completed on 2020-06-04 15:46:37
