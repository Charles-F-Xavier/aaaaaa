-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: localhost	Database: areabodega_1
-- ------------------------------------------------------
-- Server version 	10.4.24-MariaDB
-- Date: Mon, 16 May 2022 01:48:12 +0200

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area_usuario`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_usuario`
--

LOCK TABLES `area_usuario` WRITE;
/*!40000 ALTER TABLE `area_usuario` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `area_usuario` VALUES (1,'bodega'),(2,'seguridad'),(3,'RRHH'),(4,'zona_espera'),(5,'g_vuelos');
/*!40000 ALTER TABLE `area_usuario` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `area_usuario` with 5 row(s)
--

--
-- Table structure for table `avion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patente` varchar(10) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `volumen` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avion`
--

LOCK TABLES `avion` WRITE;
/*!40000 ALTER TABLE `avion` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `avion` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `avion` with 0 row(s)
--

--
-- Table structure for table `boleto`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boleto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) DEFAULT NULL,
  `cliente_id_fk` int(11) DEFAULT NULL,
  `vuelo_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id_fk` (`cliente_id_fk`),
  KEY `vuelo_id_fk` (`vuelo_id_fk`),
  CONSTRAINT `boleto_ibfk_1` FOREIGN KEY (`cliente_id_fk`) REFERENCES `cliente` (`id`),
  CONSTRAINT `boleto_ibfk_2` FOREIGN KEY (`vuelo_id_fk`) REFERENCES `vuelo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleto`
--

LOCK TABLES `boleto` WRITE;
/*!40000 ALTER TABLE `boleto` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `boleto` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `boleto` with 0 row(s)
--

--
-- Table structure for table `carga`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peso` double DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo_carga_id_fk` int(11) DEFAULT NULL,
  `cliente_id_fk` int(11) DEFAULT NULL,
  `clasificacion_id_fk` int(11) DEFAULT NULL,
  `avion_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_carga_id_fk` (`tipo_carga_id_fk`),
  KEY `cliente_id_fk` (`cliente_id_fk`),
  KEY `clasificacion_id_fk` (`clasificacion_id_fk`),
  KEY `avion_id_fk` (`avion_id_fk`),
  CONSTRAINT `carga_ibfk_1` FOREIGN KEY (`tipo_carga_id_fk`) REFERENCES `tipo_carga` (`id`),
  CONSTRAINT `carga_ibfk_2` FOREIGN KEY (`cliente_id_fk`) REFERENCES `cliente` (`id`),
  CONSTRAINT `carga_ibfk_3` FOREIGN KEY (`clasificacion_id_fk`) REFERENCES `tipo_clasificacion` (`id`),
  CONSTRAINT `carga_ibfk_4` FOREIGN KEY (`avion_id_fk`) REFERENCES `avion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carga`
--

LOCK TABLES `carga` WRITE;
/*!40000 ALTER TABLE `carga` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `carga` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `carga` with 0 row(s)
--

--
-- Table structure for table `cliente`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rut` varchar(13) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `equipaje` int(11) DEFAULT NULL,
  `numeroEquipaje` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `cliente` with 0 row(s)
--

--
-- Table structure for table `historial`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `solicitud_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `solicitud_id_fk` (`solicitud_id_fk`),
  CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`solicitud_id_fk`) REFERENCES `solicitud` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `historial` with 0 row(s)
--

--
-- Table structure for table `reporte`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id_fk` int(11) DEFAULT NULL,
  `gravedad` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id_fk` (`usuario_id_fk`),
  CONSTRAINT `reporte_ibfk_1` FOREIGN KEY (`usuario_id_fk`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `reporte` with 0 row(s)
--

--
-- Table structure for table `solicitud`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `estado_s` tinyint(1) DEFAULT NULL,
  `usuario_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id_fk` (`usuario_id_fk`),
  CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`usuario_id_fk`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `solicitud` with 0 row(s)
--

--
-- Table structure for table `stock`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `cantidad_t` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `area_user_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `area_user_id_fk` (`area_user_id_fk`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`area_user_id_fk`) REFERENCES `area_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `stock` VALUES (1,'Almohadas',1,10,'Almohada king',4),(2,'Resma',1,25,'Resma tamaño carta',3);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `stock` with 2 row(s)
--

--
-- Table structure for table `tipo_carga`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_carga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_carga`
--

LOCK TABLES `tipo_carga` WRITE;
/*!40000 ALTER TABLE `tipo_carga` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `tipo_carga` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tipo_carga` with 0 row(s)
--

--
-- Table structure for table `tipo_clasificacion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_clasificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_clasificacion`
--

LOCK TABLES `tipo_clasificacion` WRITE;
/*!40000 ALTER TABLE `tipo_clasificacion` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `tipo_clasificacion` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tipo_clasificacion` with 0 row(s)
--

--
-- Table structure for table `tipo_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_user`
--

LOCK TABLES `tipo_user` WRITE;
/*!40000 ALTER TABLE `tipo_user` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tipo_user` VALUES (1,'administrador'),(2,'trabajador');
/*!40000 ALTER TABLE `tipo_user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tipo_user` with 2 row(s)
--

--
-- Table structure for table `usuario`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rut` varchar(13) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `passwd` varchar(70) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `area_usuario_id_fk` int(11) DEFAULT NULL,
  `tipo_user_id_fk` int(11) DEFAULT NULL,
  `passwd_t` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `area_usuario_id_fk` (`area_usuario_id_fk`),
  KEY `tipo_user_id_fk` (`tipo_user_id_fk`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`area_usuario_id_fk`) REFERENCES `area_usuario` (`id`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`tipo_user_id_fk`) REFERENCES `tipo_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `usuario` VALUES (1,'15.116.506-0','Nicolas','Perez','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','nicolasperezcorreo@gmail.com',949310401,1,2,0),(2,'20.371.416-5','Ronald','Guerrero','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','aweonao5000@gmail.com',949310401,2,2,0),(3,'20.660.314-3','Javier','Villalobos','6e89996fccb6f42b37b173f362194d498f34092696528a3ea26289371058ce18','jr972971@gmail.com',949310401,NULL,1,0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `usuario` with 3 row(s)
--

--
-- Table structure for table `vuelo`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vuelo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) DEFAULT NULL,
  `fecha_horaS` datetime DEFAULT NULL,
  `fecha_horaE` datetime DEFAULT NULL,
  `destino` varchar(50) DEFAULT NULL,
  `escala` tinyint(1) DEFAULT NULL,
  `avion_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `avion_id_fk` (`avion_id_fk`),
  CONSTRAINT `vuelo_ibfk_1` FOREIGN KEY (`avion_id_fk`) REFERENCES `avion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `vuelo` with 0 row(s)
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET AUTOCOMMIT=@OLD_AUTOCOMMIT */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Mon, 16 May 2022 01:48:12 +0200
