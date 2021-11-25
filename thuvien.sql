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
  `status` varchar(10) NOT NULL DEFAULT 'wait',
  `BorrowDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `StudentID` (`StudentID`),
  KEY `DocumentID` (`DocumentID`),
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `users` (`StudentID`),
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`DocumentID`) REFERENCES `document` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES (1,'AT150265','100001','return','2021-11-25','2021-11-25'),(2,'AT150265','100002','cancel',NULL,NULL),(3,'AT150265','100022','cancel',NULL,NULL),(4,'AT150265','100023','cancel',NULL,NULL),(5,'AT150265','100011','cancel',NULL,NULL),(6,'AT150265','100012','cancel',NULL,NULL),(7,'AT150265','100013','cancel',NULL,NULL),(8,'AT150265','100001','cancel',NULL,NULL),(9,'AT150265','100001','return','2021-11-25','2021-11-25'),(10,'AT150265','100011','return','2021-11-25','2021-11-25'),(11,'AT150265','100011','return','2021-11-25','2021-11-25'),(14,'AT150265','100011','cancel',NULL,NULL),(15,'AT150265','100011','return','2021-11-25','2021-11-25'),(16,'AT150265','100022','cancel',NULL,NULL),(17,'AT150265','100023','cancel',NULL,NULL);
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
  `ID` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('1','Toán học',''),('10','Khác',''),('2','Vật lý học',''),('3','Hoá học',''),('4','Công nghệ Thông tin',''),('5','Mật mã',''),('6','Kiến trúc máy tính',''),('7','An Toàn Thông Tin',''),('8','Điện tử viễn thông',''),('9','Triết học','');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_documents`
--

DROP TABLE IF EXISTS `category_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_documents` (
  `CategoryID` varchar(20) NOT NULL,
  `DocumentsID` varchar(20) NOT NULL,
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
INSERT INTO `category_documents` VALUES ('4','1'),('5','2'),('6','3');
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
  `DocumentsID` varchar(20) NOT NULL,
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
INSERT INTO `document` VALUES ('100001','1',1,'available'),('100002','1',1,'available'),('100003','1',1,'available'),('100004','1',1,'available'),('100005','1',1,'available'),('100006','1',1,'available'),('100007','1',1,'available'),('100008','1',1,'available'),('100009','1',1,'available'),('100010','1',1,'available'),('100011','2',1,'available'),('100012','2',1,'available'),('100013','2',1,'available'),('100014','2',1,'available'),('100015','2',1,'available'),('100016','2',1,'available'),('100017','2',1,'available'),('100018','2',1,'available'),('100019','2',1,'available'),('100020','2',1,'available'),('100021','2',1,'available'),('100022','3',1,'available'),('100023','3',1,'available'),('100024','3',1,'available'),('100025','3',1,'available'),('100026','3',1,'available'),('100027','3',1,'available'),('100028','3',1,'available'),('100029','3',1,'available'),('100030','3',1,'available'),('100031','3',1,'available');
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `ID` varchar(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Author` varchar(50) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES ('1','Phân tích thiết kế hệ thống','Công Vĩnh',NULL),('2','Lý thuyết mật mã','Bá Long',NULL),('3','An toàn Hệ điều hành','Văn Vỹ',NULL),('4','Lý thuyết Cơ sở dữ liệu','actvn',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'AT250265','Test','test','2021-11-25'),(2,'AT250265','Delete User','AT150202','2021-11-25'),(3,'AT250265','Delete User','AT150201','2021-11-25'),(4,'AT150265','Login Success!','App','2021-11-25'),(5,'AT150265','Cancel Borrow','14','2021-11-25'),(6,'AT150265','Borrow Document','15','2021-11-25'),(7,'AT150265','Confirm Borrow','15','2021-11-25'),(8,'AT150265','Return Document','15','2021-11-25'),(9,'AT150265','Delete User','AT150267','2021-11-25'),(14,'AT150265','Delete User','AT1502068','2021-11-25'),(15,'AT150201','Create User','AT150201','2021-11-25'),(16,'AT150265','Delete User','AT150201','2021-11-25'),(17,'AT150201','Create User','AT150201','2021-11-25'),(18,'AT150265','Delete User','AT150201','2021-11-25'),(19,'AT150265','Disable User','AT150265','2021-11-25'),(20,'AT150266','Disable User','AT150265','2021-11-25'),(21,'AT150265','Disable User','AT150266','2021-11-25'),(22,'AT150265','Disable User','AT150266','2021-11-25'),(23,'AT150265','Borrow Document','16','2021-11-25'),(24,'AT150265','Borrow Document','17','2021-11-25'),(25,'AT150265','Cancel Borrow','16','2021-11-25'),(26,'AT150265','Cancel Borrow','17','2021-11-25');
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
  `Token` varchar(20) NOT NULL,
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
INSERT INTO `users` VALUES ('AT150265','C231C34126D7D5DE3589108C387F1957','Nguyễn Công Vĩnh',NULL,'ATTT','AT15B',1,'ge5hVuNgksZDmuo6bA3P','2021-11-30','active'),('AT150266','BE5E9C7BEB5BE86F35ABDD606036B22B','Nguyễn Văn Vỹ','1','ATTT','AT15B',1,'spq9fjizYQCYgMzpXUmk','2025-11-25','active');
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
-- Temporary view structure for view `users_without_password`
--

DROP TABLE IF EXISTS `users_without_password`;
/*!50001 DROP VIEW IF EXISTS `users_without_password`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `users_without_password` AS SELECT 
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
/*!50001 VIEW `documents_quantity` AS select `documents`.`ID` AS `ID`,`documents`.`Name` AS `Name`,`documents`.`Author` AS `Author`,`documents`.`Description` AS `Description`,count(`document`.`DocumentsID`) AS `Available` from (`documents` left join `document` on(((`document`.`DocumentsID` = `documents`.`ID`) and (`document`.`Status` = 'available')))) group by `documents`.`ID` */;
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
/*!50001 VIEW `users_hide` AS select `users`.`StudentID` AS `StudentID`,`users`.`FullName` AS `FullName`,`users`.`PhoneNumber` AS `PhoneNumber`,`users`.`Specialization` AS `Specialization`,`users`.`Class` AS `Class`,`users`.`Admin` AS `Admin`,`users`.`Expiry` AS `Expiry`,`users`.`Status` AS `Status` from `users` where (`users`.`Status` = 'active') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_without_password`
--

/*!50001 DROP VIEW IF EXISTS `users_without_password`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ncvinh`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `users_without_password` AS select `users`.`StudentID` AS `StudentID`,`users`.`FullName` AS `FullName`,`users`.`PhoneNumber` AS `PhoneNumber`,`users`.`Specialization` AS `Specialization`,`users`.`Class` AS `Class`,`users`.`Admin` AS `Admin`,`users`.`Token` AS `Token`,`users`.`Expiry` AS `Expiry`,`users`.`Status` AS `Status` from `users` where (`users`.`Status` = 'active') */;
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

-- Dump completed on 2021-11-25 10:32:44
