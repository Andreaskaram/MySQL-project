CREATE DATABASE  IF NOT EXISTS `projectdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projectdb`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: projectdb
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `AlbumID` int NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `ArtistID` int NOT NULL,
  `GenreID` int NOT NULL,
  `CompanyID` int NOT NULL,
  `ProducerID` int NOT NULL,
  PRIMARY KEY (`AlbumID`),
  KEY `ArtistID` (`ArtistID`),
  KEY `GenreID` (`GenreID`),
  KEY `CompanyID` (`CompanyID`),
  KEY `ProducerID` (`ProducerID`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`ArtistID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `album_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `genre` (`GenreID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `album_ibfk_3` FOREIGN KEY (`CompanyID`) REFERENCES `recordcompany` (`CompanyID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `album_ibfk_4` FOREIGN KEY (`ProducerID`) REFERENCES `producer` (`ProducerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Rocking Forever',2,1,1,1),(2,'Jazz Nights',7,2,2,2),(3,'Symphonic Journey',8,3,3,3),(4,'Solo Sounds',1,4,4,4),(5,'Classic Hits',6,3,5,5),(6,'Electronic Dreams',10,5,1,6),(7,'Pop Fever',2,4,2,1),(8,'The Orchestra',3,3,3,2),(9,'Music of the World',4,1,4,3),(10,'Modern Beats',5,5,5,4),(11,'Electronic Wonders',11,6,6,7),(12,'Smooth Jazz Hits',12,7,7,8),(13,'Timeless Classics',13,8,8,9),(14,'Beats of the Future',14,9,9,10),(15,'Rap Legacy',15,8,8,11),(16,'Jazz Unplugged',16,9,9,12),(17,'Pop Anthems',11,6,6,7),(18,'The Ultimate Hits',20,10,10,9),(19,'GNX',19,10,8,9),(20,'Mr.Morale And The Big Steppers',11,9,9,10);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albumrelease`
--

DROP TABLE IF EXISTS `albumrelease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albumrelease` (
  `ReleaseID` int NOT NULL,
  `AlbumID` int NOT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `ReleaseType` enum('LP','CD','MP3') DEFAULT NULL,
  `ReleaseStatus` enum('OFFICIAL','PROMOTION','BOOTLEG','WITHDRAWN','CANCELED') DEFAULT NULL,
  `Packaging` enum('BOOK','CARDBOARD','SLEEVE','DIGIPAK','JEWEL CASE','NA') DEFAULT NULL,
  KEY `AlbumID` (`AlbumID`),
  CONSTRAINT `albumrelease_ibfk_1` FOREIGN KEY (`AlbumID`) REFERENCES `album` (`AlbumID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albumrelease`
--

LOCK TABLES `albumrelease` WRITE;
/*!40000 ALTER TABLE `albumrelease` DISABLE KEYS */;
INSERT INTO `albumrelease` VALUES (1,1,'2015-01-10','LP','OFFICIAL','CARDBOARD'),(2,1,'2015-02-10','CD','OFFICIAL','JEWEL CASE'),(3,2,'2016-03-15','MP3','PROMOTION','NA'),(4,2,'2016-03-20','CD','BOOTLEG','SLEEVE'),(5,3,'2017-04-25','LP','WITHDRAWN','DIGIPAK'),(6,3,'2017-05-05','CD','OFFICIAL','CARDBOARD'),(7,4,'2018-06-12','MP3','OFFICIAL','SLEEVE'),(8,4,'2018-07-01','CD','CANCELED','NA'),(9,5,'2019-08-20','LP','PROMOTION','JEWEL CASE'),(10,5,'2019-09-01','MP3','OFFICIAL','NA'),(11,6,'2020-10-05','CD','OFFICIAL','DIGIPAK'),(12,6,'2020-10-10','LP','CANCELED','CARDBOARD'),(16,14,'2003-04-01','CD','WITHDRAWN','DIGIPAK'),(17,15,'2004-05-01','LP','BOOTLEG','BOOK'),(18,16,'2005-06-01','MP3','OFFICIAL','SLEEVE'),(19,17,'2006-07-01','CD','PROMOTION','DIGIPAK'),(20,18,'2007-08-01','LP','PROMOTION','NA'),(21,19,'2008-09-01','MP3','WITHDRAWN','JEWEL CASE'),(22,20,'2009-10-01','CD','BOOTLEG','SLEEVE'),(23,13,'2020-10-05','CD','OFFICIAL','DIGIPAK'),(24,11,'2020-10-10','LP','CANCELED','CARDBOARD'),(14,12,'2001-02-01','LP','OFFICIAL','SLEEVE'),(13,11,'2000-01-01','CD','PROMOTION','JEWEL CASE'),(15,13,'2002-03-01','MP3','BOOTLEG','NA');
/*!40000 ALTER TABLE `albumrelease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `ArtistID` int NOT NULL,
  `ArtistType` enum('PERSON','BAND','ORCHESTRA','CHOIR','VIRTUAL','OTHER') DEFAULT NULL,
  PRIMARY KEY (`ArtistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'PERSON'),(2,'BAND'),(3,'ORCHESTRA'),(4,'CHOIR'),(5,'VIRTUAL'),(6,'PERSON'),(7,'BAND'),(8,'ORCHESTRA'),(9,'CHOIR'),(10,'OTHER'),(11,'PERSON'),(12,'PERSON'),(13,'PERSON'),(14,'PERSON'),(15,'PERSON'),(16,'PERSON'),(17,'PERSON'),(18,'BAND'),(19,'BAND'),(20,'OTHER');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artistcompany`
--

DROP TABLE IF EXISTS `artistcompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistcompany` (
  `ArtistID` int NOT NULL,
  `CompanyID` int NOT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  KEY `ArtistID` (`ArtistID`),
  KEY `CompanyID` (`CompanyID`),
  CONSTRAINT `artistcompany_ibfk_1` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`ArtistID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `artistcompany_ibfk_2` FOREIGN KEY (`CompanyID`) REFERENCES `recordcompany` (`CompanyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistcompany`
--

LOCK TABLES `artistcompany` WRITE;
/*!40000 ALTER TABLE `artistcompany` DISABLE KEYS */;
INSERT INTO `artistcompany` VALUES (1,1,'2005-06-15',NULL),(2,2,'2010-03-20',NULL),(3,3,'2000-05-10','2010-05-10'),(4,4,'1992-06-01','2000-08-15'),(5,5,'1998-12-01',NULL),(6,1,'2012-03-01',NULL),(7,2,'2005-07-07',NULL),(8,3,'2015-04-10',NULL),(9,4,'2010-01-01','2015-09-30'),(10,5,'2000-05-05',NULL),(1,3,'2007-11-20','2015-09-30'),(11,5,'2010-01-01',NULL),(12,6,'2015-03-01',NULL),(13,7,'2020-05-01',NULL),(14,8,'2018-06-15',NULL),(15,9,'2019-07-20',NULL),(16,5,'2022-02-10',NULL),(17,6,'2021-11-25',NULL),(18,7,'2017-04-12','2019-12-31'),(19,8,'2023-09-05',NULL),(20,9,'2020-10-10',NULL),(14,5,'2021-06-25',NULL);
/*!40000 ALTER TABLE `artistcompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `band`
--

DROP TABLE IF EXISTS `band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `band` (
  `BandID` int NOT NULL,
  `BandName` varchar(50) DEFAULT NULL,
  `FormationDate` date DEFAULT NULL,
  `DisbandDate` date DEFAULT NULL,
  `ArtistID` int NOT NULL,
  PRIMARY KEY (`BandID`),
  KEY `ArtistID` (`ArtistID`),
  CONSTRAINT `band_ibfk_1` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`ArtistID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `band`
--

LOCK TABLES `band` WRITE;
/*!40000 ALTER TABLE `band` DISABLE KEYS */;
INSERT INTO `band` VALUES (1,'The Rockers','2005-06-15','2015-08-01',2),(2,'The Jazz Masters','2010-03-20',NULL,7),(3,'Classic Symphony','2000-05-10','2010-05-10',8),(4,'Electric Beats','2010-06-12',NULL,14),(5,'Soul Jazzers','1998-04-05','2015-10-20',9),(6,'Pop Ensemble','2018-01-20',NULL,10);
/*!40000 ALTER TABLE `band` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bandmember`
--

DROP TABLE IF EXISTS `bandmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bandmember` (
  `BandID` int NOT NULL,
  `PersonID` int NOT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  KEY `BandID` (`BandID`),
  KEY `PersonID` (`PersonID`),
  CONSTRAINT `bandmember_ibfk_1` FOREIGN KEY (`BandID`) REFERENCES `band` (`BandID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bandmember_ibfk_2` FOREIGN KEY (`PersonID`) REFERENCES `person` (`PersonID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bandmember`
--

LOCK TABLES `bandmember` WRITE;
/*!40000 ALTER TABLE `bandmember` DISABLE KEYS */;
INSERT INTO `bandmember` VALUES (1,1,'2005-06-15','2010-12-01'),(1,2,'2005-06-15','2010-12-01'),(2,3,'2010-03-20',NULL),(2,4,'2010-03-20',NULL),(4,8,'2010-06-15',NULL),(5,9,'2011-09-10',NULL),(6,10,'2000-03-25','2015-10-20'),(6,11,'2018-02-10',NULL);
/*!40000 ALTER TABLE `bandmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `GenreID` int NOT NULL,
  `GenreName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`GenreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Rock'),(2,'Jazz'),(3,'Classical'),(4,'Pop'),(5,'Electronic'),(6,'Rap'),(7,'House'),(8,'R&B'),(9,'Indie'),(10,'Soul');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `PersonID` int NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(80) DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Alias` varchar(50) DEFAULT NULL,
  `isSoloArtist` tinyint DEFAULT NULL,
  `ArtistID` int NOT NULL,
  PRIMARY KEY (`PersonID`),
  KEY `ArtistID` (`ArtistID`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`ArtistID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'John','Doe','1980-01-15','USA','Johnny D',1,1),(2,'Alice','Smith','1990-02-25','UK','Ally S',1,2),(3,'Michael','Brown','1985-07-20','USA','Mikey B',1,3),(4,'Jessica','Taylor','1992-10-10','Canada','Jess T',1,4),(5,'Tom','Harris','1988-05-30','UK','Tommy H',1,5),(6,'Lily','Wilson','1995-03-15','Australia','Lil W',1,6),(7,'James','Davis','1991-12-25','USA','Jamie D',1,7),(8,'Peter','Hernandez','1985-10-08','USA','Bruno Mars',1,8),(9,'Jermaine','Cole','1985-01-28','USA','J. Cole',1,9),(10,'Justin','Timberlake','1981-01-31','USA','Justin T.',1,10),(11,'Ed','Sheeran','1991-02-17','UK','Ed Sheeran',1,11),(12,'Marshall','Mathers','1972-10-17','USA','Eminem',1,12),(13,'Dua','Lipa','1995-08-22','UK','Dua Lipa',1,13),(14,'Kendrick','Lamar','1987-06-17','USA','Kendrick Lamar',1,14);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer` (
  `ProducerID` int NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(80) DEFAULT NULL,
  `NumofProdAlbums` int DEFAULT NULL,
  PRIMARY KEY (`ProducerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer`
--

LOCK TABLES `producer` WRITE;
/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
INSERT INTO `producer` VALUES (1,'David','Smith',12),(2,'Sarah','Johnson',5),(3,'Michael','Lee',8),(4,'Emma','Brown',15),(5,'James','Miller',7),(6,'Olivia','Davis',9),(7,'Quincy','Jones',70),(8,'George','Martin',50),(9,'Timbaland',NULL,40),(10,'Mark','Ronson',30),(11,'Linda','Perry',25),(12,'Swizz','Beatz',35);
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producercompany`
--

DROP TABLE IF EXISTS `producercompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producercompany` (
  `ProducerID` int NOT NULL,
  `RecordCompanyID` int NOT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  KEY `ProducerID` (`ProducerID`),
  KEY `RecordCompanyID` (`RecordCompanyID`),
  CONSTRAINT `producercompany_ibfk_1` FOREIGN KEY (`ProducerID`) REFERENCES `producer` (`ProducerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producercompany_ibfk_2` FOREIGN KEY (`RecordCompanyID`) REFERENCES `recordcompany` (`CompanyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producercompany`
--

LOCK TABLES `producercompany` WRITE;
/*!40000 ALTER TABLE `producercompany` DISABLE KEYS */;
INSERT INTO `producercompany` VALUES (1,1,'2000-01-01',NULL),(2,2,'2005-03-10',NULL),(3,3,'2010-05-15','2015-09-30'),(4,4,'2001-11-10','2010-01-01'),(5,5,'2012-06-01',NULL),(6,1,'2018-02-20',NULL),(1,2,'2005-07-20','2012-12-30'),(3,4,'2006-08-05',NULL),(3,3,'2024-12-13',NULL),(6,5,'2024-12-13',NULL),(3,5,'2024-12-13',NULL),(7,5,'2010-03-10','2020-12-31'),(8,6,'2015-04-20',NULL),(9,7,'2018-05-12',NULL),(10,8,'2020-01-01',NULL),(11,9,'2021-08-15',NULL),(12,5,'2022-02-25',NULL),(7,6,'2013-07-10','2018-12-31'),(9,7,'2020-09-05',NULL);
/*!40000 ALTER TABLE `producercompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordcompany`
--

DROP TABLE IF EXISTS `recordcompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recordcompany` (
  `CompanyID` int NOT NULL,
  `CompanyName` varchar(80) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `BeginDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordcompany`
--

LOCK TABLES `recordcompany` WRITE;
/*!40000 ALTER TABLE `recordcompany` DISABLE KEYS */;
INSERT INTO `recordcompany` VALUES (1,'Universal Music','123 Music Street, NY','123-456-7890','contact@universal.com','1990-01-01',NULL),(2,'Sony Music','456 Song Ave, LA','987-654-3210','info@sony.com','1985-03-10',NULL),(3,'Warner Bros.','789 Melody Rd, SF','555-123-4567','support@warner.com','1992-07-15',NULL),(4,'EMI','111 Harmony Blvd, LA','444-555-6666','contact@emi.com','1980-11-20','2015-09-30'),(5,'Island Records','222 Rhythm Ln, NY','777-888-9999','contact@island.com','2000-05-05',NULL),(6,'Atlantic Records','New York, NY','212-555-0100','info@atlanticrecords.com','1947-01-01',NULL),(7,'Capitol Records','Los Angeles, CA','310-555-0200','contact@capitolrecords.com','1942-01-01',NULL),(8,'Island Records','London, UK','44-20-555-0300','support@islandrecords.com','1959-01-01',NULL),(9,'Def Jam Recordings','New York, NY','212-555-0400','info@defjam.com','1984-01-01',NULL),(10,'RCA Records','Los Angeles, CA','310-555-0500','rca@rcarecords.com','1929-01-01',NULL);
/*!40000 ALTER TABLE `recordcompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track`
--

DROP TABLE IF EXISTS `track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track` (
  `TrackID` int NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `AlbumID` int DEFAULT NULL,
  `TrackLength` time DEFAULT NULL,
  `TrackNo` int DEFAULT NULL,
  `Lyrics` text,
  KEY `AlbumID` (`AlbumID`),
  CONSTRAINT `track_ibfk_1` FOREIGN KEY (`AlbumID`) REFERENCES `album` (`AlbumID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track`
--

LOCK TABLES `track` WRITE;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
INSERT INTO `track` VALUES (1,'Rocking in the Night',1,'00:03:45',1,'Lyrics for Rocking in the Night'),(2,'Journey Through Time',1,'00:04:00',2,'Lyrics for Journey Through Time'),(3,'Echoes of the Past',1,'00:03:30',3,'Lyrics for Echoes of the Past'),(4,'Smooth Jazz Vibes',2,'00:04:15',1,'Lyrics for Smooth Jazz Vibes'),(5,'Midnight Groove',2,'00:05:00',2,'Lyrics for Midnight Groove'),(6,'City Lights',2,'00:03:50',3,'Lyrics for City Lights'),(7,'Symphony of Silence',3,'00:05:20',1,'Lyrics for Symphony of Silence'),(8,'The Golden Era',3,'00:04:40',2,'Lyrics for The Golden Era'),(9,'Majestic Movement',3,'00:03:30',3,'Lyrics for Majestic Movement'),(10,'Lonely Heart',4,'00:03:15',1,'Lyrics for Lonely Heart'),(11,'Waves of Emotion',4,'00:04:10',2,'Lyrics for Waves of Emotion'),(12,'Into the Light',4,'00:02:50',3,'Lyrics for Into the Light'),(13,'Dreaming of You',5,'00:05:00',1,'Lyrics for Dreaming of You'),(14,'Summer Breeze',5,'00:04:20',2,'Lyrics for Summer Breeze'),(15,'The Awakening',5,'00:03:40',3,'Lyrics for The Awakening'),(16,'Electric Storm',6,'00:03:50',1,'Lyrics for Electric Storm'),(17,'Neon Nights',6,'00:04:30',2,'Lyrics for Neon Nights'),(18,'Cyber Dreams',6,'00:03:10',3,'Lyrics for Cyber Dreams'),(19,'Golden Hour',7,'00:05:00',1,'Lyrics for Golden Hour'),(20,'Dancing Shadows',7,'00:04:30',2,'Lyrics for Dancing Shadows'),(21,'Under the Stars',7,'00:03:45',3,'Lyrics for Under the Stars'),(22,'Ocean Waves',8,'00:03:30',1,'Lyrics for Ocean Waves'),(23,'Wild Spirit',8,'00:04:00',2,'Lyrics for Wild Spirit'),(24,'The Final Countdown',8,'00:03:55',3,'Lyrics for The Final Countdown'),(25,'Fading Memories',9,'00:03:25',1,'Lyrics for Fading Memories'),(26,'Track 26',11,'00:03:45',26,'NULL'),(27,'Track 27',12,'00:04:10',27,'NULL'),(28,'Track 18',13,'00:02:55',28,'NULL'),(29,'Track 19',14,'00:03:30',29,'NULL'),(30,'Track 30',15,'00:04:00',30,'NULL'),(31,'Track 31',16,'00:03:20',31,'NULL'),(32,'Track 32',17,'00:03:15',32,'NULL'),(33,'Track 33',18,'00:02:45',33,'NULL'),(34,'Track 34',19,'00:04:05',34,'NULL'),(35,'Track 35',20,'00:03:50',35,'NULL'),(36,'Track 36',11,'00:03:00',36,'NULL'),(37,'Track 37',11,'00:02:50',37,'NULL'),(38,'Track 38',11,'00:04:15',38,'NULL'),(39,'Track 39',11,'00:03:40',39,'NULL'),(40,'Track 40',11,'00:03:30',40,'NULL'),(41,'Track 41',16,'00:02:55',41,'NULL'),(42,'Track 42',16,'00:04:05',42,'NULL'),(43,'Track 43',14,'00:03:25',43,'NULL'),(44,'Track 44',14,'00:02:40',44,'NULL'),(45,'Track 45',14,'00:03:15',45,'NULL'),(46,'Track 46',15,'00:03:45',46,'NULL'),(47,'Track 47',15,'00:03:55',47,'NULL'),(48,'Track 48',15,'00:02:50',48,'NULL'),(49,'Track 49',15,'00:03:35',49,'NULL'),(50,'Track 50',15,'00:04:00',50,'NULL');
/*!40000 ALTER TABLE `track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'projectdb'
--

--
-- Dumping routines for database 'projectdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-27 22:54:15
