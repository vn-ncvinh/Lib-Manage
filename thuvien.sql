-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: thuvien
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `StudentID` varchar(20) NOT NULL,
  `DocumentID` varchar(20) NOT NULL,
  `NameDocument` varchar(45) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'wait',
  `BorrowingTime` int DEFAULT NULL,
  `BorrowDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentID` (`StudentID`),
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `users` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES (1,'AT150266','100001','Sach 1','return',14,'2021-12-19','2021-12-19'),(2,'AT150266','1000035','Sach 3','cancel',14,NULL,NULL),(3,'AT150266','100001','Sach 1','return',14,'2021-12-19','2021-12-19'),(4,'AT150266','1000035','Sach 3','cancel',14,NULL,NULL),(5,'AT150266','1000040','Sach 4','cancel',14,NULL,NULL),(6,'AT150266','1000046','Sach 5','return',14,'2021-12-19','2021-12-19'),(7,'AT150266','1000040','Sach 4','lose',14,'2021-12-19','2021-12-19'),(8,'AT150266','1000047','Sach 5','return',14,'2021-12-19','2021-12-19'),(9,'AT150266','100001','Sach 1','cancel',14,NULL,NULL);
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `borrowtrend`
--

DROP TABLE IF EXISTS `borrowtrend`;
/*!50001 DROP VIEW IF EXISTS `borrowtrend`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `borrowtrend` AS SELECT 
 1 AS `ID`,
 1 AS `Name`,
 1 AS `Author`,
 1 AS `Description`,
 1 AS `Quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `borrowtrendspecialization`
--

DROP TABLE IF EXISTS `borrowtrendspecialization`;
/*!50001 DROP VIEW IF EXISTS `borrowtrendspecialization`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `borrowtrendspecialization` AS SELECT 
 1 AS `ID`,
 1 AS `Name`,
 1 AS `Author`,
 1 AS `Description`,
 1 AS `Quantity`,
 1 AS `Specialization`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Toán học',''),(2,'Vật lý học',''),(3,'Hoá học',''),(4,'Công nghệ Thông tin',''),(5,'Mật mã',''),(6,'Kiến trúc máy tính',''),(7,'An Toàn Thông Tin',''),(8,'Điện tử viễn thông',''),(9,'Triết học',''),(10,'Khác','');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_documents`
--

DROP TABLE IF EXISTS `category_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_documents` (
  `CategoryID` int NOT NULL,
  `DocumentsID` int NOT NULL,
  PRIMARY KEY (`CategoryID`,`DocumentsID`),
  KEY `DocumentsID` (`DocumentsID`),
  CONSTRAINT `category_documents_ibfk_1` FOREIGN KEY (`DocumentsID`) REFERENCES `documents` (`ID`),
  CONSTRAINT `category_documents_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_documents`
--

LOCK TABLES `category_documents` WRITE;
/*!40000 ALTER TABLE `category_documents` DISABLE KEYS */;
INSERT INTO `category_documents` VALUES (1,2),(3,2),(1,3),(3,3),(1,4),(3,4),(2,5),(4,5),(2,6),(4,6),(1,7);
/*!40000 ALTER TABLE `category_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `category_quantity`
--

DROP TABLE IF EXISTS `category_quantity`;
/*!50001 DROP VIEW IF EXISTS `category_quantity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `category_quantity` AS SELECT 
 1 AS `ID`,
 1 AS `Name`,
 1 AS `Description`,
 1 AS `Available`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `ID` varchar(20) NOT NULL,
  `DocumentsID` int NOT NULL,
  `Reprint` int DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'available',
  PRIMARY KEY (`ID`),
  KEY `DocumentsID` (`DocumentsID`),
  CONSTRAINT `document_ibfk_1` FOREIGN KEY (`DocumentsID`) REFERENCES `documents` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES ('100001',2,1,'available'),('1000010',2,1,'available'),('1000011',2,1,'available'),('1000012',2,1,'available'),('1000013',2,1,'available'),('1000014',2,1,'available'),('1000015',2,1,'available'),('1000016',2,1,'available'),('1000017',2,1,'available'),('1000018',2,1,'available'),('1000019',3,1,'available'),('100002',2,1,'available'),('1000020',3,1,'available'),('1000021',3,1,'available'),('1000022',3,1,'available'),('1000023',3,1,'available'),('1000024',3,1,'available'),('1000025',3,1,'available'),('1000026',3,1,'available'),('1000027',3,1,'available'),('1000028',3,1,'available'),('1000029',3,1,'available'),('100003',2,1,'available'),('1000030',3,1,'available'),('1000031',3,1,'available'),('1000032',3,1,'available'),('1000033',3,1,'available'),('1000034',3,1,'available'),('1000035',4,1,'available'),('1000036',4,1,'available'),('1000037',4,1,'available'),('1000038',4,1,'available'),('1000039',4,1,'available'),('100004',2,1,'available'),('1000041',5,1,'available'),('1000042',5,1,'available'),('1000043',5,1,'available'),('1000044',5,1,'available'),('1000045',5,1,'available'),('1000046',6,1,'available'),('1000047',6,1,'available'),('1000048',6,1,'available'),('1000049',6,1,'available'),('100005',2,1,'available'),('1000050',6,1,'available'),('1000051',6,1,'available'),('1000052',6,1,'available'),('100006',3,1,'available'),('100007',4,1,'available');
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Author` varchar(50) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (2,'Sach 1','actvn','Noi dung 1','1,3'),(3,'Sach 2','actvn','Noi dung 2','1,3'),(4,'Sach 3','actvn','Noi dung 3','1,3'),(5,'Sach 4','actvn','Noi dung 4','2,4'),(6,'Sach 5','actvn','Noi dung 5','2,4'),(7,'Book 1','ncv','Sach','1');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `documents_quantity`
--

DROP TABLE IF EXISTS `documents_quantity`;
/*!50001 DROP VIEW IF EXISTS `documents_quantity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `documents_quantity` AS SELECT 
 1 AS `ID`,
 1 AS `Name`,
 1 AS `Author`,
 1 AS `Description`,
 1 AS `Category`,
 1 AS `Available`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Source` varchar(45) DEFAULT NULL,
  `Content` varchar(100) DEFAULT NULL,
  `Destination` varchar(45) DEFAULT NULL,
  `Time` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (41,'AT150265','Logged in successfully!','App','2021-12-19'),(42,'AT150265','Extend','AT150266','2021-12-19'),(43,'AT150265','Logout!','App','2021-12-19'),(44,'AT150266','Logged in successfully!','App','2021-12-19'),(45,'AT150266','Logout!','App','2021-12-19'),(46,'AT150265','Logged in successfully!','App','2021-12-19'),(47,'AT150265','Add Documents!','2','2021-12-19'),(48,'AT150265','Add Documents!','3','2021-12-19'),(49,'AT150265','Add Documents!','4','2021-12-19'),(50,'AT150265','Add Documents!','5','2021-12-19'),(51,'AT150265','Add Documents!','6','2021-12-19'),(52,'AT150265','Add Document!','100001','2021-12-19'),(53,'AT150265','Add Document!','100002','2021-12-19'),(54,'AT150265','Add Document!','100003','2021-12-19'),(55,'AT150265','Add Document!','100004','2021-12-19'),(56,'AT150265','Add Document!','100005','2021-12-19'),(57,'AT150265','Add Document!','100006','2021-12-19'),(58,'AT150265','Add Document!','100007','2021-12-19'),(59,'AT150265','Add Document!','1000010','2021-12-19'),(60,'AT150265','Add Document!','1000011','2021-12-19'),(61,'AT150265','Add Document!','1000012','2021-12-19'),(62,'AT150265','Add Document!','1000013','2021-12-19'),(63,'AT150265','Add Document!','1000014','2021-12-19'),(64,'AT150265','Add Document!','1000015','2021-12-19'),(65,'AT150265','Add Document!','1000016','2021-12-19'),(66,'AT150265','Add Document!','1000017','2021-12-19'),(67,'AT150265','Add Document!','1000018','2021-12-19'),(68,'AT150265','Add Document!','1000019','2021-12-19'),(69,'AT150265','Add Document!','1000020','2021-12-19'),(70,'AT150265','Add Document!','1000021','2021-12-19'),(71,'AT150265','Add Document!','1000022','2021-12-19'),(72,'AT150265','Add Document!','1000023','2021-12-19'),(73,'AT150265','Add Document!','1000024','2021-12-19'),(74,'AT150265','Add Document!','1000025','2021-12-19'),(75,'AT150265','Add Document!','1000026','2021-12-19'),(76,'AT150265','Add Document!','1000027','2021-12-19'),(77,'AT150265','Add Document!','1000028','2021-12-19'),(78,'AT150265','Add Document!','1000029','2021-12-19'),(79,'AT150265','Add Document!','1000030','2021-12-19'),(80,'AT150265','Add Document!','1000031','2021-12-19'),(81,'AT150265','Add Document!','1000032','2021-12-19'),(82,'AT150265','Add Document!','1000033','2021-12-19'),(83,'AT150265','Add Document!','1000034','2021-12-19'),(84,'AT150265','Add Document!','1000035','2021-12-19'),(85,'AT150265','Add Document!','1000036','2021-12-19'),(86,'AT150265','Add Document!','1000037','2021-12-19'),(87,'AT150265','Add Document!','1000038','2021-12-19'),(88,'AT150265','Add Document!','1000039','2021-12-19'),(89,'AT150265','Add Document!','1000040','2021-12-19'),(90,'AT150265','Add Document!','1000041','2021-12-19'),(91,'AT150265','Add Document!','1000042','2021-12-19'),(92,'AT150265','Add Document!','1000043','2021-12-19'),(93,'AT150265','Add Document!','1000044','2021-12-19'),(94,'AT150265','Add Document!','1000045','2021-12-19'),(95,'AT150265','Add Document!','1000046','2021-12-19'),(96,'AT150265','Add Document!','1000047','2021-12-19'),(97,'AT150265','Add Document!','1000048','2021-12-19'),(98,'AT150265','Add Document!','1000049','2021-12-19'),(99,'AT150265','Add Document!','1000050','2021-12-19'),(100,'AT150265','Add Document!','1000051','2021-12-19'),(101,'AT150265','Add Document!','1000052','2021-12-19'),(102,'AT150265','Logout!','App','2021-12-19'),(103,'AT150266','Logged in successfully!','App','2021-12-19'),(104,'AT150266','Logged in successfully!','App','2021-12-19'),(105,'AT150266','Logged in successfully!','App','2021-12-19'),(106,'AT150266','Borrow Document','1','2021-12-19'),(107,'AT150266','Logout!','App','2021-12-19'),(108,'AT150266','Logged in successfully!','App','2021-12-19'),(109,'AT150266','Borrow Document','2','2021-12-19'),(110,'AT150266','Cancel Borrow','2','2021-12-19'),(111,'AT150266','Logout!','App','2021-12-19'),(112,'AT150266','Logged in successfully!','App','2021-12-19'),(113,'AT150266','Logout!','App','2021-12-19'),(114,'AT150266','Logged in successfully!','App','2021-12-19'),(115,'AT150266','Logout!','App','2021-12-19'),(116,'AT150266','Logged in successfully!','App','2021-12-19'),(117,'AT150266','Logout!','App','2021-12-19'),(118,'AT150265','Logged in successfully!','App','2021-12-19'),(119,'AT150265','Change password!','AT150265','2021-12-19'),(120,'AT150265','Logged in successfully!','App','2021-12-19'),(121,'AT150265','Confirm Borrow','1','2021-12-19'),(122,'AT150265','Return Document','1','2021-12-19'),(123,'AT150265','Logout!','App','2021-12-19'),(124,'AT150265','Logged in successfully!','App','2021-12-19'),(125,'AT150265','Logout!','App','2021-12-19'),(126,'AT150265','Logged in successfully!','App','2021-12-19'),(127,'AT150265','Logged in successfully!','App','2021-12-19'),(128,'AT150266','Logged in successfully!','App','2021-12-19'),(129,'AT150266','Borrow Document','3','2021-12-19'),(130,'AT150265','Logout!','App','2021-12-19'),(131,'AT150266','Logout!','App','2021-12-19'),(132,'AT150266','Logged in successfully!','App','2021-12-19'),(133,'AT150265','Logged in successfully!','App','2021-12-19'),(134,'AT150265','Confirm Borrow','3','2021-12-19'),(135,'AT150265','Logout!','App','2021-12-19'),(136,'AT150266','Logout!','App','2021-12-19'),(137,'AT150265','Logged in successfully!','App','2021-12-19'),(138,'AT150266','Logged in successfully!','App','2021-12-19'),(139,'AT150266','Borrow Document','4','2021-12-19'),(140,'AT150265','Logout!','App','2021-12-19'),(141,'AT150266','Cancel Borrow','4','2021-12-19'),(142,'AT150266','Logout!','App','2021-12-19'),(143,'AT150266','Logged in successfully!','App','2021-12-19'),(144,'AT150266','Borrow Document','5','2021-12-19'),(145,'AT150266','Logout!','App','2021-12-19'),(146,'AT150266','Logged in successfully!','App','2021-12-19'),(147,'AT150266','Cancel Borrow','5','2021-12-19'),(148,'AT150266','Logout!','App','2021-12-19'),(149,'AT150266','Logged in successfully!','App','2021-12-19'),(150,'AT150266','Logout!','App','2021-12-19'),(151,'AT150266','Logged in successfully!','App','2021-12-19'),(152,'AT150266','Change password!','AT150266','2021-12-19'),(153,'AT150266','Logged in successfully!','App','2021-12-19'),(154,'AT150265','Logged in successfully!','App','2021-12-19'),(155,'AT150265','Return Document','3','2021-12-19'),(156,'AT150266','Borrow Document','6','2021-12-19'),(157,'AT150266','Borrow Document','7','2021-12-19'),(158,'AT150266','Borrow Document','8','2021-12-19'),(159,'AT150265','Confirm Borrow','7','2021-12-19'),(160,'AT150265','AT150266 - Lose Document','7','2021-12-19'),(161,'AT150265','Confirm Borrow','6','2021-12-19'),(162,'AT150265','Confirm Borrow','8','2021-12-19'),(163,'AT150265','Return Document','6','2021-12-19'),(164,'AT150265','Add Documents!','7','2021-12-19'),(165,'AT150266','Logout!','App','2021-12-19'),(166,'AT150265','Logout!','App','2021-12-19'),(167,'AT150265','Logged in successfully!','App','2021-12-19'),(168,'AT150266','Logged in successfully!','App','2021-12-19'),(169,'AT150265','Return Document','8','2021-12-19'),(170,'AT150266','Borrow Document','9','2021-12-19'),(171,'AT150266','Cancel Borrow','9','2021-12-19'),(172,'AT150266','Logout!','App','2021-12-19'),(173,'AT150265','Extend','AT150266','2021-12-19'),(174,'AT150265','Extend','AT150266','2021-12-19'),(175,'AT150265','Disable User','AT150266','2021-12-19'),(176,'AT150265','Active User','AT150266','2021-12-19'),(177,'AT150265','Update User','AT150266','2021-12-19'),(178,'AT150265','Update User','AT150266','2021-12-19'),(179,'AT150265','Logged in successfully!','App','2021-12-19'),(180,'AT150265','Update User','AT150266','2021-12-19'),(181,'AT150233','Create User','AT150233','2021-12-19'),(182,'AT150265','Logout!','App','2021-12-19');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `StudentID` varchar(10) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Specialization` varchar(10) NOT NULL,
  `Class` varchar(10) NOT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT '0',
  `Token` varchar(30) NOT NULL,
  `Expiry` date NOT NULL,
  `Status` varchar(10) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('AT150233','C44743F329437846CD389357F9994F2F','Ba Long','1','ATTT','AT15B',1,'TOKEN','2025-12-19','active'),('AT150265','1808C34F08D41508C9AAF3E4EE241D48','Cong Vinh','1','ATTT','AT15B',1,'TOKEN','2025-12-18','active'),('AT150266','DDCA97F22636598938B1C091ABF5C986','Van Vy','1','ATTT','AT15B',1,'TOKEN','2022-12-19','active');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `users_hide`
--

DROP TABLE IF EXISTS `users_hide`;
/*!50001 DROP VIEW IF EXISTS `users_hide`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `users_hide` AS SELECT 
 1 AS `StudentID`,
 1 AS `FullName`,
 1 AS `PhoneNumber`,
 1 AS `Specialization`,
 1 AS `Class`,
 1 AS `Admin`,
 1 AS `Expiry`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `users_hide_password`
--

DROP TABLE IF EXISTS `users_hide_password`;
/*!50001 DROP VIEW IF EXISTS `users_hide_password`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `users_hide_password` AS SELECT 
 1 AS `StudentID`,
 1 AS `FullName`,
 1 AS `PhoneNumber`,
 1 AS `Specialization`,
 1 AS `Class`,
 1 AS `Admin`,
 1 AS `Token`,
 1 AS `Expiry`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `borrowtrend`
--

/*!50001 DROP VIEW IF EXISTS `borrowtrend`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ncvinh`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `borrowtrend` AS select `documents`.`ID` AS `ID`,`documents`.`Name` AS `Name`,`documents`.`Author` AS `Author`,`documents`.`Description` AS `Description`,count(`borrow`.`DocumentID`) AS `Quantity` from (((`documents` join `document`) join `borrow`) join `users`) where ((`document`.`ID` = `borrow`.`DocumentID`) and (`document`.`DocumentsID` = `documents`.`ID`) and ((`borrow`.`status` = 'borrowed') or (`borrow`.`status` = 'return')) and (`borrow`.`StudentID` = `users`.`StudentID`)) group by `documents`.`ID` order by `Quantity` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `borrowtrendspecialization`
--

/*!50001 DROP VIEW IF EXISTS `borrowtrendspecialization`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ncvinh`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `borrowtrendspecialization` AS select `documents`.`ID` AS `ID`,`documents`.`Name` AS `Name`,`documents`.`Author` AS `Author`,`documents`.`Description` AS `Description`,count(`borrow`.`DocumentID`) AS `Quantity`,`users`.`Specialization` AS `Specialization` from (((`documents` join `document`) join `borrow`) join `users`) where ((`document`.`ID` = `borrow`.`DocumentID`) and (`document`.`DocumentsID` = `documents`.`ID`) and ((`borrow`.`status` = 'borrowed') or (`borrow`.`status` = 'return')) and (`borrow`.`StudentID` = `users`.`StudentID`)) group by `documents`.`ID`,`users`.`Specialization` order by `Quantity` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `category_quantity`
--

/*!50001 DROP VIEW IF EXISTS `category_quantity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ncvinh`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `category_quantity` AS select `category`.`ID` AS `ID`,`category`.`Name` AS `Name`,`category`.`Description` AS `Description`,count(`category_documents`.`DocumentsID`) AS `Available` from (`category` left join `category_documents` on((`category`.`ID` = `category_documents`.`CategoryID`))) group by `category`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `documents_quantity`
--

/*!50001 DROP VIEW IF EXISTS `documents_quantity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ncvinh`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `documents_quantity` AS select `documents`.`ID` AS `ID`,`documents`.`Name` AS `Name`,`documents`.`Author` AS `Author`,`documents`.`Description` AS `Description`,`documents`.`Category` AS `Category`,count(`document`.`DocumentsID`) AS `Available` from (`documents` left join `document` on(((`document`.`DocumentsID` = `documents`.`ID`) and (`document`.`Status` = 'available')))) group by `documents`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_hide`
--

/*!50001 DROP VIEW IF EXISTS `users_hide`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ncvinh`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `users_hide` AS select `users`.`StudentID` AS `StudentID`,`users`.`FullName` AS `FullName`,`users`.`PhoneNumber` AS `PhoneNumber`,`users`.`Specialization` AS `Specialization`,`users`.`Class` AS `Class`,`users`.`Admin` AS `Admin`,`users`.`Expiry` AS `Expiry`,`users`.`Status` AS `Status` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_hide_password`
--

/*!50001 DROP VIEW IF EXISTS `users_hide_password`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ncvinh`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `users_hide_password` AS select `users`.`StudentID` AS `StudentID`,`users`.`FullName` AS `FullName`,`users`.`PhoneNumber` AS `PhoneNumber`,`users`.`Specialization` AS `Specialization`,`users`.`Class` AS `Class`,`users`.`Admin` AS `Admin`,`users`.`Token` AS `Token`,`users`.`Expiry` AS `Expiry`,`users`.`Status` AS `Status` from `users` where (`users`.`Status` = 'active') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-19 20:00:34
