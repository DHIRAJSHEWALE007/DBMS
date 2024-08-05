-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client_master`
--

DROP TABLE IF EXISTS `client_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_master` (
  `CLIENT_NO` varchar(6) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `ADDRESS1` varchar(30) DEFAULT NULL,
  `ADDRESS2` varchar(30) DEFAULT NULL,
  `CITY` varchar(15) DEFAULT NULL,
  `PINCODE` int DEFAULT NULL,
  `STATE` varchar(15) DEFAULT NULL,
  `BALDUE` int DEFAULT NULL,
  PRIMARY KEY (`CLIENT_NO`),
  CONSTRAINT `client_master_chk_1` CHECK ((`CLIENT_NO` like _cp850'C%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_master`
--

LOCK TABLES `client_master` WRITE;
/*!40000 ALTER TABLE `client_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_master`
--

DROP TABLE IF EXISTS `product_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_master` (
  `PRODUCT_NO` varchar(6) NOT NULL,
  `DESCRIPTION` varchar(15) NOT NULL,
  `PROFITPERSCENT` int NOT NULL,
  `UNITMEASURE` varchar(10) NOT NULL,
  `QTYONHAND` int NOT NULL,
  `RECORDERLVL` int NOT NULL,
  `SELLPRICE` int NOT NULL,
  `COSTPRICE` int NOT NULL,
  PRIMARY KEY (`PRODUCT_NO`),
  CONSTRAINT `product_master_chk_1` CHECK ((`PRODUCT_NO` like _cp850'P%')),
  CONSTRAINT `product_master_chk_2` CHECK ((`SELLPRICE` <> 0)),
  CONSTRAINT `product_master_chk_3` CHECK ((`COSTPRICE` <> 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_master`
--

LOCK TABLES `product_master` WRITE;
/*!40000 ALTER TABLE `product_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order`
--

DROP TABLE IF EXISTS `sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order` (
  `ORDER_NO` varchar(6) NOT NULL,
  `CLIENT_NO` varchar(6) DEFAULT NULL,
  `ORDER_DATE` date NOT NULL,
  `DELY_ADDR` varchar(25) DEFAULT NULL,
  `SALESMAN_NO` varchar(6) DEFAULT NULL,
  `DELYTYPE` char(1) DEFAULT 'F',
  `BILLYN` char(1) DEFAULT NULL,
  `DELYDATE` date DEFAULT NULL,
  `ORDERSTATUS` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ORDER_NO`),
  KEY `SALESMAN_NO` (`SALESMAN_NO`),
  KEY `CLIENT_NO` (`CLIENT_NO`),
  CONSTRAINT `sales_order_ibfk_1` FOREIGN KEY (`SALESMAN_NO`) REFERENCES `salesman_master` (`SALESMAN_NO`),
  CONSTRAINT `sales_order_ibfk_2` FOREIGN KEY (`CLIENT_NO`) REFERENCES `client_master` (`CLIENT_NO`),
  CONSTRAINT `sales_order_chk_1` CHECK ((`ORDER_NO` like _cp850'O%')),
  CONSTRAINT `sales_order_chk_2` CHECK ((`DELYDATE` > `ORDER_DATE`)),
  CONSTRAINT `sales_order_chk_3` CHECK ((`ORDERSTATUS` in (_cp850'InProcess',_cp850'Fulfilled',_cp850'BackOrder',_cp850'Cancelled'))),
  CONSTRAINT `sales_order_chk_4` CHECK ((`DELYTYPE` in (_cp850'P',_cp850'F')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order`
--

LOCK TABLES `sales_order` WRITE;
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_details`
--

DROP TABLE IF EXISTS `sales_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_details` (
  `ORDER_NO` varchar(6) DEFAULT NULL,
  `PRODUCT_NO` varchar(6) DEFAULT NULL,
  `QTYORDERED` int DEFAULT NULL,
  `QTYDISP` int DEFAULT NULL,
  `PRODUCTRATE` int DEFAULT NULL,
  KEY `PRODUCT_NO` (`PRODUCT_NO`),
  KEY `ORDER_NO` (`ORDER_NO`),
  CONSTRAINT `sales_order_details_ibfk_1` FOREIGN KEY (`PRODUCT_NO`) REFERENCES `product_master` (`PRODUCT_NO`),
  CONSTRAINT `sales_order_details_ibfk_2` FOREIGN KEY (`ORDER_NO`) REFERENCES `sales_order` (`ORDER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_details`
--

LOCK TABLES `sales_order_details` WRITE;
/*!40000 ALTER TABLE `sales_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesman_master`
--

DROP TABLE IF EXISTS `salesman_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesman_master` (
  `SALESMAN_NO` varchar(6) NOT NULL,
  `SALESMAN_NAME` varchar(20) NOT NULL,
  `ADDRESS1` varchar(30) NOT NULL,
  `ADDRESS2` varchar(30) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `PINCODE` int DEFAULT NULL,
  `STATE` varchar(20) DEFAULT NULL,
  `SALAMT` int NOT NULL,
  `TGTTOGET` int NOT NULL,
  `YTDSALES` int NOT NULL,
  `REMARKS` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`SALESMAN_NO`),
  CONSTRAINT `salesman_master_chk_1` CHECK ((`SALESMAN_NO` like _cp850'S%')),
  CONSTRAINT `salesman_master_chk_2` CHECK ((`SALAMT` <> 0)),
  CONSTRAINT `salesman_master_chk_3` CHECK ((`TGTTOGET` <> 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesman_master`
--

LOCK TABLES `salesman_master` WRITE;
/*!40000 ALTER TABLE `salesman_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesman_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-05 11:31:07
