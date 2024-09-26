-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: mi_bd
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `ahorros`
--

DROP TABLE IF EXISTS `ahorros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ahorros` (
  `ahorro_inicial` float(10,2) DEFAULT NULL,
  `periodos` int DEFAULT NULL,
  `tasa_interes` float(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ahorros`
--

LOCK TABLES `ahorros` WRITE;
/*!40000 ALTER TABLE `ahorros` DISABLE KEYS */;
INSERT INTO `ahorros` VALUES (1123.00,10,1.08),(1163.00,7,1.10),(1795.00,5,1.14),(1209.00,10,1.05),(1319.00,9,1.06),(1902.00,7,1.10),(1542.00,3,1.11),(1060.00,7,1.01),(1202.00,10,1.02),(1599.00,8,1.19);
/*!40000 ALTER TABLE `ahorros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan Pérez','Alberti 1789, Mar del Plata'),(2,'María García','Avenida 789, Ciudad del Este'),(3,'Ana López','Beltrán 1452, Godoy Cruz'),(4,'Carlos Sánchez','Saavedra 206, Las Heras'),(5,'Alejandro López','Calle Rivadavia 123, Buenos Aires'),(6,'Sofía Rodríguez','Avenida San Martín 456, Rosario'),(7,'Joaquín Pérez','Calle Belgrano 789, Córdoba'),(8,'Valeria Gómez','Calle Mitre 101, Mendoza'),(9,'Diego Martínez','Avenida 9 de Julio 654, Buenos Aires');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concentracion_de_hidrogenos`
--

DROP TABLE IF EXISTS `concentracion_de_hidrogenos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concentracion_de_hidrogenos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nanomoles_por_litro` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concentracion_de_hidrogenos`
--

LOCK TABLES `concentracion_de_hidrogenos` WRITE;
/*!40000 ALTER TABLE `concentracion_de_hidrogenos` DISABLE KEYS */;
INSERT INTO `concentracion_de_hidrogenos` VALUES (11,0),(12,0),(13,10),(14,0),(15,100000000),(16,0),(17,0),(18,1000),(19,0),(20,1);
/*!40000 ALTER TABLE `concentracion_de_hidrogenos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Ventas'),(2,'Recursos Humanos'),(3,'Contabilidad');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `edad` int NOT NULL,
  `salario` decimal(10,2) DEFAULT '0.00',
  `correo_electronico` varchar(100) GENERATED ALWAYS AS (concat(`nombre`,_utf8mb4'.',`apellido`,_utf8mb4'@mail.com')) STORED,
  `departamento_id` int DEFAULT NULL,
  `fecha_contratacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_departamento_id` (`departamento_id`),
  CONSTRAINT `fk_departamento_id` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `edad`, `salario`, `departamento_id`, `fecha_contratacion`) VALUES (1,'Ana','Rodríguez',28,3707.55,1,'2024-09-12 01:20:39'),(2,'Carlos','López',32,3360.53,3,'2024-09-12 01:28:48'),(4,'Martín','González',30,3255.26,2,'2024-09-12 01:28:48'),(5,'Luis','Fernández',28,3145.80,1,'2024-09-13 00:20:10'),(6,'Marta','Ramírez',32,3317.00,1,'2024-09-13 00:37:08'),(7,'Lorena','Guzmán',26,2600.00,1,'2024-09-13 00:37:08'),(8,'Laura','Sánchez',27,3300.00,1,'2024-09-17 00:18:22'),(9,'Javier','Pérez',29,3100.00,1,'2024-09-17 00:18:22'),(10,'Camila','Gómez',26,3000.00,1,'2024-09-17 00:18:22'),(11,'Lucas','Fernández',28,3200.00,1,'2024-09-17 00:18:22'),(12,'Valentina','Rodríguez',30,3500.00,1,'2024-09-17 00:18:22');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_envio` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `codigo_producto` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
INSERT INTO `envios` VALUES (1,'2022-01-15 08:00:00','2022-01-20 12:30:00','ABC123'),(2,'2022-02-10 10:15:00','2022-02-15 14:45:00','XYZ789'),(3,'2022-03-05 09:30:00','2022-03-10 13:20:00','PQR456'),(4,'2022-04-20 11:45:00','2022-04-25 15:10:00','LMN001'),(5,'2022-05-12 07:55:00','2022-05-17 10:25:00','DEF777'),(6,'2022-06-08 08:20:00','2022-06-13 12:40:00','GHI888'),(7,'2022-07-03 10:05:00','2022-07-08 14:15:00','JKL999');
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `promedio` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'Juan','Pérez',22,85.5),(2,'María','Gómez',21,90),(3,'Luis','Rodríguez',20,88.5),(4,'Ana','Martínez',23,92),(5,'Carlos','López',22,86.5);
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `datos` varchar(255) DEFAULT NULL,
  `valor_crc` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
INSERT INTO `mensajes` VALUES ('Hola, ¿cómo estás? Espero que tengas un buen día.',3221685809),('Ayer fui al cine a ver una película genial.',951196167),('Estoy emocionado por el próximo fin de semana.',3275166159),('Mi reunión se pospuso para el martes que viene.',169741145),('He estado trabajando en un proyecto importante.',6480112535),('Esta receta de pastel de manzana es deliciosa.',2524836786),('Planeo hacer un viaje a la playa este verano.',5107635050),('Mi gato se divierte jugando con su pelota.',3578632817),('Hoy es un día soleado y agradable.',3675102258),('El libro que estoy leyendo es muy interesante.',854938277);
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numeros_ocultos`
--

DROP TABLE IF EXISTS `numeros_ocultos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numeros_ocultos` (
  `columna_1` varchar(255) DEFAULT NULL,
  `columna_2` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeros_ocultos`
--

LOCK TABLES `numeros_ocultos` WRITE;
/*!40000 ALTER TABLE `numeros_ocultos` DISABLE KEYS */;
INSERT INTO `numeros_ocultos` VALUES ('EB4ECB',16),('25SK1E',31),('8C2B88',22),('58D660A',15),('100010020211000',3),('20251A2',13),('4MFL6M',23),('IO36L',29),('748D676',14),('J1G50',32);
/*!40000 ALTER TABLE `numeros_ocultos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Laptop',1350.00),(2,'Teléfono móvil',480.00),(3,'Tablet',350.00),(4,'Impresora',280.00),(5,'Cámara Digital',420.00),(6,'Smart TV 55 Pulgadas',1200.00),(7,'Auriculares Bluetooth',80.00),(8,'Reproductor de Blu-ray',120.00),(9,'Lavadora de Ropa',550.00),(10,'Refrigeradora Doble Puerta',800.00),(11,'Horno de Microondas',120.00),(12,'Licuadora de Alta Potencia',70.00),(13,'Silla de Oficina Ergonómica',150.00),(14,'Escritorio de Madera',200.00),(15,'Mesa de Comedor',250.00),(16,'Sofá de Tres Plazas',350.00),(17,'Mochila para Portátil',30.00),(18,'Reloj de Pulsera Inteligente',100.00),(19,'Juego de Utensilios de Cocina',40.00),(20,'Set de Toallas de Baño',20.00),(21,'Cama King Size',500.00),(22,'Lámpara de Pie Moderna',70.00),(23,'Cafetera de Goteo',40.00),(24,'Robot Aspirador',180.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triangulos_rectangulos`
--

DROP TABLE IF EXISTS `triangulos_rectangulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `triangulos_rectangulos` (
  `longitud_lado_adyacente` int DEFAULT NULL,
  `longitud_lado_opuesto` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triangulos_rectangulos`
--

LOCK TABLES `triangulos_rectangulos` WRITE;
/*!40000 ALTER TABLE `triangulos_rectangulos` DISABLE KEYS */;
INSERT INTO `triangulos_rectangulos` VALUES (27,48),(59,50),(73,13),(45,88),(3,52),(51,99),(39,100),(80,99),(54,74),(8,15);
/*!40000 ALTER TABLE `triangulos_rectangulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triangulos_rectangulos_2`
--

DROP TABLE IF EXISTS `triangulos_rectangulos_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `triangulos_rectangulos_2` (
  `angulo_alfa` int DEFAULT NULL,
  `hipotenusa` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triangulos_rectangulos_2`
--

LOCK TABLES `triangulos_rectangulos_2` WRITE;
/*!40000 ALTER TABLE `triangulos_rectangulos_2` DISABLE KEYS */;
INSERT INTO `triangulos_rectangulos_2` VALUES (47,17),(22,74),(86,58),(1,29),(38,26),(1,29),(36,12),(37,69),(18,92),(89,23);
/*!40000 ALTER TABLE `triangulos_rectangulos_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `monto_total` decimal(10,2) GENERATED ALWAYS AS ((`cantidad` * `precio_unitario`)) STORED,
  `empleado_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` (`id`, `producto_id`, `cliente_id`, `cantidad`, `precio_unitario`, `empleado_id`) VALUES (1,1,1,2,1200.00,1),(2,1,1,2,1350.00,1),(3,2,2,3,480.00,2),(4,4,4,1,280.00,6),(5,1,3,1,1350.00,2),(6,3,1,2,350.00,5),(7,2,2,1,480.00,6),(8,4,4,2,280.00,7),(9,1,6,3,1350.00,1),(10,5,8,5,420.00,9),(11,10,2,2,800.00,6),(12,14,7,1,200.00,5),(13,20,4,4,20.00,6),(14,4,5,5,280.00,1),(15,9,5,3,550.00,1),(16,13,3,4,150.00,5),(17,19,6,2,40.00,1),(18,2,9,5,480.00,1),(19,3,9,1,350.00,1),(20,6,7,4,1200.00,1),(21,7,6,3,80.00,1),(22,12,9,5,70.00,1),(23,16,8,2,350.00,6),(24,23,9,4,180.00,1),(25,18,4,3,100.00,7),(26,11,3,2,120.00,5),(27,15,5,4,250.00,6),(28,8,8,1,120.00,7),(29,17,3,2,30.00,5),(30,21,9,5,500.00,6),(31,22,2,3,70.00,6),(32,24,9,2,180.00,1),(33,5,1,2,1350.00,1),(34,9,6,4,550.00,9),(35,13,8,3,150.00,7),(36,3,1,5,350.00,1),(37,18,9,1,100.00,6),(38,10,5,2,800.00,1),(39,7,4,3,80.00,6),(40,2,5,1,480.00,6),(41,8,7,4,120.00,7),(42,1,3,5,1350.00,5),(43,4,6,2,280.00,5),(44,12,1,1,70.00,1),(45,19,4,3,40.00,6),(46,15,3,4,250.00,5),(47,6,8,2,1200.00,7),(48,11,2,3,120.00,5);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_ahorro_inicial`
--

DROP TABLE IF EXISTS `vista_ahorro_inicial`;
/*!50001 DROP VIEW IF EXISTS `vista_ahorro_inicial`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ahorro_inicial` AS SELECT 
 1 AS `valor_futuro`,
 1 AS `periodos`,
 1 AS `ahorro_inicial`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ahorros_futuros`
--

DROP TABLE IF EXISTS `vista_ahorros_futuros`;
/*!50001 DROP VIEW IF EXISTS `vista_ahorros_futuros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ahorros_futuros` AS SELECT 
 1 AS `periodos`,
 1 AS `tasa_interes`,
 1 AS `valor_futuro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_mensajes`
--

DROP TABLE IF EXISTS `vista_mensajes`;
/*!50001 DROP VIEW IF EXISTS `vista_mensajes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_mensajes` AS SELECT 
 1 AS `datos`,
 1 AS `valor_crc`,
 1 AS `analisis`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_numeros_base10`
--

DROP TABLE IF EXISTS `vista_numeros_base10`;
/*!50001 DROP VIEW IF EXISTS `vista_numeros_base10`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_numeros_base10` AS SELECT 
 1 AS `columna_1`,
 1 AS `columna_2`,
 1 AS `base_10`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_periodos`
--

DROP TABLE IF EXISTS `vista_periodos`;
/*!50001 DROP VIEW IF EXISTS `vista_periodos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_periodos` AS SELECT 
 1 AS `valor_futuro`,
 1 AS `ahorro_inicial`,
 1 AS `tasa_interes`,
 1 AS `periodos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ph`
--

DROP TABLE IF EXISTS `vista_ph`;
/*!50001 DROP VIEW IF EXISTS `vista_ph`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ph` AS SELECT 
 1 AS `id`,
 1 AS `nanomoles_por_litro`,
 1 AS `ph`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ph_escala`
--

DROP TABLE IF EXISTS `vista_ph_escala`;
/*!50001 DROP VIEW IF EXISTS `vista_ph_escala`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ph_escala` AS SELECT 
 1 AS `id`,
 1 AS `nanomoles_por_litro`,
 1 AS `ph`,
 1 AS `escala_de_ph`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_tasa_interes`
--

DROP TABLE IF EXISTS `vista_tasa_interes`;
/*!50001 DROP VIEW IF EXISTS `vista_tasa_interes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_tasa_interes` AS SELECT 
 1 AS `valor_futuro`,
 1 AS `ahorro_inicial`,
 1 AS `tasa_interes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_triangulos`
--

DROP TABLE IF EXISTS `vista_triangulos`;
/*!50001 DROP VIEW IF EXISTS `vista_triangulos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_triangulos` AS SELECT 
 1 AS `A`,
 1 AS `B`,
 1 AS `hipotenusa`,
 1 AS `angulo_alfa_radianes`,
 1 AS `angulo_alfa_grados`,
 1 AS `angulo_beta_radianes`,
 1 AS `angulo_beta_grados`,
 1 AS `angulo_gamma_grados`,
 1 AS `angulo_gamma_radianes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_triangulos_2`
--

DROP TABLE IF EXISTS `vista_triangulos_2`;
/*!50001 DROP VIEW IF EXISTS `vista_triangulos_2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_triangulos_2` AS SELECT 
 1 AS `angulo_alfa`,
 1 AS `hipotenusa`,
 1 AS `lado_adyacente`,
 1 AS `lado_opuesto`,
 1 AS `angulo_beta`,
 1 AS `angulo_gamma`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_ahorro_inicial`
--

/*!50001 DROP VIEW IF EXISTS `vista_ahorro_inicial`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ahorro_inicial` AS select `vista_ahorros_futuros`.`valor_futuro` AS `valor_futuro`,`vista_ahorros_futuros`.`periodos` AS `periodos`,round((`vista_ahorros_futuros`.`valor_futuro` / pow((1 + (`vista_ahorros_futuros`.`tasa_interes` / 100)),`vista_ahorros_futuros`.`periodos`)),2) AS `ahorro_inicial` from `vista_ahorros_futuros` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ahorros_futuros`
--

/*!50001 DROP VIEW IF EXISTS `vista_ahorros_futuros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ahorros_futuros` AS select `ahorros`.`periodos` AS `periodos`,`ahorros`.`tasa_interes` AS `tasa_interes`,round((`ahorros`.`ahorro_inicial` * pow((1 + (`ahorros`.`tasa_interes` / 100)),`ahorros`.`periodos`)),2) AS `valor_futuro` from `ahorros` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_mensajes`
--

/*!50001 DROP VIEW IF EXISTS `vista_mensajes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_mensajes` AS select `mensajes`.`datos` AS `datos`,`mensajes`.`valor_crc` AS `valor_crc`,(case when (crc32(`mensajes`.`datos`) = `mensajes`.`valor_crc`) then 'correcto' else 'adulterado' end) AS `analisis` from `mensajes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_numeros_base10`
--

/*!50001 DROP VIEW IF EXISTS `vista_numeros_base10`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_numeros_base10` AS select `numeros_ocultos`.`columna_1` AS `columna_1`,`numeros_ocultos`.`columna_2` AS `columna_2`,conv(`numeros_ocultos`.`columna_1`,`numeros_ocultos`.`columna_2`,10) AS `base_10` from `numeros_ocultos` order by conv(`numeros_ocultos`.`columna_1`,`numeros_ocultos`.`columna_2`,10) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_periodos`
--

/*!50001 DROP VIEW IF EXISTS `vista_periodos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_periodos` AS select `vista_tasa_interes`.`valor_futuro` AS `valor_futuro`,`vista_tasa_interes`.`ahorro_inicial` AS `ahorro_inicial`,`vista_tasa_interes`.`tasa_interes` AS `tasa_interes`,round((log((`vista_tasa_interes`.`valor_futuro` / `vista_tasa_interes`.`ahorro_inicial`)) / log((1 + `vista_tasa_interes`.`tasa_interes`))),2) AS `periodos` from `vista_tasa_interes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ph`
--

/*!50001 DROP VIEW IF EXISTS `vista_ph`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ph` AS select `concentracion_de_hidrogenos`.`id` AS `id`,`concentracion_de_hidrogenos`.`nanomoles_por_litro` AS `nanomoles_por_litro`,round(-(log10((`concentracion_de_hidrogenos`.`nanomoles_por_litro` / 1000000000))),2) AS `ph` from `concentracion_de_hidrogenos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ph_escala`
--

/*!50001 DROP VIEW IF EXISTS `vista_ph_escala`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ph_escala` AS select `concentracion_de_hidrogenos`.`id` AS `id`,`concentracion_de_hidrogenos`.`nanomoles_por_litro` AS `nanomoles_por_litro`,round(-(log10((`concentracion_de_hidrogenos`.`nanomoles_por_litro` / 1000000000))),2) AS `ph`,(case when (round(-(log10((`concentracion_de_hidrogenos`.`nanomoles_por_litro` / 1000000000))),2) < 7) then 'Ácida' when (round(-(log10((`concentracion_de_hidrogenos`.`nanomoles_por_litro` / 1000000000))),2) = 7) then 'Neutra' else 'Alcalina' end) AS `escala_de_ph` from `concentracion_de_hidrogenos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tasa_interes`
--

/*!50001 DROP VIEW IF EXISTS `vista_tasa_interes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tasa_interes` AS select `vista_ahorro_inicial`.`valor_futuro` AS `valor_futuro`,`vista_ahorro_inicial`.`ahorro_inicial` AS `ahorro_inicial`,round((pow((`vista_ahorro_inicial`.`valor_futuro` / `vista_ahorro_inicial`.`ahorro_inicial`),(1 / `vista_ahorro_inicial`.`periodos`)) - 1),4) AS `tasa_interes` from `vista_ahorro_inicial` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_triangulos`
--

/*!50001 DROP VIEW IF EXISTS `vista_triangulos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_triangulos` AS select `triangulos_rectangulos`.`longitud_lado_adyacente` AS `A`,`triangulos_rectangulos`.`longitud_lado_opuesto` AS `B`,round(sqrt((pow(`triangulos_rectangulos`.`longitud_lado_adyacente`,2) + pow(`triangulos_rectangulos`.`longitud_lado_opuesto`,2))),2) AS `hipotenusa`,round(asin((`triangulos_rectangulos`.`longitud_lado_opuesto` / sqrt((pow(`triangulos_rectangulos`.`longitud_lado_adyacente`,2) + pow(`triangulos_rectangulos`.`longitud_lado_opuesto`,2))))),2) AS `angulo_alfa_radianes`,round(degrees(asin((`triangulos_rectangulos`.`longitud_lado_opuesto` / sqrt((pow(`triangulos_rectangulos`.`longitud_lado_adyacente`,2) + pow(`triangulos_rectangulos`.`longitud_lado_opuesto`,2)))))),2) AS `angulo_alfa_grados`,round(acos((`triangulos_rectangulos`.`longitud_lado_opuesto` / sqrt((pow(`triangulos_rectangulos`.`longitud_lado_adyacente`,2) + pow(`triangulos_rectangulos`.`longitud_lado_opuesto`,2))))),2) AS `angulo_beta_radianes`,round(degrees(acos((`triangulos_rectangulos`.`longitud_lado_opuesto` / sqrt((pow(`triangulos_rectangulos`.`longitud_lado_adyacente`,2) + pow(`triangulos_rectangulos`.`longitud_lado_opuesto`,2)))))),2) AS `angulo_beta_grados`,(180 - (round(degrees(asin((`triangulos_rectangulos`.`longitud_lado_opuesto` / sqrt((pow(`triangulos_rectangulos`.`longitud_lado_adyacente`,2) + pow(`triangulos_rectangulos`.`longitud_lado_opuesto`,2)))))),2) + round(degrees(acos((`triangulos_rectangulos`.`longitud_lado_opuesto` / sqrt((pow(`triangulos_rectangulos`.`longitud_lado_adyacente`,2) + pow(`triangulos_rectangulos`.`longitud_lado_opuesto`,2)))))),2))) AS `angulo_gamma_grados`,radians(90) AS `angulo_gamma_radianes` from `triangulos_rectangulos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_triangulos_2`
--

/*!50001 DROP VIEW IF EXISTS `vista_triangulos_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_triangulos_2` AS select `triangulos_rectangulos_2`.`angulo_alfa` AS `angulo_alfa`,`triangulos_rectangulos_2`.`hipotenusa` AS `hipotenusa`,round((`triangulos_rectangulos_2`.`hipotenusa` * cos(radians(`triangulos_rectangulos_2`.`angulo_alfa`))),2) AS `lado_adyacente`,round((`triangulos_rectangulos_2`.`hipotenusa` * sin(radians(`triangulos_rectangulos_2`.`angulo_alfa`))),2) AS `lado_opuesto`,round((90 - `triangulos_rectangulos_2`.`angulo_alfa`),2) AS `angulo_beta`,(`triangulos_rectangulos_2`.`angulo_alfa` + round((90 - `triangulos_rectangulos_2`.`angulo_alfa`),2)) AS `angulo_gamma` from `triangulos_rectangulos_2` */;
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

-- Dump completed on 2024-09-25 21:27:15
