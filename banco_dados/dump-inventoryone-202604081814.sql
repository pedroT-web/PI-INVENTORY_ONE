/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: modeninventory.ddns.net    Database: inventoryone
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `nacionalidade` varchar(20) DEFAULT 'Brasil',
  `cargo` varchar(30) DEFAULT NULL,
  `departamento` varchar(30) DEFAULT NULL,
  `filial` varchar(30) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(512) DEFAULT NULL,
  `cep` varchar(11) DEFAULT NULL,
  `dtacadastro` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `codPessoa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codPessoa` (`codPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` VALUES
(29,'Roberto Bagio','1990-01-22','M','Brasil','Comprador','Compras','Hortolandia','1932321212','rbagio@gmail.com','Rua do Estádio Brinco de Ouro','13120122','2026-04-08 13:21:18',123),
(30,'Joana Shadow','1993-03-21','F','Brasil','Lider','Logistica','Marilia','123323123','joanas@pop','Rua da Luz 57','00001233','2026-04-08 13:48:00',334),
(32,'Paulo Rodrigues','1990-03-12','M','Brasil','Auxiliar','Financeiro','Jaboticabal','12332123123','prodruigue@gmail','Av. Josue de Oliveira 1000, americana SP','13423232','2026-04-08 14:03:45',444);
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtoDisponivel`
--

DROP TABLE IF EXISTS `produtoDisponivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtoDisponivel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pessoa` (`id_pessoa`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `produtoDisponivel_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoas` (`id`),
  CONSTRAINT `produtoDisponivel_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtoDisponivel`
--

LOCK TABLES `produtoDisponivel` WRITE;
/*!40000 ALTER TABLE `produtoDisponivel` DISABLE KEYS */;
INSERT INTO `produtoDisponivel` VALUES
(39,29,33);
/*!40000 ALTER TABLE `produtoDisponivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipamento` varchar(100) DEFAULT 'chip',
  `modelo` varchar(100) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `configuracao` text DEFAULT NULL,
  `serie` varchar(100) DEFAULT NULL,
  `imei` int(15) DEFAULT NULL,
  `dtacompra` date NOT NULL,
  `dtacadastro` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `valor` decimal(10,2) DEFAULT NULL,
  `nrodocumento` int(44) DEFAULT NULL,
  `nroddd` int(2) DEFAULT NULL,
  `nrolinha` int(9) DEFAULT NULL,
  `codchip` int(25) DEFAULT NULL,
  `operadora` varchar(30) DEFAULT NULL,
  `pinoperadora` int(6) DEFAULT NULL,
  `localestoque` varchar(30) DEFAULT NULL,
  `responsavelestoque` varchar(100) DEFAULT NULL,
  `historico` longtext DEFAULT NULL,
  `ean` int(14) DEFAULT NULL,
  `alugado` enum('S','N') DEFAULT NULL,
  `disponivel` enum('S','N') DEFAULT 'S',
  PRIMARY KEY (`id`),
  UNIQUE KEY `imei` (`imei`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES
(33,'Notebook','Inspiron','Dell','Processador i18 128GB Ram 20TB NVME ','4321',1234,'2026-04-30','2026-04-08 14:05:03',12300001.00,111134,NULL,NULL,NULL,NULL,NULL,'RIbeirao Preto - T.i','Joaquin Pereira',NULL,7890,'N','N'),
(34,'celular','Inspiron','Dell','Processador i18 128GB Ram 20TB NVME ','1234',4321,'2026-04-30','2026-04-08 17:55:38',12300001.00,111134,NULL,NULL,NULL,'',NULL,'RIbeirao Preto - T.i','Joaquin Pereira',NULL,7890,'N','S'),
(35,'Notebook','Inspiron','Dell','Processador i18 128GB Ram 20TB NVME ','5564',883721,'2026-04-30','2026-04-08 13:16:19',12300001.00,772263,NULL,NULL,NULL,NULL,NULL,'Hortolândia - Comercial','Beatriz Musk',NULL,7890,'N','S'),
(36,'Celular','S50k','MUND','128GB Ram 12TB Armazenamento 9.8GHZ BiCore','1234',123312,'1985-02-20','2026-04-08 17:54:59',12525987.12,12,NULL,NULL,NULL,NULL,NULL,'Pirassununga Comercial','Dorival',NULL,789122,'N','S');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `dtacadastro` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_usuarios_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(3,'Murilo','murilo@gmail','$2b$12$neMBHgiJoCxoFW0No7sqKOlg0GlEDD0jB3MFM5lQfHiy7rfdE8N/q','123456742234234','2026-04-08 12:40:02');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'inventoryone'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-04-08 18:14:10
