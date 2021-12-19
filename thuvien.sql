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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
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
INSERT INTO `users` VALUES ('AT150265','C231C34126D7D5DE3589108C387F1957','Cong Vinh','1','ATTT','AT15B',1,'TOKEN','2025-12-18','active'),('AT150266','BE5E9C7BEB5BE86F35ABDD606036B22B','Van Vy','1','ATTT','AT15B',0,'TOKEN','2025-11-25','active');
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

-- Dump completed on 2021-12-19 14:27:19
