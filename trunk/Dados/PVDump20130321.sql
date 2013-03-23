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
INSERT INTO `tb_usuario_turma` VALUES (1,1,1),(1,2,1),(1,3,1),(1,4,1),(1,21,2);
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
  KEY `Index_2` (`fkQueixa`),
  KEY `FK8099C4A73D02FC3D` (`fkQueixa`),
  CONSTRAINT `FK8099C4A73D02FC3D` FOREIGN KEY (`fkQueixa`) REFERENCES `queixa` (`id`),
  CONSTRAINT `FK_medicamentoqueixa_1` FOREIGN KEY (`fkQueixa`) REFERENCES `queixa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentoqueixa`
--

LOCK TABLES `medicamentoqueixa` WRITE;
/*!40000 ALTER TABLE `medicamentoqueixa` DISABLE KEYS */;
INSERT INTO `medicamentoqueixa` VALUES (7,'Losartano/Atenolol/Anlodipino/Hidroclorotiazida','50/50/5/12,5 mg','V','V','2 anos','V','F',14,'V'),(9,'Ciprofibrato','100 mg','V','F','6 meses','V','V',36,'V'),(10,'Anlodipino','5 mg','V','V','2 anos','F','V',37,'V'),(11,'Ciprofibrato','100 mg','V','V','6 meses','V','F',52,'V'),(12,'Sinvastatina/Ezetimiba','20/10 mg','V','V','2 anos e 2 semanas','V','F',52,'V'),(13,'Atenolol','25 mg','F','V','5 anos','V','V',67,'V'),(14,'Enalapril','10 mg','V','V','1 ano','F','V',69,'V'),(15,'Atorvastatina','20 mg','V','V','','V','F',81,'F'),(16,'Sinvastatina','40 mg','F','V','','V','V',97,'V'),(17,'Diltiazem','60 mg','V','V','','V','F',98,'V'),(18,'Insulina NPH','30/18/24 U','F','V','','V','V',101,'V'),(19,'Insulina Humana Regular','12/6/6 U','F','V','','V','V',101,'V'),(20,'Nexium','40 mg','F','V','','V','V',117,'V'),(21,'Amilorida','2,5 mg','V','V','','V','F',132,'V'),(22,'Furosemida','40 mg','V','V','2 meses','V','F',132,'V'),(23,'Glibenclamida','5 mg','F','V','','V','V',133,'V'),(24,'Valsartano/Anlodipino','160/5 mg','F','V','','V','V',163,'V'),(25,'Polivitaminico e mineral','variada','V','V','','F','V',163,'V'),(26,'Insulina NPH ','30/20 U','F','V','04/2008','V','V',165,'V'),(27,'Cafeína/Carisoprodol/Diclofenaco sódico/Paracetamol ','30/125/50/300 mg','F','V','12/2008','V','V',170,'V'),(28,'Insulina','30/ 20 U','F','V','04/2008','V','V',179,'V');
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
INSERT INTO `tb_perfil_usuario` VALUES (1,'Aluno'),(2,'Tutor'),(3,'Professor'),(4,'Responsável Instituição'),(5,'Profissional'),(6,'Administrador Sistema');
/*!40000 ALTER TABLE `tb_perfil_usuario` ENABLE KEYS */;
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
  KEY `FK_respostaprimeira_1` (`fkConsulta`),
  KEY `FK88D8D79A5097F805` (`fkConsulta`),
  CONSTRAINT `FK88D8D79A5097F805` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`),
  CONSTRAINT `FK_respostaprimeira_1` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respostaprimeira`
--

LOCK TABLES `respostaprimeira` WRITE;
/*!40000 ALTER TABLE `respostaprimeira` DISABLE KEYS */;
INSERT INTO `respostaprimeira` VALUES (2,'1',1,'2010-07-03','2005-02-10','medio completo','F','V',NULL,'F',NULL,'F','F','V',NULL,'V','F','F','F','F','F','F','F','M',1,'gdfgd','dgfd','JR','fgfdgdf',1,1,1,1,'1',1,6,'V','sdas','muito boomm',9,'','2-6 copos/semana','2 anos',NULL,'','0-10 cigarros por dia','cerveja'),(4,'não relatou',1.56,'2010-07-07','1949-09-08','superior incompleto','V','V',NULL,'V',NULL,'V','V','F',NULL,'V','F','F','V','V','V','V','V','M',23.9,'Cardiologista e Urologista','Mora com 3 filhos','J. R.','Aposentado',58.2,72,126,36.3,'SUS, Farmácia Popular do Brasil e Farmácia de Manipulação',1,9,'F','A Documentação deverá ser reavaliada no prazo de 5 dias (12/07/2010), revisar os campos:\r\n* Moradia/Família\r\n* Onde adquire seus medicamentos\r\n* Alergias\r\n* Revisão de Sistemas\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 3','A Documentação deverá ser reavaliada no prazo de 5 dias (12/07/2010), revisar os campos:\r\n* Moradia/Família\r\n* Onde adquire seus medicamentos\r\n* Alergias\r\n* Revisão de Sistemas\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 3',8,'','< 2 copos/semana','','2-6 xícaras/dia','não relatou se já fumou',NULL,'não relatou'),(5,'Não',1.68,'2010-07-07','1947-07-14','medio completo','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','V','F','V','V','V','V','M',28.8,'Endocrinologista (M.L.), Cardiologista (J.L.L.B.), Ortopedista (A.D.), Dermatologista (L.S.B.)','Segunda esposa e filho','M.F.F.','Aposentado',81.4,82,152,36.3,'SUS/Hapvida/Farmácia Popular do Brasil e comercial',1,10,'F','A Documentação deverá ser reavaliada no prazo de 5 dias (12/07/2010), revisar os campos:\r\n* Estilo de Vida\r\n* Revisão dos Sistemas\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 2\r\n','A Documentação deverá ser reavaliada no prazo de 5 dias (12/07/2010), revisar os campos:\r\n* Estilo de Vida\r\n* Revisão dos Sistemas\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 2\r\n',0,'',NULL,'','2-6 xícaras/dia','',NULL,NULL),(6,'não',1.56,'2010-07-07','1947-07-10','superior incompleto','V','V',NULL,'V',NULL,'V','V','F',NULL,'V','F','V','F','V','V','V','V','M',25.27,'Cardiologista, Alergologista, Clínico Geral, Gastroenterologista, Urologista e Oncologista ','Casado','M.A.O.','Aposentado pela Fundação Nacional da Saúde',61.5,80,136,36.3,'Tem acesso ao sistema de saúde no Plano Capes Saúde. Adquire os medicamentos na Farmácia Popular do Brasil e comunitária. ',1,11,'V',' A Documentação deverá ser reavaliada no prazo de 5 dias (12/07/2010), revisar o campo:\r\n* Revisão dos Sistemas\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 1',' A Documentação deverá ser reavaliada no prazo de 5 dias (12/07/2010), revisar o campo:\r\n* Revisão dos Sistemas\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 1',9,'','2-6 copos/semana','','2-6 xícaras/dia','',NULL,'Cerveja'),(7,'camarão, azeitona, salsicha, inseticida',1.45,'2010-07-07','1934-06-20','medio completo','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','F','F','V','V','V','V','F',28.06,'Clínico Geral, Cardiologista, Geriatra','Com o irmão','M.A.S.A','Tecnica de Enfermagem',59,81,144,36.3,'SUS/Farmácia Popular do Brasil e comercial',1,12,'V','Documentação realizada com sucesso!\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\n\r\nAtenciosamente\r\n\r\nTutor 2','Documentação realizada com sucesso!\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\n\r\nAtenciosamente\r\n\r\nTutor 2',10,'',NULL,'','2-6 xícaras/dia','',NULL,NULL),(8,'Pioglitazona',1.63,'2010-07-07','1946-08-29','medio completo','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','V','F','V','V','V','V','F',37.37,'Endocrinologista (V.C.), Cardiologista (J.B.R.), Neurologista (R.C.)','Casada, três filhos','E.B.R.','Dona de casa',99.4,70,120,36.3,'Plano de saúde da Petrobrás e adquire os medicamentos na Farmácia Popular do Brasil, comunitária e CASE',1,13,'V','Documentação realizada com sucesso!\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 3','Documentação realizada com sucesso!\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 3',10,'5 anos',NULL,'','< 2 xícaras/dia','20 anos',NULL,NULL),(9,'Antibiotico; AAS; Atorvastatina',1.51,'2010-07-07','1935-03-19','medio completo','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','F','F','V','V','V','V','M',23.3,'cardiologista (A.L.V) e  urologista (W.)','mora com esposa e uma filha','J.J','Aposentado como operador de telecomunicação',53.3,80,140,36.3,'GEAP; Farmácia popular e comunitária',1,14,'V',' A Documentação deverá ser reavaliada no prazo de 5 dias (12/07/2010), revisar o campo:\r\n* Revisão dos Sistemas\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 1',' A Documentação deverá ser reavaliada no prazo de 5 dias (12/07/2010), revisar o campo:\r\n* Revisão dos Sistemas\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 1',9.5,'',NULL,'','< 2 xícaras/dia','',NULL,NULL),(10,'não relatou',1.63,'2010-07-07','1949-09-08','fundamental incompleto','F','F',NULL,'F',NULL,'V','F','F',NULL,'V','F','F','F','F','F','F','F','M',36,'cxbzb','xbzb','J.R. ','bzb',59,70,120,36,'gd',1,15,NULL,NULL,NULL,-1,'',NULL,'',NULL,'',NULL,NULL),(11,'não relatou',1.63,'2010-07-07','1949-09-08','fundamental incompleto','F','F',NULL,'F',NULL,'V','F','F',NULL,'V','F','F','F','F','F','F','F','M',36,'cxbzb','xbzb','J.R. ','bzb',59,70,120,36,'gd',1,16,NULL,NULL,NULL,-1,'',NULL,'',NULL,'',NULL,NULL),(12,'Não relatado',1.56,'2010-07-09','1949-09-08','superior incompleto','V','V',NULL,'V',NULL,'V','V','F',NULL,'V','F','V','F','V','V','V','V','M',23.9,'Cardiologista (I.S.T.) e Urologista (A.)','Mora com esposa e três filhos','J.R.','Aposentado, técnico em eletrônica',58.2,72,126,36.3,'Plano de Sáude: SUS. Adquire os medicamentos na Farmácia Popular do Brasil, no posto de saúde Joaldo Barbosa e na farmácia de manipulação',1,9,'V','Documentação realizada com sucesso!\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 3','Documentação realizada com sucesso!\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 3',9.5,'','< 2 copos/semana','','2-6 xícaras/dia','Não relata se já fumou',NULL,'Não relatado'),(13,'não',1.68,'2010-07-12','1947-07-14','medio completo','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','V','F','V','V','V','V','M',28.8,'Endocrinologista (M.L.), Cardiologista (J.L.L.B.), Ortopedista (A.D.), Dermatologista (L.S.B.). ','Segunda esposa e filho','M.F.F.','Aposentado',81.4,82,152,36.3,'SUS e Hapvida/Farmácia Popular do Brasil e comercial.',1,10,'F','A Documentação deverá ser reavaliada no prazo de 5 dias (12/07/2010), revisar o campo:\r\n* Revisão dos Sistemas\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 2','A Documentação deverá ser reavaliada no prazo de 5 dias (12/07/2010), revisar o campo:\r\n* Revisão dos Sistemas\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 2',9,'',NULL,'','2-6 xícaras/dia','',NULL,NULL),(14,'AAS; Antibiótico; Atorvastatina',1.51,'2010-07-14','1935-03-19','medio completo','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','F','V','V','V','V','V','M',23.3,'Cardiologista (A.L.V) e Urologista (W.)','Mora com uma filha e esposa','J.J','Aposentado',53.3,80,140,36.3,'GEAP; Farmácia Popular do Brasil e Farmácia Comunitária',1,14,NULL,NULL,NULL,-1,'',NULL,'','< 2 xícaras/dia','',NULL,NULL),(15,'Não',1.68,'2010-07-14','1947-07-14','medio completo','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','V','F','V','V','V','V','M',28.8,'Endocrinologista (M.L.), Cardiologista (J.L.L.B.), Ortopedista (A.D.), Dermatologista (L.S.B.)','Segunda esposa e filho','M.F.F.','Aposentado',81.4,82,152,36.3,'SUS e Hapvida/Farmácia Popular do Brasil e comercial',1,10,'V',' A Documentação não foi realizada corretamente, observar campo:\r\n* Revisão dos Sistemas\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 2',' A Documentação não foi realizada corretamente, observar campo:\r\n* Revisão dos Sistemas\r\nAnálise do caso e intervenção serão realizadas dia 14/07/2010 durante o horário da disciplina no Laboratório de Ensino e Pesquisa em Farmácia Social - LEPFS (Grupo 1, 2 e 3) e no Laboratório de Informática - INES (Grupos 4,5 e 6).\r\nAtenciosamente\r\nTutor 2',9,'',NULL,'','2-6 xícaras/dia','',NULL,NULL),(16,'NÃO',1.56,'2010-07-14','1947-07-10','superior incompleto','V','V',NULL,'V',NULL,'V','V','F',NULL,'V','F','F','F','V','V','V','V','M',25.31,'Cardiologista (M.R.), Alergologista e Clínico Geral (V.), Gastroenterologista (S.B.), Urologista (L.), Oncologista (A.C.).','CASADO','M.A.O. ','Aposentado pela Fundação Nacional de Saúde',61.5,80,136,36.3,'Plano Capes Saúde. Adquire os medicamentos na Farmácia Popular do Brasil e comunitária.',1,11,NULL,NULL,NULL,-1,'','2-6 copos/semana','','2-6 xícaras/dia','',NULL,'CERVEJA');
/*!40000 ALTER TABLE `respostaprimeira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_disciplina_curso`
--

DROP TABLE IF EXISTS `tb_disciplina_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_disciplina_curso` (
  `IdDisciplina` int(11) NOT NULL,
  `IdCurso` varchar(45) NOT NULL,
  PRIMARY KEY (`IdDisciplina`,`IdCurso`),
  KEY `FK_Disciplina` (`IdDisciplina`),
  CONSTRAINT `FK_Disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `tb_disciplina` (`iddisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_disciplina_curso`
--

LOCK TABLES `tb_disciplina_curso` WRITE;
/*!40000 ALTER TABLE `tb_disciplina_curso` DISABLE KEYS */;
INSERT INTO `tb_disciplina_curso` VALUES (1,'1'),(2,'1'),(3,'1'),(4,'1'),(5,'1'),(6,'1'),(7,'1');
/*!40000 ALTER TABLE `tb_disciplina_curso` ENABLE KEYS */;
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
-- Table structure for table `tb_turma`
--

