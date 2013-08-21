CREATE DATABASE  IF NOT EXISTS `pv1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pv1`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: pv1
-- ------------------------------------------------------
-- Server version	5.5.21

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
-- Table structure for table `medicamentoqueixa`
--

DROP TABLE IF EXISTS `medicamentoqueixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamentoqueixa` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) DEFAULT NULL,
  `dose` varchar(80) DEFAULT NULL,
  `efetivo` varchar(1) DEFAULT NULL,
  `necessario` varchar(1) DEFAULT NULL,
  `periodo` varchar(80) DEFAULT NULL,
  `seguro` varchar(1) DEFAULT NULL,
  `cumprimento` varchar(1) DEFAULT NULL,
  `fkQueixa` int(10) NOT NULL,
  `conheceCumpre` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8099C4A73D02FC3D` (`fkQueixa`),
  KEY `Index_2` (`fkQueixa`),
  CONSTRAINT `FK8099C4A73D02FC3D` FOREIGN KEY (`fkQueixa`) REFERENCES `queixa` (`id`),
  CONSTRAINT `FK_medicamentoqueixa_1` FOREIGN KEY (`fkQueixa`) REFERENCES `queixa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentoqueixa`
--

LOCK TABLES `medicamentoqueixa` WRITE;
/*!40000 ALTER TABLE `medicamentoqueixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentoqueixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_consulta_parametro`
--

DROP TABLE IF EXISTS `tb_consulta_parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_consulta_parametro` (
  `IdConsultaVariavel` bigint(20) NOT NULL,
  `IdParametroClinico` int(11) NOT NULL,
  `Valor` float DEFAULT NULL,
  `ValorReferencia` float DEFAULT NULL,
  `Unidade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdConsultaVariavel`,`IdParametroClinico`),
  KEY `fk_tb_consulta_parametro_tb_consulta_variavel1` (`IdConsultaVariavel`),
  KEY `fk_tb_consulta_parametro_tb_parametro_clinico1` (`IdParametroClinico`),
  CONSTRAINT `fk_tb_consulta_parametro_tb_consulta_variavel1` FOREIGN KEY (`IdConsultaVariavel`) REFERENCES `tb_consulta_variavel` (`IdConsultaVariavel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_consulta_parametro_tb_parametro_clinico1` FOREIGN KEY (`IdParametroClinico`) REFERENCES `tb_parametro_clinico` (`IdParametroClinico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_consulta_parametro`
--

LOCK TABLES `tb_consulta_parametro` WRITE;
/*!40000 ALTER TABLE `tb_consulta_parametro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_consulta_parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_queixa`
--

DROP TABLE IF EXISTS `tb_queixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_queixa` (
  `IdQueixa` int(11) NOT NULL AUTO_INCREMENT,
  `DescricaoQueixa` varchar(100) NOT NULL,
  `IdSistema` int(11) NOT NULL,
  PRIMARY KEY (`IdQueixa`),
  KEY `fk_tb_queixa_tb_sistema1` (`IdSistema`),
  CONSTRAINT `fk_tb_queixa_tb_sistema1` FOREIGN KEY (`IdSistema`) REFERENCES `tb_sistema` (`IdSistema`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_queixa`
--

