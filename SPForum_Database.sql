CREATE DATABASE  IF NOT EXISTS `heroku_9a069375239a622` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `heroku_9a069375239a622`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: us-cdbr-east-06.cleardb.net    Database: heroku_9a069375239a622
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
-- Table structure for table `anslikes`
--

DROP TABLE IF EXISTS `anslikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anslikes` (
  `anslikeid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `ansid` int(11) NOT NULL,
  PRIMARY KEY (`anslikeid`),
  UNIQUE KEY `anslikeid_UNIQUE` (`anslikeid`),
  KEY `fk_userid5_idx` (`userid`),
  CONSTRAINT `fk_ansid` FOREIGN KEY (`anslikeid`) REFERENCES `answers` (`answerid`) ON DELETE CASCADE,
  CONSTRAINT `fk_userid5` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anslikes`
--

LOCK TABLES `anslikes` WRITE;
/*!40000 ALTER TABLE `anslikes` DISABLE KEYS */;
INSERT INTO `anslikes` VALUES (4,14,4),(14,14,14),(24,14,24),(34,14,34),(44,24,4),(54,24,24),(64,4,34),(74,4,74),(84,4,84);
/*!40000 ALTER TABLE `anslikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `answerid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  `comment` text NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`answerid`),
  UNIQUE KEY `answerid_UNIQUE` (`answerid`),
  KEY `fk_questionid2_idx` (`questionid`),
  KEY `fk_userid3_idx` (`userid`),
  CONSTRAINT `fk_questionid2` FOREIGN KEY (`questionid`) REFERENCES `questions` (`questionid`) ON DELETE CASCADE,
  CONSTRAINT `fk_userid3` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (4,24,204,'Comment1',3,'2023-02-19 15:14:17'),(14,4,214,'Comment2',1,'2023-02-19 15:18:11'),(24,14,224,'Comment3',2,'2023-02-19 15:18:12'),(34,24,234,'Comment4',3,'2023-02-19 15:18:12'),(44,4,244,'Comment5',1,'2023-02-19 15:18:13'),(54,14,254,'Comment6',2,'2023-02-19 15:18:13'),(64,24,264,'Comment7',3,'2023-02-19 15:18:14'),(74,4,274,'Comment8',1,'2023-02-19 15:18:15'),(84,14,264,'Comment9',2,'2023-02-19 15:18:15'),(94,24,244,'Comment10',3,'2023-02-19 15:18:16'),(104,4,254,'Comment11',1,'2023-02-19 15:18:16'),(114,14,274,'Comment12',2,'2023-02-19 15:18:17'),(124,4,284,'Comment13',3,'2023-02-19 15:18:18'),(134,4,294,'Comment14',1,'2023-02-19 15:18:18');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(45) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `cat_name_UNIQUE` (`cat_name`),
  UNIQUE KEY `full_name_UNIQUE` (`full_name`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'SOC','School of Computing'),(14,'SOV','School of Business'),(24,'MAE','School of Mechanical & Aeronautical Engineering'),(34,'MAD','Media, Art & Design School'),(44,'ABE','School of Architecture & the Build Environment'),(54,'CLS','School of Chemical & Life Science'),(64,'EEE','School of Electrical & Electronic Engineering'),(74,'LSC','School of Life Skills & Communication'),(84,'MS','School of Mathematics & Science'),(94,'PACE','Professional & Adult Continuing Education Academy'),(104,'SMA','Singapore Maritime Academy');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qnlikes`
--

DROP TABLE IF EXISTS `qnlikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qnlikes` (
  `likesid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  PRIMARY KEY (`likesid`),
  UNIQUE KEY `likesid_UNIQUE` (`likesid`),
  KEY `fk_questionid3_idx` (`questionid`),
  KEY `fk_userid4_idx` (`userid`),
  CONSTRAINT `fk_questionid3` FOREIGN KEY (`questionid`) REFERENCES `questions` (`questionid`) ON DELETE CASCADE,
  CONSTRAINT `fk_userid4` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qnlikes`
--

LOCK TABLES `qnlikes` WRITE;
/*!40000 ALTER TABLE `qnlikes` DISABLE KEYS */;
INSERT INTO `qnlikes` VALUES (84,14,204),(94,14,214),(104,4,224),(114,14,234),(124,24,204),(134,24,214),(144,4,254),(154,4,264);
/*!40000 ALTER TABLE `qnlikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `userid` int(11) NOT NULL,
  `upvotes` int(11) NOT NULL DEFAULT '0',
  `downvotes` int(11) NOT NULL DEFAULT '0',
  `categoryid` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`questionid`),
  UNIQUE KEY `questionid_UNIQUE` (`questionid`),
  KEY `fk_categoryid_idx` (`categoryid`),
  KEY `fk_userid_idx` (`userid`),
  CONSTRAINT `fk_categoryid` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`) ON DELETE CASCADE,
  CONSTRAINT `fk_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (204,'Qn0','DES0',4,3,0,14,'2023-02-19 15:01:08'),(214,'Qn1','DES1',14,1,2,4,'2023-02-19 15:01:08'),(224,'Qn2','DES2',24,1,1,24,'2023-02-19 15:01:09'),(234,'Qn3','DES3',4,1,1,54,'2023-02-19 15:01:09'),(244,'Qn4','DES4',14,3,0,74,'2023-02-19 15:01:10'),(254,'Qn5','DES5',24,2,1,64,'2023-02-19 15:01:11'),(264,'Qn6','DES6',4,3,0,84,'2023-02-19 15:01:11'),(274,'Qn7','DES7',14,2,1,94,'2023-02-19 15:01:12'),(284,'Qn8','DES8',24,3,0,104,'2023-02-19 15:01:12'),(294,'Qn9','DES9',4,3,0,44,'2023-02-19 15:01:13');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(45) NOT NULL,
  PRIMARY KEY (`roleID`),
  UNIQUE KEY `roleID_UNIQUE` (`roleID`),
  UNIQUE KEY `roleName_UNIQUE` (`roleName`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (4,'Admin'),(14,'user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved`
--

DROP TABLE IF EXISTS `saved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saved` (
  `saveId` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  PRIMARY KEY (`saveId`),
  UNIQUE KEY `saveId_UNIQUE` (`saveId`),
  KEY `fk_userid2_idx` (`userid`),
  KEY `fk_questionid_idx` (`questionid`),
  CONSTRAINT `fk_questionid` FOREIGN KEY (`questionid`) REFERENCES `questions` (`questionid`) ON DELETE CASCADE,
  CONSTRAINT `fk_userid2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved`
--

LOCK TABLES `saved` WRITE;
/*!40000 ALTER TABLE `saved` DISABLE KEYS */;
INSERT INTO `saved` VALUES (4,24,204),(14,14,214),(24,24,214),(34,4,214),(44,14,224),(54,24,224),(64,4,224),(74,14,234),(84,24,234),(94,4,244),(104,14,244),(114,4,244),(124,4,294);
/*!40000 ALTER TABLE `saved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `school` varchar(45) NOT NULL,
  `credential` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `Employment` varchar(45) DEFAULT NULL,
  `hobbies` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '14',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_roleID_idx` (`role`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role`) REFERENCES `role` (`roleID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'u1','u1@email.com','p1','SOC','I am a student in SP','This is a short description of myself (u1)','Google Programming Intern','playing basketball','Woodland',4,'2023-02-19 14:34:43'),(14,'u2','u2@email.com','p2','EEE','I am a student in EEE','This is a short description of myself (u2)','SIA Intern','Math','Seng Kang',4,'2023-02-19 14:34:44'),(24,'u3','u3@email.com','p3','MAD','I am a student in MAD','This is a short description of myself (u3)','Unemployed','Drawing','Jurong East',14,'2023-02-19 14:34:44');
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

-- Dump completed on 2023-03-15 23:08:38
