-- MySQL dump 10.13  Distrib 5.7.34, for Linux (x86_64)
--
-- Host: localhost    Database: HR
-- ------------------------------------------------------
-- Server version	5.7.34-0ubuntu0.18.04.1

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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employeeId` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL DEFAULT '',
  `birth` date DEFAULT NULL,
  `phone` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`employeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Slava','1986-08-09','0 723 35 76 88'),(2,'Viktor','1990-06-10','0 724 89 90'),(3,'Elena','1987-01-12','0 727 00 09'),(4,'Jen','1984-06-09','0 788 95 43'),(5,'Sara','1979-09-23','0 790 87 65'),(6,'Fibi','1994-02-02','0 754 89 77'),(7,'Sam','1993-04-13','0 765 88 56'),(8,'Klara','1995-07-01','0 743 13 23'),(9,'Sergey','1986-09-17','0 787 74 23'),(10,'Janifer','1985-04-19','0 722 65 09'),(11,'Franz','1980-01-09','0 790 75 87'),(12,'Ron','1981-03-03','0 775 45 46'),(13,'Alena','1977-08-02','0 764 092 98'),(14,'Ben','1965-05-24','0 766 82 82'),(15,'Mariya','1988-06-21','0 777 87 98'),(16,'Igor','1963-02-13','0 779 872 87'),(17,'Daria','1983-06-30','0 790 678 87'),(18,'Tomas','1989-04-21','0 789 68 890'),(19,'Karolina','1995-03-07','0 798 85 809'),(20,'Roza','1988-01-03','0 753 773 67');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` char(50) DEFAULT NULL,
  `employeeId` int(11) NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `employeeId` (`employeeId`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Sweden, Malmo',3),(2,'Ukraine, Kiev',5),(3,'Denmark, Herning',7),(4,'Russia, Arkhangelsk',20),(5,'Finland, Kotka',18),(6,'Japan, Akita',15),(7,'France, Marseilles',13),(8,'Germany, Hamburg',9),(9,'England, Bristol',10),(10,'Romania, Bucharest',4),(11,'Macedonia, Bitola',6),(12,'India, Delhi',11),(13,'Serbia, Belgrade',1),(14,'Switzerland, Geneva',2),(15,'Mexico, Leon',8),(17,'Peru, Lima',12),(18,'Portugal, Ageda',14),(19,'Estonia, Valga',16),(20,'Nepal, Kathmandu',17);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-27 12:44:36

-- new_world database

-- 1. What are the names of countries with population greater than 8 million?

SELECT Name FROM country WHERE Population > 8000000;

-- 2. What are the names of countries that have “land” in their names ?

SELECT Name FROM country WHERE name REGEXP 'land';

-- 3. What are the names of the cities with population in between 500,000 and 1 million ?

SELECT Name FROM city WHERE population BETWEEN 500000 AND 1000000;

--4. What's the name of all the countries on the continent ‘Europe’ ?

SELECT NAME FROM country WHERE Continent = 'Europe';

--5. List all the countries in the descending order of their surface areas.

SELECT NAME FROM country ORDER BY SurfaceArea DESC;

--6. What are the names of all the cities in the Netherlands?

SELECT city.Name FROM city JOIN country ON country.Code = city.CountryCode WHERE country.Name = 'Netherlands';

--7. What is the population of Rotterdam ?

SELECT Population From city WHERE Name = 'Rotterdam';

--8. What's the top 10 countries by Surface Area ?

SELECT Name FROM country ORDER BY SurfaceArea DESC LIMIT 10;

--9. What's the top 10 most populated cities?

SELECT Name FROM city ORDER BY population DESC LIMIT 10;

--10. What is the population of the world ?

SELECT SUM(Population) FROM country;




