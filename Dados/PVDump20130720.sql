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
-- Table structure for table `tb_usuario_turma`
--

DROP TABLE IF EXISTS `tb_usuario_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuario_turma` (
  `IdTurma` int(11) NOT NULL,
  `IdUsuario` bigint(20) NOT NULL,
  `IdPerfilUsuario` int(11) NOT NULL,
  PRIMARY KEY (`IdTurma`,`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario_turma`
--

LOCK TABLES `tb_usuario_turma` WRITE;
/*!40000 ALTER TABLE `tb_usuario_turma` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_usuario_turma` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentoqueixa`
--

LOCK TABLES `medicamentoqueixa` WRITE;
/*!40000 ALTER TABLE `medicamentoqueixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentoqueixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_perfil_usuario`
--

DROP TABLE IF EXISTS `tb_perfil_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_perfil_usuario` (
  `IdPerfil` int(11) NOT NULL,
  `NomePerfil` varchar(45) NOT NULL,
  PRIMARY KEY (`IdPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_perfil_usuario`
--

LOCK TABLES `tb_perfil_usuario` WRITE;
/*!40000 ALTER TABLE `tb_perfil_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_perfil_usuario` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_queixa`
--

LOCK TABLES `tb_queixa` WRITE;
/*!40000 ALTER TABLE `tb_queixa` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paciente`
--

LOCK TABLES `tb_paciente` WRITE;
/*!40000 ALTER TABLE `tb_paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_curso_disciplina`
--

DROP TABLE IF EXISTS `tb_curso_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_curso_disciplina` (
  `IdCurso` int(11) NOT NULL,
  `IdDisciplina` int(11) NOT NULL,
  PRIMARY KEY (`IdCurso`,`IdDisciplina`),
  KEY `fk_tb_curso_has_tb_disciplina_tb_disciplina1` (`IdDisciplina`),
  KEY `fk_tb_curso_has_tb_disciplina_tb_curso1` (`IdCurso`),
  CONSTRAINT `fk_tb_curso_has_tb_disciplina_tb_curso1` FOREIGN KEY (`IdCurso`) REFERENCES `tb_curso` (`IdCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_curso_has_tb_disciplina_tb_disciplina1` FOREIGN KEY (`IdDisciplina`) REFERENCES `tb_disciplina` (`IdDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_curso_disciplina`
--

LOCK TABLES `tb_curso_disciplina` WRITE;
/*!40000 ALTER TABLE `tb_curso_disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_curso_disciplina` ENABLE KEYS */;
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
  CONSTRAINT `fk_tb_consulta_variavel_has_tb_queixa_tb_consulta_variavel1` FOREIGN KEY (`IdConsultaVariavel`) REFERENCES `tb_consulta_variavel` (`IdConsultaVariavel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_consulta_variavel_queixa_tb_queixa1` FOREIGN KEY (`IdQueixa`) REFERENCES `tb_queixa` (`IdQueixa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_instituicao`
--

LOCK TABLES `tb_instituicao` WRITE;
/*!40000 ALTER TABLE `tb_instituicao` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_disciplina`
--

LOCK TABLES `tb_disciplina` WRITE;
/*!40000 ALTER TABLE `tb_disciplina` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`IdTurma`,`IdPessoa`),
  KEY `fk_tb_turma_has_tb_pessoa_tb_pessoa1` (`IdPessoa`),
  KEY `fk_tb_turma_has_tb_pessoa_tb_turma1` (`IdTurma`),
  CONSTRAINT `fk_tb_turma_has_tb_pessoa_tb_turma1` FOREIGN KEY (`IdTurma`) REFERENCES `tb_turma` (`IdTurma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_turma_has_tb_pessoa_tb_pessoa1` FOREIGN KEY (`IdPessoa`) REFERENCES `tb_pessoa` (`IdPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_turma_pessoa`
--

LOCK TABLES `tb_turma_pessoa` WRITE;
/*!40000 ALTER TABLE `tb_turma_pessoa` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_medicamentos`
--

LOCK TABLES `tb_medicamentos` WRITE;
/*!40000 ALTER TABLE `tb_medicamentos` DISABLE KEYS */;
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
  `IdInstituicao` int(11) NOT NULL,
  PRIMARY KEY (`IdCurso`),
  KEY `FK_Curso_Instituicao` (`IdInstituicao`),
  KEY `fk_instituicao_curso` (`IdInstituicao`),
  CONSTRAINT `FK_Curso_Instituicao` FOREIGN KEY (`IdInstituicao`) REFERENCES `tb_instituicao` (`IdInstituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_curso`
--

LOCK TABLES `tb_curso` WRITE;
/*!40000 ALTER TABLE `tb_curso` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_plano_saude`
--

LOCK TABLES `tb_plano_saude` WRITE;
/*!40000 ALTER TABLE `tb_plano_saude` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
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
  CONSTRAINT `fk_tb_consulta_variavel_queixa_has_tb_medicamentos_tb_consult1` FOREIGN KEY (`IdConsultaVariavel`) REFERENCES `tb_consulta_variavel_queixa` (`IdConsultaVariavel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_consulta_variavel_queixa_has_tb_medicamentos_tb_medicam1` FOREIGN KEY (`IdMedicamento`) REFERENCES `tb_medicamentos` (`IdMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_queixa_medicamentos_tb_acao_queixa1` FOREIGN KEY (`SuspeitaIdAcaoQueixa`) REFERENCES `tb_acao_queixa` (`IdAcaoQueixa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
/*!40000 ALTER TABLE `my_aspnet_schemaversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_usuario` (
  `IdUsuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `Cpf` varchar(11) NOT NULL,
  `NomeUsuario` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Login` varchar(50) NOT NULL DEFAULT '',
  `Senha` varchar(50) NOT NULL,
  `tpUsuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdUsuario`),
  UNIQUE KEY `Cpf_UNIQUE` (`Cpf`),
  UNIQUE KEY `Login_UNIQUE` (`Login`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_relato_clinico`
--

LOCK TABLES `tb_relato_clinico` WRITE;
/*!40000 ALTER TABLE `tb_relato_clinico` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ocupacao`
--

LOCK TABLES `tb_ocupacao` WRITE;
/*!40000 ALTER TABLE `tb_ocupacao` DISABLE KEYS */;
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
  CONSTRAINT `fk_tb_demograficos_antropometricos_tb_escolaridade1` FOREIGN KEY (`IdEscolaridade`) REFERENCES `tb_escolaridade` (`IdEscolaridade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_demograficos_antropometricos_tb_ocupacao1` FOREIGN KEY (`IdOcupacao`) REFERENCES `tb_ocupacao` (`IdOcupacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_demograficos_antropometricos_tb_plano_saude1` FOREIGN KEY (`IdPlanoSaude`) REFERENCES `tb_plano_saude` (`IdPlanoSaude`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_demograficos_antropometricos_tb_consulta_fixo1` FOREIGN KEY (`IdConsultaFixo`) REFERENCES `tb_consulta_fixo` (`IdConsultaFixo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_demograficos_antropometricos`
--

LOCK TABLES `tb_demograficos_antropometricos` WRITE;
/*!40000 ALTER TABLE `tb_demograficos_antropometricos` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
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
  `EstadoPreenchimento` char(1) NOT NULL DEFAULT 'A',
  `EhGabarito` tinyint(1) NOT NULL DEFAULT '0',
  `DataAtualizacao` datetime DEFAULT NULL,
  `ComentariosTutor` text,
  PRIMARY KEY (`IdConsultaFixo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_consulta_fixo`
--

LOCK TABLES `tb_consulta_fixo` WRITE;
/*!40000 ALTER TABLE `tb_consulta_fixo` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sistema`
--

LOCK TABLES `tb_sistema` WRITE;
/*!40000 ALTER TABLE `tb_sistema` DISABLE KEYS */;
INSERT INTO `tb_sistema` VALUES (1,'dente');
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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentoqueixasegunda`
--

LOCK TABLES `medicamentoqueixasegunda` WRITE;
/*!40000 ALTER TABLE `medicamentoqueixasegunda` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentoqueixasegunda` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_resposta`
--

LOCK TABLES `tb_resposta` WRITE;
/*!40000 ALTER TABLE `tb_resposta` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_consulta_variavel`
--

LOCK TABLES `tb_consulta_variavel` WRITE;
/*!40000 ALTER TABLE `tb_consulta_variavel` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=latin1;
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
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_resposta1` FOREIGN KEY (`IdRespostaEsperaTratamento`) REFERENCES `tb_resposta` (`IdResposta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_resposta2` FOREIGN KEY (`IdRespostaPreocupacoes`) REFERENCES `tb_resposta` (`IdResposta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_resposta3` FOREIGN KEY (`IdRespostaGrauEntendimento`) REFERENCES `tb_resposta` (`IdResposta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_resposta4` FOREIGN KEY (`IdRespostaCultural`) REFERENCES `tb_resposta` (`IdResposta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_resposta5` FOREIGN KEY (`IdRespostaComportamento`) REFERENCES `tb_resposta` (`IdResposta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_resposta6` FOREIGN KEY (`IdRespostaIncorporadoPlano`) REFERENCES `tb_resposta` (`IdResposta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_experiencia_medicamentos_tb_consulta_fixo1` FOREIGN KEY (`IdConsultaFixo`) REFERENCES `tb_consulta_fixo` (`IdConsultaFixo`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_acao_queixa`
--

LOCK TABLES `tb_acao_queixa` WRITE;
/*!40000 ALTER TABLE `tb_acao_queixa` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_roles`
--

LOCK TABLES `my_aspnet_roles` WRITE;
/*!40000 ALTER TABLE `my_aspnet_roles` DISABLE KEYS */;
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
  `TipoBebida` char(1) DEFAULT NULL,
  PRIMARY KEY (`IdConsultaFixo`,`IdMedicamento`),
  KEY `fk_tb_diario_pessoal_tb_medicamentos1` (`IdMedicamento`),
  KEY `fk_tb_diario_pessoal_tb_consulta_fixo1` (`IdConsultaFixo`),
  CONSTRAINT `fk_tb_diario_pessoal_tb_medicamentos1` FOREIGN KEY (`IdMedicamento`) REFERENCES `tb_medicamentos` (`IdMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_diario_pessoal_tb_consulta_fixo1` FOREIGN KEY (`IdConsultaFixo`) REFERENCES `tb_consulta_fixo` (`IdConsultaFixo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_diario_pessoal`
--

LOCK TABLES `tb_diario_pessoal` WRITE;
/*!40000 ALTER TABLE `tb_diario_pessoal` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_users`
--

LOCK TABLES `my_aspnet_users` WRITE;
/*!40000 ALTER TABLE `my_aspnet_users` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_alergia`
--

LOCK TABLES `tb_alergia` WRITE;
/*!40000 ALTER TABLE `tb_alergia` DISABLE KEYS */;
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
  `Codigo` varchar(2) NOT NULL,
  `Periodo` varchar(6) NOT NULL,
  `IdDisciplina` int(11) NOT NULL,
  `IdInstituicao` int(11) NOT NULL,
  PRIMARY KEY (`IdTurma`),
  KEY `FK_Instituicao` (`IdInstituicao`),
  CONSTRAINT `FK_Instituicao` FOREIGN KEY (`IdInstituicao`) REFERENCES `tb_instituicao` (`IdInstituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_turma`
--

LOCK TABLES `tb_turma` WRITE;
/*!40000 ALTER TABLE `tb_turma` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_escolaridade`
--

LOCK TABLES `tb_escolaridade` WRITE;
/*!40000 ALTER TABLE `tb_escolaridade` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pergunta`
--

LOCK TABLES `tb_pergunta` WRITE;
/*!40000 ALTER TABLE `tb_pergunta` DISABLE KEYS */;
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
  `Nome` varchar(50) NOT NULL,
  PRIMARY KEY (`IdPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pessoa`
--

LOCK TABLES `tb_pessoa` WRITE;
/*!40000 ALTER TABLE `tb_pessoa` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=latin1;
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

-- Dump completed on 2013-07-20  0:13:45
