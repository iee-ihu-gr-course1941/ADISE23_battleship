-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: battleship3
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.4-MariaDB-1~deb12u1-log

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
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boards` (
  `player` enum('cap1','cap2') NOT NULL,
  `map` varchar(7) NOT NULL,
  `ship` enum('Destroyer','Submarine','Cruiser','Battleship','Carrier') DEFAULT NULL,
  `status` enum('clear','ship','miss','strike') NOT NULL DEFAULT 'clear'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
INSERT INTO `boards` VALUES ('cap1','I1',NULL,'clear'),('cap1','I2',NULL,'clear'),('cap1','I3',NULL,'clear'),('cap1','I4',NULL,'clear'),('cap1','I5',NULL,'clear'),('cap1','I6',NULL,'clear'),('cap1','I7',NULL,'clear'),('cap1','I8',NULL,'clear'),('cap1','I9',NULL,'clear'),('cap1','I10',NULL,'clear'),('cap1','II1',NULL,'clear'),('cap1','II2',NULL,'clear'),('cap1','II3',NULL,'clear'),('cap1','II4',NULL,'clear'),('cap1','II5',NULL,'clear'),('cap1','II6',NULL,'clear'),('cap1','II7',NULL,'clear'),('cap1','II8',NULL,'clear'),('cap1','II9',NULL,'clear'),('cap1','II10',NULL,'clear'),('cap1','III1',NULL,'clear'),('cap1','III2',NULL,'clear'),('cap1','III3',NULL,'clear'),('cap1','III4',NULL,'clear'),('cap1','III5',NULL,'clear'),('cap1','III6',NULL,'clear'),('cap1','III7',NULL,'clear'),('cap1','III8',NULL,'clear'),('cap1','III9',NULL,'clear'),('cap1','III10',NULL,'clear'),('cap1','IV1',NULL,'clear'),('cap1','IV2',NULL,'clear'),('cap1','IV3',NULL,'clear'),('cap1','IV4',NULL,'clear'),('cap1','IV5',NULL,'clear'),('cap1','IV6',NULL,'clear'),('cap1','IV7',NULL,'clear'),('cap1','IV8',NULL,'clear'),('cap1','IV9',NULL,'clear'),('cap1','IV10',NULL,'clear'),('cap1','V1',NULL,'clear'),('cap1','V2',NULL,'clear'),('cap1','V3',NULL,'clear'),('cap1','V4',NULL,'clear'),('cap1','V5',NULL,'clear'),('cap1','V6',NULL,'clear'),('cap1','V7',NULL,'clear'),('cap1','V8',NULL,'clear'),('cap1','V9',NULL,'clear'),('cap1','V10',NULL,'clear'),('cap1','VI1',NULL,'clear'),('cap1','VI2',NULL,'clear'),('cap1','VI3',NULL,'clear'),('cap1','VI4',NULL,'clear'),('cap1','VI5',NULL,'clear'),('cap1','VI6',NULL,'clear'),('cap1','VI7',NULL,'clear'),('cap1','VI8',NULL,'clear'),('cap1','VI9',NULL,'clear'),('cap1','VI10',NULL,'clear'),('cap1','VII1',NULL,'clear'),('cap1','VII2',NULL,'clear'),('cap1','VII3',NULL,'clear'),('cap1','VII4',NULL,'clear'),('cap1','VII5',NULL,'clear'),('cap1','VII6',NULL,'clear'),('cap1','VII7',NULL,'clear'),('cap1','VII8',NULL,'clear'),('cap1','VII9',NULL,'clear'),('cap1','VII10',NULL,'clear'),('cap1','VIII1',NULL,'clear'),('cap1','VIII2',NULL,'clear'),('cap1','VIII3',NULL,'clear'),('cap1','VIII4',NULL,'clear'),('cap1','VIII5',NULL,'clear'),('cap1','VIII6',NULL,'clear'),('cap1','VIII7',NULL,'clear'),('cap1','VIII8',NULL,'clear'),('cap1','VIII9',NULL,'clear'),('cap1','VIII10',NULL,'clear'),('cap1','IX1',NULL,'clear'),('cap1','IX2',NULL,'clear'),('cap1','IX3',NULL,'clear'),('cap1','IX4',NULL,'clear'),('cap1','IX5',NULL,'clear'),('cap1','IX6',NULL,'clear'),('cap1','IX7',NULL,'clear'),('cap1','IX8',NULL,'clear'),('cap1','IX9',NULL,'clear'),('cap1','I10',NULL,'clear'),('cap1','X1',NULL,'clear'),('cap1','X2',NULL,'clear'),('cap1','X3',NULL,'clear'),('cap1','X4',NULL,'clear'),('cap1','X5',NULL,'clear'),('cap1','X6',NULL,'clear'),('cap1','X7',NULL,'clear'),('cap1','X8',NULL,'clear'),('cap1','X9',NULL,'clear'),('cap1','X10',NULL,'clear'),('cap2','I1',NULL,'clear'),('cap2','I2',NULL,'clear'),('cap2','I3',NULL,'clear'),('cap2','I4',NULL,'clear'),('cap2','I5',NULL,'clear'),('cap2','I6',NULL,'clear'),('cap2','I7',NULL,'clear'),('cap2','I8',NULL,'clear'),('cap2','I9',NULL,'clear'),('cap2','I10',NULL,'clear'),('cap2','II1',NULL,'clear'),('cap2','II2',NULL,'clear'),('cap2','II3',NULL,'clear'),('cap2','II4',NULL,'clear'),('cap2','II5',NULL,'clear'),('cap2','II6',NULL,'clear'),('cap2','II7',NULL,'clear'),('cap2','II8',NULL,'clear'),('cap2','II9',NULL,'clear'),('cap2','II10',NULL,'clear'),('cap2','III1',NULL,'clear'),('cap2','III2',NULL,'clear'),('cap2','III3',NULL,'clear'),('cap2','III4',NULL,'clear'),('cap2','III5',NULL,'clear'),('cap2','III6',NULL,'clear'),('cap2','III7',NULL,'clear'),('cap2','III8',NULL,'clear'),('cap2','III9',NULL,'clear'),('cap2','III10',NULL,'clear'),('cap2','IV1',NULL,'clear'),('cap2','IV2',NULL,'clear'),('cap2','IV3',NULL,'clear'),('cap2','IV4',NULL,'clear'),('cap2','IV5',NULL,'clear'),('cap2','IV6',NULL,'clear'),('cap2','IV7',NULL,'clear'),('cap2','IV8',NULL,'clear'),('cap2','IV9',NULL,'clear'),('cap2','IV10',NULL,'clear'),('cap2','V1',NULL,'clear'),('cap2','V2',NULL,'clear'),('cap2','V3',NULL,'clear'),('cap2','V4',NULL,'clear'),('cap2','V5',NULL,'clear'),('cap2','V6',NULL,'clear'),('cap2','V7',NULL,'clear'),('cap2','V8',NULL,'clear'),('cap2','V9',NULL,'clear'),('cap2','V10',NULL,'clear'),('cap2','VI1',NULL,'clear'),('cap2','VI2',NULL,'clear'),('cap2','VI3',NULL,'clear'),('cap2','VI4',NULL,'clear'),('cap2','VI5',NULL,'clear'),('cap2','VI6',NULL,'clear'),('cap2','VI7',NULL,'clear'),('cap2','VI8',NULL,'clear'),('cap2','VI9',NULL,'clear'),('cap2','VI10',NULL,'clear'),('cap2','VII1',NULL,'clear'),('cap2','VII2',NULL,'clear'),('cap2','VII3',NULL,'clear'),('cap2','VII4',NULL,'clear'),('cap2','VII5',NULL,'clear'),('cap2','VII6',NULL,'clear'),('cap2','VII7',NULL,'clear'),('cap2','VII8',NULL,'clear'),('cap2','VII9',NULL,'clear'),('cap2','VII10',NULL,'clear'),('cap2','VIII1',NULL,'clear'),('cap2','VIII2',NULL,'clear'),('cap2','VIII3',NULL,'clear'),('cap2','VIII4',NULL,'clear'),('cap2','VIII5',NULL,'clear'),('cap2','VIII6',NULL,'clear'),('cap2','VIII7',NULL,'clear'),('cap2','VIII8',NULL,'clear'),('cap2','VIII9',NULL,'clear'),('cap2','VIII10',NULL,'clear'),('cap2','IX1',NULL,'clear'),('cap2','IX2',NULL,'clear'),('cap2','IX3',NULL,'clear'),('cap2','IX4',NULL,'clear'),('cap2','IX5',NULL,'clear'),('cap2','IX6',NULL,'clear'),('cap2','IX7',NULL,'clear'),('cap2','IX8',NULL,'clear'),('cap2','IX9',NULL,'clear'),('cap2','IX10',NULL,'clear'),('cap2','X1',NULL,'clear'),('cap2','X2',NULL,'clear'),('cap2','X3',NULL,'clear'),('cap2','X4',NULL,'clear'),('cap2','X5',NULL,'clear'),('cap2','X6',NULL,'clear'),('cap2','X7',NULL,'clear'),('cap2','X8',NULL,'clear'),('cap2','X9',NULL,'clear'),('cap2','X10',NULL,'clear');
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards_clear`
--

