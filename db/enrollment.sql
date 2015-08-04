CREATE DATABASE  IF NOT EXISTS `enrollment` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `enrollment`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: mysql1.bme.ohsu.edu    Database: enrollment
-- ------------------------------------------------------
-- Server version	5.6.14-log

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
-- Table structure for table `eligibility_states`
--

DROP TABLE IF EXISTS `eligibility_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eligibility_states` (
  `StateId` tinyint(4) NOT NULL,
  `Title` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eligibility_states`
--

LOCK TABLES `eligibility_states` WRITE;
/*!40000 ALTER TABLE `eligibility_states` DISABLE KEYS */;
INSERT INTO `eligibility_states` VALUES (0,'Unscreened'),(1,'Age'),(2,'Clinical'),(3,'Memory'),(4,'Refused'),(5,'Other'),(6,'Eligible'),(7,'Deceased');
/*!40000 ALTER TABLE `eligibility_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eligibility_sub_states`
--

DROP TABLE IF EXISTS `eligibility_sub_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eligibility_sub_states` (
  `StateId` tinyint(3) unsigned NOT NULL,
  `SubStateId` tinyint(3) unsigned NOT NULL,
  `Title` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eligibility_sub_states`
--

LOCK TABLES `eligibility_sub_states` WRITE;
/*!40000 ALTER TABLE `eligibility_sub_states` DISABLE KEYS */;
INSERT INTO `eligibility_sub_states` VALUES (0,0,'Unscreened'),(2,0,'Cancer'),(2,1,'Functional Impairment'),(2,2,'Heart Disease'),(2,3,'Medication Exclusion'),(2,4,'Neurologic Disease'),(2,5,'Repiratory Disease'),(2,6,'Stroke'),(2,7,'Other'),(3,0,'Failed Screen'),(3,1,'Self Report'),(4,0,'Refused'),(4,1,'Do not recontact'),(4,2,'Lost'),(5,0,'Out of area'),(5,1,'Study Closed'),(5,2,'No collateral'),(5,3,'PI Discretion'),(5,4,'Other '),(6,0,'Eligible'),(6,1,'Motion Only'),(6,2,'Ekahau Only'),(6,3,'Clinical Only');
/*!40000 ALTER TABLE `eligibility_sub_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `status` tinyint(4) DEFAULT '0',
  `projId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subjId` int(10) unsigned NOT NULL,
  `homeId` int(10) unsigned NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `RAId` int(10) unsigned DEFAULT '0',
  `eligibility` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `secondary` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `idx` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (100,2,266,13,'2003-07-04 00:00:00',5,6,0,1),(-1,2,268,18,'2003-09-13 00:00:00',5,6,0,2),(100,2,276,12,'2003-07-20 00:00:00',5,6,0,3),(100,2,277,11,'2003-07-21 00:00:00',5,6,0,4),(100,2,278,11,'2003-07-22 00:00:00',5,6,0,5),(100,2,279,19,'2003-07-23 00:00:00',5,6,0,6),(100,2,280,15,'2003-07-24 00:00:00',5,6,0,7),(100,2,281,15,'2003-07-25 00:00:00',5,6,1,8),(-1,2,282,17,'2003-12-06 00:00:00',5,6,0,9),(100,2,283,14,'2003-07-27 00:00:00',5,6,0,10),(-1,2,306,16,'2003-12-30 00:00:00',5,6,0,11),(-1,2,307,16,'2003-12-31 00:00:00',5,6,0,12),(100,2,308,14,'2003-08-28 00:00:00',5,6,1,13),(100,3,310,21,'2003-11-22 00:00:00',4,6,0,14),(100,3,311,20,'2003-11-24 00:00:00',4,6,0,15),(100,3,315,26,'2003-12-03 00:00:00',4,6,0,16),(100,3,317,22,'2003-12-02 00:00:00',4,6,0,17),(100,3,322,24,'2003-12-14 00:00:00',4,6,0,18),(100,3,323,23,'2003-12-15 00:00:00',4,6,0,19),(100,3,324,23,'2003-12-16 00:00:00',4,6,0,20),(100,3,325,25,'2003-12-17 00:00:00',4,6,0,21),(20,1,263,34,'2003-11-28 00:00:00',13,6,0,22),(20,4,265,36,'2003-11-01 00:00:00',14,6,0,23),(20,1,289,51,'2003-12-28 00:00:00',17,6,0,24),(20,4,309,70,'2003-12-15 00:00:00',14,6,0,25),(20,3,320,77,'2003-12-05 00:00:00',4,6,0,26),(20,1,337,91,'2004-02-10 00:00:00',13,6,0,27),(20,1,338,92,'2004-02-03 00:00:00',13,6,0,28),(20,4,339,93,'2004-02-07 00:00:00',14,6,0,29),(20,1,341,95,'2004-02-18 00:00:00',17,6,0,30),(20,1,342,96,'2004-02-17 00:00:00',16,6,0,31),(20,1,344,98,'2004-02-21 00:00:00',17,6,0,32),(0,0,1348,1083,'2015-02-18 08:13:10',25,1,0,7589),(100,11,1420,1268,'2015-05-02 08:57:08',173,0,0,7590),(100,11,1420,1268,'2015-05-02 00:00:00',173,6,0,7591),(4,11,1417,1264,'2015-04-29 08:58:26',173,6,0,7592),(3,11,1417,1264,'2015-04-29 08:58:36',173,6,0,7593),(100,11,1424,1272,'2015-05-06 08:59:20',173,0,0,7594),(100,11,1424,1272,'2015-05-06 00:00:00',173,6,0,7595),(2,11,1296,1030,'2014-12-05 00:00:00',158,1,0,7596),(2,11,1426,1274,'2015-05-08 09:09:23',13,6,0,7597),(2,11,1427,1275,'2015-05-09 09:10:53',13,6,0,7598),(2,11,1296,1030,'2014-12-29 09:13:58',173,1,0,7599),(2,11,1296,1030,'2014-12-29 00:00:00',173,6,0,7600),(4,11,1296,1030,'2014-12-29 09:15:17',173,1,0,7601),(3,11,1296,1030,'2014-12-29 09:15:28',173,1,0,7602),(100,11,372,1120,'2012-06-18 12:04:54',13,6,0,7603),(100,11,345,1198,'2012-05-22 12:06:24',13,6,0,7604),(100,11,346,1259,'2012-05-23 12:08:25',13,6,0,7605),(0,0,1428,1276,'2015-05-10 12:38:36',173,6,0,7606),(2,11,1428,1276,'2015-05-10 12:39:02',173,6,0,7607),(0,0,1429,1277,'2015-05-11 14:54:38',13,6,0,7608),(2,11,1406,1250,'2015-04-22 00:00:00',173,4,0,7609),(2,11,1429,1277,'2015-05-15 12:44:59',13,6,0,7610),(100,11,1427,1275,'2015-05-13 12:45:45',13,6,0,7611),(-1,11,1427,1275,'2015-05-13 16:47:17',13,6,0,7612),(0,0,1427,1275,'2015-05-13 16:47:22',0,6,0,7613),(2,11,1427,1275,'2015-05-13 16:47:33',0,6,0,7614),(-1,11,1427,1275,'2015-05-13 16:47:58',0,6,0,7615),(0,0,1427,1275,'2015-05-13 16:48:03',0,6,0,7616),(2,13,1427,1275,'2015-05-13 16:48:09',0,6,0,7617),(100,13,1427,1275,'2015-05-13 16:48:17',0,6,0,7618),(100,13,1427,1275,'2015-05-13 17:02:50',117,6,0,7619),(100,13,1427,1275,'2015-05-13 17:03:18',13,6,0,7620),(0,0,1390,1258,'2015-04-02 13:03:31',4,6,0,7621),(0,0,1390,1258,'2015-04-07 00:00:00',4,4,1,7622),(100,11,1426,1274,'2015-05-13 14:13:28',13,6,0,7623),(4,11,1426,1274,'2015-05-08 14:21:51',13,6,0,7624),(4,13,1427,1275,'2015-05-09 14:25:10',13,6,0,7625),(4,11,1429,1277,'2015-05-16 14:26:12',13,6,0,7626),(4,11,1424,1272,'2015-05-10 15:57:26',173,0,0,7627);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment_states`
--

DROP TABLE IF EXISTS `enrollment_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment_states` (
  `stateId` tinyint(4) NOT NULL DEFAULT '0',
  `Name` varchar(20) DEFAULT NULL,
  `Display` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment_states`
--

LOCK TABLES `enrollment_states` WRITE;
/*!40000 ALTER TABLE `enrollment_states` DISABLE KEYS */;
INSERT INTO `enrollment_states` VALUES (-1,'Withdrawn',1),(0,'Available',1),(2,'Screening',1),(3,'Collaterals',0),(4,'Neuropsych',0),(5,'Clinician',0),(10,'Take Ownership',0),(20,'Ready to install',0),(100,'Active',1),(110,'Deceased',1);
/*!40000 ALTER TABLE `enrollment_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_list`
--

DROP TABLE IF EXISTS `project_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_list` (
  `projectId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(15) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `mask` smallint(5) unsigned DEFAULT NULL,
  `active` tinyint(3) unsigned DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_list`
--

LOCK TABLES `project_list` WRITE;
/*!40000 ALTER TABLE `project_list` DISABLE KEYS */;
INSERT INTO `project_list` VALUES (0,'Pool','No Project',16,0),(1,'Project1','Project Number1',1,0),(2,'Project2','Project Number2',32,0),(3,'Project3','Project Number3',2,0),(4,'Project4','Project Number4',4,0),(5,'Project5','Project Number5',8,1),(6,'Project6','Project Number6',64,0),(7,'Project7','Project Number7',128,0),(8,'Project8','Project Number8',256,0),(9,'Project9','Project Number9',512,0),(10,'Project10','Project Number10',1024,0),(11,'Project11','Project Number11',2048,1),(12,'Project12','Project Number12',4096,1),(13,'Project13','Project Number13',8192,1);
/*!40000 ALTER TABLE `project_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-18 16:23:21
