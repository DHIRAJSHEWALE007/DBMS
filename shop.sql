-- MySQL dump 10.13  Distrib 5.1.67, for Win32 (ia32)
--
-- Host: localhost    Database: atest
-- ------------------------------------------------------
-- Server version	5.1.67-community

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
-- Table structure for table `client_master`
--

DROP TABLE IF EXISTS `client_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_master` (
  `client_no` varchar(6) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `address1` varchar(30) DEFAULT NULL,
  `address2` varchar(30) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `pincode` int(8) DEFAULT NULL,
  `state` varchar(15) DEFAULT NULL,
  `baldue` int(10) DEFAULT NULL,
  PRIMARY KEY (`client_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_master`
--

LOCK TABLES `client_master` WRITE;
/*!40000 ALTER TABLE `client_master` DISABLE KEYS */;
INSERT INTO `client_master` VALUES ('C00001','IVAN BAYROSS',NULL,NULL,'MUMBAI',400054,'MAHARASHTRA',15000),('C00002','MAMTA MUZUMDAR',NULL,NULL,'MADRAS',780001,'TAMIL NADU',0),('C00003','CHHAYA BANKER',NULL,NULL,'MUMBAI',400057,'MAHARASHTRA',5000),('C00004','ASHWINI JOSHI',NULL,NULL,'BANGALORE',560001,'KARNATAKA',0),('C00005','HANSEL COLACO',NULL,NULL,'MUMBAI',400060,'MAHARASHTRA',2000),('C00006','DIPAK SHARMA',NULL,NULL,'BANGALORE',560050,'KARNATAKA',0);
/*!40000 ALTER TABLE `client_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_master`
--

DROP TABLE IF EXISTS `product_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_master` (
  `PRODUCT_NO` varchar(6) NOT NULL,
  `DESCRIPTION` varchar(15) NOT NULL,
  `PROFITPERSENT` int(4) NOT NULL,
  `UNITMEASURE` varchar(10) NOT NULL,
  `QTYONHAND` int(8) NOT NULL,
  `REORDER_VI` int(8) NOT NULL,
  `SELLPRICE` int(8) NOT NULL,
  `COSTPRICE` int(8) NOT NULL,
  PRIMARY KEY (`PRODUCT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_master`
--

LOCK TABLES `product_master` WRITE;
/*!40000 ALTER TABLE `product_master` DISABLE KEYS */;
INSERT INTO `product_master` VALUES ('P0001','T-SHIRTS',5,'PIECE',200,50,350,250),('P0345','SHIRTS',6,'PIECE',150,50,500,350),('P06734','COTTON JEANS',5,'PIECE',100,20,600,450),('P07865','JEANS',5,'PIECE',100,20,750,500),('P07868','TROUSERS',2,'PIECE',150,50,850,550),('P07885','PULL OVERS',3,'PIECE',80,30,700,450),('P07965','DEIM SHIRTS',4,'PIECE',100,40,350,250),('P07975','LYCRA TOPS',5,'PIECE',70,30,300,175),('P08865','SKIRTS',5,'PIECE',75,30,450,300);
/*!40000 ALTER TABLE `product_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order`
--

DROP TABLE IF EXISTS `sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order` (
  `ORDER_NO` varchar(6) NOT NULL,
  `CLIENT_NO` varchar(6) DEFAULT NULL,
  `ORDER_DATE` date NOT NULL,
  `DELY_ADDR` varchar(25) DEFAULT NULL,
  `SALESMAN_NO` varchar(6) DEFAULT NULL,
  `DELAYTYPE` char(1) DEFAULT 'F',
  `BILLYN` char(1) DEFAULT NULL,
  `DELAY_DATE` date DEFAULT NULL,
  `ORDER_STATUS` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ORDER_NO`),
  KEY `CLIENT_NO` (`CLIENT_NO`),
  KEY `SALESMAN_NO` (`SALESMAN_NO`),
  CONSTRAINT `sales_order_ibfk_1` FOREIGN KEY (`CLIENT_NO`) REFERENCES `client_master` (`client_no`),
  CONSTRAINT `sales_order_ibfk_2` FOREIGN KEY (`SALESMAN_NO`) REFERENCES `salesman_master` (`SALESMAN_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order`
--

LOCK TABLES `sales_order` WRITE;
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
INSERT INTO `sales_order` VALUES ('O19001','C00001','2004-06-12','NASHIK','S00001','F','N','2002-07-20','In Process'),('O19002','C00002','2004-06-25','NASHIK','S00002','P','N','2002-06-27','Cancelled'),('O19003','C00001','2004-04-03','NASHIK','S00001','F','Y','2002-04-07','Fulfilled'),('O19008','C00005','2004-05-24','NASHIK','S00004','F','N','2002-07-26','In Process'),('O46865','C00003','2004-02-18','NASHIK','S00003','F','Y','2002-02-20','Fulfilled'),('O46866','C00004','2004-05-20','NASHIK','S00002','P','N','2002-05-22','Cancelled');
/*!40000 ALTER TABLE `sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_details`
--

DROP TABLE IF EXISTS `sales_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_order_details` (
  `ORDER_NO` varchar(6) DEFAULT NULL,
  `PRODUCT_NO` varchar(6) DEFAULT NULL,
  `QTY_ORDERED` int(8) DEFAULT NULL,
  `QTY_DISP` int(8) DEFAULT NULL,
  `PRODUCT_RATE` float(10,2) DEFAULT NULL,
  KEY `ORDER_NO` (`ORDER_NO`),
  KEY `PRODUCT_NO` (`PRODUCT_NO`),
  CONSTRAINT `sales_order_details_ibfk_1` FOREIGN KEY (`ORDER_NO`) REFERENCES `sales_order` (`ORDER_NO`),
  CONSTRAINT `sales_order_details_ibfk_2` FOREIGN KEY (`PRODUCT_NO`) REFERENCES `product_master` (`PRODUCT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_details`
--

LOCK TABLES `sales_order_details` WRITE;
/*!40000 ALTER TABLE `sales_order_details` DISABLE KEYS */;
INSERT INTO `sales_order_details` VALUES ('O19001','P0001',4,4,525.00),('O19001','P07965',2,1,8400.00),('O19001','P07885',2,1,5250.00),('O19002','P0001',10,0,525.00),('O46865','P07868',3,3,3150.00),('O46865','P07885',3,1,5250.00),('O46865','P0001',10,10,525.00),('O46865','P0345',4,4,1050.00),('O19003','P0345',2,2,1050.00),('O19003','P06734',1,1,12000.00),('O46866','P07965',1,0,8400.00),('O46866','P07975',1,0,1050.00),('O19008','P0001',10,5,525.00),('O19008','P07975',5,3,1050.00);
/*!40000 ALTER TABLE `sales_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesman_master`
--

DROP TABLE IF EXISTS `salesman_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesman_master` (
  `SALESMAN_NO` varchar(6) NOT NULL,
  `SALESMAN_NAME` varchar(20) NOT NULL,
  `ADDRESS1` varchar(30) NOT NULL,
  `ADDRESS2` varchar(30) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `PINCODE` int(8) DEFAULT NULL,
  `STATE` varchar(20) DEFAULT NULL,
  `SALAMT` int(8) NOT NULL,
  `TGTTOGET` int(6) NOT NULL,
  `YTDSALES` int(6) NOT NULL,
  `REMARKS` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`SALESMAN_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesman_master`
--

LOCK TABLES `salesman_master` WRITE;
/*!40000 ALTER TABLE `salesman_master` DISABLE KEYS */;
INSERT INTO `salesman_master` VALUES ('S00001','AMAN','A/14','WORLI','MUMBAI',400002,'MAHARSHTRA',3000,100,50,'GOOD'),('S00002','OMKAR','65','NARIMAN','MUMBAI',400001,'MAHARSHTRA',3000,200,100,'GOOD'),('S00003','RAJ','P-7','BANDRA','MUMBAI',400032,'MAHARSHTRA',3000,200,100,'GOOD'),('S00004','ASHISH','A/5','JUHU','MUMBAI',400044,'MAHARSHTRA',3000,200,150,'GOOD');
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

-- Dump completed on 2024-08-09 14:44:52