DROP TABLE IF EXISTS `boards_clear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boards_clear` (
  `player` enum('cap1','cap2') NOT NULL,
  `map` varchar(7) NOT NULL,
  `ship` enum('Destroyer','Submarine','Cruiser','Battleship','Carrier') DEFAULT NULL,
  `status` enum('clear','ship','miss','strike') NOT NULL DEFAULT 'clear'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards_clear`
--

LOCK TABLES `boards_clear` WRITE;
/*!40000 ALTER TABLE `boards_clear` DISABLE KEYS */;
INSERT INTO `boards_clear` VALUES ('cap1','I1',NULL,'clear'),('cap1','I2',NULL,'clear'),('cap1','I3',NULL,'clear'),('cap1','I4',NULL,'clear'),('cap1','I5',NULL,'clear'),('cap1','I6',NULL,'clear'),('cap1','I7',NULL,'clear'),('cap1','I8',NULL,'clear'),('cap1','I9',NULL,'clear'),('cap1','I10',NULL,'clear'),('cap1','II1',NULL,'clear'),('cap1','II2',NULL,'clear'),('cap1','II3',NULL,'clear'),('cap1','II4',NULL,'clear'),('cap1','II5',NULL,'clear'),('cap1','II6',NULL,'clear'),('cap1','II7',NULL,'clear'),('cap1','II8',NULL,'clear'),('cap1','II9',NULL,'clear'),('cap1','II10',NULL,'clear'),('cap1','III1',NULL,'clear'),('cap1','III2',NULL,'clear'),('cap1','III3',NULL,'clear'),('cap1','III4',NULL,'clear'),('cap1','III5',NULL,'clear'),('cap1','III6',NULL,'clear'),('cap1','III7',NULL,'clear'),('cap1','III8',NULL,'clear'),('cap1','III9',NULL,'clear'),('cap1','III10',NULL,'clear'),('cap1','IV1',NULL,'clear'),('cap1','IV2',NULL,'clear'),('cap1','IV3',NULL,'clear'),('cap1','IV4',NULL,'clear'),('cap1','IV5',NULL,'clear'),('cap1','IV6',NULL,'clear'),('cap1','IV7',NULL,'clear'),('cap1','IV8',NULL,'clear'),('cap1','IV9',NULL,'clear'),('cap1','IV10',NULL,'clear'),('cap1','V1',NULL,'clear'),('cap1','V2',NULL,'clear'),('cap1','V3',NULL,'clear'),('cap1','V4',NULL,'clear'),('cap1','V5',NULL,'clear'),('cap1','V6',NULL,'clear'),('cap1','V7',NULL,'clear'),('cap1','V8',NULL,'clear'),('cap1','V9',NULL,'clear'),('cap1','V10',NULL,'clear'),('cap1','VI1',NULL,'clear'),('cap1','VI2',NULL,'clear'),('cap1','VI3',NULL,'clear'),('cap1','VI4',NULL,'clear'),('cap1','VI5',NULL,'clear'),('cap1','VI6',NULL,'clear'),('cap1','VI7',NULL,'clear'),('cap1','VI8',NULL,'clear'),('cap1','VI9',NULL,'clear'),('cap1','VI10',NULL,'clear'),('cap1','VII1',NULL,'clear'),('cap1','VII2',NULL,'clear'),('cap1','VII3',NULL,'clear'),('cap1','VII4',NULL,'clear'),('cap1','VII5',NULL,'clear'),('cap1','VII6',NULL,'clear'),('cap1','VII7',NULL,'clear'),('cap1','VII8',NULL,'clear'),('cap1','VII9',NULL,'clear'),('cap1','VII10',NULL,'clear'),('cap1','VIII1',NULL,'clear'),('cap1','VIII2',NULL,'clear'),('cap1','VIII3',NULL,'clear'),('cap1','VIII4',NULL,'clear'),('cap1','VIII5',NULL,'clear'),('cap1','VIII6',NULL,'clear'),('cap1','VIII7',NULL,'clear'),('cap1','VIII8',NULL,'clear'),('cap1','VIII9',NULL,'clear'),('cap1','VIII10',NULL,'clear'),('cap1','IX1',NULL,'clear'),('cap1','IX2',NULL,'clear'),('cap1','IX3',NULL,'clear'),('cap1','IX4',NULL,'clear'),('cap1','IX5',NULL,'clear'),('cap1','IX6',NULL,'clear'),('cap1','IX7',NULL,'clear'),('cap1','IX8',NULL,'clear'),('cap1','IX9',NULL,'clear'),('cap1','I10',NULL,'clear'),('cap1','X1',NULL,'clear'),('cap1','X2',NULL,'clear'),('cap1','X3',NULL,'clear'),('cap1','X4',NULL,'clear'),('cap1','X5',NULL,'clear'),('cap1','X6',NULL,'clear'),('cap1','X7',NULL,'clear'),('cap1','X8',NULL,'clear'),('cap1','X9',NULL,'clear'),('cap1','X10',NULL,'clear'),('cap2','I1',NULL,'clear'),('cap2','I2',NULL,'clear'),('cap2','I3',NULL,'clear'),('cap2','I4',NULL,'clear'),('cap2','I5',NULL,'clear'),('cap2','I6',NULL,'clear'),('cap2','I7',NULL,'clear'),('cap2','I8',NULL,'clear'),('cap2','I9',NULL,'clear'),('cap2','I10',NULL,'clear'),('cap2','II1',NULL,'clear'),('cap2','II2',NULL,'clear'),('cap2','II3',NULL,'clear'),('cap2','II4',NULL,'clear'),('cap2','II5',NULL,'clear'),('cap2','II6',NULL,'clear'),('cap2','II7',NULL,'clear'),('cap2','II8',NULL,'clear'),('cap2','II9',NULL,'clear'),('cap2','II10',NULL,'clear'),('cap2','III1',NULL,'clear'),('cap2','III2',NULL,'clear'),('cap2','III3',NULL,'clear'),('cap2','III4',NULL,'clear'),('cap2','III5',NULL,'clear'),('cap2','III6',NULL,'clear'),('cap2','III7',NULL,'clear'),('cap2','III8',NULL,'clear'),('cap2','III9',NULL,'clear'),('cap2','III10',NULL,'clear'),('cap2','IV1',NULL,'clear'),('cap2','IV2',NULL,'clear'),('cap2','IV3',NULL,'clear'),('cap2','IV4',NULL,'clear'),('cap2','IV5',NULL,'clear'),('cap2','IV6',NULL,'clear'),('cap2','IV7',NULL,'clear'),('cap2','IV8',NULL,'clear'),('cap2','IV9',NULL,'clear'),('cap2','IV10',NULL,'clear'),('cap2','V1',NULL,'clear'),('cap2','V2',NULL,'clear'),('cap2','V3',NULL,'clear'),('cap2','V4',NULL,'clear'),('cap2','V5',NULL,'clear'),('cap2','V6',NULL,'clear'),('cap2','V7',NULL,'clear'),('cap2','V8',NULL,'clear'),('cap2','V9',NULL,'clear'),('cap2','V10',NULL,'clear'),('cap2','VI1',NULL,'clear'),('cap2','VI2',NULL,'clear'),('cap2','VI3',NULL,'clear'),('cap2','VI4',NULL,'clear'),('cap2','VI5',NULL,'clear'),('cap2','VI6',NULL,'clear'),('cap2','VI7',NULL,'clear'),('cap2','VI8',NULL,'clear'),('cap2','VI9',NULL,'clear'),('cap2','VI10',NULL,'clear'),('cap2','VII1',NULL,'clear'),('cap2','VII2',NULL,'clear'),('cap2','VII3',NULL,'clear'),('cap2','VII4',NULL,'clear'),('cap2','VII5',NULL,'clear'),('cap2','VII6',NULL,'clear'),('cap2','VII7',NULL,'clear'),('cap2','VII8',NULL,'clear'),('cap2','VII9',NULL,'clear'),('cap2','VII10',NULL,'clear'),('cap2','VIII1',NULL,'clear'),('cap2','VIII2',NULL,'clear'),('cap2','VIII3',NULL,'clear'),('cap2','VIII4',NULL,'clear'),('cap2','VIII5',NULL,'clear'),('cap2','VIII6',NULL,'clear'),('cap2','VIII7',NULL,'clear'),('cap2','VIII8',NULL,'clear'),('cap2','VIII9',NULL,'clear'),('cap2','VIII10',NULL,'clear'),('cap2','IX1',NULL,'clear'),('cap2','IX2',NULL,'clear'),('cap2','IX3',NULL,'clear'),('cap2','IX4',NULL,'clear'),('cap2','IX5',NULL,'clear'),('cap2','IX6',NULL,'clear'),('cap2','IX7',NULL,'clear'),('cap2','IX8',NULL,'clear'),('cap2','IX9',NULL,'clear'),('cap2','IX10',NULL,'clear'),('cap2','X1',NULL,'clear'),('cap2','X2',NULL,'clear'),('cap2','X3',NULL,'clear'),('cap2','X4',NULL,'clear'),('cap2','X5',NULL,'clear'),('cap2','X6',NULL,'clear'),('cap2','X7',NULL,'clear'),('cap2','X8',NULL,'clear'),('cap2','X9',NULL,'clear'),('cap2','X10',NULL,'clear');
/*!40000 ALTER TABLE `boards_clear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'max','$2y$10$yJvs2lfrY1iJyjT9uvV5NuqlZr8wpNPNFknCGxWo1ou0nvL8Dov/6','2024-01-06 23:20:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-11  4:04:50
