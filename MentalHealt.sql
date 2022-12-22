-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bibliotecafei
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `id_prestamo` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` varchar(20) DEFAULT NULL,
  `fecha_entrega` varchar(20) DEFAULT NULL,
  `folio` varchar(50) NOT NULL,
  `id_usuario` varchar(20) NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `folio` (`folio`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`folio`) REFERENCES `recurso_documental` (`folio`),
  CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_biblioteca` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso_documental`
--

DROP TABLE IF EXISTS `recurso_documental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recurso_documental` (
  `folio` varchar(50) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `autor` varchar(500) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `seccion` varchar(50) DEFAULT NULL,
  `tipo_recurso` varchar(100) DEFAULT NULL,
  `procedencia` varchar(500) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`folio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso_documental`
--

LOCK TABLES `recurso_documental` WRITE;
/*!40000 ALTER TABLE `recurso_documental` DISABLE KEYS */;
INSERT INTO `recurso_documental` VALUES ('jLiCi','jhyg','etesech','disponible','Ciencias','Libro','Facultad de Estadística e informática','jedneu'),('wLiCi','wachiturro','el pepe','disponible','Ciencias','Libro','Facultad de Estadística e informática','Próxima estación, wereverwero');
/*!40000 ALTER TABLE `recurso_documental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_desecho`
--

DROP TABLE IF EXISTS `solicitud_desecho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_desecho` (
  `id_solicitud` int NOT NULL AUTO_INCREMENT,
  `fecha_envio` varchar(20) DEFAULT NULL,
  `fecha_respuesta` varchar(20) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `respuesta` varchar(500) DEFAULT NULL,
  `folio` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `folio` (`folio`),
  CONSTRAINT `solicitud_desecho_ibfk_1` FOREIGN KEY (`folio`) REFERENCES `recurso_documental` (`folio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_desecho`
--

LOCK TABLES `solicitud_desecho` WRITE;
/*!40000 ALTER TABLE `solicitud_desecho` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_desecho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_biblioteca`
--

DROP TABLE IF EXISTS `usuario_biblioteca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_biblioteca` (
  `id_usuario` varchar(20) NOT NULL,
  `nombre` varchar(500) DEFAULT NULL,
  `genero` varchar(15) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `domicilio` varchar(500) DEFAULT NULL,
  `tipo_usuario` varchar(50) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `periodo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_biblioteca`
--

LOCK TABLES `usuario_biblioteca` WRITE;
/*!40000 ALTER TABLE `usuario_biblioteca` DISABLE KEYS */;
INSERT INTO `usuario_biblioteca` VALUES ('Correo',NULL,NULL,NULL,NULL,NULL,NULL,'2022-2023'),('s20015683','Miguel Zinedinne Guzman Sainz','masculino','5565111269','Moctezuma 91, centro','estudiante','miguelzinedinne@gmail.com','2022-2023'),('s20015760','Alvaro','masculino','2282727966','Banderilla','estudiante','abf260602@outlook.com','2022-2023');
/*!40000 ALTER TABLE `usuario_biblioteca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_staff`
--

DROP TABLE IF EXISTS `usuario_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_staff` (
  `numero_personal` varchar(20) NOT NULL,
  `nombre_completo` varchar(500) DEFAULT NULL,
  `nombre_usuario` varchar(100) DEFAULT NULL,
  `tipo_usuario` varchar(50) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`numero_personal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_staff`
--

LOCK TABLES `usuario_staff` WRITE;
/*!40000 ALTER TABLE `usuario_staff` DISABLE KEYS */;
INSERT INTO `usuario_staff` VALUES ('12345','Juan Carlos Pérez Arriaga','revo','bibliotecario','c5d9abe6b98f309c2a1b598d9f169bbed87b4982cbb2a8faa1d7bc5e6076f0b6');
/*!40000 ALTER TABLE `usuario_staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-22  0:00:57
