-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: testingsystem_db
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `test_case_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `FK_5351m56j7xd8xxfbla7d231w9` (`test_case_id`),
  CONSTRAINT `FK_5351m56j7xd8xxfbla7d231w9` FOREIGN KEY (`test_case_id`) REFERENCES `test_cases` (`test_case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'Марс',1),(2,'Венера',1),(3,'Юпитер',1),(4,'Земля',1),(5,'4',2),(6,'6',2),(7,'8',2),(8,'0',2),(9,'45',3),(10,'50',3),(11,'51',3),(12,'100',3),(13,'Индия',4),(14,'США',4),(15,'Китай',4),(16,'Мельбурн',5),(17,'Сидней',5),(18,'Канберра',5),(19,'Аделаида',5),(20,'6',6),(21,'5',6),(22,'7',6),(23,'нет правильных вариантов',6),(24,'4',6),(25,'Россия',7),(26,'Канада',7),(27,'США',7),(28,'Китай',7),(29,'27',8),(30,'28',8),(31,'30',8),(32,'29',8),(33,'4: Тихий, Индийский, Атлантический, Северный ледовитый',9),(34,'5: Тихий, Индийский, Атлантический, Северный ледовитый, Южный',9),(35,'3: Тихий, Атлантический, Северный ледовитый',9),(36,'6: Россия, Молдавия, Белоруссия, Румыния, Польша, Венгрия',10),(37,'7: Россия, Молдавия, Белоруссия, Румыния, Польша, Венгрия, Словакия',10),(38,'8: Россия, Молдавия, Белоруссия, Румыния, Польша, Венгрия, Словакия, Латвия',10),(39,'Черкассы',11),(40,'Киев',11),(41,'Харьков',11),(42,'Одесса',11);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_cases`
--

DROP TABLE IF EXISTS `test_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_cases` (
  `test_case_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `answer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`test_case_id`),
  KEY `FK_mpilaqwmvbd8nghtmuoe756ju` (`answer_id`),
  CONSTRAINT `FK_mpilaqwmvbd8nghtmuoe756ju` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_cases`
--

LOCK TABLES `test_cases` WRITE;
/*!40000 ALTER TABLE `test_cases` DISABLE KEYS */;
INSERT INTO `test_cases` VALUES (1,'На какой планете мы живем?',4),(2,'Сколько будет 2 + 2 * 2?',6),(3,'Сколько штатов в США?',10),(4,'В какой стране наибольшая численность населения?',15),(5,'Какой город является столицей Австралии?',18),(6,'Сколько материков на Земле?',20),(7,'Какая страна имеет наибольшую площадь?',25),(8,'Сколько стран входит в состав Евросоюза?',30),(9,'Сколько океанов на Земле?',34),(10,'Cо сколькими странами граничит Украина?',37),(11,'Столица Украины?',40);
/*!40000 ALTER TABLE `test_cases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-06  9:23:25
