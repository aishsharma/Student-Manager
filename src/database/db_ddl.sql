CREATE DATABASE  IF NOT EXISTS `student_manager` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `student_manager`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: student_manager
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `classrooms`
--

DROP TABLE IF EXISTS `classrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classrooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms`
--

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_credentials`
--

DROP TABLE IF EXISTS `login_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_credentials` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `login_person_fk_idx` (`person_id`),
  CONSTRAINT `login_person_fk` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_credentials`
--

LOCK TABLES `login_credentials` WRITE;
/*!40000 ALTER TABLE `login_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT '3',
  `phone_number` varchar(15) NOT NULL,
  `classroom_id` int(11) DEFAULT NULL COMMENT 'ID of classroom a student/teacher is assigned to.',
  PRIMARY KEY (`person_id`),
  KEY `person_user_type_fk_idx` (`user_type`),
  KEY `person_classroom_fk_idx` (`classroom_id`),
  CONSTRAINT `person_classroom_fk` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`room_id`) ON DELETE NO ACTION ON UPDATE SET NULL,
  CONSTRAINT `person_user_type_fk` FOREIGN KEY (`user_type`) REFERENCES `user_types` (`type_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_scores`
--

DROP TABLE IF EXISTS `student_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_scores` (
  `score_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `math` int(11) NOT NULL DEFAULT '0',
  `science` int(11) NOT NULL DEFAULT '0',
  `sst` int(11) NOT NULL DEFAULT '0' COMMENT 'Social Studies',
  `language` int(11) NOT NULL DEFAULT '0',
  `average` int(11) NOT NULL DEFAULT '0',
  `grade` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`score_id`),
  KEY `score_student_fk_idx` (`student_id`),
  CONSTRAINT `score_student_fk` FOREIGN KEY (`student_id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_scores`
--

LOCK TABLES `student_scores` WRITE;
/*!40000 ALTER TABLE `student_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_types` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (1,'Principal'),(2,'Teacher'),(3,'Student');
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'student_manager'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-26 23:51:37