DROP TABLE IF EXISTS `tb_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_turma` (
  `IdTurma` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(2) DEFAULT NULL,
  `Periodo` varchar(6) DEFAULT NULL,
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
INSERT INTO `tb_turma` VALUES (1,'A0','2010.1',1,1);
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
-- Table structure for table `respostaquarta`
--

DROP TABLE IF EXISTS `respostaquarta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respostaquarta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataRealizacao` date NOT NULL DEFAULT '0000-00-00',
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
INSERT INTO `intervencao` VALUES (8,'Orientação sobre modificação do estilo de vida',1,9,3),(9,'Orientação prática sobre o uso do medicamento prescrito',2,3,3),(10,'Orientação sobre modificação do estilo de vida',2,9,3),(11,'Orientação para procurar outro profissional de saúde',2,10,3),(16,'Orientação sobre modificação do estilo de vida',1,9,5),(17,'Outras orientações necessárias',1,11,5),(18,'Orientação prática sobre o uso do medicamento prescrito',2,3,5),(19,'Orientação sobre a doença',2,7,5),(20,'Orientação sobre modificação do estilo de vida',2,9,5),(21,'Orientação sobre as dúvidas relativas à administração do medicamento',1,2,6),(22,'Orientação prática sobre o uso do medicamento prescrito',1,3,6),(23,'Orientação sobre o armazenamento dos medicamentos',1,6,6),(24,'Orientação sobre educação sanitária',1,8,6),(25,'Orientação sobre modificação do estilo de vida',1,9,6),(26,'Orientação para procurar outro profissional de saúde',1,10,6),(27,'Outras orientações necessárias',1,11,6),(28,'Orientação sobre a indicação de um novo medicamento prescrito',2,1,6),(29,'Orientação prática sobre o uso do medicamento prescrito',2,3,6),(30,'Orientação sobre modificação do estilo de vida',2,9,6),(31,'Orientação para procurar outro profissional de saúde',2,10,6),(32,'Outras orientações necessárias',2,11,6),(33,'Orientação prática sobre o uso do medicamento prescrito',1,3,7),(34,'Orientação sobre o armazenamento dos medicamentos',1,6,7),(35,'Orientação sobre a doença',1,7,7),(36,'Orientação sobre educação sanitária',1,8,7),(37,'Orientação sobre modificação do estilo de vida',1,9,7),(38,'Orientação para procurar outro profissional de saúde',1,10,7),(39,'Outras orientações necessárias',1,11,7),(40,'Orientação prática sobre o uso do medicamento prescrito',2,3,7),(41,'Orientação sobre modificação do estilo de vida',2,9,7),(42,'Orientação para procurar outro profissional de saúde',2,10,7),(43,'Outras orientações necessárias',2,11,7),(44,'Orientação prática sobre o uso do medicamento prescrito',1,3,8),(45,'Orientação sobre a doença',1,7,8),(46,'Orientação sobre educação sanitária',1,8,8),(47,'Orientação sobre modificação do estilo de vida',1,9,8),(48,'Outras orientações necessárias',1,11,8),(49,'Orientação sobre a indicação de um novo medicamento prescrito',2,1,8),(50,'Orientação sobre a doença',2,7,8),(51,'Orientação prática sobre o uso do medicamento prescrito',1,3,9),(52,'Orientação sobre o armazenamento dos medicamentos',1,6,9),(53,'Orientação sobre a doença',1,7,9),(54,'Orientação sobre educação sanitária',1,8,9),(55,'Orientação sobre modificação do estilo de vida',1,9,9),(56,'Orientação para procurar outro profissional de saúde',1,10,9),(57,'Outras orientações necessárias',1,11,9),(58,'Orientação prática sobre o uso do medicamento prescrito',2,3,9),(59,'Orientação sobre a doença',2,7,9),(60,'Orientação sobre modificação do estilo de vida',2,9,9),(61,'Orientação para procurar outro profissional de saúde',2,10,9),(62,'Outras orientações necessárias',2,11,9);
/*!40000 ALTER TABLE `intervencao` ENABLE KEYS */;
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
INSERT INTO `queixa` VALUES (7,'Hiperlipidemia',1,-1,3,'V','',2),(8,'Hipertensão',1,-1,3,'V','35 anos',1),(9,'Diabetes',1,-1,3,'V','2008',3),(10,'Impotência',1,-1,3,'V','',4),(11,'Diminuição do desejo sexual',1,-1,3,'V','',5),(12,'Perda de memória',1,-1,3,'V','',6),(13,'Hiperlipidemia',2,-1,3,'V','',2),(14,'Hipertensão',2,7,3,'V','35 ano',1),(15,'Diabetes',2,-1,3,'V','2008',3),(16,'Impotência',2,-1,3,'V','',4),(17,'Diminuição do desejo sexual',2,-1,3,'V','',5),(18,'Perda de memória',2,-1,3,'V','',6),(31,'Dor',1,-1,5,'V','',3),(32,'Edema',1,-1,5,'V','',2),(33,'Alterações visuais',1,-1,5,'V','',7),(34,'Diminuição da audição',1,-1,5,'V','',8),(35,'Rinite alergica',1,-1,5,'V','',9),(36,'Hiperlipidemia',1,1,5,'V','',4),(37,'Hipertensão',1,5,5,'V','2 anos',1),(38,'Falta de ar',1,-1,5,'V','',10),(39,'Queimacao',1,2,5,'V','',2),(40,'Anemia',1,-1,5,'V','',11),(41,'Dor nas costas',1,-1,5,'V','',5),(42,'Parestesia',1,-1,5,'V','',6),(43,'Perda de equilíbrio',1,-1,5,'V','',12),(44,'Depressão',1,-1,5,'V','',13),(45,'Ansiedade',1,-1,5,'V','',14),(46,'Perda de memória',1,-1,5,'V','',15),(47,'Dor',2,-1,5,'V','',3),(48,'Edema',2,-1,5,'V','',2),(49,'Alterações visuais',2,1,5,'V','',7),(50,'Diminuição da audição',2,-1,5,'V','',8),(51,'Rinite alergica',2,-1,5,'V','',9),(52,'Hiperlipidemia',2,7,5,'V','',4),(53,'Hipertensão',2,-1,5,'V','2 anos',1),(54,'Falta de ar',2,-1,5,'V','',10),(55,'Queimacao',2,2,5,'V','',2),(56,'Anemia',2,-1,5,'V','',11),(57,'Dor nas costas',2,-1,5,'V','',5),(58,'Parestesia',2,-1,5,'V','',6),(59,'Perda de equilíbrio',2,-1,5,'V','',12),(60,'Depressão',2,-1,5,'V','',13),(61,'Ansiedade',2,-1,5,'V','',14),(62,'Perda de memória',2,-1,5,'V','',15),(63,'Dor',1,-1,6,'V','',1),(64,'Alterações visuais',1,-1,6,'V','',14),(65,'Glaucoma',1,-1,6,'V','',4),(66,'Hiperlipidemia',1,-1,6,'V','',3),(67,'Hipertensão',1,4,6,'V','15 anos',2),(68,'Infarto do miocárdio',1,-1,6,'V','',6),(69,'Queimacao',1,5,6,'V','',5),(70,'Diarreia',1,-1,6,'V','',14),(71,'Impotência',1,-1,6,'V','',8),(72,'Diminuição do desejo sexual',1,-1,6,'V','',9),(73,'Dor nas costas',1,-1,6,'V','',7),(74,'Tendinite',1,-1,6,'V','',11),(75,'Dor muscular',1,-1,6,'V','',10),(76,'Perda de equilíbrio',1,-1,6,'V','',12),(77,'Perda de memória',1,-1,6,'V','',13),(78,'Dor',2,-1,6,'V','',1),(79,'Alterações visuais',2,-1,6,'V','',13),(80,'Glaucoma',2,-1,6,'V','',4),(81,'Hiperlipidemia',2,7,6,'V','',3),(82,'Hipertensão',2,-1,6,'V','15 anos',2),(83,'Infarto do miocárdio',2,-1,6,'V','',6),(84,'Impotência',2,-1,6,'V','',6),(85,'Diminuição do desejo sexual',2,-1,6,'V','',7),(86,'Dor nas costas',2,-1,6,'V','',5),(87,'Tendinite',2,-1,6,'V','',8),(88,'Dor muscular',2,-1,6,'V','',9),(89,'Perda de equilíbrio',2,-1,6,'V','',10),(90,'Perda de memória',2,-1,6,'V','',11),(91,'Alteração de peso',1,1,7,'V','',4),(92,'Dor',1,-1,7,'V','',8),(93,'Tonteira',1,-1,7,'V','',13),(94,'Edema',1,-1,7,'V','',9),(95,'Alterações visuais',1,-1,7,'V','',14),(96,'Dor no peito',1,-1,7,'V','',15),(97,'Hiperlipidemia',1,4,7,'V','',3),(98,'Hipertensão',1,7,7,'V','',2),(99,'Queimacao',1,-1,7,'V','',5),(100,'Náusea',1,-1,7,'V','',16),(101,'Diabetes',1,3,7,'V','',1),(102,'Dor nas costas',1,-1,7,'V','',10),(103,'Artrite',1,-1,7,'V','',11),(104,'Tendinite',1,-1,7,'V','',12),(105,'Parestesia',1,-1,7,'V','',17),(106,'Perda de equilíbrio',1,-1,7,'V','',18),(107,'Depressão',1,-1,7,'V','',6),(108,'Ansiedade',1,-1,7,'V','',7),(109,'Alteração de peso',2,-1,7,'V','',0),(110,'Dor',2,-1,7,'V','',0),(111,'Tonteira',2,-1,7,'V','',0),(112,'Edema',2,-1,7,'V','',0),(113,'Alterações visuais',2,-1,7,'V','',0),(114,'Dor no peito',2,-1,7,'V','',0),(115,'Hiperlipidemia',2,-1,7,'V','',0),(116,'Hipertensão',2,-1,7,'V','',0),(117,'Queimacao',2,5,7,'V','',0),(118,'Náusea',2,-1,7,'V','',0),(119,'Diabetes',2,3,7,'V','',0),(120,'Dor nas costas',2,-1,7,'V','',0),(121,'Artrite',2,-1,7,'V','',0),(122,'Tendinite',2,-1,7,'V','',0),(123,'Parestesia',2,-1,7,'V','',0),(124,'Perda de equilíbrio',2,-1,7,'V','',0),(125,'Depressão',2,-1,7,'V','',0),(126,'Ansiedade',2,-1,7,'V','',0),(127,'Alteração de peso',1,-1,8,'V','',8),(128,'Dor',1,-1,8,'V','',9),(129,'Tonteira',1,-1,8,'V','',10),(130,'Zumbido no ouvido',1,-1,8,'V','',11),(131,'Dor no peito',1,-1,8,'V','',3),(132,'Hipertensão',1,4,8,'V','',1),(133,'Diabetes',1,3,8,'V','13 anos',2),(134,'Frequência urinária',1,1,8,'V','',6),(135,'Dismenorreia',1,-1,8,'V','',12),(136,'Incontinência',1,-1,8,'V','',7),(137,'Diminuição do desejo sexual',1,-1,8,'V','',13),(138,'Formação excessiva de hematomas',1,-1,8,'V','',14),(139,'Dor nas costas',1,-1,8,'V','',4),(140,'Tendinite',1,-1,8,'V','',5),(141,'Parestesia',1,-1,8,'V','',15),(142,'Perda de equilíbrio',1,-1,8,'V','',16),(143,'Perda de memória',1,-1,8,'V','',17),(144,'Alteração de peso',2,-1,8,'V','',8),(145,'Dor',2,-1,8,'V','',9),(146,'Tonteira',2,-1,8,'V','',10),(147,'Zumbido no ouvido',2,-1,8,'V','',11),(148,'Dor no peito',2,-1,8,'V','',3),(149,'Hipertensão',2,-1,8,'V','',1),(150,'Diabetes',2,-1,8,'V','',2),(151,'Frequência urinária',2,-1,8,'V','',6),(152,'Dismenorreia',2,-1,8,'V','',12),(153,'Incontinência',2,-1,8,'V','',7),(154,'Diminuição do desejo sexual',2,-1,8,'V','',13),(155,'Formação excessiva de hematomas',2,-1,8,'V','',14),(156,'Dor nas costas',2,-1,8,'V','',4),(157,'Tendinite',2,-1,8,'V','',5),(158,'Parestesia',2,-1,8,'V','',15),(159,'Perda de equilíbrio',2,-1,8,'V','',16),(160,'Perda de memória',2,-1,8,'V','',17),(161,'Dor',1,3,9,'V','',1),(162,'Edema',1,-1,9,'V','',2),(163,'Hipertensão',1,2,9,'V','15 anos',4),(164,'Queimacao',1,-1,9,'V','',8),(165,'Diabetes',1,4,9,'V','15 anos ',5),(166,'Frequência urinária',1,2,9,'V','',6),(167,'Impotência',1,-1,9,'V','',9),(168,'Diminuição do desejo sexual',1,-1,9,'V','',10),(169,'Hemorragia',1,-1,9,'V','',11),(170,'Dor nas costas',1,3,9,'V','',3),(171,'Dor muscular',1,-1,9,'V','',7),(172,'Tremor',1,-1,9,'V','',12),(173,'Perda de memória',1,-1,9,'V','',13),(174,'Eczema',1,-1,9,'V','',14),(175,'Dor',2,-1,9,'','',1),(176,'Edema',2,-1,9,'','',2),(177,'Hipertensão',2,-1,9,'','15 anos',4),(178,'Queimacao',2,-1,9,'','',8),(179,'Diabetes',2,-1,9,'','15 anos',5),(180,'Impotência',2,-1,9,'','',6),(181,'Diminuição do desejo sexual',2,1,9,'','',9),(182,'Hemorragia',2,-1,9,'','',10),(183,'Dor nas costas',2,-1,9,'','',11),(184,'Dor muscular',2,-1,9,'','',3),(185,'Tremor',2,-1,9,'','',7),(186,'Perda de memória',2,-1,9,'','',12),(187,'Eczema',2,-1,9,'','',13);
/*!40000 ALTER TABLE `queixa` ENABLE KEYS */;
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
INSERT INTO `casoclinico` VALUES (3,'Captopril, Hidroclorotiazida, Propranolol ',1.56,'1949-09-08 00:00:00','V','superior incompleto','V','V','F','M','Cardiologista e Urologista','Casado, mora com 3 filhos','J.R.','Aposentado',58.2,'SUS. Adquire os medicamentos no Posto de saúde Joaldo Barbosa, na Farmácia Popular do Brasil e em farmácia de manipulação',72,126,'Atendimento: 02/2009\r\n\r\nIdentificação, História Clínica e Estilo de Vida:\r\nJ.R. homem, branco, data de nascimento 08/09/1949, casado, tem 5 filhos, mora com 3 deles, é aposentado, técnico em eletrônica, cursou ensino superior incompleto em Engenharia Química. O atendimento no sistema de saúde é pelo SUS. Adquire os medicamentos no Posto de saúde Joaldo Barbosa, na Farmácia Popular do Brasil e em farmácia de manipulação. Os médicos que o acompanham são: Cardiologista (I.S.T.) e Urologista (A.). Altura 1,56 m, Peso 58,2 Kg, Circunferência da cintura 90 cm, não fuma, bebe café de 2-6 xícaras por dia, bebe álcool menos de dois copos por semana.\r\nO paciente apresenta Hiperlipidemia, Hipertensão Aterial Sistêmica (HAS) diagnosticada há 35 anos e Pré-Diabetes desde 2008. Na revisão dos sistemas e da história pessoal, informou ter: impotência sexual, diminuição do desejo sexual, perda de memória e fraqueza há 10 anos. Anda de bicicleta 15 minutos/2 vezes na semana, na alimentação reduz o sal e gordura. As vezes deixa de tomar o medicamento por causa da impotência. Não gosta que corte alimentos da sua dieta, prefere reduzir e moderar na alimentação diária. Quando acha que está normal deixa de tomar seus medicamentos. Relata que no passado teve reação adversa ao Captopril, Hidroclorotiazida, Propranolol sentia sensação de desmaio e quando fazia exercício físico sentia tontura. Na história familiar o pai e a mãe são hipertensos, todo os irmãos (10) tem HAS, ninguém tem diabetes. O medicamento atual para pressão toma a 2 anos.\r\n\r\nControle da PA:\r\nNo dia do atendimento, apresentou PA (em mmHg): 126/72','Caso clínico - evolução:\r\nPaciente relata que viajou no final de semana e esqueceu de levar os medicamentos, quando foi aferir a pressão o valor foi 170/10 mmHg.\r\nO médico solicitou exame da tireóide e está tudo normal, suspendeu o uso do polivitamínico, mas o paciente disse que deseja tomar. Está andando de bicicleta 40 minutos/3 vezes por semana.\r\nRefere está com problema na vista, tem óculos, mas não usa.\r\n\r\n',36.3,'','< 2 copos/semana','','2-6 xícaras/dia','',NULL,58.7,68,112,36.3,''),(5,'não tem alergia',1.56,'1947-07-10 00:00:00','V','superior incompleto','V','V','F','M','Cardiologista, Alergologista e Clínico Geral, Gastroenterologista, Urologista, Oncologista','esposa','M.A.O.','aposentado pela Fundação Nacional de Saúde',61.5,'Capes saúde, Farmácia Popular do Brasil e comunitária',80,136,'Identificação, História Clínica e Estilo de vida:\r\nM.A.O. homem, branco, data de nascimento 10/07/1947, casado, é aposentado pela Fundação Nacional de Saúde, cursou um ano de contabilidade. Tem acesso ao sistema de saúde no Plano Capes Saúde. Adquire os medicamentos na Farmácia Popular do Brasil e comunitária. Os médicos que o acompanham são: Cardiologista (M.R.), Alergologista e Clínico Geral (V.), Gastroenterologista (S.B.), Urologista (L.), Oncologista (A.C.). Altura 1,56 m, Peso 61,5 Kg, Circunferência da cintura 90 cm, não fuma, bebe café de 2-6 xícaras por dia, toma chá de cidreira e boldo, bebe cerveja no final de semana (não diz ao médico), porém antes bebia muito e parou quando tinha 51 anos.\r\nO paciente apresenta Hiperlipidemia, Hipertensão Aterial Sistêmica (HAS) diagnosticada há 2 anos. Na revisão dos sistemas e da história pessoal, informou ter: dor, edema nas duas pernas, alterações visuais no olho direito, diminuição da audição, rinite alérgica, falta de ar, queimação, anemia, dor nas costas, aumento da freqüência urinária, parestesias nas mãos, perda de equilíbrio, depressão, refluxo, ansiedade/nervosismo, perda de memória, tontura há 3 meses. Faz caminhada durante 50 minutos/3 vezes por semana, na alimentação reduz o sal e carne gorda, gosta de frutas, verduras (cebola, tomate, cenoura, beterraba). Relata que às vezes esquece de tomar os medicamentos. Relata não ter alergia a medicamento. Espera melhorar o tratamento medicamentoso, mas às vezes não sente melhora. Já fez cirurgia de hérnia, nódulo na garganta, retirou um sinal no rosto (início de câncer). Usa prótese no ouvido, já teve pedra no rim, e catarata nos dois olhos. Já foi para a urgência três vezes por causa do refluxo. Dizem que seu pai morreu de problema no coração, todos os irmãos (5) tem HAS.\r\nRefere usar a Sinvastatina/Ezetimiba há 2 anos e 2 semanas, o Ciprofibrato há 6 meses e o Anlodipino há 2 anos.\r\n\r\nControle da PA:\r\nNo dia do atendimento, apresentou PA (em mmHg): 136/80','Caso clínico - evolução:\r\nPaciente relata não tomar os medicamentos para a hiperlipidemia há 2 semanas, o médico prescreveu o ciprofibrato 2ª, 4ª e 6ª. Relata não fazer atividade física por causa da chuva.\r\n',36.3,'','','','2-6 xícaras/dia','',NULL,64,74,128,36.3,''),(6,'antibiótico (desmaio) e AAS (suspeita de sangramento) e Atorvastatina',1.51,'1935-03-19 00:00:00','V','medio completo','F','V','F','M','Cardiologista e Urologista','casado, tem 2 filhos, mora com uma filha','J.J.','Aposentado',53.3,'GEAP. Farmácia Popular do Brasil e comunitária',80,140,'Atendimento: 03/2009\r\n\r\nIdentificação, História Clínica e Estilo de vida:\r\n\r\nJ.J. homem, branco, data de nascimento 19/03/1935, casado, tem 2 filhos, mora com uma filha, é aposentado como operador de telecomunicação. Tem acesso ao sistema de saúde pela GEAP. Adquire os medicamentos na Farmácia Popular do Brasil e comunitária. Os médicos que o acompanham são: Cardiologista (A.L.V.) e Urologista (W.). Altura 1,51 m, Peso 53,3 Kg, Circunferência da cintura 81 cm, não bebe, não fuma, bebe café menos que duas xícaras por dia. \r\nO paciente apresenta Hiperlipidemia, Hipertensão Aterial Sistêmica (HAS) diagnosticada há 15 anos. Na revisão dos sistemas e da história pessoal, informou ter: dor nos ombros (incomoda muito), alterações visuais ás vezes, glaucoma, infarto do miocárdio, queimação, diarréia quando come manga, impotência, diminuição do desejo sexual, dor nas costas (bico de papagaio), tendinites (ombros), dor muscular (panturrilha), pouco de perda de memória, às vezes perda de equilíbrio. Relata que toma somente quando o médico prescreve e tem esperança de melhorar, antes tomava por conta própria, agora parou. Refere alergia a antibiótico (desmaio) e AAS (suspeita de sangramento) e Atorvastatina (deixou de usar a 3 meses). Já fez cirurgia de safena há 13 anos e da próstata devido a dificuldade de urinar. Sua mãe morreu de HAS, tem 12 irmãos, todos hipertensos inclusive a filha. Relata que reduz bastante a quantidade de sal da alimentação, gordura come às vezes, gosta de jaca, manga e mamão. Não gosta de verdura, como por insistência. Caminha cerca de 3 a 4 vezes na semana. Gosta de chá de cidreira, boldo, capim-santo. Faz uso do Enalapril há 1 ano, do Atenolol há 5 anos, Latanoprost há 10 anos, Omeprazol há 3 anos.\r\n\r\nControle da PA:\r\nNo dia do atendimento, apresentou PA (em mmHg): 140/80','Gostava de charque e bacalhau. Adora comida salgada e doce, mas está controlando hoje em dia. Está com dor no braço esquerdo e perda esquerda (na última semana incomodou muito).\r\nO médico suspendeu o Enalapril devido ao desconforto gastrointestinal, constipação e garganta seca. Acrescentou Losartana 50 mg, 1 comprimido às 8h, Atorvastatina 20 mg 1 vez ao dia e Clopidogrel. Porém ainda não começou a usar os dois últimos.\r\n',36.3,'',NULL,'','< 2 xícaras/dia','',NULL,53,70,124,36.3,NULL),(7,'Pioglitazona (aumento de arritmias)',1.63,'1946-08-29 00:00:00','V','medio completo','F','V','F','F','Endocrinologista, Cardiologista e Neurologista','é casada, e tem 3 filhos','E.B.R.','dona de casa',99.4,'Petrobrás. Farmácia Popular do Brasil, comunitária e CASE',70,120,'Atendimento: 03/2009\r\n\r\nIdentificação, História Clínica e Estilo de vida:\r\nE.B.R., mulher, branca, data de nascimento 29/08/1946, casada, tem 3 filhos, é dona de casa, cursou até o segundo grau completo. Tem acesso ao sistema de saúde no Plano da Petrobrás. Adquire os medicamentos na Farmácia Popular do Brasil, comunitária e CASE. Os médicos que a acompanham são: Endocrinologista (V.C.), Cardiologista (J.B.R.), Neurologista (R.C.). Altura 1,63, Peso 99,4 Kg, Circunferência da cintura 115 cm, não fuma (parou há 20 anos), bebe café menos de duas xícaras por dia, não faz consumo de bebida alcoólica (parou há 5 anos). \r\nA paciente apresenta Hipertensão Arterial Sistêmica (HAS), Diabetes e Hiperlipidemia.\r\nNa revisão dos sistemas e da história pessoal, informou ter: alteração de peso, dor na perna esquerda, tonteira (vertigem), edema nas pernas, alterações visuais, um pouco de dor no peito, queimação, náusea, dor nas costas, artrose, tendinite no braço esquerda, parestesia (mão e pé), perda de equilíbrio, depressão, ansiedade e tristeza. Relata fica muito triste porque fica muito em casa, queria fazer um curso na faculdade, mas agora só tem Educação Física e ela não pode. O marido sai e deixa-a sozinha em casa. Relata fazer hidroginástica todos os dias. Na alimentação usa adoçante, banana, manga, pouco sal, pouca gordura, verduras, se alimenta 6 vezes por dia, usa chá de camomila, chá verde e cidreira. Diz seguir a prescrição médica, mas quando está fora de casa deixa de tomar a insulina. Relata ter alergia a Pioglitazona (aumento de arritmias). Tem dificuldade para caminhar, usa bengala. Relata ter usado vários tipos de insulina e não tem efeito, ?no começo tem efeito depois perde?. Toda a família tem diabetes, o pai e a mãe faleceram de diabetes, tem 6 irmãos, apenas 1 é vivo. Já fez 4 cateterismo há uns 3 ou 4 anos atrás.\r\n\r\nControle da PA:\r\nNo dia do atendimento, apresentou PA (em mmHg): 120/70, Glicemia capilar 197 mg/dL.','Paciente relata está com dor no estômago, furúnculo nas costas (interrompeu a hidroginástica) e dor na garganta (incomoda muito, está com dificuldade para engolir).\r\nA paciente apresentou prurido após uso de Esomeprazol 40 mg, médico suspendeu e trocou por Lansoprazol 30 mg, depois conseguiu trocar com a médica por Omeprazol (porque tem na Farmácia Popular do Brasil).\r\nA médica mandou tomar o Diltiazem 3 vezes por dia.\r\nSuspendeu a Sinvastatina de 40 mg por Atorvastatina 20 mg\r\nMarcou o nutricionista.\r\nFazendo aula de dança 1 vez por semana.\r\nMédica prescreveu Insulina Asparte (ultra-rápida) de acordo com o esquema: se preciso antes do café, almoço e jantar\r\n< 140 -> não precisa\r\n140 ? 200 mg/dL -> 2 U\r\n201 ? 250 mg/dL -> 4 U\r\n251 ? 300 mg/dL -> 6 U\r\n301 ? 350 mg/dL -> 8 U\r\n351 ? 400 mg/dL -> 10 U\r\n> 400 mg/dL -> 12 U\r\n',36.3,'5 anos',NULL,'','< 2 xícaras/dia','20 anos',NULL,101.8,65,115,36.3,NULL),(8,'camarão, azeitona, salsicha e inseticida',1.45,'1934-06-20 00:00:00','V','medio completo','F','V','F','F','Clínico Geral, Cardiologista e Geriatra','solteira, mora com 1 irmão','M.A.S.A.','Técnica de Enfermagem',59,'SUS. Farmácia Popular do Brasil e comercial',81,144,'Atendimento: 02/2009\r\n\r\nIdentificação, História Clínica e Estilo de vida:\r\nM.A.S.A., mulher, branca, data de nascimento 20/06/1934, solteira, mora com 1 irmão, é técnica de enfermagem. Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil e comercial. Os médicos que a acompanham são: Clínico Geral (J.M.), Cardiologista (F.P.), Geriatra (W.). Altura 1,45 m, Peso 59 Kg, Circunferência da cintura 97 cm, não fuma, não consome bebida alcoólica, bebe café 2 a 6 xícaras por dia. \r\nA paciente apresenta Hipertensão Arterial Sistêmica (HAS) e Diabetes desde 1996. Na revisão dos sistemas e da história pessoal innformou ter: alteração de peso, dor, tonteira, zumbido no ouvido, dor no peito (angina), tosse seca, alteração na freqüência urinária, dismenorréia, incontinência urinária, diminuição do desejo sexual, formação excessiva de hematomas, dor nas costas, tendinites, parestesia, perda de equilíbrio, perda de memória. Relata que deseja fica boa, mas não fica, tem preocupação na quantidade de medicamentos, entende e lembra de usar (definiu os horários em uma tabela particular). Tem alergia a camarão, azeitona, salsicha e inseticida. Usa muleta. Já teve início de AVC (derrame facial 12/2008). Teve labirintite severa, hoje não tem mais, usou muitos medicamentos (última crise há 1 ano, por isso usa bengala). Ficou internada 12/2008 por 11 dias devido a HAS e diabetes, descobriu pedra nos rins (toma chá), e plaquetopenia. Já fez cirurgia de catarata há 10 anos, nos dois olhos. Cuida muito da alimentação, não come açúcar, o mínimo de sal e gordura, agora cuida direito comendo frutas. Usa chás todos os dias: de abacate, quebra-pedra e de boldo. Faz 45 minutos de caminhada em dias alternados. Canta na pastoral. Tem OSAF ?pra não dá trabalho a ninguém?. Esta esperando ser atendida pelo Endocrinologista no SUS. Relata que não quer usar insulina e que a última consulta com o Ginecologista tem 6 anos.\r\n\r\nControle da PA:\r\nNo dia do atendimento, apresentou PA (em mmHg): 144/81, Glicemia capilar 205 mg/dL.','Caso clínico - evolução:\r\nPaciente relata que o médico substituiu o Captopril e Furosemida por Enalapril 10 mg (1 comprimido de 12/12h) e Anlodipino 5 mg (1 comprimido a noite).\r\nO médico substituiu a associação de Hidroclorotiazida/Amilorida por Hidroclorotiazida puro.\r\n05/2009 ? HbA1c -> 5%\r\nFoi diagnosticada com litíase biliar e cálculo renal.\r\n',36.3,'',NULL,'','2-6 xícaras/dia','',NULL,62.15,70,125,36.3,NULL),(9,'Não apresenta',1.68,'1947-07-14 00:00:00','V','medio completo','V','V','F','M','Endocrinologista, Cardiologista, Ortopedista, Dermatologista','Divorciado, mora com a segunda esposa e o filho','M.F.F.','Aposentado como representante comercial, técnico em contabilidade',81.4,'SUS e Hapvida. Farmácia Popular do Brasil e comercial',82,152,'Atendimento: 02/2009\r\n\r\nIdentificação, História Clínica e Estilo de vida:\r\nM.F.F., homem, branca, data de nascimento 14/07/1947, divorciado, mora com a segunda esposa e o filho, é aposentado como representante comercial, técnico em contabilidade. Tem acesso ao sistema de saúde pelo SUS e Hapvida. Adquire seus medicamentos na Farmácia Popular do Brasil e comercial. Os médicos que o acompanham são: Endocrinologista (M.L.), Cardiologista (J.L.L.B.), Ortopedista (A.D.), Dermatologista (L.S.B.). Altura 1,68 m, Peso 81,4 Kg, Circunferência da cintura 104 cm, não fuma, bebe café de 2 a 6 xícaras por dia (manhã e noite), toma menos de 2 copos de cerveja sem álcool por semana. \r\nO paciente apresenta Diabetes e Hipertensão Arterial Sistêmica (HAS) há 15 anos. Na revisão dos sistemas e da história pessoal informou ter: dor nos membros inferiores e na bexiga, edema nas duas pernas, queimação nas pernas, alteração na freqüência urinária, impotência, diminuição do desejo sexual, hemorragia, dor nas costas devido a hérnia (bico de papagaio), dor muscular na perna esquerda, tremor no braço esquerdo, perda de memória, eczema/psoríase. O que mais incomoda é a perna. Relata não ter alergia a nenhum medicamento. Já fez um cateterismo em 1996 devido ao um prolapso mitral, operou de apêndice, hérnia inguinal e amídala. Devido ao descontrole da pressão ficou internado 7 dias. Na alimentação evita sal e gordura, come carne grelhada, usa adoçante, adorava caldo de cana, gosta de frutas. Há 1 ano está sem fazer exercício devido a hérnia na coluna. Adora chá de cidreira e raramente toma chá de capim-santo. Relata que os pais são diabéticos e hipertensos, dos 7 irmãos apenas 1 tem (diabetes e HAS).\r\n\r\nControle da PA:\r\nNo dia do atendimento, apresentou PA (em mmHg): 152/82, Glicemia capilar 221 mg/dL.\r\n','Caso clínico - evolução:\r\nTrês dias depois do atendimento o Endocrinologista suspendeu a Metformina.\r\nJá fez algumas sessões de acupuntura e melhorou pouco, não está fazendo hidroginástica, porque foi ao Cardiologista e ele proibiu atividade física (sugestivo de isquemia no coração).\r\nRelata que às vezes esquece de tomar a dose da insulina da tarde, porque trabalha e quando chega em casa não toma mais.\r\nMédica prescreveu Dutasterida 0,5 mg 1 comprimido ao dia. O paciente teve melhora no fluxo urinário, redução dos sintomas de urgência e alívio da dificuldade de micção. \r\nSuspendeu o Polivitamínico e mineral pelo medicamento com vitamina B1 300 mg\r\n',36.3,'','< 2 copos/semana','','2-6 xícaras/dia','',NULL,84.4,75,145,36.3,'Cerveja sem álcool');
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
  KEY `FK_queixarespostaprimeira_1` (`fkResposta`),
  KEY `FK1E43344B8872A0F6` (`fkResposta`),
  CONSTRAINT `FK1E43344B8872A0F6` FOREIGN KEY (`fkResposta`) REFERENCES `respostaprimeira` (`id`),
  CONSTRAINT `FK_queixarespostaprimeira_1` FOREIGN KEY (`fkResposta`) REFERENCES `respostaprimeira` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queixarespostaprimeira`
--

LOCK TABLES `queixarespostaprimeira` WRITE;
/*!40000 ALTER TABLE `queixarespostaprimeira` DISABLE KEYS */;
INSERT INTO `queixarespostaprimeira` VALUES (2,'rinite alergica',2),(3,'anemia',2),(5,'tonteira',4),(6,'hiperlipidemia',4),(7,'hipertensao',4),(8,'impotencia',4),(9,'diminuicao do desejo sexual',4),(10,'perda de memoria',4),(11,'dor',5),(12,'edema',5),(13,'hipertensao',5),(14,'diabetes',5),(15,'frequencia urinaria',5),(16,'impotencia',5),(17,'diminuicao do desejo sexual',5),(18,'hemorragia',5),(19,'dor nas costas',5),(20,'dor muscular',5),(21,'tremor',5),(22,'perda de memoria',5),(23,'eczema',5),(24,'dor',6),(25,'tonteira',6),(26,'edema',6),(27,'alteracoes visuais',6),(28,'diminuicao da audicao',6),(29,'rinite alergica',6),(30,'hiperlipidemia',6),(31,'hipertensao',6),(32,'falta de ar',6),(33,'queimacao',6),(34,'frequencia urinaria',6),(35,'anemia',6),(36,'dor nas costas',6),(37,'dor muscular',6),(38,'parestesia',6),(39,'perda de equilibrio',6),(40,'depressao',6),(41,'ansiedade',6),(42,'alteracao de peso',7),(43,'dor',7),(44,'tonteira',7),(45,'zumbido no ouvido',7),(46,'dor no peito',7),(47,'hipertensao',7),(48,'diabetes',7),(49,'frequencia urinaria',7),(50,'dismenorreia',7),(51,'incontinencia',7),(52,'diminuicao do desejo sexual',7),(53,'formacao excessiva de hematomas',7),(54,'dor nas costas',7),(55,'tendinites',7),(56,'parestesia',7),(57,'perda de equilibrio',7),(58,'perda de memoria',7),(59,'alteracao de peso',8),(60,'dor',8),(61,'tonteira',8),(62,'edema',8),(63,'alteracoes visuais',8),(64,'dor no peito',8),(65,'hiperlipidemia',8),(66,'hipertensao',8),(67,'queimacao',8),(68,'nausea',8),(69,'diabetes',8),(70,'dor nas costas',8),(71,'artrite',8),(72,'tendinites',8),(73,'parestesia',8),(74,'perda de equilibrio',8),(75,'depressao',8),(76,'ansiedade',8),(77,'dor',9),(78,'alteracoes visuais',9),(79,'glaucoma',9),(80,'hiperlipidemia',9),(81,'hipertensao',9),(82,'infarto do miocardio',9),(83,'queimacao',9),(84,'diarreia',9),(85,'frequencia urinaria',9),(86,'impotencia',9),(87,'diminuicao do desejo sexual',9),(88,'dor nas costas',9),(89,'tendinites',9),(90,'dor muscular',9),(91,'perda de equilibrio',9),(92,'perda de memoria',9),(93,'perda de apetite',10),(94,'perda de apetite',11),(95,'hiperlipidemia',12),(96,'hipertensao',12),(97,'impotencia',12),(98,'diminuicao do desejo sexual',12),(99,'perda de memoria',12),(100,'dor',13),(101,'edema',13),(102,'hiperlipidemia',13),(103,'hipertensao',13),(104,'diabetes',13),(105,'frequencia urinaria',13),(106,'impotencia',13),(107,'diminuicao do desejo sexual',13),(108,'hemorragia',13),(109,'dor nas costas',13),(110,'dor muscular',13),(111,'tremor',13),(112,'perda de memoria',13),(113,'eczema',13),(114,'dor',14),(115,'alteracoes visuais',14),(116,'glaucoma',14),(117,'hiperlipidemia',14),(118,'hipertensao',14),(119,'infarto do miocardio',14),(120,'queimacao',14),(121,'diarreia',14),(122,'impotencia',14),(123,'diminuicao do desejo sexual',14),(124,'dor nas costas',14),(125,'tendinites',14),(126,'dor muscular',14),(127,'perda de equilibrio',14),(128,'perda de memoria',14),(129,'dor',15),(130,'edema',15),(131,'hiperlipidemia',15),(132,'hipertensao',15),(133,'diabetes',15),(134,'frequencia urinaria',15),(135,'impotencia',15),(136,'diminuicao do desejo sexual',15),(137,'hemorragia',15),(138,'dor nas costas',15),(139,'dor muscular',15),(140,'tremor',15),(141,'perda de memoria',15),(142,'eczema',15),(143,'dor',16),(144,'tonteira',16),(145,'edema',16),(146,'alteracoes visuais',16),(147,'diminuicao da audicao',16),(148,'rinite alergica',16),(149,'hiperlipidemia',16),(150,'hipertensao',16),(151,'falta de ar',16),(152,'queimacao',16),(153,'frequencia urinaria',16),(154,'anemia',16),(155,'dor nas costas',16),(156,'dor muscular',16),(157,'parestesia',16),(158,'perda de equilibrio',16),(159,'depressao',16),(160,'ansiedade',16),(161,'perda de memoria',16);
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
INSERT INTO `aluno` VALUES (' Nelson',2006,'T','T','F','F','T','F','F','M',27,'06123691',1,'Nelson Rubens Moreira','S',NULL,1,1,'F','F','F','V'),('aline',2006,'T','T','F','T','T','F','T','F',23,'06121845',1,'Aline de Oliveira Lima','S',NULL,1,1,'V','F','F','V'),('araujo_bes',2006,'T','T','F','T','T','F','F','M',23,'06122854',1,'Bruno Eduardo Silva de Araújo','S',NULL,1,1,'V','F','F','V'),('bernardo',2006,'F','T','T','F','T','T','T','M',23,'1010',1,'Bernardo','S',16,1,1,'V','F','F','V'),('cledison',2006,'T','F','F','F','T','F','T','M',24,'06120967',1,'cledison santos ramos','S',NULL,1,1,'V','F','F','F'),('Daniela Araujo',2006,'T','T','F','F','T','F','F','F',22,'06120051',1,'Daniela Araujo Melo','S',12,3,1,'V','V','F','V'),('ericafabianne',2006,'T','T','F','T','T','F','F','F',22,'06120401',1,'Érica Fabianne Oliveira Souza','S',NULL,1,1,'V','F','F','F'),('Gi',2005,'T','T','T','T','T','T','T','F',24,'05122062',1,'Giselle Brito','S',NULL,1,1,'V','F','F','F'),('Joana Luiza ',2006,'T','T','F','T','F','F','F','F',22,'06120815',1,'Joana Luiza Costa Almeida','S',NULL,1,1,'V','F','F','V'),('johnny.farma',2006,'T','T','F','T','T','F','T','M',28,'06123271',1,'João Luiz Alves dos Santos','S',NULL,1,1,'V','F','F','F'),('Juliana',2006,'T','T','F','T','T','F','T','F',23,'06120030',1,'Juliana Almeida Ferreira','S',10,3,1,'V','F','F','V'),('Júnior',2006,'T','T','F','T','T','F','F','M',22,'06121819',1,'Genival Araújo dos Santos Júnior','S',NULL,1,1,'V','F','F','F'),('laiane vasconcelos',2006,'T','T','T','T','T','F','F','F',23,'06121851',1,'laiane tiara santos vasconcelos','S',NULL,1,1,'V','F','F','F'),('Laís Sena',2006,'T','T','T','T','T','F','F','F',21,'06123224',1,'Laís Cristina Santana Sena','S',13,3,1,'V','F','F','V'),('Larissa Carvalho',2006,'T','T','F','T','T','F','T','F',23,'06121138',1,'Larissa Feitosa Carvalho','S',9,3,1,'V','F','V','V'),('maksonoliveira',2006,'T','T','F','T','T','F','F','M',24,'06123549',1,'MAKSON GLEYDSON BRITO DE OLIVEIRA','S',11,3,1,'V','F','F','F'),('Marcos',2005,'T','T','F','T','T','F','F','M',23,'07120746',1,'Marcos Daniel Seabra Santos','S',14,3,1,'V','F','F','F'),('Nayanna Lessa',2006,'T','T','F','T','T','F','T','F',22,'06121079',1,'Nayanna Mendes Neves Lessa','S',NULL,1,1,'V','V','F','V'),('Renata',2006,'T','T','F','T','T','F','F','F',23,'06122173',1,'Renata Souza de Carvalho','S',NULL,1,1,'V','V','F','F'),('tamireslima',2006,'T','T','T','T','T','F','F','F',22,'06121997',1,'Tamires Cardoso Lima','S',NULL,1,1,'V','F','F','V'),('testeabc',2003,'F','F','F','F','T','F','F','F',0,'01234567',1,'Testando','S',6,2,2,'V','V','V','V'),('Thais Teles',2006,'T','T','F','T','T','F','T','F',23,'06122718',1,'Thaís Teles de Souza','S',NULL,1,1,'V','F','F','V'),('Vinícius',2006,'T','T','F','F','T','F','F','M',23,'06122304',NULL,'Carlos Vinícius Costa da Conceição','S',NULL,1,1,'V','V','F','V'),('vivianne',2005,'T','T','F','T','T','F','F','F',23,'05122351',1,'Vivianne Freire Santos','S',NULL,1,1,'V','F','F','F');
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
  KEY `FK_Consulta_1` (`fkCasoClinico`),
  KEY `FK_consulta_2` (`fkAluno`),
  KEY `FKDE2881F58A1319FF` (`fkCasoClinico`),
  KEY `FKDE2881F52977839B` (`fkAluno`),
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
INSERT INTO `consulta` VALUES (6,3,'testeabc'),(9,3,'Larissa Carvalho'),(10,9,'juliana'),(11,5,'maksonoliveira'),(12,8,'Daniela Araujo'),(13,7,'laís sena'),(14,6,'marcos'),(15,3,'bernardo'),(16,3,'bernardo');
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
  KEY `FK685CED99A4FE1140` (`fkResposta2`),
  KEY `FKFD098D39A4FE1140` (`fkResposta2`),
  CONSTRAINT `FK685CED99A4FE1140` FOREIGN KEY (`fkResposta2`) REFERENCES `respostasegunda` (`id`),
  CONSTRAINT `FKFD098D39A4FE1140` FOREIGN KEY (`fkResposta2`) REFERENCES `respostasegunda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queixarespostasegunda`
--

LOCK TABLES `queixarespostasegunda` WRITE;
/*!40000 ALTER TABLE `queixarespostasegunda` DISABLE KEYS */;
INSERT INTO `queixarespostasegunda` VALUES (33,-1,8,'V',5,'Hiperlipidemia','1974'),(34,-1,8,'V',6,'Hipertensão','1974'),(35,-1,8,'V',2,'Diabetes','2008 (Pré-diabetes)'),(36,5,8,'V',1,'Impotência','1999'),(37,5,8,'V',3,'Diminuição do desejo sexual','1999'),(38,5,8,'V',4,'Perda de memória','1999'),(53,-1,10,'V',1,'Dor',''),(54,5,10,'V',1,'Edema',''),(55,-1,10,'',2,'Hipertensão',''),(56,1,10,'V',1,'Queimacao',''),(57,-1,10,'V',2,'Diabetes',''),(58,-1,10,'V',2,'Frequência urinária',''),(59,1,10,'V',0,'Impotência',''),(60,1,10,'V',0,'Diminuição do desejo sexual',''),(61,1,10,'',0,'Hemorragia',''),(62,-1,10,'',0,'Dor nas costas',''),(63,-1,10,'',0,'Dor muscular',''),(64,-1,10,'',0,'Tremor',''),(65,-1,10,'',0,'Perda de memória',''),(66,1,10,'',0,'Eczema',''),(85,-1,12,'V',17,'Alteração de peso',''),(86,-1,12,'V',11,'Dor',''),(87,5,12,'V',2,'Tonteira',''),(88,-1,12,'V',1,'Zumbido no ouvido',''),(89,-1,12,'V',5,'Dor no peito',''),(90,-1,12,'V',15,'Hipertensão',''),(91,-1,12,'V',14,'Diabetes',''),(92,-1,12,'V',6,'Frequência urinária',''),(93,5,12,'V',16,'Dismenorreia',''),(94,-1,12,'V',7,'Incontinência',''),(95,-1,12,'V',12,'Diminuição do desejo sexual',''),(96,1,12,'V',13,'Formação excessiva de hematomas',''),(97,5,12,'V',9,'Dor nas costas',''),(98,-1,12,'V',8,'Tendinite',''),(99,5,12,'V',4,'Parestesia',''),(100,5,12,'V',3,'Perda de equilíbrio',''),(101,-1,12,'V',10,'Perda de memória',''),(391,5,30,'V',13,'Alteração de peso',''),(392,-1,30,'V',2,'Dor',''),(393,5,30,'V',8,'Tonteira',''),(394,5,30,'V',7,'Edema',''),(395,5,30,'V',14,'Alterações visuais',''),(396,4,30,'V',6,'Dor no peito',''),(397,-1,30,'V',16,'Hiperlipidemia',''),(398,-1,30,'V',17,'Hipertensão',''),(399,5,30,'V',12,'Queimacao',''),(400,3,30,'V',11,'Náusea',''),(401,7,30,'V',1,'Diabetes',''),(402,-1,30,'V',5,'Dor nas costas',''),(403,2,30,'V',4,'Artrite',''),(404,2,30,'V',3,'Tendinite',''),(405,-1,30,'V',15,'Parestesia',''),(406,-1,30,'V',18,'Perda de equilíbrio',''),(407,3,30,'V',9,'Depressão',''),(408,3,30,'V',10,'Ansiedade',''),(409,-1,31,'V',3,'Dor',''),(410,-1,31,'V',4,'Edema',''),(411,-1,31,'V',5,'Alterações visuais',''),(412,-1,31,'V',6,'Diminuição da audição',''),(413,-1,31,'V',7,'Rinite alergica',''),(414,1,31,'F',1,'Hiperlipidemia',''),(415,7,31,'F',2,'Hipertensão',''),(416,-1,31,'V',8,'Falta de ar',''),(417,-1,31,'V',9,'Queimacao',''),(418,-1,31,'V',10,'Anemia',''),(419,-1,31,'V',11,'Dor nas costas',''),(420,-1,31,'F',12,'Parestesia',''),(421,-1,31,'V',13,'Perda de equilíbrio',''),(422,-1,31,'V',14,'Depressão',''),(423,-1,31,'V',15,'Ansiedade',''),(424,-1,31,'V',16,'Perda de memória',''),(425,-1,32,'V',3,'Dor',''),(426,-1,32,'V',13,'Alterações visuais',''),(427,-1,32,'V',15,'Glaucoma',''),(428,-1,32,'V',2,'Hiperlipidemia',''),(429,-1,32,'V',12,'Hipertensão','Diagnosticada há 15 anos'),(430,-1,32,'V',14,'Infarto do miocárdio',''),(431,0,32,'V',7,'Queimacao',''),(432,0,32,'V',6,'Diarreia',''),(433,0,32,'V',8,'Impotência',''),(434,0,32,'V',9,'Diminuição do desejo sexual',''),(435,0,32,'V',5,'Dor nas costas',''),(436,0,32,'V',1,'Tendinite',''),(437,0,32,'V',4,'Dor muscular',''),(438,0,32,'V',11,'Perda de equilíbrio',''),(439,-1,32,'V',10,'Perda de memória',''),(440,1,33,'F',1,'Hiperlipidemia','das'),(441,-1,33,'V',3,'Hipertensão','d'),(442,1,33,'V',2,'Diabetes',''),(443,-1,33,'F',4,'Impotência','d'),(444,-1,33,'F',6,'Diminuição do desejo sexual',''),(445,-1,33,'F',5,'Perda de memória','d'),(446,0,34,'',0,'Hiperlipidemia',''),(447,0,34,'',0,'Hipertensão',''),(448,0,34,'',0,'Diabetes',''),(449,0,34,'',0,'Impotência',''),(450,0,34,'',0,'Diminuição do desejo sexual',''),(451,0,34,'',0,'Perda de memória','');
/*!40000 ALTER TABLE `queixarespostasegunda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_instituicao`
--

DROP TABLE IF EXISTS `tb_instituicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_instituicao` (
  `IdInstituicao` int(11) NOT NULL,
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
INSERT INTO `tb_instituicao` VALUES (1,'Universidade Federal de Sergipe','UFS'),(2,'Universidade Tiradentes','UNIT');
/*!40000 ALTER TABLE `tb_instituicao` ENABLE KEYS */;
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
INSERT INTO `medicamentonaoprescrito` VALUES (2,'Polivitamínico (sulfato ferroso, vitamina C, vitamina B12, ácido fólico, vitamina B1, vitamina B2, vitamina B6, nicotinamida, pantotenato de cálcio, concentrado gastro-hepático)','400mg/100mg/15mcg/0,5mg/30mg/5mg/10mg/25mg/15mg/(1:50)100mg','1 comprimido após o almoço para fraqueza',3,'F'),(4,'Ranitidina','150 mg','1 comprimido em jejum e 1 comprimido a noite',5,'F'),(5,'Polivitamínico (sulfato ferroso, vitamina C, vitamina B12, ácido fólico, vitamina B1, vitamina B2, vitamina B6, nicotinamida, pantotenato de cálcio, concentrado gastro-hepático)','400mg/100mg/15mcg/0,5mg/30mg/5mg/10mg/25mg/15mg/(1:50)100mg','1 comprimido após o almoço',5,'F'),(6,'Polivitamínico e mineral','variada','1 comprimido ao dia',9,'F');
/*!40000 ALTER TABLE `medicamentonaoprescrito` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_disciplina`
--

LOCK TABLES `tb_disciplina` WRITE;
/*!40000 ALTER TABLE `tb_disciplina` DISABLE KEYS */;
INSERT INTO `tb_disciplina` VALUES (1,'Atenção Farmacêutica'),(2,'Assistência Farmacêutica'),(3,'Farmácia Clínica'),(4,'Dispenção Farmacêutica'),(5,'Introdução Farmácia'),(6,'Semiologia Farmacêutica'),(7,'Tópicos Farmácia Clínica');
/*!40000 ALTER TABLE `tb_disciplina` ENABLE KEYS */;
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
INSERT INTO `parametroclinico` VALUES (3,'Glicose de jejum','mg/dL',109,'60-100',3),(4,'Colesterol Total','mg/dL',178,'< 200',3),(5,'Colesterol HDL','mg/dL',45,'Diabético: > 45',3),(6,'Colesterol LDL','mg/dL',102,'< 100',3),(7,'Triglicerides','mg/dL',153,'<150',3),(13,'Colesterol Total ','mg/dL',166,'< 200',5),(14,'Colesterol HDL ','mg/dL',62,'< 40 Baixo - > 60 Alto',5),(15,'Colesterol LDL ','mg/dL',90,'< 100',5),(16,'Triglicerides','mg/dL',67,'< 150',5),(17,'Creatino fosfoquinase - CPK','U/L',420,'26-189',5),(18,'Glicemia capilar','mg/dL',109,'60-100',5),(19,'Colesterol Total','mg/dL',208,'< 200 ',6),(20,'Colesterol LDL','mg/dL',148,'< 100',6),(21,'Colesterol HDL','mg/dL',33,'< 40 Baixo - > 60 Alto',6),(22,'Glicose de jejum','md/dL',119,'60-100',6),(23,'Triglicerides','mg/dL',136,'< 150',6),(24,'HbA1c','%',13,'4,3 - 5,7',7),(25,'Colesterol total ','mg/dL',133,'< 200',7),(26,'Colesterol HDL','mg/dL',34,'Diabético > 45',7),(27,'Glicose de jejum','mg/dL',274,'60-100',7),(28,'Colesterol LD','mg/dL',71,'< 100',7),(29,'Uréia','mg/dL',31,'10-40',7),(30,'Glicose de jejum','mg/dL',84,'60-100',8),(31,'HbA1c','%',10.2,'4,3 ? 5,7',8),(32,'Sódio','mg/dL',144,'135-144 ',8),(33,'Colesterol HDL ','mg/dL',36,'Diabéticos > 45',8),(34,'Colesterol LDL  ','mg/dL',86,'< 100',8),(35,'Colesterol total ','mg/dL',133,'< 200',8),(36,'Triglicerides','mg/dL',54,'< 150',8),(37,'Uréia','mg/dL',30,'15-40',8),(38,'Creatinina','mg/dL',0.9,'0,4 ? 1,4 ',8),(39,'Ácido Úrico ','mg/dL',2.4,'1,5-6',8),(40,'Glicose de jejum','mg/dL',98,'60-100',9),(41,'Glicose pós-prandial','md/dL',264,'60-180',9),(42,'Colesterol Total','mg/dL',233,'< 200',9),(43,'Triglicerides','mg/dL',123,'< 150 ',9);
/*!40000 ALTER TABLE `parametroclinico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respostasegunda`
--

DROP TABLE IF EXISTS `respostasegunda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respostasegunda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataRealizacao` date NOT NULL DEFAULT '0000-00-00',
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
INSERT INTO `respostasegunda` VALUES (8,'2010-07-14',9,1,'V','Cuidado!!!\r\n1 - O campo \"desde\" relacionado a doença deverá ser preenchido com a data do aparecimento do sintoma. Vocês relacionaram com o início do uso do medicamento suspeito. Assim, o início dos sintomas devem ser investigados nas consultas posteriores. Dessa forma, o campo \"desde\" só deverá ser preenchido no Diabetes e Hipertensão.\r\n2 - O medicamento atual para pressão ele toma há dois anos, e não foi documentado.\r\n3 - Quanto as intervenções, antes de propor a troca do medicamento, verificar a possibilidade do manejo da dose.\r\nAtenciosamente,\r\nTutor 3','Cuidado!!!\r\n1 - O campo \"desde\" relacionado a doença deverá ser preenchido com a data do aparecimento do sintoma. Vocês relacionaram com o início do uso do medicamento suspeito. Assim, o início dos sintomas devem ser investigados nas consultas posteriores. Dessa forma, o campo \"desde\" só deverá ser preenchido no Diabetes e Hipertensão.\r\n2 - O medicamento atual para pressão ele toma há dois anos, e não foi documentado.\r\n3 - Quanto as intervenções, antes de propor a troca do medicamento, verificar a possibilidade do manejo da dose.\r\nAtenciosamente,\r\nTutor 3',8.5,NULL),(10,'2010-07-14',10,1,'V','Cuidado!!\r\n1 - O campo prioridade não foi respondido levando em consideração as queixas do paciente.\r\n2 - Os medicamentos utilizados para o eczema são todos prescritos. Para se julgar uma terapia desnecessária deve-se utilizar uma base teórica confiável.\r\n3 - O medicamento utilizado Tacrolimus é de uso tópico, com isso a interação com omeprazol não deve ser alarmada para o paciente uma vez que poderá interferir no cumprimento de um dos medicamentos.\r\n4 - Destrinchar os tipos de intervenções que serão realizadas diante das RAMs.\r\n5 -  Verificar o valor de glicemia e a dose do medicamento utilizado.\r\n6 - Verificar a possibilidade de controle da pressão uma vez que a paciente só utiliza 1 comprimido por dia.\r\n7 - Vocês não priorizaram uma das principais queixas da paciente, o medicamento para dor nas costas deverá ser investigado.\r\n8 - Cautela ao classificar a necessidade, efetividade, segurança e cumprimento da farmacoterapia. Deverão ser avaliados nesta ordem, e apenas 1 tipo de PRM por farmacoterapia.\r\n9 - Não foi descrito o nome dos medicamentos quando foi correlacionado a queixa.\r\nTutor 2','Cuidado!!\r\n1 - O campo prioridade não foi respondido levando em consideração as queixas do paciente.\r\n2 - Os medicamentos utilizados para o eczema são todos prescritos. Para se julgar uma terapia desnecessária deve-se utilizar uma base teórica confiável.\r\n3 - O medicamento utilizado Tacrolimus é de uso tópico, com isso a interação com omeprazol não deve ser alarmada para o paciente uma vez que poderá interferir no cumprimento de um dos medicamentos.\r\n4 - Destrinchar os tipos de intervenções que serão realizadas diante das RAMs.\r\n5 -  Verificar o valor de glicemia e a dose do medicamento utilizado.\r\n6 - Verificar a possibilidade de controle da pressão uma vez que a paciente só utiliza 1 comprimido por dia.\r\n7 - Vocês não priorizaram uma das principais queixas da paciente, o medicamento para dor nas costas deverá ser investigado.\r\n8 - Cautela ao classificar a necessidade, efetividade, segurança e cumprimento da farmacoterapia. Deverão ser avaliados nesta ordem, e apenas 1 tipo de PRM por farmacoterapia.\r\n9 - Não foi descrito o nome dos medicamentos quando foi correlacionado a queixa.\r\nTutor 2',6.5,NULL),(12,'2010-07-14',12,1,'V','Cuidado!!!\r\n1 - O campo \"desde\" relacionado a doença Diabetes não foi preenchido.\r\n2 - O medicamento atual para pressão Hidroclorotiazida/Amilorida não é administrado de forma correta, uma vez que a paciente só usa Hidroclorotiazida. Contudo, deverá ser investigado se essa associação é a mais indicada para essa condição clínica. Além disso, não foi considerado o não cumprimento da Furosemida, visto que a PA não está controlada. O medicamento Captopril não foi correlacionado com a tosse seca em outras intervenções. Com isso, todas as possibilidades deverão ser investigadas.\r\n3 - Vocês não correlacionaram o valor da glicemia com o uso do medicamento para Diabetes, entre a posologia prescrita e a posologia administrada.\r\n4 - Vocês focaram a avaliação nas reações adversas. Exemplo disso, foi correlacionar cólicas (dismenorréia) com a Nimesulida e AAS.\r\n\r\nTutor 2','Cuidado!!!\r\n1 - O campo \"desde\" relacionado a doença Diabetes não foi preenchido.\r\n2 - O medicamento atual para pressão Hidroclorotiazida/Amilorida não é administrado de forma correta, uma vez que a paciente só usa Hidroclorotiazida. Contudo, deverá ser investigado se essa associação é a mais indicada para essa condição clínica. Além disso, não foi considerado o não cumprimento da Furosemida, visto que a PA não está controlada. O medicamento Captopril não foi correlacionado com a tosse seca em outras intervenções. Com isso, todas as possibilidades deverão ser investigadas.\r\n3 - Vocês não correlacionaram o valor da glicemia com o uso do medicamento para Diabetes, entre a posologia prescrita e a posologia administrada.\r\n4 - Vocês focaram a avaliação nas reações adversas. Exemplo disso, foi correlacionar cólicas (dismenorréia) com a Nimesulida e AAS.\r\n\r\nTutor 2',8,NULL),(30,'2010-07-14',13,1,'V','Cuidado!!\r\n1 - Aa classificação utilizada para o PRM do sistema é PWDT e vocês classificaram o Diltiazem como dose menor do que a necessária, deveria ser cumprimento.\r\n2 - Vocês focaram nas reações adversas, primeiro deve ser investigado quando o sintoma apareceu para depois correlacioná-lo com o uso do medicamento.\r\n3 - Antes de classificar um medicamento como inefetivo, deve-se tentar a posologia máxima.\r\nTutor 3','Cuidado!!\r\n1 - Aa classificação utilizada para o PRM do sistema é PWDT e vocês classificaram o Diltiazem como dose menor do que a necessária, deveria ser cumprimento.\r\n2 - Vocês focaram nas reações adversas, primeiro deve ser investigado quando o sintoma apareceu para depois correlacioná-lo com o uso do medicamento.\r\n3 - Antes de classificar um medicamento como inefetivo, deve-se tentar a posologia máxima.\r\nTutor 3',8.5,NULL),(31,'2010-07-14',11,1,'V','Cuidado!!\r\n1 - Verificar o tempo de uso do Ciprofibrato, foi descriminado no caso.\r\n2 - O medicamento Celecoxibe é seletivo para Cox-2, por isso não provoca queimação, quanto ao AAS orientar para administração urante pequenas refeições.\r\nObs.: O grupo apresentou uma abordagem positiva ao solicitar o tempo de aparecimento dos sintomas.\r\nTutor 1','Cuidado!!\r\n1 - Verificar o tempo de uso do Ciprofibrato, foi descriminado no caso.\r\n2 - O medicamento Celecoxibe é seletivo para Cox-2, por isso não provoca queimação, quanto ao AAS orientar para administração urante pequenas refeições.\r\nObs.: O grupo apresentou uma abordagem positiva ao solicitar o tempo de aparecimento dos sintomas.\r\nTutor 1',9,NULL),(32,'2010-07-14',14,1,'V','Cuidado!!\r\n1 - Os níveis da PA estão no limite, sugere-se monitorar com cautela.\r\n2 - Os níveis de colesterol total e LDL estão acima dos limites desejados, o que reforça a necessidade de intervenções farmacológica e não-farmacológicas.\r\n3 - Investigar com o paciente se a ordem de prioridade estabelecida é a real necessidade dele.\r\nTutor 1','Cuidado!!\r\n1 - Os níveis da PA estão no limite, sugere-se monitorar com cautela.\r\n2 - Os níveis de colesterol total e LDL estão acima dos limites desejados, o que reforça a necessidade de intervenções farmacológica e não-farmacológicas.\r\n3 - Investigar com o paciente se a ordem de prioridade estabelecida é a real necessidade dele.\r\nTutor 1',8.5,NULL),(33,'2010-07-15',6,1,'F','sdf dsf dds fdssdf','kasdkkm sakjdh',2.1,'kjasdhds\r\ndfsfsdf jkdskjjkf jkdsfkj'),(34,'2010-07-15',6,1,NULL,NULL,NULL,-1,'kdlasjlk jskadhajsdas CARTA');
/*!40000 ALTER TABLE `respostasegunda` ENABLE KEYS */;
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
  `dataRealizacao` date NOT NULL DEFAULT '0000-00-00',
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
INSERT INTO `medicamentoprescrito` VALUES (3,'Metformina','850 mg','Cardiologista','I.S.T.','1 comprimido depois do almoço',3,'F'),(4,'Losartano, Atenolol, Anlodipino, Hidroclorotiazida','50/50/5/12,5 mg','Cardiologista','I.S.T.','1 comprimido de 12/12h, porém o paciente relata tomar somente 1 comprimido antes do almoço',3,'F'),(5,'Atorvastatina','20 mg ','Cardiologista','I.S.T.','1 comprimido 12h',3,'F'),(9,'Pantoprazol','40 mg','Gastroenterologista','S.B.','1 comprimido em jejum e 1 a noite (durante 3 meses), porém não comprou o medicamento, achou muito caro',5,'F'),(10,'Sinvastatina/Ezetimiba ','20/10 mg','Cardiologista','M.R.','1 comprimido depois do jantar',5,'F'),(11,'Ciprofibrato','100 mg','Cardiologista','M.R.','1 comprimido ao dia',5,'F'),(12,'Anlodipino','5 mg','Cardiologista','M.R. ','1 comprimido de 12/12h',5,'F'),(13,'Celecoxib','200 mg','Oncologista','A.C.','1 comprimido ao dia, após o almoço',5,'F'),(14,'Ácido acetilsalicílico','100 mg','Cardiologista','M.R.','1 comprimido após o almoço',5,'F'),(15,'Enalapril','10 mg','Cardiologista','A.L.V.','1 comprimido de 12/12h',6,'F'),(16,'Atenolol','25 mg','Cardiologista','A.L.V.','1 comprimido às 12h',6,'F'),(17,'Latanoprost','50 mcg','Oftalmologista','não lembra','1 gota em cada olho ao deitar',6,'F'),(18,'Omeprazol','20 mg','Cardiologista','A.L.V.','1 comprimido em jejum',6,'F'),(19,'Ácido acetilsalicílico ','100 mg','Cardiologista','J.B.R.','1 comprimido depois do almoço, desde 12/2008',7,'F'),(20,'Atenolol','50 mg','Cardiologista','J.B.R','1 comprimido no café e 1 no jantar, desde 12/2008',7,'F'),(21,'Diltiazem','60 mg','Cardiologista','J.B.R.','1 comprimido 3 vezes ao dia, mas usa duas vezes ao dia nas refeições',7,'F'),(22,'Domperidona','10 mg','Endocrinologista','V.C.','1 comprimido 30 minutos antes das refeições (duas vezes ao dia)',7,'F'),(23,'Mononitrato de Isossorbida ','20 mg','Cardiologista','J.B.R.','1 comprimido depois das refeições (3 vezes ao dia)',7,'F'),(24,'Sinvastatina','40 mg','Cardiologista','J.B.R.','1 comprimido no jantar',7,'F'),(25,'Oxcarbazepina','300 mg','Neurologista','R.C.','1 comprimido depois do café e 1 depois do jantar, desde 02/2009',7,'F'),(26,'Vildagliptina/Metformina ','50/850 mg','Endocrinologista','V.C.','1 comprimido de cada 30 minutos antes do café e 30 minutos antes do jantar, desde 10/2008',7,'F'),(27,'Fluoxetina ','20 mg','Endocrinologista','V.C.','1 comprimido às 10h',7,'F'),(28,'Insulina Humana Regular ','12/6/6 U','Endocrinologista','V.C.','12 U antes do café/ 6 U antes do almoço/ 6 U antes do jantar',7,'F'),(29,'Insulina NPH ','30/18/24 U','Endocrinologista','V.C.','30 U antes do café/ 18 U antes do almoço/ 24 U antes do jantar',7,'F'),(30,'Hidroclorotiazida/Amilorida ','25/2,5 mg','Cardiologista','F.P.','1 comprimido em dias alternados, porém refere tomar some a hidroclorotiazida (por conta própria)',8,'F'),(31,'Captopril','25 mg','Cardiologista','F.P.','1 comprimido 3 vezes ao dia, usa apenas 10 e 17h, desde 12/2008',8,'F'),(32,'Furosemida','40 mg','Cardiologista','F.P.','1 comprimido às 9h, não usa, está prescrito desde 12/2008',8,'F'),(33,'Ácido acetilsalicílico ','100 mg','Cardiologista','F.P.','1 comprimido depois do almoço',8,'F'),(34,'Ranitidina','150 mg','Clínico Geral','J.M.','1 comprimido em jejum, desde 12/2008',8,'F'),(35,'Sinvastatina','20 mg','Cardiologista','F.P.','1 comprimido antes de dormir, desde 11/2008',8,'F'),(36,'Glibenclamida','5 mg','Geriatra','W.','1 comprimido duas vezes ao dia, só usa 1 comprimido antes do café',8,'F'),(37,'Metformina','850 mg','Geriatra','W.','1 comprimido duas vezes ao dia, 1 comprimido após o café e 1 após o almoço (parte o comprimido para engolir)',8,'F'),(38,'Nimesulida/Acetaminofeno/Ciclobenzaprina','manipulado','não delcarado','não delcarado','1 comprimido após o café e 1 após o jantar, desde 11/2006',8,'F'),(39,'Metformina','850 mg','Endocrinologista','M.L.','1 comprimido depois do almoço, desde 11/2008',9,'F'),(40,'Omeprazol','20 mg','Endocrinologista','M.L.','1 comprimido ao dia, porém só usa quando sente dor',9,'F'),(41,'Valsartano/Anlodipino ','160/5 mg','Cardiologista','J.L.L.B.','1 comprimido após o café da manhã',9,'F'),(42,'Insulina NPH','30 U em jejum e 20 U às 17h','Endocrinologista','M.L.','desde 04/2008',9,'F'),(43,'Cafeína/Carisoprodol/Diclofenaco sódico/Paracetamol ','30/125/50/300 mg','Ortopedista','A.L.','1 comprimido de 8/8h, usa apenas após o café da manhã e após o jantar, para a hérnia de disco, desde 12/2008',9,'F'),(44,'Sulfacetamida sódica','3% loção ?oil free?','Dermatologista','L.S.B.','nas manchas brancas na pele a noite durante 2 meses, desde 01/2009',9,'F'),(45,'Tacrolimus','0,1% creme','Dermatologista','L.S.B.','nas manchas brancas a noite durante 2 meses, desde 01/2009',9,'F');
/*!40000 ALTER TABLE `medicamentoprescrito` ENABLE KEYS */;
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
INSERT INTO `tb_usuario` VALUES (1,'1','Nelson Rubens Moreira','nelsonfarma@gmail.com',' Nelson','1234','Aluno'),(2,'2','Administrador','admin@gmail.com','admin','!p4c1ent3','Administrador'),(3,'3','Aline de Oliveira Lima','alineufs@hotmail.com','aline','cel8144','Aluno'),(4,'4','Bruno Eduardo Silva de Araújo','araujo_bes@hotmail.com','araujo_bes','besa2020','Aluno'),(5,'5','Bernardo','bernardo_jabbur@hotmail.com','bernardo','12345','Aluno'),(6,'6','cledison santos ramos','galego169@hotmail.com','cledison','csr838840','Aluno'),(7,'7','Daniela Araujo Melo','danielaju@bol.com.br','Daniela Araujo','dani0305','Aluno'),(8,'8','Daniel Tenorio','danieltenorio.lepfs@hotmail.com','danieltenorio','riobranco08','Tutor'),(9,'9','Érica Fabianne Oliveira Souza','efabianne@yahoo.com.br','ericafabianne','3r1c4','Aluno'),(10,'10','Giselle Brito','gisellecbrito@hotmail.com','Gi','300586','Aluno'),(11,'11','Gisele Brito','gigilbrito@hotmail.com','Giselle Brito','3020526','Tutor'),(12,'12','Joana Luiza Costa Almeida','joanaluiza@ig.com.br','Joana Luiza ','846464','Aluno'),(13,'13','João Luiz Alves dos Santos','johnny.farma@yahoo.com.br','johnny.farma','soeusei','Aluno'),(14,'14','Juliana Almeida Ferreira','jualmeida_ufs@yahoo.com.br','Juliana','100986','Aluno'),(15,'15','Genival Araújo dos Santos Júnior','kal_el_jr@hotmail.com','Júnior','1234','Aluno'),(16,'16','laiane tiara santos vasconcelos','laianevasconcelos@hotmail.com','laiane vasconcelos','06121851','Aluno'),(17,'17','Laís Cristina Santana Sena','laiscris4@hotmail.com','Laís Sena','101010','Aluno'),(18,'18','Larissa Feitosa Carvalho','laricarvalho87@gmail.com','Larissa Carvalho','870106','Aluno'),(19,'19','MAKSON GLEYDSON BRITO DE OLIVEIRA','makson_gbo@hotmail.com','maksonoliveira','MAKFARMAUFS','Aluno'),(20,'20','Marcos Daniel Seabra Santos','mdseabra87@hotmail.com','Marcos','123456','Aluno'),(21,'21','Monique','moniquejabbur@hotmail.com','monique','220735','Tutor'),(22,'22','Nayanna Mendes Neves Lessa','nay_lessa@hotmail.com','Nayanna Lessa','nanaedi2703','Aluno'),(23,'23','José Rafael','jrafaelns1@gmail.com','rafael','teste','Tutor'),(24,'24','Renata Souza de Carvalho','renathinhasouza2008@hotmail.com','Renata','260802','Aluno'),(25,'25','Tamires Cardoso Lima','tam_tamires@yahoo.com.br','tamireslima','gigi1901','Aluno'),(26,'26','Thaís Teles de Souza','thaisteles1@hotmail.com','Thais Teles','na08nae03','Aluno'),(27,'27','Carlos Vinícius Costa da Conceição','vinicius_c.c@hotmail.com','Vinícius','cviper235','Aluno'),(28,'28','Vivianne Freire Santos','vivianneufs@hotmail.com','vivianne','232530','Aluno');
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
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
INSERT INTO `intervencaorespostasegunda` VALUES (14,'Orientação sobre as dúvidas relativas à administração do medicamento','Questionar como o paciente toma seus medicamentos e orientá-lo sobre a administração correta dos medicamentos',2,8),(15,'Orientação prática sobre o uso do medicamento prescrito','Esclarecer melhor o uso da associação de Losartano+Atenolol+Anlodipino+Hidroclorotiazida, visto que o paciente toma metade da posologia prescrita',3,8),(20,'Orientação sobre possíveis interações, causada por um medicamento','Tacrolimus interage com omeprazol.',4,10),(21,'Orientação sobre RAM real ou potencial, causada por um medicamento','vários medicamentos causam RAM e precisam ser corrijidos.',5,10),(22,'Orientação sobre o armazenamento dos medicamentos','armazenar em locais seguros e arejados, nunca na cozinha e banheiro.',6,10),(23,'Orientação sobre a doença','informar de forma didatica como a doença é causada e importância do tratamento correto.',7,10),(81,'Orientação sobre as dúvidas relativas à administração do medicamento','NA PRÓXIMA CONSULTA O PACIENTE SERÁ QUESTIONADO QUANTO A EXIST&#7868;NCIA DE DÚVIDAS SOBRE A ADMINISTRAÇÃO DOS MEDICAMENTOS.',2,31),(82,'Orientação prática sobre o uso do medicamento prescrito','MOSTRAR A IMPORTÂNCIA DE O PACIENTE ADERIR AO TRATAMENTO E ALERTAR SOBRE OS RISCOS DA AUTOMEDICAÇÃO.TAMBÉM PODE SER ELABORADA UMA TABELA DE HORÁRIO DE TOMADA DOS MEDICAMENTOS, VISTO QUE O PACIENTE ESQUECE DE TOMAR ALGUNS MEDICAMENTOS NO HORÁRIO CORRETO.',3,31),(83,'Orientação sobre RAM real ou potencial, causada por um medicamento','O CELECOXIB E O AAS PODEM AGRAVAR A QUEIMAÇÃO RELATADA PELO PACIENTE. É IMPORTANTE PERGUNTAR AO PACIENTE SE ESSA CONDIÇÃO É ALTERADA APÓS O USO DESSES MEDICAMENTOS.',5,31),(84,'Orientação sobre o armazenamento dos medicamentos','oRIENTAR AO PACIENTE PARA NÃO GUARDAR OS MEDICAMENTOS NA COZINHA OU NO BANHEIRO OU EM LOCAIS ÚMIDOS OU SOB A INCIDÊNCIA DE LUZ.',6,31),(85,'Orientação sobre a doença','FALAR DA IMPORTÂNCIA DE CUMPRIR O TRATAMENTO DA HIPERTENSÃO ARTERIAL, POIS ALÉM DE ESTA SER UMA DOENÇA CRÔNICA, NA MAIORIA DAS VEZES A MESMA SE MOSTRA ASSINTOMÁTICA.',7,31),(86,'Orientação sobre modificação do estilo de vida','o PACIENTE POSSUI UM ESTILO DE VIDA ADEQUADO AS SUAS DOENÇAS (O MESMO POSSUI UMA DOENÇA RESTRITIVA DE SAL E GORDURA E PRATICA EXERCÍCIOS FÍSICOS)',9,31),(87,'Orientação sobre a indicação de um novo medicamento prescrito','Investigar a quanto tempo o paciente vem sentindo dores e com base nisso suspeitar de PRM.',1,32),(88,'Orientação sobre as dúvidas relativas à administração do medicamento','Explicar ao paciente sobre o uso do colírio e saber como ele administra os seus medicamentos',2,32),(89,'Orientação prática sobre o uso do medicamento prescrito','Utilização da tabela de horário para a correta tomada dos medicamentos; Uso de folder ilustrativo com orientações sobre administração e armazenamento dos medicamentos prescritos',3,32),(90,'Orientação sobre possíveis interações, causada por um medicamento','Falar dos riscos da auto-medicação, assim como os riscos de tomar medicamentos com chás',4,32),(91,'Orientação sobre o armazenamento dos medicamentos','Instruir para guardar os medicamentos em locais de pouca luminosidade e umidade, em temperatura ambiente (com exceção do colírio que deve ser guardado na geladeira antes de ser aberto), fora do alcance de crianças e em local visível',6,32),(92,'Orientação sobre a doença','explicar sobre os riscos das doenças presentes, esclarecer suas dúvidas e a importância do cumprimento do tratamento',7,32),(93,'Orientação para procurar outro profissional de saúde','indicar uma consulta a um oftalmologista para controle do glaucoma e uma consulta a um clínico geral para avaliar as dores',10,32),(94,'Orientação sobre a indicação de um novo medicamento prescrito','lsdkasjv fasf',1,33),(95,'Orientação sobre as dúvidas relativas à administração do medicamento','fadsf safas',2,33),(96,'Orientação prática sobre o uso do medicamento prescrito','faskjh kfshak jfh kjahskjfhaskjfhaskh fkjashfkjashkfajshkfhsak h sakh  kas ',3,33),(97,'Orientação sobre possíveis interações, causada por um medicamento','1',4,33),(98,'Orientação sobre RAM real ou potencial, causada por um medicamento','1',5,33),(99,'Orientação sobre o armazenamento dos medicamentos','1',6,33),(100,'Orientação sobre a doença','1',7,33),(101,'Orientação sobre educação sanitária','1',8,33),(102,'Orientação sobre modificação do estilo de vida','1',9,33),(103,'Orientação para procurar outro profissional de saúde','1',10,33),(104,'Outras orientações necessárias','1',11,33),(105,'Orientação sobre a indicação de um novo medicamento prescrito','sdf dfsfscs',1,34),(106,'Orientação prática sobre o uso do medicamento prescrito','jkdfhj sdjkfhskj\r\ndfs\r\nfsdfd \r\nfdsf',3,34),(107,'Orientação sobre o armazenamento dos medicamentos','fdsf',6,34),(108,'Orientação sobre educação sanitária','dsf',8,34),(109,'Orientação para procurar outro profissional de saúde','fdsfds',10,34),(110,'Orientação sobre possíveis interações, causada por um medicamento','Conversar com o cardiologista sobre a possibilidade de troca da associação de Losartano+Atenolol+Anlodipino+Hidroclorotiazida por outro medicamento, visto que atenolol aumenta os efeitos hiperglicemiantes dos tiazidicos e a hidroclorotiazida diminui os efeitos da metformina. Sendo importante ressaltar a alergia relatada pelo paciente ao propanolol e ao captopril',4,8),(111,'Orientação sobre RAM real ou potencial, causada por um medicamento','Conversar com o cardiologista sobre a possibilidade de troca da associação de Losartano+Atenolol+Anlodipino+Hidroclorotiazida por outro medicamento, visto que o anlodipino possivelmente está causando impotência sexual, diminuição da libido, fraqueza e perda da memória que o paciente relata sentir; e o atenolol possivelmente também está relacionado com a impotência sexual que o paciente relata sentir. Sendo importante ressaltar a alergia relatada pelo paciente ao propanolol e ao captopril',5,8),(112,'Orientação sobre o armazenamento dos medicamentos','Os medicamentos devem der armazenados de preferência em locais secos e arejados, evitando armazenar na cozinha e banheiro, e deixando fora do alcance de crianças.',6,8),(113,'Orientação sobre a doença','Orientar através de video aulas e folders sobre as causas, consequencias das doenças relatadas e possibilidades de tratamento das mesmas',7,8),(114,'Orientação sobre educação sanitária','Informações educativas através de video aulas e folders mostrando a importancia dos cuidados com a saúde masculina',8,8),(115,'Orientação sobre modificação do estilo de vida','Informações educativas através de video aulas e folders sobre a importancia de ter habitos de vida saudáveis, ressaltando a importancia da realização de atividades fisicas regulares; o controle adequado da dieta; e as consequências do consumo excessivo de álcool.',9,8),(116,'Orientação para procurar outro profissional de saúde','Se possivel, o paciente deve procurar orientação de um educador fisico e de um nutricionista.',10,8),(117,'Orientação sobre as dúvidas relativas à administração do medicamento','Instruções sobre a correta administração da Insulina, bem como seu armazenamento sob refrigeração.',2,30),(118,'Orientação prática sobre o uso do medicamento prescrito','Orientar sobre administração do uso da Diltiazem 60mg antes das refeições. Utilizar metformina durantes as refeições. Administrar o AAS junto com pequenas refeições. Explicar a importância do cumprimento da prescrição da insulina, mesmo não estando em casa.',3,30),(119,'Orientação sobre RAM real ou potencial, causada por um medicamento','Orientar reavaliação pelo neurologista sobre a utilização da Oxcarbazepina 300mg',5,30),(120,'Orientação sobre o armazenamento dos medicamentos','Orientação sobre acondicionamento da insulina sob refrigeração. Orientar armazenamento correto dos demais medicamentos.',6,30),(121,'Orientação sobre a doença','Orientações sobre doenças pode ajudar no manejo da doença pela paciente. Contribui para melhorar o cumprimento da terapia medicamentosa e não-medicamentosa. ',7,30),(122,'Orientação sobre modificação do estilo de vida','Estimular participação em grupos sociais, como, igreja, trabalhos solidários. Paciente mostrou interesse em continuar estudos, logo, incentivar a paciente.',9,30),(123,'Orientação para procurar outro profissional de saúde','Procurar profissional capacitado para controle da artrose, tendinite e dor nas costas.',10,30),(124,'Outras orientações necessárias','Questionar sobre o consumo de álcool. Questionar sobre a restrição de carboidratos. Conscientizar sobre o  consumo de chá.',11,30),(125,'Orientação para procurar outro profissional de saúde','ORIENTAR O PACIENTE A PROCURAR UM GASTROENTEROLOGISTA PARA VERIFICAR O FATO DE A QUEIMAÇÃO NÃO TER MELHORADO E SEU PROBLEMA DE REFLUXO (FRISAR QUE O PACIENTE NÃO FEZ USO DO MEDICAMENTO PRESCRITO, O PANTOPRAZOL. O MESMO SE AUTOMEDICOU COM RANITIDINA).ACONSELHAR O MESMO A PROCURAR UM CARDIOLOGISTA PARA VER SE TEM COMO SUBSTITUIR O ANLODIPINO POR OUTRO MEDICAMENTO, POIS O PACIENTE ALEGA NÃO CUMPRIR A TERAPIA DEVIDO AO MEDICAMENTO SER MUITO CARO.SUGERIR QUE O PACIENTE PROCURE UM ESPECIALISTA EM VIRTUDE DAS SUAS DORES MUSCULARES, POIS O PACIENTE ESTÁ FAZENDO USO DE CELECOXIB, O QUAL FOI PRESCRITO PELO ONCOLOGISTA.SUGERIR AO CARDIOLOGISTA E RETIRADA DO CIPROFIBRATO, POIS O MESMO É DESNECESSÁRIO E PODE ESTAR AGRAVANDO AS DORES MUSCULARES DO PACIENTE(O MESMO PODE SER O CAUSADOR DA ELEVAÇÃO DA ENZIMA CREATINOFOSFOQUINASE ). OBSERVAÇÃO: DAR PRIORIDADE AO PROBLEMA DE REFLUXO DO PACIENTE, POIS O MESMO JÁ FOI PARA URGÊNCIA TRÊS VEZES (NÃO TEM COMO SABER SE O REFLUXO ESTÁ SENDO AGRAVADO POR ALGUM MEDICAMENTO EM VIRTUDE DA AUSÊNCIA DE DATAS).',10,31),(126,'Outras orientações necessárias','FAZ SE NECESSÁRIO SABER O TEMPO DE USO DE CADA MEDICAMENTO, HÁ QUANTO TEMPO O PACIENTE SENTE AS QUEIXAS RELATADAS. VERIFICAR POR QUANTO TEMPO É NECESSÁRIO USAR CADA MEDICAMENTO (A MAIORIA DOS MEDICAMENTOS NÃO TEM TEMPO DE USO). TAMBÉM É NECESSÁRIO SABER SE O PACIENTE REALMENTE TEM ANEMIA,POIS O MESMO ESTÁ SE AUTOMEDICANDO COM UM POLIVITAMÍNICO. CONFIRMAR SE DOR, EDEMA, ALTERAÇÕES VISUAIS, DIMINUIÇÃO DA AUDIÇÃO, RINITE ALERGICA, FALTA DE AR, QUEIMAÇÃO, DOR NAS COSTAS, ANEMIA, PARESTESIA, PERDA DE EQUILÍBRIO, DEPRESSÃO, ANSIEDADE, PERDA DE MEMORIA E PARESTESIA SÃO DOENÇAS/AGRAVO OU PRMs, PARA CONFIRMAR A ORDEM DAS PRIORIDADES. ',11,31);
/*!40000 ALTER TABLE `intervencaorespostasegunda` ENABLE KEYS */;
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
INSERT INTO `medicamentoqueixasegunda` VALUES (18,'Losartano+Atenolol+Anlodipino+Hidroclorotiazida','50/50/5/12,5mg','','','não relatado','F','',36,'V'),(19,'Losartano+Atenolol+Anlodipino+Hidroclorotiazida','50/50/5/12,5mg','','','não relatado','F','',37,'V'),(20,'Losartano+Atenolol+Anlodipino+Hidroclorotiazida','50/50/5/12,5mg','','','não relatado','F','',38,'V'),(22,'1 comp. após café da manhã','160/5mg','','V','','F','V',54,'V'),(23,'1 comp. após café da manhã','160/5mg','','V','','F','V',55,'V'),(24,'1 comp. após café da manhã','160/5mg','','V','','','V',56,'V'),(25,'1 comp. após café da manhã','160/5mg','','V','','','V',56,'V'),(26,'1 comp. após café da manhã','160/5mg','','V','','','V',56,'V'),(27,'1 comp. depois do almoço','850mg','','V','11/2008','','V',57,'V'),(28,' comp. após café da manhã','160/5mg','','V','','','',59,'V'),(29,'1 comp. após café da manhã','160/5mg','','V','','','',60,'V'),(30,'1 comp. de oito em oito horas','50mg','V','V','12/2008','F','F',61,'F'),(31,'usa o creme nas manchas brancas durante a noite','','','V','01/2009','F','V',66,'V'),(32,'usa o creme nas manchas brancas durante a noite','','','V','01/2009','F','V',66,'V'),(33,'Hidroclorotiazida','25 mg','F','F','','V','F',87,'V'),(34,'Nimesulida','','F','F','11/2006','V','F',93,'V'),(35,'AAS','100 mg ','F','V',' 11/2008','F','F',93,'V'),(36,'AAS','100 mg','F','V','11/2008','F','F',96,'F'),(37,'Sinvastatina','20 mg','F','F','11/2008','V','F',97,'V'),(38,'sinvastatina','20 mg','F','F','11/2008','V','F',99,'V'),(39,'Hidroclorotiazida','25 mg','F','F','','V','F',100,'V'),(155,'Oxcarbazepina','300mg','','F','02/2009','','',391,'V'),(156,'Oxcarbazepina','300mg','','F','02/2009','','',393,'V'),(157,'Oxcarbazepina','300mg','','F','02/2009','','',394,'V'),(158,'Atenolol','50mg','V','V','12/2008','F','',395,'V'),(159,'Diltiazem','60mg','F','V','','','',396,'V'),(160,'Domperidona','10mg','F','V','','','',399,'V'),(161,'Domperidona','10mg','F','V','','','',400,'V'),(162,'Insulina humana e NPH','24 (U/dia) e 72 (U/dia)','V','V','','V','F',401,'V'),(163,'Fluoxetina','20mg','F','V','','','',407,'V'),(164,'Fluoxetina','20mg','F','V','','','',408,'V'),(165,'CIPROFIBRATO','100 mg','','F','','','',414,'V'),(166,'ANLODIPINO','5 mg','','','2007','','F',415,'F'),(167,'','s','F','','dsa','','',440,'F'),(168,'sd','asd','','V','sa','','',442,'');
/*!40000 ALTER TABLE `medicamentoqueixasegunda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_curso`
--

DROP TABLE IF EXISTS `tb_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_curso` (
  `IdCurso` int(11) NOT NULL,
  `NomeCurso` varchar(45) NOT NULL,
  `IdInstituicao` int(11) NOT NULL,
  PRIMARY KEY (`IdCurso`),
  KEY `fk_instituicao_curso` (`IdInstituicao`),
  KEY `FK_Curso_Instituicao` (`IdInstituicao`),
  CONSTRAINT `FK_Curso_Instituicao` FOREIGN KEY (`IdInstituicao`) REFERENCES `tb_instituicao` (`IdInstituicao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_curso`
--

LOCK TABLES `tb_curso` WRITE;
/*!40000 ALTER TABLE `tb_curso` DISABLE KEYS */;
INSERT INTO `tb_curso` VALUES (1,'Bacharelado em Farmácia',1),(2,'Bacharelado em Enfermagem',1);
/*!40000 ALTER TABLE `tb_curso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-22 21:07:48