LOCK TABLES `tb_queixa` WRITE;
/*!40000 ALTER TABLE `tb_queixa` DISABLE KEYS */;
INSERT INTO `tb_queixa` VALUES (1,'Alergia',2),(2,'Dor de Barriga',2);
/*!40000 ALTER TABLE `tb_queixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queixarespostaquarta`
--

DROP TABLE IF EXISTS `queixarespostaquarta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queixarespostaquarta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroPRM` int(11) NOT NULL DEFAULT '0',
  `fkResposta4` int(11) NOT NULL DEFAULT '0',
  `periodoSurgimento` varchar(45) DEFAULT NULL,
  `flConheceOuPreocupa` varchar(1) DEFAULT NULL,
  `prioridade` int(10) unsigned NOT NULL,
  `descricao` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5BA98DD4D2B646E7` (`fkResposta4`),
  CONSTRAINT `FK5BA98DD4D2B646E7` FOREIGN KEY (`fkResposta4`) REFERENCES `respostaquarta` (`id`),
  CONSTRAINT `FK_queixarespostaquarta_1` FOREIGN KEY (`fkResposta4`) REFERENCES `respostaquarta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queixarespostaquarta`
--

LOCK TABLES `queixarespostaquarta` WRITE;
/*!40000 ALTER TABLE `queixarespostaquarta` DISABLE KEYS */;
/*!40000 ALTER TABLE `queixarespostaquarta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paciente`
--

DROP TABLE IF EXISTS `tb_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_paciente` (
  `IdPaciente` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Foto` mediumblob,
  PRIMARY KEY (`IdPaciente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paciente`
--

LOCK TABLES `tb_paciente` WRITE;
/*!40000 ALTER TABLE `tb_paciente` DISABLE KEYS */;
INSERT INTO `tb_paciente` VALUES (1,'Marcos DÃ³sea','ÿØÿà\0JFIF\0\0`\0`\0\0ÿáòExif\0\0MM\0*\0\0\0\0;\0\0\0\0\0\0J‡i\0\0\0\0\0\0Xœ\0\0\0\0\Z\0\0Ðê\0\0\0\0\0\0>\0\0\0\0ê\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Marcos DÃ³sea\0\0\0\0\0\0\0\0¦\0\0\0\0\0\0º’‘\0\0\0\015\0\0’’\0\0\0\015\0\0ê\0\0\0\0\0š\0\0\0\0ê\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\02013:06:17 19:34:21\02013:06:17 19:34:21\0\0\0M\0a\0r\0c\0o\0s\0 \0D\0ó\0s\0e\0a\0\0\0ÿá http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\'ï»¿\' id=\'W5M0MpCehiHzreSzNTczkc9d\'?>\r\n<x:xmpmeta xmlns:x=\"adobe:ns:meta/\"><rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"><rdf:Description rdf:about=\"uuid:faf5bdd5-ba3d-11da-ad31-d33d75182f1b\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\"/><rdf:Description rdf:about=\"uuid:faf5bdd5-ba3d-11da-ad31-d33d75182f1b\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"><xmp:CreateDate>2013-06-17T19:34:21.147</xmp:CreateDate></rdf:Description><rdf:Description rdf:about=\"uuid:faf5bdd5-ba3d-11da-ad31-d33d75182f1b\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\"><dc:creator><rdf:Seq xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"><rdf:li>Marcos DÃ³sea</rdf:li></rdf:Seq>\r\n			</dc:creator></rdf:Description></rdf:RDF></x:xmpmeta>\r\n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                            <?xpacket end=\'w\'?>ÿÛ\0C\0\n\n		\n\Z\'!%\".\"%()+,+\Z /3/*2\'*+*ÿÛ\0C\n	\n***************************************************ÿÀ\0Š…\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ô‹>%ñ‡îteðÝçÙ„érÓ*6ß·ËÛ÷Ôãï7OZóvø±ã(°·\Z´‘?pm`ÿ\0â+¿øÅÎ¡ ƒõw]í•yEÍ¼7\Z‚ÆË–=7r+š£|Ú3¢åØécø™âÉW+âqÿ\0>Ðñ©ñ+ÆJ¦¹»Ð‹h9ÿ\0Ç+—CµÛò¦¨ØªÃOšÕÚXöz‹Ë¹^ïc¦²ø‘ãƒ)ÚÁŒÂÿ\0£AÏþ9]L¾4ñVI3jòd®ãûˆøŠó\r5.›Q†+Øƒ~d]qU¸·gÿ\0W\n¿O4“Ü$¢ÖˆÙ¼ñÏ‰a³I#Õ¤ÉÁcöxx÷ÅP‡ÇÞ-ù<ím‰#%~Íÿ\0Une‘àHPµ—<)Ø†_~•\\Ï¹šHØ_ˆ¾.ûSƒ«¿–IÛþøå5þ#x¿y­0õíøåbÈ«{q†”n,j‹¶×àdU¦û‘#«oˆ¾+^ºÛÿ\0à4üEB~#xÉbšEÖÂòÙ`ÿ\0â+”¿*‚9 5<3n·`£9ûÔÔ™6:Cñ\'ÅÞ`ÿ\0‰ÛíÇ#ì°ñ¥oñÄêÊ“_É)tÜ¥`ˆ~?r¸y*ÇÚ¦’ýíà…mçÄ:•>õIÉlÎšQOs²“âŠeµc?ê\"éÿ\0|VM÷Äÿ\0	³k­2FJŒ}šÿ\0²U{3yqj²\\®üÁ=Mcë‹}QO“°Œ~¼ÑJr{²ªF+dz¿ŒüP×ˆgÕ]c1àÇäC’½•r_x•@oí©€E¼\'óù+†É¯ešh¤1þà\';}ªú±ŽÔ¼Å¤\\…*9Á£šWÜ\\±¶ÇM·®4#þ\'™7?üE2çÅ:¦<Ýb\\žù1uÿ\0¾+›‘žÙXC)19õëì=*ö™`ÓÙK=äã\nX÷³ØV©³6‘¹m¬ks~ôë2×–SC#þø«‡Äa”hNv)ÔüµÊo^4iocb¶î£æiþb}0*‡•©C\"êæáAÏÙÐÏÖŸ´°”NÏþÅf\n¾\"L–Ù÷càÿ\0ß5;jÚ¢C.uVb¼+ùqc>ÿ\0-pi±Þ©Ø$jiùzÕuðâév²Ý–%Þ	I%;\\ŽœzTûViì¯±èßÚ:ÓB<½RFoQ|Ÿûâ«ÜjZý¬f[½oìñ)ä´Pÿ\0ñ5ÊXk>\'ñoYØÇlêdž!»rÿ\0v­ëGO{È¯. šåY\n‘»aÐâ«›K‹’Ò³5®<O«£mª´£Ê‹?ú%žµâk·›Qž5gÙ´A	Ï¿Ü®{ÃÚeÎ¡©]O1híð\nÅŽGã]¬6ÊÇ-–Q–ÇjÎ.O©SŒWB¼z‡ˆMã Õ¥’%ÎO‘çÓîV‚]jíoÎ¥:È?ºˆçéòÒ-™[ÍÎ~öÿ\0e…\Z#¸ºœÍË…n®a&Š÷\Z–³*¦¡pgažT\\}~Z¹ouªy*\'Ôåi6òDQïš‰%„Ü»0Ì¥p¯ášF¶žá…ü½­ ãJ­CKâÿ\0Ë@ú¤Áñó‘cÿ\0@®OÅ?dÒ™­4½Nk‹¥3ùqOüs“X>8ñ§˜í¦i.ÁGÉ<ÙÆ}…y¥åîr‘žM\\bÌÛ:»Ÿ‹ž+·8]ZIý{Áÿ\0ÄUDø¿ãW(ÕÛæ<¢Áÿ\0ÄW‘Éq6¬‘€2ÌrqòCZr¡#©¾ø¹ãX\\,:ã\\ÚÀöJ¬¿ütÀÿ\0Äüñÿ\0N–ÿ\0ün¸;›á$ŒO<Õ¯‚?\Z4§£Kñ—ÇP›^Ïý¹Áÿ\0ÄUI>8øënW]\n}>Çÿ\0^m6¥¼üÄ“U$¹¡¨e$ÏK“ã¯‡Oã…•¿ÿ\0ªÒ|zø„Ä_ù%oÿ\0ÆëÍ¤Ó0ÌhÒÃålôÁñëâ\'ý_ù#oÿ\0Æé­ñóâ(n<B1ÿ\0^6ÿ\0ün¼äA!)©Æf9Øjn‹örg ÿ\0Âþø‹ÿ\0C\0ÿ\0Àþ7N_¿3ókàÿ\0Û•¿ÿ\0®û6_î\ZkXÊ§î\Z\\ÃöLôñóâ/oÿ\0n6ÿ\0ün—þßÄLsâ/ü‘·ÿ\0ãuçmm ©©^¦¤‰phõ¾<|Aqóx‡ÿ\0$­ÿ\0øÝ]·øíã†P$×I=ÏÙ-ÿ\0øŠò ÅEI…Z©Ó=–?6“‘âôû$ün»ÿ\0‡5O\\Ie¬jî·ÈÞT+æû`\'Zù®ÞïcšÛÒµY¬/a¼³“d°°e?J¯d¼Ô	>MäÛ{1Hÿ\0øš†ïS¾´±i\rüÍ\'E#äÿ\0ß5ÎøgÄ^$Ò­uDHÚ8tVÆÇ=mßºÀHTH¹Ã·SY»¢ÒD1k\Z·ØÌ“êS, òžTüEQ]{]–ãÊ·Õf’FÚ°Å„ÿ\0Ç*i-.µU&ŒsŸZ½šl\"UµT2ç÷¹88úÖW‘¯º:ÖóYMKQ›cÓ8†?ñÊ Ôu½FàE«J-£#n#‹æöû•¯þLQÆ§ËÆvƒ’iÖ\ZL-k¾IYdÏÍ°‘OR‘ªóÞœ²j€M‘sÿ\0ŽVmõî¬½®¯*˜1DpïŠ{iÑn[ËÔ$\ZtVy»ÆSA<UÙ‰XÍ[ÏHÕ¤eEÿ\0ÄS%Ö|EnÛ%½˜ŸQ\\¦Êè%–+xŽÂ„ú\'z†x#¸‹sã$u¥¨ô(ÅªëB²‹ù¶Ÿúeô\Z™µÉ­ã\ruªÊ¼à‘ñÿ\0ŽQs¢(d@\0SQ]é–ú”~MÌXU9À=iÝ“¡~\rJkÅ2[jS”<$g?øågßêº¼6¥’þxdø£‹ÿ\0¾jì±ZAcXÿ\0…úÖmÓÚ]‰\rÔà¶ïº‡<Qv!‘ßøŠ{x¤‡ZfÞ	8†ür³5OxŽË…ÖœŸh!ÿ\0â+e¦µ³²ŒÛ£²…E\\šÅ•T‘å\\ÊWÍ#Ú¥Üµbƒø›Å¢Ýd:ÿ\0–ŒØËZÃ‘ÿ\0ŽRÁ¬xækY\'2Ä­ò´V1#ÔœU9ä–Dxe`ÈÙ`GO|öªÚv¯w¦kEŒ‚h*Áy*9Ùj)—5/øÖ1\'ÄS\\²€\\½Œ\n }vQcã´«m6±%Äù\0˜íá\0ŸO¹T¢Ôo.u	fx$X$$$Dc`÷«ð-£1ßwÝŽgÜ|«±­6¹ãFc5ñ`£$l„ãòJ†ÃÆšÌŽÉ&ªò°íåD1ù%7QÛJÀÃ”aŽ™#üjY­tÖÅÅ”F)œí)·¥ÌûŠÑ¹vÏ\\ñ“¢ÿ\0i¼¡#Éˆc=²·RóRpPßL¹Ù†ÊÌ·—ì2¥¿\0Q–|ÿ\0JÕŒÇ$M,N7_Z´ßr]®C(×#öÜÄzyÿ\0ñ¨êºæ›oûÝVgiNØ˜AÜl­(îÉ&€ï•²,ðÈ–A&rd¯Òªä˜É®ø†HwlJ„pq?øåR¹ñ\'‰Âæi×so	Ïþ9]%’[j\Zx™ÁSÆ0E`j¶ŽþÌÊF1òö¥©NÖØÛøyâ\rSZºÕ#Õnšqn÷F‹‚Þfïº£®ÑùQT>ý¡­+mŽØ~²Ñ[2ÆDªøwt›\0K¢xëþª¼ÆîêÌêAm›xAÉQ^ñ¾5’ó@ó‘|»°J¶:ùUäWv­¥^\"é×\ryÆõqó~+š´>v;•eÊe€ê1RG<R¶$!çXßÛ-Ð€IgdR«úÖ‰‰ˆŽ0z>x¬Þ…–D\\ü¼¸`TŽõ¼Ñì³rßzG;VNß¢Ê¿êù\'9VúVÕÇ•gnMÄÑ]LP³Æ ï\r–$÷¬k²nnM²œaÃ9Ï!k]v´~bÿ\0$Öa‡:‹ùg\"sQ­Æ‘Nòy$’2N)D÷µÄ‹l¡ÞL/NjíÕ¾ÅPÄŸtÖ£‰áh•9õèkdÈ’CoåóvÆr*¼Wã*±\0€>µÜ’(”m*=zÐÀ·\n¤I²ÒHÖyO½ŸÒ¶#™RØJžXVÀrS–úVe‹+Æ»ÆáÜzÕÏ´âØ@a»*1ÐVŠ(·ý¯´Ñ}©ädíœ}k;]M­)“(žbzë]žž.m;Øò0:qX~$µÈTaŽøÆ@êj©S¯û`¶‰ÖÑW`û¿©ªÐ\\ÝÜÜË€£qÙüént†c+Ü<Ò&,hv–ö­k­¬,ÖKxÙXŽw‘íKí	lZÒôXã	u<Œàò±‘ŠÓûQ@A\\ éÇ%óßÚHQkË“ÀUH¯®u\0°¬â8â^Mk}µØÝRXuƒ!_nèÛŸz×Óô¸-á1ÿ\0àçœVt?fkèÉ€È*~ûzšÜ—2FÍ²¼’Ü‘éE†IfÎFûq¤rç95—â\"/(Ò]²UAW­ »{„IdDFêÓ’£Þª_[Á5ò”FeS‚£Æ¦Q¹Q•ÄÓ ÃÚt’¼jßi`6!äc½hCg«\ZÏwXÈùwAìE\\´Ñâb³N»Ÿ*Ÿá­8„h©­#\r5&u.îŒÁ¤6À,n¤µ”.Ï1@<}ZÇÔl5ø®¢Õ^UÃÈ°/Ïìkp}wÅ®ý¿\0ñ»ÔÕëÅ2Ü©xÖH±¤ôo¥h¢‘”¤ÞæVƒ&¬Ño£Þ«ÉŸãÓµÑ[AŒ’ –ûÌzš‹Í%PÚqÈÍRÔÕ Q)•’ˆf\0ãqôªD\\Ñ1BŒp\0Â¸ßˆ~(]L6ŽêåI\'<¢z×J·V¶–ioõ>Y“9ÈÀ3_9x“^—]×.¯åf>ca?uAV‘,«=é|•\'ŸZÏ7¤äýj9æÚ½k*âëbðÕ¦Â6¤ÔRÙNÓÎ+÷T2ÜÜšË¸¿f$f©I6ñÖ†ÇbÌ×ÏØÕG¸f<œÔ,I© µy[\0VnV.0lý*Ô\Z|ÓtVü«¤Ð¼0÷Œ0„œõÅzN‡àˆãU2¦N+žUÚt;ž_§øJêëË$WOcðî]¥ð¯]°Ðm­c\0 ¡öHp¢¡Í*”QåVŸ¢ß™qZÐxÙAÌy®ù-ã\rœU…‰@ûµLÓ‘xþ·?òÎ£>·ÿ\0žB½Ä§µ#B¾”ùƒ•e/€-Û»ÅejÐ©1žÕëÆô¨\'‚7LJv3”ó®±à««0^4$sÐW(êðJRU*Àãšúrÿ\0MŽD;^gã/­Å»ÜZG¶T°ZÚ38êÒìyˆr:UÛYÙHæ¨`«x àŠž&Ã\nÔäjÇµ|ñ\rÔ:•Ö‹çGuõF8\nÃ©¯d]Yn{é•y*¼à[øXvÁñóA\'$ôâ¾”8™8}ÈÃ¡¬Þà™N_÷i”U8Qj¹·ËFfù˜~fˆÂºÞeãŒVmìÆÒÙ³qºV8QžIì=ïq¥§¨”KäE«ÐZñRr\0úÕYLvb;¢«Ë`qš–ØÞ\\å¤o¼ #Ú«“Ü±Œˆ°ªhéH!»1K6«jýÊ‘Ðc¯µ>Ô-Ìm>6;ñÁéŠ9®A®¶ö–Ê²&¶ÁÍˆ[)\"%ìx©%j³HØÞô¥1™!\nä:ã¿ @[«Ò”¢ SQÏ?ÙU‘‡åzŠ†)Ã\\· ¯-žŸ…- I73“œ`)éY‰oj³‚€ÙÚX&åVžåžL	UTñ÷yªÓyòüŠŠÑ¡çœf˜s,Çæ+&GCÒ²îm…ÄBY×†9.ÍÓéZm£G;¬“1n8R2ÐS¦Òã^P;ã cÖ“E&swöÐK\n¤hd;q“øÒèzO‘4’•Vuà(\"ºw°IÑwF€ŸJ«x›˜ÛÁ¤dâI7µG\"/œäod¸’ù¢‰HV<–Õˆl&·R]Ã1ì{VÖ”m™¦IËg¢¿_ø\r0¤‚•c2LüÇŠ‰FÃNåy-Ê•ÇÌPU{™n¬$Šé§a‡ˆJîÇãÚ·¢±¹¹j•,GDìjhôGHJÞ\"¾á‚$ý(ålFM–½5Ä¨\rš¸n|íÞ«N×[›/5å„‘8P¿Î«Ùø[Ê¾E„²Ä‡>]lÉ§5ÙòåÂÄ§ø[?4šB=]o&Ä‘²«ðêio`KYY]þPÙéøR\\é:nŒãiÜDŽä…?JAgqª©q¨Ç!^J2qíÒ‡s\rYìõV†7‘­dþêZ¶šçu›*Ã»ÌÁÂãUµ¤†ÙtÓ#)šoÒ¦³ŠÝâvi$ô\'’juõ4> Y×1Þ;oç-{Á»µ«„\0bnŸYh­áð˜Ës•øÚÜh[‰\0GtN;ÝW‘Äð¼ï,q¸Úõ5ë?œ,úr3×8éþª¼ÛO÷*nT‘Ò°›÷að1E<f9í‹«ã^•™ÿ\0ü°¨].g%|¹Ü”Ç¥tBròa•‡a‘Ö¢”Ž•+è3š†ËAá‹[ëk™ÜˆÈ±üªµ³­Û½í¤BØáœ|¤öª:žcÞ\'Ý]ª«Æ	\'­l)!U F6ŒÔ\nNÅ8WÈµDnv&\rQ¶>eëJF3Ê=êô’íÞ¤dçŠ¥ì½¸Ž\núµö‘,ÃÄpÙèk©hÙä}áï]üÛãÛ${‡\\VÆrª\r¡ˆ85W!&ÌÞZb­“S‘MÁYI>”·C!YOrG¥4î7#gMUx»•ê+Eí6Ì<©3\'UÒ³´\0e’5»¾+­1YÛË»ÊÞä¬¦µ7¥±—joŠ‘+…9ÇÊzÕ\rJ=ºÍ¨wÏï•‰ô®¨\\;BRÚÊ(›©lîÝ\\®±$Òø’š1­*ƒµ]5©5N»Róæc+\\9ˆ6hÁ\"®iÑ›VgHTçsðiñŸ\"57GÌ}ß)UÎ=ªâÜ¤Ž°\"o_âŠ¤µ\"úXYYÜZùfGÙœïÎ7\ZËÖSìwPÛiñ,qHÿ\0¼y7Võµ¼ï´ˆãV_º£µE«ÙèáŠâ6gWÎ°jÚ%7q‘i°ØÙ¤$|ˆ?Š®ZY\\<ÂI`y	ŒÕù&´´…Zb¸QòƒY··Ò\\²Çjv62w mš—gÊM™<þìàý3R[Ù¥¨2È?ö‰À¬í<Im™yUÄ;š}É{ËVPI,w®þâ©k5Ìq¨!Ôú`Ölžt—`I¹ûËÑj¬ÚŸf\"xV;‘÷Jÿ\0©t^§Ëg•ºÜ¸ÏJ«oÁ²Ú5V?>:zÔ1Ý¬º´Ð *Ã>•:‚K,’>Àcà&y?XI ¸PáX}àÃªD’¥¶é³ž)×š}´öÿ\0éq	Uzè\nž%Â†\0Ö/ŠüCý…¡ÜÜ¾vÐ±õ<f«Kˆàþ%xÆm:]HÄj=ú(¯’}‹–nk_\\Ô7ù¹¿ÌX±þ\"zšãî¯s‘š½€žîõ‰?0¬k›¢ÇŠdÓî=j«Æ‹ŒBÝiƒ4í„ö«VÖÆGnsYÊV4ŒnÇØØ½Ä€*’kÑ<;àö“cË«ð®vÏp~èÇJõ+0B£3Šå©;ž…*i#;GðÜ1*â>žÕÔÛÙ¤J\0\0\n}¼;`\n¸±qYGS§b±UÏãP<h½°~µ§äÆ«óŒÔÇ”VÂæT›•‰FÏµ	zT|Àþ5,üß)È¦4.ÍMŠè9/ã-ŒóRý­\rg­²»±2Ÿ­)µŸ?*\ZV…·¹R}j{ñP¼SÅ÷Ó_í#qGLƒÖˆe‡e–\"TäV-äAÈÛÖ§išÑš0rÊš®óy§éJödÊ7G‡xÛHþÊñžRâ†ôþ¢°ãæ½sÆš*j6æBhQˆ¯&…30QëŠì§+£Ëª¬ì{Gìÿ\0`²ø†úý”2ÚÛR{?á^ô·J’PG ÇæŸ´Èô¯Ëu+*Í¨Mò£J¯CÎ½\"{V‡ŽU»œSÜÊÖî#’MžaVî6âšúl2Ê4bFSÄô© @‹¶Pw9#½,‘»qn\'Þ€©,Š’H‹:qÙ“?…SŽÇQ•J‡-¹Ëcè}+^+ˆ–“icÉ,3øUÑ,gVeÀÇÝ¥bŽf]éŒ¸‘óN°y¬BÇ\n,Q¨ !íZFî4i¤\nTô^zŸJ¦Š÷?2FÜÿ\0õ£–Ásb	c¹M’ÜrOCSw´€¬qª¹„ò½j?µ;N’—*1ò†¨ƒ^xd­¹ÛHè*’>i#ÁìôI$¾Qy|¾€‘–4ß³ùÖÍ¹ÉÇÌ({=¥Ä.qm…oâ=\rZ{›kx]Šc©ZE,Qï‘ÕÐ\'ÊãŸ¥W¹×a¶·r yˆ§íùœÔÞÅXÑ´¸óÁ3FmÔþðÅfÞê/.ä•¤ „=«ž‚][U•\'¹‰Ö9FTÆ©¥ÄPºÈaó–ŽsÜ‘éSÌ¥ùï¬ÚÑÌ39¢©ÝNðÛÆæmü\rXF7/2uÀ^ý§¹Š)äÚ~Uj„gÍ{%ÄQHU·/\nØû”ø.ò4‚ FÜ·e÷&ž‰s&åysÎÀZ}›Çgæ[H™ŽY‡j‡rÍ]:YRôÆÂ\"7EßÞ¬]_+Ü=¼;CFF»ŸATµ¬íU-íÐìn®½@ª—3GeqÚ«É,\ZN§éB•Äé->@Lü»÷¦›XáÝå\0€ò@k\Zß_†FVÎ3ùV²ê¶O5påZ)\"lÑIî1æÇD0À\Z‘mÅ»bÒ5a– UkJÁO™Ú=ª²kÊ¬‹¹_<^‚¡É\\«;âXž)iÛ½Uºµ°{F—ìû]œøUØnbû¬™éÖ³5Iš;W™Õ·)àc­V–¹*÷à4‘u]]ß%Z+}¤õàËE\'€e»—TÕâlM±}e¢ª;þ#•øñ)Iü<¶™ÐägþyWœX$±ÇûÙCÐzW£|v¤Ô|4Ûw×þØ×Ÿ[B¼ý©VLz\ZÆkÞ4Â\\Œ®òÄ1Þ“Ïc;@Ò¡ÌR;Ð¿Â2hW‹Ë!·°É¬d‹Eý&5’î&ÝÎKëZSÎ<÷\\ó×5…g,Ö×’K*~ê(Fvö$ð*ìe¦2|ßzAŸ íR…=FI)7nÈQ’j.Dï3 ù	<òì,¨¡žC¥g@^Þ+…[+ŸJ¤ˆè:òLÇ$€}ÑXSIö˜÷w5¯.$¶t,>n¤\ZÏxVÚÇLž´I2àÑœ] ·fdwQÁ>•å wê\0­UŠ6Òep?yœ}EdÅ(DdÏµ(è9loøe˜ÜB#BÅ”þÕ‰­d˜Dî7Ÿá\"¹ÊWHýÖ2=k§³¶G>à€#¥L÷4†Å¶ž(mº p£ø«’Ö.\ZçÄVÓlhÙæPUºŠêª}°^Üñ—-Æ~•Êx’õá Žu,ÊH÷«¦ìEMOB‡S…%1ß þ1Sé÷-q©6B2 8u=O½pªË}ª(nâEzF–vq¢eD’Ôõ¢2M„ ÒG¨-á\"ícB>âŒš©wy ·ù$–V\rµü¥Î\r\\Öum%Ž(HÎ70SÈ_Z«g¬[ÛFZÕ!\nX¹}¾µ¥ÌÒe«]3ÎLÝ³ÌÊóÅkBÛÈ$kÍÚ¹K/-åÔŸg†HãÙòn=Å^i®gPòœ¯\\b‹ŽÇGöÈ§\0Ýóa@þuZWŽ“q~½1Y1ÈÐC,ÊWr¡d`y_­fè~(·½ò¿´®˜üä|¯ïžÔ\\9NŠÞH®˜}– ]FÎ\\úU§&©‚’D¨0qéžõ¥k¬XÊdk{˜®0pu*ÚIzù¶b«œ°aTIZÇNµÜ¬%•â„aß×5»g$x%QxÝÔýM$:bZFK3<×=Ò«ZÝ=ÌÒ òâˆá·OÒª\"ÐÂÖ²³<±¼Ð@OîÂ¾wb¼ÏÇ\Z­ÒÈm®æwd\0°/œš÷–xå³ÁdÎp=«åjâÿ\0^¿–<…3 úŠ¤µg9ª^A=kžrÌqVo§Üzæ©E•°*Û%+‘îõ§ ÜE[û)ŽôèlÊ’1Å.d[ƒ°‘C»q]w„´½¼VeùçšÌÑô¶¼œ ¨¯gðž€–Ä6ôæ¹ªHì£\r.t~ÑÖÚÌ3 ‡ªZ5=G×â[j‚EfOÁ·šÌsÜÖV¹ÓÍcrÑåØëVÑÃt#¹¯6¹ÖÖÙ˜FÏ‘÷™»ÕEñtÑpåÏ<õªQ±›™êÒ²…ûÃëT&b¼–È®<X·\"Òµmõ£2²W±¡è\\dnIžOáD2or¤v¬Èï¾M¥‡©¥2H³JÄqÀ©¹µî_·µ¡‰(òÇw(ªCÒ¨ÝjÝ4É½‚lÊçs~JxâN8&¦I€ÌÃŸzŽXíæäJ3õ¦ˆr1în;•U#ù‰­;»S`cRhÊƒQ!­Œ×·[«ÄŽC…e`G¯+Æìt‹›¿µ…¼-çùì‹õívÄ.­nOðÈ3ô«V>›Ãúµ÷ˆŒi,—“î·BNQût5¼tÁQ{ÇAá›ì‹;K5Ž%š	ž¹=ðkÐmQn\"ðÀõÇéV2ÇxMã¢2V59Ûø×[\rÅ´JJÈ	±¢ÌçkJWˆÒ-Þ§8  D%(ùçw¥T‚ëÏÉT#æêÝªG¸‡r2x®ƒY¶Ú:—p=R©[«þìÇrÒa~ãµ¢ciÚH¿„¾Š˜lc†EXÉG^Ô¤2í]%M/—9íÎãGÚœ+,ò$7!Goz¶‘Hª¥Ô§85MmàYÚK„ùÙ¸ÏJ9’IBÇŠªyúŠq³òÂ”Ø\n÷§¤²4ì©`)Ç^MH<ûgL¦\"Çªœ©¦\"üß4VçûÃå«º[©Ec+1åˆÂŠ†KøVG\rr®HèGÝ¨à„;ïŠè9‘ÔR.fÔ^E†Ì$qŸ¿3/ò¬ÝSLŠd·¼aþ±Îy÷ö®¦ qÎ>€t¨uS5«%º¡vþýÎRêÞÞîÍPf’ä«Fü*Þ†¢ÞFicbª¸û½kFÞÊÞ+vk©&^ëš¦¶’]ð	:ü œdTY£E±³o\ZÝFY!U±ÆOáM6™‘X“…ã ¬›ë	mÿ\0ÕK\'šNÓTeñ\rÊ2’ÄŽ\0Æ?:|Ö\"Ú…Íõ­ä°‰IèsŒûTbX®\"vIKlç«}{}u*ºÃ,l™XÖ H¤Õ›m=/4éŒŠU¿ƒg-¶ZÐÆÏÛ–8‘Ÿ?{Ò¬HÑ¾èîýÙù>n1éKöfµ‘<–flàóÚ¥ŽÂÚòiœ¢aÈqQÊÇqOgo\",‰#ôeÛõ«¥ù¬­m*…nxê}ê4ÓD`$‘*r_×éWàÔí`o*Tù—€qUbnA†’KæJº’\0U££ÁÛG§½ëÖñ1òÝÜc¥C¢—÷^]Ú‘	èW­éZ„’˜—Ëñ·JÂ¼ÕîáÕ$´™³Œ•kT¹{+˜Å¤náó”Û¸ªŽõËÙ®¡¬_KvpŒ®CãéYÎZY\ZA%¹è~\0“RÕY·ÐÛà±í™h§x\nâiõMgM¦8-†}y–ŠÞ—ÀŒ*;Éœ—ÇmãTðÁå»ÏþA¯=´\\1Ž@\"Çñgƒ^…ñÔ«x\\‚@ï8ïþ¦¼ô$	óH®F2N*gñ;ªÎÆÛ½Jtø`ŠeŒîy¨ãb\"-à÷Aã —hórÎÝÔqŠÉš#U ÛjW™$~‚ž€,%×ï;4Íï\r¹h+\0ô÷©­Ôyi}í¹& )Í/’êäe‡jŠX]=Ë¹²3SÉ›q!ü?*¯u&Û@ƒï”Ñ”%‚(-áDmÃ<õ¨¯c*›×}ÚtLÛ‡›Ë)Æ=é’È!½Úì\0ÆYM6TUŠqy„#ÓºÖ\\q©¼tcÆîµ«=ärÃ+\"€ËÇÖ²mÛ÷Û½Mr:oÛ{¹#\n5Ð%Ì¨h‘ÞsŸ¥cøfÃíÜÊ£2+¨É8\\WMÂÅÄÃËpAŒž¦ÐØ¡××W‚+X‰CÉ/ÐW!®ùŸiýçÊAü+Ðÿ\0´ÇÝ²PGMÄb¸=|3^ÅŒ¹šÚ2\'¹VÚú[k€ð0Ü¾µÒÙêÓê³nEÈÁë\\»Nvá»ÖŸ†¤c}\'ÊX’}q&ÔŽ·gFóS¸žÂIìMÌ7Ù*¡*ëè\rE‹5{hcI´—˜(rêqë]d\\E»x‘J‘×j¶–ÞÄK\"ä»g\n2kª70m‚[û8Ý­ÃDÃTúU›kNÑ4ä[éÀäP7<ƒØ\nË´‹íò)„ybGvà²ÿ\0t{Õ;ÃºZÌ\n£»çhó>b=…]Ù\Z\Z=½Üj4ÆUG™ñœëW.<?\rÕŠÀ©n°íû¥GÍïS›H4Ët„É“œùj95$«­‘f+,i÷6·Lö«FlÍÒ<%a¥]„…ÄNÒv×E> \"(°¨^•Š.îæA¯˜ÆUŽ+fÈÚ·\rÕ^XŽsZ#9[¿Üoº•Q,Çµ%®¡o}5‰ócÀSL\\HöùYcs!^ÔÄ½·´@¶pânØW©¦$Y˜¤Vr;0\\#\0=N\r|]­^9¾¸WûÞcgó¯®µ¥yo¡†[ƒ²Ï\ZšBzlWÊ>>Ðî4_ZM*4†HO]ÈNA«@ÑÊË)$æ­i§,Ùôª’/Z»¤&ù{Q-‡\rÍ#ÞÇ«oIÓEÌr»¯\n8÷5NÂ!fMuþ€\\Ë%¶3žEs9YÜ—Eÿ\0	è@:Iåà’	¯Rµ·ÀqY:>˜-öaq]f-¢2Ê]ºóY½Y¼cdf²”…äšš=;í\\3\0lóM¹Ž8ÞkË±rÇœWâ_ŠnÏká¨øÇ7¼Ÿ¥?Ar6vz‡† hÎôÊQ\\~¥áh%,mQ¯©â¼òxŸÍ-&«1ÉÈ^Õ½¤üCÔnQ#Ô#ÑÇªÖÄ^-ò¢It»‹&\'zæ¯Ùê3D¡AÀë­Wí‰—Œ&GcTmØO?–k6l¡doYRIËWE¡\\Ìl‰“ 9ÈÏÙxy–Y”•ŒWEöÈ-âÚ~]£¦*l47PÖE¬‹f±/õð8Füs\\ç‰µc-ð11À¬&’{†KgÚ¨ÎZþ*hd+æñìj²ø©„Å¼ÿ\0Ö±‡‡îîÉeV¤\nÞ*çcì+H£š;‹<Ñ€Øqê\rnE0šqÔWšXYÍ¦H7«õ»õdˆÆÍÊŽ&µ\Z“±§¦Û,úÂ3ŠôËT½º·ó^D…TN7`W! F‹~óIØñ]ÂÉ*Èrz€kX­Z¶*é–¾J¢£mÇ¯5–ºvž»ÑD%;˜äÖŒp‘3Ió6q··µaI,†áÖy¡ûªÉ’?\Z½2I²Å¤——h%F…¸SŽ•jâãËXÑ#ÜÀrØàÕ(uí£)³\0·$v«3ŸµÛfÊñSqØXuXa›lòmÝŽ¯ §Þ]‘2–rçªŸ»Y“XÍkwkÚ|¾zdš†ÛP7—Á®VU*xúÒæc²6~Õ½ZGi##ëÅXH£™@%‰ø»\n¯öy\rÀ”yqÆÃýRœÕ¨ÚPŸ½ÁÇqéZDÍîTþÌX¥-ÇSÈT²»ýª8ãñþ`Òª!å’IÊ¯Ã<ca /oJ¡š¯Ø¶$<mó’8\'ÓÞ¬[ZAžll#%A\'ñ­‚7‡cAòƒœzš¯œFWÌ7nÊ{PÂå\"EûÄgõ©$H\r?*¬‹y.¤€x9Æjqå˜÷!À“ž)\'ÚWl‘¨z€9\'Ö¦‹k#Q€Qº¢ƒQŒÆÎŒ\Z5èÃ¹¨~Ù5Ô€·#\r!ëb+‰dv’8Ù“ôšº|lÒMz¤ä|Àž¾â´¦Ôü•`‚){ƒî}}j¹YmÝåmî}IØ\r’Áh¯*n„BœuúÕgº½dNŒ03æ(ÆÚ°‡0‘cX÷}æjËÕg/:\r*v.‡’uaëî*lUÊ°ù¯3¬¬\nÃÖµìô’Î	[c9V J‰@ÁÇ+ëô«ö¦6uW\'rýqR·+¡}ìWÉÄ»›0j›—KQ±{ã$Ö„Kp¤¾\0N¤šæ…x­ä]Àà‘Ú¯BæØ¢–ìÜŸ5~á\\U¥†8\'?1E*XJÓÔÙÂ ¤Ž±6T“×=sX:…ä÷ž\\ ‚Ät¬ÚFÉ”.î¯\0Ymd4œ\"†íèiöOsi+Eq‚g;Ÿ\rO§i[Ý3«o\0rÀõ©5--/œ²I¿pùAàÖRõ)3¦ð1Î©ª“Þç-ïº¦¦¸Æ-í¿œ´WU?…óøŽCãœB]OÃ ±gŽÿ\0ê«‚VýÍÇß­zÆå\'SðÙ[¿ý¥\\Î­\n¡e\\qYOâ4ÂG¾F²\r½š«Ë&òPäÄTìƒË-§<T°Ëw –\'…>µ“(ÜK`öÑað€‚Ã×Ú­l½ÍS¼v¶µ‰cêNO½2+Öh¾a†ïíQq5q®|ÀdÔšÏ™ÝîÈ0p{Š¶²‚Ÿ›¯Ö¨Ép‚éâu¯˜F&uìî—XR»†CzV}ÍÁš®s\"œ–õ«z¸	y¶6%veI¬·È3¿œŠ«³&Þ¢Ô€~rsO·(ÖG{¦k<­É­¹[›(ÑZƒŠ,=ßÂ\0:IAR¬ü‚{Ö«Úý½q4…Tœå88®cÃm°e$Œ½uVðï„€•#øN+no ±„€\"#:¶9År7ÇíZô¸™ŽÜšìì­UÖL„Ü2dþuÌ,QKã;hÚ0Èf? 8ÍmIhaQê>-ï/$‘6‚.ÇîÔvæëE¸”ØÆ“ùƒk©í]¥ÄÆ\r§-´JHÜ$Šä¯µhØ‹g,Ç¯Œ’R¹¬Ñb;õ™”êºMÇ–xc˜­É¼q¦,K›e,ò*lƒ¡í“\\¥¶¡pÌ77Ëï]&i÷¹Ú,3ZFW	BÚŒŽ=nöàê×j–’4AcÒºíIµ»Iãh|™!\n¢HÎ	>´Ëˆ$Õob²Bgåã¶;×E¤iú<2A372Hzí[Æ\'4¤14x&eóÙŒ˜Ç\'“Vÿ\0²­bîÊ£¦x5m–8”JP³Æ(p×‰…aü]«K#6Ù\0ºµ·V7ª»·îÐ…Adÿ\0n™+F†üMÔþ\nøsE‚W{ƒ4î[qÉ½…m[ÇQþè>wêi¡6J\"…Tá,0p*¬Ö°EòT¦:©.¢‰™UE^¦±„×6÷±Ï{pÑîR±ÚF7÷cM„KgH²tÆí.9køà3Ç:/ÙD_g¾·Û\\¨å¡õS]q¿s„™Õ³ýÚžE¸Š4û<Q¹s÷ÆÑRŠ>0ñ\'ƒµŸ\nÞ}fÉàü’uG Ö~Ž¬ºŠ*ŒïãöŽ¿ Çâ+dÓïa†êÛwÏç\'éé^Q­|HÔcÔôàðDÆIm%ê«þÉïN[ˆóCföö©¼`šì~iÍ&£-Ë‚.èÖ´FžvIBÄœ×{¡ééÐE´m÷5Ä÷=t—)¯%Tc­-í•ÄÖìêÉ¹WåRŸÖ­Âƒœœ\02IíQÍs&ÓóˆãíêÔÊZ˜2xNÊþ×7o4¬GÌ›ÎÐ}*„¾Ó-`0Ån¥<ÖõÅâ[üÌòa8­VmVÝ£,$GÇlóMhgšk	´â1ü V9ðóEó|ÊúW¨]ëv‹÷à_­a^ë6wA=1MÈ…NÎç$—	ò$t·á=>yu1$ëµHè{ÖÎ›¡Í u€¬yêEušf„°I–Çµfljiöá`\0GÒ²<E‚Ýü«Tžý\rtÖðˆ£Ú:{Õ\rV$ï¹‡JÑ-hð{öoíIeÚÊÜŠè´¨-¼µbñ¬OÚIýµ!Nwz…mu+ñ’=+jgÔîÄz^”¡.ˆ\\óÇ5\Zxÿ\0Ã’…™sßmyÕÆ‘~ìÆçpsÏ<ÖbiW^cŒ‚½x­²0”ÝÏ`iôÍjÙšÎD|~b²l­õ ˜#¸}\"{­?QˆnhÔœØ×¡[7q4ƒ¹ÔT°jêç[cy•»M9Ú3Æ{ÖæŸ©ßÜÀ§Å¦NQXqÅyæµg{«ø“OÒ¡”ÃjpóºëÕmn,íáŽßI-À,aã;€ÿ\0ëóBz˜M+®uíUm´í—™?½výÚûã½fE{â	e+1¶·#€ÁNIõæº+–†òê7·ÝÁçž´j½Œ1“\n<ÅÆ!-“W«1E8¯ôÕ€&¥ˆ¦A—9àÖ¬3Ã-«ùo#Šç5+1©[Ï&¬PÂ,IÊJ]3ÃvsX!Š\'Úƒj4í¨-nuösy«aÁèsÒ«ÜX,Ø\r»ä\'zÕh-o,íCûCü\'“øU»[âìâX¤Õs’¼¥ic6Ë\ZÁ Ú23·éVYÂÂó€ÞµJZÖFdr¨ÎX`5Käs±xÆèÀù‰éŸjµ¡Í‡®@Ï\\U³KÒYI	áHáG­LÓyÐæ>AéŠ§quyebˆüßÅš\Z-\'Úv“s2ƒ»‡aOhÕ¤…‹¸ÝœÖ<‹s,H×.TÃ¡§­³ÄQÝacÙÍ+•bg1=±rZ2\n_2 ©\Z3a‚Zi‘Ä[—ýÜTÒ]]ÏæI•†ÚXzÐ\"ìV‘…ÈM™íL¹ˆe*Ì»G@*ÔÓ}š5|Ç¦áÒ¨´L™Œ®:­\0«¼™0êW˜¢\'è)’Ý)»Ug£‚)Ó~ïÌk–Ût;«> XHüØÜ7NÄ•—ucÝ1Fýò.AŒä­X›SDÓÿ\0tÊÎãj„9Àõ5…ý–PÊXî;#a©9¢hå®£(H¶éN¶…c•œÎ  À*3»ëTxïD\"MªrøÍ^ŠËÉlp1À÷¬Óm–Õ‹²]Æ±\0Y$#ºŽ”Û8R~a äì8¨¡EòV¹Ç9+€M]²·1‚>@çºV©™½!»‹cºmÝG\\V^©¥¦ŠîPïÑã!­hÒH.Cá3ô«½úÇçŠ»äïCCL†-%U*¡Sn6T2iŒ’\"Ä€Øà}kZØ´±¶õhØrzÔÞRGÝÇ=ªÔU‰m¦Rðå¯ÙõíM»Éom;`ËEYÒ\nÿ\0oj2@‚OÖJ)¥dKwgŸünmš‡Ñn¿öyØ‰L½7À=³^‹ñ¶:ûÃÃ8ÂÝí*óäCaw=ëž§Äk¡æÕc\\+Ÿ=ÇzÓk«iÊ­­™€/\0·z©~|ÁKïšHP%Ü‚MßºÏÒ³z‘oQ—r&Þv`­eËtÑy²·r\r[ºX[ eÉ¬«€&†EˆîÏZ‹¢¬hÅ*Í6åäm¬½BÞFÔ#‘£{Š¹¦¨YJtùqNÔ`“ÉýÓ.G­[3#S…c’<Yi>¼Ö­å»2õ­›™g’¹KŸP:VEÌlXdmõÍi\r…\'©9šAÇ5i!HãwZ®„ÛÈi#Ö­C/Ÿã•m#;êoèQ<ÖÇ÷›0 c­uÑÝ±‘ã…°\n€žµÏøiV[#¹Ö0¬CzšÝ[S*wX£Æ^¸®IèÎØj‹êm^â(¼É$pA$/ÊßZåde_D_*ªîxí]u´·²@_¯.:šã\"»Š?¬÷1åþ÷é[SzTZ›z­ËÍ`—“s9ïíXÊ°Î~p=êük7—\"ÈˆÈÙ`‰ü™ü†!þæW­fÕÙ´}Ô]Óô…‘@Tf=x®«Ãºaû`ÚçosVt#o››ŽV·¿¥*ùÖú»^GÈÀÃ±<Ÿ ­!2\';£¤[U·™ÝQ·8è£\0\\Õ«iÛ!”fLe€ªnY¾XÙ˜€#åj|1IvIa²1ü$à“]G+Ü°VYÝYþTÎx=E\\D¡ä}y¨`ƒdX-Àíš„³[ù’\0X)ì9Ç ¦„[ÁŒ`°‘OŽë{˜Û¨â«ÚÈápT\0ÜóÔR™aŽðowqŸï\Z.–†fû§†¨\\Za¼Ï0nûzUãp~ìCíÒ«–V•œ 8bOZ6ÒÎo1‚³d…Ï¥NðÍæE²U\n–]¿xzf¡dÑÇy\\ÌJ¾’Ç\'È[–ä!<æ„2;ÅœÄéyE‡2ãîþUØMØÞT’áàlÿ\0|Uµ‚rÙÃpöö¨#Ò ·¹Y<¥óH*[9À=…7°ÓÔó{-7Ê†çÌRÿ\0.{õzÛä‘sÚµ¯mÄ\r,ÈqY].:w®nzÔÛå5¡;øê?2íT…U@ÞX\n95f8ÔFKu\'4Ñ²(.œdSç1\0ö—¨x[N—–Yx5t­…ZÍ¼“v0j[±häÁ¶2¾³ž½Zúg„tÛF8AaüMÉ­hK9U¼ñŽœ	’U÷æ’æ¼V«\Z€1íR¬Cøy®fßÅê€6ÖIusÀüë~ÊvØ«\"O]Þµ¢3•ÉÀ;±Xúª’’äW@Wâ±ï“sž*úyÖ­¤ùÒ‰OÞNÒU·˜Ç3m®²ý³\nÉ¸Ñ–æ<Æv·cS°Zâ=”±+C ßî8ªë¤],˜dŒ!êqUBßi­‰cg_ï-\\ƒXM›n^HÏbV—0r›ÂÚ}å©Kõ™xÁªúbOm7Ù¦Û\"ÀqÉWVþÝÆÃ9`ÿ\0Æœâ´-þÌÐíC¹}XsAŽ“ÃšHš+Bx—íDQãûj[C#Ý¢O‰Æ/j~<v‘N#b˜|ãÐâµîYäo%Ä=6¸EožmYjfZ[¾›æË€;1Á<Õ5ÔíÏ%ÆÖ•¸ÝÞ¯]Ü.—Éx¦Hñ’Ê¹çéYrjšeþpÜDÀræ\">”¤LM«R>ý§„QÖµ\"¶X†BƒØUM= ··BŠ«#’O5 ‰ÜœUÓWDÉŽÀC`^žµÑ†„çrñœþÕŽï8ò†ð¼€;Ó™ÂI¶D,²\rÍ“§ÓdŒ\Z=¯w\0ò³òÎ>µSP†Dî´ë¦P‡˜Ø|§Ú·.\'3 HáD\nGåUuùí´}5®Z,®@(?‰»Re-LX<I%©òg·Ž!·#‚kI5G»±Vûì<³—íY¶·\Z¤os0Š>ÎW8ô~ÏM–ÞÜ	®üõSÐqúVI»–âJ÷—ü°À˜˜ä\n]ó[Ûg*ïŸ¸£€).®LMˆ³ƒÇG;edùBíÉf´$d7_›<7\\v«±@ðÇæÀ›ƒ™ëM‚„NT¨8ä×Þ¤W/f#PÀ/ñµH’µ×ÚTLªòTq·ük9îòì¶BoÞu«ÓKµÀØÎ€|Üô÷¢	•Õ–<=ÝIE-Þ{¶Þ¬˜åC/õ«Ús\"´ˆ]GÅ,‘\\<éšÁ@ÝØúTWwrØãÌË‡û¤žE!¥qž\"b°B‘9oñ¨\0®K”É<n_Ö¤1\\\\æI™¶ Üqš}ÉÁ½€8¬˜ùš+]ßhE1g/z‚Dû¥ÒRñòüÜý\rXy\\\\üÇ,8ltõÂÛ]Æ#yWCœÒ²Zí»Œ‚ð´‚QÈéJÞPòÌL2Às\\³Õ§½hcºŠ(•²¬¼f¶7ÜÛ@#Uši;»V)´Íyn®v±Ç)]ÇÞ©]Ï,Ó$ÿ\0*ü£iÈ®Rã\\¹oÜÇgp\\¹~ƒñ«Õ‡–«eaž9µç\'’ÇD—êÈ®$;“ÆjêÏŒ³K’z/¥qº…âÛY‰e6x¡>Â¨Ï¯\'Ù¼ï9°‘´äTûPöw;ýT—_ÔŠcýE¾qõ–Šæ~ê£TÕ5¶Ã†Ž+`w‚;ËEous+;Ÿ\ZÁ7ÞÇüóºÿ\0Ú5ç\n˜ã`cêMz?Æ Æÿ\0ÃÅzºÏþA¯;…cû;ÈÙß—µ…OˆÖˆ¬‘“&Ôç\n©©Ö61ä°ù”ñUž|D ó‡,N6ûÔÚY™fi†Þ]½}e%¡ªdZ“2ÆW²ã‚÷-jÛcù‡“Ž•Òß\'Ú#&>k1!vXp5’+q4¶c33sÅXÜf‘”úô¦ÚáQ™F95*”}òtm˜îjÑ2EèÊ¾Ø>QJæn.¦B|ô\rÏÖºin™YòÀ.:\ZçæfyK2d0EY’)ùÞlì\nð½ªÝ´,&ò±ÕYˆ•”z\Zê¬íR=>\'`	ÛùUÞâjÄ:mÿ\0öuÝÌF Ë#ÏýÑ]ž« «=\rqÑÅ,ÚÃ¨eŽ23¼ž~•»o¦1Ré¤ï‚1\\²Üì‡Âm\"µÝéHYã\\`<ð®nÞÏíž*‚ÑÆæù·\0}+[Ãsˆ|B¶·líœÙ5_DPŸeL{\né¥ÄÂ£ÔÞ}6ÚÞö(²…\\ÍÞÕÓéú=¼–qùÍûÄ9\nN@úVb¢ÜÝ<ï”g\0úcÒ®ÚÞIo7Î¸,x‚¥$˜îì>Wƒ\r’2O¶Ó}Ä æ`e€<Š¡yk#B®T3uuÅ@5i4äÚmåƒÃH‚?Â´D3¡´q$jŠv¿üó#¥hB‹Þl{šÆ·½×˜ÀÊƒÆ}N°\\I/ÎìŠ{uÍhŒ™¯š!\rr\\±·v4ùî8ŽC(#ïÒ¢·‘ UŠVŸ»žôë‹˜á…¥v!G3š«¡u*[y’æt‘±–6­X{Þ(m»q•ã“X-ªÌÒI1›X¶óŠšßQ{‰í¢k/~Y‹@¨¹v.Ï{œ°VUSò“ÜÕ:âK¬¼±ì~R{Õ[Ù<´_<,hÎüêÔw~d›(Ú0OjIìXû0y‹äúôÇŽE¼iãPdDÚ¹ïVEÓÅg»ÍYNqØU;ù÷Y;z#8G÷ˆúÖˆÍš±Ü¤9]ì>lv¬ýgUM6Õå¸ùcw§­D°Ç5Àw,T\0aé\\Þ¡ I®ß½Õäòœ,{°»`=je-+R¨ñ•è{•r›åÞ1»éHNÇÝÞ²µ»kK}ˆÊÏ‘±ñÐçÓÖ´îŽ#FÎ[`Éõ8ë\\[Èõ©Ér’¥Æß™$º‰vN\0íXw:†Â8¨ð±È5GDNŽ]D”äàV}Î¨¨2Z².õ‰‚Øâ¹[WÂ’•åhjë>10FU¥sšZ]xŸÄÇ9\"Ûv\\úJÉµ‚MZ÷÷‡1ç‘ë^‡¥ië¦[¤°ÇóšqLjHôK{X-¬£ŽÚ5DP\0\0b„‰¤˜Â¸H¾!Á –·i$dœd–ºÔÖâ«ãŠÕÔÕ•üµ\'Ò°ooRRáNjP×BŠÀ›S˜@?ZnD(™ÚÌ\Z•Û<º{2#‡øÇ¥WÑ<@n£1Ü.ÉTá—ÐúVåµÌeYÉÇJó½Rí4ßÜì;c”‡€Ôî-™èù†P7 úÕItè‰Á>Ùâ²ôíQfrãÒµ\rÆ\0ƒïY­\r,T]œ­²$PF›o({øTq¾Eüji‚Ê¾ôš‰¹ñ5…ºó™ƒ æ­jcSDz¬Z9†@å¶*¯Ì;ë–ÖºK]\\ncSòHÀg1ëZ2C+M0–àÉ”ÿ\0U.ma¹ÓE»B®q¹À%k¥ly³–§!kâûŸ]Gi6’m×9ædŸÂºËdµµ!p]ÎXžqYº“\r½ÍÄ×HÁØŽka¢ˆ\0}AÎ}êb›Üu,–„–ËoEØÇp\'­X¸Î‘@ÎÞø¨Ú3)†&-Ç÷{ýjh–Hqæa@?¥j´1d0Ø-´Î`yñ‚wr>”5™ŽQ;|Ýù#ñ¦´r¦–2Ê­÷·u¤7Ed|{\n\0Žiå„Ep† üíœæ¡ñ²êq	CmVÊmù½ëB/-(¸_zîÝ˜Æ’|Øäc¥l‹awŸjÐH’.á—i}ªìJ’Cè0	ÜOr=).Bò/˜GÆBZÎ‘®7Äó,`c×Þ¦Ö*å×	$¬:&O5bÑ-vœmŒXŽµ^;yØ|Ü-Þ‹…p¤#±ŽY¤r\Z/ž€u«Vw-qŽd;ÇmEÅ¹rAbz“È«¶¦Ý˜…‰n„v¦˜2¤–ÇÌÎâ Ô±[ˆY¦‘A\n>\\úÖƒ²Œ3\"àKö¬©ï|û¶R…­úqÞ¬‘æy\0ÄD­Év#jÊÔLS6òC*ŽNjf¹H“žyÅVƒNµO%c• _˜ÈÇä&¡–‚Û[/n!xO’Õuì=imµXãßÏïa?pË\Z’òîMËªº?Dê£éT¬íêêI„Œ¨«•®hjÝE–ìË0B©aó7÷}ªmà»©+÷€ÅZ¹·´	ìgj0˜´°Œ\r¼b§VUÑ]f’VUH7à2ŠÔ²²ºÉö¹#UùW¦ï­E§Û¤,òLiæÕ»qu–Æ@Í\n7Ü»‹d$Bd“iÇÊ€Õ˜n2–›–FüÙ«ªÈ\'Ûµw@•b[„†Ü;lSß=OÒ›Šõ0môyÌ‘¤³ÑNü¸èÞ‚µZÒÞá™äûÄ.2j1zò@‘‰WÌ9;G«6/öˆÐ´x-œZQH$Ù{Â¶°Ûkz§\0Ý¾qõ–Š—Ã‰³^Õ?ê-ø=¹–ŠÞ;½YÆ|hÔ|<3’ëÿ\0iWž$dŒøW¡ügO3UðàÁû—}?íp®®õÁ<×=O‰›Ãá ÚÊä²îÏ5HB™(ö”<½µWy‚¦ã`XTÊÃÈß’¡\"³èY#*7ÍQ‹æF\rÔž1VfuVÙÝ†j—Ú)<²pÄd\nÈ¸è;-Š¯fÁªKu$s´N˜8>µ¥yvnIÉ/Ÿ¥Q¾ˆË‚„‚*âg2¤ÃÎ\'‘Ã‡ùªT‡+ÎxëSª|ÇzÒÆ7hSc‹÷@«2~ïOD\\qÅ@&B¸bG^)n‰XPd|Ô¶\rÌø¢G»U\rÎ+ 6ílªÖ‚\"÷ä~u‡j€ÝOæº^€š|Z•ì7Ê“ÜbØœñÅrIûÇ¥û†Ä–0ê6‰xÒJDg¬gk\'H¹•|Z­j<Æò™FþãÔÔí,öÚªM¢[|äÅ}êO\r\'‹¤àïx s]”µG-MÛØ­ÁDVLc©h”Û*îpZ—CËm!™vycžØ¢îâ®-åÁ(ï{zi\'©yomåüÛˆâ*?º×/~í«jðÈ×\\ÛÃ”D\r…o\\ÕÈü=ö›«y–œ0ÜÞiÁ_`+©M6ÚÈÆl,âÆ2ÊÍÐ÷¢Ì¤ÑˆÉe¦%¤JH.H$ä\'¶kFiÙ>D=xÞ®Jú{ýòyg¶&ÞVýÐ/€\rié> ’þ!¸²Ž	ü’¼ƒc{óÒ­K¡.=K¯­C¦³‹•Ñ}æS¸þ^´\'ˆíuI#ŠÖ)™¥ù—pÆ@ëPéš\r´ö„Ýy39mâqïN¦Ÿx.íÙÎP3ýïZZÜZ\ZÐiøGšHAÈà½UuBaUŠhÛ\nXrãÒ´íµXLlRò ÜÉ·U7Ôì­n>Õ$ÅÚd8M›™[ÐzVœªÄsjsú¥ÝÄ÷Y‹5·nxQIéêkNÈI»£Éß€F8vÝ–K»{©tÅI\"2Ó<÷ ka‚<‹‰ˆäÒ¥GRœ¬S‚ÓÊiIe\'\'?Ò­ÏcÅªFÒ0sîMMk°Â‘òv¯Þ#­J²@$TÜ2F@õ­R3½ÊQÙÈŠ«–“ŽI ¬Q>ùõ«Ò(˜4Xf^ Ž€Ö±¬[é¸—Ru†R]úž=znBµÎ‘os¨¼‘ªÆ·°uÈ$£ÓëX7œ«… Ä\ry>*j\Z¤’[X±³´ä\r‡aêOô®ÓÂ\Z‚ê^Ó.d´[[ê+žp¶§fWvtï:B_õª·‹Pr+}—\"±ugC‘Å`w7c‘Ôõ\r»÷W)wx÷³ˆ!çqÆjÞ½+—eS÷Ž*ÿ\0†ô«{xÖyùsÓu4®K“:è>D(ÏœŸZëÞ=±…1ŠÉ·Ô( ý*Ïö†x«ÐWfv¥§Å°³\"ž{ŠÂŸ^}4ˆÞFhÔ`dô­ûÉŒÊTgÖ¹\rkNyX†ç4Âîã§ñ q¾78=A5žþ rÇ-UŽ“.ÏJªldäñEÝI#[ûzþHü»~©¬mI¦šo:v,ý	5µehK[ËP@úÓHËÜ·¤Êë\ZÇ­tqÝü¼·Jãô©ÿ\0Ñº÷«ò^m”–§Le¡Ô%ò•ùt~gˆEÉRcŠ2ŽÄô¯6¶¹.àg#5ë~‰í´w•­%sv~WP1õ¢+S\nÓº;_í{x“˜‚C…Þ*qž•sÍQº·d|L­ÁŽHü)`y¤’,²pÌpúWRzd·/íò²QßCT¢ÿ\0Úgœö«0M!š_´ŒŽ£`ÁSZûjÂ¯¥C‰‡ÌÝ1T˜XØ†îbl8R>ñ~0iÑ3%ùÔé\\œZž§u´¼µ‡í±7\'ÖºË(®~Æ«)E™xaÝÔîCC®¤‹i‹if+’k;ìþ\\ˆËŸ,ŽS9æ?Rûn³vT„ÿ\0ïZl+:•RFNM\0BD~fæ‘ƒ‘€Jt6QC\"ÊÏŸÎ›¹IädƒhŽw’IC&\0#g½1\r™K1ªá¸bxRæßv¹¨ÉÙÞ¤y¤KŽHòØð\r:UÌ‘˜Š˜Áç\'‘Hd1\\K1Ä1%ŠN3ô§ÌÁŠãzxÒ€@iÜ÷ª1ù“™ÙýZŒŒ}h\Z\"¸*ÍåF¥‰<ãƒN´gguŒ¸ÙÁ\\p~‡Ö¢…>Ó¨•C·#ô¥¸t²ËÛ6Ø‰o1OúÖmØÑFâj7Ñ:ùwwÝW àšŠÓP¶KRŸÚ¶ëþ6ëjàõˆî¯õ\"MÃ]³žïQYé:”òºÚÚ³Áß‘÷GzÊUZfªž‡¨Gbe·?f•$‚^P–çëU‡ž—Riñ\rÒ¢nO‘£jöz]œ0Ë¸ÊØþÍkYj*|I7”›ËG»=Àô«…DÑŒ ÐÛ6EC\"q6rÁÁëþ‚9îZY\ZDS*€O·µnÍ~ãhTR[Œ0þµ…{§¤°HòÌ#ù²@ãòª‘*Ãâ¶»¸°Š{ˆ–9›ýb)Ê}G¥M4oÃß»ïf³mä¹Kvÿ\0Hh¡ÂÞ¬|Dc‘ŠË.rWn9¬ÝNTh©ó4–[$uäG=sô§Ý]<LLyÀÈe9UË¬s_bi7‚¬	BsÅtv¬Ö6Œ¾è~ðœÑ\Z®E{$Žjç]·±ž9/..È2j6Ÿ¥miÚ•¦º\ni¯$²\"oÄ«‚µN³ ’â+eU?))ŸÊ¤´ešãÌ…ü—ösC’¸¹K–pH%a\"neç,95l*[Ü¡ÞÇ½Û>ÕºŸÙc,ó«9Ú¼š¯­«-«îTàñÓÚª6dKC ð¼Í6½ª³)¹·Æ{ó-xU]uKÌëä[àzs-¼v2{œ§Æ,\rWÃìîÊ«Ù!G_õ5æj¥ÛÍ“Ypí^•ñ7ßø|vÙuüá¯<aˆ±ŽÕ…OˆÚ\rXÝáœ)Qò1?Ò“]¬’Èwï#>æ£Aû†\"C•l`ŒTŠÖ41°*w`÷¬$ÍbU›÷“3nû£D k˜]¾ö>ÜÕ»›gzŽ–Á¨Þ»6ó¹²\rAz®?vÑªžàÔjÄÈÊ ujK™\0’¶ãÇáUšãÊùB2jÑ”‹*D-#u*”mèjº\\yÐ2H~mÜcÒ•Æ!}kDÈ¶…ˆånÃåëŸZ¯6IWÉù[$\ZŒýìÆr\\RÝ§•§—•‰!rjdô*šMŒ²6—ÓÜ]ž>õ÷«,ÜÉ\'”ééXÖ-Ÿ4K´·_ZÐ¶V¸‘âŒcï\\MêzŠ/ Ós­Ôd”pv”\ZÐð‚½×ŒZMÁm‹ç8Á¢ÖÞ+8Yc8å˜dç×5“¤•þß‘^w„±¹:×e{¬ä¯I#Ö¯ÍÀÓZ+$\0Ê¹;{š§á½ÄÉ=Ê¸˜dª7E®w@Ö5Svºtò­ÉýÜÍ÷‡µw_*Lì¬¼)äÕ)\\ÆQå4„ÍïdËÀ·Ò®\0E±#a$ä÷\"³ {°À,~b•ùS¨«B6I	\nB}À‹Þ¶‰“\"Ô¬mõ}(Á\'šdFù_²\ZÂ´Ó®ažKm#7|Í)Æá]¸ó`t‘Xc§zåÛM×^”Ü¹P\0ÿ\0snxüj\ZÖæ±––-Ä×š4¡#ŒÀ‡7&=«~+¤½U+œP‚Ç?*ûÓ\'¸Y4ö†x\Z@ÃilðµE1=Žmó\ZmÚ<³Ë\Z³6‹-ûÕâgsóØ\'Ú¢Ì)4ˆ–¢%!ÛŸ­D¾Óæ_2áœÎK«cÕq´xî6F³ˆ»HÝÐSÔ›uUó#G#8Äx9Æ+Nó-PHv¬@asŸ›Þˆô{tIr£¡fªm¥Î.dþÎ¹0¼„	Ü¦šm»e4Bßïo\'‡#ø*ÂCgöŠA˜¯ôÄ_.§ ]	SP·2Ý,’¼géL“ÄOáÆK^tq\Z•ôbÞÃ½\\u3jÇ{s\"ZZ—’U··…IwsÇ|×ÍŸ¼rúþ âÑöX[±\'÷v5§ã?ˆº‡‰bklýšÀõJy÷ô¯*×¦\rc¿J×”†Ì»‰..0vcÛ½{¯ÃM/WÒ¼lÚÄL3Ìíj	ù¶ñÔv®á—…?µõ¸gš&F>QîkéOØ¬\Z @\0·`8¢±¨®ðòå‘Í’¬V Ðš¼ò…CÏJÉÔ/w!ÇW´=‹\\óýrÏl¡±À<Ño¥¨ŠÁV5ÇúÆéV5©ÖGç/#`bº\ri-\rš/?/SN,—†Ô\'ñV†ÅÚnáQÉA‚µ—äŸp–Ü£§E{DV6÷„˜(\'ŽGZÊÕ>X^HfŠá›þzF\05ºÕYžzž\'k¨|ÍÊ ö$?\ntZ výð#Ü÷§jŸoÖfòÚ7¹Åd^xS[³û¥¥°lÿ\0:\ZFªæ…Þ¯\np\nÖs^Å+d\Z¡.®ã+eŸ÷ê¬º~«ùáT>‹ž)he$Íèïü¬m9«jW¢ê1Ó\"±X_DA”µvüÈÆyÝNö2Ü—OÊ.;\Z· g«X˜c2BóÍCÜÚöC´;.¯á·O½+…ú\nú6Ùemm¦4hc\ZŽÀ^Wð«MkÒê/t´O—pÈÜ}«Ö¡‰\rçÚM¢ÂFv”\'úàÕÀã«-IâÓËŸ2â_6LóƒÀ¨.–Xah£\n<Æ\nIü)©qukq$f”È~U\ršÆ¼ðÜúÕûÝM~ðêŒ,¹T_¡­]Žes^(ÿ\0³ÖWD’çûëžjÄ&Išãd<mˆ·ÌÞæ²´éÒ+ˆì.¤›t?0ó‡¿=êýôRÜ –Þ?ºp6æ’,uÁ²»ya/¶DéÇCëV¦½x-ÓÌ— ˆþõgØAuÓHV1à—îiÒkù¡.&µ™²ðBÕ’Äòà†frÆ)ÝŽìjW†iLnÈÀ©È!»VmäŽ·±»o/»z{Öôo–Q¼BIwq·Ò¤z\rû™ ‘%\nqÓ<S$Ó]b-–brÃ<ãÚ©É7Ù•Öl€«Éj…59•£k¨¦DÝò\\þuW$[Ÿ*94†Ucõ„ðjÍ•À‘<‰Q\ZEêÙ§K~ºŒ/\r‚ù¤œJÇþY}j”ZrZþò[¦\0vëøÔ”I|ÒÇz‹#„—“Qj}’–öE ÆV›w¨@Å£¸‘¢ùIPU‡û&“O¿µ¸C«Ç1#dëø\nLH­Æq)W?ÂëÔŠ{HÙ2ôäsVVîÎ8Ì/)Þ¨ýž/Ïä¶cò±­fÕ)ogfÅaIn7¸\\m_Z¦æý¬Lúƒ@¹åTrGÖ¶Õ#êéøÓþÏœ¤Y?J‡©¢lÁ±ðÝ”ØžvšFüíÞ–îÝ´ù~ÓbDRt$“õ®‚âÍÊ&ÆÇ¨ªãKó¥Ìªrä•\n6zÚkRÎ‹¬†·‡ûcËŽyØÔ}Ö÷­MN5|±¢{…ÉjÏ613Fín¥bo“=EhÝ¼³\"¡‹kÿ\0{<WTSkS–V¾†=Â¤0¹—näƒ\\Ö·†MŒŠªùMÊ2+Ò§±’PSb30ã¸5ÍÞhº{\rj¢@Ü°\nÎ¤44§\"ë\rvna¸ÚÞZïYõö5ÑÚ!¹ºÜøò€û¾µ‘1ÚÆE² \\`íš±¦Dï>C9FäóÒ³„l9ÈÕ¼Ó–ç05²:uV¥YZ5ÿ\0Ù•’Áy1€sÚ¬Zlnr­Ð7j†ëP_9©ÏËóµÑÊŒnÊs}šåŽ%Þ7ñòçª‘[ÛÆímŒ1Ë¸ÉõªZtªð™\'ÇœÌHè*ì÷HxY‡i¤\rèXðì±Ë®êf3ŸÜ[óŽ¼ËE3ÃL]Õ6®ÑäÛñøËEh¶!îr_n¡áð%.¿ö•yÌRI38Q¹cå°:Zô?Œð<ú‡‡•dò×eÖæå—çSYZ¼f0ŒùûÀ9¾¸ë\\õ>#Xì5íå’Ü°Õ— ³ŒsPIwp.!Œ¾í¨©ZÛË@Ú€\06@¨HÅÁf^1Á¬&mi´LME$»g€0ª1I¹Ì*Þf\0jsùfw ‚Ý+4SÐ©!Ûtvªw,X`Õ›În‡¡L\Z¯*deºV±3já[´¾£¥L©²¼äžE$²ˆãJ†9KK†û¸àU-¬O\0qV-ìäÔ¥\"†-ØÕBûZ¶4¨‰™}„†ÍWC¥£)^hãMºI2cqóë[Vº5¤–à´c‘ó:žsíRD‚¤ûZÎ>ñäŸþµY¶½Þ-ít÷½ë™S×SÐu¬´2ï´{«kI›M|«/Ïö®gÃ–\r©x£#>f=«Ñïâk­&x`ŒùÉ*ßwŠä~ÃÚÞ£$Ç˜£R•×YhrJ£r»-]GFÕDÖÑ™ã‡æWÇWeáýLk“-Åäq´{¾X\rïN–k_1Ì»\nòcïTN‘¦[BÒ¼ÍãÀ‰°ÏžÂ³IÅ•)sŒ²ìfòT Uà-Gj!ü’mo ·$×(–VZL1E{-â³’Ê~Ðx¥Hl¤1°ÖÊ\'üÃñ­ÓÐÅîtƒR‰.–Åæòäa¼¹8ãÚ¬Íz$·û5Åäf2~\\°Ÿ­r\r¤Š6Ô.á‰ÛæÉÁé[2ZÚéžd`ee¯oBi]±Ù\"äÖí™$ò3SÎ£Ö¥³¸Äqy2‡\'o_zå5h«ü„\ZY9WHW!½f¿Ä×¶·Xôûàc|ÍÛè*£NL—8¤z‹¢’³r‡IçëS#YÙï’kˆ”­$€ZðmKâ¹~Ä›¿$z@»^µÎÜêSÜfšG9ä³“]Q¤ú˜:šŸ@j~9ðí¦\Z]N7\0ÿ\0«KùW/{ñrÂi–Þ†FÇò¯3ŸZå?_³D9³³×>\"jºÛlC{ƒTŽù<Ö\rö©u¨Kæ^\\ËpøÆé·ó¬´l}ê7j)ÛbÎû£9®zþ?<…÷­©ß\nj¶‘l·ºý¼o÷‚ÃÔTËbâ{WÃ},hÚ›2_>òqÊ¨í^£¯Û›ÍxUw1L¨£¥q¶Ã¡§´gj\"aWÐ×~­½\Zæe­$xô³ƒÎAV«+GlÏá]W‹tåÒµKˆùHÞlmêjäd™d‘Fs\\§·NJQ3ô]\ZkÝKíwJvÿ\0žÞõÞÚ¨µESÂÕ=4íV£Â’®YˆÇ¥J4dRË¿>YûµHëíl¥$cš¶]Hµ—z©p¥;½ÂÖº™usâ8ö’d¬ç×­Ÿž¦©\\ø}¤bÃrîšÃ»ÓåŽB±cÔÐÛ4æV:GÕ¢qÀ~ŸsuÀTšÀûå°Ò·çV µ1¸ÞÅ±Bd=E»³[ˆØ|¸¨4K($~qÀzñØÙ2 ãÚ“M;p:T6gbk‘ŒÅUÄ…E,Ìpª;ššg¹4Ë=xèzÅ½ôvðÜ<*“®}kHEÈÎ¤ùQîÞðØÐ|3\r´¾[O*ïœ·ûŽâ·”±ÕW™i?´Ë¶YÓZÉ›ƒ,rŸ~k¬°ñN—«âm2òÚHíÄ’m“þù5Ð ÑÃ)©3¡q¸RGVîjIZ\"NŒæ¢ƒÏ|áÖÆrH¬û>åï\'3,d8 zQa\"UòŠï!ÎÆÂ—Í2ÞImåib_%7ü‘ Èúš/’x47ƒN‘CÈ¯˜3ÏÖ§Òì¥³há¹”*·^ij2Û2MQ¹$æ¬Å¶Àw8Û’*Œ›—œ%x©•ù›…#‚;Õ¢,ñ¨Œ¢àn-q\ZíÎ•âd,0þ[¥u×´é±\'e\\çƒY~!ÓÄºlìÙ,WøÖàÒc‰•eâ›8Yáo5›æ‰òÇl“Þ·¤Õ-Ì’ŽY(:ƒ\\røIžÝb´»¹E¹åÔ v>ùïQÛù–wËe¨·›q\Zì„#ÔŠÍÊÆŠ&Ú[‰Ô²ÈðÊÇ%£8Ýõõ«)BVx$i%ˆä£7ÞJ4øZàïFr\nõ$úÓn¼˜˜a¼ÆÇ=±R›E+ˆ¤šI ó“;Ù\\&~+\Zÿ\0Mû,ˆúMÊœneB~_Nkp\\<ÖòÄ»b.¸_›¬›â9žmYÈ¿¼úƒíCwŽ‡Âú„zž–ÖúžÉ/PíÉ#/îjØqÛir§úÕ‹†;W˜XiúÎ©-Ù´‘û1SÎ\rv§Zµ[xáÄ±\0°ÆKf©ÉöÁt»–ãh~R-¿5WS4\r²ÞUvÆ@=GÖ®ÎmîíšDÒ&±´ì{Vu¾œÚt~tgYko9b}VvXƒíwSƒ+mÁçhé[ðÌ3O¯zÅÿ\0„zùî<ãw$hG©ÀNòé49t’ÜÊçnÎÚ•;™½\r©Ê8Ø²6üÓ™öÛ•fv!†2:Ö^™¨Gsx³!\\¸û­í[Þdr`–\'ŠÕI2Yj‹QmÙ[\0µ‹,-t\n‰	aûÅ#­;ï>Â	³¬zU%Ë)Þw¸ç§O¡¥&˜E4WŽîÎÕ~h•\\v#9©¡šÒâá¬‘©å˜Wug’›™ÞÇfÎ)ÀÏ•¿\'\reÔ¶y¢Ü¬mæ#XÖCÛ4wHä9ÀÅj¥¥ÁL¯u©„¢¾|Å.£oÊ9Åmbz$öVíö( êYº\Z¡xò‹¯Ýºyø@ÿ\0\n’âk%’è;1ûœwª³ÝÁj»£VÛÓišÍ»•ÍÊ%Öu\\bqúËEEà‹Å½ÖµwEÛˆm†?h­a¬Lä¬Îã &ÿ\0@¶]dgÿ\0U^xÁÚ2 ,kØ­zÆP\rö‚\n“û»®‡þ¹W#ŒŽ¬*nk\r…˜#hª’·ÎÑ‘ÎÝÙônLaƒøñQ2)¹lz\0kžFÈ…F!ÇVnMR„„YfsŒ1Á5£q…ž1ÐgŠ‚hb\"#å‘ëP´ž¥H†c.Ø,yJ£-Ì·.©`\0Ø9­wüÄùAb1Yé$Hw- <\0+D!®H¸!òÜðÝ€ô§¢néÒ‘Žð}Îi¾XûGû«TD‹\n¹ä÷­9V[„G`«°žN+2%-Éè*H§0N²*îÙÏ4öA\rÎºkR^Ý`upF[=0=éé©ÉbøÝX|œþ•e¨_Þ€`ÃÂO*á[%­Å¾Ë›vÇ÷Xö©Vf®è§{\"ÛÜÜ¤~\\¯	V(zÖ\'ÃÄš† ß(\'\0çÒºÝVÔÇ¢Ýü±NãÔ\ZåþCæÉ©áÃ.\ruCcžOS½’ÆÞulàœuÛ‚\r`ÞÇ-­Ä¾f-òu®ÊÌ°nyöpÌ?­q^/½ÑâºG†éÚò>BÀ~_Äô2¦å±Qš[Ž6“ê†Cvò\"F8.q`M@þ(²Ñ˜\"·Ú$A ç¹Írêæ#	•’äF­Æ~½MdÉqšÚmL§W]ŸSñÎ£¨9òÂ[)ë³©üëŸº¿šàƒ<¯!7¶j“KéP»’y5Ô©Å96Y7j¸\'½DÍL5vH‚_0ž´…ê2ÔÒô òôäçæn‚¢÷’´³Ìªv!È„M¼RTãlÕiŽèúSü)â(\\Œàôª÷ò\Z_ÜµÈ÷c¬fiÞm­.cñ–<å\"xŒ¯\Zº>µé‘6èp8\\rkƒÒ7Üêös\"nD¶U,:×mhêÑ©ÎI^{‘X¢™›â--sKhXbtË@ßíz}\rxf£gw§ê%%‰’H›k)õ¯¡n%òØîãÚ¸ï\Zxa5K/¶Û\0³Æ¹|\\VsŠ:hÕkC”Ò7xËc§89­%;HCŠçôÛÖ·‡ìµ\0ÈVÇ9÷«iåÈVŸÎ¹ùOB3¹µ`‰³. ýjy‘~C·Ø\nÍmVÚÞ5õç5ºÂJß.6öæ©¸û€9Ékñ\"w9Eúâ¦º¼B~WãÓ5™-ÐàÑ¸ô)\\Y‚ÇÊãØÔ1Ù1oœâ®­ÆóÍ>å‘!ÎqÅKDnR¼gŽóµºlÏz}ö¨¨Äø\nÉ{³&d¸uE^ƒÖ’‹d¹$\\{ ±™$8‹5ËLÅ˜ý*½Ö¤.Ü,\\F½=é³Ö»hÆÈókÏ™—bþu,WNŒ\n1R;ƒT”âž\ru‡W¦xÛ\\Óp-uznÈ®ëEøÉt»#Öí#¸Ž#µ×µxðoJ‘e`x5<©–¤Ï§ôø{^‘_Oºÿ\0Ia–†c´¯Ðt5ÑÎ¡$0ŸNÕòLrFêèÌ®§!”àÆ½ÂŸµ\r=RÛXf¾·R0äþñ?õœ©ö)L÷eˆœôØÃŒ÷5² ;6~œ\nÍÒµ›MwMûNŸv’!ûÀ7ÍÔv©•e1H›2²uÏ¸¬šh½ËjPF£xûu®oÄú¬pØ¼SnÌ‡Ë¦sW“–ÊHíÎ0:Õhòjz$6Èá.äœd8éïRÊG;mm­Þ¬hnÑ}ž/‘dr[\'û¤*7´º‚Ý_P·¹’Dmßk“‡\\uÖº8ç@_ÝNëp¸¬J\\{ŸZ«¨½ÿ\0‰f¼‚+f8\r³kî+6Š¹ÃW0Þè¡‚<2³á»úWåÐä¹l‡@åHûÕ“¨i~%±’4Ñ\r¸·U\0,Þ¦µ-uËûKt\\±’7èe‰rŸZ¨Ä–ÊWZ[Yo\rÔÆœ€j;k©cT‰ág”–N?È­û›‹)`ÝJ±©!rîZÏ¾¸µÓ¤n\"‘Ò2øPã¨Ô‡ -ÜM\Z°Ï?ÅQiúfŸöÆ»„9qÔ»g[]\ri‚Â­\Z/Î:ý*ìPÀ¡£Â°÷äÓQ%±/oÒ=Ð,k¸ÿ\0¬¨µZH·3F­«Z-&9¦óKïäõBkµI¡#\nÙØOz\Z+C^ßQi-²+cIÉ¬­YY¾l&8Íj¤®wii‡Ç2*ñQÞ-´ö/VäˆsO¥‰êbY§™¦ QÊ±íÐÕÉí$‚Ùž\\·#ÔUø,`‚ßÌ“\"5%}j4¹µ¾`‘U£]Ãô¤¢7-L¸åÝ¹JÌÌWøûSZðA\0]¤¯~zšŽæÉîo¢êE”ºNJÊ–H­f-#â@ŒñŠ–ìRÔéî’3pÇÊðÒµ¬\'µ’,@ùèÙ®5uý9ïUdòºÏé[Iu6îlL_h¹]¡Gó¢2ÔlWñw‰¿³íÌVlÒ¿ñyJIk®OšJ±º4œ±uÍX·ÑnîncžQ±Ä‹œf·.c†ÛOo%T²â(úÔÚR¹’9íOUF—à€Cgªöv·«12äã›w?Ò¹ÿ\0kq\\L–šPódÉ	çÛÚ²4gTÒ¯D–sH$þ4	¹ED¥©´nÑë ’\rc[YWÊ¶þrÑMøm©6§«kr8–;lãë-ÕOá9§ñ?¤1êÇxîÿ\0ö•yÝ»;>NÒ}OQ^‹ñ—C@\\d˜î±ÿ\0«Ïc¶^ŒÍ“éXÔÜ¸l:ã•ë’=*‰”E$…ø;…^’.3°e{“Ys)’DQÈó2*ÆF¨›qw/Ò…aæ\'ŒUtóWNÀÕ+.”t\nMJZ^f?dIÏóT†Ñ²HÀ+Ó5}8ÌŸt&Òj¥ÂâÆ03À¢!Ü®ëûöÇLqOÙ†ÝÜŽi¾QûLrg¶zÓ·ƒ’FÅRFm–Ð·,zUË[&¹9ÀüªæYm\"0TŒZ™5¨¯ìP8\n‚¹È¥5t]7©£\r¢Ä#´,êÜ¹ô©-õtƒPnb»pP÷5nÃP‚öÈ0QóFýêŸ‰$Òô•˜CO\"|©ŸÖ²„$Ý‘´¤ºŽÖõs>“v$µÉxð\n¾1\\÷ƒõ‰¼4—ŽñîóÜm…P—V’åyùU‡ÝNIÉïÚ½:TZZœU*&ô7õ/j7±´^w“Lq| ý}k[¢sU¤›Ž¼Õf›ž+¥E#²ËLOzfê_5\"œÓÅ©…¨cQ–¥qŽ-M2Q—ªÒÍJàNÓŒÓ|ÝÄb©o$ÕËeÚ¾lƒ÷}è;8‚!¾ÝO¥TÜY³š&”É&i¨\r!–á5t–¨ÄjÐl-0+Ý¶A¬Û9¾¤Ž9­	ùSXó¸†áÞ³Ñí^ñcY¼k~Y 8÷cô¯l‚îòÚ=®.tj§…¯–tÛÍëŒØÀÏozî|7ã«½\Z!m!ó-Täde‰ïjÉ–{]þéYNLcæ´Ä˜<%9•§øŠÏVŠ3i2ïÚÐy> ÕÙ>XÌ‘ƒŒóíPÐ-3ñÝö%âß(Ûk1Ã°êÛ<¡®u®–Dr¸ÇÊÀä¥{¥co¬i²Ú]Æ²Ç*Aóÿ\0‰´û_5™vû±k|µe$vR¨iI|ÖØ¥×=sUßZA’>Qé\\ºxÍ˜ï!%zš¶.¬î×t«úVv:yÑ¤Ú¹‘þV5ÔXæAùÖcZcqê*µdn[4¶Íèu¬7Õæªó)\nN+!aÁÍi­¼–jÔ8Cþ­;±¦•ÈsåFl›†Ù$åIï\\îµrîâ<œné[wz”—óù²7ÝP QéŠåµ	‹Þï[Æ8§VûíV‚6k6Û!Fjìdâºb¬s¶ÙiM9Z Í~njÄZ\rN\rÍB(\'šZW÷©ã”«dj‚µJ²s@.‰âíèÏcpÐ¹á¶ôo¨¯Vð_Ä/·,v\ZÊ‰Ÿš^	Ïlô¯ŽLr*Ü$0ÁïQ(\\µ+WF°Æñ¹VÉÀäå\\ÇŠµøô½vÞÞåZhÐï}ƒ>]yŸ…> Ýhò$weîmÔ÷™>•.¯â1«ks¸iVÑÛ|L@ÏÖ¹jEÁí-þÓ[ÓuˆçÕ-0Áœã¬è­sOâÝJâòY­æX¤a±	êÇÓÖ“Âl–ì6¨cºè6\nÈ}GqXZ¼G,î„0²òƒ×ßÉíntû+¡¢x¶ÊÒÃ:–¡4³ž[5°šüWæ$hÑ¿\nN~olWinÐª¼ˆ”ùLŸÎº‹]^SkŠPv¶Öˆ.w}+xTG<àt¤é7wZƒ£\rÉ!ÈZÒ¶ÑôÔså[ÅîHAÖ°æŠ8…·—^s‚Q˜ç¹3j\Z¼4z{·ô,+kÜÃfuéöñB#Hñç°õ{	­&76Š@ÿ\0Vç¨§G­Ê–æä©Ž\'\']­ßŠ ÚíÎ£e3=¹HÁêzŸ¥6Ò)j1|KswhÖÚn›,w!yiXQøW/¤ö×Rý¾éÞìØ85Õé¿iŠgf·M²/Ë¸ò\rI6›-äåÝPçï1übîÖ†ªÈÆK«¹\"ŒÜÞÝá…X[ZŽÒ4r\"a¾éÇQïSÉá¨Ö-ñœqœš¦ÖWMæ)ÊŽžÞõ\n2L»¦MBc,B’®ãÃ¦)-tß²Û´†Ý^FQ£lÖ\"¦£žmBôË	åbV×‰õ7ò¬‹C\0<ôö­œÔV¦JOC§¿ˆÙZÉ,—¿f\0ò¥s^Ï,’,æ	?,XÎ=ë\"ïWû~|ÙÌa‚W¡©,v.Ä`!bÙœ·ÓÃRºOC®44ÔÙD²g¾‚„cåQŒ9÷©4üËuæÙÃ±”å9Àö5fo.±n¶ñÜ,ÒÉ·· ®OÐàÒbV·ÎÅ	À­i©OSÚ:6±%´J÷–Än‚¸xªïVi,ôÈš8Sýn~\\Ÿöa]¯$÷DÊÑ`CË±É\\wÅpz¬öšŸ™\rš”fûÎIaõ\"µœœP¡&nøgÃ–Ú~›5ýû,·r) ÆÙ>ÀUØt¶´±–vvßyÃª(È^Ø®Òâú	V;ieB¤Üð+²“\\Ù©˜ec_+*pÖ¹Ô×S~G{#¡øWf–šÇˆ24‘”µÚ[¯mÂÌúˆ›\'m·\0p9–Šì¢Ó‚häª­6†ü`8Ôt2|»¬~p×Ÿ°gÂ±T_âÚMwß0/´ÙÇ—uœÛ\ZàwÄªÍÏLŠÎ§ÄT6	çq“µv(á½k5[Ë¸@yÎjMH¼¡=ÁC\rÄ÷¨\0Svª[¢“\\Ófñ±(ù®‹v‹…\rlàUâŸ.&ÉäÔEÙ2‰Å8»‘5b;¨Ë[¼h888\rÎÓì*ôì¡ŸŸ¥cM?›#Ï­µbÍ&×â˜\0ÝÓ9>õ;·2”Ê˜I‘$h¡Ì~ÕÒxjÞÒY®ÛTgï\nåíÜ?îë§ðýœ’i¤ª›ÎsC.v£§%¥»ÏÚSçlŸJà5«ù.ä–yÛs7k­ñMÅÍŽž-ØíûAÇ=p+Ïµ)’Ü×VW2­-lXŽL@ž¸¨š^zÔ)\'ú:}*&“ší¹ÏbG“4ÀÙ5bMHµ#%Z’š£ŠRjÍŠ…¤Å>*³ÉŠ@:Iñš¨ÎXÑ,™¨ƒe°*X<É\0íÔÕ—”p«ÀŠ‚v¼ÜµFN)Œpæ¤T©êif#ÍX\'«D9¥žL\'Ô˜CïXÒå¦R}kMÕ¥Ž•Jécµ2ØhßÓ„{A#Œdv­¯µ2DdÊ©\\FƒúÖ6œä(8àŠÔxY£Y[žk\"®jXêÓé×m«”ž€ýæ¯Oð×Ä;[–Ú¹K*áØ}ß­x¶DyÆì‘KÓÆ\n“ÌÉôÏ£$™Jn·‘]:†SÔW;âOYx‹Gžký¡cS’{{Šò›?^iÅä¶ºxã„\'\"´µˆS^è­§ÏÆš3™÷©jåFV<§[Óã³Õ%ŠÚC,AŽ×ÇQU¢Š@r¤¥mC\"<2­äbXúdpÃÞ«¬A\\\'oo¥dâÍã4O¤ÝÎ“ùNY‘NõÒ>‘y.\Z8ÎÜd—ãOOÖtÝ-3ki$“óI.?J«¯\\ßÈRxUâ…¥RËBðšÓM2æT–EéÖF¡©Ë©Ü™¦ùWøP¹U	A=¯µ\'Hõ­TR9å7\"IÕˆ?9ûÖýäù5¸#ó-Üž¢±b½æ­ZåÀ«‰Ò¢Tyäù8­™8¥”¢˜‰PæžWŠI\rV\"˜ˆÁÅ<\ZcŒÓCPáñS,ØïT÷R† \rH§ã­hZê/§§¯5€’â§IH¦Ò’³\'tz›¯¼×\n«`LáXúãÖ¶m4µ3+L³lžp¶kÌa¹<s[~ñÑµDóÏlÄoˆ±üëÎ­…Öñ;©â´´[ºð=ÕÞš/,ÙcFÈ	ÏëéZžÓá°Ò~Ï©ùi.îGqî\r^-²ŸDŠ=1ä‘eGÝ_­]²µûZ!`FË‘XÆ6Ð%+ê^ÓáÒã¸yì€3½#rZ†m^ÓNÝö‹™ päê}=ª[‹3¶QBÀíY÷6Ê?Ñ¥ˆKûÀÇ+ƒ]7hËFC­¶»ôÖYŸv[.=MZaäºÅ4ÊË	óÞ3íV4*6þ\\DpUz\n’ãHO!hUÞ1ÁÏ5.íb!FÔ„–å¹Ã€VÔ9˜n”mŒt\\sTôû-»MÂ²•(¨pÙ·.Ê=j ¬dEcî#…ª—`™Dk†‡ ¦Üß$lY\'¡îÖUçˆÚRªVO­S’@¢Ù>¥$V>¾\\×-«i2­äxq=°ù˜/Aí]\rœ±jnîU#A÷—=iú’A=šÇ`Áƒ8üë¥$k	8žgul¢R21o”•¡ö;¡n«~ù†ç$V¦­i°ƒ\r¼ŽÅ¹ÙßÚ¯øjÝa½Ìe÷\'85çÊ‹æ:ý¯ºmxrÞîÞÏl§’£*{ŸZ½w¦½Ä‰$ìê«Ï–åcïWm§·þónìÚ­:#!È¯N”ybyów‘Êjö×Òªµ”…ˆüÑ·ñJ§§hÖŠ\\XfâC¼àáPúfºyÝ\\´{ûcoLU…Ê¨=AÉ©šæ4ƒ±Î–’¤‘ÛÁ`®•G5Éx‡J•4“§yˆÓþºïaŽa‘#ÔúÖN·m%ýäp«m‡fÓõ¨öI¡ª–foÁ¸e†ë]ÆÈ»-¶nGïh®£ÂvŸbÕõ(†0 ·ÞZ+zQå‚FU%Í&Îgâò³êz¨È1Ýgÿ\0!WS`ç•+½øÁÉ©h€#»\'ÿ\0ÕWŸK¼²È¤zõœ÷.®0Ù=«=H[‰g`N0ª=ªäÎR&2b«J¢4]Üî5Í%©ªÐ$‘§n8­)(§ûÕV	‰q	Ï>•5»òÄ‡/É\"„‚z‹:ewžÇ8¬Æ8,và1Èrîãý¶õªÊ\0V<Z³5 €Œ-€:æª#îš¥¸xÚØÙš†˜éš¢Y§j@º$v®ÏC‘­ô…vr#ÎH\'ûz×\n*<¬>ö+­Ñâ–}7ˆ®Ü`†íêiØ¨³–ñ†¨·Ú¢¬R—Ž(ð		95ÆjOû–­fo3Vºl‚•R;XWÍ˜z0ÒÝä,Rî·O¥æªÚ¾è±©óV‰%^jTûÕ\\jÜKÆjÉEG#c4æ;j¼­šC#óUdj’FÆsU¤lÔ2Æjµa÷óI\0!üêƒ755´í|½úŠÍ)æ&¡jx}ëšcS SÔsMQš—iíR¼¢1þe§“sdÂ™É”îç<æ¦€|§³/\riÌ3YWŸxTÈ£Nÿ\0S}+}ãSbOü³ýk\nÎ `…Áço­nC™,uù{TX ‚«ýî9ÕVêÃ¨ýÙä\Z½hÃ•dãpi\\(ýÓ/îÀùFiX9‘Ö)rEA<™Oe\\V–Ñö©	#r¹íIur\"È{Þ±o&;µ&ð$OLsW¤µÊß!½*©µË=¨ÈZP»‡­5\\0Ò®=¤(»¶’Øîi4Ž<0Ã}(•ÑÉ´Wã¶UŒäf™mmÑš°Y£\\gº{ÐpƒÊ¸¬Ð} ýk¢å“ÔŠÂ…s;{\Zhe•RÅ­,¥:›·)Ãšd†*hŽi›iÊpi$‰¹xªÄjÚ°<T&ÖÈ óKšfihÛªT“êh\rÍ/G\'4ùd!”Z§Ÿ5Lï”¦¢|;ÕcRw)$‘°.‘£cžõï:]ì6Q=¶ËºŽâ¾Zðî¡&›«YÞÄûZU³žƒ½}?§y3[G1y.¡Õ£\'>ÕÉ8ZW7NèÒšUuÜ``3É\'¯áULVòt\\dô5¡Q˜ylã¦êªòqöO,‘ÕO1+EmM»zf—dé™duúUXÝ•&æÝIg9ªWWWÔO>Äæ:A@Íe‘£°1ûµ™¬ÍrÑÆáŠ€pÈZ³¦Ú1Û3Êû:€GZ³¨“XÔ÷hËê¿i‘ˆbß¼@¨áCká+XÌ?i¾µIóG¸å[Ú¶5ëXíÌ>ab{Ò‘,äèd¸AÁ,GO¥dÖ¦‰.ê§§ñì=jÍÞ“ocbÂ× ‘ór[éïT§¾†(ŠÁ9Ø>ë¬kµ¹â_žv–B~T^Ô®ýæAäpµÉ–9ãvÎÐÈp?Â“LÖ|¹|¦V	Øªô>¤Ôí®Üý”­Ý“4däîÍeËqolMÂÆÛ®8¨ùEe-v./£;NÎ¯,ÛŸzšÒMJ6È%{\\5§›wnÄvƒ÷öã¡å­¬‚)î]“*§‘U4	ìlÝ žðù,2pÌ¹ùªå¢oLõZã[ÄšdJb—<o<š³eâ´+P.nKœVœÈ‡vjKHB®:ÕCcçbsž¤ÓãÔ­çÆ.KtÃUY`ßx#1Eù³žµWLŽV/”:Æ¡³¯ÙíóùËE.\ZÇ®êA{ÁoŸÎZ+E±/sŽøÆå/ôt1Ýÿ\0«ÏD¬øÌlkÐ>2œ_èqåÝg?óÊ¼íÜž0Ë^+ž¦æðØ©~Í\"²‚{\Z­<›âãª`\Z}ÌÞdê™Ç8¦*oŒç¦òkœÒö+,AWÎo½‚T’‡ŒÇ/Gò°Ô4{äP§ \ZšE6Æ81T„ö*0ÝbŒsYº‹fã¯¡z¬–)\Z°À?cÜº¼;AÏcTfW%¡ÓŽ	.ØÚ*Å›l¹lÿ\0tb§E_²(*TQ£rŸ{É7‘TY¼½ñŠÔóN™á÷$`LE¶­dïÙJßÀÝõª:õüÇOŽ™#ÛLÕGV7¢9Ç•¤Rìyc“T.œ2jÛœ®*œÉ•\'5èìŽ]ÙNÚM¬Wµ]^k5ËžzVœCu4ðÇ“VÇÊ´È—bóéC5hK\ZíÖ«3zÔŽÕ]Û­HJÕRFæ¦•ª³žjYC3ÍH‡š‹½K¤†^€á~µ.*(Çi\"ùCJp¿Î˜†Æ	è?\Z‘˜$}y¨Zà•0ÐSY²¼ÐqÒ±5vŠ«\nsW“@†ÍÈ¬‹Îñ­‰9SX÷Ÿx}jYGCdÀÛÃèmZ0[O“ïkÕØÄñŽqÈ­‹o–&ÏãR2+bdÀ,F_“SÜ»åÏÊHç½W·eËaÏÕ4à‘Ñ³Ï\"®P–%ã<|‚ž#	rÌß0ô©.Ê™ßŽ*hZ3\n3’\r)›E]ÛFõ^_3yAãéWpQØrCt¦Ç”\'ŽqJÂ+MÙvå¨õ5·k¤yBáG@*áÞcêyª÷’5Žp~nim¬)ç\0N\0$Ô›™Ø€Ux_jd\0‰7,Wå©XþV9sšåP;àÖ+þ‘&GñVøP“”\'Á¬r›.åõqÇbŒS±KZÄž4‚Œâ\nF*)¥ò×ÜÔ»ëU¦;‡¨Í®p2y«»–«FvÕ•9Z`TeÁéM«\'qU³Í i(¤jC\ZœÓb<TX¦;tÖ´“÷@Ö¾‘øs¨Ï¬ø\"Å£Úd·Nýß0Ò¾c‚L(Í{À-E.§¦H~ehùíßùTTWEÅž¡esuqvð\\9.¹è8¦¼M©(8sûÆ=‡¥^’	 ¸i¡]Ù#)·\ZŒvöÞdêqÐ×9¢Ô³j‘Â¬!bƒw®jÅÌ)$_½`[®v\nãT»–èÊ.GŸ”z¶ÍýÁ±2][ì*9ù¸4)&>VlI”‰67üê‹§ŸjÆs½Øü»{W+-Õõì»ì¤~6né[ºD’CÛÍþ½<QÌ²=2øñ2¢íààüÔÝFÑåÛjÈ|¸9Ýõ«r±X Eó?‹Þ£€î¹ŽáŸc(Ã(ä\ZLÏêÔd…>ÀÑF\'<îö¡ü3y41˜„qKÈéô®¢æþÚÕÏÚ\\\"Aæ£µÔ\r÷Íï!xËPâ‡ÌÄ‚Íc°Ž)\0%WicüGÖ«M§i¡K\\˜Óå¬Ky‰‚\r­åŠóXº¥Îš’þóÌ;ÆAaòÐùb]k3Ii·LQ\"¨ÚJk„ÕfžÊ_šÞHÙ‡ÌÍÚºµ†·‘ÖÏ˜›ª¡æªKõîÍ–ÎÁ99Ç½sJWzDrcU‹Í#|úí95#êL\"’0ÑEž¾gÞ®îÏÂÍn|Õ”\0ys\"Œ^i·Þ°¿»\rªM!å$jJ,—5s‚³Ô.KÆñ°}Ã5ê:F¡-ÜfRß¼p7îçðË/5—¾@DVöÛ‰(¿xé]¦£G¦#DÑ°‘Ž~gÎ>•QŒ¹„äš±³á‰|ícPqÈ6öÿ\0ÎZ)þ„Ã­ê@‘Ì0`Ã2Ñ]‹cîrÿ\0ä! ‘ˆîþ¹WÍ\'ÌKáÇÍ^‡ñ\'RðøJ]í*ók˜¶«ÎpMsÔøa±‹~Ø¹ŒÆxQÍMâÜ1é‚MeOrÄÜ8´¢B¶\\òµcbäB.Â¨Tëš¸çtà”T¡Œ2ªã¿Z±rÁ.CÎÁš«™Nè+\\œž‡\0U#†;S°Û‰l÷5yFf,ç9ägµfÞMº	@Øi=	kaíN±`dd¨í×û™°6ÕkiŠ\\S²÷0„|£õ§x¿P·º†Á %ŠG‡ã¡â’á\0Ó!˜rÌÝ*‡ˆ¢Žˆ–8^2Ñ`ã©=êé/x\'ð˜2>:UyTÔ’\ZŒž+Ð{†\\§ïZÖò,Yw+’MIk!òÇ4&Q´³îª–ä–ÅLM]Ä#µVÔÎÕVSRÁå<ÔÔ²\Z‹ifÀçÚ¤ 5vÒÙæ| ã¹ì*k}4*‰.›jãî÷54—WË…Dh;ôÀ´6ŠBâGÇÞôª²ÎÎ95NM \\Ð Œ|Õ>3MTÅJ0%Á«+Q ©Wl¼)¬{¾\\÷­‰O?3ãÞ“(éì‰H«ýÚ¿`ùfSÜU;XÈÓÕÇMµ{ODó±?0íYî22Ä]HƒÔU žSœªªÁÏZ õöç¦MY‘ÄñìXóÇ¤\"Úntºg‚)Ë\Z,,‘©óO³Ú­\\D~È\'Îƒš‚Ñí)#t\"€&‰a\\E!Ì›x÷ªSlŠé,éÅ_¸U\"9k4Mœÿ\0JÎ¸‘„±ž¤äóÚŒ1â9X=j\0Aæ¿Þõ«h¥íäÏF`j½ÒÆê¶ñ©É €9ôê*Ç&âIÉUx­C$ò1ëO#ªØ$Ð%>eÀ`t¬ÇÞÊ@ã5²Ä}¤ààç¥e0ÿ\0J­RBR\ZVâ\Z±4šq¦š4Ô©´¯=j:L‘Ò€$Û´óSDj%mãéêpy¦’­Ra†5xr*´ÉÎh\n(¢ÆŸjù`*vâ àÍHh±mZë¾xü9ãKÀØ‰äJ3Œ«q\\q!F:š–wŽ0G\"¦[\rrÍ>cÝ\Z+DÃ†Ï\'5ÊêöSºù?2£ò	ïSxGQûwƒ4½FCÃÛ¢íõ8Çô©u;ÐÐ0_ÿ\0AèkÕ‹Žç9.*YÙµW“Ç+T 7WªÑM+„SÇ5±m¨^¾èo0¨xe#­\\†ÎÎ;ˆÔ,²}Ý£åZæµÙ»h—M²‹J±%ÙÇ5¥Kwr²DÁBðxêi†Çí2.é‚ìä\0hK»}8±™Šäç§ZéŒRF-¶Ç_I˜&vUQÔ“Y©­ØÌ³%„Šþ^7`*/$°Õïæ‘\nªü«šÎ×ôÙí,è°ÆîF_æ#ÐTJH¥]¶ºÝÈñ/ÞÀ‚~µ?ÚçäZun§oZç´\rBÓü“o!‘›÷Œüì>•Óéñ º&7Ê§Z‹¶Êµ‚Ýà´³È#ŒÔ7öv7ß<Ñ>ÌcåèjË¨»Ô6²§LzÔ“À¨ÁKà7ì*¬MÊze†—\ZþâÉ7ã#5 ‹¤±Æ±\0	ÎÐ)a†+XH2ÍÔÐ7	Àaëš¥by™bHÄ ¨\nŠzåsP¼i„Ò<z\n‘#,äóïQOòž*¬¬-FÈ­µ˜Hyì:\Z¨ Ÿq`r}ÏAVüäŠ?™rJíPNajÚ¨·›ìÙ’¹.!©]$ZŽ¦Ï…æ2ø‡WVl”†ØqÛ™hª~a&±«ÉKÃlN>²ÑN;-Ì/ŒmC@\0Å.±ûe^w¨.ÔÆØó`\nô?Œ«+_h\"ßêî²@éþª¼¶HÚÝLŽqÉ\'5ŒÖ¥Çcà ¼U=E\\pLa·cYñ´êHç–biû•ŽÌ¶Kjä®rigV3Hã¯AOƒ…§?2ªç– OR».¿ÙLÖ=ì€ÆøïZwÅæ\0ã#¬ËåXí”dn5H$YþÍU²C$ì:qÖŸ1…U¿ŠŸ§©i›sŒÓ¬Ë³\\2ÇmŒíÍXñÃ™5µùÃâ‡z¡yˆñýáSxŠ\'†ò1+)-@^Âµ¢ýâgðœäÃŠ¨Å¹®L>j©\'Ês]ÌåEiì9ª°ÈRB½ªäŽXb¨MòÉ‘RQ·h{ûTíT´÷Üƒµ\\cVI†ªÊjy\ZªÊÔœÕíQ¥rË–Q•ö¬çj±§NcºP:1Á¨êQ­p	5P©-Ò®ÍPíª$ƒa§$y©‚Ò… .4.)ÀS‚Ò…ªáÐS…6œ(×åMcLÚ=³[}ÓY2dÏÇ­D¶)>#µ–ÎÁjå§˜v¨ J‡F@a†àGj·i\n­ÆY²3¥f†8Èb½Ï»qW%E{xÝ>F^Iêò*^ÄTq‚Ôñ\\ÊqËÆ3Ò‚G\\¸k2Ñ¾w÷¨a|*ŒpZEOÝ¼X?)8°¨`L”Œ³\'\n\0Yq\'—’¬Ä6y5Võ$Õ‚å}û\Z¾ÌÅvï\rœŽ•VïÌš=Ìÿ\0¼Ýß¦(-¥Vf‚=sO‰P[É,Üy‡öi#…¶Ù’â4aµ\0°çv9 w+Ú°Ý‰º˜«\n€»\\6QÀÇZHa!ˆL)\nµ2ùq$@\0Æ€¹„ÎòÜo{Žj¬‹‹‡úÖŒíåÝH‰äÕ	F\'|õÍT@…¹¤­IŠ±	ši4êi Bg4´Q@3ž*e>µç;V˜#Q\"î\\\n†&&§ÎWš`Qn\Z’¤”aª:‘j®§tØ5;\Z®¿ëM!—¢ˆu85a‘éUS u©Ññ×ÐÐö¹ô—ÃÛ‡—áÞ“qˆã<È95qî\\ÝÉEÊ¶1!Æ~•—à¹-m¾èÀ#$Æ!½È#$ÖÕž—iu¨­ó¹–åNBÒ¼é·s¢+Bôzv¡}fö%ÞISÛëPÝÝf¦éQÕAØ6tÍjOy$$,gº\nAsÙàY?¾µK`hÄMi>Ï\"¸*Hÿ\0\\Jƒ^ñB8ì!‰å¸äps]iº|HÛ,¶©^ßv³5K;y-ä¹@«+($cÞ®ÎÀš¹ÃR[fy„M¹ý“é[zV«yq¶h§‘F8\\VÊÛZ%œ?h‰?|ÈGÞ5Í–›Fñ#lÿ\0i¤û£ØVŒ–¦÷V:Í,=ÜÏæG\Z÷ÙFVÜð§<xLõ+Ö©[ßEbHÕc,ç ÷¦Ã­µÞ¢ÖJU8ùß5´±„ïs_Å¤ÂJ‘àíbÝÍZÓ|YaxÈn.P¶xµ©.‹höî\'†Žs†^•Kþ½,,viƒ”*>íèFÄW—ûÅ¸Ëž{Ôñ[É± Nd(íïX}Ý”›í¢Räã8è+Aonæ‡qœ,ƒ\0ãµRo¨šF¼Ð*°%ÈöíUe_6@áN[*{×£WV+üDÖb½æ›¨K=íÒO„2Ûç•úSæAaÚ€–âI Š®0Œ:­swûC…Žñ•×þz•ÚÉu€>ÔGg“ƒ\\Ö®‚ÛT»È3Ð~5”\"jü=Ò¦Òõ=]\'f/\r±§§2ñEZðQÿ\0‰Æª2IÛçó–ŠÚ	Œþ#âá¨h[Á*cºg¯úªò]ZéžÞMƒn~Qí^«ñK_hXr¸Žë·_õUå\Zš÷£åa¢±©¹q2b·[u¸”6YSjûUe9psÀÒ­ÏžþJöùŸÛÚª¢³Bê§$7ZÄÖÆªË…yÏJ°y!‡eÅTÓÔ´ØaÂ­hJ6FE½‘rÅVF•so›4¡v Ú¿Þ5jâ`Ò4@ã\'³oñÃ½im	¾¡%Ç•o*÷‡Ý&Y7}ìæ±¦`a«Úì‘ŠúÕ% ›4¯ƒ%Â²Ä0Àõ9¨¼V“Ã¨Ûý­vLÐîuÈàæ¥»œÈ·8\\È¼úsQxæiÄ?¼}ûb\0u«¤­\"%ð˜oÊÕgŒ•8§¬ õ§†¥w½Ntg<.O¥U¹‡bó[zÏ¼AŒÔ4Z\r)òÛ}5¤çŠÉÒ¿ãñ‡lV«ýÚ¤&U‘½*œ­V¦5FSšDNÙ§Dû%Vô54)¥Ô£>d*ã¸Í2™a(’Ìy^)ç­hH\np¦ŠQ@ÇÑIš	¦ÑšAÒ—€dßêÍgt›ŸZ¿qþ®¨Ä»å8æ¢C:)ŠÚŒuÇbß{7ÌÒÜÕms\rœŠ´¦HÉCÐ6p*\0šôaQ€9SŒÔþþ´²(9$úÓ/VO²ïcÔŒ\ne¤óF\nÇeÇÌJ\0²²+FìãƒU-äˆM¹œç¸éV71’C*€%Á>™W¦aù¹ÀéHwÁ+,hÕ¾aëTï\\3Ð\Z¹41ŒC»œæ¨ÝÄ<–IkŽô\0ëRHb’aÂ‘ëD8·‘æ8rM7Oÿ\0S nÏËžõ%ÁfQ\\õ^Ù÷K\ZFÜ“ÍO1f™¤•øåöªð[˜˜yjxéWnÑ\"µže“Lu{Àà“ƒÖ£˜~ùŽ:šµp‰op†;­A\'305HeVûÔb•‡4™«Ö¦½Oni˜æ€9â€)E.\r\nŠs–U©IÀæ«)2I»Ò˜Ë1ô(<TIÒ¤!L¼f«ÕÆMÁV9¤ÀkU@q7µi¹QïŽjJ/#dTƒ-;Š…x\"¸àœ\ZRÕ	n}M¢^icÂúuœ-í·L.‹ªªããÛ¹§œW›|5ÓíõÅ~Ò7Ú-e12“Çå]{4²—ùŠöVõ¯:nÌìŠÐÔšò°Ÿ9Tä1=êKyU$ÞzñÁªÖ²Â¡‹\"/ð2Õ»i£ùæFË‚ÍÒ?Â© z–e»˜(Kaæª°ÊžãÒ’H÷ØÝKä1÷¨>ÔåK{E/<ÊªÇ;ëõ¬½GR´BÞC³³\nµhådBŽ¤6W¯ªXF­nð˜dÚK»ï\\Ç…Ä²G4dù)ÀŽ}k¬³¹HíZIGÎOÍ“Qê6ƒT…ÙaÝÜí¬¹¹•åÔä¬õ+¹<7™{Ï•¹›‚;]n‘åÝÙ[JT©Œ…$¨§G¤Aqn!¸PÐ>1Æ6Z£|yµ \0¾^G½TDNI—%bFUg2?,ÄqM¶Y\',™*‹úÓ$¸hÒ?9ðíÔwÇ­J“7Û™Ùn˜­®Œ’%X0\n²¤pk2KyN¨Ñ¬Y<xvÏ;¾•¡ÂˆAß“ž†¦U‚Ì„du=èÐ:˜fU³fEGh:\'œÓeµ…aiåÝ+‘û¶n£Ú¶Ö(C*˜öó•ÀïC[#Îƒ€ÎIíRâUÎ>öx Mæ+¯Ü`qŠ¹am*DDïæ.y\"º“g®dUÀõ¬ZP°í·€Ó â§®aÞRšö´÷„VÙŒ´Rø)ÓWÕžè#ÃmA™h­#±œµg5ñ®àÛÞx|œ¥×þÒ¯\"Õ/Y¢S\'qò×­|ož÷ÃÛF~K¯ý¥^;ªF~Óg¢Žkš§ÄÍb´(EÚiò²òÒ’I5‚³OSÍZ¸èå}Gb¤0eëY§sd´6lã)	>¦›<…ä8ä\n¼‘¬B(œüÎµÕºÆò\")õ2g+©6.	SŠÌžO2=Äò\riêIþØì9¬¹õªØ’gpñ\0kcÃ¡Í¼d\\ü|/=kOK¢TóLVÔ¿tMAž Rx©üÝzoö@ZŽÊ!uªÛÄìFù94kÁ·or¡öŒûV”¾ —Â`Îvt¦Å9õ©nxª¬„×aÌXi³ÞªÜ>áÉ¤Þi¬r*JJRnÜûV¤œ-PÓ»zŠ»!ª*MÅQ”Õ¹Ú©Hi2‘ë@Òw§§Þ¨ê®”ør‡½h8ÅdÚ°ß:ëdK#Í(¦ÒŠ:ŠJLÐÇJZe-0qþ®ªYŒÜ7¦*ÅÁýÝAe9¾•œŠ:mdŸz¶Q¾Úêyæ©é€«¨^¤UÖÊÎäŸš –Éïa?b%O8j+Oš97y¥™ËÙ‘ž‹ùÕ{i0 (åÆ)4¢x\\<l¸‘³\'¯½RGÝHŸwæÉ>µ&|¶.£<`ÕW.ó»\'¹â˜Í;‘ƒÎUÃŽrk:ûËšÔÎdÈ$TË+À¾K2îuþJ¯8Xá`í÷ éÌBN:sW-Í²Ü\\Í(bp“ÒªÚÂŠ‡!¹m©.BÛÛl$’Çò }¥Zãä8\\ýÏëV4·q–8\n2	ìk*!²á¾\\?x÷¥4ìbyŠìv®;ÒR™¦ÔpÇ;OQëDÍºmÃºŠ/ x\Z\"X1~[šã}TwYúÓ	§È0j:ÔAEP §\nny§P7.<¦£·áj	äó&Àè*Ä\\R8§Lœ)ˆRj¼£šœšcŒŠ\0ªz\Z¦ŸëM]c5E?Ö\Z–2Ø8$oóTñR@2E =Gá–§sz……¤ÁLè&E<å—­z:_ÏŒrMo#ÊØÊ¨èkÈþ¼CÆöQ\\6Øä¤ƒíÅ}öxþÀ¢Ê!$ p¾¦¼úÔÛ‘Õ	«ÕŸ‰-ã¸KkÛffcÆšèƒÆö®ñÙ°QÐ°À¬ÛèD1‰\'´1KÐ¶3´Õ?Ä¬\"õ/Ž3Ž£Ö³Ó³)ÙìV’zßg¿rÉÐ©à\n±gáø“lM`xjBP©šÕ16sÈ5nÛPR»l¸8É=Mj•É¹—©Y˜d*\0!\0t&Ÿ¤lâT¡^µ™a“çp@Ã­s\Zš‹Y›•SÈ$çšN<º¡§}ËñÝƒÙµÕÛs×éRË¨N_÷Jª1Æ{V¬‘ &“ÎÉ¡Öúä,‘™\0\'\0(äÔ*Œ·£b[‹¹Ý$;K ÂñÁö«i;Í(V8Á tSI§Â«nZå$Y1ƒž‚´­íb1’ÌsZÒ1“!É\ržH dy}±Ö¬Åp\'µóq\\ãiíV>Ë¬«\"\rªxµ=v¤l¨\\t­”Z2º+²ÆõaŽžµ\"°bË7 Ó„ñglótÅ+u”ír8÷ªÒÜ4{\"K¥W¹ÒPïIY[u¹Í^c P­¿ ÷¨®­æ‘Ég8š‡{	Zå³sWY%a·}e¢§ð½»[ëÚ®î­\r¿O¬´SŽÀ÷9?ŒÍ¶÷A\'û—_ûJ¼RíÙõ	Æ<}+Ú~4êì]ÿ\0í*ñ½IOÚ¯JÂ¢ÕšA™—\r­Š“IýåÆÃL]®Ì¨«ÚU¯—!Ž{V)jo¥‹ï$’Þ3 ùbA5?ÙRZY	9è(a¶Ë*<Ê~ôh:{Ô¶Wv÷‘´¶áÕ7õ­Æ;³œÖ­•nŠ¨ÁaÒ¹+ˆŠnÈÆ5ÛëÒ*Ýo\\f¹=Pþõ°@üêbõ4·ºf¯$U»&Ø^©“Š–šØÉZsãTµ*p|À¨õÃ³Z»\r×Ì9¦èò\"k²H~Dâ«ê×hÔn&d„Ö”orjlSr©¥Z`<Ô‡­u³œ«$xéP0#­_|P¼a…M†\ZÕ©\rCh»wT²ö«Œýj›õ«“óš¨ýjYHˆðjX¹\"™RÄ9©—\"V­±Ý\rfÂ:Uè\\¡v­{ü¦\Z%ùŽEEÍP‰sM-Qæ•Niâx¨×¥-1\\·îÍ3L§lÓ®~í&—–•ˆ¬ÙGC§ûB‘“‘WÝXÝ#€ÃåT4÷ùÐt9ëWî›ÔØA%sÖ jE›>á÷j¦ž2ü0,½±VV-é¹¥ä‚\nŽ‚³b?ga&yb@€4bÌ22¸Èa•>µRIfK‡\nÛ3ü8«;y1”LH¾¾•Rù‰d’^$éœÐ™£B¯Þ(ãÎ’[Q»2)Ñ3C’^Cô”Å‹t.pHÍ0Êlò…?ìŠ{K×#¨U^µZÚ6UPÃïq‘V\Z3¬’ªåHÁéRLÉFˆÁ©.Ã¼in¤Ì2}*l!3JåqcWI¿]£Ž(‰¬\\F.–$ùŠŽM@­¸}*kÄfŠIÝñêj[tyéT€†S–¦bžÿ\0xÒb¬‘¸¤Å?˜¦qLžO.?sSTnÛ|ÛGj:®ƒ-š³b£Šp¤àÔ€Ô\nj@h$sž) Ò¿Q a&\nšÌCûÃõ­6?)Ï¥e§$ãÖ–ç\"®B»EQUn¢¬ÂÎ>÷JgSàéþËã&VÆÑr¹ÈÏ^+êh%µ†®ÞS1ã?ã_ÚÝ=¼ñÌ‡‰Ã‚=ŽkéÅ{gÂQMn3À²£ÎqÒ¹ê-M`n<ëkjÎÒy¡¸RÜŠÌouqæN2#(QÒ³´Ë[û»A£?Ù§AˆÔ¯ÊE>ïNk{t|à*pk™½N„ëq<ÊT˜ü„åT¯\"¡i žD>`@¬w0I«šu«GAåÞq†f8ÅAyÅ¨‚6fa€O­iÐ‡¹<ÒuÊ~ògé¢¨¼‘Üñ}nŒ g\0rkZ(|¨ƒÜp½Ï©¬«­RüØ‘W|g£;~´ï –åWÒ--eKôE€·HñÍjÛÝYr²JÑGJÀ²’ò[‹™/%GOô­˜m>Ñd„‚‡;W¿Ö³V¸Ûîh	íXŒ›H&s»êh†!bÐÊ>½¾•ƒ%¬Ö7-Ópëóµ¯o|à(¸w”ÒµS\'“BÚ½ç™÷‘½ÍL<Õµe.¾nì“ž•›s©$3$SÇ*\rWŽâíŒ„I.çÁjù‘\n,Óy,ÕÄÓóVïK!¸3¡·\nbÇš©yj°Û™$‡jÁì*¤Z›lÃ¹ßVÇÚ¥È¥£uf@|Ü’NH\'5VmZ5TcëXI¬	æ0†——Ï_¥2Gó¾ïËÏ!¹Í.kÊtžºZÖ¦GU‚ß?œ´UoÀ!Ö5S»qx-Éüå¢­;£7¹Íüdp—ÚzùWxÿ\0ÈUá¯|.¾xÜF+Û~77—&‹ +Þ?òx$\ná\\0[\"¹ª_˜Ö+BXyœ¶:š×‚b1å€Iè+n31Aü=kcKÃ´eÃ¡ÎA=é--ìjj:¢YØýšÚ&ûd«€XpžôØ-ÓI†þúï<“ÜÕVÍÆ¥4Û‹¯ÜB}*îµrª:C÷T\rù©ææ4·*¹Êk7Æg™YÁ*Ù\\zW1q1›nkgRT†pÌqŠÂa„õª‚žƒ·nP*xPœÔ	Ú®Â1ŠÕ˜­É­ÐDÁÏj­rÁ˜Ô÷2ùqrMf¼¤šè¢´¹•G¨½)TfJabkc2môy•â)¦Oz‹Ö¬ú|œÔ(Õ3Ñp)ËTž®ÍTž¥\rNµbPµfšHeè8«CPÀµ9-jˆd˜1ëP·$äÔÉ\Z†}éëM§\n\n	¤‚hb+Ü¶Ó´ufw#\ZŠäõ©´oõŠÊE…¾í‡æ®ÝÛ•¸B˜<`š¯fÛð‘¸<Õ«€É$x<`çÞ\nCyïŽµNÁÄW\0³Œ°éWàF0ïäÖZ>É÷M4[(¤3î.I³ïa’KˆÉ?&ÞjÜÒoŽ91‚çM•ÐwQ“Á=è%±–Ý0ämæ¤’KNd?w ëV!Eh·(;}ê!l¬¬23E1Ù´l¨ªNW¦jyäFž8“ åQÓÀ[€Ìw`sŠ@óß…\\ó@ˆ.ÏúQxeìGJ³$¥lLq}Ü`qT¥òº«t8©ÝÐÄ¥I;G RCYhá±Ž=ùvŸlsÍK¨ºÝ3²ƒò.EC	#Òª 5¾ñ PG4ª*Äœi)3Š`,˜D&²ÇÍ!oz·w/ÊÖ«( ÒRÒb¤\0\Z‘Z£Æ)TÓYcÀ¨TÔ½PÔ\0â€!ýÛ}+29æ´§ùacíYÑÒ(¸®1Oó8ª¡©Û©»Ÿ0¯¤þj¯¨xÕ7n6ò´${v¯™#nkÜ¾kPÅ«¦N@,Vx³ù\ZÎ¦ÅÃsÓþÒfÔ\n8VÛœ÷¬=Z™5$ÉB2Žî¿JèV\r9ïªÊç¸\rTuÛ!|»­b‡Ašášº:\"ìËQ¥ÅÂ#@âd8Ý÷kbÚŽ3¹X`Œæ¨iÒ?MU¸PNÜ¾µROy‘\Z…\'Ôõ¥5îê)=M{©­Ü20‰?Ý¬B±ÛÛÌê›p76–™}yý¨«h“K‰cÁ5¯qra±K‹Ï‘•äÇj»°ú	§Ïi¨iî\Z=Š\\a_Imm.å#§§Ö¹+i\"üÌ}ùÚ\rkÕ‘Wû9<¸ÏŽ¦”\Z¹2C.®&†ðÆ®]zÇ5Dß]½áißv\0tÅK©Ê–¬Ò†`É\'š«ieu§¬‚eg\'æWIáS-ÍÆŒriš´*dCö„Èù8ÇÔ÷¤ŠÌe-N#¹B7_­iZEnmÓËhDD|Æ1Š¯¦\"ÚÜÝÅ#+¶á¸üÀ{SÕ\"z•$ÖfHü›¹r¹Ñš£šþe„È‘FáéŠmÿ\0……íÙ½Y›aù¶“Þ´¬­g–$ŠB¥#èH¨Õ•tŒë{\Zž#žS‚ÖÖ—§ oµmsØç5#YF]b@¸Æ\\•ëì*W•`A®û5¤cÔË>pÚî® cl6ÿ\0ÎZ*/£.»¬Î6ØÏÖZ+xìe-ÎGãÄÞLZ1õŽäèªð™®<†9_Zö/ÚFúÞÍ|8.VF 6{y>â¼&MSK—ýe¼íøÿ\0öUÍS›™Ù3ÑÃá¡:jN¬W“nÿ\0‘¥l¿é\"\\oÏð×D.nþÌÚmÝÂ¹®4kV1ÜÅ:°èÉ©á&Uw\\az?Z#	J=Œ+Â4ªYIKÍÁ±ÙÁnÐB3ÇçSÊ–q–å°sŠâ?á,lcÌŸAþ4‡ÅD®ÒóãýÑþ50¡(½H«V2I\"=M©w#Ìi±ŽàV,Ü­hK©XÎå¥ŠfcÔ“ÿ\0×¨Æ–zÛKùÿ\0öU²ƒLŽukãìjÚH1J.4±ÒÚoÏÿ\0²¥Z`éo7çÿ\0ÙUr²9’æTâ©¼du«ÿ\0mÓ¿ç„ßŸÿ\0eHnôÆëo1üúõ¼d¢¬g-Y•Žiá*ÿ\0Ÿ¥Ï´¿Ÿÿ\0eKö+þ}¥üÿ\0û*|ÈV3$â nl™´“ÖÚ_Ìÿ\0ñTÒÚ9ëk/ýôøª9X©§Ý?Ö§jš9´˜ÛJëÉÿ\0â©~Ó¥ÿ\0Ï¼¿Ÿÿ\0eO•™³÷ªoÖ·LºIëk/æøªa:1ëi/ýôøª—$4ŒpjÜ\rŒV–4_ùó—þú?üU8>Ž½-eÿ\0¾ÿ\0MI!Ø-È)‘RšÎ˜£Þaøÿ\0öT¿kÓGü°›óÿ\0ìª½¢\'•‰bO­>dïMûf›œù~ý•)½ÓX&üÿ\0úôs åd9¥ÍIö½7þxMùÿ\0öT}¯Mÿ\0ž~ý•è9XŠiÆ“íšoüð›óÿ\0ì©~Û§Ï	¿?þÊhƒ•”.Ÿ®h\n^VÁ\0“Á¤iô¦ûÖÒŸÄÿ\0ñU%½îjI‚	“>ùþµ.I•c¡±Í¼„I´äÕ‹Ü‰`\'!3Î+\ZÕ²œ„›?‡øÓŸ]À\'!NGOñ¥Ì…c¤ˆ²Â\Z2ûO#Ú¨ÅúFí»”¶HÍe¯ˆbTÚ¾x_N?Æ£\ZÕ²¶åIü?Æ•ÅÊÎˆù„°’2ª[äÈíUî¡¸À\n™\0òk%üC˜ßç§#§øÒ>¿ýá9ü¿ÆŸ2Vth·`@ƒÙ8æž±³C§<æ¹¤ñQ®ÔóÀôãüi?á ‹þ›þŸãG0ùM{T1\\`°-¸‘Š³x¾UªFÌÜ7¾kœ\ZÕ²¶à“ëþM:Mv	H2	Î9?ÆŽarš—`ÀaËQ­N!QhÏ<ñXRk6²æ$Í§øÒ\rfÔ&À³…ôÿ\0&ŽaØ·<VœÎøÌ€‘Yð©ö§ÉªÙËŽHç(\0Ïÿ\0^¢[Í5F	€úÿ\0õé©$.QäQMûvÿ\0<&üÿ\0úô}»Nÿ\0ž~ýz®t£©	\0f“íÚwüð›óÿ\0ëÒÍ4Œ&üÿ\0úô{D¬£,žcþ4å`K¤Ž–²ÿ\0ßGÿ\0Š§}£Kÿ\0Ÿy¿?þÊ—:VVïA«_iÓ?çÞoÏÿ\0²¤7:Yÿ\0—y¿ï£ÿ\0ÅQÎƒ••	Í*Õ¯´ióï7ýôøª>Ó¥ÿ\0Ï¼ß™ÿ\0â©ó åd ðsUò@£¦y«ÿ\0iÓ?çÞoÏÿ\0²¦‰´¥l‹isõ?üU\'4¥KÆ&Ç¥g¦m´ÚS®\ZÚR>§ÿ\0Š¦gFÿ\0ŸIï£ÿ\0ÅRæC±”H¦ï­|èÿ\0óé/ýôøª3£Ï¤¿÷Ñÿ\0â¨æAc299¯EøC¬føòÑNÒ—(ð0nœŽ+Ž\r£Ž–’ÿ\0ßGÿ\0Š«š…ÌwÍ±6ä`sƒøš™4ÑQÑŸR[ZAöÐ¢¬„œÀÍ]O0.ÞŸxŠù«þ&¢3‹Û Opª*dø¬G÷u¿ÅTÖ\n×F\\\\^#µa\\Ú‹ë¼3Ô‘^ >\'ë8Ô.yÿ\0¦iOâ¦·Êj7 ÿ\0×8ÍèÈúOžêÞ#jÐù°ƒ•b¼ŠšîÃívç³*¸#hë_?/Åÿ\0 !u[ \\EøTrüW×gÿ\0[©]7ý³ŒP ì.esÔãÐ–ÆyPÈLyÈîMhØÞ\\[[<&!‰Ô\nñ&ø©³e¯n‰ÿ\0uhÿ\0…ªÈ½ºýÄ¬}Œï{š{Hžï§éÿ\0j$ÖòÃ‚Ç#4]èÑ&1\Z^:WˆEñ[\\„§v¹ÿ\0a)¯ñO[åõ+¢ÜJÑSvÔ—5sÞ!¤hŠ¸	Ø*F´if)\'”Òz£Ò¼|OÖãPºÿ\0¾ž>*kc¦£uÿ\0~ÒfÃFYÁ&UK•¨bÙÔ\0\nù‰>,ëÑ¶SSºÚ8éçãˆÏ]ZïþýÇZ¨™¹\\úJç÷í äŽÂ±Þè½ÀÝ‘Þ¼	þ-kò>©tÃÞ8êñ7Vòÿ\0uÿ\0|%L¢ÞÅFIn}IáIš¾¤G¸·ãñ’Šóÿ\0Ù÷ÄW>\"›ÄrÞM,ÏÚ¨2\00éE\\SKR$îÌ_Ú—þeoû{ÿ\0Ú5óí}ûRÿ\0Ì­ÿ\0oûF¾}¦ ®‚ïÂßeðÚê¿lÝ˜£“Êò±÷±ÆsÛ>•Ï× j¿òN#ÿ\0¯h?šP?wáo²ømu_¶nÌQÉåyXûØã9íŸJçëÐ5_ù\'ÿ\0×´Í+Ïè\0¢Š(Ö¦]j—\"8Ë·ñ1áTz“Jt÷þÔšÄK›\Z—m¡Ø`g¹í^•§xƒKÕf1XÝìdd${?…pÚˆ7W—¶0†–æMJFDUûƒN}øÿ\0¾hÑ£vGYN=%]ÖfŽãZº’…øqÑˆàŸÄóU­åò.¢—ho-Ãm=ðsŠq³i1;ÛCnø†ÚúÒÎkÝ—q\nPnuv\rˆÊ‚*TrqYzž—w¤je¨D#’ÕÁ++)!A ƒ^‰sâ_%õÄ0êâh5{­BâKŸ³Ê>Ä.!Ø\\’	;¶é\\¿ˆõt{¨ÿ\0±u†0ØÃg´fXÍÄ‘FGœ €§ Ãa†\\Möþ¿«~%_×¯àgÿ\0Â\'®ÿ\0ÂIý™?ö´á\nZ`oùÔ8Ï÷~S“œmç8Á¬Èm¥¸»KhStÎásÔ“ŒW_‰-!ø‰¡êI}\"XÃš—’(qÄI˜ÆXŒö9*ÏÎi÷PÛ_Ü];á–)<™ØmLg?…?ø!Óîüw+[XÜÞI$vÑ4­m$›z*¨É$ôÅHt»±aöÃ\Zù;w¬]Ûs·vÌîÛž3ŒTš=âÚ]IçJÉÁ*‘ÉŒN«À÷l~5bÒ[Kmä5änn\"ÚmÄ,²‡Ü1óã8¹þï\0Ð.¦t6WóÜC46Ê\ZWù“Óü*{öÒÔ\\O¬.à%VdÜ2»”®G¨<Û!Õ\"¹¼iÌÑeˆ‘Ì±’ÜŒò98éRÞ‹+] A§j6óy›ZpQ$éÊ\n¤žüõô\0è5Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@\nƒ&»[…0Ô,-ïm42Þæ%–\'ûT#r°È8/‘Áï\\l]këkzUçôÈí5;9ÞÇN·[µŠáXÛŸ,pà—î·\\t>”óÎµðÓÅZ“6¥ªé^E¤|É>ÑmË+ÔŽÕÈ°Á¯¤>(ø»ÃzŸÃmRÏMñ•ys\'•²{ØävÄÈN6N\0\'ð¯œ$ûÔ\0F¡äUwXÔ·E÷8®µ<éit²MÎÄ}•·ï‘O­szeÓÚ_Ç$PÁ3´%Àù9õôú×g«èÖúž¶š‘Ôá,Ê‰A`L%Nqœü¿\0qº®ý•~Ö:Lèª\\ ?)#8ªuÑøÎôÏªVþZªºMÜÜŽÞ‚¹Ê\0tQ<ó$Q)wv\nª;“[rx?TŽ\'lBîˆ¢I2àöüåT´ÈtýrÖæëýR1Ü»Fæ½k˜-\'}RKˆ~Å$\n­&ïî–#ûÙÞ.ù +¥Qš–òu¹¾žt]‹,Œê¿ÝçÈè±°øSã-CO·½³Ñ¼Ë{˜–hŸíPÈÃ à¾G½X?|ræÿ\0“pñuÑx«áö½âË_húJ^Á‡­!i\ZX—a˜Œ?:¥á¯„ž)Ó|_£ß\\èÅ­ôI ž±VE$à6xµ\0y½ý”úuýÅ•ä~]Å´­©vºœ‘Áäv£N°—SÔ#³·dY$Î’\0žßJ×ñ¿üž ÿ\0°ÏþjƒÂ?ò5Yÿ\0Àÿ\0ô ÿ\0°áÿ\0 ö‹ÿ\0ƒü*X<7ö©Ö]cIšVÎØãºÜÇŒð\0ôª?ØÚ§ýnÿ\0ïÃ…kø_L¿·ñ%¬·WF»òï(#w\"€9ÊØ²²ÓA:Ž¥öÆÿ\0IòÚ”þîìßJÇ©~Å/Øþßå\'Ìò|ÌŒîÆqëÒ€\"­2ËL¿°ºí‹yom$å²žQÛÐâî?ZÇ©mì¥½ó|˜„žDfgÉj¯SÏÖ€=÷öZÿ\0™§þÝ?öµ~Ë_ó4ÿ\0Û§þÖ¢€Ú—þeoû{ÿ\0Ú5óí~€ŸøøO÷ùŠ}\0~}ÕÙ5­Nkc-ã5¨UQ–€`c!sÆzûÞŠ\0ø\"MkSšÀXËxÍjTEå ÀÈ\\ñÞ©Wè%ù÷E~‚Q@ŸjÌŽ®ŒÈêr¬§O¨4ö¸™å’VšO2\\ùŒ­´¾zçAôé_ 4PçÕ-~‚Q@ŸtWè%ù÷E~‚Q@ŸtWè%ù÷E~‚Q@ŸtWè%ù÷E~‚Q@ŸtWè%ù÷E~‚Q@ŸtWè%ù÷E~‚Q@ŸtWè%ù÷E~‚Q@ŸtWè%ù÷E~‚Q@ŸtWè%ù÷E~‚Q@ŸtWè%ù÷E~‚Q@ŸtWè%ù÷E~‚Q@ŸtWè%ù÷E~‚Q@ŸtWè%ùø§®Cª]Aaqe\rÌ‘ÚÝiáVÂÊW;wz¸ñÓ¿a_{Ñ@\04¹¨‰É¯ÐJ(óë­IóCo$JÉ¸ó#^Ž™¯Ð\Z(óè\0½)kôŠ\0üû¦Ð6àŠ××è=ù÷J+ôŠ\0üûò`bKE\'©*9¥0[ÿ\0Ïÿ\0ï_ tPçç\0\0¼Àµ,rÉà–HœtxÜ«¡×èð\'öž£ÿ\0A;ÿ\0ü“ÿ\0Š£ûOQÿ\0 ÿ\0þÉÿ\0ÅWßtPçÝhYkw66&Ñ-¬®!2y»n 2a±Ž>`:ç_zQ@Ÿu¡m­ÜÚX=¤ÖAd¢yŒÍen¿0oéØWÞ”PÏ¿²×üÍ?öéÿ\0µ¨¯ñðÿ\0î/ó4PÿÙ'),(2,'Elielma SÃ¡','ÿØÿà\0JFIF\0\0`\0`\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0Ft\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0÷ú(¢€\n(¢€\n(¢€\n(¢€\n(¦LþTIýÕ-ù\nMÛP<ÿ\0ÄšÔ÷š„¶ñÊËm\n§ˆêO­d[^ÜÙÊ$·ãaýÓ×ê;Ô$–bÄä““I_V¼êTuÔármÜôëk«Ú‘ sßQÐQ[5åš=ûiºœ7\0€íqê§­z!€ äA¯¦ËqN½+KâGU)ó-E¢Š+Ñ4\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n‚ûþA÷?õÉ¿‘©ê9×}¼©ýä#ô©’¼ZyQ_\nyá^—á»¿¶hVìN^1å·áÓôÅy¥v¹æêÔŸI~‡úW§”ÕäÄr÷5¢í#±¢Š+êN°¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0Í&åÄ?:ò¯‰¦X¼AnË#ª½°à9ÕÄº»© ¢Lñ/YP}XS\ZúÑ~õÔë ¯è  Î­§/ÞÔ-GÖeÿ\0\ZµÝ!~ö«d?íá?Æ¼Š\0ú\ZÓP³¿lî¡¸	€Æ\'\r®*Íp_\ZUüŸÞœÉúõÞÐEPEPEPEPEPEPEPEPEPEPEPE›¨ëvºvPŸ2oùæ§§ÔöªŒe\'h¢g8Á^NÆ•ÅÜxšþR|²¯¢®Oæj¡Ö5ro%ü+©`¦÷g³\nkdÙßÑ\\,:þ¥éÇ£¨5»¦ø’§X®TC!à6~SþÂÔ‚¾åÓÆR›¶ÆíQ\\ÇXQE\0QE\0QE\0QYº¶µk¤F¦bZFû±¯Sïì+\r<s“X°OU“\'òÅrÕÆÐ¥.IÊÌ‡8§fÎºŠ©§êVºœ>m¬¡€ûÊxeúŠ·]”f¹¢î‹NûQT’]GäÞM÷$eüCZZü^N½x¸Æd-ùóýk6¾\Z¬yjJ=›8\Z³°V×…n<~œ	AŒþ#Ô\nÅ©¬æ6×°N?åœŠß‘ª¡?gV3ìÂ.Í3Öè¤èikíÎð¢Šd³GfI¤HÐug8†í«ôS\"–9ãE\"È‡£)È4ú¾¨Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( 3ø©.´Éq÷’Eüˆÿ\0\ZóÊôïŠ‘æÇN—û²:þ`…y!…Q@Q@µðÁ6øná¿½tßú\n×k\\‡ÃtÛá@½;Ÿä?¥uôÄQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0dkº·ö}¸Ž\">Ñ ãý‘ë\\S1v,Ä–\'$žõkS»7º„Ó•-…ú•R½Š•8yž&³«?%°QE¹ÎQE\0uþÔÚêk3fX†TŸâ_þµoWŸé›}VÝÁà¸Sô<W W“Š¦¡;®§µ‚ªçNÏtQEsEPEP—ë×Mw­]HÇ!\\¢ûÅgU‹àWP¹¨•‡êj½|5Y9T“}Î«,Ø_Ï§]¥Å»á—¨ìÃÐ×¦éº„ZŠ\\ÃÑ¸eî§¸¯)­ßj§OÔD26 œ…lönÇúW¡–c\Zœ’~ëü¥)ò»3Ñ(¢Šú“¬óïÃåë›ñþ²%oæ?¥sõØxæøóœï!ýþµÇ×ÇæäÄÍ|þóŠ¢´˜QEÆAêš<ÿ\0iÑí%ÎIˆõåWkžðlþn‰å“ÌR2þŸë]\r}®~ÒŒeäwAÞ)…y×‰õVÔ5\'…ýžU@èOs]Ö©uö-.æàŒíúô­yI99=kÊÎk¸Æ4—]Y•yt7ü+ªµ–¤¶ÎÇÈœí ô\rØÿ\0Jô*ñõb¬r\rz½…È¼Óíî?ç¤a×ÓÉ«¹EÒ}6\nÒÅš(¢½³p¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(ˆøŸï[?÷nGê­^O^Ãñ!7xLŸîÎ‡ùë^=HaEPEP³|<]¾¶?Þ’Cÿ\0\Zêk›ð\Zíðm¾óÿ\0šé)ˆ(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0*¶)g;«ùTÔÉSÍ…ãþò•üé­Å-5¢•”£a‚¤¯xù ¢Š(\0¢Š([PMÜ u2/ó¯H®B¶7:¼<|±Ÿ1¿þ¾+»¯7\Zýä[/‹Pl(¢Šâ=\0¢Š(\0¢Š(Ì5ø|zñ1ÖBÿ\0Ÿ?Ö³k¦ñ­·—©ÃpÇƒõýb+™¯‹ÆSöuç3†jÒh(¢Šç$ôßê?ÚZDR1Ì©òIõÿ\0ƒZ•Áx6ûìú›Z±ù\'^?Þ?L×{__€¯í¨)=ÖŒí§.h˜0ƒÍÐ‹ã˜¤VþŸÖ¼ö½SWƒí:=ÜXÉ16> dW•×œÂÕ”»£\nëÞ¸QEäoçÄ÷väýåWéÁþb»JóOäx‚ž$â8ý@¯H¯©ÊjsaíÙ¿ó:è»Äçüc7—¡ìýlª¿×úWŸWkã—Å½œ~®Íùþ5ÅW‘›Jø–»$cYûÁ^‡á	üÝPžbvOëýkÏ+³ð4¹†òFVŽGô£)Ÿ.%.éÿ\0˜Q~ñ×QEõGXQY\Zö¶º=²íP÷}Å=>§Ú³´½ýÐµ½TYý[ À\'Ð×,ñ”aUQoRâŸ)ÔQEÔXQE\0QE\0QE\0QE\0QE\0QE\0QEÌ|A]Þ\r»?ÝhÏþ>õ¯¯nñÊîðn¢?ÙCù:×ˆÒQE\0QEíþ]¾Ó½Õþ<k ¬?xGMôËúšÜ¦ ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(ñœÖ×¦å÷SŸfïþ5‰^“qoÔ\rÊ`ƒ\\†¡áË«f/lñvÇÞ‡zô°ø„×,·<ŒVJNpZ3ŠsÆñ±WFR;0Å7®Ó€)@$€Iè[¶Ò¯nÈò­ßø˜`~fº+@ŠÁ„Ó,ã§÷WéXÕ¯\nkÌè£†©Uíd?AÓŸh^AûùyoöGaZÔQ^Dæç\'&{p‚„TbQEIaEPEP?ãO´hÞrŒ´ð<éùWŸW®Ü@—6ÒÀÿ\0rE*\Zòiá{{‰!q‡ŠŸ¨¯œÎhòÔU_Ðæ®µ¹Q^1-¼ïmsè~xØ0ü\rzÄ-Å¼s!ÊH¡‡ÐŠò*ô/]ý£E–Š~Gùö¯g&­ËQÓ}CzÖÆù\0‚C^Ky¶½žÿ\0,äeüzÕy×‹-üzVå•UÇåƒúŠêÎ©Þ”gÙþeWZ\\Ã¢Š+çb{)¾Í}ßóÎEoÈ×­FkÇ«ÕôÙ¾Ñ¦ZËœ—‰Iúâ½Ü’=ÑAîŽ_ÇG÷–#Ùÿ\0¥r×xè~òÄû?ô®F¸3?÷©ü¿$gWãa]G‚$Æ£s÷¢ÏäúõË×CàÖÛ®ýè˜#Q€vÄÁùŠŸÄ@¢Š†îaog4çþYÆÍù×Ø6’»;O9ñé½Öç`r‘Ÿ->ƒÿ\0¯šÌŽFŠT‘×BHìE#ÌXœ’rM%|=JŽss{¶p7wsÖln…íŒ+ÒD\rô=êÅsÞ¸ótC<Ã!Qô<ÿ\0S]\r}ž\Z§µ¥÷Gl]ÒaEVÅQ@Q@Q@Q@Q@Q@^2]ÞÔ‡ý2Ïê+ÃkÝ¼Z3á=Oþ¸\ZðšC\n(¢€\n(¢€=×ÂCÓý0µYð®™ÿ\0^éü«^˜‚Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( eVeê)(ÔåQGÐS¨¢á`¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0®Æ6?gÕEÊŒ%Âäÿ\0¼8?Ò»úÆñ=‡Û´i\nŒÉïðëúf¸s\ZÛÒÝjgR<Ñ<ÞŠ(¯‘8Âº_ÝyZ¤–äñ2p=Ç?Ë5ÍU½2çìzµÆp@OÓ¿é[ájû*ÑŸfT¤™êÕÈøâÛ1ÚÝÐ˜ØýyÈ×]Y^#µû^…r e‘|Åü9þY¯«ÇSö˜yGËòÔë¨¯3¢Š+ãN ¯Ið¼¾o‡­½WrþD×›W}à©7hÒ\'÷&?ÈW«“ÊØ‹wFÔ_¼TñÒf+\'ôgËü+Œ®óÆÑîÒaîL?Pkƒ¬óXÛß{~B­ñ…møI±âGª°ý\rbVÏ…äcµÿ\0ÿ\0è&¹°Ÿïõ_™ø‘é—â9<¯Þ7ªmüÈÖµ+ÅÍ·Ãòï:Ö¾³ùhMù3²<îŠ(¯‹8NÃÀÒü×±Daúƒý+±®Á-Vuõ„ÿ\01]Ý}^U+ácåÌì¥ðQ^‰ QE\0R3ª!w`ªI\'\0W9â?Øh\0Â?Ò/qÄ(~ïûÇ·ó¯+Ö|Mªk²wpDYâùP~ÿ\0\Z\0õ\rOÇÚœJ$íw(þq¸ß]+–¼ø£zä‹+\"Œ¬\\þ˜®ŠC:Yü{â9‰ÅðŒzGéš¨Þ.ñZçðlV-´¾.ñœVãñlÕÈ<}â8O7« ô’%?Ó5ÌÑ@ý—Å+Ô ^ØC(îbb‡õÍuºOô]Y–5¸6Ó79þ\\ŸcÐþuâtP»ø«Ÿ\njõîßÊ¼\"¶añF­‘6—öŸ2ÖU(VA¸¨=íXÔ\0QE\0QEï^ð¾™ÿ\0^Éü«V²ü7ÿ\0\"Î™ÿ\0^±ÿ\0è\"µ)ˆ(¢Š\0(¢Š\0(¨çž+hZYœ\"/Rk”Ô¼K<äÇi˜¢é»øøV´¨Ê£ÐÆµxR^ñÒÝj6–C÷óªŸîõ?•c\\x²%$[Û³ÿ\0´ç¥rÌÅ˜³IêM%wÃñjy•1õ%ðèlËâ}BO¸cŒ²¹þuUõ­IúÝÈ>˜Ê¨Q[ª4ÖÉî½G¼™hêwÇ­äÿ\0÷Ù£ûJûþ\'ÿ\0¿†ªÑUÉÄ{I÷.\r[P/&ÿ\0¾ÍHºæ¤½.Üý@?Ò³è¤éÁôCUf¶“6Äº’}çÿ\0ÞAý*Ô^-˜­µFÿ\0uˆÿ\0\Zçh¨xzO¡¤q5–Ò;(<Qc.‚H¸Èý+l€GC^qiŸy_ßp¿­z=pb©B›\\§§ƒ­:©ót\n(¢¹NÀ¢ŠÎ×Cÿ\0cÎÑ³+.*qÞª1æ’DÎ\\±rìhRÖ¢{ËhþýÄKõp+ÎšG¼ìßSšmw,ykÌ_Hûë:ru¼ˆÿ\0ºsüª»øMN’³º†¸Š*Ö\n[3y…N‰{ø®È}Ø§oÀëQÇâ•šâ8’Ðüî%ýOÒ¹J·¦.íVÐÓUþuOJ)»±•¥$®zQ^QíQ@Q@Q@<ƒEåºÕÓµYíñògrºz‡áT+¹ñžŸçYÇzƒç„í÷Oøç\\5|v:‡°®â¶ÝU#Ë+Q\\„§£Üý¯Gµ˜œ“\rõåWYC)V`Šç<qæi2BO1Hqô<ÿ\0<×I_i…©í(F]ÑÝx¦y5ý©²¿žØÿ\0Ë7*=ÇoÒ«×OãK/+QŠéGË2á¿Þýl~UÌWÉb©{\ZÒ‡fqÍZMv¾|Û^\'£©üÁÿ\0\nâ«¯ð)ù¯WÙó®Œ­ÛŸäU/>)‹ÍðõÇªmoÈŠózõF´é·0÷x˜®+Éë«:…ªÆ]×ä]uªa[>ñ·°ýÖ5nøAwkñŸî£ÓÖ¼ì\Z¾\"¨Ê=°<cÿ\0 ÿ\0]WúÖýax¹sáùO£©ýkêñ¿îóôgdþyÝQ_p‚ÏüNßþ¸·óß×à¡fCé	þb»êúœ£ýÛæÎº?QEéš…p~3ñ¿Øéº[ƒuÒY‡\"?aþ×òúô·ãŸcZ}†Íÿ\0Ó§^XË%õúžßy%‰$’O$š\0ÚGgv,ÌrXœ’i(¢ÂŠ( Š( Š( Š( Š( Š( Š( |ðïü‹Z_ýzÇÿ\0 ŠÓ¬ßÈ·¦×¬_ú­*b\n(¢€\nŽyã¶æ•¶¢“RW#âmDÍsö8Û÷qrøîßýjÖ\'R|¦5ë*Pæ3õMR]J}Í•‰OÈžŸýz¡EìÆ**Èðe\'7Í-ÂŠ(¦HQE\0QE\0QE\0QE§áø¼ÝfEËÀWu\\—„âÝ{<¿ÝoæúÕÖ×•Œ•ê[±ìà#jWîQEr¡Uï£ól.#þôl?J±A†švwWV<ÊŠt‰åÈÈ„‘M¯xù ¢Š(\0«ú0Ý¬ZöóT+KAÖí¾¤þ†¢¯Àý\r(ëR>¨îè¢ŠðÏ¢\n(¢€\n(¢€\n(¢€\n(¢€#ž¹·’RE*ÃØ×•^Ú=ìÖÒ}èØŒúŽÆ½f¸ÿ\0\ZéßêµôÎL~‡ú~UäæØiKÚ-ãùÖÕÎ:Š(¯™9N£Á75ˆ	âH÷¨?ýs]Íy—‡\'û>¿hÙÀgØŠôÚú|ž|Ø~^Ìê¢ýÓ#Ä¶?nÑe\n3$_¼OÃ¯éšóZöµåúæžtÝVh@ÄdïýÓþqøW.sCUYz?ÐšñûFuuÞ½½?ì§õ®F»/\'îïdõ(?påŠø¨üÿ\0&gKãG_^S©Ûý“T¹ƒ	#ôÏ¥zµp~3³òuHî@ùgNOûCåŠõ³Š\\ÔT×Gù›VWÎjºoÅ»TžNÉ?2?Â¹ší¼o¶Îêà¾áà?úõäe°æÄÇËS\ZJòGWY^$ÍðýØôPß‘µjØ~Ñcqüô—óõU£ÏNQî™×%tÑä´PFZ+áÎªð<y¾º“û±…üÏÿ\0Z»zå|Û+©ñ÷äùþ½uUõ¹dyp±ó¿ævRV‚\nÏÖµhtM&{éù>UÏ.Ç ­\nò?ˆšéÔ5q§Bù·´8lÿ\0.Ÿwš¥õìúô×—/¾i[séôªôQHaEPEÞxÁ‹¨Õ5(ólîaoùiî}¿Ÿó\0ÆÐ<©ë¡fUö‡þ[J:ÿ\0º;ÿ\0*ï´ï‡Z%šƒp²ÞIÜÈØ_ÀëšëUB¨U\0\00\0íKLFt:n1—f¾þJ“ùâ¥:VœÃ\rajG¡…Â®Q@×>ÐnÁivã=ã]‡ÿ\0ÅsZŸÃ9UŸM»’ì’üËùõ­wÔPëÔ´9v_[•Rp²/(ßCY•ï~%…gðÎ¤Œ¡¿ÑÜŒŽà+Á)(¢Š\0(¢Š\0÷ßÈ·¦×¬_ú­*Íðÿ\0ü‹šgýzÅÿ\0 ŠÒ¦ ¢Š(©Åµ¤³žˆ…«ÎÚIØå˜’O©®×Ärôi\0þ6Uýsý+ˆ¯KEÈòs	Þj=‚Š(®ÓÏ\nP0P	\'€zJÜð½²M¨¼®3å.WêÉ¨©>H¹JÒj+©5…¤•D—’Áþûß‰í[xMˆ¨Þ}]‰­:+Éž\"¤žç·-(-ŠƒK°,àüPPt»ÿ\0.pß±Vè¬ùåÜ×ÙÃ±AôM5úÚ ÿ\0w#ùUY|1§¿ÝÆÙlÿ\0:Ù¢©V¨¶l—B“Þ(åçð“Œ˜.öuÇê+&çE¿µÉ{veÄŸ0ý+¾¢¶Ž2¢ßSžx\ZRÛCÂ‘m²žR9i1ùþ½oÒœ\03Ïµ…IóÉÈé¥OÙÁC°QEEPžjIåêwKé+:«Z\ZâìÖ®Gû@þ`\ZÏ¯r›¼>r¢´Úó\n(¢¬€­OŒëp{þF²ë_Ãc:Ô~ÊßÊ³­ü9z\ZÐþ,}QÛQEâBQE\0Ess\r¤<òK\Zån|p«!Ö{‚YÞ+ÕZ÷P6±·î 8Àþ&î¥sÕóØÜÒ¢¨áEÙ.§5J®ö‰ÝYxÒÖg	w@Oñ¹ÆºH¥Žx–H]d2œƒ^CZZNµu¤Mº&Ý	?<DðÀÒÂæóO–¾«¸B³ûG§ÑUtýBßSµ[‹vÊž\nžª}\rZ¯ Œ”’”]Ó:S¸T–±ßYËm(ù$\\ozžŠm)+0<’îÖK+¹m¥xÛßÞ¡®ãÅúGŸ\0Ô!\\ÉÄ€w__Â¸zøÜfáê¸téèqN<®Ãá”Ã<r¯T`Ãð5ëˆâDWSÀ^A^¡ Ïö\nÎBr|°§ðãúW¥’ÏÞœ>f”­\Z5…â ê6lK›ˆ2ÊVÅnÑ^åjQ«	lÎ‰$Õ™ãÕè>¶0hžc¤.>ò§_xNÂöóíx‹º¦0ßá[qDÄ‘F¡Q\0U°åà2ùÐ¬ç>›Ó¦ã+±õ•â\r0êš[Æƒ3\'ÏÔvükVŠõªSH8KflÕÕ™ä+´¢ Œd-´.9Ï¥z†‘cý¥ÁmÆå\\¾?¼y50±µ_iñyÿ\0óÓhÏçV+ƒ—ýZNMÝ¿ÈÎ>]BŠ(¯HÔòýrÐÙk71c\n\\ºý\"³«½ñ^‹%ü)wl…§ˆa”ueö÷ÎhZú…úy±:[Fs#0ÆqØWÉâpU#‰tâ·z^G ù¬ŽÏÃ¶†ÏC¶†—{}O?Ë©@(¯©§N\n¡Ö••ŒÝS]Cº¾8Ý\Z|€÷sÂþµàŽí$#±gbKÜšôŠ:–#²ÓQ¾ñ3H?EþµæµEQ@Q@^ÐÛ^Öâ¶ ù	ûÉ˜vQÛñé^çiIjU\0Ú¹‡zH°ðÿ\0Ûq5áßžá\n?™ük°¦ ¢Š(\0¢Š(\0¢Š(®¦žf“xŸÞÇþ:kçªú.ußo\"ú©¥|êx&€Š(¤0¢Š(ß|=ÿ\0\"Þ™ÿ\0^±è\"´«3Ã¿ò-iŸõëþ‚+N˜‚Š( ?È-?ë¨þF¸êî<E—F”Ž¨C~¿ýzáëÔÁ¿Ýž6=Z­ü‚Š(®³ˆ+gÃWKo©ùnp&] ûö¬j ä\Z™ÁN.,ºspš’èzmËé~&Ú«\röN8ŸÌWKÑO’Ð÷SšñªR•7i#Þ¥ZUâÇÑE™¨QE\0QE\0QE\0QE\0QEÄxq­J}UOè+&¶¼P1«çÖ5?Î±kÚ£ü8ú?ˆV«/P¢Š+S­øœ/²5cÖ×†?ä/ÿ\0lÛúVUÿ\0‡#l?ñcêvtQEx§ÐQ@Iw¶÷sE0\"Er>µ\rzNµáû}]wçÊ¹@:ûZáµûLcçÂL}¤NTþ=¿\Zù^­	7kÇ¿ùœs¦âgÑEÂf_ÒuYô›Á4G(xtÏ+Òìï!¿µKˆtn?ìkÉkkÃšÑÒ¯6JÇì²œ8þéþõz™n9Ñ—³›÷_àkJ§+³Øôz)ƒ(e ‚2ïK_Puˆ@e*ÀF=ëÎ|E¢¶•x^5?e”å÷O÷kÑêËHo­^Þá7FãŸoqï\\xÜ\"ÄÓ·U±!Ì%¯Cð{–ÐTvF×ú×)ªøv÷N˜ìç€Ÿ–D\\þc±®ÇÃ6rYh‘$ÊRGbåOQžŸ¥y]\Z”ñ-IZÈÆ”Z–¦ÅQ_Ft…Rd\0îhh¬ë{KµÈ’ö\"Gd;éY“xÓNLˆâžO} Ô×<ñt!ñMç»:J+‘o¦~[#ÞOþµ*xæ\"~{ý™þ•ö–ùÿ\0þDûXw:Ú+×Åº]É\nÒ<çªà~c5µ‰*ÕÐôe9ºiÖ§U^Lµ$öEV£\n(¤f\n¥‰À&€<OÇ¦÷Å·§9Xˆ…}¶Ž\\×;S]În¯\'¸n²ÈÎš†ÂŠ( ¦´·k»È-“ïË\"¢ýIÅC]‚-…Ï‹ìŒ„c!ÿ\0€‚GëŠ\0ö»xÖÚ+xÆ$£ØT”QLAEPEPEPÔWÎs.Éä_F#õ¯£+ç‹õÙ¨Ü¯¤®?S@è¢ŠC\n(¢€=ïÃ‡>Ó?ëÖ?ýV¥exdçÃ\Zgý{\'ò«LAEP&‰g…âºêTþ5çW0=­ÌH>db\rzEsÞ$ÒŒñý¶Ìˆ1 Ç¯á]xJ¼’å{3‹EÎËtrtQEz‡ŒQE\05½Ôö¯¾	Z6ÿ\0dõ¨h¡¤ô`›NèèìüU\"áná?¾œÊ·m5[+Üg]ÇøƒùWŸÑ\\³ÂS–Ú”ñÕ!£ÔôÚ+„³×/¬ð¾bà“Ÿ×­tV>#´ºÂMû‰?Ú?)ükŠ¦¤5Ý…,e:šlÍš(9½ÎuQ@Q@Q@Š‡üLã>±æk\n·üX?âa	ÿ\0¦_ÔÖ{8á#ÀÅ\ZAEVÆ[^ÿ\0±ÿ\0®MüÅbÖß…¿ä*ßõÈÿ\01YWþ°ßÅ©ÙQEâŸ@QE\0„=A¥¢€0õ\ni×¹hÐÛJŠ>Ÿ—Oå\\†«áëÝ+.ê$ƒþz§Aõ«ÒéUÔ«(e#Eyøœ¶et¬üŒåJ2<~Šè¼Káÿ\0ìçûUªŸ²¹åç™ÿ\0\nçkæ+Ñ¸Os’Qqvgká\rgÍû:vùÐf{OÂºÊò(&’Þtš&+\"0e#±¯QÒõÔôø®S\0°Ã¯÷[¸¯ Ê±~ÒÊ[¯ËþÓFwVeÊ(¢½s`¢«]ßÚX&û©Ò1ØÉú¦¹›ÿ\0(ÊXA¸ÿ\0ÏIz~UÍ_F‡Ç/—Re8Çs®$(%ˆ\0u&±ï|Q¦YåDÞ{á‹Ÿ×¥pwº­ö Ù¹¸w_îg\n?ÅS¯\"¾s\'¥(ÛÍ˜J¿c¦¼ñ¥ìÙ[X’õ?3‡éXW7÷w››‰$öfãòªÔW•WZ¯Ç&Ìœä÷aEV…Q@[°Ôï4ÙwÛLÉÏ+Õ[ê*¥ã)AóEÙ‚vØô}Äpj DàEt)žÜ…mW#´n®ŒU”äpA¯Cðæ¸5[sÄ¨ÇÍþÐõ¯¤Ëómûº¿çÿ\0ê§S›FnU-b_#D¿—û–ò7þ:jíex¶ø_S?ôìÿ\0Ê½scÁh¢ŠC\n(¢€\nì~\ZFÅ,ßÜ·vý@þµÇWkðÀÿ\0ÅK?ýz7þ„´ëTQE1Q@Q@Q@|ù«ºÕðô¸ãÆ¾ƒ¯\0×FßjCÒê_ýÐ}QHaEP¼xXçÂºaÿ\0§tþU¯X¾9ðž™ÿ\0\\mSQE\0QEËë^!šæÉ2/íî?Â¹®‡½6²u-Úÿ\02\'î§þòŽÔWu]½Ùžv#ÍïSûŽ\"Š¹}¦]ií‰£;{:ò§ñªuèFJJèòåf‚Š(¦ ¢Š(\0¢Š(þŸ¬]éìo¾.ñ·OÃÒºý;V¶Ô“÷gl |Ñ·Qþ5ÀÓâ•á‘dŠºœ‚Jç­‡MvgUTéhõG¥QY\Z.²ºŒ~T¸[…ïQZõåN–G³Nq©h…QRXQEÉx³þ? ÿ\0®Ô×?]‹?ãöúçýkŸ¯gü$x8¯ãH(¢ŠØç\nÛð·ü…_þ¹æ+¶ü-ÿ\0!Wÿ\0®GùŠÊ¿ðäo†þ4}NÊŠ(¯÷ÂŠ( Š( Š( î ŽæÞH%]Ñºíaí^Y©X¾-«òPð}Gc^¯\\¬AŽå©òÜûu×ó¯+6Ãª”}¢Þ?‘hÝ\\ã+¢ðŽ§ö=@ÚÈØ†ãž»‡å\\íó´+JER=hË•Üô›ÿ\0i¶9_;Î_7ëÒ¹‹ÿ\0_\\å-‚ÛF{¯-ù×;Eu×ÌëÕÑ>UåþeÊ¬˜é$y\\¼ŽÎç«1É4Ú(¯=»™… `ª	\'€zéô¯Ïq¶[ö0Ç×Ëxý}+jz•åËM\\¨ÅËcšŽ)&p‘#;žŠ£$Ö½·…5[€	…aSÞVÇè9®òÖÊÏMƒl$(-ëîMQ»ñ>•hJ›5‡h†ï×§ë^¼rº4•ñý\r•(¯‰˜ÐxºÜ^í\Zgõ?áSÿ\0Âkÿ\0?“ß\"™7Ž#X³z|~€\Z¨Þ7½\'åµ·ß\'úÓrË!¥¯÷‡î‘u¼o´í½”Ù@k>ãÁWÑäÃ<2|©ÿ\0?MŽ\'÷¶Q°ÿ\0eÈÿ\0\ZÐ¶ñ¥„‡Å,\'×‡éÏéG.YWDí÷¯Ï@ýÓ9+ÍP°¸µu_ïŽWóF½V×R²¿è÷1ËŸáŸË­fjž²¾Ý$#ìÓè>SõáYÖÊol<®¿®¢tzÅž{V,o%°¼Šæ‡CœzŽâ§Ô´{Í)ñqÈNEåMP¯!Æt§®ê™ëv—QÞÚEsÊH»‡·µPñ*ïðÆ¦?éÙÿ\0•cx&ü²M`çîþò?§qü¿:éu>Ó¦]ÁŒùº~`Šû-u^Š©ý\\í„¹•Ïžh¢ŠÜ°¢Š(\0®³áÌÂ/Æ§þZÂéúgúW\'Zž¼\Zˆôû’p«2†>Šx?¡ {¢Š)ˆ(¢Š\0(¢Š\0(¢Š\0+À¼B1âMLÓÔŸú¯}¯ñ\'&Ôÿ\0ëæOýÐ]QHaEP¹ø4îðŽšé–?S[•Ïø!·x;OöVøñ®‚˜‚Š( Š( Š( eWR¬)êàÖ%÷†mn2öäÀþƒ•?‡jÜ¢®%x³:”¡QZJçy£^ÙdÉ	dÆœþµP¯M¬ûÍÆ÷%âçøãàÿ\0õë¶ž7¤ÑÁS/ëMœµ}á»«l¼¿Œz0ü+‚	`ŽÕÙ\n‘š¼YçÎœé»IX(¢Š²Š( 	 žKiÒh›k¡È5è‰gÂq¸r=q^w]….ÊÏ-«•ÆõúŽ¿çÚ¹1tù¡ÍÕ¸\Z®3ä{3«¢Š+Ë=¢Š(’ñgüAÿ\0\\ÿ\0­sõ¿âÏøÿ\0‡þ¹SXìáÿ\0„üiQ[á[~ÿ\0«×#üÅbV×…ÿ\0ä,ë“1YWþ°ßÅ©ÙÑEâŸ@QE\0QE\0QE\0CYµûnu2Å	_¨ä*¿ELà§ÔM]Xñê*Ö¥oöMNæ`$ŒÓ<~•V¾\ZQq“‹èp=Š(¤RÛÛËwp@…äs€¢˜ˆÒH¨ŠYØàÔšô_èi¤Ûoº|íýßöEv`°rÄÎÝì¸AÉÑ<;–‹,¡e»#—ì¾Ëþ4ý_ÄVšZ”È–ç´jz}OjÏñ/ˆ¾ÉºÊÍ¿~F$°÷þUŸ ø~ÞçÊ¸Ôd›-°\\zžø¯fUùÕ°‰]nú/ófîV÷ e^ê\Zž°%–Rí|² Â ÏùëY•ë-g³{U‰RR…T``Šâ5/ÞY¯™lßj¸UÃÃ¿á\\Ìº´m;¹w39-w9Ú³§Â—\Z´2}Ç•U¾„Ó`³žæím£¼Öm»HÆ>¾”—6òÙÝI£l‘¶+ÌŒ\\m6´¿ôŒ¼ÏBoé}—ýñôæ¹­gÂ“Ø«OhÆheûÊ?­giÚåî:ºÌòF>ôNÄ‚?¥zŸ¨Ûj¶¾t\r‘ÑõSèE{´ÖY_yÐ¹*+ZÌòÄvGŒU‡ ƒ‚+§Ò<_4aÔ–>‚Q÷‡××ù×;y[^ÏÜ¯äj\Zñ©W«‡àì`¤âô=\\MNÏƒöò¨5ÄkÞ\Z—MÝqm™-{ÿ\0y>¾ÞõŸ¥j÷:MÇ™	Ýûñ“Ãñ÷¯E±½·Õ,„ÑÑ¸Ã)ì{ƒ^ÜgG2‡,´šþ¾ãtãUYîyÞ‡wö-jÖ\\áwío¡ãú×¨Wø“D:UÈž\0~Ë!ùØ>Ÿá]åŒÿ\0i°·ŸþzF¬U•©Ò”èOu¨é]^,ð}jÐØkw¶¸ÀŽféž?J¡]§Ä­8Ûx/|—Q‚OûKÁý6×^¹¸QE\0QEïÕ¯áëK­Ù“fÉ=œpÇñ­zò‡:ð°ÔßLñÑù	<,Ÿý~Ÿ€¯X¦ ¢Š(\0¢Š(\0¢Š(\0¯ñ7(Ôÿ\0ëåÿ\0{Õx7‰ÿ\0äiÔÿ\0ëåÿ\0\0dÑE†QE\0{_€›wƒl}·ü|×I\\·ÃÆÏƒíÇ¤’üx×SLAEPEPEPEPEPYºž‹m¨©lçí\"Ž¿_ZÒ¢ª2qw‰3„f­$yÍÝœÖ7\rë†b=EA]Æ¿b·zk¾?{.§Û¸®½z}¬oÔðñ4=ŒíÐ(¢ŠØç\n½£JaÕí[=\\/çÇõª5bÇþBØÿ\0ž«üÅLÕâÑTÝ¦™è´QExGÒQ@‡Šÿ\0ä#ýrÌÖ\rnø¨ÿ\0ÄÎ1ÿ\0L‡ó5…^ÎøQ<Wñ¤QEl`³áƒÿ\0ûfßÒ±«cÃ\'þ\')îYWþ½\r°ÿ\0Å©ÚÑEâŸ@QE\0QE\0QE\0QE\0yÿ\0ŒmL\ZÏŸ–t>ãƒý+ž¯Añ}Ú´9F^Ý·ÿ\0ÀOúÂ¼ú¾K2£ìñ³×úùœuciSâ‰æ™\"A—v\n£Ü×WÑWƒt½îúŒ«Âü‘g×¹þŸlxZþÊ´ÄGÚe\'û#ûÕ¥io§Ç#…9cúšóMRùõFk–\'Ø@{/a_C^QÂªpøŸôÿ\0Èé“öp²Ü¬²ºÊdÎ\\ä’Ã=~µ©áé]¼GhÌÌÌX‚XçøMdV¿†Sˆm}‹ÉMx¸fÝh/5ù˜GâG¤ÑEö§qÝÄVV³]H>XÔ±ÇSí^qªê_Ûi/ÙR)OÊJ±;½3^‰¨ØG©Y=¬¬ê¯ŽTàñÍpú§†ît§¤ÊmÃ¨Y	ÁR}GµxÙ´kÉ.Uîu0¬¥Ób¦¡ ê\ZlbIâ2q½#5^)ït›·¼N§kñ\rz|¸´Ž;†Yd\n¶8cëYúÎ‰a¨§ŸrÆy•H{æ²«”¸®z2³óÿ\01:=byÝÕÌ·—/q;‘ÎXàþU\rZ¾²{)ÊÆ#Ìr :žA…U¯jJO›s{ê©¡ëi¡ùh‰SÔzqYtS§RTä§ªÚwG«][Á©éíá¢™2~„TZ$2ÛiQ[Íþ²È}ðNåŠÇðv¥çÙ½ŒóÃÊgºŸð?ÎºqÞ¾¿(WQ®·µŽÈµ/xæ|w¤WÃr´k™íOœ˜ê@ûÃòþUâõôy\0‚È5â0ÐŽ…®I\Z.-fÌØî¿‡øWQg?ERQE\0ªÅX2’‚;W±ø3Å‘ë–kkráu—ü´ø‡¿­xÝIòÛN“A#G*«©Á€>‹¢¼ëAø•EƒZŒ«Ž>Ñ\Zä÷—·áùWse«iúŠ³½‚`{#‚GÔuÄ\\¢Š	ÀÉ Š§u«éÖ@›«ëh±Ùå\0þUÌjŸ4›Ee²Y/%ì@ØŸ™çô ¶îîÞÆÖK›©V(cgcÀ¯Öo#Ô5«ËÈƒæ™CuÁ5g\\ñ&£¯Ì\Zò\\D§)\np‹øw>æ²)(¢Š\0(¢Š\0ö†Ï»Â€vwÈÿ\0ZëëŠø`û¼5:ÿ\0ví¿ô®Ö˜‚Š( Š£¬Ì`Ò.\\›Aúñýk’¶×u\\1‘GðÈ7~½kzXyT29«b£JJ2;º+š·ñjœ‹b?ÚŒçô5£ˆtÙå¹CèêE)aêGtTq4¥´J*º_ÙË÷.¡o£Š˜HÑÔý\rdÓ[›)\'³E&áê?:C\"/WQõ4‡qÔUy/ìâû÷P¯ÕÅP¸ñ&Ÿ;¦oD~f®4ç-‘œªÓŽìµ«N¶ú]Ã±ê…G¹<\nóú¿©êÓêr\røH—îÆ:¯©ªêa©:q×vxøºê¬ýÝQEÐr…\\Ò£ó5kUÿ\0¦ª#š§[ž·2êM1,HN}ÏãYÕ—,5¡j‘^gcEWˆ}QEÆø¤çV_h‡ó5‰[&9Öz\"Ö={T?‡çñÅ—¨QE©ˆV·‡5¨½Õ¿•dÖŸ‡Î5»øò5oáËÐÖ‡ñcêŽêŠ(¯ú¢Š(\0¢Š(\0¢Š(\0¢Š(²F²Äñ¸Ê8*G¨5å:…›Ø_Íjýcbõå^±\\4ÝÑÇ¨F¼¯É&=;éøŠò³l?´£Î·äcZ7W8ÊÞð•§Úuµ‘†V/øôÏ?…`×iàx±mw6>óªçè3ýkÄËéª˜˜§ë÷SW’/ø²ôÚhÍ\Z<íåþOø~5ç•ÕxÞb×¶°g„Œ¾>§Ò¹Z×4ªç‰k¶…UwWcà½4m“Qq’IŽ?oSý?:ã«Òü9‹Ãö€wRÇñ$Õe4”ñ}ÂŠ¼Z(¢¾¤ë\ndÐÇqE2+ÆÃ¬2\r>ŠM\'£\0\0\0\0è+”ñ.}4r\\Ãw$‘òÒBòaTvÀéÀ®¨ ’@©5æ\Z¦©s{;¼­å»` <m^fiVœ)(Í^ý´2ªÒVa}¬ÞjÑÛÎËåGª«ŽƒŸEó3œ¦ï\'vr¶ÞáETˆÒÐnÍ–µm&p¬Ûèxÿ\0ë×§§ë^>	pEzÕœßh³†oùèŠß˜½ü–¥ã*3¢ƒÝÖ/‰ôüA¤=±ÂÎŸ<.…½>‡¥mQ^éÐ|éqo-­Ä–ó¡ŽXØ«©ê¨ë×|má¬ÄoìPø×æQÿ\0-Tvúú~UäŽ²:•e8*F4†6Š( Š( ”AÁö¤¢€,.¡zƒw:A!Öš÷w2¬¸•¿Þrj\Z(\0¢Š(\0¢Š(\0¢Š(\0¢Š(Ôþ¾t{äô¸óQþÞWü*Üjqú4gôjôJb\n(¢€0üS.Í1cï$€~šã«¤ñl¹–ÚEf?Ò¹ºõ°‘µ$xxÙ^³ò\n(¢ºNP£$w¢Š\0]ÇÔþt”Q@Q@Q@Q@wZ°ÓÔ8Ä²|ïíè+#Ãú)w[Û•ÂcCüG×é]UyØºÉû‘=\\Ç÷’ùQ\\\'¢QE\0pþ#9ÖæGè+*´µã»[¹úú\nÍ¯n—ðãè|õwz²õaEV†AZ\ZÆµmþñ¡¬ú»¤6Ý^Ôÿ\0Ó@**|ÐºNÕ#ê@¢Š+Ã>Œ(¢Š\0(¢Š\0(¢Š\0(¢Š\0*+ˆ#º·’	W1È¥XT´Ri5f“êRi÷ÒÚËÕÔv5Úø1q¢¹þôÌAG‹4¶Ùý®Ìð@þ$ïùuüéž\n}ÚDËžVcü…xX\\7ÕñÜ½\Zv9áZ–0¼`ÛµæÝGõþµƒ]ŒãÙ­«vxTþ¤W=^^55ˆû™Tø˜WqàÝGÎ³{ož™=Ôÿ\0þuÃÕÍ.ù´ÝF¥ÎüÃÕ{Š0XaYO§_@„¹esÕ(¦E\"MKG”Žâ‰¦ŽÞ–g	\Z³‚¾Æê×èv¢¹É<i¦©`‘\\>: úÓ¬¼_gwu»C,M#mVlŸzåXì;|ªjä{H÷+øÕ\\ÙÀËpÑnÁ|ô8ïë\\EZÔžáõþÔÌÓ!·vçùUZùŒmmYÍ+³—4®QErQE\0ê\Z°¬·uò…y‚©f\nI8ëv°‹{H`#EOÈb½¬–/žrò7 µl–Š(¯¢:B¹?x&Û]\rulVÞÿ\0{,Ÿï{û×YE\0|÷¨é—šMÓ[^Û¼2^„zƒÜUJúÿ\0N³ÔíÌ¶ñÏìã§¸=«…Õ¾Få¤ÒnöÓ)ùƒJC<ÒŠÜ¾ð~½§“æéÒºâ„yƒô¬i\"’+$nŒ:†4\0Ê(¢€\n*H –vÛO#È¤šÙ²ðv½~G—§K\ZŸâ›÷cõ *žÒÎâúámíay¥nˆƒ&½Kø_‚¯ªÞçÖ+þ(ÿ\0…wZn‘a¤AåXÚÇ\n÷ |Íõ=M\0rø}“%æ®iÇ+\0åûúŸÓë\\ÏÄháQZÝHþ•ìUÅøËÁ×ž\"Ômî­&‚=‘yoæ’3É#ÔÓä”Wv¿u3÷¯íÓqþ•*ü+»þ-NôŒŸëHgŸÑ^Š¿\n¤þ-Y?û*•~\'ñjÍøAÿ\0ÙP…rbïRÖ4oÈŸñ¯M®gÃ>‹Ãws\\Gzó™cØU(ç=k¦¦ ¢Š(‰ñ$¾f°ëÚ5Uý3ýk\"»;ÿ\0Ay;Î³H’9ÉÎ¬™¼+xŸê¤ŠAõ ×«F½%ž5|5g7+naQZhš”]m\\ÿ\0»†þUUìîcûöò¯Õ®…8½™ÊéÍnˆh¥*Àà‚>¢’¨€¢Š(\0¢¤H&“îDíôRjÌzF¡/Ý´—þ6ÿ\0:—(­ÙJ–È¥EmÁá{é0ehâç\'ô­koÙÅƒ;¼ÇÓîÒ±–&”zÜÞ:ÒéoS“·¶šêO.šFôº/ÃiY¯1$ƒ‘û£ëë[Á¼a!cQÙF*Jã«‹”ôŽˆô(à¡\re«\n(¢¹Ð¢Š(\0¢Š(€Öv¯té¡FºëŸ¥ÅÌ³¦F-3øÔ_ðˆÇÿ\0?ÿ\0~ÿ\0úõêÃIE+ž,ð•œ›±ËQ]Oü\"1ÿ\0Ïãß¿þ½ðˆÇÿ\0?ÿ\0~ÿ\0úõ_Z¥ÜŸ©VíùµYÓÛn¥jÞ’¯óÐÂ#üþ7ýûÿ\0ëÓ¢ðªE*H.Ø•`ßsÓñ¥,U&­qÇY4ìtTQEy\'¶QE\0QE\0QE\0QE\0QE\0—§i£M¾»ò†-ç\"EÝ<ä*Ô ŒÔJœe%\'ºWÔã¼qnÑ.GOš3üÇõ®>½;\\°þÑÒg€Èøÿ\0Þçy|ÎmIÂ¿?Iµ•¥p¢Š+Ì2;_Jþ}“Ñ¢ïLÿ\0<Š¿ã¤“D„íŽPÎqÈþdWg{qap\'¶£Ž=ˆô5ÙYø«O¾²xu,Bì»\\m%XLW¹„ÅS©†xj’³¶›ÂiÇ•œ-*±G§§ û×maáM-ÂÝ}¥î`?2€@\\{ãŸå\\…ô±Í}4Æ±Ä[äUz\nóka\'B*S{íþfrƒŠ»òî[ë¹.g Èçœ˜¨(¢¹¥\'\'w¹ER\0¢Š(OÃÖ¿l×-Œª·˜ßAÍu~8ñIðw†eÖ˜»)\"\'”dÙÇÎòªž	²Â\\_0ûß»O§Sý+#ãwü“[¯úø‡ÿ\0B¯¨Ê©{<?3ÞZtch”Ÿâ¾·§ÚÅ¨k½µÓi7QÜ	«t8Ú~äW¤Øjºžý¤¢KiãFã¡R3\\‰\'¶ƒàÍÓ\\²m\"îîæ0}ÄW•]Ýjqü>ð„ÉrÖºŒÒ´ÐC\'–ó§š6 cÀÈlóÇ\"½3cè¤u‘w#_PsA’5\0—P	ÀÉï^Eà½3TÑ> ˜ì4[Í+C¸µ?h´¹»IvH!ÀO8ñ5ÎøÁÚOŠ|®]ê·W\r-¬òˆ\0œªÛü¡·íé’}{-\0}H$à\njH’ÆêãÕNkÂm5Û}[ákâ+½Zie¾kkx,Xy—HÂ±=Tn¯¥Màëit/Œ¶¶úLÚ%µÕƒ»Ø½ßŸ¸aˆbsÁÊôízÇ¸c.£\'ž¦°4/iž)¾Õm-af]6a*Œ;óœAŽµå_\r<¦ø©µ‹Ý]îe[MIÖ–R¨§«wÏÊ?\n“áŽ¤i×þ0Õf’ka¤Ï41Î’b‹	Ç9 2\r\0{iÚKÉ±¬ìšOî˜—?Êžºf›ùlmõâ%Ò¾n×¬m ð”~ Ñ4}^0.C&»}z²’Ç¤`óÈëÇJí¼A§¯ˆ~3h“L-ît€×…€	©#± gÚ‹…bF\"Ü†5ÕH¥r=kÂ</à½7Sñ§‹|=s%ÛhÚ{ï‚Ð\\8@íóÉ\0`f±áñ«ið%a‚êqæjÆÌÈ†X¶îÚ`Oó4\\,}\Z’$™ØêØààç4ˆ –u\0u$ô¯ÑtMOBñ¦…>…áíCI·så_¥ÍôrˆÎ}»¹#$ñíNðï…ì<YñÇ6Ú³\\IiÞV™‘K³8py © [×µÛ?èW:½ésmn¡›Ë˜ä€\0R*]#RXÑ¬µ(Ð¢]@“c’¡€8?x­°Ô~ëbòIf:N¥þˆYÏÉÌk¦¸÷­Mjì†~Ò´Ë‰¬­µéâ’þq!ÈÜ‰¸dô®?ÙúÐ=Ù$I3±Õ±ÁÚsŠux¯ˆ´O†Þ*ðµÏ†f¸‰ï®…µÍ³L\\N™PIýïÏÅz§Š/gÓ|)«_Zÿ\0ÇÅ½¤²Fqœ0RA¦!¾&×WÃÞÔ5E‰nÎ/0Ã¿in}pqùTžÖ»á»\r]¡âê”Ç¿pLöÎkÃâð–—?Á[ŸIurÚÌÈòKrnç>fÓÁzóš5kË»­áï‡ü‹›>æÍešÖÞQ\\‘Ñ7ý}qHv>ƒVWPÊÁ”ô æ±|YâkOø~}^ñDŒ…HÓ«¹è§Ö¸/‡ºv«£xæþÚßIºÓt	í÷}Žâé%0Ê1‚\0bFF?a]OÄ“á×ð”–Þ%¸–ÞÊâEDš(Ù™$ä©^)ˆç&ø©®ik{â/Ïa¤Ü¸U¹[€ì™äeqéØâ»KÝrþév6zCÝé÷ˆ^[õ“\\dcœñÜu¯,Öl¼gðçEMVßÄ¶úÎ‡ ÷‹¸•$À9ãŸájÕÖïÿ\0´¾)ü>½Eh’êÐÌ#\'î†RqúÒë-,hÁZEV=8&±<[âËé)|’È$”CqŽYÈ$}šñmC¾¶ÖõëÝo@ŸÄ²Îìš•é2Z§P6Œ…ÀÇ8Ç¥Oñt}gá—†5‹¯gT¹i%ä™&r¶8$ú\nÇ¿P»‹\0£¹<R†V]ÁSÜ+Ãüod-<[á¿ÚÙ^Ýè‘[´âÂpÅœà³q^™ÅM¡Yjú=¿Œì×Nº°ÐŸL–Hmn.’V·—gA†$dL,{Axò¡™2Ý#šnØÊmŒ¸äŒ×Î3øvÖ?‚V~)ó®Ž­àE7žßºO4¨UÀýs[ú¾‰†<Gðÿ\0U±¸º:†¥p‚úy&fiË÷g\'¾ö¢â²=¹ÖÖ,oXS=7\03O	\ZŒ…P=q^1âk-Ä¾3ÖÒÛJÕ¼C{l‚9CÝ¬ÖD÷O±ãžAëYzT\Zßˆ~[ÛYß,Z‹)Šk/ÏˆË ÄŽì8Ïj.Ã•ø’G Ìn¬÷NiÕáþŸLÑ¼}ekwáý[ÃzÌf$€\\¶¸8<°aŸ¦	½/â¥w¤øX½±vK˜àÂ:õL¥‡¸š\0—Æ>\'_\nxbóXKu»kb€ÃælÎæ×}+SM¿[ý\ZÏPuˆb¥²rƒŒþ5àºçƒ´‹‚ÖÞ!‚âãûJé!’yLìDåØe\nçŸ\\­[ñÅÎ«âøzk+½CM]ƒao0ˆÜ?–y$8Ú?#Ž´‡cÞƒ\0©„W+ãßiV—¢Ä^}¢åmövmÈ\'9Áô®ká–¯¥x‡Z±{›-\r€’ÚÚâå%hŒ¯HÎIüGñßþEm\'þÂIÿ\0 =\0zp@É\0ã8Í5§ŒBÓoS\Z‚K‘Åyˆ4˜µßŽ¶šeÔ³­œºX3G…<ÅŽÒG8$ý*·†48üWã¯fc¢¬)\"Aæ·ÊA0sžø÷À¦;?xëSñÔÓÇ ­¶Œ¬è—mtË.8)ŒóŸ ®ÜH…ÊRÃªƒÈ¯ü-ðÿ\0ÁgÅ\Zh–=ZG6fusòF]@è=kC]ð†›á¯†º‹ô½Bê-mV	þ×ö‚|æ|n\\tî.sÍ =ä²¯VŒòi¡\0†RÈÁí^!¯Y·‹¾)x^Òýæ‚+ý$ºH\\¡#k¹_¡#J“Yð­„|5áˆ^â-0iER¬èÌT°ç’9 ,{W›—æy‰³ûÛ†?:p Œ‚=ëÂ¼1àÍ3QñÏŠü;p÷gE°mðÙ‹‡¸yäœf™á½ZÒ?‚°ëz–¥°Ô\ZÖ/±°30Â°ŒgŒsÓŒÑp±îÉ,rgdŠØë´ç¯\"Gî«žN3^§X¿‡þ\'xWì:Þƒ\rÙdhæ¼ó^áq‚]Aùzôÿ\0\nÕÐt/ˆž,ñ|þ$–yÆäÛÛD&(-Ó.\0º=ºúÐ=oZ¿ºÓt¹.l´÷Ô.AUKtp›‰ d±àœ“è+?@×õ=^òhnô	´è¡Œ–K„4™û«·9ç<}+×¿á³ø}¥hÓøTÖ ’ìEn4ùÉrF?tÇŸ”dqœò=«\'Â6óh`²¶Ò&Ñmît÷‘¬ïÏÞ\0bx9^¿\Z\0÷&‘‚³ª–è	ÆiÕá~\rðÅ‡Ä]#[ñ‰/.dÔMÌ‘£	Ê‹Píž‡Œ\ní>k7úÏõ	ži-®^Þ9\\å\0R	=ñ¸Â˜EP ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(ÏÖ¼çÄÚ[iú“H«û‰Éuö=Åz=TÔtèu;7·œpyVTúŠâÇa~±K•n¶\"¤9‘å4UýSI¹Òn<¹×(~äƒ£óÚ¨WÉN„œd¬ÑÆÕ´aETˆ³i¨^X’mn,õ\nx?…u:ˆÓQÓ\'³¾xÖé‘•ðªùg°5ÆÑ]41u(èžº¸šÑøoS‘™Lû»Ü\rýð¾µ¿càÈ¨7²9‡D<\'øÖ/†mî®µˆ&>]¹ÜÄž\0ôükÑkÖË°t*ÅÔ”_ÏúFÔ¡¯cþM#ÍövÀþ0àÓu\nØ^ªy*-]xÌkÁãúÖíê<œy¾FÜ‘ìqú‡ƒb†ÅÞÒIå¸Ú‡nyª6þ\rÔd9™¢…{å·ÈwÔu>Â¹§•á¥.k[È‡J-•ì,ÒÂÆXùX×õ=ÏçT<Oá«h¯¥j\r2Û»«“l©Èäƒ[W£¨¥²5ZuÁ_\nÇ4oq.§yd\rÅÖS`ýk§ñƒôi0é×°2EnA·xÇ„´öã·JÞ¢˜§‡|¥øsQŸS[‹ÛýJXü³u}7˜ê¾ƒŽ‚¼ïÀÓVðõéÖ“WÒ®^ñÑÒ7h|øp¤V#;°që^ßE\0rZ§ÃŸê~°Ñ„SZÃ§¶ûYmäÛ$mÜäç$žN{Ó4¿‡\ZF•â]v;ÍJ}Jei®.<Ã6A>G¡ÀÆ:WaE\0axcÂz„à¼‡OyÙnî\rÄžs†!ˆÇŽ+&ßáž‡m¯j\Z¢M{³P}¦ÌÍû‡ó\r‘Œÿ\0Ç<f»:(Îÿ\0áMx}´æÓæ¿Ö&³t½ßÉÎIEÆ2yƒÔ×D¾ÓWÄÚ~¾eºkÛQiçY0Ã,1Éù¥tTP—á-;I×µmfÝî\rÎ¨Aœ;‚£û£uõ5BËáÇ‡ìü)sá³÷\Z}Ä¦fóœW8åHÀ®¶Š\0âô?†Z6‹«Ûêow¨ê76«²ÔßOæû#µôo	éú³«ê–;\\j²	.Ž\n‚”\01÷­nÑ@—Ã½ÇÃ\Z—‡ÔÝIe¨Êe›Ìq÷H*\rEmðÓC‹Â’xrêKËë\'—ÍV¹—/\0l \r ÓÜú×cE\0qZÃ\rCÕ¢Õ\Z{ýBî¶Ý¯§ó#ý‘ÿ\0Ö®ÎHÒhž9:8*ÊÃ ƒÔ\ZuçŸð¦¼4Ì\"}LYLK-˜ºýÔlF7*ã¨íœÖ¶¡ðëCÔ¼=¦èó}¥WLP-.c“lÑc¸`1Øvì+­¢€9øKðÅåÍô2ÝÞj#l·—’ù’ôÎÈV¾µ¢Øx‡J›MÔàZÌ>e\'ÐƒØŠÐ¢€<Þßà¯†ãš#qwª]ÛBÛ£µžàÇ¶\0Õ_xCMÔ<G¥ë’’çLB–ézŒ{ö\"·¨ ÷áV‹q}yqiªé±Þ±k›{+‘JO\\®\\Ÿnjþ¥ðóAÔ¼#oá£¶öÌ$„ÂøuqŸ›\'9\'qÎ}k«¢€8Ûß†º>¡£éÖ7Zƒ\\iå¾ \'ÅÂ’ÛŽ[óíÆ*máæ£Øjp$—wêq´WW—ï™Ô‚1œ`uôúæºÊ(““áî/‚#ð“Iwýœ¸0‘|Ìï/×n:ŸJµªx/LÕåÐä¹’äÕí¶8#n7qÏÜ1Þº*(Š½øc¢Þk×zªÝjV¦ôæòÞÚäÇÇ®àp{óKÂï\'…äðû-Ô–fàÜÆÏ ó!ŒeŽó]¥Çèßt½\'Y‡VžûSÔïmÔ­¼š…Ç™äƒÇÊ0+ª»´‚úÎkK¨–[yÇ$mÑ”ŒSQ@t>ølÚËh÷Z«Ú±Ì05ÖRNIAŒg¶Nx\'ë[Z×Ãí[³Ób‘îíî4ØÖ+[ËivLŠ\0Î0zz}1]]Îø_Áz_„ÅÌ–mq=ÝÓn¸ºº“|²}MIâ¯	iÞ0±·³Ôžác‚q:)Üä9­ê(	¼\'§7Œbñ9{·Çoöu]ãËÛÏlg<úÓl¼!§Xø‹U×\"{ƒu© ŽpÎ\n\0\0(Ç=MoÑ@æ‹àCðÌþ‰%¹Óçg2%Ë-»\0zV\r¯ÁÏ\rÛÝBòO©]Z@þdV7; Cþî?¯×5è4PÇ„´ëŸÙø™Úq}i‚5V=§wQŒçæ=è¹ðžŸuã?Hó‹ûH¨aå•;ºŒg?9ïé[´P™á-;Jñ«­[½ÁºÔñç‡pTcû£~f²áw‡—Â“øu¾ÖörÜ ï ó#“\0eHè;ƒÔ×kE\0q¿´{}OOÔäÔ5kBÆ@ñÜ\\]obD9Ú9àc©æ¹_‰¾‚]RKí=V-Zé3<VVÒ´w`œmg_•9ö8¯a¢€8©þ\Zè:‡…4Í!­¦±dMÛËûØ¤<±Ýƒ“žþÃ©t¿‡\ZF•âmv;ÍJ}Jei®.<Ã6A>G¡ÀÆ:\nì( TøIáýGQ¹¼Š}FÀ]œÜÁgq²9½r¸>þÕØi\ZEŽ…¥Á¦éÐ,°.?ROr}jí\0QE\0QE\0QE\0QE\0QE\0QE\0QE\rÕ¬4¬‘·Pk†Ö|)qbZkMÓÛõÀûëõõ®þŠäÅ`éb½¿r\'-Ï¢½#TðÕŽ¥™6ù3Ÿùhƒ¯Ôw®Fÿ\0Âú•‰,±ý¢!üQrÖ¾w–×£­®»£šT¥ŠR¥X«ê\r%pO‚ïã†æk9S6	îGjíëÈc‘¢‘dF*êC)ˆ®ºÃÆSË<pÏf®]‚æ\"AçØ×»–æ…?eSKltR¨’³;\n(£­{ç@u¥¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0­s§ÙÞô‹h¤÷eüë9¼)£±ÏÙŠý$oñ¢ŠÊt)MÞQOä\'÷D‘økH‘f¤ÿ\0´Äÿ\03Wà³¶µ‚ãì ÊŠ)Â8|1Kä\n)lOŠ(¢´QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEÿÙ');
/*!40000 ALTER TABLE `tb_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_consulta_variavel_queixa`
--

DROP TABLE IF EXISTS `tb_consulta_variavel_queixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_consulta_variavel_queixa` (
  `IdConsultaVariavel` bigint(20) NOT NULL,
  `IdQueixa` int(11) NOT NULL,
  `IdAcaoQueixa` int(11) NOT NULL,
  `Motivo` char(1) NOT NULL,
  `Desde` varchar(40) DEFAULT NULL,
  `Prioridade` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdConsultaVariavel`,`IdQueixa`),
  KEY `fk_tb_consulta_variavel_has_tb_queixa_tb_consulta_variavel1` (`IdConsultaVariavel`),
  KEY `fk_tb_consulta_variavel_queixa_tb_queixa1` (`IdQueixa`),
  KEY `fk_tb_consulta_variavel_queixa_tb_acao_queixa1` (`IdAcaoQueixa`),
  CONSTRAINT `fk_tb_consulta_variavel_queixa_tb_queixa1` FOREIGN KEY (`IdQueixa`) REFERENCES `tb_queixa` (`IdQueixa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_consulta_variavel_has_tb_queixa_tb_consulta_variavel1` FOREIGN KEY (`IdConsultaVariavel`) REFERENCES `tb_consulta_variavel` (`IdConsultaVariavel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_consulta_variavel_queixa_tb_acao_queixa1` FOREIGN KEY (`IdAcaoQueixa`) REFERENCES `tb_acao_queixa` (`IdAcaoQueixa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_consulta_variavel_queixa`
--

LOCK TABLES `tb_consulta_variavel_queixa` WRITE;
/*!40000 ALTER TABLE `tb_consulta_variavel_queixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_consulta_variavel_queixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_instituicao`
--

DROP TABLE IF EXISTS `tb_instituicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_instituicao` (
  `IdInstituicao` int(11) NOT NULL AUTO_INCREMENT,
  `NomeInstituicao` varchar(45) NOT NULL,
  `Sigla` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`IdInstituicao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_instituicao`
--

LOCK TABLES `tb_instituicao` WRITE;
/*!40000 ALTER TABLE `tb_instituicao` DISABLE KEYS */;
INSERT INTO `tb_instituicao` VALUES (1,'Universidade Federa de Sergipe','UFS'),(3,'Universidade Tiradentes','UNIT');
/*!40000 ALTER TABLE `tb_instituicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_disciplina`
--

DROP TABLE IF EXISTS `tb_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_disciplina` (
  `IdDisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `NomeDisciplina` varchar(45) NOT NULL,
  PRIMARY KEY (`IdDisciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_disciplina`
--

LOCK TABLES `tb_disciplina` WRITE;
/*!40000 ALTER TABLE `tb_disciplina` DISABLE KEYS */;
INSERT INTO `tb_disciplina` VALUES (1,'EstÃ¡gio Supervisionado'),(2,'teste');
/*!40000 ALTER TABLE `tb_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respostasegunda`
--

DROP TABLE IF EXISTS `respostasegunda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respostasegunda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataRealizacao` date NOT NULL DEFAULT '2013-01-01',
  `fkConsulta` int(11) NOT NULL,
  `numeroTentativa` int(11) NOT NULL DEFAULT '0',
  `flCorreto` varchar(1) DEFAULT NULL,
  `comentario` text,
  `comentarioAluno` text,
  `nota` float DEFAULT NULL,
  `carta` tinytext,
  PRIMARY KEY (`id`),
  KEY `FKEFEE246A5097F805` (`fkConsulta`),
  CONSTRAINT `FKEFEE246A5097F805` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`),
  CONSTRAINT `FK_respostasegunda_1` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respostasegunda`
--

LOCK TABLES `respostasegunda` WRITE;
/*!40000 ALTER TABLE `respostasegunda` DISABLE KEYS */;
/*!40000 ALTER TABLE `respostasegunda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentoprescrito`
--

DROP TABLE IF EXISTS `medicamentoprescrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamentoprescrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `dosagem` varchar(255) DEFAULT NULL,
  `especialidadeMedico` varchar(255) DEFAULT NULL,
  `nmMedico` varchar(255) DEFAULT NULL,
  `posologia` varchar(255) DEFAULT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  `flItalico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAA358BEF8A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FKAA358BEF8A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentoprescrito`
--

LOCK TABLES `medicamentoprescrito` WRITE;
/*!40000 ALTER TABLE `medicamentoprescrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentoprescrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_turma_pessoa`
--

DROP TABLE IF EXISTS `tb_turma_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_turma_pessoa` (
  `IdTurma` int(11) NOT NULL,
  `IdPessoa` int(11) NOT NULL,
  `IdRole` int(11) NOT NULL,
  `Ativa` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdTurma`,`IdPessoa`),
  KEY `fk_tb_turma_has_tb_pessoa_tb_pessoa1` (`IdPessoa`),
  KEY `fk_tb_turma_has_tb_pessoa_tb_turma1` (`IdTurma`),
  KEY `fk_tb_turma_pessoa_my_aspnet_roles1` (`IdRole`),
  CONSTRAINT `fk_tb_turma_has_tb_pessoa_tb_turma1` FOREIGN KEY (`IdTurma`) REFERENCES `tb_turma` (`IdTurma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_turma_pessoa_my_aspnet_roles1` FOREIGN KEY (`IdRole`) REFERENCES `my_aspnet_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_turma_has_tb_pessoa_tb_pessoa1` FOREIGN KEY (`IdPessoa`) REFERENCES `tb_pessoa` (`IdPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_turma_pessoa`
--

LOCK TABLES `tb_turma_pessoa` WRITE;
/*!40000 ALTER TABLE `tb_turma_pessoa` DISABLE KEYS */;
INSERT INTO `tb_turma_pessoa` VALUES (1,1,0,0);
/*!40000 ALTER TABLE `tb_turma_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medicamentos`
--

DROP TABLE IF EXISTS `tb_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_medicamentos` (
  `IdMedicamento` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  PRIMARY KEY (`IdMedicamento`),
  UNIQUE KEY `Nome_UNIQUE` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medicamentos`
--

LOCK TABLES `tb_medicamentos` WRITE;
/*!40000 ALTER TABLE `tb_medicamentos` DISABLE KEYS */;
INSERT INTO `tb_medicamentos` VALUES (1,'dipirona');
/*!40000 ALTER TABLE `tb_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_curso`
--

DROP TABLE IF EXISTS `tb_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_curso` (
  `IdCurso` int(11) NOT NULL AUTO_INCREMENT,
  `NomeCurso` varchar(45) NOT NULL,
  PRIMARY KEY (`IdCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_curso`
--

LOCK TABLES `tb_curso` WRITE;
/*!40000 ALTER TABLE `tb_curso` DISABLE KEYS */;
INSERT INTO `tb_curso` VALUES (1,'Enfermagem'),(2,'Medicina'),(3,'Enfermagem');
/*!40000 ALTER TABLE `tb_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_plano_saude`
--

DROP TABLE IF EXISTS `tb_plano_saude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_plano_saude` (
  `IdPlanoSaude` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  PRIMARY KEY (`IdPlanoSaude`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_plano_saude`
--

LOCK TABLES `tb_plano_saude` WRITE;
/*!40000 ALTER TABLE `tb_plano_saude` DISABLE KEYS */;
INSERT INTO `tb_plano_saude` VALUES (1,'nao definido'),(2,'Unimed'),(3,'Plamed');
/*!40000 ALTER TABLE `tb_plano_saude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intervencao`
--

DROP TABLE IF EXISTS `intervencao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intervencao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `numeroEtapa` int(11) NOT NULL,
  `numeroIntervencao` int(11) NOT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK91D9EFAE8A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FK91D9EFAE8A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intervencao`
--

LOCK TABLES `intervencao` WRITE;
/*!40000 ALTER TABLE `intervencao` DISABLE KEYS */;
/*!40000 ALTER TABLE `intervencao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_queixa_medicamentos`
--

DROP TABLE IF EXISTS `tb_queixa_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_queixa_medicamentos` (
  `IdConsultaVariavel` bigint(20) NOT NULL,
  `IdQueixa` int(11) NOT NULL,
  `IdMedicamento` int(11) NOT NULL,
  `SuspeitaIdAcaoQueixa` int(11) NOT NULL,
  `Dose` varchar(20) DEFAULT NULL,
  `Desde` varchar(40) DEFAULT NULL,
  `Necessario` tinyint(1) NOT NULL,
  `Efetivo` tinyint(1) NOT NULL,
  `Seguro` tinyint(1) NOT NULL,
  `Cumprimento` tinyint(1) NOT NULL,
  `IdAcaoAlternativa1` int(11) NOT NULL,
  `IdAcaoAlternativa2` int(11) NOT NULL,
  PRIMARY KEY (`IdConsultaVariavel`,`IdQueixa`,`IdMedicamento`),
  KEY `fk_tb_consulta_variavel_queixa_has_tb_medicamentos_tb_medicam1` (`IdMedicamento`),
  KEY `fk_tb_consulta_variavel_queixa_has_tb_medicamentos_tb_consult1` (`IdConsultaVariavel`,`IdQueixa`),
  KEY `fk_tb_queixa_medicamentos_tb_acao_queixa1` (`SuspeitaIdAcaoQueixa`),
  KEY `fk_tb_queixa_medicamentos_tb_acao_alternativa1` (`IdAcaoAlternativa1`),
  KEY `fk_tb_queixa_medicamentos_tb_acao_alternativa2` (`IdAcaoAlternativa2`),
  CONSTRAINT `fk_tb_queixa_medicamentos_tb_acao_queixa1` FOREIGN KEY (`SuspeitaIdAcaoQueixa`) REFERENCES `tb_acao_queixa` (`IdAcaoQueixa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_consulta_variavel_queixa_has_tb_medicamentos_tb_consult1` FOREIGN KEY (`IdConsultaVariavel`) REFERENCES `tb_consulta_variavel_queixa` (`IdConsultaVariavel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_consulta_variavel_queixa_has_tb_medicamentos_tb_medicam1` FOREIGN KEY (`IdMedicamento`) REFERENCES `tb_medicamentos` (`IdMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_queixa_medicamentos_tb_acao_alternativa1` FOREIGN KEY (`IdAcaoAlternativa1`) REFERENCES `tb_acao_alternativa` (`IdAcaoAlternativa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_queixa_medicamentos_tb_acao_alternativa2` FOREIGN KEY (`IdAcaoAlternativa2`) REFERENCES `tb_acao_alternativa` (`IdAcaoAlternativa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_queixa_medicamentos`
--

LOCK TABLES `tb_queixa_medicamentos` WRITE;
/*!40000 ALTER TABLE `tb_queixa_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_queixa_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_schemaversion`
--

DROP TABLE IF EXISTS `my_aspnet_schemaversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_schemaversion` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_schemaversion`
--

LOCK TABLES `my_aspnet_schemaversion` WRITE;
/*!40000 ALTER TABLE `my_aspnet_schemaversion` DISABLE KEYS */;
INSERT INTO `my_aspnet_schemaversion` VALUES (8);
/*!40000 ALTER TABLE `my_aspnet_schemaversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_sessioncleanup`
--

DROP TABLE IF EXISTS `my_aspnet_sessioncleanup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_sessioncleanup` (
  `LastRun` datetime NOT NULL,
  `IntervalMinutes` int(11) NOT NULL,
  `ApplicationId` int(11) NOT NULL,
  PRIMARY KEY (`ApplicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_sessioncleanup`
--

LOCK TABLES `my_aspnet_sessioncleanup` WRITE;
/*!40000 ALTER TABLE `my_aspnet_sessioncleanup` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_sessioncleanup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_relato_clinico`
--

DROP TABLE IF EXISTS `tb_relato_clinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_relato_clinico` (
  `IdRelato` int(11) NOT NULL AUTO_INCREMENT,
  `IdPaciente` int(11) NOT NULL,
  `OrdemCronologia` int(11) NOT NULL DEFAULT '1',
  `RelatoTextual` text NOT NULL,
  `RelatoVideo` varchar(200) DEFAULT NULL,
  `NivelDificuldade` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdRelato`),
  KEY `fk_tb_relato_clinico_tb_paciente1` (`IdPaciente`),
  CONSTRAINT `fk_tb_relato_clinico_tb_paciente1` FOREIGN KEY (`IdPaciente`) REFERENCES `tb_paciente` (`IdPaciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_relato_clinico`
--

LOCK TABLES `tb_relato_clinico` WRITE;
/*!40000 ALTER TABLE `tb_relato_clinico` DISABLE KEYS */;
INSERT INTO `tb_relato_clinico` VALUES (1,1,1,'digo qual Ã© o relato',NULL,1),(2,1,2,'evolucao 1',NULL,1),(3,1,3,'evolucao 3',NULL,3),(4,1,3,'relato clinico',NULL,1);
/*!40000 ALTER TABLE `tb_relato_clinico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intervencaorespostasegunda`
--

DROP TABLE IF EXISTS `intervencaorespostasegunda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intervencaorespostasegunda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `justificativa` longtext,
  `numeroIntervencao` int(11) DEFAULT '0',
  `fkResposta2` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD03D22FCA4FE1140` (`fkResposta2`),
  CONSTRAINT `FKD03D22FCA4FE1140` FOREIGN KEY (`fkResposta2`) REFERENCES `respostasegunda` (`id`),
  CONSTRAINT `FK_intervencaorespostasegunda_1` FOREIGN KEY (`fkResposta2`) REFERENCES `respostasegunda` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intervencaorespostasegunda`
--

LOCK TABLES `intervencaorespostasegunda` WRITE;
/*!40000 ALTER TABLE `intervencaorespostasegunda` DISABLE KEYS */;
/*!40000 ALTER TABLE `intervencaorespostasegunda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametroclinico`
--

DROP TABLE IF EXISTS `parametroclinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametroclinico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `unidade` varchar(255) DEFAULT NULL,
  `valor` float NOT NULL,
  `valorDeReferencia` varchar(255) DEFAULT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAAEE312E8A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FKAAEE312E8A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametroclinico`
--

LOCK TABLES `parametroclinico` WRITE;
/*!40000 ALTER TABLE `parametroclinico` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametroclinico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ocupacao`
--

DROP TABLE IF EXISTS `tb_ocupacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ocupacao` (
  `IdOcupacao` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`IdOcupacao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ocupacao`
--

LOCK TABLES `tb_ocupacao` WRITE;
/*!40000 ALTER TABLE `tb_ocupacao` DISABLE KEYS */;
INSERT INTO `tb_ocupacao` VALUES (1,'autonomo'),(2,'Pedreiro'),(3,'Professor'),(4,'Estudante');
/*!40000 ALTER TABLE `tb_ocupacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respostaquarta`
--

DROP TABLE IF EXISTS `respostaquarta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respostaquarta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataRealizacao` date NOT NULL DEFAULT '2013-01-01',
  `fkConsulta` int(11) NOT NULL,
  `numeroTentativa` int(11) NOT NULL DEFAULT '0',
  `flCorreto` varchar(1) DEFAULT NULL,
  `comentario` text,
  `comentarioAluno` text,
  `nota` float DEFAULT NULL,
  `carta` tinytext,
  PRIMARY KEY (`id`),
  KEY `FKB29DB8E35097F805` (`fkConsulta`),
  CONSTRAINT `FKB29DB8E35097F805` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`),
  CONSTRAINT `FK_respostaquarta_1` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respostaquarta`
--

LOCK TABLES `respostaquarta` WRITE;
/*!40000 ALTER TABLE `respostaquarta` DISABLE KEYS */;
/*!40000 ALTER TABLE `respostaquarta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_demograficos_antropometricos`
--

DROP TABLE IF EXISTS `tb_demograficos_antropometricos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_demograficos_antropometricos` (
  `IdConsultaFixo` bigint(20) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Genero` char(1) NOT NULL,
  `DataNascimento` datetime DEFAULT NULL,
  `MedicosAtendem` varchar(255) DEFAULT NULL,
  `MoradiaFamilia` varchar(100) DEFAULT NULL,
  `OndeAdquireMedicamentos` varchar(100) DEFAULT NULL,
  `IdEscolaridade` int(11) NOT NULL,
  `IdOcupacao` int(11) NOT NULL,
  `IdPlanoSaude` int(11) NOT NULL,
  PRIMARY KEY (`IdConsultaFixo`),
  KEY `fk_tb_demograficos_antropometricos_tb_escolaridade1` (`IdEscolaridade`),
  KEY `fk_tb_demograficos_antropometricos_tb_ocupacao1` (`IdOcupacao`),
  KEY `fk_tb_demograficos_antropometricos_tb_plano_saude1` (`IdPlanoSaude`),
  CONSTRAINT `fk_tb_demograficos_antropometricos_tb_consulta_fixo1` FOREIGN KEY (`IdConsultaFixo`) REFERENCES `tb_consulta_fixo` (`IdConsultaFixo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_demograficos_antropometricos_tb_escolaridade1` FOREIGN KEY (`IdEscolaridade`) REFERENCES `tb_escolaridade` (`IdEscolaridade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_demograficos_antropometricos_tb_ocupacao1` FOREIGN KEY (`IdOcupacao`) REFERENCES `tb_ocupacao` (`IdOcupacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_demograficos_antropometricos_tb_plano_saude1` FOREIGN KEY (`IdPlanoSaude`) REFERENCES `tb_plano_saude` (`IdPlanoSaude`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_demograficos_antropometricos`
--

LOCK TABLES `tb_demograficos_antropometricos` WRITE;
/*!40000 ALTER TABLE `tb_demograficos_antropometricos` DISABLE KEYS */;
INSERT INTO `tb_demograficos_antropometricos` VALUES (6,'MARCOS BARBOSA DOSEA','M','0001-01-01 00:00:00','ddd','teste','teste',2,2,2),(7,'','M','0001-01-01 00:00:00',NULL,NULL,NULL,1,1,1);
/*!40000 ALTER TABLE `tb_demograficos_antropometricos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_historia`
--

DROP TABLE IF EXISTS `tb_historia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_historia` (
  `IdConsultaFixo` bigint(20) NOT NULL,
  `HistoriaMedicaPregressa` varchar(255) NOT NULL,
  `HistoriaFamiliar` varchar(255) NOT NULL,
  PRIMARY KEY (`IdConsultaFixo`),
  CONSTRAINT `fk_tb_historia_tb_consulta_fixo1` FOREIGN KEY (`IdConsultaFixo`) REFERENCES `tb_consulta_fixo` (`IdConsultaFixo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_historia`
--

LOCK TABLES `tb_historia` WRITE;
/*!40000 ALTER TABLE `tb_historia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_historia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respostaprimeira`
--

DROP TABLE IF EXISTS `respostaprimeira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respostaprimeira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alergias` varchar(255) DEFAULT NULL,
  `altura` float NOT NULL,
  `dataDeRealizacao` date DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `escolaridade` varchar(255) DEFAULT NULL,
  `flAlturaCerta` varchar(255) DEFAULT NULL,
  `flBebeAlcool` varchar(255) DEFAULT NULL,
  `flBebeAlcoolCerto` varchar(255) DEFAULT NULL,
  `flBebeCafe` varchar(255) DEFAULT NULL,
  `flBebeCafeCerto` varchar(255) DEFAULT NULL,
  `flDataNascimentoCerta` varchar(255) DEFAULT NULL,
  `flEscolaridadeCerta` varchar(255) DEFAULT NULL,
  `flFuma` varchar(255) DEFAULT NULL,
  `flFumaCerto` varchar(255) DEFAULT NULL,
  `flGeneroCerto` varchar(255) DEFAULT NULL,
  `flIMCCerto` varchar(255) DEFAULT NULL,
  `flNomeCerto` varchar(255) DEFAULT NULL,
  `flOcupacaoCerta` varchar(255) DEFAULT NULL,
  `flPesoCerto` varchar(255) DEFAULT NULL,
  `flPressaoDiastolicaCerta` varchar(255) DEFAULT NULL,
  `flPressaoSistolicaCerta` varchar(255) DEFAULT NULL,
  `flTemperaturaCerta` varchar(255) DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `IMC` float DEFAULT NULL,
  `medicosQueAtendem` varchar(255) DEFAULT NULL,
  `moradiaFamilia` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `ocupacao` varchar(255) DEFAULT NULL,
  `peso` float NOT NULL,
  `pressaoDiastolica` int(11) NOT NULL,
  `pressaoSistolica` int(11) NOT NULL,
  `temperatura` float NOT NULL,
  `planoDeSaude` varchar(255) DEFAULT NULL,
  `numeroTentativa` int(10) unsigned NOT NULL DEFAULT '0',
  `fkConsulta` int(11) NOT NULL,
  `flCorreto` varchar(1) DEFAULT NULL,
  `comentario` text,
  `comentarioAluno` text,
  `nota` float NOT NULL,
  `historiaAlcoolAnterior` varchar(255) DEFAULT NULL,
  `historiaAlcoolAtual` varchar(255) DEFAULT NULL,
  `historiaCafeAnterior` varchar(255) DEFAULT NULL,
  `historiaCafeAtual` varchar(255) DEFAULT NULL,
  `historiaTabacoAnterior` varchar(255) DEFAULT NULL,
  `historiaTabacoAtual` varchar(255) DEFAULT NULL,
  `tipoBebidaAlcoolica` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK88D8D79A5097F805` (`fkConsulta`),
  KEY `FK_respostaprimeira_1` (`fkConsulta`),
  CONSTRAINT `FK88D8D79A5097F805` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`),
  CONSTRAINT `FK_respostaprimeira_1` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respostaprimeira`
--

LOCK TABLES `respostaprimeira` WRITE;
/*!40000 ALTER TABLE `respostaprimeira` DISABLE KEYS */;
/*!40000 ALTER TABLE `respostaprimeira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queixarespostaterceira`
--

DROP TABLE IF EXISTS `queixarespostaterceira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queixarespostaterceira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(80) NOT NULL DEFAULT '',
  `fkResposta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1CE59807871504B2` (`fkResposta`),
  CONSTRAINT `FK1CE59807871504B2` FOREIGN KEY (`fkResposta`) REFERENCES `respostaterceira` (`id`),
  CONSTRAINT `FK_queixarespostaterceira_1` FOREIGN KEY (`fkResposta`) REFERENCES `respostaterceira` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queixarespostaterceira`
--

LOCK TABLES `queixarespostaterceira` WRITE;
/*!40000 ALTER TABLE `queixarespostaterceira` DISABLE KEYS */;
/*!40000 ALTER TABLE `queixarespostaterceira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medicamentos_anteriores`
--

DROP TABLE IF EXISTS `tb_medicamentos_anteriores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_medicamentos_anteriores` (
  `IdConsultaVariavel` bigint(20) NOT NULL,
  `IdMedicamento` int(11) NOT NULL,
  `Indicacao` varchar(100) DEFAULT NULL,
  `Resposta` varchar(100) DEFAULT NULL,
  `Periodo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdConsultaVariavel`,`IdMedicamento`),
  KEY `fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos1` (`IdMedicamento`),
  KEY `fk_tb_consulta_variavel_has_tb_medicamentos_tb_consulta_varia1` (`IdConsultaVariavel`),
  CONSTRAINT `fk_tb_consulta_variavel_has_tb_medicamentos_tb_consulta_varia1` FOREIGN KEY (`IdConsultaVariavel`) REFERENCES `tb_consulta_variavel` (`IdConsultaVariavel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos1` FOREIGN KEY (`IdMedicamento`) REFERENCES `tb_medicamentos` (`IdMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medicamentos_anteriores`
--

LOCK TABLES `tb_medicamentos_anteriores` WRITE;
/*!40000 ALTER TABLE `tb_medicamentos_anteriores` DISABLE KEYS */;
INSERT INTO `tb_medicamentos_anteriores` VALUES (2,1,'1','11','1');
/*!40000 ALTER TABLE `tb_medicamentos_anteriores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_consulta_fixo`
--

DROP TABLE IF EXISTS `tb_consulta_fixo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_consulta_fixo` (
  `IdConsultaFixo` bigint(20) NOT NULL AUTO_INCREMENT,
  `EhGabarito` tinyint(1) NOT NULL DEFAULT '0',
  `DataAtualizacao` datetime DEFAULT NULL,
  `ComentariosTutor` text,
  PRIMARY KEY (`IdConsultaFixo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_consulta_fixo`
--

LOCK TABLES `tb_consulta_fixo` WRITE;
/*!40000 ALTER TABLE `tb_consulta_fixo` DISABLE KEYS */;
INSERT INTO `tb_consulta_fixo` VALUES (1,0,'0001-01-01 00:00:00',NULL),(2,0,'0001-01-01 00:00:00',NULL),(3,0,'0001-01-01 00:00:00',NULL),(4,0,'0001-01-01 00:00:00',NULL),(5,0,'0001-01-01 00:00:00',NULL),(6,0,'0001-01-01 00:00:00',NULL),(7,0,'0001-01-01 00:00:00',NULL);
/*!40000 ALTER TABLE `tb_consulta_fixo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sistema`
--

DROP TABLE IF EXISTS `tb_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sistema` (
  `IdSistema` int(11) NOT NULL AUTO_INCREMENT,
  `NomeSistema` varchar(100) NOT NULL,
  PRIMARY KEY (`IdSistema`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sistema`
--

LOCK TABLES `tb_sistema` WRITE;
/*!40000 ALTER TABLE `tb_sistema` DISABLE KEYS */;
INSERT INTO `tb_sistema` VALUES (1,'RespiratÃ³rio'),(2,'CirculatÃ³rio');
/*!40000 ALTER TABLE `tb_sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentoqueixasegunda`
--

DROP TABLE IF EXISTS `medicamentoqueixasegunda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamentoqueixasegunda` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) DEFAULT NULL,
  `dose` varchar(80) DEFAULT NULL,
  `efetivo` varchar(1) DEFAULT NULL,
  `necessario` varchar(1) DEFAULT NULL,
  `periodo` varchar(80) DEFAULT NULL,
  `seguro` varchar(1) DEFAULT NULL,
  `cumprimento` varchar(1) DEFAULT NULL,
  `fkQueixaSegunda` int(10) NOT NULL,
  `conheceCumpre` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF12E64244E1862F8` (`fkQueixaSegunda`),
  CONSTRAINT `FKF12E64244E1862F8` FOREIGN KEY (`fkQueixaSegunda`) REFERENCES `queixarespostasegunda` (`id`),
  CONSTRAINT `FK_medicamentoqueixasegunda_1` FOREIGN KEY (`fkQueixaSegunda`) REFERENCES `queixarespostasegunda` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentoqueixasegunda`
--

LOCK TABLES `medicamentoqueixasegunda` WRITE;
/*!40000 ALTER TABLE `medicamentoqueixasegunda` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentoqueixasegunda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_bebida`
--

DROP TABLE IF EXISTS `tb_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_bebida` (
  `IdBebida` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`IdBebida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bebida`
--

LOCK TABLES `tb_bebida` WRITE;
/*!40000 ALTER TABLE `tb_bebida` DISABLE KEYS */;
INSERT INTO `tb_bebida` VALUES (1,'Ãgua'),(2,'Leite');
/*!40000 ALTER TABLE `tb_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_resposta`
--

DROP TABLE IF EXISTS `tb_resposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_resposta` (
  `IdResposta` int(11) NOT NULL AUTO_INCREMENT,
  `Resposta` varchar(255) NOT NULL,
  `IdPergunta` int(11) NOT NULL,
  PRIMARY KEY (`IdResposta`),
  KEY `fk_tb_resposta_tb_pergunta1` (`IdPergunta`),
  CONSTRAINT `fk_tb_resposta_tb_pergunta1` FOREIGN KEY (`IdPergunta`) REFERENCES `tb_pergunta` (`IdPergunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_resposta`
--

LOCK TABLES `tb_resposta` WRITE;
/*!40000 ALTER TABLE `tb_resposta` DISABLE KEYS */;
INSERT INTO `tb_resposta` VALUES (2,'sim',2),(3,'nao',2);
/*!40000 ALTER TABLE `tb_resposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_turma_pessoa_relato`
--

DROP TABLE IF EXISTS `tb_turma_pessoa_relato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_turma_pessoa_relato` (
  `IdTurma` int(11) NOT NULL,
  `IdPessoa` int(11) NOT NULL,
  `IdRelato` int(11) NOT NULL,
  `IdConsultaFixo` bigint(20) NOT NULL,
  `EstadoPreencimento` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`IdTurma`,`IdPessoa`,`IdRelato`,`IdConsultaFixo`),
  KEY `fk_tb_turma_pessoa_has_tb_relato_clinico_tb_relato_clinico1` (`IdRelato`),
  KEY `fk_tb_turma_pessoa_has_tb_relato_clinico_tb_turma_pessoa1` (`IdTurma`,`IdPessoa`),
  KEY `fk_tb_turma_pessoa_relato_tb_consulta_fixo1` (`IdConsultaFixo`),
  CONSTRAINT `fk_tb_turma_pessoa_has_tb_relato_clinico_tb_turma_pessoa1` FOREIGN KEY (`IdTurma`, `IdPessoa`) REFERENCES `tb_turma_pessoa` (`IdTurma`, `IdPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_turma_pessoa_has_tb_relato_clinico_tb_relato_clinico1` FOREIGN KEY (`IdRelato`) REFERENCES `tb_relato_clinico` (`IdRelato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_turma_pessoa_relato_tb_consulta_fixo1` FOREIGN KEY (`IdConsultaFixo`) REFERENCES `tb_consulta_fixo` (`IdConsultaFixo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_turma_pessoa_relato`
--

LOCK TABLES `tb_turma_pessoa_relato` WRITE;
/*!40000 ALTER TABLE `tb_turma_pessoa_relato` DISABLE KEYS */;
INSERT INTO `tb_turma_pessoa_relato` VALUES (1,1,1,5,'A'),(1,1,1,6,'A'),(1,1,2,7,'A');
/*!40000 ALTER TABLE `tb_turma_pessoa_relato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_consulta_variavel`
--

DROP TABLE IF EXISTS `tb_consulta_variavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_consulta_variavel` (
  `IdConsultaVariavel` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdTurma` int(11) NOT NULL,
  `IdPessoa` int(11) NOT NULL,
  `IdRelato` int(11) NOT NULL,
  `IdConsultaFixo` bigint(20) NOT NULL,
  `IdRazaoEncontro` int(11) NOT NULL,
  `DataPreenchimento` datetime DEFAULT NULL,
  `Lembretes` text,
  `ComentariosTutor` text,
  PRIMARY KEY (`IdConsultaVariavel`),
  KEY `fk_tb_consulta_variavel_tb_razao_encontro1` (`IdRazaoEncontro`),
  KEY `fk_tb_consulta_variavel_tb_turma_pessoa_relato1` (`IdTurma`,`IdPessoa`,`IdRelato`,`IdConsultaFixo`),
  CONSTRAINT `fk_tb_consulta_variavel_tb_razao_encontro1` FOREIGN KEY (`IdRazaoEncontro`) REFERENCES `tb_razao_encontro` (`IdRazaoEncontro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_consulta_variavel_tb_turma_pessoa_relato1` FOREIGN KEY (`IdTurma`, `IdPessoa`, `IdRelato`, `IdConsultaFixo`) REFERENCES `tb_turma_pessoa_relato` (`IdTurma`, `IdPessoa`, `IdRelato`, `IdConsultaFixo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_consulta_variavel`
--

LOCK TABLES `tb_consulta_variavel` WRITE;
/*!40000 ALTER TABLE `tb_consulta_variavel` DISABLE KEYS */;
INSERT INTO `tb_consulta_variavel` VALUES (2,1,1,1,6,1,'0001-01-01 00:00:00',NULL,NULL),(3,1,1,2,7,1,'0001-01-01 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `tb_consulta_variavel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_profiles`
--

DROP TABLE IF EXISTS `my_aspnet_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_profiles` (
  `userId` int(11) NOT NULL,
  `valueindex` longtext,
  `stringdata` longtext,
  `binarydata` longblob,
  `lastUpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_profiles`
--

LOCK TABLES `my_aspnet_profiles` WRITE;
/*!40000 ALTER TABLE `my_aspnet_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casoclinico`
--

DROP TABLE IF EXISTS `casoclinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casoclinico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alergias` varchar(255) DEFAULT NULL,
  `altura` float NOT NULL,
  `dataNascimento` datetime DEFAULT NULL,
  `disponibilidade` varchar(255) DEFAULT NULL,
  `escolaridade` varchar(255) DEFAULT NULL,
  `flBebeAlcool` varchar(255) DEFAULT NULL,
  `flBebeCafe` varchar(255) DEFAULT NULL,
  `flFuma` varchar(255) DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `medicosQueAtendem` varchar(255) DEFAULT NULL,
  `moradiaFamilia` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `ocupacao` varchar(255) DEFAULT NULL,
  `peso` float NOT NULL,
  `planoDeSaude` varchar(255) DEFAULT NULL,
  `pressaoDiastolica` int(11) NOT NULL,
  `pressaoSistolica` int(11) NOT NULL,
  `relatoDeCasoPrimeiraConsulta` longtext,
  `relatoDeCasoTerceiraConsulta` longtext,
  `temperatura` float NOT NULL,
  `historiaAlcoolAnterior` varchar(255) DEFAULT NULL,
  `historiaAlcoolAtual` varchar(255) DEFAULT NULL,
  `historiaCafeAnterior` varchar(255) DEFAULT NULL,
  `historiaCafeAtual` varchar(255) DEFAULT NULL,
  `historiaTabacoAnterior` varchar(255) DEFAULT NULL,
  `historiaTabacoAtual` varchar(255) DEFAULT NULL,
  `peso2` float DEFAULT NULL,
  `pressaoDiastolica2` int(11) DEFAULT NULL,
  `pressaoSistolica2` int(11) DEFAULT NULL,
  `temperatura2` float DEFAULT NULL,
  `tipoBebidaAlcoolica` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casoclinico`
--

LOCK TABLES `casoclinico` WRITE;
/*!40000 ALTER TABLE `casoclinico` DISABLE KEYS */;
/*!40000 ALTER TABLE `casoclinico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queixarespostaprimeira`
--

DROP TABLE IF EXISTS `queixarespostaprimeira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queixarespostaprimeira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `fkResposta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1E43344B8872A0F6` (`fkResposta`),
  KEY `FK_queixarespostaprimeira_1` (`fkResposta`),
  CONSTRAINT `FK1E43344B8872A0F6` FOREIGN KEY (`fkResposta`) REFERENCES `respostaprimeira` (`id`),
  CONSTRAINT `FK_queixarespostaprimeira_1` FOREIGN KEY (`fkResposta`) REFERENCES `respostaprimeira` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queixarespostaprimeira`
--

LOCK TABLES `queixarespostaprimeira` WRITE;
/*!40000 ALTER TABLE `queixarespostaprimeira` DISABLE KEYS */;
/*!40000 ALTER TABLE `queixarespostaprimeira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `login` varchar(40) NOT NULL DEFAULT '',
  `anoInicioCurso` int(11) NOT NULL,
  `flCursouAssistenciaFarmaceutica` varchar(1) DEFAULT NULL,
  `flCursouAtencaoFarmaceutica` varchar(1) DEFAULT NULL,
  `flCursouDispencaoFarmaceutica` varchar(1) DEFAULT NULL,
  `flCursouFarmaciaClinica` varchar(1) DEFAULT NULL,
  `flCursouIntroducaoFarmacia` varchar(1) DEFAULT NULL,
  `flCursouSemiologiaFarmaceutica` varchar(1) DEFAULT NULL,
  `flCursouTopicosFarmaciaClinica` varchar(1) DEFAULT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `idade` int(11) NOT NULL,
  `matricula` varchar(8) DEFAULT NULL,
  `fkTurma` int(11) DEFAULT NULL,
  `nome` varchar(45) NOT NULL DEFAULT '',
  `liberado` char(1) DEFAULT 'S',
  `fkConsultaAtual` int(11) DEFAULT NULL,
  `nrConsulta` int(11) NOT NULL DEFAULT '1',
  `nrTentativa` int(11) NOT NULL DEFAULT '1',
  `flAcessoCasa` varchar(1) DEFAULT NULL,
  `flAcessoCasaAmigo` varchar(1) DEFAULT NULL,
  `flAcessoOutro` varchar(1) DEFAULT NULL,
  `flAcessoUniversidade` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`login`),
  KEY `FK589C4EB2B97188F` (`fkTurma`),
  KEY `FK589C4EBDD526F1E` (`fkConsultaAtual`),
  CONSTRAINT `FK589C4EBDD526F1E` FOREIGN KEY (`fkConsultaAtual`) REFERENCES `consulta` (`id`),
  CONSTRAINT `FK_aluno_2` FOREIGN KEY (`fkConsultaAtual`) REFERENCES `consulta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fkCasoClinico` int(11) NOT NULL DEFAULT '0',
  `fkAluno` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FKDE2881F58A1319FF` (`fkCasoClinico`),
  KEY `FKDE2881F52977839B` (`fkAluno`),
  KEY `FK_Consulta_1` (`fkCasoClinico`),
  KEY `FK_consulta_2` (`fkAluno`),
  CONSTRAINT `FKDE2881F52977839B` FOREIGN KEY (`fkAluno`) REFERENCES `aluno` (`login`),
  CONSTRAINT `FKDE2881F58A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`),
  CONSTRAINT `FK_Consulta_1` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`),
  CONSTRAINT `FK_consulta_2` FOREIGN KEY (`fkAluno`) REFERENCES `aluno` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queixarespostasegunda`
--

DROP TABLE IF EXISTS `queixarespostasegunda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queixarespostasegunda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroPRM` int(11) NOT NULL DEFAULT '0',
  `fkResposta2` int(11) NOT NULL DEFAULT '0',
  `flConheceOuPreocupa` varchar(1) DEFAULT NULL,
  `prioridade` int(10) unsigned NOT NULL,
  `descricao` varchar(125) DEFAULT NULL,
  `periodoSurgimento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFD098D39A4FE1140` (`fkResposta2`),
  KEY `FK685CED99A4FE1140` (`fkResposta2`),
  CONSTRAINT `FK685CED99A4FE1140` FOREIGN KEY (`fkResposta2`) REFERENCES `respostasegunda` (`id`),
  CONSTRAINT `FKFD098D39A4FE1140` FOREIGN KEY (`fkResposta2`) REFERENCES `respostasegunda` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queixarespostasegunda`
--

LOCK TABLES `queixarespostasegunda` WRITE;
/*!40000 ALTER TABLE `queixarespostasegunda` DISABLE KEYS */;
/*!40000 ALTER TABLE `queixarespostasegunda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_experiencia_medicamentos`
--

DROP TABLE IF EXISTS `tb_experiencia_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_experiencia_medicamentos` (
  `IdConsultaFixo` bigint(20) NOT NULL,
  `IdRespostaEsperaTratamento` int(11) NOT NULL,
  `IdRespostaPreocupacoes` int(11) NOT NULL,
  `IdRespostaGrauEntendimento` int(11) NOT NULL,
  `IdRespostaCultural` int(11) NOT NULL,
  `IdRespostaComportamento` int(11) NOT NULL,
  `IdRespostaIncorporadoPlano` int(11) NOT NULL,
  `AtencaoEsperaTratamento` tinyint(1) NOT NULL,
  `AtencaoPreocupacoes` tinyint(1) NOT NULL,
  `AtencaoGrauEntendimento` tinyint(1) NOT NULL,
  `AtencaoCultural` tinyint(1) NOT NULL,
  `AtencaoComportamento` tinyint(1) NOT NULL,
  PRIMARY KEY (`IdConsultaFixo`),
  KEY `fk_tb_experiencia_medicamentos_tb_resposta1` (`IdRespostaEsperaTratamento`),
  KEY `fk_tb_experiencia_medicamentos_tb_resposta2` (`IdRespostaPreocupacoes`),
  KEY `fk_tb_experiencia_medicamentos_tb_resposta3` (`IdRespostaGrauEntendimento`),
  KEY `fk_tb_experiencia_medicamentos_tb_resposta4` (`IdRespostaCultural`),
  KEY `fk_tb_experiencia_medicamentos_tb_resposta5` (`IdRespostaComportamento`),
  KEY `fk_tb_experiencia_medicamentos_tb_resposta6` (`IdRespostaIncorporadoPlano`),
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_consulta_fixo1` FOREIGN KEY (`IdConsultaFixo`) REFERENCES `tb_consulta_fixo` (`IdConsultaFixo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_resposta1` FOREIGN KEY (`IdRespostaEsperaTratamento`) REFERENCES `tb_resposta` (`IdResposta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_resposta2` FOREIGN KEY (`IdRespostaPreocupacoes`) REFERENCES `tb_resposta` (`IdResposta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_resposta3` FOREIGN KEY (`IdRespostaGrauEntendimento`) REFERENCES `tb_resposta` (`IdResposta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_resposta4` FOREIGN KEY (`IdRespostaCultural`) REFERENCES `tb_resposta` (`IdResposta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_resposta5` FOREIGN KEY (`IdRespostaComportamento`) REFERENCES `tb_resposta` (`IdResposta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_resposta6` FOREIGN KEY (`IdRespostaIncorporadoPlano`) REFERENCES `tb_resposta` (`IdResposta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_experiencia_medicamentos`
--

LOCK TABLES `tb_experiencia_medicamentos` WRITE;
/*!40000 ALTER TABLE `tb_experiencia_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_experiencia_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_applications`
--

DROP TABLE IF EXISTS `my_aspnet_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_applications`
--

LOCK TABLES `my_aspnet_applications` WRITE;
/*!40000 ALTER TABLE `my_aspnet_applications` DISABLE KEYS */;
INSERT INTO `my_aspnet_applications` VALUES (1,'/','MySQL roles');
/*!40000 ALTER TABLE `my_aspnet_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_usersinroles`
--

DROP TABLE IF EXISTS `my_aspnet_usersinroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_usersinroles` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `roleId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_usersinroles`
--

LOCK TABLES `my_aspnet_usersinroles` WRITE;
/*!40000 ALTER TABLE `my_aspnet_usersinroles` DISABLE KEYS */;
INSERT INTO `my_aspnet_usersinroles` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `my_aspnet_usersinroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_parametro_clinico`
--

DROP TABLE IF EXISTS `tb_parametro_clinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_parametro_clinico` (
  `IdParametroClinico` int(11) NOT NULL,
  `ParametroClinico` varchar(100) NOT NULL,
  PRIMARY KEY (`IdParametroClinico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_parametro_clinico`
--

LOCK TABLES `tb_parametro_clinico` WRITE;
/*!40000 ALTER TABLE `tb_parametro_clinico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_parametro_clinico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_acao_queixa`
--

DROP TABLE IF EXISTS `tb_acao_queixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_acao_queixa` (
  `IdAcaoQueixa` int(11) NOT NULL AUTO_INCREMENT,
  `DescricaoAcao` varchar(100) NOT NULL,
  PRIMARY KEY (`IdAcaoQueixa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_acao_queixa`
--

LOCK TABLES `tb_acao_queixa` WRITE;
/*!40000 ALTER TABLE `tb_acao_queixa` DISABLE KEYS */;
INSERT INTO `tb_acao_queixa` VALUES (2,'enviar mÃ©dico'),(3,'medicar');
/*!40000 ALTER TABLE `tb_acao_queixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_roles`
--

DROP TABLE IF EXISTS `my_aspnet_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_roles`
--

LOCK TABLES `my_aspnet_roles` WRITE;
/*!40000 ALTER TABLE `my_aspnet_roles` DISABLE KEYS */;
INSERT INTO `my_aspnet_roles` VALUES (1,1,'administrador'),(2,1,'usuario'),(3,1,'tutor');
/*!40000 ALTER TABLE `my_aspnet_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_membership`
--

DROP TABLE IF EXISTS `my_aspnet_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_membership` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `Email` varchar(128) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `Password` varchar(128) NOT NULL,
  `PasswordKey` char(32) DEFAULT NULL,
  `PasswordFormat` tinyint(4) DEFAULT NULL,
  `PasswordQuestion` varchar(255) DEFAULT NULL,
  `PasswordAnswer` varchar(255) DEFAULT NULL,
  `IsApproved` tinyint(1) DEFAULT NULL,
  `LastActivityDate` datetime DEFAULT NULL,
  `LastLoginDate` datetime DEFAULT NULL,
  `LastPasswordChangedDate` datetime DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `IsLockedOut` tinyint(1) DEFAULT NULL,
  `LastLockedOutDate` datetime DEFAULT NULL,
  `FailedPasswordAttemptCount` int(10) unsigned DEFAULT NULL,
  `FailedPasswordAttemptWindowStart` datetime DEFAULT NULL,
  `FailedPasswordAnswerAttemptCount` int(10) unsigned DEFAULT NULL,
  `FailedPasswordAnswerAttemptWindowStart` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_membership`
--

LOCK TABLES `my_aspnet_membership` WRITE;
/*!40000 ALTER TABLE `my_aspnet_membership` DISABLE KEYS */;
INSERT INTO `my_aspnet_membership` VALUES (1,'marcosdosea@yahoo.com.br','','LEYqfv4+20Hq7nme6TC+K8E9k3uW4nIp3uS1weNW4JY=','A0903aZDxeEcCtPOqPMgGg==',1,NULL,NULL,1,'2013-07-23 11:31:57','2013-07-23 11:31:57','2013-07-23 11:15:39','2013-07-23 11:15:39',0,'2013-07-23 11:15:39',2,'2013-08-20 15:01:15',0,'2013-07-23 11:15:39'),(2,'aluno@ufs.br','','9UZXsv0b0mRYrpIvrqyWdFhaWJ2v7IP28EQWsGRG0BY=','qSfOmA/JSmbsgLC5niTPzQ==',1,NULL,NULL,1,'2013-07-23 11:25:20','2013-07-23 11:25:20','2013-07-23 11:17:45','2013-07-23 11:17:45',0,'2013-07-23 11:17:45',0,'2013-07-23 11:17:45',0,'2013-07-23 11:17:45');
/*!40000 ALTER TABLE `my_aspnet_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_diario_pessoal`
--

DROP TABLE IF EXISTS `tb_diario_pessoal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_diario_pessoal` (
  `IdConsultaFixo` bigint(20) NOT NULL,
  `IdMedicamento` int(11) NOT NULL,
  `Periodo` char(1) NOT NULL,
  `Horario` varchar(20) DEFAULT NULL,
  `Quantidade` varchar(20) DEFAULT NULL,
  `IdBebida` int(11) NOT NULL,
  PRIMARY KEY (`IdConsultaFixo`,`IdMedicamento`),
  KEY `fk_tb_diario_pessoal_tb_medicamentos1` (`IdMedicamento`),
  KEY `fk_tb_diario_pessoal_tb_consulta_fixo1` (`IdConsultaFixo`),
  KEY `fk_tb_diario_pessoal_tb_bebida1` (`IdBebida`),
  CONSTRAINT `fk_tb_diario_pessoal_tb_medicamentos1` FOREIGN KEY (`IdMedicamento`) REFERENCES `tb_medicamentos` (`IdMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_diario_pessoal_tb_consulta_fixo1` FOREIGN KEY (`IdConsultaFixo`) REFERENCES `tb_consulta_fixo` (`IdConsultaFixo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_diario_pessoal_tb_bebida1` FOREIGN KEY (`IdBebida`) REFERENCES `tb_bebida` (`IdBebida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_diario_pessoal`
--

LOCK TABLES `tb_diario_pessoal` WRITE;
/*!40000 ALTER TABLE `tb_diario_pessoal` DISABLE KEYS */;
INSERT INTO `tb_diario_pessoal` VALUES (6,1,'1','7h','01 comprimido',1),(7,1,'M',NULL,NULL,1);
/*!40000 ALTER TABLE `tb_diario_pessoal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_razao_encontro`
--

DROP TABLE IF EXISTS `tb_razao_encontro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_razao_encontro` (
  `IdRazaoEncontro` int(11) NOT NULL,
  `DescricaoRazao` varchar(100) NOT NULL,
  PRIMARY KEY (`IdRazaoEncontro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_razao_encontro`
--

LOCK TABLES `tb_razao_encontro` WRITE;
/*!40000 ALTER TABLE `tb_razao_encontro` DISABLE KEYS */;
INSERT INTO `tb_razao_encontro` VALUES (1,'-- nao definido --');
/*!40000 ALTER TABLE `tb_razao_encontro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_acao_alternativa`
--

DROP TABLE IF EXISTS `tb_acao_alternativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_acao_alternativa` (
  `IdAcaoAlternativa` int(11) NOT NULL,
  `DescricaoAcao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdAcaoAlternativa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_acao_alternativa`
--

LOCK TABLES `tb_acao_alternativa` WRITE;
/*!40000 ALTER TABLE `tb_acao_alternativa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_acao_alternativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medicamento_prescrito`
--

DROP TABLE IF EXISTS `tb_medicamento_prescrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_medicamento_prescrito` (
  `IdConsultaVariavel` bigint(20) NOT NULL,
  `IdMedicamento` int(11) NOT NULL,
  `Fitoterapico` tinyint(1) DEFAULT NULL,
  `Dosagem` varchar(50) DEFAULT NULL,
  `Posologia` varchar(50) DEFAULT NULL,
  `Prescritor` varchar(50) DEFAULT NULL,
  `Especialidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdConsultaVariavel`,`IdMedicamento`),
  KEY `fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos2` (`IdMedicamento`),
  KEY `fk_tb_consulta_variavel_has_tb_medicamentos_tb_consulta_varia2` (`IdConsultaVariavel`),
  CONSTRAINT `fk_tb_consulta_variavel_has_tb_medicamentos_tb_consulta_varia2` FOREIGN KEY (`IdConsultaVariavel`) REFERENCES `tb_consulta_variavel` (`IdConsultaVariavel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos2` FOREIGN KEY (`IdMedicamento`) REFERENCES `tb_medicamentos` (`IdMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medicamento_prescrito`
--

LOCK TABLES `tb_medicamento_prescrito` WRITE;
/*!40000 ALTER TABLE `tb_medicamento_prescrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_medicamento_prescrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_users`
--

DROP TABLE IF EXISTS `my_aspnet_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `isAnonymous` tinyint(1) NOT NULL DEFAULT '1',
  `lastActivityDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_users`
--

LOCK TABLES `my_aspnet_users` WRITE;
/*!40000 ALTER TABLE `my_aspnet_users` DISABLE KEYS */;
INSERT INTO `my_aspnet_users` VALUES (1,1,'marcosdosea',0,'2013-07-23 11:31:57'),(2,1,'aluno',0,'2013-07-23 11:25:20');
/*!40000 ALTER TABLE `my_aspnet_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_historico`
--

DROP TABLE IF EXISTS `tb_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_historico` (
  `IdHistorico` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdPessoa` int(11) NOT NULL,
  `IdTurma` int(11) NOT NULL,
  `IdPaciente` int(11) NOT NULL,
  `IdTutor` int(11) NOT NULL,
  `IdRelato` int(11) NOT NULL,
  `DataEnvio` datetime DEFAULT NULL,
  `DataResposta` datetime DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `ComentarioTutor` text,
  PRIMARY KEY (`IdHistorico`),
  KEY `fk_tb_historico_tb_pessoa1` (`IdTutor`),
  KEY `fk_tb_historico_tb_relato_clinico1` (`IdRelato`),
  CONSTRAINT `fk_tb_historico_tb_pessoa1` FOREIGN KEY (`IdTutor`) REFERENCES `tb_pessoa` (`IdPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_historico_tb_relato_clinico1` FOREIGN KEY (`IdRelato`) REFERENCES `tb_relato_clinico` (`IdRelato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_historico`
--

LOCK TABLES `tb_historico` WRITE;
/*!40000 ALTER TABLE `tb_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_alergia`
--

DROP TABLE IF EXISTS `tb_alergia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_alergia` (
  `IdAlergia` int(11) NOT NULL AUTO_INCREMENT,
  `Alergia` varchar(100) NOT NULL,
  PRIMARY KEY (`IdAlergia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_alergia`
--

LOCK TABLES `tb_alergia` WRITE;
/*!40000 ALTER TABLE `tb_alergia` DISABLE KEYS */;
INSERT INTO `tb_alergia` VALUES (1,'teste');
/*!40000 ALTER TABLE `tb_alergia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_alergia_exames_fisicos`
--

DROP TABLE IF EXISTS `tb_alergia_exames_fisicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_alergia_exames_fisicos` (
  `IdAlergia` int(11) NOT NULL,
  `IdConsultaVariavel` bigint(20) NOT NULL,
  PRIMARY KEY (`IdAlergia`,`IdConsultaVariavel`),
  KEY `fk_tb_alergia_has_tb_exames_fisicos_tb_exames_fisicos1` (`IdConsultaVariavel`),
  KEY `fk_tb_alergia_has_tb_exames_fisicos_tb_alergia1` (`IdAlergia`),
  CONSTRAINT `fk_tb_alergia_has_tb_exames_fisicos_tb_alergia1` FOREIGN KEY (`IdAlergia`) REFERENCES `tb_alergia` (`IdAlergia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_alergia_has_tb_exames_fisicos_tb_exames_fisicos1` FOREIGN KEY (`IdConsultaVariavel`) REFERENCES `tb_exames_fisicos` (`IdConsultaVariavel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_alergia_exames_fisicos`
--

LOCK TABLES `tb_alergia_exames_fisicos` WRITE;
/*!40000 ALTER TABLE `tb_alergia_exames_fisicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_alergia_exames_fisicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_turma`
--

DROP TABLE IF EXISTS `tb_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_turma` (
  `IdTurma` int(11) NOT NULL AUTO_INCREMENT,
  `IdDisciplina` int(11) NOT NULL,
  `IdCurso` int(11) NOT NULL,
  `IdInstituicao` int(11) NOT NULL,
  `Codigo` varchar(2) NOT NULL,
  `Periodo` varchar(6) NOT NULL,
  `Ativa` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`IdTurma`),
  KEY `fk_tb_turma_tb_disciplina1` (`IdDisciplina`),
  KEY `fk_tb_turma_tb_curso1` (`IdCurso`),
  KEY `fk_tb_turma_tb_instituicao1` (`IdInstituicao`),
  CONSTRAINT `fk_tb_turma_tb_disciplina1` FOREIGN KEY (`IdDisciplina`) REFERENCES `tb_disciplina` (`IdDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_turma_tb_curso1` FOREIGN KEY (`IdCurso`) REFERENCES `tb_curso` (`IdCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_turma_tb_instituicao1` FOREIGN KEY (`IdInstituicao`) REFERENCES `tb_instituicao` (`IdInstituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_turma`
--

LOCK TABLES `tb_turma` WRITE;
/*!40000 ALTER TABLE `tb_turma` DISABLE KEYS */;
INSERT INTO `tb_turma` VALUES (1,0,0,1,'a0','20131',1);
/*!40000 ALTER TABLE `tb_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intervencaorespostaquarta`
--

DROP TABLE IF EXISTS `intervencaorespostaquarta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intervencaorespostaquarta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `justificativa` longtext,
  `numeroIntervencao` int(11) NOT NULL DEFAULT '0',
  `fkResposta4` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK800BA011D2B646E7` (`fkResposta4`),
  CONSTRAINT `FK800BA011D2B646E7` FOREIGN KEY (`fkResposta4`) REFERENCES `respostaquarta` (`id`),
  CONSTRAINT `FK_intervencaorespostaquarta_1` FOREIGN KEY (`fkResposta4`) REFERENCES `respostaquarta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intervencaorespostaquarta`
--

LOCK TABLES `intervencaorespostaquarta` WRITE;
/*!40000 ALTER TABLE `intervencaorespostaquarta` DISABLE KEYS */;
/*!40000 ALTER TABLE `intervencaorespostaquarta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estilo_vida`
--

DROP TABLE IF EXISTS `tb_estilo_vida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_estilo_vida` (
  `IdConsultaVariavel` bigint(20) NOT NULL,
  `TabacoConsumo` tinyint(1) NOT NULL,
  `TabacoUso` smallint(6) NOT NULL,
  `TabacoParou` varchar(50) DEFAULT NULL,
  `CafeConsumo` tinyint(1) NOT NULL,
  `CafeUso` smallint(6) NOT NULL,
  `CafeParou` varchar(50) DEFAULT NULL,
  `AlcoolConsumo` tinyint(1) NOT NULL,
  `AlcoolUso` smallint(6) NOT NULL,
  `AlcoolTipoBebida` varchar(50) DEFAULT NULL,
  `AlcoolParou` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdConsultaVariavel`),
  CONSTRAINT `fk_tb_estilo_vida_tb_consulta_variavel1` FOREIGN KEY (`IdConsultaVariavel`) REFERENCES `tb_consulta_variavel` (`IdConsultaVariavel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estilo_vida`
--

LOCK TABLES `tb_estilo_vida` WRITE;
/*!40000 ALTER TABLE `tb_estilo_vida` DISABLE KEYS */;
INSERT INTO `tb_estilo_vida` VALUES (2,0,0,NULL,0,0,NULL,0,0,NULL,NULL),(3,0,0,NULL,0,0,NULL,0,0,NULL,NULL);
/*!40000 ALTER TABLE `tb_estilo_vida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentonaoprescrito`
--

DROP TABLE IF EXISTS `medicamentonaoprescrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamentonaoprescrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `dosagem` varchar(255) DEFAULT NULL,
  `posologia` varchar(255) DEFAULT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  `flItalico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBF69A97F8A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FKBF69A97F8A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentonaoprescrito`
--

LOCK TABLES `medicamentonaoprescrito` WRITE;
/*!40000 ALTER TABLE `medicamentonaoprescrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentonaoprescrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_escolaridade`
--

DROP TABLE IF EXISTS `tb_escolaridade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_escolaridade` (
  `IdEscolaridade` int(11) NOT NULL AUTO_INCREMENT,
  `Nivel` varchar(100) NOT NULL,
  PRIMARY KEY (`IdEscolaridade`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_escolaridade`
--

LOCK TABLES `tb_escolaridade` WRITE;
/*!40000 ALTER TABLE `tb_escolaridade` DISABLE KEYS */;
INSERT INTO `tb_escolaridade` VALUES (1,'nao definido'),(2,'NÃ­vel MÃ©dio'),(3,'NÃ­vel Superior');
/*!40000 ALTER TABLE `tb_escolaridade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_exames_fisicos`
--

DROP TABLE IF EXISTS `tb_exames_fisicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_exames_fisicos` (
  `IdConsultaVariavel` bigint(20) NOT NULL,
  `Peso` float DEFAULT NULL,
  `Altura` float DEFAULT NULL,
  `PressaoDiastolica` float DEFAULT NULL,
  `PressaoSistolica` float DEFAULT NULL,
  `Glicemia` float DEFAULT NULL,
  PRIMARY KEY (`IdConsultaVariavel`),
  CONSTRAINT `fk_tb_exames_fisicos_tb_consulta_variavel1` FOREIGN KEY (`IdConsultaVariavel`) REFERENCES `tb_consulta_variavel` (`IdConsultaVariavel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_exames_fisicos`
--

LOCK TABLES `tb_exames_fisicos` WRITE;
/*!40000 ALTER TABLE `tb_exames_fisicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_exames_fisicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_sessions`
--

DROP TABLE IF EXISTS `my_aspnet_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_sessions` (
  `SessionId` varchar(191) NOT NULL,
  `ApplicationId` int(11) NOT NULL,
  `Created` datetime NOT NULL,
  `Expires` datetime NOT NULL,
  `LockDate` datetime NOT NULL,
  `LockId` int(11) NOT NULL,
  `Timeout` int(11) NOT NULL,
  `Locked` tinyint(1) NOT NULL,
  `SessionItems` longblob,
  `Flags` int(11) NOT NULL,
  PRIMARY KEY (`SessionId`,`ApplicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_sessions`
--

LOCK TABLES `my_aspnet_sessions` WRITE;
/*!40000 ALTER TABLE `my_aspnet_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respostaterceira`
--

DROP TABLE IF EXISTS `respostaterceira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respostaterceira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temperatura` float DEFAULT NULL,
  `pressaosistolica` int(10) unsigned DEFAULT NULL,
  `pressaodiastolica` int(10) unsigned DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `fkConsulta` int(11) NOT NULL,
  `dataRealizacao` date DEFAULT NULL,
  `flCorreto` varchar(1) DEFAULT NULL,
  `comentario` text,
  `comentarioAluno` text,
  `nota` float DEFAULT NULL,
  `imc` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK877B3B565097F805` (`fkConsulta`),
  CONSTRAINT `FK877B3B565097F805` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`),
  CONSTRAINT `FK_respostaalunoterceira_1` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respostaterceira`
--

LOCK TABLES `respostaterceira` WRITE;
/*!40000 ALTER TABLE `respostaterceira` DISABLE KEYS */;
/*!40000 ALTER TABLE `respostaterceira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pergunta`
--

DROP TABLE IF EXISTS `tb_pergunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pergunta` (
  `IdPergunta` int(11) NOT NULL AUTO_INCREMENT,
  `Pergunta` varchar(255) NOT NULL,
  PRIMARY KEY (`IdPergunta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pergunta`
--

LOCK TABLES `tb_pergunta` WRITE;
/*!40000 ALTER TABLE `tb_pergunta` DISABLE KEYS */;
INSERT INTO `tb_pergunta` VALUES (2,'esta com dor de barriga?');
/*!40000 ALTER TABLE `tb_pergunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentoqueixaquarta`
--

DROP TABLE IF EXISTS `medicamentoqueixaquarta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamentoqueixaquarta` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) DEFAULT NULL,
  `dose` varchar(80) DEFAULT NULL,
  `efetivo` varchar(1) DEFAULT NULL,
  `necessario` varchar(1) DEFAULT NULL,
  `periodo` varchar(80) DEFAULT NULL,
  `seguro` varchar(1) DEFAULT NULL,
  `cumprimento` varchar(1) DEFAULT NULL,
  `fkQueixaQuarta` int(10) NOT NULL,
  `conheceCumpre` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK78D999E947C18322` (`fkQueixaQuarta`),
  CONSTRAINT `FK78D999E947C18322` FOREIGN KEY (`fkQueixaQuarta`) REFERENCES `queixarespostaquarta` (`id`),
  CONSTRAINT `FK_medicamentoqueixaquarta_1` FOREIGN KEY (`fkQueixaQuarta`) REFERENCES `queixarespostaquarta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentoqueixaquarta`
--

LOCK TABLES `medicamentoqueixaquarta` WRITE;
/*!40000 ALTER TABLE `medicamentoqueixaquarta` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentoqueixaquarta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_medicamento_nao_prescrito`
--

DROP TABLE IF EXISTS `tb_medicamento_nao_prescrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_medicamento_nao_prescrito` (
  `IdConsultaVariavel` bigint(20) NOT NULL,
  `IdMedicamento` int(11) NOT NULL,
  `Fitoterapico` tinyint(1) NOT NULL,
  `Dosagem` varchar(50) DEFAULT NULL,
  `Posologia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdConsultaVariavel`,`IdMedicamento`),
  KEY `fk_tb_medicamento_prescrito_tb_medicamentos1` (`IdMedicamento`),
  CONSTRAINT `fk_tb_medicamento_prescrito_tb_consulta_variavel1` FOREIGN KEY (`IdConsultaVariavel`) REFERENCES `tb_consulta_variavel` (`IdConsultaVariavel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_medicamento_prescrito_tb_medicamentos1` FOREIGN KEY (`IdMedicamento`) REFERENCES `tb_medicamentos` (`IdMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medicamento_nao_prescrito`
--

LOCK TABLES `tb_medicamento_nao_prescrito` WRITE;
/*!40000 ALTER TABLE `tb_medicamento_nao_prescrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_medicamento_nao_prescrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pessoa`
--

DROP TABLE IF EXISTS `tb_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pessoa` (
  `IdPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Cpf` char(11) NOT NULL,
  `Fone` varchar(11) NOT NULL,
  `Matricula` varchar(20) NOT NULL,
  PRIMARY KEY (`IdPessoa`),
  KEY `fk_tb_pessoa_my_aspnet_users1` (`idUser`),
  CONSTRAINT `fk_tb_pessoa_my_aspnet_users1` FOREIGN KEY (`idUser`) REFERENCES `my_aspnet_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pessoa`
--

LOCK TABLES `tb_pessoa` WRITE;
/*!40000 ALTER TABLE `tb_pessoa` DISABLE KEYS */;
INSERT INTO `tb_pessoa` VALUES (1,0,'marcos','','','');
/*!40000 ALTER TABLE `tb_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queixa`
--

DROP TABLE IF EXISTS `queixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `numeroEtapa` int(11) NOT NULL,
  `numeroPRM` int(11) NOT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  `conheceOuPreocupa` varchar(255) DEFAULT NULL,
  `periodoSurgimento` varchar(255) DEFAULT NULL,
  `prioridade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC773DEB18A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FKC773DEB18A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queixa`
--

LOCK TABLES `queixa` WRITE;
/*!40000 ALTER TABLE `queixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `queixa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-21  8:16:52
