CREATE DATABASE  IF NOT EXISTS `campsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `campsystem`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: campsystem
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `guestcompanies`
--

DROP TABLE IF EXISTS `guestcompanies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guestcompanies` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `joinedsince` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestcompanies`
--

LOCK TABLES `guestcompanies` WRITE;
/*!40000 ALTER TABLE `guestcompanies` DISABLE KEYS */;
INSERT INTO `guestcompanies` VALUES (1,'ADYARD GASCO','2017-05-30 08:20:17',1),(2,'AL SAHHRA','2017-05-30 08:20:17',1),(3,'ARABCENT GEO','2017-05-30 08:08:28',0),(4,'ARABCENTER FREE','2017-05-30 08:20:17',1),(5,'AVANCEON','2017-05-30 08:20:17',1),(6,'DAEAH E&C','2017-05-30 08:20:17',1),(7,'DESCON','2017-05-30 08:20:17',1),(8,'DICO TECH','2017-05-30 08:20:17',1),(9,'EMCO1036','2017-05-30 08:20:17',1),(10,'EMCO5024','2017-05-30 08:20:17',1),(11,'ETA FMD','2017-05-30 08:20:17',1),(12,'ETA MNE','2017-05-30 08:08:28',0),(13,'EXPERT E&I','2017-05-30 08:08:28',0),(14,'EXTERRAN BELLELI','2017-05-30 08:20:17',1),(15,'EXTRA CO','2017-05-30 08:20:17',1),(16,'GWG','2017-05-30 08:20:17',1),(17,'HANKOOK','2017-05-30 08:20:17',1),(18,'KHARAFI','2017-05-30 08:20:17',1),(19,'LONE STAR','2017-05-30 08:20:17',1),(20,'PB POWER','2016-12-20 07:03:20',0),(21,'PETROMEN','2017-05-30 08:20:17',1),(22,'POWER MECH','2017-05-30 08:20:17',1),(23,'QCON','2017-05-30 08:20:17',1),(24,'SABAT','2016-12-20 07:03:20',0),(25,'SEJONG','2017-05-30 08:20:17',1),(26,'SERGAS','2017-05-30 08:20:17',1),(27,'SPARK94','2016-12-20 07:03:20',0),(28,'SUNASCO','2017-05-30 08:20:17',1),(29,'TRI STAR','2017-05-30 08:20:17',1),(30,'USG .SECURITY','2016-12-20 07:03:20',0),(31,'CONSILIUM','2016-12-20 07:03:20',0),(32,'SAMSUNG','2016-12-20 07:03:20',0),(33,'WISON','2016-12-20 07:03:20',0),(34,'SPECTRA','2016-12-20 07:03:20',0),(35,'TAHTAAN','2017-05-30 08:20:17',1),(36,'ALRAEE','2017-05-30 08:20:17',1),(37,'BAINUNA LAB','2016-12-20 07:03:20',0),(38,'HAMED ESTABLISHMENT','2017-05-30 08:20:18',1),(39,'GREENLAND CATERING','2017-05-30 08:20:18',1),(40,'ENG SOLUTIONS','2016-12-20 07:03:20',0),(41,'PIONEERS CATERING','2017-05-30 08:20:18',1),(42,'QUALITY TRANSPORT','2017-05-30 08:20:18',1),(43,'SGS GULF','2017-05-30 08:20:18',1),(44,'AL SAHHRA 2','2016-12-20 07:03:20',0),(45,'ADVAN COMPANY','2016-12-20 07:03:20',0),(46,'DENHOLM','2017-05-30 08:20:18',1),(47,'TAMAS PROJECT','2017-05-30 08:20:18',1),(48,'SEMC','2016-12-20 07:03:20',0),(49,'PENTA GLOBAL','2017-05-30 08:20:18',1),(50,'AL MELEHY','2017-05-30 08:20:18',1),(51,'E&I EMIRATES','2017-05-30 08:20:18',1),(52,'TECTON','2017-05-30 08:20:18',1),(53,'DOOSAN','2017-05-30 08:20:18',1),(54,'TECHNICAL CO','2017-05-30 08:20:18',1),(55,'ADOS','2016-12-20 07:03:20',0),(56,'ETHOS ENERGY','2017-05-30 08:20:18',1),(57,'EMINENT','2017-05-30 08:20:18',1),(58,'ARAB EMIRATES BANDAG','2017-05-30 08:20:18',1),(59,'AMB HARTAL','2017-05-30 08:20:18',1),(60,'APS','2017-05-30 08:20:18',1),(61,'CELL INFORMATION','2016-12-20 07:03:20',0),(62,'ETISALAT SUBCONT','2017-05-30 08:20:18',1),(63,'INECO','2017-05-30 08:20:18',1),(64,'Apisylux','2016-12-20 07:03:20',0),(65,'Dukaan.pk','2015-11-29 20:00:00',0),(66,'Dukaan.pk','2016-10-29 20:00:00',0);
/*!40000 ALTER TABLE `guestcompanies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-10 15:23:04
