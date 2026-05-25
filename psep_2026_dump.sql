CREATE DATABASE  IF NOT EXISTS `psep_2026` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `psep_2026`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: psep_2026
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `cinema_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'TC BIG Rakovica','Patrijarha Dimitirja 14, Beograd','2026-05-06 17:43:05','2026-05-13 15:20:26',NULL),(2,'TC Okov','Partizanske Avijacije 2, Beograd','2026-05-06 17:43:05',NULL,NULL),(3,'TC Stadion','Zaplanjska 32, Beograd','2026-05-06 17:43:33',NULL,NULL),(4,'TC BIG Novi Sad','Stari Kacki Put bb, Novi Sad','2026-05-06 17:52:36',NULL,NULL),(5,'Trg Nikole Pasica','Nikole Pasica 13, Nis','2026-05-06 17:52:57',NULL,NULL),(6,'Zvezda','Kralja Milana 19, Beograd','2026-05-06 17:53:19',NULL,NULL),(7,'Random Ime Bioskopa','Neka Adresa bb','2026-05-13 15:24:44',NULL,'2026-05-13 15:24:50');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoice_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `purs_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `purs_time` datetime DEFAULT NULL,
  `purs_counter` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`invoice_id`),
  KEY `fk_user_invoice_idx` (`user_id`),
  CONSTRAINT `fk_user_invoice` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,4,'019e45ca-e44f-7000-ab0a-286cb6526bc7','2026-05-20 16:29:45','2026/1779287385158','2026-05-18 18:21:01'),(2,4,'019e45ef-2598-7000-b93f-5cd3ddc3956a','2026-05-20 17:09:21','2026/1779289761175','2026-05-20 16:32:59'),(3,4,'019e45f0-21d6-7000-ad02-ddce56a5fb92','2026-05-20 17:10:26','2026/1779289825748','2026-05-20 17:10:18'),(4,4,'019e460c-5d22-7000-8534-cb481a2d4d28','2026-05-20 17:41:16','2026/1779291675936','2026-05-20 17:36:02'),(5,4,'019e5006-650b-7000-b1d3-49623fd98270','2026-05-22 16:10:57','2026/1779459056891','2026-05-22 16:07:10'),(6,4,NULL,NULL,NULL,'2026-05-22 16:17:49');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_item`
--

DROP TABLE IF EXISTS `invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_item` (
  `invoice_item_id` int unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int unsigned NOT NULL,
  `time_table_id` int unsigned NOT NULL,
  `price_per_item` int unsigned NOT NULL,
  `count` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`invoice_item_id`),
  KEY `fk_invoice_item_invoice_idx` (`invoice_id`),
  KEY `fk_invoice_item_time_table_idx` (`time_table_id`),
  CONSTRAINT `fk_invoice_item_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_invoice_item_time_table` FOREIGN KEY (`time_table_id`) REFERENCES `time_table` (`time_table_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_item`
--

LOCK TABLES `invoice_item` WRITE;
/*!40000 ALTER TABLE `invoice_item` DISABLE KEYS */;
INSERT INTO `invoice_item` VALUES (1,1,12,1800,4,'2026-05-20 14:14:59','2026-05-20 16:29:40',NULL),(2,1,7,4200,2,'2026-05-20 15:17:58','2026-05-20 16:29:37',NULL),(3,2,31,3200,2,'2026-05-20 17:09:18','2026-05-20 17:09:20',NULL),(4,3,42,4000,1,'2026-05-20 17:10:18',NULL,NULL),(5,3,13,1900,1,'2026-05-20 17:10:24',NULL,NULL),(6,4,9,4600,1,'2026-05-20 17:40:37',NULL,NULL),(7,5,1,3200,3,'2026-05-22 16:10:53','2026-05-22 16:10:55',NULL);
/*!40000 ALTER TABLE `invoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_table`
--

DROP TABLE IF EXISTS `time_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_table` (
  `time_table_id` int unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` int unsigned NOT NULL,
  `cinema_id` int unsigned NOT NULL,
  `start_time` time NOT NULL,
  `price` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`time_table_id`),
  KEY `fk_time_table_cinema_idx` (`cinema_id`),
  CONSTRAINT `fk_time_table_cinema` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_table`
--

LOCK TABLES `time_table` WRITE;
/*!40000 ALTER TABLE `time_table` DISABLE KEYS */;
INSERT INTO `time_table` VALUES (1,226,1,'18:00:00',3200,'2026-05-06 17:51:33',NULL,NULL),(2,226,2,'18:30:00',3100,'2026-05-06 17:51:33',NULL,NULL),(3,226,3,'19:00:00',3400,'2026-05-06 17:51:33',NULL,NULL),(4,226,3,'21:00:00',3400,'2026-05-06 17:51:33',NULL,NULL),(5,1,2,'21:01:00',4200,'2026-05-06 17:51:33',NULL,NULL),(6,298,2,'19:00:00',4100,'2026-05-06 17:51:33',NULL,'2026-05-13 18:13:48'),(7,298,1,'21:00:00',4200,'2026-05-06 17:51:33',NULL,NULL),(8,298,3,'18:30:00',4100,'2026-05-06 17:51:33',NULL,NULL),(9,298,3,'21:00:00',4600,'2026-05-06 17:51:33','2026-05-20 17:40:56',NULL),(10,253,1,'17:00:00',2200,'2026-05-06 17:51:33',NULL,NULL),(11,253,2,'18:00:00',2300,'2026-05-06 17:51:33',NULL,NULL),(12,261,1,'10:00:00',1800,'2026-05-06 18:05:37',NULL,NULL),(13,260,2,'10:30:00',1900,'2026-05-06 18:05:37',NULL,NULL),(14,259,3,'11:00:00',2000,'2026-05-06 18:05:37',NULL,NULL),(15,258,4,'10:15:00',2100,'2026-05-06 18:05:37',NULL,NULL),(16,257,5,'11:30:00',2200,'2026-05-06 18:05:37',NULL,NULL),(17,256,6,'10:45:00',2000,'2026-05-06 18:05:37',NULL,NULL),(18,255,1,'12:00:00',2300,'2026-05-06 18:05:37',NULL,NULL),(19,254,2,'12:30:00',2400,'2026-05-06 18:05:37',NULL,NULL),(20,252,3,'13:00:00',2500,'2026-05-06 18:05:37',NULL,NULL),(21,251,4,'12:15:00',2600,'2026-05-06 18:05:37',NULL,NULL),(22,250,5,'13:30:00',2400,'2026-05-06 18:05:37',NULL,NULL),(23,249,6,'12:45:00',2300,'2026-05-06 18:05:37',NULL,NULL),(24,248,1,'14:00:00',2800,'2026-05-06 18:05:37',NULL,NULL),(25,247,2,'14:30:00',2900,'2026-05-06 18:05:37',NULL,NULL),(26,246,3,'15:00:00',3000,'2026-05-06 18:05:37',NULL,NULL),(27,245,4,'14:15:00',3100,'2026-05-06 18:05:37',NULL,NULL),(28,244,5,'15:30:00',3000,'2026-05-06 18:05:37',NULL,NULL),(29,243,6,'14:45:00',2900,'2026-05-06 18:05:37',NULL,NULL),(30,242,1,'16:00:00',3100,'2026-05-06 18:05:37',NULL,NULL),(31,241,2,'16:30:00',3200,'2026-05-06 18:05:37',NULL,NULL),(32,240,3,'17:00:00',3300,'2026-05-06 18:05:37',NULL,NULL),(33,239,4,'16:15:00',3400,'2026-05-06 18:05:37',NULL,NULL),(34,238,5,'17:30:00',3200,'2026-05-06 18:05:37',NULL,NULL),(35,237,6,'16:45:00',3100,'2026-05-06 18:05:37',NULL,NULL),(36,236,1,'18:00:00',3600,'2026-05-06 18:05:37',NULL,NULL),(37,235,2,'18:30:00',3700,'2026-05-06 18:05:37',NULL,NULL),(38,234,3,'19:00:00',3800,'2026-05-06 18:05:37',NULL,NULL),(39,233,4,'18:15:00',3900,'2026-05-06 18:05:37',NULL,NULL),(40,232,5,'19:30:00',3700,'2026-05-06 18:05:37',NULL,NULL),(41,231,6,'18:45:00',3600,'2026-05-06 18:05:37',NULL,NULL),(42,230,1,'20:00:00',4000,'2026-05-06 18:05:37',NULL,NULL),(43,229,2,'20:30:00',4100,'2026-05-06 18:05:37',NULL,NULL),(44,228,3,'21:00:00',4200,'2026-05-06 18:05:37',NULL,NULL),(45,227,4,'20:15:00',4300,'2026-05-06 18:05:37',NULL,NULL),(46,225,5,'21:30:00',4100,'2026-05-06 18:05:37',NULL,NULL),(47,224,6,'20:45:00',4000,'2026-05-06 18:05:37',NULL,NULL),(48,223,1,'22:00:00',4500,'2026-05-06 18:05:37',NULL,NULL),(49,222,2,'22:30:00',4600,'2026-05-06 18:05:37',NULL,NULL),(50,221,3,'23:00:00',4700,'2026-05-06 18:05:37',NULL,NULL),(51,220,4,'22:15:00',4800,'2026-05-06 18:05:37',NULL,NULL),(52,219,5,'23:30:00',4600,'2026-05-06 18:05:37',NULL,NULL),(53,218,6,'22:45:00',4500,'2026-05-06 18:05:37',NULL,NULL),(54,217,1,'13:15:00',2700,'2026-05-06 18:05:37',NULL,NULL),(55,216,2,'15:45:00',3200,'2026-05-06 18:05:37',NULL,NULL),(56,215,3,'18:20:00',3900,'2026-05-06 18:05:37',NULL,NULL),(57,214,4,'21:10:00',4400,'2026-05-06 18:05:37',NULL,NULL),(58,213,5,'17:10:00',3300,'2026-05-06 18:05:37',NULL,NULL),(59,212,6,'19:50:00',4200,'2026-05-06 18:05:37',NULL,NULL),(60,211,1,'11:20:00',2100,'2026-05-06 18:05:37',NULL,NULL),(61,210,2,'13:50:00',2800,'2026-05-06 18:05:37',NULL,NULL),(62,209,3,'16:10:00',3400,'2026-05-06 18:05:37',NULL,NULL),(63,208,4,'18:40:00',3900,'2026-05-06 18:05:37',NULL,NULL),(64,207,5,'20:20:00',4100,'2026-05-06 18:05:37',NULL,NULL),(65,206,6,'22:10:00',4600,'2026-05-06 18:05:37',NULL,NULL),(66,1,1,'21:00:00',3200,'2026-05-13 18:02:59',NULL,NULL),(67,1,1,'21:00:00',3200,'2026-05-15 14:13:16',NULL,NULL),(68,329,6,'21:00:00',3200,'2026-05-22 16:06:20',NULL,NULL);
/*!40000 ALTER TABLE `time_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `gender` enum('m','f') COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_code` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `verified_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Example','User','m','user@example.com','$2a$12$yP59V2ld.JlV2Ty32N6RauvdrccyPWcgoH1q7fjHvBqJ5qLokjka2',NULL,'2026-05-06 17:37:04','2026-05-06 17:37:04',NULL),(2,'Petar','Kresoja','m','pkresoja@singidunum.ac.rs','$2b$12$SSpyOVV4vUedokLDH4OpOOBIoamp7tGI9tnatLRz3hhuWpVKmUMCW',221430,'2026-05-15 16:16:45','2026-05-15 17:12:07',NULL),(3,'Petar','Kresoja','m','pkresoja@singimail.rs','$2b$12$P31/1bawfW6cJBYACYgnQe9857bV.3H8jTQ7O4bTdmbTD93n.FaPS',449214,'2026-05-15 17:48:48','2026-05-15 17:49:45',NULL),(4,'Cloud','Computing','m','pkresojacloud25@singimail.rs','$2b$12$6gDM9I7tFFGcAXDbMsyWAeqZV5ZKMZzRkG2t7mF4ltR9QmwNgAZl2',247497,'2026-05-15 17:53:39','2026-05-15 17:53:39',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-25 17:32:41
