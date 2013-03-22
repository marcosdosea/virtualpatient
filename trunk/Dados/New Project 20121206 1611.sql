-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.42-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema pv
--

CREATE DATABASE IF NOT EXISTS pv;
USE pv;

--
-- Definition of table `alergias`
--

DROP TABLE IF EXISTS `alergias`;
CREATE TABLE `alergias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alergias`
--

/*!40000 ALTER TABLE `alergias` DISABLE KEYS */;
INSERT INTO `alergias` (`id`,`descricao`,`idioma`) VALUES 
 (1,'Não relatou','pt'),
 (2,'Nunca apresentou alergia','pt'),
 (3,'Alergia a morfo','pt'),
 (4,'Alergia ao medicamento Profenid®, morfo e poeira','pt'),
 (5,'Alergia às Sulfonamidas','pt'),
 (6,'Alergia ao medicamento Naproxeno','pt'),
 (7,'Alergia a antibióticos','pt'),
 (8,'Alergia à penicilina','pt'),
 (9,'Alergia a camarão, azeitona, salsicha e inseticida','pt'),
 (10,'Possui alergia a Buscopan®','pt'),
 (11,'Alergia a detergente','pt'),
 (12,'Alergia a poeira, ácaro e fungos','pt');
/*!40000 ALTER TABLE `alergias` ENABLE KEYS */;


--
-- Definition of table `alternativas`
--

DROP TABLE IF EXISTS `alternativas`;
CREATE TABLE `alternativas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alternativas`
--

/*!40000 ALTER TABLE `alternativas` DISABLE KEYS */;
INSERT INTO `alternativas` (`id`,`descricao`,`idioma`) VALUES 
 (1,'Realizar atividade física','pt'),
 (2,'Controlar a alimentação','pt'),
 (3,'Realizar atividade física e controlar a alimentação','pt'),
 (4,'Encaminhamento ao médico','pt'),
 (5,'Encaminhamento ao nutricionista','pt'),
 (6,'Encaminhamento ao psicólogo','pt'),
 (7,'Encaminhamento ao profissional de educação física','pt'),
 (8,'Encaminhamento ao médico e a outro profissional de saúde','pt'),
 (9,'Intervenção educativa','pt'),
 (10,'Encaminhamento ao odontólogo','pt'),
 (11,'Encaminhamento a outro profissional de saúde','pt'),
 (12,'Nenhuma','pt');
/*!40000 ALTER TABLE `alternativas` ENABLE KEYS */;


--
-- Definition of table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
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
  CONSTRAINT `FK_aluno_2` FOREIGN KEY (`fkConsultaAtual`) REFERENCES `consulta` (`id`),
  CONSTRAINT `FK_aluno_3` FOREIGN KEY (`fkTurma`) REFERENCES `turma` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aluno`
--

/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` (`login`,`anoInicioCurso`,`flCursouAssistenciaFarmaceutica`,`flCursouAtencaoFarmaceutica`,`flCursouDispencaoFarmaceutica`,`flCursouFarmaciaClinica`,`flCursouIntroducaoFarmacia`,`flCursouSemiologiaFarmaceutica`,`flCursouTopicosFarmaciaClinica`,`genero`,`idade`,`matricula`,`fkTurma`,`nome`,`liberado`,`fkConsultaAtual`,`nrConsulta`,`nrTentativa`,`flAcessoCasa`,`flAcessoCasaAmigo`,`flAcessoOutro`,`flAcessoUniversidade`) VALUES 
 ('Atencêuticos',2008,'T','F','F','F','T','T','T','F',24,'11120014',3,'Juliana Andrade Gama','S',7,5,1,'V','F','F','V'),
 ('ATENFARMACÊUTICO',2008,'T','T','T','T','T','T','T','F',22,'2222222',3,'Juliana Andrade 2','S',14,4,2,'V','V','V','V'),
 ('Cipolle',2008,'T','T','F','T','T','F','T','F',22,'08120662',3,'Aline Santana Dosea','S',9,5,1,'V','V','V','V'),
 ('farmacuida',2008,'T','T','F','T','T','F','F','F',22,'08120560',3,'CINARA SANTOS SOUZA','S',8,5,1,'V','V','V','V'),
 ('FARMAVIDA',2010,'T','T','F','F','T','T','F','M',29,'10120027',3,'JOSÉ RONILSON CUNHA LEITE','S',13,3,1,'V','V','V','V'),
 ('horus',2009,'T','T','F','F','T','F','T','F',23,'09120154',3,'Maria do Carmo de Santana','S',12,5,1,'V','F','F','F'),
 ('MAXCEF',2008,'T','T','F','F','T','F','T','F',24,'08120588',3,'Daniele Lima Travassos','N',10,4,1,'V','V','V','V'),
 ('pharmacareufs',2007,'T','T','F','F','T','F','T','M',23,'07120678',3,'Anderson Tavares Mendonça','S',11,5,1,'V','V','V','V'),
 ('semprm',2008,'T','T','F','T','T','F','F','F',22,'08120581',3,'Juliana Gouveia Galvão','S',6,5,1,'V','F','F','F'),
 ('teste2',2005,'T','F','T','T','T','F','T','F',20,'10000000',2,'Aluno teste2','S',1,5,1,'V','F','F','V'),
 ('testetutor',2007,'T','T','F','F','T','F','T','F',25,'00002',2,'Teste Tutor','S',5,5,1,'V','V','F','V'),
 ('turma1teste',2008,'T','T','F','T','T','F','F','F',23,'0000000',2,'Turma 1 teste','S',2,5,1,'V','F','F','V'),
 ('turma2teste',2008,'T','T','F','T','T','F','T','F',22,'000001',2,'Turma 2 teste','S',3,5,1,'V','V','V','V'),
 ('turma3teste',2008,'T','T','T','T','T','T','T','F',23,'000000',2,'Vanessa ','S',4,5,1,'V','V','F','V'),
 ('VIDAFARMA',2008,'T','T','T','T','T','T','T','M',25,'101010',3,'VIDA','S',15,5,1,'V','V','V','V');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;


--
-- Definition of table `casoclinico`
--

DROP TABLE IF EXISTS `casoclinico`;
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
  `fkTutor` varchar(255) NOT NULL DEFAULT ' ',
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
  `idioma` varchar(10) DEFAULT NULL,
  `alternativaRefMed1` longtext,
  `alternativaRefMed2` longtext,
  `fotoFileName` varchar(255) DEFAULT NULL,
  `historiaMedicaPregressa` varchar(255) DEFAULT NULL,
  `historiafamiliar` varchar(255) DEFAULT NULL,
  `motivosRefMedica` longtext,
  `necessidadeAtencao1` varchar(255) DEFAULT NULL,
  `necessidadeAtencao2` varchar(255) DEFAULT NULL,
  `necessidadeAtencao3` varchar(255) DEFAULT NULL,
  `necessidadeAtencao4` varchar(255) DEFAULT NULL,
  `necessidadeAtencao5` varchar(255) DEFAULT NULL,
  `nomeDr` varchar(255) DEFAULT NULL,
  `proxEncontro` longtext,
  `referencias` longtext,
  `relatoDeCasoQuartaConsulta` longtext,
  `relatoDeCasoSegundaConsulta` longtext,
  `telefone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`fkTutor`),
  KEY `FKFCF4D80D2B972831` (`fkTutor`),
  CONSTRAINT `FKFCF4D80D2B972831` FOREIGN KEY (`fkTutor`) REFERENCES `tutor` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `casoclinico`
--

/*!40000 ALTER TABLE `casoclinico` DISABLE KEYS */;
INSERT INTO `casoclinico` (`id`,`alergias`,`altura`,`dataNascimento`,`disponibilidade`,`escolaridade`,`flBebeAlcool`,`flBebeCafe`,`flFuma`,`genero`,`medicosQueAtendem`,`moradiaFamilia`,`nome`,`ocupacao`,`peso`,`planoDeSaude`,`pressaoDiastolica`,`pressaoSistolica`,`relatoDeCasoPrimeiraConsulta`,`relatoDeCasoTerceiraConsulta`,`temperatura`,`fkTutor`,`historiaAlcoolAnterior`,`historiaAlcoolAtual`,`historiaCafeAnterior`,`historiaCafeAtual`,`historiaTabacoAnterior`,`historiaTabacoAtual`,`peso2`,`pressaoDiastolica2`,`pressaoSistolica2`,`temperatura2`,`tipoBebidaAlcoolica`,`idioma`,`alternativaRefMed1`,`alternativaRefMed2`,`fotoFileName`,`historiaMedicaPregressa`,`historiafamiliar`,`motivosRefMedica`,`necessidadeAtencao1`,`necessidadeAtencao2`,`necessidadeAtencao3`,`necessidadeAtencao4`,`necessidadeAtencao5`,`nomeDr`,`proxEncontro`,`referencias`,`relatoDeCasoQuartaConsulta`,`relatoDeCasoSegundaConsulta`,`telefone`) VALUES 
 (1,'Alergia a morfo',1.65,'1946-07-08 00:00:00','V','fundamental completo','F','V','F','M','Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com a esposa ','A.C.S','Aposentado',74.75,'Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil. ',110,180,'A.C.S, homem, branco, data de nascimento 08/07/1946, casado, mora com a esposa e tem 5 filhos que não moram com ele. É aposentado, trabalhava fazendo manutenção de ar condicionado. Cursou o ensino fundamental completo. Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil. Os médicos que o acompanham são: Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista), ambos atendem na Unidade Básica de Saúde do seu bairro. Altura = 1,65 m, Peso = 74,75 Kg, Circunferência abdominal = 97 cm. Parou de fumar e ingerir bebidas alcóolicas há 12 anos e toma entre duas a seis xícaras de café por dia. O paciente é portador de Hipertensão Arterial Sistêmica (HAS) e Diabetes Mellitus tipo II há 10 anos. Na revisão dos sistemas e da história pessoal informou ter: aumento do apetite, diminuição da audição, hiperlipidemia. Além disso, certa vez ocorreu uma hemorragia numa extração dentária. Utilizou Hidroclorotiazida no passado, por dois anos, parou porque perdeu o efeito. Quanto às suas enfermidades, o paciente expressa o desejo de melhorar, mas questiona a necessidade de usar medicamentos. O Sr. A.C.S. possui uma tabela com os horários de tomada dos medicamentos que utiliza, no entanto a mesma está desatualizada. É evangélico e freqüenta assiduamente a igreja. A partir do momento em que foi convidado para o programa de Atenção Farmacêutica, o paciente relata que modificou o comportamento na tomada dos medicamentos e começou a aderir ao tratamento. Antes do convite, ele não tomava nenhum dos medicamentos prescritos pelo médico. Não possui alergia a medicamentos e relata que nunca apresentou reações adversas aos mesmos. Possui alergia a morfo. O seu oftamologista prescreveu que usasse óculos, mas por achar que não precisa, ele não o utiliza. Já teve um acidente automobilístico aos 42 anos e levou 138 pontos na cabeça. Relatou que seu pai e sua mãe faleceram por causa de diabetes descontrolada, há 12 e 2 anos, respectivamente. Alegou que sua comida é sem sal, não gosta de chá e que se vacina contra a gripe todos os anos. No dia do primeiro atendimento farmacêutico, o Sr. A.C.S. apresentou PA (mmHg): 180/110 e Glicemia capilar 291 mg/dL.','O paciente aceitou realizar 30 minutos de caminhada por dia e está apto para controlar a alimentação. Ele expressou o desejo de ter o horário do uso dos medicamentos organizados em uma tabela. Além disso, o Sr. A.C.S. retornou ao médico e está de acordo em aderir ao tratamento e adequar os seus horários. Ele irá realizar exames laboratoriais para avaliar a necessidade da Sinvastatina. Após essas mudanças, o paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 140/100; Glicemia capilar casual = 128 mg/dl; Peso = 76,20 kg; Circunferência Abdominal = 96 cm. ',291,'blicie','12 anos',NULL,'','2-6 xícaras/dia','12 anos',NULL,76.2,100,140,128,NULL,'pt','Realizar exames laboratoriais para averiguar a necessidade do medicamento hipolipemiante.\r\n','','','Nenhuma história médica que tenha influência sobre o estado atual','Pai e mãe - portadores de Diabetes Mellitus','Paciente suspendeu o uso da Sinvastatina sem averiguar o controle dos níveis lipêmicos.','V','F','F','F','V','A.C.S.','Rever o paciente em um mês. Reavaliar a adesão e a necessidade de um hipolipemiante (níveis de colesterol?).','Sociedade Brasileira de Cardiologia\r\n\r\nIV Diretriz Brasileira Sobre Dislipidemias e Prevenção da Aterosclerose Departamento de Aterosclerose da Sociedade Brasileira de Cardiologia','Para algumas intervenções realizadas no acompanhamento desse paciente, seria necessário referenciá-lo ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados do paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pelo paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','O paciente relatou que está há alguns dias sem tomar a metformina. Jamais utilizou a furosemida prescrita pelo médico. Além disso, finalizou o tratamento com a sinvastatina e não retornou ao médico para averiguar os índices de colesterol. Não faz atividade física. Há um ano não vai a uma consulta médica. Houve aumento de peso. Costuma tomar o captopril junto com o café da manhã. ','XXXXX-XXXX'),
 (2,'Não relatou',1.63,'1946-08-29 00:00:00','V','medio completo','F','V','F','F','Endocrinologista (V.C.), Cardiologista (J.B.R.)','reside com o marido','E.B.R','dona de casa',99.4,'Dispõe do plano de saúde da Petrobrás. Adquire os medicamentos na Farmácia Popular do Brasil, farmácias comunitárias e no CASE.',70,120,'E.B.R., mulher, branca, data de nascimento - 29/08/1946, casada, mãe de três filhos que não moram mais com ela, reside com o marido, dona de casa, cursou o ensino médio completo. Dispõe do plano de saúde da Petrobrás. Adquire os medicamentos na Farmácia Popular do Brasil, farmácias comunitárias e no CASE. Os médicos que a acompanham são: Endocrinologista (V.C.) e Cardiologista (J.B.R.) todos atendem em clínicas particulares. Altura 1,63 m, Peso 99,4 Kg, Circunferência abdominal 115 cm, não fuma (parou há 20 anos), bebe café, menos de duas xícaras por dia, não faz consumo de bebida alcoólica (parou há cinco anos).. Na revisão dos sistemas e da história pessoal, informou ter: A paciente apresenta Diabetes e Hiperlipidemia. Relata que se sente confusa com os horários dos medicamentos. Realiza hidroginástica todos os dias. Na alimentação: usa adoçante, frutas (banana, manga), pouco sal, pouca gordura, verduras, alimenta-se seis vezes por dia, usa chá de camomila, chá verde e cidreira. Diz seguir a prescrição médica, mas quando está fora de casa deixa de tomar a insulina. Tem dificuldade para caminhar, usa bengala. Relata ter usado vários tipos de insulina e não tem efeito, segundo a paciente ?no começo tem efeito depois perde?. O pai e a mãe faleceram por complicações do diabetes. No dia do primeiro atendimento farmacêutico, A Srª. E.B.R. apresentou PA (mmHg): 120/70 e Glicemia capilar 252 mg/dL.','A paciente se sente melhor quanto à dor no estômago depois de iniciar o tratamento com o Omeprazol. Retomou a hidroginástica. A Sra. E.B.R. está sendo acompanhada pelo nutricionista, mas mesmo assim, continua ganhando peso. No entanto, está muito feliz com o controle da sua glicemia = 105 mg/dl. Na última consulta, o médico substituiu a Sinvastatina de 40 mg por Atorvastatina 20 mg. Ela expressou o desejo de ter o horário do uso dos medicamentos organizados em uma tabela. Após essas mudanças, a paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 110/70; Peso = 105, 75 kg; Circunferência Abdominal = 115 cm. \r\n',252,'blicie','5 anos',NULL,'','< 2 xícaras/dia','20 anos',NULL,105.75,70,110,105,NULL,'pt','1. Substituir a sinvastatina por outro hipolipemiante. Sugestão: Atorvastatina por apresentar maior efeito na redução do colesterol, em especial a fração LDL.','2. Inicar a farmacoterapia para a queimação. Sugestão: Omeprazol por ser bem tolerado, mesmo em tratamentos prolongados. ','','Não relatou','Pais e irmão - portadores de Diabetes Mellitus','1. Paciente apresenta elavados níveis de colesterol, embora esteja utilizando de maneira adequada o hipolipemiante Sinvastatina.\r\n2. Paciente se queixa de queimação no estômago.','F','V','F','F','V','Dr. J.B.R.','Rever a paciente em 1 mês. Reavaliar a glicemia e os níveis de colesterol.','IV Diretriz Brasileira Sobre Dislipidemias e Prevenção da Aterosclerose Departamento de Aterosclerose da Sociedade Brasileira de Cardiologia\r\nBrasil, Ministério da Saúde. Wannmacher, L.. Indicações e Seleção de Inibidores da Bomba de Prótons. Disponível em:http://portal.saude.gov.br/portal/arquivos/pdf/Tema12-Bomba_de_Protons.pdf Acesso em 20/09/2012.','Para algumas intervenções realizadas no acompanhamento dessa paciente, seria necessário referenciá-la ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados da paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pela paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','Paciente relata está com muita dor de estômago, por isso sente-se indisposta e interrompeu a hidroginástica. Em seus exames laboratoriais, os níveis de colesterol estão acima dos limites de referência. Está fazendo aulas de dança uma vez por semana. Médica prescreveu Insulina Asparte® (ultra-rápida), se preciso antes do café, almoço e jantar de acordo com o esquema: \r\nCaso a glicemia casual estiver < 140 &#61664; não precisa utilizar\r\nSe estiver entre 140 ? 200 mg/dL &#61664; utilizar 2 U da insulina\r\nSe estiver entre 201 ? 250 mg/dL &#61664; utilizar 4 U\r\nSe estiver entre 251 ? 300 mg/dL &#61664; utilizar 6 U\r\nSe estiver entre 301 ? 350 mg/dL &#61664; utilizar 8 U\r\nSe estiver entre 351 ? 400 mg/dL &#61664; utilizar 10 U\r\nSe estiver acima > 400 mg/dL &#61664; utilizar 12 U\r\nA paciente relata que se sente confusa com tantos medicamentos e horários diferentes. Segundo ela, acredita que ?toma tudo errado?, principalmente a insulina.\r\n','xxxxxxxx'),
 (3,'Alergia às Sulfonamidas',1.49,'1943-05-12 00:00:00','V','superior completo','F','V','F','F','clínico geral (L.C), cardiologista (L.A.S.)','mora com uma filha, duas netas e uma bisneta','E.V.','aposentada',58.4,'Não relatou plano de saúde. Adquire os medicamentos na farmácia popular e no posto de saúde.',75,135,'E.V., mulher, branca, data de nascimento 12/05/1943, separada, evangélica, mora com uma filha, duas netas e uma bisneta, cursou o ensino superior completo, aposentada e trabalhava como secretária. Adquire os medicamentos na farmácia popular e no posto de saúde. Os médicos que a acompanha são: clínico geral (L.C), cardiologista (L.A.S.). Altura 1,49 m, Peso 58,40 Kg, Circunferência da cintura 90 cm, não fuma, deixou de consumir bebida alcoólica há 15 anos, bebe entre duas a seis xícaras de café por dia.. Na revisão dos sistemas e da história pessoal informou ter: Hipertensão Arterial Sistêmica (HAS) e Diabetes Mellitus tipo II há 13 anos; diminuição da audição. Espera reduzir o número de medicamentos que toma e reduzir a glicemia. Reclama da elevada quantidade de medicamentos que ingere e expressa medo das reações adversas que estes podem causar. Ela diz que entende a farmacoterapia prescrita, mas não adere porque não entende a doença. Às vezes esquece-se de tomar os medicamentos. Possui alergia a profenid, morfo e poeira e tem arritmia quando toma captopril. Tomou insulina uma única vez, quando teve uma crise de hiperglicemia (370 mg/dl). Retirou o útero aos 45 anos e retirou as amígdalas aos 12 anos. A mãe faleceu aos 72 anos de enfisema pulmonar e tinha DM.e o pai faleceu aos 73 anos de infarto e tinha  HAS.  Come de três em três horas, adora doces, come doce diet, come gordura, não faz caminhada e cansa rápido ao fazer exercícios. Não tem hábito de tomar chá. Vacina-se todos os anos contra a gripe. No dia do primeiro atendimento farmacêutico, a Sra. E.V. apresentou PA (mmHg): 135/75 e Glicemia capilar 310 mg/dL.','Após as intervenções educativas, a paciente diz que compreendeu a importância da adesão ao tratamento. Ficou muito feliz e grata ao farmacêutico que a auxiliou a diminuir o número de medicamentos que utilizava. O médico concordou em suspender o uso da Hidroclorotiazida. Marcou uma consulta com a nutricionista. Expressou o desejo de ter os horários dos medicamentos organizados em uma tabela. Está realizando caminhadas em dias alternados, durante 20 minutos, Após essas mudanças, o paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 130/80; Glicemia capilar casual = 128 mg/dl; Peso = 58 kg; Circunferência Abdominal = 90 cm. ',310,'blicie','15 anos',NULL,'','2-6 xícaras/dia','',NULL,58,80,130,128,NULL,'pt','Descontinuar o uso deste medicamento, visto que os níveis pressóricos da paciente permanecem estáveis e controlados mesmo sem a utilização da Hidroclorotiazida. ','Substituir o Enalapril pelo uso somente da Hidroclorotiazida (tratamento de primeira escolha segundo as Diretrizes de Hipertensão Arterial Sistêmica). Nesse caso, considerar o incômodo da paciente com o aumento da diurese decorrente do uso da Hidroclorotiazida.','','Crise de hiperglicemia','Mãe ? portadora de Diabetes Mellitus. Pai ? portador de Hipertensão Arterial Sistêmica',' A paciente não adere à Hidroclorotiazida desde que a mesma foi prescrita. A paciente não tolera o efeito colateral deste medicamento (aumento da diurese).','V','V','V','F','V','Dr. L.A.S.','Rever a paciente em um mês. Reavaliar a adesão ao tratamento, a manutenção do controle do Diabetes e a mudança dos hábitos alimentares.','Sociedade Brasileira de Hipertensão. VI Diretrizes Brasileiras de Hipertensão, 2010.Disponível em: http://www.sbh.org.br/index.asp Acesso em: 21/09/2012.','Para algumas intervenções realizadas no acompanhamento dessa paciente, seria necessário referenciá-la ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados da paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pela paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','A paciente relata que não toma hidroclorotiazida desde que foi prescrita, acredita que este medicamento não seja necessário, além de preferir não utilizá-lo pelo incômodo de ir muitas vezes ao banheiro. Os níveis pressóricos continuam normalizados. Adere aos outros anti-hipertensivos. Não quer fazer atividade física, abusa da alimentação desregrada. Não adere à Metformina porque não compreende para que serve tantos medicamentos. Além disso, relata que os horários de tomada dos medicamentos são muito confusos. ','XXXXX-XXXX'),
 (4,'Nunca apresentou alergia',1.64,'1945-01-03 00:00:00','V','fundamental completo','F','V','V','M','Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com a esposa e um filho','F.B.O.','Aposentado',62,'Tem acesso ao sistema de saúde pelo plano de saúde da Petrobrás. ',80,130,'F.B.O, homem, branco, data de nascimento 03/01/1945, casado, mora com a esposa e tem três filhos, apenas um mora com ele. É aposentado, trabalhava com sonda de perfuração na Petrobrás. Cursou o ensino fundamental completo e um curso técnico. Tem acesso ao sistema de saúde pelo plano de saúde da Petrobrás. O médico que o acompanha são: Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista). Altura 1,64 m, Peso 62 Kg, Circunferência abdominal 81 cm. Fuma de 10 a 20 cigarros por dia, bebe entre duas a seis xícaras de café por dia.  Parou de ingerir bebida alcoólica há dois anos. Na revisão dos sistemas e da história pessoal informou ter: Diabetes Mellitus tipo II há 30 anos, dores nos pés e constipação. Não tem alimentação adequada, usa adoçante, gosta de mamão, abacaxi, banana e laranja, não toma chás. Não realiza atividades físicas. Vacina-se contra a gripe todos os anos. Relata que deseja melhorar a saúde e espera que os medicamentos o ajudem. Não apresenta preocupação quanto à farmacoterapia, porém reclama que não a compreende muito bem e isso o incomoda muito. Acredita em Deus, mas não segue nenhuma religião. Nunca apresentou alergia e reações adversas aos medicamentos. Quando tinha 28 anos teve um acidente no trabalho e perdeu dois dedos. Tem cinco irmãos, um tinha diabetes e faleceu. O pai e o avô também tinham diabetes. No dia do atendimento, apresentou PA (em mmHg): 130/80, Glicemia capilar 220 mg/dL.','O médico concordou em alterar a posologia do medicamento Tilex® (tomar apenas quando sentir dor). Desse modo, a constipação desapareceu e a dor nos pés não o incomoda mais. Está fazendo caminhada entre três a quatro vezes por semana, durante uma hora. Reduziu os cigarros e concordou com uma meta de 10 cigarros por dia. Com as intervenções educativas, compreendeu a farmacoterapia e importância de aderir à Metformina. O médico concordou em suspender o uso da Glimepirida. Expressou o desejo de ter o horário dos seus medicamentos organizados em uma tabela. Após essas mudanças, o paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 130/80; Glicemia capilar casual = 101 mg/dl; Peso = 67 kg; Circunferência Abdominal = 82 cm. ',220,'blicie','2 anos',NULL,'','2-6 xícaras/dia','','10-20 cigarros por dia',67,80,130,101,NULL,'pt','Alterar a posologia do medicamento Tylex® para \"quando sentir dor\".','Suspender o uso da Glimepirida, visto que os níveis glicêmicos do paciente permanecem dentro dos valores de referência com o uso apenas da Metformina.','','Nenhuma história médica que tenha influência sobre o estado atual','Pai, irmão e avô - portador de Diabetes Mellitus','1. Paciente apresenta constipação como efeito colateral ao uso do medicamento Tylex® (indicado para a neuropatia diabética)\r\n2. Paciente apresentou crise de hipoglicemia ao adicionar o medicamento Glimepirida ao seu tratamento.','V','F','V','F','F','','Rever paciente em um mês. Reavaliar a adesão ao tratamento, o desaparecimento da constipação, a ocorrência de crises de hipoglicemia e a redução do uso de tabaco.','Sociedade Brasileira de Diabetes. Diretriz SBD 2009. Disponível em: http://www.diabetes.org.br/para-profissionais/diretrizes-da-sbd Acesso em: 21/09/2012.','Para algumas intervenções realizadas no acompanhamento desse paciente, seria necessário referenciá-lo ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados do paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pelo paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','O paciente relata ficar muito confuso com os horários de tomada dos medicamentos. Às vezes esquece-se de tomar a Metformina, mas não é frequente. Não utiliza a Glimepirida desde que ?passou mal com ela?, o paciente questiona a necessidade deste medicamento. Teve uma crise de hipoglicemia na última vez que a utilizou, durante a madrugada. Reclama que a constipação o incomoda muito. A dor nos pés melhorou depois que iniciou o tratamento com Tilex®. ','XXXXX-XXXX'),
 (5,'Nunca apresentou alergia',1.6,'1941-09-23 00:00:00','V','fundamental incompleto','F','V','F','F','Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com o esposo em uma cidade do interior e com o neto na capital','G.G.','aposentada',75.55,'Tem acesso ao sistema de saúde pelo GEAP e pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil. ',70,130,'G.G, mulher, branca, data de nascimento 23/09/1941, casada, alterna em duas moradias: com o esposo em uma cidade do interior e com o neto na capital. É aposentada. Tem acesso ao sistema de saúde pelo GEAP e pelo SUS. Cursou o ensino fundamental incompleto. Adquire seus medicamentos na Farmácia Popular do Brasil. Os médicos que a acompanham são: Clínico Geral e um Endocrinologista. Altura 1,60 m, Peso 75,55 Kg, Circunferência da cintura 102 cm. Não fuma, não ingere álcool e bebe entre duas a seis xícaras de café por dia. A paciente relata que comete alguns exageros como utilizar açúcar misturado com adoçante. Gosta de jaca, manga e pinha. Não tem restrições com sal e gordura. Não utiliza chás e não faz exercícios físicos. Na revisão dos sistemas e da história pessoal informou ter: Diabetes Mellitus tipo II diagnosticada há dois anos e hiperlipidemia. A paciente utilizou um hipoglicemiante para tratar uma crise de hipoglicemia (paciente desconhece para que servem os medicamentos). Expressa o desejo de cuidar mais da saúde e que a glicemia seja controlada. É evangélica e acredita que Jesus vai curá-la de tudo. Não apresenta alergia aos medicamentos. Nunca apresentou reações adversas aos medicamentos que utilizou no passado. Fez uma cirurgia de suspensão do útero há cinco anos. Possui cinco filhos, quatro de parto normal e um cesário. A mãe é portadora de Diabetes e o pai faleceu por complicações da Hipertensão Arterial Sistêmcia. No dia do atendimento, apresentou PA (em mmHg): 130/70, Glicemia capilar 276 mg/dL.','A paciente relata que começou a caminhar durante 20 min por dia e iniciou o tratamento para a hiperlipidemia com sinvastatina (20mg, 1 comprimido antes de dormir), prescrita pelo médico. De acordo com ela, após as intervenções educativas, entendeu a importância da adesão e a função de cada medicamento. Além disso, a Srª G.G. concordou em buscar um nutricionista e está muito grata por todo o apoio físico e emocional que tem recebido no programa de Atenção Farmacêutica. Após essas mudanças, a paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 130/70; Glicemia capilar casual = 163 mg/dl; Peso = 75 kg; Circunferência Abdominal = 94 cm.',276,'blicie','',NULL,'','< 2 xícaras/dia','',NULL,75,70,130,163,NULL,'pt','Iniciar tratamento com um hipolipemiante. Sugestão: Sinvastatina.','','','Possui cinco filhos, quatro de parto normal e um cesário','Mãe ? portadora de Diabetes Mellitus. Pai ? portador de Hipertensão Arterial Sistêmica','Paciente apresenta diagnóstico de hiperlipidemia e não utiliza nenhuma farmacoterapia para este problema. De acordo com os últimos exames laboratoriais, os níveis de colesterol estão acima dos valores de referência.','V','F','V','V','','Dr. S.','Rever a paciente em um mês. Reavaliar a adesão ao tratamento, níveis de colesterol, ocorrência de crises hipoglicêmicas e controle da alimentação.','Sociedade Brasileira de Cardiologia. III Diretrizes Brasileiras Sobre Dislipidemias e Diretriz de Prevenção da Aterosclerose do Departamento de Aterosclerose da Sociedade Brasileira de Cardiologia. Disponível em: http://www.cardiol.br/. Acesso em: 21/09/2012.','Para algumas intervenções realizadas no acompanhamento dessa paciente, seria necessário referenciá-la ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados da paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pela paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','A Sra. G.G. diz que às vezes troca o horários da Metformina, por não conseguir entender a prescrição médica. A paciente relata que exagera na comida, mas está tentando melhorar. A paciente está preocupada com o aumento dos seus níveis de colesterolemia, seus exames sugeriram o aparecimento de esteatose hepática (a confiirmar).  Teve crise de hipoglicemia e tomou a metformina pensando que isso iria melhorá-la. Está preocupada com o neto que está passando por problemas. Passou um tempo sem tomar a metformina por estar ?sem cabeça para pensar nela?.  ','XXXXX-XXXX'),
 (6,'Não relatou',1.59,'1935-06-03 00:00:00','V','fundamental completo','F','V','F','F','clínico geral (S.) e endocrinologista (P.)','mora com a filha','I.G.R.','Aposentada e dona de casa',66.4,'Adquire os medicamentos na farmácia popular e em farmácias comerciais e possui o plano da UNIMED',80,120,'I.G.R, mulher, negra,data de nascimento 03/06/1935, casada, católica, mora com a filha, é aposentada e dona de casa, estudou até o ensino fundamental completo e possui nove filhos, um deles faleceu. Adquire os medicamentos na farmácia popular e em farmácias comerciais e possui o plano da UNIMED. Os médicos que a acompanha são: clínico geral (S.) e endocrinologista (P.). Altura 1,59 m, Peso 66,40 Kg, Circunferência da cintura 99 cm, não fuma, não consome bebida alcoólica, bebe menos de duas xícaras de café por dia. Na revisão dos sistemas e da história pessoal informou ter: Diabetes Mellitus tipo II há 13 anos e Depressão. Relata que ser atendida pelo programa de Atenção Farmacêutica é bom porque é uma atividade, uma distração e pode desabafar. Paciente sente necessidade de conversar sobre seus problemas. Espera ficar bem com o tratamento medicamentoso. Ela diz que entende a farmacoterapia prescrita. Teve nove partos normais, retirou o útero e uma mama há 20 anos. O pai tinha diabetes e a mãe câncer, ambos faleceram. Não come açúcar e, segundo ela, a alimentação é moderada. Uma das suas filhas tem hipertensão. Relata que toma chá de mastruz, pois acredita que esse chá curou sua pneumonia no passado. Além desse, toma chá de sambacaitá, carqueja, erva doce, capim santo e pata de vaca. Não está fazendo atividade física. Não se vacinou contra a gripe ano passado. No dia do primeiro atendimento farmacêutico, a Sra. I.G.R apresentou PA (mmHg): 120/80 e Glicemia capilar 355 mg/dL.','Após ser encaminhada ao médico, que lhe prescreveu um antidepressivo (Donaren® 50mg 1 comprimido às 21h), a paciente diz sentir-se mais disposta e está se cuidando melhor. A Srª I.G.R. está muito feliz porque conseguiu controlar sua Diabetes com a troca do seu hipoglicemiante (Médico substituiu o Glifage® por Acarbose, 50 mg, 1 comprimido antes do café da manhã e do jantar). Além disso, esse novo medicamento para a Diabetes não lhe causa mais náuseas e agora ela poderá marcar a cirurgia de catarata.   Após essas mudanças, o paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 130/80; Glicemia capilar casual = 152 mg/dl; Peso = 68 kg; Circunferência Abdominal = 98 cm. ',355,'blicie','',NULL,'','< 2 xícaras/dia','',NULL,68,80,130,152,NULL,'pt','1. Substituir o Glifage® por Acarbose 50mg. Tratamento de primeira escolha, assim como a Metformina, para o Diabetes Mellitus.','2. Adicionar um antidepressivo à farmacoterapia da paciente. Sugestão: Donaren 50mg. Além de tratar a depressão, auxilia no tratamento da dor neurogênica (neuropatia diabética).','','Possui nove filhos, todos por partos normais','Pai ? portador de Diabetes Mellitus. Mãe ? portadora de câncer. Filha - portadora de Hipertensão Arterial Sistêmica','1. Paciente não tolera o efeito colateral causado pelo medicamento Glifage® (náusea e vômito). Desse modo, não adere ao tratamento.\r\n2. Paciente apresenta diagnóstico de Depressão e não utiliza nenhuma farmacoterapia para o tratamento dessa enfermidade. ','V','F','V','F','F','Dr. P.','Rever paciente em um mês. Reavaliar os níveis de glicemia e controle da depressão.','Diretriz Brasileira de Diabetes, 2009. Sociedade Brasileira de Diabetes. Disponível em: http://www.diabetes.org.br/attachments/diretrizes09_final.pdf Acesso: 21/09/2012\r\nCharles F. Lacy, Lora L. Armstrong, Morton P. Goldman, Leonard L. Lance. Medicamentos Lexi-comp Manole. Editora Manole, 2009.','Para algumas intervenções realizadas no acompanhamento dessa paciente, seria necessário referenciá-la ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados da paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pela paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','A Srª I.G.R. reclama muito de insônia, sente-se muito deprimida e isso a desestimula a se cuidar. Sente náuseas e às vezes, vomita quando toma o Glifage®, por isso não adere ao tratamento. O médico a diagnosticou com catarata nos olhos, mas não realizou a cirurgia, porque a Diabetes está descontrolada. Para conseguir engolir o comprimido de Glifage®, a paciente o partia ao meio. Deixou de utilizá-lo por não tolerar as reações adversas. Não realiza atividades físicas. ','xxxxxxxx'),
 (7,'Alergia ao medicamento Naproxeno',1.56,'1946-02-14 00:00:00','V','superior incompleto','V','V','F','M','Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora sozinho ','J.C.A.','aposentado, trabalhava como técnico de contabilidade',56,'Adquire os medicamentos na farmácia popular e em farmácias comunitárias.',85,140,'J.C.A., homem, branco, data de nascimento 14/02/1946, aposentado, trabalhava como técnico de contabilidade, mora sozinho e não tem filhos, cursou o ensino superior incompleto (Direito). Adquire os medicamentos na farmácia popular e em farmácias comunitárias. Os médicos que o acompanham são: Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista). Altura 1,56 m, Peso 56,00 Kg, Circunferência da cintura 89 cm, deixou de fumar há 30 anos, consome bebida alcoólica em festas, menos de dois copos por semana, geralmente cerveja, bebe de duas a seis xícaras de café por dia. Na revisão dos sistemas e da história pessoal informou ter: Hipertensão Arterial e Diabetes Mellitus tipo II há 13 anos, dor de dente (cáries frequentes) e insônia. Relata que usa muitos medicamentos e eles não surtem efeitos. Paciente questiona os efeitos dos medicamentos. Lê muito sobre o universo/religião. Diz que toma os medicamentos no horário certo. Possui alergia ao naproxeno (coceiras, feridas no corpo). Colocou prótese no olho há 40 anos, fez biópsia da próstata há cinco anos, angioplastia e dois cateterismos há dois anos, passou por coma alcoólico quatro vezes. Tio, primo e irmã são portadores de Diabetes. A alimentação é com ?quentinhas?, biscoitos e frutas (geralmente janta o que sobrou da ?quentinha? do almoço). Toma chá de camomila e mulungún. Vacina-se contra a gripe todos os anos. No dia do primeiro atendimento farmacêutico, a Sra. J.C.A. apresentou PA (mmHg): 140/85 e Glicemia capilar 252 mg/dL.','Após intervenções educativas, o paciente compreendeu que não poderia continuar utilizando a Hidroxizina e ficou muito impressionado ao saber que este medicamento contribuía com o aparecimento das suas cáries. Concordou em substituí-lo por um fitoterápico (Passiflorine®, 1 colher de sopa ao deitar) e está muito grato ao farmacêutico. Passou a dormir melhor com a ajuda do fitoterápico e depois que iniciou as atividades físicas. Além disso, relatou compreender a importância da adesão aos medicamentos e os riscos de substituir a Metformina pelo chá de insulina. Marcou consulta com a nutricionista e com o odontólogo. Após essas mudanças, o paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 110/60; Glicemia capilar casual = 128 mg/dl; Peso = 56 kg; Circunferência Abdominal = 83 cm. ',252,'blicie','','','','< 2 xícaras/dia','30 anos',NULL,56,60,110,128,'cerveja','pt','O Sr. J.C.A. mora sozinho e não disponibiliza de recursos para contratar uma cozinheira, por gentileza, considere essa informação ao definir a dieta deste paciente.','','','Colocou prótese no olho há 40 anos, fez biópsia da próstata há cinco anos, angioplastia e dois cateterismos há dois anos, passou por coma alcoólico quatro vezes','Tio, primo e irmã - portadores de Diabetes Mellitus','Motivos de referência à consulta com a nutricionista:\r\n\r\nO Sr. J.C.A. é portador de Hipertensão Arterial e Diabetes Mellitus tipo II há 13 anos. No dia do atendimento farmacêutico, o Sra. J.C.A. apresentou PA (mmHg): 140/85 e Glicemia capilar 252 mg/dL.\r\n\r\nPaciente apresenta alimentação desregrada. Segundo o Sr. J.C.A.: A alimentação é com ?quentinhas?, biscoitos e frutas (geralmente janta o que sobrou da ?quentinha? do almoço). ','F','V','F','F','V','Dra. V. (nutricionista)','Rever o paciente em um mês. Reavaliar a adesão ao tratamento, a manutenção dos níveis de glicemia, a evolução do tratamento dentário e o desaparecimento da insônia.','xxxxxxx','Para algumas intervenções realizadas no acompanhamento desse paciente, seria necessário referenciá-lo ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados do paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pelo paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','O paciente relata que uma médica lhe prescreveu o medicamento Hidroxizina há 10 anos e ele o utiliza até hoje porque este medicamento o ajuda a dormir bem. O paciente suspendeu o uso da Metformina e está tomando chá de insulina, acredita que assim conseguirá controlar os seus níveis glicêmicos. Questiona o efeito dos medicamentos, por não utiliza o Propranolol.','XXXXX-XXXX'),
 (8,'Alergia a antibióticos',1.51,'1935-03-19 00:00:00','V','medio completo','F','V','F','M','Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com uma filha','J.J.','Aposentado',53.3,'Tem acesso ao sistema de saúde pela GEAP. Adquire os medicamentos na Farmácia Popular do Brasil e farmácias comunitárias',80,140,'J.J. homem, branco, data de nascimento 19/03/1935, casado, viúvo, tem 2 filhos, mora com uma filha, é aposentado como operador de telecomunicação. Cursou o ensino médio completo. Tem acesso ao sistema de saúde pela GEAP. Adquire os medicamentos na Farmácia Popular do Brasil e farmácias comunitárias. Os médicos que o acompanham são Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista). Altura 1,51 m, Peso 53,3 Kg, Circunferência abdominal 81 cm. O paciente não ingere bebida alcoólica, não fuma, bebe menos que duas xícaras de café por dia. Na revisão dos sistemas e da história pessoal, informou ter: Hiperlipidemia e Hipertensão Aterial Sistêmica (HAS) diagnosticadas há 15 anos. Paciente não tolera o efeito colateral de alguns medicamentos, isso o incomoda muito. Paciente diz aderir ao tratamento. Relata que não utiliza medicamentos por conta própria e ?tem esperança de controlar as suas doenças?. Refere alergia aos antibióticos (desmaio). Reação adversa ao AAS (suspeita de sangramento). Sua mãe morreu por conseqüências da HAS, tem 12 irmãos, todos portadores de HAS. Relata que reduziu bastante a quantidade de sal na alimentação, consome pouca gordura, gosta de jaca, manga e mamão. Não gosta de verduras, mas ingere por saber fazer bem à saúde. Faz caminhadas cerca de três a quatro vezes na semana. Gosta de chá de cidreira, boldo, capim-santo. No dia do atendimento, apresentou PA (em mmHg): 140/80, Glicemia capilar casual = 128 mg/dl.','Com as intervenções educativas, o paciente entendeu a importância e as peculiaridades da sua farmacoterapia, em especial a interação fármaco-alimento do Atenolol. O paciente concordou em realizar 30 minutos de caminhada por dia e está apto para controlar a alimentação. Ele expressou o desejo de ter o horário do uso dos medicamentos organizados em uma tabela. Após intervenção farmacêutica, o médico prescreveu um hipolipemiante (Sinvastatina 20mg, 1 comprimido antes de dormir) e concordou em trocar o Enalapril por outro medicamento (Hidroclorotiazida 25mg, 1 vez ao dia) que não cause ao Sr. J.J. os referidos efeitos colaterais. Após essas mudanças, o paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 130/80; Glicemia capilar casual = 128 mg/dl; Peso = 54 kg; Circunferência Abdominal = 81,5 cm. ',128,'blicie','',NULL,'','< 2 xícaras/dia','',NULL,54,80,130,128,NULL,'pt','1. Correlacionar a hiperlipidemia com exames clínicos e laboratoriais (LDL-c)e avaliar o risco-benefício de iniciar farmacoterapia com a Sinvastatina, hipolipemiante que apresenta bons índices na avaliação risco/benefício segundo as III Diretrizes Brasileiras Sobre Dislipidemias e Diretriz de Prevenção da Aterosclerose do Departamento de Aterosclerose da Sociedade Brasileira de Cardiologia, 2001.','2. Correlacionar com exames clínicos e laboratoriais e avaliar o risco-benefício de substituir o Enalapril por Hidroclorotiazida 25mg, medicamento de primeira escolha para o tratamento da Hipertensão e que apresenta bons índices na avaliação risco/benefício, segundo as VI Diretrizes Brasileiras de Hipertensão, 2010.','','Não relatou','Mãe e irmãos - portadores de Hipertensão Arterial Sistêmica','O Sr. J.J. é portador de Hiperlipidemia e Hipertensão Aterial Sistêmica (HAS) diagnosticadas há 15 anos.\r\nDurante a avaliação inicial foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados:\r\n1. Os níveis de colesterolemia do paciente apresentam-se elevados. O Sr. J.J. não faz uso de nenhum hipolipemiante.\r\n2. O paciente relata não tolerar os efeitos colaterais do medicamento Enalapril (desconforto gastrointestinal, constipação e garganta seca).\r\n\r\n\r\n\r\nObs: Segue em anexo o diário pessoal dos medicamentos utilizados pelo paciente.','V','F','F','','','Dr. S.','Rever o paciente em um mês. Reavaliar níveis pressóricos (monitorar interação HCT + Atenolol = diminuição dos níveis de potássio?), desaparecimento dos efeitos colaterais (Enalapril) e controle dos níveis de colesterolemia (Sinvastatina).','Sociedade Brasileira de Hipertensão. VI Diretrizes Brasileiras de Hipertensão, 2010.Disponível em: http://www.sbh.org.br/index.asp Acesso em: 21/09/2012.\r\n\r\nSociedade Brasileira de Cardiologia. III Diretrizes Brasileiras Sobre Dislipidemias e Diretriz de Prevenção da Aterosclerose do Departamento de Aterosclerose da Sociedade Brasileira de Cardiologia. Disponível em: http://www.cardiol.br/. Acesso em: 21/09/2012.\r\n','Para algumas intervenções realizadas no acompanhamento desse paciente, seria necessário referenciá-lo ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados do paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pelo paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','O Sr. J.J. sente-se indisposto para realizar atividade física. O paciente sente que o Enalapril lhe causa desconforto gastrointestinal, constipação e garganta seca. Relata que não tolera esses efeitos colaterais. Toma o Atenolol junto com o almoço, segundo ele, é mais fácil para lembrar. No último final de semana, o paciente foi ao aniversário do seu melhor amigo e abusou nas frituras que foram servidas no evento. Os níveis de colesterol estão elevados.','XXXXX-XXXX'),
 (9,'Não relatou',1.56,'1949-09-08 00:00:00','V','superior incompleto','V','V','F','M','Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com três ','J.R.','Aposentado',58.2,'O paciente é usuário do SUS, adquire os medicamentos na Unidade Básica de Saúde, na Farmácia Popular do Brasil e em farmácias de manipulação. ',72,126,'J.R. homem, branco, data de nascimento 08/09/1949, casado, viúvo, tem cinco filhos, mora com três deles, é aposentado, técnico em eletrônica, cursou ensino superior incompleto em Engenharia Química. O paciente é usuário do SUS, adquire os medicamentos na Unidade Básica de Saúde, na Farmácia Popular do Brasil e em farmácias de manipulação. Os médicos que o acompanham são: Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista). Altura 1,56 m, Peso 58,2 Kg, Circunferência abdominal 90 cm, não fuma, bebe café de 2-6 xícaras por dia e ingere bebida alcoólica, menos de dois copos de cerveja por semana. Na revisão dos sistemas e da história pessoal, informou ter: Hipertensão Arterial Sistêmica (HAS) diagnosticada há 35 anos e Diabetes Mellitus tipo II desde 2008. Anda de bicicleta por 15 minutos/ duas vezes na semana. Na alimentação, reduziu o sal e a gordura. Relata que às vezes sente-se mal quando toma o anti-hipertensivo (tontura, sudorese, sensação de desmaio, fraqueza, tremor), por isso não adere completamente a este medicamento. Paciente não tolera o efeito colateral dos medicamentos. Não gosta que corte alimentos da sua dieta, prefere reduzir e moderar na alimentação diária. Relata que no passado teve reação adversa ao Captopril, Hidroclorotiazida e o Propranolol, sentia sensação de desmaio. Os pais são hipertensos, assim como todos os irmãos (10). No dia do primeiro atendimento farmacêutico, o Sr. J.R. apresentou PA (mmHg): 126/72; Glicemia capilar casual = 128 mg/dl.','O Sr. J.R. retornou ao médico e está de acordo em utilizar outro medicamento (Valsartana, 80mg, 1 comprimido uma vez ao dia) que mantenha o controle da PA e não lhe cause os referidos efeitos colaterais. Ele expressou o desejo de ter o horário do uso dos medicamentos organizados em uma tabela, comprometendo-se em aderir ao tratamento. Após intervenções educativas, compreendeu que é portador de doenças crônicas e não deve deixar de tomar os medicamentos quando se sente bem. Após essas mudanças, o paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 120/70; Glicemia capilar casual = 128 mg/dl; Altura 1,56 m, Peso 55,2 Kg, Circunferência abdominal 87 cm. ',128,'blicie','','< 2 copos/semana','','2-6 xícaras/dia','',NULL,55.2,70,120,128,'cerveja','pt','Correlacionar com exames clínicos e laboratoriais e avaliar o risco-benefício de substituir o Losartana por Valsartana, medicamento que apresenta o mesmo mecanismo de ação do anterior (Bloqueadores do receptor AT1) e sobre o qual não há relatos na literatura de causar crises de hipoglicemia.','','','Não relatou','Pais e irmãos - portadores de Hipertensão Arterial Sistêmica','O Sr. J.R. é portador de Hipertensão Arterial Sistêmica (HAS) há 35 anos e Diabetes Mellitus tipo II desde 2008.\r\nDurante a avaliação inicial no serviço de Atenção Farmacêutica foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados:\r\no paciente relata que, algumas vezes, ao utilizar o anti-hipertensivo Losartana sente-se mal com tontura, sudorese, sensação de desmaio, fraqueza e tremor. \r\n\r\nA presença de reação adversa a este medicamento foi analisada por meio da base de dados Lexi-comp (referência oficial da Associação Americana de Farmacêuticos), a qual apontou a possibilidade de crises de hipoglicemia durante a utilização deste medicamento.  \r\n\r\nObs: Segue em anexo o diário pessoal dos medicamentos utilizados pelo paciente.','','V','','','V','Dr. S.','Rever paciente em um mês. Reavaliar a adesão ao tratamento, controle da PA e desaparecimento dos efeitos colaterais (crise de hipoglicemia).','Charles F. Lacy, Lora L. Armstrong, Morton P. Goldman, Leonard L. Lance. Medicamentos Lexi-comp Manole. Editora Manole, 2009.','Para algumas intervenções realizadas no acompanhamento desse paciente, seria necessário referenciá-lo ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados do paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pelo paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','Paciente relata que viajou no final de semana e esqueceu-se de levar o anti-hipertensivo. Desse modo, a PA atingiu 170/10 mmHg. Está andando de bicicleta 40 minutos/ 3 vezes por semana. Às vezes deixa de tomar o medicamento Losartana por apresentar crises de hipoglicemia, mas não é frequente. Paciente não tolera este efeito colateral. Quando se sente bem, deixa de tomar o hipoglicemiante. ','XXXXX-XXXX'),
 (10,'Nunca apresentou alergia',1.5,'1943-07-04 00:00:00','V','fundamental completo','F','V','F','F','Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com o esposo e dois filhos','J.V.S.C.','aposentada e dona de casa',61.3,'Adquire os medicamentos na farmácia popular e no posto de saúde',79,143,'J.V.S.C., mulher, negra, data de nascimento 04/07/1943, casada, católica, mora com o esposo e dois filhos, é aposentada e dona de casa, estudou até o ensino fundamental completo, possui cinco filhos e cinco netos. Adquire os medicamentos na farmácia popular e no posto de saúde. É acompanhada Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista). Altura 1,50 m, Peso 61,30 Kg, Circunferência abdominal 98 cm, não fuma, não consome bebida alcoólica, bebe café entre duas a seis xícaras por dia. Na revisão dos sistemas e da história pessoal informou ter: Hipertensão Arterial Sistêmica (HAS) e Diabetes Mellitus tipo II há 13 anos. Espera melhorar com o tratamento medicamentoso. Ela diz que entende a farmacoterapia prescrita e confessa que exagera na alimentação. Acredita que não precisa utilizar o medicamento para a HAS, porque a mesma está controlada. Paciente prefere não tomar o medicamento quando se sente bem. Não possui alergias. Teve os filhos por partos normais. Não fuma, não bebe e toma entre 2 a 6 xícaras de café por dia. Alimenta-se mal: come muito cuscuz, exagera no adoçante, ingere muito sal e gordura. Usa chás de boldo, camomila, cidreira, limão, capim santo. Tentou realizar atividade física, mas sentiu-se muito cansada e desistiu (tentou uma hora de caminhada).  No dia do primeiro atendimento farmacêutico, a Sra. J.V.S.C apresentou PA (mmHg): 143/79 e Glicemia capilar 353 mg/dL.','A paciente concordou em realizar 15 minutos de caminhada por dia e ir aumentando esse tempo gradativamente. Marcou uma consulta com a nutricionista. Relatou que o novo medicamento para a HAS (Nifedipino 5mg, 1 vez ao dia) não lhe causa mais tosse e ela está muito aliviada. Após as intervenções educativas, compreendeu a importância de aderir ao tratamento e a importância de não substituir a Metformina por conta própria. Sente-se estimulada a marcar a cirurgia de catarata, pois ?até que enfim, controlei essa bendita Diabetes!?. Após essas mudanças, a paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 130/80; Glicemia capilar casual = 121 mg/dl; Peso = 65 kg; Circunferência Abdominal = 97 cm. ',353,'blicie','',NULL,'','2-6 xícaras/dia','',NULL,65,80,130,121,NULL,'pt','Correlacionar com exames clínicos e laboratoriais e avaliar o risco-benefício de substituir o Captopril por outro anti-hipertensivo da sua escolha que apresente bons índices na avaliação risco/benefício e que não apresente o risco dos referidos efeitos colaterais.','','','Todos os filhos por partos normais','Não relatou','A Srª. J.V.S.C. apresenta Hipertensão Arterial Sistêmica e Diabetes Mellitus tipo II há 13 anos. Durante a avaliação inicial no serviço de Atenção Farmacêutica foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados: a paciente relata que apresenta tosse seca quando utiliza o captopril e isso a incomoda muito. \r\nA presença de reação adversa ao medicamento ao Captopril foi analisada por meio da base de dados Lexi-comp (referência oficial da Associação Americana de Farmacêuticos), a qual apontou presença de tosse seca em 0,5 a 2% dos casos durante o uso deste medicamento.\r\n\r\nObs: Segue em anexo o diário pessoal dos medicamentos utilizados pelo paciente.','V','F','V','F','V','Dr. S.','Rever paciente em um mês. Reavaliar a adesão ao tratamento, desaparecimento da tosse seca, manutenção do controle do DM e HAS e mudança do estilo de vida.','Charles F. Lacy, Lora L. Armstrong, Morton P. Goldman, Leonard L. Lance. Medicamentos Lexi-comp Manole. Editora Manole, 2009.','Para algumas intervenções realizadas no acompanhamento dessa paciente, seria necessário referenciá-la ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados da paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pela paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','A Srª J.V.S.C. relata que tem catarata, mas não pode operar devido a Diabetes Mellitus descontrolada. Apresenta tosse seca quando utiliza o captopril e isso a incomoda muito. Deixa de tomar o anti-hipertensivo quando sente que a HAS está contolada. Paciente prefere não tomar o medicamento quando se sente bem. Esquece-se de tomar a metformina e a substituiu por conta própria, na última semana, por cápsulas de ?pata de vaca? indicadas por uma vendedora porta-a-porta. ','XXXXX-XXXX'),
 (11,'Alergia à penicilina',1.72,'1946-05-17 00:00:00','V','fundamental completo','F','V','F','M','Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com a esposa e um filho','J.F.C.','Aposentado',71,'Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos no posto da saúde e em farmácias comerciais. ',88,144,'J.F.C., homem, branco, data de nascimento 17/05/1946, casado, tem quatro filhos e apenas um mora com ele. Trabalhava como motorista, mas hoje é aposentado. Cursou o ensino fundamental completo Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos no posto da saúde e em farmácias comerciais. Os médicos que fazem o seu acompanhamento são: Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista). Altura = 1,72 cm, Peso= 71 kg, Circunferência Abdominal= 91 cm. Parou de fumar há um ano, nunca fez uso de álcool e toma mais de duas xícaras de café por dia. Na revisão de sistemas e da história pessoal informou ter: Hipertensão Arterial Sistêmica (HAS) e Diabetes Mellitus tipo II há 10 anos e hiperlipidemia. Realizou três pontos de safena há 10 anos Quanto ao seu tratamento, o paciente relata não ter nenhuma preocupação, pois é ?amigo do medicamento?. O paciente disse que tem uma tabela com o horário de tomada dos medicamentos, mas questiona a necessidade de usá-los todos os dias. Frequenta uma igreja evangélica há dois anos. Possui alergia à penicilina e a derivados. Sua mãe faleceu por causa de uma rejeição a uma prótese de platina na perna, seu pai sofria de Hipertensão Arterial Sistêmica e de Diabetes Mellitus. Alegou que consome pequenas quantidades de gorduras, massas e sal, que faz caminhada de 15 a 20 min por dia, toma chá de cidreira toda noite e se vacinou contra a gripe. No dia do primeiro atendimento farmacêutico, o Sr. J.F.C. apresentou PA (mmHg): 144/88 e Glicemia capilar 190 mg/dL.','Após intervenções educativas, o paciente concordou em retornar ao o médico e em utilizar mais um medicamento (Atorvastatina 40mg, 1 comprimido antes de dormir) para o tratamento da hiperlipidemia. Marcou consulta com uma nutricionista e começou a realizar atividade física. O Sr. J.F.C. comentou que compreendeu a importância adesão ao tratamento e expressou a necessidade de organizar seus horários de medicamentos em uma tabela. Após essas mudanças, o paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 140/80; Glicemia capilar casual = 144 mg/dl; Peso = 71,30 kg; Circunferência Abdominal = 88 cm. ',190,'blicie','',NULL,'','2-6 xícaras/dia','2 anos',NULL,71.3,80,140,144,NULL,'pt','1. Correlacionar com exames clínicos e laboratoriais e avaliar o risco-benefício de iniciar uma nova farmacoterapia com um hipolipemiante da sua escolha. Ressaltamos que as vastatinas ou estatinas ou inibidores da HMG-CoA redutase ( (lovastatina 20mg-80mg, sinvastatina 10mg-80mg, pravastatina 20mg-40mg, fluvastatina 10mg-80mg, atorvastatina 10mg-80mg) apresentam o escore máximo em níveis de recomendação e de evidência clínica para a redução do colesterol LDL. ','','','Não relatou','Pai ? portador de Diabetes Mellitus e Hipertensão Arterial Sistêmica','O Sr. J.F.C. é portador de Hipertensão Arterial Sistêmica (HAS) e Diabetes Mellitus tipo II há 10 anos e Hiperlipidemia. Durante a avaliação inicial no serviço de Atenção Farmacêutica foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados: o paciente apresenta elevados níveis de colesterolemia (vide exames laboratoriais) e não faz uso de nenhum hipolipemiante.\r\n\r\nDe acordo com a III Diretrizes Brasileiras Sobre Dislipidemias e Diretriz de Prevenção da Aterosclerose do Departamento de Aterosclerose da Sociedade Brasileira de Cardiologia, os níveis de colesterol apresentado pelo paciente requer tratamento medicamentoso imediato.\r\n\r\nObs: Segue em anexo o diário pessoal dos medicamentos utilizados pelo paciente.','F','F','F','F','V','Dr. S.','Rever o paciente em um mês. Reavaliar adesão ao tratamento, redução da P.A. e níveis de colesterol.','Sociedade Brasileira de Cardiologia. III Diretrizes Brasileiras Sobre Dislipidemias e Diretriz de Prevenção da Aterosclerose do Departamento de Aterosclerose da Sociedade Brasileira de Cardiologia. Disponível em: http://www.cardiol.br/. Acesso em: 21/09/2012.','Para algumas intervenções realizadas no acompanhamento desse paciente, seria necessário referenciá-lo ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados do paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pelo paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','No 2º atendimento, a Sra. V.C. estava presente e relatou que o Sr. J.F.C. não realizava caminhada e não tomava utilizava o medicamento Nifedipino. Os níveis de colesterol do paciente estão acima dos limites de referência, ainda assim ele não faz uso de nenhum hipolipemiante. O paciente apresenta resistência em aumentar o número de medicamentos que ingere, por isso reluta em retornar ao médico. \r\n','XXXXX-XXXX'),
 (12,'Alergia à penicilina',1.6,'1942-08-16 00:00:00','V','fundamental completo','F','V','F','M','Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com a esposa, a sogra e o filho','J.F.S.','Aposentado',65,'Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil. ',90,154,'J.F.S, homem, branco, data de nascimento 16/08/1942, casado, mora com a esposa, a sogra e o filho. É caminhoneiro aposentado. Estudou até o ensino fundamental. Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil. O médico que o acompanha é o Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista), atende em clínicas particulares. Altura 1,60 m, Peso 65 Kg, Circunferência da cintura 91 cm. Não fuma, ingere entre duas a seis xícaras de café por dia. Parou de beber bebidas alcoólicas há 10 anos. Na revisão dos sistemas e da história pessoal informou ter: Hipertensão Arterial Sistêmica (HAS) e Diabetes Mellitus tipo II há nove anos. Expressa o desejo de controlar e compreender seu tratamento medicamentoso. Ele não acredita que os medicamentos possam controlar a HAS, a glicemia e os triglicerídeos. Paciente questiona os efeitos dos medicamentos. É católico praticante. Tem alergia à penicilina. Utiliza óculos. Fez cirurgia a laser nos olhos por complicações na retina causada pelo diabetes. Já foi hospitalizado duas vezes por causa da pressão descontrolada e frisa que nunca foi para a emergência por causa do diabetes. A mãe teve HAS. A alimentação é exagerada, mas diz que ?come tudo e nada o faz mal?. Tem sempre ?garrafadas em casa?. Toma chá de ?pata de vaca? quase todos os dias e come amora de vez em quando, acredita que seja terapêutica. Já utilizou captopril e hidroclorotiazida, parou porque não fazia mais efeito. Vacina-se todos os anos. Faz 30 min de caminhada entre duas a três vezes na semana. No dia do atendimento, apresentou PA (em mmHg): 154/90, Glicemia capilar 255 mg/dL.','O Sr. J.F.S. relata que compreendeu a importância de controlar sua alimentação. Expressou a necessidade de buscar uma ajuda profissional para esse controle. Segundo o mesmo, a tabela de horário facilitará a organização e adesão aos medicamentos. Após as intervenções educativas, o paciente compreendeu o efeito dos medicamentos e comprometeu-se a testar esse efeito, aderindo ao tratamento nos próximos três meses. A médica trocou a Metformina por Glibenclamida (5mg, duas vezes ao dia, antes do café da manhã e jantar) e suspendeu o uso do colírio, a retinopatia mostrou-se estável. Após essas mudanças, o paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 150/90; Glicemia capilar casual = 90 mg/dl; Peso = 62 kg; Circunferência Abdominal = 90 cm. ',255,'blicie','10 anos',NULL,'','2-6 xícaras/dia','',NULL,62,90,150,90,NULL,'pt','1. Correlacionar com exames clínicos e laboratoriais e avaliar o risco-benefício de substituir a Metformina por outro hipoglicemiante da sua escolha. Ressaltamos que apenas quando os valores da glicemia de jejum estiverem abaixo de 150mg/dl, estão indicados medicamentos que não promovam o aumento da secreção de insulina (ex: Metformina), segundo as Diretrizes Brasileiras de Diabetes, 2009.','2. Encaminhar o paciente ao Oftalmologista.','','Paciente foi hospitalizado duas vezes por crise de HAS','Mãe ? portadora de Hipertensão Arterial Sistêmica','O Sr. J.F.S. é portador de Hipertensão Arterial Sistêmica e Diabetes Mellitus tipo II há nove anos. Há dois anos foi diagnosticado com Retinopatia Diabética (RD). Durante a avaliação inicial no serviço de Atenção Farmacêutica foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados: \r\n1. O paciente apresenta dor estomacal ao utilizar a Metformina; 2. O paciente utiliza o mesmo colírio (Combigan®) prescrito há dois anos, para o tratamento da RD.\r\nA presença de reação adversa ao medicamento Metformina foi analisada por meio da base de dados Lexi-comp (referência oficial da Associação Americana de Farmacêuticos), a qual apontou presença de dispepsia ou azia em 6 a 7% dos casos durante o uso deste medicamento.\r\nQuanto à RD, as Diretrizes da Sociedade Brasileira de Diabetes recomenda acompanhamento com oftalmologista com frequência definida de acordo com a gravidade da lesão. Obs: Segue em anexo o diário pessoal dos medicamentos utilizados pelo paciente.','V','V','F','F','F','Dr. P.','Rever paciente em um mês. Reavaliar adesão ao tratamento, mudança do estilo de vida, controle da PA e da glicemia.','Charles F. Lacy, Lora L. Armstrong, Morton P. Goldman, Leonard L. Lance. Medicamentos Lexi-comp Manole. Editora Manole, 2009.\r\n\r\nSociedade Brasileira de Diabetes. Diretriz da Sociedade Brasileira de Diabetes, 2009. Disponívem em: http://www.diabetes.org.br/attachments/diretrizes09_final.pdf Acesso em: 23/09/2012.','Para algumas intervenções realizadas no acompanhamento desse paciente, seria necessário referenciá-lo ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados do paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pelo paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','O paciente reclama que o medicamento Dimefor® 850mg provoca muita dor no estômago, quando isso acontece, ele deixa de utilizá-lo por alguns dias. Desse modo, gostaria de substituí-lo. Informa que começou a trabalhar na roça e por isso, muitas vezes esquece-se de tomar o Benicar® por ser no meio da manhã (às 10h) e também por acreditar que este medicamento não faça efeito. Expressa o desejo de ter o horário dos seus medicamentos mais organizado. Está há dois anos sem procurar um oftamologista e utiliza o mesmo colírio prescrito para retinopatia diabética na última consulta. ','XXXXX-XXXX'),
 (13,'Nunca apresentou alergia',1.56,'1947-07-10 00:00:00','V','superior incompleto','V','V','F','M','Dra. S. (Clínico Geral) e Dr. P. (Cardiologista)','mora com a esposa ','M.A.O.','Aposentado',61.5,'Tem acesso ao sistema de saúde pelo Plano Capes Saúde. Adquire os medicamentos na Farmácia Popular do Brasil e farmácias comunitárias. ',80,136,'M.A.O., homem, branco, data de nascimento 10/07/1947, casado, mora com a esposa, aposentado pela Fundação Nacional de Saúde, cursou um ano de graduação em ciências contábeis. Tem acesso ao sistema de saúde pelo Plano Capes Saúde. Adquire os medicamentos na Farmácia Popular do Brasil e farmácias comunitárias. Os médicos que o acompanham são: Dra. S. (Clínico Geral) e Dr. P. (Cardiologista). Altura 1,56 m, Peso 61,5 Kg, Circunferência da cintura 90 cm, não fuma, bebe café de 2-6 xícaras por dia, toma chá de cidreira e boldo, bebe cerveja no final de semana. Na revisão dos sistemas e da história pessoal, informou ter: Hiperlipidemia e Hipertensão Aterial Sistêmica (HAS) diagnosticada há dois anos, refluxo e edema periférico. Faz caminhada durante 50 minutos/ 3 vezes por semana. Na alimentação, reduz o sal e carnes vermelhas, gosta de frutas, verduras (cebola, tomate, cenoura, beterraba). Relata não ter alergia a medicamento. Espera que o tratamento medicamentoso ajude a controlar suas doenças, mas às vezes não sente que está melhorando. Paciente questiona os efeitos dos medicamentos. Já foi para a urgência três vezes por causa do refluxo, por isso iniciou o tratamento com o Pantoprazol e sente-se melhor. O médico substituiu o Captopril por Anlodipino há um mês, porque ?perdeu o efeito?. Dizem que seu pai morreu de problema no coração, não o conheceu, todos os irmãos (5) tem HAS. No dia do primeiro atendimento farmacêutico, o Sr. M.A.O. apresentou PA (mmHg): 136/80 e Glicemia capilar = 126 mg/dl','O paciente voltou a realizar 30 minutos de caminhada por dia e sente-se mais relaxado. Ele expressou o desejo de ter o horário do dos medicamentos organizados em uma tabela. Após as intervenções educativas, o Sr. M.A.O. se comprometeu em aderir ao tratamento. O médico substituiu o medicamento Anlodipino por Losartana (50mg por dia), o inchaço nas pernas diminuiu. Após essas mudanças, o paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 125/70; Peso = 61,5 kg; Glicemia capilar = 126 mg/dl; Circunferência Abdominal = 90 cm. ',126,'blicie','','','','2-6 xícaras/dia','',NULL,61.5,70,125,126,'cerveja','pt','1. Correlacionar com exames clínicos e laboratoriais e avaliar o risco-benefício de substituir o Anlodipino por um medicamento da sua escolha. Ressaltamos que o paciente já utilizou Inibidores da ECA no passado (Captopril), o uso foi suspenso pela falta de efetividade. Os Bloqueadores do receptor AT1 (ex: Losartana) são medicamentos que apresentam bons índices na avaliação risco/benefício, segundo as VI Diretrizes Brasileiras de Hipertensão (2010) e com menores riscos de causar as referidas Reações Adversas.','','','Paciente foi hospitalizado três vezes por crise de refluxo','Pais e irmãos - portadores de Hipertensão Arterial Sistêmica','O Sr. M.A.O. é portador de Hiperlipidemia e Hipertensão Aterial Sistêmica (HAS) diagnosticadas há 02 anos. Além disso, apresenta refluxo e edema periférico.\r\nDurante a avaliação inicial no serviço de Atenção Farmacêutica foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados:\r\no paciente relata que o edema periférico se agravou desde o último mês (mesmo período em que iniciou o uso do medicamento Anlodipino).\r\n\r\nA presença de reação adversa ao medicamento Anlodipino foi analisada por meio da base de dados Lexi-comp (referência oficial da Associação Americana de Farmacêuticos), a qual apontou ocorrência de edema periférico em 2 a 15% dos casos e dispepsia em 1 a 2% dos casos durante o uso deste medicamento.\r\n\r\nObs: Segue em anexo o diário pessoal dos medicamentos utilizados pelo paciente','V','V','F','F','F','Dr. P.','Rever paciente em um mês. Reavaliar a adesão ao tratamento, níveis pressóricos, níveis de colesterol, controle do edema periférico e mudança no estilo de vida.','Charles F. Lacy, Lora L. Armstrong, Morton P. Goldman, Leonard L. Lance. Medicamentos Lexi-comp Manole. Editora Manole, 2009.\r\n\r\nSociedade Brasileira de Hipertensão. VI Diretrizes Brasileiras de Hipertensão, 2010.Disponível em: http://www.sbh.org.br/index.asp Acesso em: 21/09/2012.','Para algumas intervenções realizadas no acompanhamento desse paciente, seria necessário referenciá-lo ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados do paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pelo paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','O Sr. M.A.O. relata que às vezes esquece de o medicamento para a Hiperlipidemia. Ele não acredita no efeito dos seus medicamentos. Parou de fazer atividade física porque está no período chuvoso, sente-se mais ansioso desde que parou de caminhar. O inchaço nas suas pernas tem piorado nos último mês.','XXXXX-XXXX'),
 (14,'Alergia a camarão, azeitona, salsicha e inseticida',1.45,'1954-06-20 00:00:00','V','superior incompleto','F','V','F','F','Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com um irmão ','PV Simulação: M.A.S.A.','aposentada',59,'Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil e farmácias comunitárias. ',81,144,'PV Simulação: M.A.S.A., mulher, branca, data de nascimento 20/06/1954, solteira, aposentada, mora com um irmão e é técnica de enfermagem, cursou o ensino superior incompleto. Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil e farmácias comunitárias. Os médicos que a acompanham são: Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista). Altura 1,45 m, Peso 59 Kg, Circunferência da cintura 97 cm, não fuma, não consome bebida alcoólica, bebe café entre duas a seis xícaras por dia. Na revisão dos sistemas e da história pessoal informou ter: Hipertensão Arterial Sistêmica (HAS) e Diabetes Mellitus tipo II há 13 anos. Relata que deseja ?ficar boa. Expressa preocupação com a grande quantidade de medicamentos que ingere. Paciente sente medo de usar vários medicamentos. Relata entender sobre a sua farmacoterapia e aderir ao tratamento. A paciente elaborou por conta própria, uma tabela de horários para os seus medicamentos. Tem alergia a camarão, azeitona, salsicha e inseticida. Ficou internada 12/2008 por 11 dias devido a crises de HAS e Diabetes. Relata que toma ?muito cuidado com a alimentação?, não come açúcar, ingere pouco sal e gordura. Usa chás todos os dias: abacate e boldo. Faz 45 minutos de caminhada em dias alternados e participa do grupo de canto da pastoral na igreja. Tem o plano OSAF ?pra não dá trabalho a ninguém?. No dia do primeiro atendimento farmacêutico, a Srª. M.A.S.A. apresentou PA (mmHg): 144/81 e Glicemia capilar 256 mg/dL.','Paciente relata que o médico substituiu o Captopril por Atenolol (50mg, 1 vez ao dia), a tosse seca desapareceu e a Srª M.A.S.A. sente-se muito aliviada porque diminuiu o número de tomadas de medicamentos por dia. Após as intervenções educativas, a paciente relata que entendeu a importância da adesão aos medicamentos e está tomando a Glibenclamida conforme a prescrição. Após essas mudanças, a paciente apresentou os seguintes parâmetros clínicos: PA (mmHg) = 130/80; Glicemia capilar casual = 128 mg/dl; Peso = 59 kg; Circunferência Abdominal = 97 cm. ',256,'blicie','',NULL,'','2-6 xícaras/dia','',NULL,59,80,130,128,NULL,'pt','1. Correlacionar com exames clínicos e laboratoriais e avaliar o risco-benefício de substituir o Captopril por outro anti-hipertensivo da sua escolha, desde que apresenta bons índices na avaliação risco/benefício e menor probabilidade de ocorrência das referida reação adversa, segundo as VI Diretrizes Brasileiras de Hipertensão, 2010.','','','Paciente foi hospitalizada por 11 dias devido a crises de HAS e Diabetes','Não relatou','A Srª. M.A.S.A. é portadora Hipertensão Arterial Sistêmica e Diabetes Mellitus tipo II há 13 anos. Durante a avaliação inicial no serviço de Atenção Farmacêutica foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados: a paciente relata que apresenta tosse seca quando utiliza o Captopril e isso a incomoda muito. \r\nA presença de reação adversa ao medicamento ao Captopril foi analisada por meio da base de dados Lexi-comp (referência oficial da Associação Americana de Farmacêuticos), a qual apontou presença de tosse seca em 0,5 a 2% dos casos durante o uso deste medicamento.\r\n\r\nObs: Segue em anexo o diário pessoal dos medicamentos utilizados pelo paciente.\r\n','V','V','V','F','V','Drª. S.','Rever a paciente em um mês. Reavaliar a adesão ao tratamento, manutenção do controle da PA e da glicemia.','Charles F. Lacy, Lora L. Armstrong, Morton P. Goldman, Leonard L. Lance. Medicamentos Lexi-comp Manole. Editora Manole, 2009.\r\n\r\nSociedade Brasileira de Hipertensão. VI Diretrizes Brasileiras de Hipertensão, 2010.Disponível em: http://www.sbh.org.br/index.asp Acesso em: 21/09/2012.','Para algumas intervenções realizadas no acompanhamento dessa paciente, seria necessário referenciá-la ao médico ou a outro profissional de saúde. Desse modo, elabore um laudo técnico contendo os dados da paciente, o motivo de referência à consulta médica ou com outro profissional de saúde, alternativas de resoluções para os problemas apresentados pela paciente, nome, contato e número de registro do farmacêutico e as referências bibliográficas que foram utilizadas para propor as alternativas de resoluções.','A paciente reclama que o Captopril esteja lhe causando uma tosse seca, por isso deixou de utilizá-lo há alguns meses. Confessou utilizar a Glibenclamida apenas uma vez por dia, acredita que usa muitos medicamentos e que a redução de uma dose não irá lhe trazer prejuízos. Paciente sente medo de usar vários medicamentos.','XXXXX-XXXX');
/*!40000 ALTER TABLE `casoclinico` ENABLE KEYS */;


--
-- Definition of table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consulta`
--

/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` (`id`,`fkCasoClinico`,`fkAluno`) VALUES 
 (1,14,'teste2'),
 (2,14,'turma1teste'),
 (3,14,'turma2teste'),
 (4,14,'turma3teste'),
 (5,14,'testetutor'),
 (6,13,'semprm'),
 (7,8,'Atencêuticos'),
 (8,11,'farmacuida'),
 (9,5,'Cipolle'),
 (10,9,'MAXCEF'),
 (11,4,'Pharmacareufs'),
 (12,3,'horus'),
 (13,2,'FARMAVIDA'),
 (14,8,'ATENFARMACÊUTICO'),
 (15,2,'VIDAFARMA');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;


--
-- Definition of table `diariomedicamentos`
--

DROP TABLE IF EXISTS `diariomedicamentos`;
CREATE TABLE `diariomedicamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horario` varchar(255) DEFAULT NULL,
  `medicamento` varchar(255) DEFAULT NULL,
  `periodo` varchar(255) DEFAULT NULL,
  `quantidade` varchar(255) DEFAULT NULL,
  `tipoBebida` varchar(255) DEFAULT NULL,
  `fkRespostaTerceira` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA21E01D9DE1B83E7` (`fkRespostaTerceira`),
  CONSTRAINT `FKA21E01D9DE1B83E7` FOREIGN KEY (`fkRespostaTerceira`) REFERENCES `respostaterceira` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diariomedicamentos`
--

/*!40000 ALTER TABLE `diariomedicamentos` DISABLE KEYS */;
INSERT INTO `diariomedicamentos` (`id`,`horario`,`medicamento`,`periodo`,`quantidade`,`tipoBebida`,`fkRespostaTerceira`) VALUES 
 (1,'antes do café da manhã','Glibenclamida','Manhã','1 comprimido','Água',1),
 (2,'antes do café da manhã','Metformina','Manhã','1 comprimido','Água',1),
 (3,'10h (2h antes ou dps das refeições)','Atenolol','Manhã','1 comprimido','Água',1),
 (4,'antes do almoço','Metformina','Manhã','1 comprimido','Água',1),
 (5,'antes do jantar','Glibenclamida','Noite','1 comprimido','Água',1),
 (6,'antes do jantar','Metformina','Noite','1 comprimido','Água',1),
 (7,'10h (2h antes ou dps da refeição)','Atenolol','Manhã','1 comprimido','Água',2),
 (8,'antes do café da manhã','Glibenclamida','Manhã','1 comprimido','Água',2),
 (9,'antes do café da manhã','Metformina','Manhã','1 comprimido','Água',2),
 (10,'antes do almoço','Metformina','Manhã','1 comprimido','Água',2),
 (11,'antes do jantar','Glibenclamida','Noite','1 comprimido','Água',2),
 (12,'antes do jantar','Metformina','Noite','1 comprimido','Água',2),
 (13,'10h (2h antes ou dps da refeição)','Atenolol','Manhã','1 comprimido','Água',3),
 (14,'antes do café da manhã','Glibenclamida','Manhã','1 comprimido','Água',3),
 (15,'após o café da manhã','Metformina','Manhã','1 comprimido','Água',3),
 (16,'após o almoço','Metformina','Tarde','1 comprimido','Água',3),
 (17,'antes do jantar','Glibenclamida','Noite','1 comprimido','Água',3),
 (18,'Após o jantar','Metformina','Noite','1 comprimido','Água',3),
 (19,'antes do café da manhã','Glibenclamida','Manhã','1 comprimido','Água',4),
 (20,'antes do café da manhã','Metformina','Manhã','1 comprimido','Água',4),
 (21,'10h (2h antes ou dps da refeição)','Atenolol','Manhã','1 comprimido','Água',4),
 (22,'antes do almoço','Metformina','Manhã','1 comprimido','Água',4),
 (23,'antes do jantar','Glibenclamida','Noite','1 comprimido','Água',4),
 (24,'antes do jantar','Metformina','Noite','1 comprimido','Água',4),
 (25,'10h (2h antes ou dps da refeição)','Atenolol','Manhã','1 comprimido','Água',5),
 (26,'07:00(Antes do café da manhã)','Glibenclamida','Manhã','01 comprimido','Água',6),
 (27,'21:00 (Antes de dormir)','Atorvastatina','Noite','01 comprimido','Água',6),
 (28,'17:00','Insulina NPH','Tarde','10U','Outro',6),
 (29,'08:00( 1 hora após o café da manhã)','Nifedipino','Manhã','01 comprimido','Água',6),
 (30,'20:00 ( 1 hora após o jantar)','Nifedipino','Noite','01 comprimido','Água',6),
 (31,'após o jantar','Manipulado: Sinvastatina/Ezetimiba','Noite','1 comprimido ','Água',7),
 (32,'08:00 h','Losartana','Manhã','1 comprimido ','Água',7),
 (33,'antes do café da manhã','Pantoprazol','Manhã','1 comprimido ','Água',7),
 (34,'12:00 (antes do almoço)','Metformina','Tarde','1 comprimido','Água',8),
 (35,'8:00 ','Valsartana','Manhã','1 comprimido','Água',8),
 (36,'9h','Furosemida','Manhã','1 comprimido','Água',10),
 (37,'12:00 (antes do almoço)','Hidroclorotiazida','Tarde','1 comprimido','Água',10),
 (38,'21:00 (Antes de dormir)','Sinvastatina','Noite','1 comprimido','Água',10),
 (39,'9h','Hidroclorotiazida','Manhã','1 comprimido','Água',11),
 (40,'14 (2h antes ou após o almoço)','Atenolol','Tarde','1 comprimido','Água',11),
 (41,'21h (Antes de dormir)','Sinvastatina','Noite','1 comprimido','Água',11),
 (42,'9h','Hidroclorotiazida','Manhã','1 comprimido','Água',12),
 (43,'14h (2h antes ou após almoço)','Atenolol','Tarde','1 comprimido','Água',12),
 (44,'21h (antes de dormir)','Sinvastatina','Noite','1 comprimido','Água',12),
 (45,'Após o café da manhã','Metformina','Manhã','1 comprimido','Água',13),
 (46,'Após o jantar','Metformina','Noite','1 comprimido','Água',13),
 (47,'Quando sentir dor nos pés','Tylex®','Tarde','1 comprimido','Água',13),
 (48,'antes da refeição','Glibenclamida','Manhã','1 comprimido','Água',14),
 (49,'durante a refeição','Metformina','Manhã','1 comprimido','Água',14),
 (50,'às 9 horas','Propanolol','Manhã','1 comprimido','Água',14),
 (51,'às 9 horas','Enalapril','Manhã','1 comprimido','Água',14),
 (52,'durante a refeição','Metformina','Tarde','1 comprimido','Água',14),
 (53,'antes da refeição','Glibenclamida','Noite','1 comprimido','Água',14),
 (54,'durante a refeição','Metformina','Noite','1 comprimido','Água',14),
 (55,'às 21 horas','Propranolol','Noite','1 comprimido','Água',14),
 (56,'08h (imediatamente antes do café da manhã)','Glibenclamida','Manhã','1 comprimido','Água',15),
 (57,'20h (imediatamente antes do jantar)','Glibenclamida','Noite','1 comprimido','Água',15),
 (58,'durante o café da manhã','Metformina','Manhã','1 comprimido','Água',15),
 (59,'22h (antes de dormir)','Sinvastatina','Manhã','1 comprimido','Água',15),
 (60,'8h (em jejum)','Omeprazol','Manhã','01 comprimido','Água',16),
 (61,'de acordo com esquema','Insulina Aspart','Manhã','2 a 12U','Outro',16),
 (62,'Após o jantar','Atorvastatina','Noite','01 comprimido','Água',16),
 (63,'09h','Hidroclorotiazida','Manhã','1 comprimido','Água',17),
 (64,'14h (2h antes ou dps do almoço)','Atenolol','Tarde','1 comprimido','Água',17),
 (65,'21h (antes de dormir)','Sinvastatina','Noite','1 comprimido','Água',17);
/*!40000 ALTER TABLE `diariomedicamentos` ENABLE KEYS */;


--
-- Definition of table `diariomedicamentoscaso`
--

DROP TABLE IF EXISTS `diariomedicamentoscaso`;
CREATE TABLE `diariomedicamentoscaso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horario` varchar(255) DEFAULT NULL,
  `medicamento` varchar(255) DEFAULT NULL,
  `periodo` varchar(255) DEFAULT NULL,
  `quantidade` varchar(255) DEFAULT NULL,
  `tipoBebida` varchar(255) DEFAULT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7D55E8938A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FK7D55E8938A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diariomedicamentoscaso`
--

/*!40000 ALTER TABLE `diariomedicamentoscaso` DISABLE KEYS */;
INSERT INTO `diariomedicamentoscaso` (`id`,`horario`,`medicamento`,`periodo`,`quantidade`,`tipoBebida`,`fkCasoClinico`) VALUES 
 (1,'7h','Glibenclamida','Manhã','01 comprimido','Água',1),
 (2,'5h','Captopril','Manhã','01 comprimido','Água',1),
 (3,'7h','Nifedipino','Manhã','01 comprimido','Água',1),
 (4,'9h','Furosemida','Manhã','01 comprimido','Água',1),
 (5,'12h','Glibenclamida','Manhã','01 comprimido','Água',1),
 (6,'12h','Metformina','Manhã','01 comprimido','Água',1),
 (7,'13h','Acido Acetilsalicilico','Tarde','01 comprimido','Água',1),
 (8,'14h','Captopril','Tarde','01 comprimido','Água',1),
 (9,'19h','Nifedipino','Noite','01 comprimido','Água',1),
 (10,'19h','Metformina','Noite','01 comprimido','Água',1),
 (11,'22h','Captopril','Noite','01 comprimido','Água',1),
 (12,'30 min antes do café','Vildagliptina/Metformina','Manhã','01 comprimido','Água',2),
 (13,'+ conveniente para a paciente','Insulina Aspart','Manhã','01 comprimido','Outro',2),
 (14,'30 min antes do jantar','Vildagliptina/Metformina','Noite','01 comprimido','Água',2),
 (15,'Após o jantar','Sinvastatina','Noite','01 comprimido','Água',2),
 (16,'antes do café da manhã','Glibenclamida','Manhã','1 comprimido','Água',3),
 (17,'antes do café da manhã','Metformina','Manhã','1 comprimido','Água',3),
 (18,'8h','Propanolol','Manhã','1 comprimido','Água',3),
 (19,'9h','Enalapril','Manhã','1 comprimido','Água',3),
 (20,'antes do almoço','Metformina','Manhã','1 comprimido','Água',3),
 (21,'antes do jantar','Glibenclamida','Noite','1 comprimido','Água',3),
 (22,'antes do jantar','Metformina','Noite','1 comprimido','Água',3),
 (23,'20h','Propanolol','Noite','1 comprimido','Água',3),
 (24,'antes do café da manhã','Metformina','Manhã','1 comprimido','Água',4),
 (25,'antes do jantar','Metformina','Noite','1 comprimido','Água',4),
 (26,'qdo sentir dor','Tylex®','Tarde','1 comprimido','Água',4),
 (27,'antes do café da manhã','Glibenclamida','Manhã','1 comprimido','Água',5),
 (28,'antes do café da manhã','Metformina','Manhã','1 comprimido','Água',5),
 (29,'antes do jantar','Glibenclamida','Noite','1 comprimido','Água',5),
 (30,'antes do café da manhã','Glimepirida','Manhã','1 comprimido','Água',6),
 (31,'21h','Não relatou','Noite','01 comprimido','Água',6),
 (32,'08h','Propanolol','Manhã','1 comprimido','Água',7),
 (33,'30 minutos antes do café da manhã','Metformina','Manhã','1 comprimido','Água',7),
 (34,'30 minutos antes do almoço','Metformina','Manhã','1 comprimido','Água',7),
 (35,'30 minutos antes do jantar','Metformina','Noite','1 comprimido','Água',7),
 (36,'antes de deitar','Passiflorine®','Noite','1 colher de sopa','Água',7),
 (37,'3h antes ou 2h após o café da manhã','Hidroclorotiazida','Manhã','1 comprimido','Água',8),
 (38,'2h antes ou após o almoço','Atenolol','Tarde','1 comprimido','Água',8),
 (39,'7h (ou + conveniente p paciente)','Valsartana','Manhã','1 comprimido','Água',9),
 (40,'depois do almoço','Metformina','Tarde','1 comprimido','Água',9),
 (41,'antes do café da manhã','Metformina','Manhã','1 comprimido','Água',10),
 (42,'antes do almoço','Metformina','Manhã','1 comprimido','Água',10),
 (43,'antes do café da manhã','Glibenclamida','Manhã','2 comprimidos','Água',10),
 (44,'antes do almoço','Glibenclamida','Manhã','2 comprimidos','Água',10),
 (45,'antes do jantar','Metformina','Manhã','1 comprimido','Água',10),
 (46,'7h (ou + conveniente p paciente)','Nifedipino','Manhã','1 comprimido','Água',10),
 (47,'antes do café da manhã','Glibenclamida','Manhã','1 comprimido','Água',11),
 (48,'6h (1h antes ou dps da refeição) ','Nifedipino','Manhã','1 comprimido','Água',11),
 (49,'18h (1h antes ou dps da refeição)','Nifedipino','Tarde','1 comprimido','Água',11),
 (50,'17h','Insulina NPH','Tarde','10U','Outro',11),
 (51,'antes de deitar','Atorvastatina','Noite','1 comprimido','Água',11),
 (52,'antes do café da manhã','Glibenclamida','Manhã','1 comprimido','Água',12),
 (53,'antes do jantar','Glibenclamida','Noite','1 comprimido','Água',12),
 (54,'6h (ou + conveniente p o paciente)','Benicar®','Manhã','1 comprimido','Água',12),
 (55,'30 minutos antes do café da manhã','Pantoprazol','Manhã','1 comprimido','Água',13),
 (56,'6h (ou + conveniente p o paciente)','Losartana','Manhã','1 comprimido','Água',13),
 (57,'antes de deitar','Manipulado: Sinvastatina/Ezetimiba','Noite','1 comprimido','Água',13),
 (58,'antes do café da manhã','Glibenclamida','Manhã','1 comprimido','Água',14),
 (59,'antes do café da manhã','Metformina','Manhã','1 comprimido','Água',14),
 (60,'10h (pelo 2h dps da refeição)','Atenolol','Manhã','1 comprimido','Água',14),
 (61,'antes do almoço','Metformina','Manhã','1 comprimido','Água',14),
 (62,'antes do jantar','Glibenclamida','Noite','1 comprimido','Água',14),
 (63,'antes do jantar','Metformina','Noite','1 comprimido','Água',14);
/*!40000 ALTER TABLE `diariomedicamentoscaso` ENABLE KEYS */;


--
-- Definition of table `experienciamedicamentos1`
--

DROP TABLE IF EXISTS `experienciamedicamentos1`;
CREATE TABLE `experienciamedicamentos1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experienciamedicamentos1`
--

/*!40000 ALTER TABLE `experienciamedicamentos1` DISABLE KEYS */;
INSERT INTO `experienciamedicamentos1` (`id`,`descricao`,`idioma`) VALUES 
 (1,'Não relatou','pt'),
 (2,'Deseja melhorar/ controlar a(s) doença(s)','pt'),
 (3,'Deseja melhorar/ controlar a(s) doença(s) e reduzir a quantidade de medicamentos que ingere','pt'),
 (4,'Deseja melhorar/ controlar a(s) doença(s) e compreender a farmacoterapia','pt'),
 (5,'Deseja ?livrar-se da diabetes?','pt'),
 (6,'espera não se sentir mal ao tomar o medicamento','pt');
/*!40000 ALTER TABLE `experienciamedicamentos1` ENABLE KEYS */;


--
-- Definition of table `experienciamedicamentos1caso`
--

DROP TABLE IF EXISTS `experienciamedicamentos1caso`;
CREATE TABLE `experienciamedicamentos1caso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE422F7FB8A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FKE422F7FB8A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experienciamedicamentos1caso`
--

/*!40000 ALTER TABLE `experienciamedicamentos1caso` DISABLE KEYS */;
INSERT INTO `experienciamedicamentos1caso` (`id`,`descricao`,`fkCasoClinico`) VALUES 
 (1,'Deseja melhorar/ controlar a(s) doença(s)',1),
 (2,'Não relatou',2),
 (3,'Deseja melhorar/ controlar a(s) doença(s) e reduzir a quantidade de medicamentos que ingere',3),
 (4,'Deseja melhorar/ controlar a(s) doença(s)',4),
 (5,'Deseja melhorar/ controlar a(s) doença(s)',5),
 (6,'Deseja melhorar/ controlar a(s) doença(s)',6),
 (7,'Não relatou',7),
 (8,'Deseja melhorar/ controlar a(s) doença(s)',8),
 (9,'Não relatou',9),
 (10,'Deseja melhorar/ controlar a(s) doença(s)',10),
 (11,'Não relatou',11),
 (12,'Deseja melhorar/ controlar a(s) doença(s) e compreender a farmacoterapia',12),
 (13,'Deseja melhorar/ controlar a(s) doença(s)',13),
 (14,'Deseja melhorar/ controlar a(s) doença(s) e reduzir a quantidade de medicamentos que ingere',14),
 (15,'espera não se sentir mal ao tomar o medicamento',9);
/*!40000 ALTER TABLE `experienciamedicamentos1caso` ENABLE KEYS */;


--
-- Definition of table `experienciamedicamentos2`
--

DROP TABLE IF EXISTS `experienciamedicamentos2`;
CREATE TABLE `experienciamedicamentos2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experienciamedicamentos2`
--

/*!40000 ALTER TABLE `experienciamedicamentos2` DISABLE KEYS */;
INSERT INTO `experienciamedicamentos2` (`id`,`descricao`,`idioma`) VALUES 
 (1,'Não relatou','pt'),
 (2,'Paciente não apresenta nenhuma preocupação relacionada à farmacoterapia','pt'),
 (3,'Paciente acredita que os medicamentos perdem o efeito ao longo do tempo','pt'),
 (4,'Paciente tem medo das reações adversas dos medicamentos','pt'),
 (5,'Paciente não acredita nos efeitos dos medicamentos','pt'),
 (6,'Paciente preocupa-se com a quantidade excessiva de medicamentos que ingere','pt'),
 (7,'?Acha que os medicamentos fazem mal ao fígado e aos rins?','pt'),
 (8,'Paciente acredita que adicionar medicamento significa fracasso','pt'),
 (9,'Paciente preocupa-se com o alto custo dos medicamentos','pt'),
 (10,'Paciente não acredita que necessita do medicamento','pt'),
 (11,'Expressa grande preocupação com a sua saúde, mas não acredita que os medicamentos ?faça tanta diferença assim?','pt'),
 (12,'Questiona a necessidade de usar os medicamentos todos os dias.','pt'),
 (13,' Paciente questiona os efeitos dos medicamentos','pt');
/*!40000 ALTER TABLE `experienciamedicamentos2` ENABLE KEYS */;


--
-- Definition of table `experienciamedicamentos2caso`
--

DROP TABLE IF EXISTS `experienciamedicamentos2caso`;
CREATE TABLE `experienciamedicamentos2caso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE4310F7C8A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FKE4310F7C8A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experienciamedicamentos2caso`
--

/*!40000 ALTER TABLE `experienciamedicamentos2caso` DISABLE KEYS */;
INSERT INTO `experienciamedicamentos2caso` (`id`,`descricao`,`fkCasoClinico`) VALUES 
 (1,'Não relatou',1),
 (2,'Paciente acredita que os medicamentos perdem o efeito ao longo do tempo',2),
 (3,'Paciente tem medo das reações adversas dos medicamentos',3),
 (4,'Paciente não apresenta nenhuma preocupação relacionada à farmacoterapia',4),
 (5,'Não relatou',5),
 (6,'Não relatou',6),
 (7,'Paciente não acredita nos efeitos dos medicamentos',7),
 (8,'Não relatou',8),
 (9,'Paciente tem medo das reações adversas dos medicamentos',9),
 (10,'Não relatou',10),
 (11,'Paciente não apresenta nenhuma preocupação relacionada à farmacoterapia',11),
 (12,'Paciente não acredita nos efeitos dos medicamentos',12),
 (13,'Paciente não acredita nos efeitos dos medicamentos',13),
 (14,'Paciente preocupa-se com a quantidade excessiva de medicamentos que ingere',14),
 (15,'Questiona a necessidade de usar os medicamentos todos os dias.',11),
 (16,' Paciente questiona os efeitos dos medicamentos',13);
/*!40000 ALTER TABLE `experienciamedicamentos2caso` ENABLE KEYS */;


--
-- Definition of table `experienciamedicamentos3`
--

DROP TABLE IF EXISTS `experienciamedicamentos3`;
CREATE TABLE `experienciamedicamentos3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experienciamedicamentos3`
--

/*!40000 ALTER TABLE `experienciamedicamentos3` DISABLE KEYS */;
INSERT INTO `experienciamedicamentos3` (`id`,`descricao`,`idioma`) VALUES 
 (1,'Não relatou','pt'),
 (2,'Paciente diz que entende a farmacoterapia, mas não entende a doença','pt'),
 (3,'Paciente diz que entende a farmacoterapia','pt'),
 (4,'Paciente diz que não entende a farmacoterapia','pt'),
 (5,'Paciente diz que não entende a farmacoterapia e a doença','pt'),
 (6,'Segundo o paciente, tem uma tabela com os horários dos medicamentos, mas não compreende o porque de tomá-los todos os dias.','pt'),
 (7,'Paciente desconhece para que servem os medicamentos','pt');
/*!40000 ALTER TABLE `experienciamedicamentos3` ENABLE KEYS */;


--
-- Definition of table `experienciamedicamentos3caso`
--

DROP TABLE IF EXISTS `experienciamedicamentos3caso`;
CREATE TABLE `experienciamedicamentos3caso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE43F26FD8A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FKE43F26FD8A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experienciamedicamentos3caso`
--

/*!40000 ALTER TABLE `experienciamedicamentos3caso` DISABLE KEYS */;
INSERT INTO `experienciamedicamentos3caso` (`id`,`descricao`,`fkCasoClinico`) VALUES 
 (1,'Não relatou',1),
 (2,'Não relatou',2),
 (3,'Paciente diz que entende a farmacoterapia, mas não entende a doença',3),
 (4,'Paciente diz que não entende a farmacoterapia',4),
 (5,'Paciente diz que entende a farmacoterapia',5),
 (6,'Paciente diz que entende a farmacoterapia',6),
 (7,'Não relatou',7),
 (8,'Não relatou',8),
 (9,'Não relatou',9),
 (10,'Paciente diz que entende a farmacoterapia',10),
 (11,'Não relatou',11),
 (12,'Não relatou',12),
 (13,'Não relatou',13),
 (14,'Paciente diz que entende a farmacoterapia',14),
 (15,'Segundo o paciente, tem uma tabela com os horários dos medicamentos, mas não compreende o porque de tomá-los todos os dias.',11),
 (16,'Paciente desconhece para que servem os medicamentos',5);
/*!40000 ALTER TABLE `experienciamedicamentos3caso` ENABLE KEYS */;


--
-- Definition of table `experienciamedicamentos4`
--

DROP TABLE IF EXISTS `experienciamedicamentos4`;
CREATE TABLE `experienciamedicamentos4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experienciamedicamentos4`
--

/*!40000 ALTER TABLE `experienciamedicamentos4` DISABLE KEYS */;
INSERT INTO `experienciamedicamentos4` (`id`,`descricao`,`idioma`) VALUES 
 (1,'Não relatou','pt'),
 (2,'Paciente frequenta assiduamente a igreja','pt'),
 (3,'Paciente é católico praticante','pt'),
 (4,'Paciente acredita em Deus, mas não é adepto a nenhuma religião','pt'),
 (5,'É evangélica e acredita que Jesus vai curá-la de tudo','pt'),
 (6,'Lê muito sobre o universo/religião','pt'),
 (7,'Frequenta uma igreja evangélica há dois anos','pt'),
 (8,'Participa do grupo de canto da pastoral na igreja','pt'),
 (9,'Paciente é católico','pt'),
 (10,'Paciente é bastante religiosa','pt'),
 (11,'Seu pai sofria de Hipertensão Arterial Sistêmica e de Diabetes Mellitus.','pt'),
 (12,'os pais e irmãos são hipertensos','pt');
/*!40000 ALTER TABLE `experienciamedicamentos4` ENABLE KEYS */;


--
-- Definition of table `experienciamedicamentos4caso`
--

DROP TABLE IF EXISTS `experienciamedicamentos4caso`;
CREATE TABLE `experienciamedicamentos4caso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE44D3E7E8A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FKE44D3E7E8A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experienciamedicamentos4caso`
--

/*!40000 ALTER TABLE `experienciamedicamentos4caso` DISABLE KEYS */;
INSERT INTO `experienciamedicamentos4caso` (`id`,`descricao`,`fkCasoClinico`) VALUES 
 (1,'Não relatou',1),
 (2,'Não relatou',2),
 (3,'Não relatou',3),
 (4,'Paciente acredita em Deus, mas não é adepto a nenhuma religião',4),
 (5,'É evangélica e acredita que Jesus vai curá-la de tudo',5),
 (6,'Não relatou',6),
 (7,'Lê muito sobre o universo/religião',7),
 (8,'Não relatou',8),
 (9,'Não relatou',9),
 (10,'Paciente é católico',10),
 (11,'Frequenta uma igreja evangélica há dois anos',11),
 (12,'Paciente é católico praticante',12),
 (13,'Não relatou',13),
 (14,'Participa do grupo de canto da pastoral na igreja',14),
 (15,'Seu pai sofria de Hipertensão Arterial Sistêmica e de Diabetes Mellitus.',11),
 (16,'os pais e irmãos são hipertensos',9);
/*!40000 ALTER TABLE `experienciamedicamentos4caso` ENABLE KEYS */;


--
-- Definition of table `experienciamedicamentos5`
--

DROP TABLE IF EXISTS `experienciamedicamentos5`;
CREATE TABLE `experienciamedicamentos5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experienciamedicamentos5`
--

/*!40000 ALTER TABLE `experienciamedicamentos5` DISABLE KEYS */;
INSERT INTO `experienciamedicamentos5` (`id`,`descricao`,`idioma`) VALUES 
 (1,'Não relatou','pt'),
 (2,'Paciente não adere ao tratamento','pt'),
 (3,'Paciente relata aderir ao tratamento','pt');
/*!40000 ALTER TABLE `experienciamedicamentos5` ENABLE KEYS */;


--
-- Definition of table `experienciamedicamentos5caso`
--

DROP TABLE IF EXISTS `experienciamedicamentos5caso`;
CREATE TABLE `experienciamedicamentos5caso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE45B55FF8A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FKE45B55FF8A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experienciamedicamentos5caso`
--

/*!40000 ALTER TABLE `experienciamedicamentos5caso` DISABLE KEYS */;
INSERT INTO `experienciamedicamentos5caso` (`id`,`descricao`,`fkCasoClinico`) VALUES 
 (1,'Paciente não adere ao tratamento',1),
 (2,'Paciente não adere ao tratamento',2),
 (3,'Paciente não adere ao tratamento',3),
 (4,'Não relatou',4),
 (5,'Não relatou',5),
 (6,'Não relatou',6),
 (7,'Paciente relata aderir ao tratamento',7),
 (8,'Não relatou',8),
 (9,'Paciente não adere ao tratamento',9),
 (10,'Paciente não adere ao tratamento',10),
 (11,'Paciente não adere ao tratamento',11),
 (12,'Não relatou',12),
 (13,'Não relatou',13),
 (14,'Paciente relata aderir ao tratamento',14);
/*!40000 ALTER TABLE `experienciamedicamentos5caso` ENABLE KEYS */;


--
-- Definition of table `experienciamedicamentosconc`
--

DROP TABLE IF EXISTS `experienciamedicamentosconc`;
CREATE TABLE `experienciamedicamentosconc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experienciamedicamentosconc`
--

/*!40000 ALTER TABLE `experienciamedicamentosconc` DISABLE KEYS */;
INSERT INTO `experienciamedicamentosconc` (`id`,`descricao`,`idioma`) VALUES 
 (1,'?	Estimular a adesão ao tratamento com intervenções educativas','pt'),
 (2,'As experiências subjetivas do paciente parecem não interferir na farmacoterapia. Reavaliar ao longo dos atendimentos','pt'),
 (3,'Intervenções educativas sobre a farmacoterapia e sobre a doença','pt'),
 (4,'Buscar alternativa para o alto custo dos medicamentos','pt'),
 (5,'Buscar esclarecimento sobre as dúvidas da paciente com relação ao diagnóstico do Diabetes','pt'),
 (6,'Intervenções educativas sobre atividade física e alimentação','pt'),
 (7,'Intervenções educativas sobre a farmacoterapia, doença, atividade física e alimentação','pt'),
 (8,'Intervenções educativas sobre a farmacoterapia, doença, atividade física e alimentação','pt'),
 (9,'Intervenções educativas sobre a farmacoterapia, doença, atividade física e alimentação','pt'),
 (10,'Investigar sobre a efetividade e segurança da farmacoterapia','pt');
/*!40000 ALTER TABLE `experienciamedicamentosconc` ENABLE KEYS */;


--
-- Definition of table `experienciamedicamentosconccaso`
--

DROP TABLE IF EXISTS `experienciamedicamentosconccaso`;
CREATE TABLE `experienciamedicamentosconccaso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5F413EEB8A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FK5F413EEB8A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experienciamedicamentosconccaso`
--

/*!40000 ALTER TABLE `experienciamedicamentosconccaso` DISABLE KEYS */;
INSERT INTO `experienciamedicamentosconccaso` (`id`,`descricao`,`fkCasoClinico`) VALUES 
 (1,'?	Estimular a adesão ao tratamento com intervenções educativas',1),
 (2,'?	Estimular a adesão ao tratamento com intervenções educativas',2),
 (3,'?	Estimular a adesão ao tratamento com intervenções educativas',3),
 (4,'Intervenções educativas sobre a farmacoterapia e sobre a doença',4),
 (5,'Intervenções educativas sobre a farmacoterapia e sobre a doença',5),
 (6,'As experiências subjetivas do paciente parecem não interferir na farmacoterapia. Reavaliar ao longo dos atendimentos',6),
 (7,'Intervenções educativas sobre a farmacoterapia e sobre a doença',7),
 (8,'As experiências subjetivas do paciente parecem não interferir na farmacoterapia. Reavaliar ao longo dos atendimentos',8),
 (9,'Intervenções educativas sobre a farmacoterapia e sobre a doença',9),
 (10,'?	Estimular a adesão ao tratamento com intervenções educativas',10),
 (11,'?	Estimular a adesão ao tratamento com intervenções educativas',11),
 (12,'Intervenções educativas sobre a farmacoterapia e sobre a doença',12),
 (13,'Intervenções educativas sobre a farmacoterapia e sobre a doença',13),
 (14,'Intervenções educativas sobre a farmacoterapia e sobre a doença',14),
 (15,'Intervenções educativas sobre atividade física e alimentação',5),
 (16,'Intervenções educativas sobre a farmacoterapia, doença, atividade física e alimentação',3),
 (17,'Intervenções educativas sobre a farmacoterapia, doença, atividade física e alimentação',3),
 (18,'Intervenções educativas sobre a farmacoterapia, doença, atividade física e alimentação',3),
 (19,'Investigar sobre a efetividade e segurança da farmacoterapia',9);
/*!40000 ALTER TABLE `experienciamedicamentosconccaso` ENABLE KEYS */;


--
-- Definition of table `historiafamiliar`
--

DROP TABLE IF EXISTS `historiafamiliar`;
CREATE TABLE `historiafamiliar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `historiafamiliar`
--

/*!40000 ALTER TABLE `historiafamiliar` DISABLE KEYS */;
INSERT INTO `historiafamiliar` (`id`,`descricao`,`idioma`) VALUES 
 (1,'Não relatou','pt'),
 (2,'Não relatou nenhuma história familiar que tenha influência sobre o estado atual','pt'),
 (3,'Pai e mãe - portadores de Diabetes Mellitus','pt'),
 (4,'Pais e irmão - portadores de Diabetes Mellitus','pt'),
 (5,'Mãe ? portadora de Diabetes Mellitus. Pai ? portador de Hipertensão Arterial Sistêmica','pt'),
 (6,'Pai ? dependência alcoólica','pt'),
 (7,'Pai, irmão e avô - portador de Diabetes Mellitus','pt'),
 (8,'Pai ? portador de Diabetes Mellitus. Mãe ? portadora de câncer. Filha - portadora de Hipertensão Arterial Sistêmica','pt'),
 (9,'Tio, primo e irmã - portadores de Diabetes Mellitus','pt'),
 (10,'Mãe e irmãos - portadores de Hipertensão Arterial Sistêmica','pt'),
 (11,'Pais e irmãos - portadores de Hipertensão Arterial Sistêmica','pt'),
 (12,'Pai ? portador de Diabetes Mellitus e Hipertensão Arterial Sistêmica','pt'),
 (13,'Mãe ? portadora de Hipertensão Arterial Sistêmica','pt'),
 (14,'Mãe ? portadora de Diabetes Mellitus e Hiperlipidemia','pt'),
 (15,'Mãe: portadora de Diabetes Mellitus','pt');
/*!40000 ALTER TABLE `historiafamiliar` ENABLE KEYS */;


--
-- Definition of table `historiamedicapregressa`
--

DROP TABLE IF EXISTS `historiamedicapregressa`;
CREATE TABLE `historiamedicapregressa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `historiamedicapregressa`
--

/*!40000 ALTER TABLE `historiamedicapregressa` DISABLE KEYS */;
INSERT INTO `historiamedicapregressa` (`id`,`descricao`,`idioma`) VALUES 
 (1,'Não relatou','pt'),
 (2,'Nenhuma história médica que tenha influência sobre o estado atual','pt'),
 (3,'Crise de hiperglicemia','pt'),
 (4,'Possui cinco filhos, quatro de parto normal e um cesário','pt'),
 (5,'Possui nove filhos, todos por partos normais','pt'),
 (6,'Colocou prótese no olho há 40 anos, fez biópsia da próstata há cinco anos, angioplastia e dois cateterismos há dois anos, passou por coma alcoólico quatro vezes','pt'),
 (7,'Todos os filhos por partos normais','pt'),
 (8,'Paciente foi hospitalizado duas vezes por crise de HAS','pt'),
 (9,'Paciente foi hospitalizado três vezes por crise de refluxo','pt'),
 (10,'Paciente foi hospitalizada por 11 dias devido a crises de HAS e Diabetes','pt'),
 (11,'Teve oito filhos por partos normais','pt'),
 (12,'Realizou três pontes de safena há 10 anos.','pt');
/*!40000 ALTER TABLE `historiamedicapregressa` ENABLE KEYS */;


--
-- Definition of table `intervencao`
--

DROP TABLE IF EXISTS `intervencao`;
CREATE TABLE `intervencao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `numeroEtapa` int(11) NOT NULL,
  `numeroIntervencao` int(11) DEFAULT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  `indicacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK91D9EFAE8A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FK91D9EFAE8A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `intervencao`
--

/*!40000 ALTER TABLE `intervencao` DISABLE KEYS */;
INSERT INTO `intervencao` (`id`,`descricao`,`numeroEtapa`,`numeroIntervencao`,`fkCasoClinico`,`indicacao`) VALUES 
 (1,'Sob prescrição',1,NULL,1,'Prescritor'),
 (2,'Alterar intervalo',1,NULL,1,'Paciente'),
 (3,'Sobre medicamentos',1,NULL,1,'Paciente'),
 (4,'Sobre problemas de saúde',1,NULL,1,'Paciente'),
 (5,'Encaminhamento ao nutricionista ',1,NULL,1,'Paciente e Outro'),
 (6,'Encaminhamento ao profissional de educação física',1,NULL,1,'Paciente e Outro'),
 (7,'Tabela de horário',1,NULL,1,'Paciente'),
 (8,'Sob prescrição',1,NULL,2,'Paciente e Prescritor'),
 (9,'Alterar produto',1,NULL,2,'Paciente e Prescritor'),
 (10,'Sobre medicamentos',1,NULL,2,'Paciente'),
 (11,'Medicamento descontinuado',1,NULL,3,'Paciente e Prescritor'),
 (12,'Sobre medicamentos',1,NULL,3,'Paciente'),
 (13,'Sobre problemas de saúde',1,NULL,3,'Paciente'),
 (14,'Encaminhamento ao nutricionista ',1,NULL,3,'Paciente e Outro'),
 (15,'Alterar intervalo',1,NULL,4,'Paciente e Prescritor'),
 (16,'Medicamento descontinuado',1,NULL,4,'Paciente e Prescritor'),
 (17,'Sobre medicamentos',1,NULL,4,'Paciente'),
 (18,'Sobre problemas de saúde',1,NULL,4,'Paciente'),
 (19,'Tabela de horário',1,NULL,4,'Paciente'),
 (20,'Sob prescrição',1,NULL,5,'Paciente e Prescritor'),
 (21,'Sobre medicamentos',1,NULL,5,'Paciente'),
 (22,'Sobre problemas de saúde',1,NULL,5,'Paciente'),
 (23,'Tabela de horário',1,NULL,5,'Paciente'),
 (24,'Encaminhamento ao nutricionista',1,NULL,5,'Paciente e Outro'),
 (25,'Sob prescrição',1,NULL,6,'Paciente e Prescritor'),
 (26,'Alterar produto',1,NULL,6,'Paciente e Prescritor'),
 (27,'Tabela de horário',1,NULL,6,'Paciente'),
 (28,'Encaminhamento ao psicólogo',1,NULL,6,'Paciente e Outro'),
 (29,'Venda livre',1,NULL,7,'Paciente'),
 (30,'Medicamento descontinuado',1,NULL,7,'Paciente'),
 (31,'Sobre medicamentos',1,NULL,7,'Paciente'),
 (32,'Sobre problemas de saúde',1,NULL,7,'Paciente'),
 (33,'Tabela de horário',1,NULL,7,'Paciente'),
 (34,'Encaminhamento ao nutricionista',1,NULL,7,'Paciente e Outro'),
 (35,'Encaminhamento ao odontólogo',1,NULL,7,'Paciente e Outro'),
 (36,'Sob prescrição',1,NULL,8,'Paciente e Prescritor'),
 (37,'Alterar produto',1,NULL,8,'Paciente e Prescritor'),
 (38,'Sobre medicamentos',1,NULL,8,'Paciente'),
 (39,'Sobre problemas de saúde',1,NULL,8,'Paciente'),
 (40,'Iniciar monitorização laboratorial',1,NULL,8,'Paciente'),
 (41,'Tabela de horário',1,NULL,8,'Paciente'),
 (42,'Alterar produto',1,NULL,9,'Paciente e Prescritor'),
 (43,'Sobre medicamentos',1,NULL,9,'Paciente'),
 (44,'Sobre problemas de saúde',1,NULL,9,'Paciente'),
 (45,'Tabela de horário',1,NULL,9,'Paciente'),
 (46,'Alterar produto',1,NULL,10,'Paciente e Prescritor'),
 (47,'Sobre medicamentos',1,NULL,10,'Paciente'),
 (48,'Sobre problemas de saúde',1,NULL,10,'Paciente'),
 (49,'Tabela de horário',1,NULL,10,'Paciente'),
 (50,'Encaminhamento ao nutricionista',1,NULL,10,'Paciente'),
 (51,'Sob prescrição',1,NULL,11,'Paciente e Prescritor'),
 (52,'Sobre medicamentos',1,NULL,11,'Paciente'),
 (53,'Sobre problemas de saúde',1,NULL,11,'Paciente'),
 (54,'Tabela de horário',1,NULL,11,'Paciente'),
 (55,'Encaminhamento ao nutricionista',1,NULL,11,'Paciente e Outro'),
 (56,'Alterar produto',1,NULL,12,'Paciente e Prescritor'),
 (57,'Medicamento descontinuado',1,NULL,12,'Paciente e Outro'),
 (58,'Sobre medicamentos',1,NULL,12,'Paciente'),
 (59,'Sobre problemas de saúde',1,NULL,12,'Paciente'),
 (60,'Tabela de horário',1,NULL,12,'Paciente'),
 (61,'Encaminhamento ao nutricionista',1,NULL,12,'Paciente e Outro'),
 (62,'Alterar produto',1,NULL,13,'Paciente e Prescritor'),
 (63,'Sobre medicamentos',1,NULL,13,'Paciente'),
 (64,'Sobre problemas de saúde',1,NULL,13,'Paciente'),
 (65,'Tabela de horário',1,NULL,13,'Paciente'),
 (66,'Alterar produto',1,NULL,14,'Paciente e Prescritor'),
 (67,'Sobre medicamentos',1,NULL,14,'Paciente'),
 (68,'Sobre problemas de saúde',1,NULL,14,'Paciente'),
 (69,'Tabela de horário',1,NULL,14,'Paciente');
/*!40000 ALTER TABLE `intervencao` ENABLE KEYS */;


--
-- Definition of table `intervencaorespostaquarta`
--

DROP TABLE IF EXISTS `intervencaorespostaquarta`;
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

--
-- Dumping data for table `intervencaorespostaquarta`
--

/*!40000 ALTER TABLE `intervencaorespostaquarta` DISABLE KEYS */;
/*!40000 ALTER TABLE `intervencaorespostaquarta` ENABLE KEYS */;


--
-- Definition of table `intervencaorespostasegunda`
--

DROP TABLE IF EXISTS `intervencaorespostasegunda`;
CREATE TABLE `intervencaorespostasegunda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `justificativa` longtext,
  `numeroIntervencao` int(11) DEFAULT '0',
  `fkResposta2` int(11) NOT NULL,
  `indicacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD03D22FCA4FE1140` (`fkResposta2`),
  CONSTRAINT `FKD03D22FCA4FE1140` FOREIGN KEY (`fkResposta2`) REFERENCES `respostasegunda` (`id`),
  CONSTRAINT `FK_intervencaorespostasegunda_1` FOREIGN KEY (`fkResposta2`) REFERENCES `respostasegunda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `intervencaorespostasegunda`
--

/*!40000 ALTER TABLE `intervencaorespostasegunda` DISABLE KEYS */;
INSERT INTO `intervencaorespostasegunda` (`id`,`descricao`,`justificativa`,`numeroIntervencao`,`fkResposta2`,`indicacao`) VALUES 
 (1,'Alterar produto','O medicamento utilizado está causando RAM à paciente.',0,1,'Paciente e Prescritor'),
 (2,'Sobre medicamentos','Esclarecer a importância da adesão ao tratamento.',0,1,'Paciente'),
 (3,'Sobre problemas de saúde','',0,1,'Paciente'),
 (4,'Tabela de Horário','',0,1,'Paciente'),
 (5,'Alterar produto','RAM ao Captopril',0,2,'Paciente e Prescritor'),
 (6,'Sobre medicamentos','Esclarecer sobre condições clínicas do paciente',0,2,'Paciente'),
 (7,'Sobre problemas de saúde',' xxxx',0,2,'Paciente'),
 (8,'Tabela de horário','',0,2,'Paciente'),
 (9,'Alterar produto','RAM causada pelo captopril',0,3,'Paciente e Prescritor'),
 (10,'Sobre medicamentos','estimular a adesão',0,3,'Paciente'),
 (11,'Sobre problemas de saúde','',0,3,'Paciente'),
 (12,'Tabela de horário','',0,3,'Paciente'),
 (13,'Alterar produto','RAM ao Captopril',0,4,'Paciente e Prescritor'),
 (14,'Sobre medicamentos','Estimular adesão ao tratamento',0,4,'Paciente'),
 (15,'Sobre problemas de saúde','',0,4,'Paciente'),
 (16,'Tabela de horário','',0,4,'Paciente'),
 (17,'Alterar produto','xxxxxxxx',0,5,'Paciente e Prescritor'),
 (18,'Sobre medicamentos','xxxxxxxxxxx',0,5,'Paciente'),
 (19,'Sobre problemas de saúde','',0,5,'Paciente'),
 (20,'Tabela de horário','xxxxxxxxxxx',0,5,'Paciente'),
 (21,'Alterar produto','Medicamento estaria causando uma reação adversa: Edema periférico.',0,6,'Prescritor'),
 (22,'Sobre medicamentos','Intervenção educativa para estimular a adesão do paciente ao medicamento Manipulado: Sinvastatina/Ezetimiba.',0,6,'Paciente'),
 (23,'Sobre problemas de saúde','Intervenção educativa em relação ao problema de saúde : hiperlipidemia',0,6,'Paciente'),
 (24,'Iniciar monitorização laboratorial','Monitorar Colesterol Total e frações, e Triglicérides.',0,6,'Paciente'),
 (25,'Sob prescrição','O paciente está com Hiperlipidemia não tratada.',0,7,'Prescritor'),
 (26,'Sobre medicamentos','O paciente não faz uso do medicamento Nifedipino, que é necessário. Explicar a importância da adesão ao tratamento.',0,7,'Paciente'),
 (27,'Sobre problemas de saúde','Explicar o que é Hiperlipidemia, quais os riscos e a importância do tratamento.',0,7,'Paciente'),
 (28,'Adicionar à farmacoterapia um antiagregante plaquetário','Paciente safenado, hipertenso, com hiperlipidemia e diabetes mellitus tipo 2.',0,7,'Prescritor'),
 (29,'Tabela de horário','Organizar os horários de tomada dos medicamentos para proporcionar uma melhor adesão ao tratamento.',0,7,'Paciente'),
 (35,'Sob prescrição','Necessidade de farmacoterapia para tratamento de hiperlipidemia.',0,9,'Paciente e Prescritor'),
 (36,'Alterar produto','Paciente relata reação adversa ao medicamento Enalapril. Por não tolerar essas reações o paciente pode vir a descontinuar farmacoterapia, por isso optamos por sugerir modificação do medicamento.',0,9,'Paciente e Prescritor'),
 (37,'Sobre medicamentos','O paciente relata não tolerar reações adversas. E toma o medicamento de forma inadequada. Intervenção sobre os medicamentos prescritos, indicações, possíveis reações adversas e administração correta dos mesmos. ',0,9,'Paciente'),
 (38,'Sobre problemas de saúde','Intervenção sobre hiperlipidemia e hipertensão. ',0,9,'Paciente'),
 (43,'Sob prescrição','Hiperlipidemia não tratada.',0,11,'Paciente e Prescritor'),
 (44,'Sobre medicamentos','Não compreende para que servem os medicamentos.',0,11,'Paciente'),
 (45,'Sobre problemas de saúde','Ela não tem conhecimento sobre a doença e suas complicações.',0,11,'Paciente'),
 (46,'Iniciar monitorização laboratorial','Acompanhar a adesão da paciente por meio do teste de hemoglobina glicada.',0,11,'Paciente e Prescritor'),
 (47,'Tabela de horário','Não consegue entender a prescrição médica e troca os horários.',0,11,'Paciente'),
 (48,'Alterar o horário ','A metformina é mais eficaz após a refeição.',0,11,'Paciente'),
 (49,'Alterar produto','Para diminuir o risco de hipoglicemia',0,12,'Paciente e Prescritor'),
 (50,'Sobre medicamentos','Para conhecer farmacoterapia',0,12,'Paciente'),
 (51,'Sobre problemas de saúde','Para entender seu problema de saude',0,12,'Paciente'),
 (52,'Iniciar monitorização laboratorial','Monitorar glicemia e PA ',0,12,'Paciente'),
 (53,'Tabela de horário','Melhorar a farmacoterapia',0,12,'Paciente'),
 (59,'Medicamento descontinuado','Verificar a necessidade do uso da hidroclorotiazida',0,14,'Paciente e Prescritor'),
 (60,'Sobre medicamentos','paciente relata não entender a farmacoterapia da diabetes (metformina)',0,14,'Paciente'),
 (61,'Sobre problemas de saúde','paciente relata não entender a doença (diabetes)',0,14,'Paciente'),
 (62,'Fazer a tabela de horários dos medicamentos','',0,14,'Paciente'),
 (63,'Sob prescrição','o paciente  relata está com muita dor de estômago,fazendo uso de vários medicamentos.',0,15,'Prescritor'),
 (64,'Alterar produto','reavaliar o uso do medicamento Sinvastatina 40 mg, pois o mesmo  encontra-se em dose máxima,sendo inefetivo.',0,15,'Prescritor'),
 (65,'Sobre medicamentos','confusa com horários dos medicamentos ',0,15,'Paciente'),
 (66,'Tabela de horário','A paciente relata que se sente confusa com tantos medicamentos e horários diferentes. necessitando de uma tabela com os horários de todos os medicamentos.',0,15,'Paciente'),
 (67,'Alterar produto','Solicitar a modificação do Tylex por outro medicamento devido ao aumento da constipação, suspeitamos que esse agravo seja por conta do efeito adverso do Tylex.',0,16,'Prescritor'),
 (68,'Medicamento descontinuado','Devido a problemas de hipoglicemia sugerimos a reavaliação do uso da Glimepirida na farmacoterapia desse paciente, por conta da suspeita de hipoglicemia ser causado pelo mesmo.',0,16,'Prescritor'),
 (69,'Sobre medicamentos','Explicar ao paciente a importância e a necessidade da completa adesão ao tratamento.',0,16,'Paciente'),
 (70,'Sobre problemas de saúde','Estimular e orientar o início de alguma atividade física que não prejudique a dor nos pés e orientar o paciente sobre o benefício do controle da alimentação.',0,16,'Paciente'),
 (71,'Sobre dispositivos médicos','Dar orientações sobre o uso do glicosímetro.',0,16,'Paciente'),
 (72,'Iniciar monitorização laboratorial','Ressaltar a importância do controle glicêmico.',0,16,'Paciente e Prescritor'),
 (73,'Iniciar outro tipo de monitorização','Ressaltar a importância do controle glicêmico.',0,16,'Paciente e Prescritor'),
 (74,'estabelecer uma tabela de horários para tomada de medimentos','Para facilitar a adesão ao tratamento.',0,16,'Paciente'),
 (75,'Sob prescrição','Necessidade de farmacoterapia para tratamento da hiperlipidemia.',0,17,'Paciente e Prescritor'),
 (76,'Alterar produto','O paciente relata a presença de reação adversa ao Atenolol e afirma não tolerar essas reações correndo o risco de descontinuar a farmacoterapia.',0,17,'Paciente e Prescritor'),
 (77,'Sobre medicamentos','O paciente relata não tolerar reações adversas do medicamento enalapril e não toma corretamente o medicamento atenolol.',0,17,'Paciente'),
 (78,'Sobre problemas de saúde','Intervenção sobre hiperlipidemia e Hipertensão',0,17,'Paciente'),
 (79,'Tabela de Horários','Avaliar o melhor horário de administração dos medicamentos prescritos junto com o paciente, levando em consideração interações farmacocinéticas e/ou farmacodinâmicas e comodidade do paciente.',0,17,'Paciente'),
 (85,'Sob prescrição','XXXXXX',0,19,'Paciente'),
 (86,'Venda livre','XXXXXX',0,19,'Paciente'),
 (87,'Sob prescrição','xxxx',0,20,'Paciente');
/*!40000 ALTER TABLE `intervencaorespostasegunda` ENABLE KEYS */;


--
-- Definition of table `medicamentoanterior`
--

DROP TABLE IF EXISTS `medicamentoanterior`;
CREATE TABLE `medicamentoanterior` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `indicacao` varchar(255) DEFAULT NULL,
  `periodo` varchar(255) DEFAULT NULL,
  `resposta` varchar(255) DEFAULT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEA3A8F2E8A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FKEA3A8F2E8A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicamentoanterior`
--

/*!40000 ALTER TABLE `medicamentoanterior` DISABLE KEYS */;
INSERT INTO `medicamentoanterior` (`id`,`descricao`,`indicacao`,`periodo`,`resposta`,`fkCasoClinico`) VALUES 
 (1,'Hidroclorotiazida','HAS','2 anos','perdeu o efeito',1),
 (2,'Não relatou','xxxx','xxxx','xxxx',2),
 (3,'Não relatou','xxxx','xxxx','xxxx',3),
 (4,'Não relatou','xxxx','xxxx','xxxx',4),
 (5,'Não relatou','xxxx','xxxx','xxxx',5),
 (6,'Não relatou','xxxx','xxxx','xxxx',6),
 (7,'Não relatou','xxxx','xxxx','xxxx',7),
 (8,'Acido Acetilsalicilico','não relatou','não relatou','suspeita de sangramento',8),
 (9,'Captopril','HAS','não relatou','RAM - sensação de desmaio',9),
 (10,'Hidroclorotiazida','HAS','não relatou','RAM - sensação de desmaio',9),
 (11,'Propranolol','HAS','não relatou','RAM - sensação de desmaio',9),
 (12,'Não relatou','xxxx','xxxx','xxxx',10),
 (13,'Não relatou','xxxx','xxxx','xxxx',11),
 (14,'Não relatou','xxxx','xxxx','xxxx',12),
 (15,'Captopril','HAS','não relatou','perdeu o efeito',13),
 (16,'Não relatou','xxxx','xxxx','xxxx',14);
/*!40000 ALTER TABLE `medicamentoanterior` ENABLE KEYS */;


--
-- Definition of table `medicamentonaoprescrito`
--

DROP TABLE IF EXISTS `medicamentonaoprescrito`;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicamentonaoprescrito`
--

/*!40000 ALTER TABLE `medicamentonaoprescrito` DISABLE KEYS */;
INSERT INTO `medicamentonaoprescrito` (`id`,`descricao`,`dosagem`,`posologia`,`fkCasoClinico`,`flItalico`) VALUES 
 (1,'Não relatou','xxxxx','xxxxx',1,'F'),
 (2,'Não relatou','xxxx','xxxx',2,'F'),
 (3,'Não relatou','xxxxx','xxxxx',3,'F'),
 (4,'Não relatou','xxxxx','xxxxx',4,'F'),
 (5,'Não relatou','xxxxx','xxxxx',5,'F'),
 (6,'Não relatou','xxxx','xxxx',6,'F'),
 (7,'Não relatou','xxxxx','xxxxx',7,'F'),
 (8,'Não relatou','xxxxx','xxxxx',8,'F'),
 (9,'Não relatou','xxxxx','xxxxx',9,'F'),
 (10,'Não relatou','xxxxx','xxxxx',10,'F'),
 (11,'Não relatou','xxxxx','xxxxx',11,'F'),
 (12,'Não relatou','xxxxx','xxxxx',12,'F'),
 (13,'Não relatou','xxxxx','xxxxx',13,'F'),
 (14,'Não relatou','xxxxx','xxxxx',14,'F');
/*!40000 ALTER TABLE `medicamentonaoprescrito` ENABLE KEYS */;


--
-- Definition of table `medicamentoprescrito`
--

DROP TABLE IF EXISTS `medicamentoprescrito`;
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicamentoprescrito`
--

/*!40000 ALTER TABLE `medicamentoprescrito` DISABLE KEYS */;
INSERT INTO `medicamentoprescrito` (`id`,`descricao`,`dosagem`,`especialidadeMedico`,`nmMedico`,`posologia`,`fkCasoClinico`,`flItalico`) VALUES 
 (1,'Glibenclamida','5 mg','Endocrinologista','Dr. P.','1 comprimido às 7h e às 12h',1,'F'),
 (2,'Captopril','25 mg','Clínico Geral','Dr. S.','1 comprimido às 5h, às 14h e ás 22h',1,'F'),
 (3,'Nifedipino','20mg','Clínico Geral','Dr. S.','1 comprimido às 7h e às 19h',1,'F'),
 (4,'Furosemida','40mg','Clínico Geral','Dr. S.','1 comprimido às 9h',1,'F'),
 (5,'Metformina','850mg','Clínico Geral','Dr. S.','1 comprimido às 12h e às 19h',1,'F'),
 (6,'Acido Acetilsalicilico','100mg','Clínico Geral','Dr. S.','1 comprimido às 13h',1,'F'),
 (7,'Sinvastatina','40mg','Cardiologista','Dr. J.B.R.','01 comprimido após o jantar',2,'F'),
 (8,'Vildagliptina/Metformina','50/850','Endocrinologista','Dr. V.C.','1 comprimido 30 minutos antes do café e 30 minutos antes do jantar',2,'F'),
 (9,'Insulina Aspart','2 a 12U','Endocrinologista','Dr. V.C.','de acordo com o esquema',2,'F'),
 (10,'Enalapril','10 mg','Cardiologista','Dr. L.A.S','01 comprimido às 9h',3,'F'),
 (11,'Metformina','850mg','Clínico Geral','Dr. L.C.','01 comprimido antes das refeições',3,'F'),
 (12,'Glibenclamida','5 mg','Clínico Geral','Dr. L.C.','1 comprimido antes do café e antes do jantar',3,'F'),
 (13,'Propanolol','40mg','Cardiologista','Dr. L.A.S','01 comprimido às 8h e às 20h',3,'F'),
 (14,'Hidroclorotiazida','25 mg','Cardiologista','Dr. L.A.S','01 comprimido às 8h',3,'F'),
 (15,'Metformina','850mg','Endocrinologista','Dr. P.','1 comprimido antes do café e antes do jantar',4,'F'),
 (16,'Glimepirida','4 mg','Endocrinologista','Dr. P.','1 comprimido antes do jantar',4,'F'),
 (17,'Tylex®','7,5mg','Clínico Geral','Dr. S.','1 comprimido a cada 4h',4,'F'),
 (18,'Glibenclamida','5 mg','Endocrinologista','Dr. P.','1 comprimido antes do café e antes do jantar',5,'F'),
 (19,'Metformina','850mg','Endocrinologista','Dr. P.','1 comprimido antes do café da manhã',5,'F'),
 (20,'Glimepirida','4mg','Endocrinologista','Dr. P.','1 comprimido antes do café da manhã',6,'F'),
 (21,'Gligage®','850mg','Endocrinologista','Dr. P.','1 comprimido 30 minutos antes do café e 30 minutos antes do jantar',6,'F'),
 (22,'Propanolol','40mg','Clínico Geral','Dr. S.','1 comprimido duas vezes por dia',7,'F'),
 (23,'Metformina','850mg','Endocrinologista','Dr. P.','1 comprimido antes das refeiçoes',7,'F'),
 (24,'Hidroxizina','2mg','Não relatou','Não relatou','1 comprimido antes de dormir',7,'F'),
 (25,'Enalapril','10 mg','Clínico Geral','Dr. S.','1 comprimido de 12/12h',8,'F'),
 (26,'Atenolol','25 mg','Clínico Geral','Dr. S.','1 comprimido às 12h',8,'F'),
 (27,'Metformina','850mg','Endocrinologista','Dr. P.','1 comprimido depois do almoço',9,'F'),
 (28,'Losartana','50mg','Clínico Geral','Dr. S.','1 comprimido de 12/12h',9,'F'),
 (29,'Metformina','850mg','Endocrinologista','Dr. P.','1 comprimido antes das refeiçoes',10,'F'),
 (30,'Glibenclamida','5 mg','Endocrinologista','Dr. P.','2 comprimidos antes do café da manhã e do almoço',10,'F'),
 (31,'Captopril','25 mg','Clínico Geral','Dr. S.','1 comprimido antes das refeiçoes',10,'F'),
 (32,'Glibenclamida','5 mg','Endocrinologista','Dr. P.','1 comprimido antes do café da manhã',11,'F'),
 (33,'Nifedipino','20mg','Clínico Geral','Dr. S.','1 comprimido de 12/12h',11,'F'),
 (34,'Insulina NPH','10U','Endocrinologista','Dr. P.','10U por dia às 17h',11,'F'),
 (35,'Benicar®','40mg','Clínico Geral','Dr. S.','1 comprimido às 10h',12,'F'),
 (36,'Colírio Combigan®','não relatou','Não relatou','Não relatou','1 gota em cada olho às 07h e às 19h ',12,'F'),
 (37,'Dimefor®','850mg','Endocrinologista','Dr. P.','1 comprimido após o almoço',12,'F'),
 (38,'Pantoprazol','40mg','Clínico Geral','Dr. S.','1 comprimido antes do café da manhã',13,'F'),
 (39,'Manipulado: Sinvastatina/Ezetimiba','20/10','Cardiologista','Dr. P.','1 comprimido após o jantar',13,'F'),
 (40,'Anlodipino','5 mg','Cardiologista','Dr. P.','1 comprimido às 8h e às 20h',13,'F'),
 (41,'Captopril','25 mg','Clínico Geral','Dr. S.','1 comprimido três vezes ao dia',14,'F'),
 (42,'Glibenclamida','5mg','Endocrinologista','Dr. P.','1 comprimido antes do café e antes do jantar',14,'F'),
 (43,'Metformina','850mg','Endocrinologista','Dr. P.','1 comprimido antes das refeiçoes',14,'F');
/*!40000 ALTER TABLE `medicamentoprescrito` ENABLE KEYS */;


--
-- Definition of table `medicamentoqueixa`
--

DROP TABLE IF EXISTS `medicamentoqueixa`;
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
  `alternativa1` varchar(255) DEFAULT NULL,
  `alternativa2` varchar(255) DEFAULT NULL,
  `numeroPRM` int(11) DEFAULT NULL,
  `situacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`fkQueixa`),
  KEY `FK8099C4A73D02FC3D` (`fkQueixa`),
  CONSTRAINT `FK8099C4A73D02FC3D` FOREIGN KEY (`fkQueixa`) REFERENCES `queixa` (`id`),
  CONSTRAINT `FK_medicamentoqueixa_1` FOREIGN KEY (`fkQueixa`) REFERENCES `queixa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicamentoqueixa`
--

/*!40000 ALTER TABLE `medicamentoqueixa` DISABLE KEYS */;
INSERT INTO `medicamentoqueixa` (`id`,`descricao`,`dose`,`efetivo`,`necessario`,`periodo`,`seguro`,`cumprimento`,`fkQueixa`,`conheceCumpre`,`alternativa1`,`alternativa2`,`numeroPRM`,`situacao`) VALUES 
 (1,'Acetato de Medroxiprogesterona','não relatou','','V','não relatou','','',2,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',2,NULL),
 (2,'Captopril','25mg','F','V','não relatou','','',3,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',4,NULL),
 (3,'Furosemida','40mg','V','V','não relatou','V','F',3,'','Intervenção educativa','Realizar atividade física e controlar a alimentação',7,NULL),
 (4,'Metformina','850mg','V','V','não relatou','V','F',4,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,NULL),
 (5,'Sinvastatina','não relatou','','V','não relatou','','',5,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',2,'Inicial'),
 (6,'Captopril','25mg','V','V','não relatou','V','V',6,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',4,'Estável'),
 (7,'Furosemida','40mg','V','V','não relatou','V','V',6,'','Intervenção educativa','Realizar atividade física e controlar a alimentação',7,'Estável'),
 (8,'Metformina','850mg','V','V','não relatou','V','V',7,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,'Estável'),
 (9,'Sinvastatina','40mg','F','V','não relatou','','',8,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',3,NULL),
 (10,'Omeprazol','20mg','','V','não relatou','','',9,NULL,'Encaminhamento ao médico','Controlar a alimentação',2,NULL),
 (11,'Insulina Aspart','2 a 12U','V','V','não relatou','V','F',10,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,NULL),
 (12,'Sinvastatina','20mg','V','V','não relatou','V','V',11,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',3,'Estável'),
 (13,'Omeprazol','','V','V','','V','V',12,NULL,'Encaminhamento ao médico','Controlar a alimentação',2,'Estável'),
 (14,'Insulina Aspart','2 a 12U','V','V','N relatou','V','V',13,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,'Estável'),
 (15,'Hidroclorotiazida','25mg','','F','não relatou','','',15,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',1,NULL),
 (16,'Metformina','850mg','V','V','não relatou','V','F',16,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,NULL),
 (17,'Hidroclorotiazida','25mg','','F','não relatou','','',17,'','Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',1,'Resolvido'),
 (18,'Metformina','850mg','V','V','não relatou','V','V',18,'','Intervenção educativa','Encaminhamento ao nutricionista',7,'Estável'),
 (19,'Tylex®','7,5mg','V','V','não relatou','F','',20,NULL,'Encaminhamento ao médico','Controlar a alimentação',5,NULL),
 (20,'Metformina','850mg','V','V','não relatou','V','F',21,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,NULL),
 (21,'Glimepirida','4mg','','F','não relatou','','',21,'','Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',1,NULL),
 (22,'Tylex®','7,5mg','V','V','não relatou','V','V',22,NULL,'Encaminhamento ao médico','Controlar a alimentação',5,'Estável'),
 (23,'Metformina','850mg','V','V','não relatou','V','V',23,NULL,'Intervenção educativa','Controlar a alimentação',7,'Estável'),
 (24,'Glimepirida','4mg','','F','não relatou','','',23,'','Encaminhamento ao médico','Encaminhamento ao nutricionista',1,'Resolvido'),
 (25,'Sinvastatina','20mg','','V','não relatou','','',24,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',2,NULL),
 (26,'Metformina','850mg','V','V','não relatou','V','F',25,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,NULL),
 (27,'Sinvastatina','20mg','','V','não relatou','','',26,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',2,'Inicial'),
 (28,'Metformina','850mg','V','V','não relatou','V','V',27,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,'Estável'),
 (29,'Gligage®','850mg','V','V','não relatou','F','',28,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',5,NULL),
 (30,'Não relatou','50mg','','V','não relatou','','',29,NULL,'Encaminhamento ao médico','Encaminhamento ao psicólogo',2,NULL),
 (31,'Gligage®','850mg','V','V','não relatou','F','',30,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',5,'Estável'),
 (32,'Não relatou','50mg','','V','não relatou','','',31,NULL,'Encaminhamento ao médico','Encaminhamento ao psicólogo',2,'Inicial'),
 (33,'Hidroxizina','2mg','','F','há 10 anos','','',32,NULL,'Intervenção educativa','Encaminhamento ao médico e a outro profissional de saúde',1,NULL),
 (34,'Propanolol','40mg','V','V','não relatou','V','F',33,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,NULL),
 (35,'Metformina','850mg','V','V','não relatou','V','F',34,NULL,'Intervenção educativa','Encaminhamento ao nutricionista',7,NULL),
 (36,'a definir','a definir','','V','não relatou','','',35,'','Intervenção educativa','Realizar atividade física',2,NULL),
 (37,'Hidroxizina','2mg','','F','há 10 anos','','',36,NULL,'Intervenção educativa','Encaminhamento ao médico e a outro profissional de saúde',1,'Resolvido'),
 (38,'Propanolol','40mg','V','V','não relatou','V','V',37,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,'Estável'),
 (39,'Metformina','850mg','V','V','não relatou','V','V',38,'','Realizar atividade física e controlar a alimentação','Encaminhamento ao nutricionista',7,'Estável'),
 (40,'Passiflorine®','não consta','V','V','há 1 mês','V','V',39,NULL,'Realizar atividade física','Controlar a alimentação',2,'Inicial'),
 (41,'a definir','a definir','','V','não consta','','',40,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',2,NULL),
 (42,'Enalapril','10mg','V','V','não relatou','F','',41,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',5,NULL),
 (43,'Atenolol','25mg','F','V','não relatou','','',42,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',4,NULL),
 (44,'Sinvastatina','20mg','V','V','não relatou','V','V',43,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',2,'Inicial'),
 (45,'Enalapril','10mg','V','V','não relatou','V','V',44,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',5,'Estável'),
 (46,'Atenolol','25mg','V','V','não relatou','V','V',45,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',4,'Estável'),
 (47,'Losartana','50mg','V','V','não relatou','F','',46,'','Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',5,NULL),
 (48,'Metformina','850mg','V','V','não realtou','V','F',47,'','Intervenção educativa','Realizar atividade física e controlar a alimentação',7,NULL),
 (49,'Losartana','50mg','V','V','não relatou','V','V',48,'','Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',5,'Estável'),
 (50,'Metformina','850mg','V','V','não relatou','V','V',49,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,'Estável'),
 (51,'Captopril','25mg','V','V','não relatou','F','',50,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',5,NULL),
 (52,'Metformina','850mg','V','V','não relatou','V','F',51,NULL,'Intervenção educativa','Encaminhamento ao nutricionista',7,NULL),
 (53,'Captopril','25mg','V','V','não relatou','V','V',52,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',5,'Estável'),
 (54,'Metformina','850mg','V','V','não relatou','V','V',53,NULL,'Intervenção educativa','Encaminhamento ao nutricionista',7,'Estável'),
 (55,'a definir','a definir','','V','não consta','','',55,NULL,'Encaminhamento ao médico','Encaminhamento ao nutricionista',2,NULL),
 (56,'Nifedipino','20mg','V','V','não relatou','V','F',56,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,NULL),
 (57,'Atorvastatina','40mg','V','V','não relatou','V','V',57,NULL,'Encaminhamento ao médico','Encaminhamento ao nutricionista',2,'Inicial'),
 (58,'Nifedipino','20mg','V','V','não relatou','V','V',58,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,'Melhora'),
 (59,'Benicar®','40mg','V','V','não relatou','V','F',59,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,NULL),
 (60,'Dimefor®','850mg','V','V','não relatou','F','',60,NULL,'Encaminhamento ao médico','Encaminhamento ao nutricionista',5,NULL),
 (61,'Colírio Combigan®','não relatou','','F','não relatou','','',61,NULL,'Intervenção educativa','Encaminhamento ao médico',1,NULL),
 (62,'Benicar®','40mg','V','V','não relatou','V','F',62,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,'Sem melhora'),
 (63,'Metformina','850mg','V','V','não relatou','V','V',63,NULL,'Encaminhamento ao médico','Encaminhamento ao nutricionista',5,'Estável'),
 (64,'Colírio Combigan®','não relatou','','F','não relatou','','',64,NULL,'Intervenção educativa','Encaminhamento ao médico',1,'Resolvido'),
 (65,'Anlodipino','5mg','V','V','não relatou','F','',67,NULL,'Encaminhamento ao médico','Intervenção educativa',5,NULL),
 (66,'Manipulado: Sinvastatina/Ezetimiba','20/10mg','V','V','não relatou','V','F',68,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,NULL),
 (67,'Anlodipino','5mg','V','V','não relatou','V','V',69,NULL,'Encaminhamento ao médico','Intervenção educativa',5,'Estável'),
 (68,'Manipulado: Sinvastatina/Ezetimiba','20/10mg','V','V','não relatou','V','V',70,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,'Estável'),
 (69,'Captopril','25mg','V','V','não relatou','F','',71,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',5,NULL),
 (70,'Glibenclamida','5mg','V','V','não relatou','V','F',72,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7,NULL),
 (71,'Captopril','25mg','V','V','não relatou','V','V',73,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',5,'Estável'),
 (72,'Glibenclamida','5mg','V','V','não relatou','V','V',74,'','Intervenção educativa','Realizar atividade física e controlar a alimentação',7,'Estável');
/*!40000 ALTER TABLE `medicamentoqueixa` ENABLE KEYS */;


--
-- Definition of table `medicamentoqueixaquarta`
--

DROP TABLE IF EXISTS `medicamentoqueixaquarta`;
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

--
-- Dumping data for table `medicamentoqueixaquarta`
--

/*!40000 ALTER TABLE `medicamentoqueixaquarta` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentoqueixaquarta` ENABLE KEYS */;


--
-- Definition of table `medicamentoqueixasegunda`
--

DROP TABLE IF EXISTS `medicamentoqueixasegunda`;
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
  `alternativa1` varchar(255) DEFAULT NULL,
  `alternativa2` varchar(255) DEFAULT NULL,
  `numeroPRM` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF12E64244E1862F8` (`fkQueixaSegunda`),
  CONSTRAINT `FKF12E64244E1862F8` FOREIGN KEY (`fkQueixaSegunda`) REFERENCES `queixarespostasegunda` (`id`),
  CONSTRAINT `FK_medicamentoqueixasegunda_1` FOREIGN KEY (`fkQueixaSegunda`) REFERENCES `queixarespostasegunda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicamentoqueixasegunda`
--

/*!40000 ALTER TABLE `medicamentoqueixasegunda` DISABLE KEYS */;
INSERT INTO `medicamentoqueixasegunda` (`id`,`descricao`,`dose`,`efetivo`,`necessario`,`periodo`,`seguro`,`cumprimento`,`fkQueixaSegunda`,`conheceCumpre`,`alternativa1`,`alternativa2`,`numeroPRM`) VALUES 
 (1,'Captopril','25mg','V','V','não relatou','F','',1,NULL,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',5),
 (2,'Glibenclamida','5mg','V','V','não relatou','V','F',2,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7),
 (3,'Captopril','25mg','V','V','não relatou','F','',3,NULL,'Encaminhamento ao médico','Intervenção educativa',5),
 (4,'Glibenclamida','5mg','V','V','não relatou','V','F',4,NULL,'Intervenção educativa','Encaminhamento ao médico',7),
 (5,'Captopril','25mg','V','V','não relatou','F','',5,NULL,'Encaminhamento ao médico','Intervenção educativa',5),
 (6,'Glibenclamida','5mg','V','V','não relatou','V','F',6,NULL,'Intervenção educativa','Realizar atividade física',7),
 (7,'Captopril','25mg','V','V','não relatou','F','',7,NULL,'Encaminhamento ao médico','Realizar atividade física',5),
 (8,'Glibenclamida','5mg','V','V','não relatou','V','F',8,NULL,'Intervenção educativa','Realizar atividade física',7),
 (9,'Anlodipino','5 mg','V','V','há um mês','F','V',11,NULL,'Encaminhamento ao médico','Nenhuma',5),
 (10,'Manipulado: Sinvastatina/Ezetimiba','20/10','V','V','não relatou','V','F',12,NULL,'Intervenção educativa','Realizar atividade física',7),
 (11,'a definir','a definir','F','V','a definir','F','F',13,NULL,'Encaminhamento ao médico','Realizar atividade física',2),
 (12,'Nifedipino','20mg','V','V','não relatou','V','F',14,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7),
 (15,'a definir','a definir','','V','a definir','','',17,NULL,'Encaminhamento ao médico','Controlar a alimentação',2),
 (16,'Enalapril','10mg','V','V','62 anos','F','V',18,NULL,'Encaminhamento ao médico','Intervenção educativa',5),
 (17,'Atenolol','25mg','V','V','62 anos','V','V',19,NULL,'Intervenção educativa','Nenhuma',4),
 (21,'a definir','a definir','','V','a definir','','',23,'','Realizar atividade física e controlar a alimentação','Encaminhamento ao médico e a outro profissional de saúde',2),
 (22,'Metformina','850 mg','V','V','não relatou','V','F',24,NULL,'Intervenção educativa','Encaminhamento ao nutricionista',7),
 (23,'Losartana','50 mg','V','V','','F','',25,NULL,'Encaminhamento ao médico','Intervenção educativa',5),
 (24,'Metformina','850 mg','V','V','','V','F',26,NULL,'Intervenção educativa','Encaminhamento ao nutricionista',7),
 (27,'Hidroclorotiazida','25 mg','','F','não relatado','','',29,NULL,'Encaminhamento ao médico','Nenhuma',1),
 (28,'Metformina','850 mg','V','V','não relatou','V','F',30,NULL,'Intervenção educativa','Realizar atividade física e controlar a alimentação',7),
 (29,'Sinvastatina','40mg','F','V','NÃO RELATOU','','',31,NULL,'Encaminhamento ao médico','Nenhuma',3),
 (30,'a definir','a definir','','V','a definir','','',32,NULL,'Encaminhamento ao médico','Nenhuma',2),
 (31,'Insulina Aspart','2 a 12U','V','V','não relatou','V','F',33,NULL,'Intervenção educativa','Nenhuma',7),
 (32,'Tylex®','7,5mg','V','V','desde o retorno ao clinico geral','F','V',34,NULL,'Controlar a alimentação','Encaminhamento ao médico e a outro profissional de saúde',5),
 (33,'Metformina','850mg','V','V','não relatou','V','F',35,NULL,'Intervenção educativa','Controlar a alimentação',7),
 (34,'Glimepirida','4mg','V','F','não relatou','','',35,'','Encaminhamento ao médico','Realizar atividade física e controlar a alimentação',1),
 (35,'a definir','a definir','','V','a definir','','',36,NULL,'Encaminhamento ao médico','Controlar a alimentação',2),
 (36,'Enalapril','10mg','V','V','62 anos','F','V',37,'','Encaminhamento ao médico','Intervenção educativa',5),
 (37,'Atenolol','25mg','V','V','62 anos','V','F',38,NULL,'Intervenção educativa','Intervenção educativa',4),
 (41,'Acetato de Medroxiprogesterona','XXX','F','F','XXX','F','',42,NULL,'Realizar atividade física','Realizar atividade física',1),
 (42,'Acetato de Medroxiprogesterona','xxx','V','V','xxxx','','',45,NULL,'Realizar atividade física','Realizar atividade física',1),
 (43,'Acetato de Medroxiprogesterona','xxxx','V','V','xxxx','','',46,NULL,'Realizar atividade física','Realizar atividade física',1);
/*!40000 ALTER TABLE `medicamentoqueixasegunda` ENABLE KEYS */;


--
-- Definition of table `medicamentoqueixaterceira`
--

DROP TABLE IF EXISTS `medicamentoqueixaterceira`;
CREATE TABLE `medicamentoqueixaterceira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alternativa1` varchar(255) DEFAULT NULL,
  `alternativa2` varchar(255) DEFAULT NULL,
  `cumprimento` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `dose` varchar(255) DEFAULT NULL,
  `efetivo` varchar(255) DEFAULT NULL,
  `necessario` varchar(255) DEFAULT NULL,
  `numeroPRM` int(11) NOT NULL,
  `periodo` varchar(255) DEFAULT NULL,
  `seguro` varchar(255) DEFAULT NULL,
  `situacao` varchar(255) DEFAULT NULL,
  `fkQueixaTerceira` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAE42F2DC683DA108` (`fkQueixaTerceira`),
  CONSTRAINT `FKAE42F2DC683DA108` FOREIGN KEY (`fkQueixaTerceira`) REFERENCES `queixarespostaterceira` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicamentoqueixaterceira`
--

/*!40000 ALTER TABLE `medicamentoqueixaterceira` DISABLE KEYS */;
INSERT INTO `medicamentoqueixaterceira` (`id`,`alternativa1`,`alternativa2`,`cumprimento`,`descricao`,`dose`,`efetivo`,`necessario`,`numeroPRM`,`periodo`,`seguro`,`situacao`,`fkQueixaTerceira`) VALUES 
 (1,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação','V','Captopril','25mg','V','V',5,'não relatou','V','Estável',1),
 (2,'Intervenção educativa','Realizar atividade física e controlar a alimentação','V','Glibenclamida','5mg','F','V',7,'não relatou','V','Estável',2),
 (3,'Encaminhamento ao médico','Intervenção educativa','V','Captopril','25mg','V','V',5,'não relatou','V','Melhora parcial',3),
 (4,'Intervenção educativa','Encaminhamento ao nutricionista','V','Glibenclamida','5mg ','V','V',7,'não relatou','V','Estável',4),
 (5,'Encaminhamento ao médico','Intervenção educativa','V','Captopril','25mg','V','V',5,'não relatou','V','Melhora parcial',5),
 (6,'Intervenção educativa','Realizar atividade física','V','Glibenclamida','5mg ','V','V',7,'não relatou','V','Estável',6),
 (7,'Encaminhamento ao médico','Realizar atividade física','V','Captopril','25mg','V','V',5,'não relatou','V','Melhora parcial',7),
 (8,'Intervenção educativa','Realizar atividade física','V','Glibenclamida','5mg ','V','V',7,'não relatou','V','Estável',8),
 (9,'Encaminhamento ao médico','Nenhuma','V','Captopril','25mg','V','V',5,'não relatou','V','Melhora parcial',9),
 (10,'Intervenção educativa','Nenhuma','V','Glibenclamida','5mg ','V','V',7,'não relatou','V','Estável',10),
 (11,'Realizar atividade física e controlar a alimentação','Intervenção educativa','F','Atorvastatina','40mg','F','V',2,'a partir do término do segundo atendimento','F','Inicial',11),
 (12,'Realizar atividade física e controlar a alimentação','Intervenção educativa','V','Nifedipino','20mg','V','V',7,'não relatou','V','Estável',12),
 (13,'Encaminhamento ao médico','Intervenção educativa','V','Anlodipino','5 mg','V','V',5,'não relatou','F','Melhora parcial',13),
 (14,'Intervenção educativa','Realizar atividade física','F','Manipulado: Sinvastatina/Ezetimiba','20/10 mg','V','V',7,'não relatou','V','Melhora',14),
 (15,'Encaminhamento ao médico','Intervenção educativa','','Losartana','50mg','V','V',5,'1977','F','Estável',15),
 (16,'Intervenção educativa','Encaminhamento ao nutricionista','F','Metformina','850mg','V','V',7,'2008','V','Resolvido',16),
 (17,'Controlar a alimentação','Realizar atividade física','F','Sinvastatina','20mg','F','F',2,'a última ida ao médico','F','Inicial',23),
 (18,'Intervenção educativa','Realizar atividade física','V','Atenolol','25mg','F','V',4,'62 anos','V','Estável',24),
 (19,'Realizar atividade física','Realizar atividade física e controlar a alimentação','F','Hidroclorotiazida','25mg','F','V',5,'a última ida ao médico','F','Inicial',24),
 (20,'Controlar a alimentação','Realizar atividade física','F','Sinvastatina','20mg','F','V',1,'','F','Inicial',26),
 (21,'Intervenção educativa','Realizar atividade física','','Atenolol','25mg','F','V',4,'62 anos de idade','V','Estável',27),
 (22,'Realizar atividade física','Realizar atividade física e controlar a alimentação','F','Hidroclorotiazida','25mg','F','V',5,'última ida ao médico','F','Inicial',28),
 (23,'Encaminhamento ao médico','Controlar a alimentação','V','Tylex®','7,5 mg','V','V',5,'não relatou','F','Melhora parcial',29),
 (24,'Intervenção educativa','Realizar atividade física e controlar a alimentação','F','Metformina','850 mg','V','V',7,'não relatou','V','Estável',30),
 (25,'Encaminhamento ao médico','Realizar atividade física e controlar a alimentação','','Glimepirida','4 mg','','F',1,'não relatou','','Resolvido',30),
 (26,'Encaminhamento ao médico','Nenhuma','','Hidroclorotiazida','25 mg','','F',1,'não relatado','','Resolvido',31),
 (27,'Intervenção educativa','Realizar atividade física e controlar a alimentação','F','Metformina','850 mg','V','V',7,'não relatado','V','Estável',32),
 (28,'Realizar atividade física','Encaminhamento ao médico e a outro profissional de saúde','','Sinvastatina','20 mg','','V',2,'não relatou','','Inicial',33),
 (29,'Intervenção educativa','Encaminhamento ao nutricionista','F','Metformina','850mg','V','V',7,'não relatou','V','Estável',34),
 (30,'Encaminhamento ao médico','Nenhuma','','Sinvastatina','40mg','F','V',3,'não relatou','','Melhora parcial',35),
 (31,'Encaminhamento ao médico','Controlar a alimentação','','Omeprazol','20mg','','V',2,'não relatou','','Inicial',36),
 (32,'Intervenção educativa','Nenhuma','F','Insulina Aspart','2 a 12U','V','V',7,'não relatou','V','Melhora',37),
 (33,'Controlar a alimentação','Realizar atividade física','','Sinvastatina','20mg','','V',2,'a última ida ao médico','','Inicial',38),
 (34,'Intervenção educativa','Realizar atividade física','V','Atenolol','25mg','F','V',4,'62 anos de idade','V','Estável',39),
 (35,'Realizar atividade física','Controlar a alimentação','F','Hidroclorotiazida','25mg','F','V',5,'última ida ao médico','F','Inicial',40);
/*!40000 ALTER TABLE `medicamentoqueixaterceira` ENABLE KEYS */;


--
-- Definition of table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
CREATE TABLE `medicamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicamentos`
--

/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` (`id`,`descricao`,`idioma`) VALUES 
 (4,'Acetato de Medroxiprogesterona','pt'),
 (5,'Aciclovir','pt'),
 (6,'Acido Acetilsalicilico','pt'),
 (7,'Acido Falico','pt'),
 (8,'Albendazol','pt'),
 (9,'Apopurinol','pt'),
 (10,'Amiodarona','pt'),
 (11,'Amitriptilina','pt'),
 (12,'Amoxicilina','pt'),
 (13,'Atenolol','pt'),
 (14,'Azatioprina','pt'),
 (15,'Azitromicina','pt'),
 (16,'Benzilpenicilina Benzantina','pt'),
 (17,'Glibenclamida','pt'),
 (18,'Captopril','pt'),
 (19,'Nifedipino','pt'),
 (20,'Furosemida','pt'),
 (21,'Metformina','pt'),
 (22,'Ácido Acetil Salicilico','pt'),
 (23,'Sinvastatina','pt'),
 (24,'Vildagliptina/Metformina','pt'),
 (25,'Fluoxetina','pt'),
 (26,'Insulina Aspart','pt'),
 (27,'Enalapril','pt'),
 (28,'Propanolol','pt'),
 (29,'Losartana','pt'),
 (30,'Complexo B','pt'),
 (31,'Glimepirida','pt'),
 (32,'Somalgin®','pt'),
 (33,'Tylex®','pt'),
 (34,'Gligage®','pt'),
 (35,'Adalat retard®','pt'),
 (36,'Hidroxizina','pt'),
 (37,'Omeprazol','pt'),
 (38,'Manipulado: Losartano, Atenolol, Anlodipino, Hidroclorotiazida','pt'),
 (39,'Atorvastatina','pt'),
 (40,'Cloridrato de Tramadol','pt'),
 (41,'Isordil®','pt'),
 (42,'Insulina NPH','pt'),
 (43,'Tylenol DC®','pt'),
 (44,'Benicar®','pt'),
 (45,'Colírio Combigan®','pt'),
 (46,'Dimefor®','pt'),
 (47,'Betalor®','pt'),
 (48,'Pantoprazol','pt'),
 (49,'Manipulado: Sinvastatina/Ezetimiba','pt'),
 (50,'Polivitamínico','pt'),
 (51,'Hidroclorotiazida','pt'),
 (52,'Hidroclorotiazida/Amilorida','pt'),
 (53,'Acetildor®','pt'),
 (54,'Lípitor®','pt'),
 (55,'Capox®','pt'),
 (56,'Hidromed®','pt'),
 (57,'Triformin®','pt'),
 (58,'Acarbose','pt'),
 (59,'Gliclazida','pt'),
 (60,'Janumet®','pt'),
 (61,'Benerva®','pt'),
 (62,'Diovan®','pt'),
 (63,'Avodart®','pt'),
 (64,'Centrum®','pt'),
 (65,'Bufferin Cardio®','pt'),
 (66,'Ablok®','pt'),
 (67,'Losartana/Hidroclorotiazida','pt'),
 (68,'Galvus Met®','pt'),
 (69,'Valtrian HCT®','pt'),
 (70,'Glimepiril®','pt'),
 (71,'Galvus®','pt'),
 (72,'Beneum®','pt'),
 (73,'Não relatou','pt'),
 (74,'Passiflorine®','pt'),
 (75,'a definir','pt'),
 (76,'Glifage®','pt'),
 (77,'Donaren®','pt'),
 (78,'Propranolol','pt'),
 (79,'Valsartana','pt'),
 (80,'Anlodipino','pt'),
 (81,'Moduretic®','pt');
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;


--
-- Definition of table `parametroclinico`
--

DROP TABLE IF EXISTS `parametroclinico`;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parametroclinico`
--

/*!40000 ALTER TABLE `parametroclinico` DISABLE KEYS */;
INSERT INTO `parametroclinico` (`id`,`descricao`,`unidade`,`valor`,`valorDeReferencia`,`fkCasoClinico`) VALUES 
 (1,'Hemoglobina','%',12.4,'6.5',1),
 (2,'Glicemia','mg/dl',228,'até 140',1),
 (3,'Hemoglobina','%',13,'6,5',2),
 (4,'Glicemia','mg/dl',274,'70 a 100',2),
 (5,'Colesterol total','mg/dl',273,'até 200',2),
 (6,'Glicemia','mg/dl',129,'70 a 100',3),
 (7,'Glicemia','mg/dl',212,'até 140',3),
 (8,'Hemoglobina','%',8.8,'6.5',3),
 (9,'Hemoglobina','%',6.6,'6.5',4),
 (10,'Glicemia','mg/dl',131,'até 140',4),
 (11,'Glicemia','mg/dl',133,'70 a 100',4),
 (12,'Glicemia','mg/dl',280,'70 a 100',5),
 (13,'Colesterol total','mg/dl',254,'até 200',5),
 (14,'Triglicerídeos','mg/dl',302,'até 150',5),
 (15,'Hemoglobina','%',10.5,'6.5',5),
 (16,'Hemoglobina','%',11,'6,5',6),
 (17,'Hemoglobina','%',8.8,'6.5',7),
 (18,'Colesterol total','mg/dl',298,'até 200',8),
 (19,'Glicemia','mg/dl',119,'70 a 100',8),
 (20,'Hemoglobina','%',7.5,'6.5',9),
 (21,'Glicemia','mg/dl',106,'70 a 100',10),
 (22,'Hemoglobina','%',7.82,'6.5',10),
 (23,'Glicemia','mg/dl',133,'até 140',10),
 (24,'Glicemia','mg/dl',103,'70 a 100',11),
 (25,'Colesterol total','mg/dl',291,'até 200',11),
 (26,'HDL','mg/dl',60,'igual ou superior a 60',11),
 (27,'LDL','mg/dl',223,'menor que 100',11),
 (28,'Hemoglobina','%',9.9,'6.5',12),
 (29,'Glicemia','mg/dl',170,'70 a 100',12),
 (30,'Colesterol total','mg/dl',266,'até 200',13),
 (31,'Hemoglobina','%',10.2,'6.5',14),
 (32,'Colesterol total','mg/dl',133,'até 200',14);
/*!40000 ALTER TABLE `parametroclinico` ENABLE KEYS */;


--
-- Definition of table `queixa`
--

DROP TABLE IF EXISTS `queixa`;
CREATE TABLE `queixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `numeroEtapa` int(11) NOT NULL,
  `numeroPRM` int(11) NOT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  `conheceOuPreocupa` varchar(255) DEFAULT NULL,
  `periodoSurgimento` varchar(255) DEFAULT NULL,
  `prioridade` int(11) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC773DEB18A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FKC773DEB18A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queixa`
--

/*!40000 ALTER TABLE `queixa` DISABLE KEYS */;
INSERT INTO `queixa` (`id`,`descricao`,`numeroEtapa`,`numeroPRM`,`fkCasoClinico`,`conheceOuPreocupa`,`periodoSurgimento`,`prioridade`,`tipo`) VALUES 
 (1,'Diminuição da audição',0,-1,1,NULL,NULL,0,'D'),
 (2,'Hiperlipidemia',1,2,1,'','não relatou',3,'P'),
 (3,'Hipertensão',1,7,1,'','10 anos',1,'P'),
 (4,'Diabetes',1,7,1,'','10 anos',2,'P'),
 (5,'Hiperlipidemia',2,2,1,'','não relatou',3,''),
 (6,'Hipertensão',2,7,1,'','10 anos',1,''),
 (7,'Diabetes',2,7,1,'','10 anos',2,''),
 (8,'Hiperlipidemia',1,3,2,'','não relatou',1,'P'),
 (9,'Queimação',1,2,2,'','não relatou',2,'P'),
 (10,'Diabetes',1,7,2,'','não relatou',1,'P'),
 (11,'Hiperlipidemia',2,3,2,'','não relatou',1,''),
 (12,'Queimação',2,2,2,'','não relatou',2,''),
 (13,'Diabetes',2,7,2,'','não relatou',1,''),
 (14,'Diminuição da audição',0,-1,3,NULL,NULL,0,'D'),
 (15,'Hipertensão',1,1,3,'','não relatou',1,'P'),
 (16,'Diabetes',1,7,3,'','não realtou',1,'P'),
 (17,'Hipertensão',2,1,3,'','não relatou',1,''),
 (18,'Diabetes',2,7,3,'','não relatou',1,''),
 (19,'Dor',0,-1,4,NULL,NULL,0,'D'),
 (20,'Constipação',1,5,4,'','não relatou',2,'P'),
 (21,'Diabetes',1,7,4,'','não realtou',1,'P'),
 (22,'Constipação',2,5,4,'','não relatou',2,''),
 (23,'Diabetes',2,7,4,'','não relatou',1,''),
 (24,'Hiperlipidemia',1,2,5,'','não relatou',2,'P'),
 (25,'Diabetes',1,7,5,'','não realtou',1,'P'),
 (26,'Hiperlipidemia',2,2,5,'','não relatou',2,''),
 (27,'Diabetes',2,7,5,'','não relatou',1,''),
 (28,'Diabetes',1,5,6,'','não relatou',1,'P'),
 (29,'Depressão',1,2,6,'','não relatou',2,'P'),
 (30,'Diabetes',2,5,6,'','não relatou',1,''),
 (31,'Depressão',2,2,6,'','não relatou',2,''),
 (32,'Dor',1,5,7,'','não relatou',1,'P'),
 (33,'Hipertensão',1,7,7,'','há 13 anos',1,'P'),
 (34,'Diabetes',1,7,7,'','há 13 anos',1,'P'),
 (35,'Insônia',1,2,7,'','não relatou',2,'P'),
 (36,'Dor',2,5,7,'','não relatou',1,''),
 (37,'Hipertensão',2,7,7,'','há 13 anos',1,''),
 (38,'Diabetes',2,7,7,'','há 13 anos',1,''),
 (39,'Insônia',2,2,7,'','não relatou',2,''),
 (40,'Hiperlipidemia',1,2,8,'','há 15 anos',1,'P'),
 (41,'Hipertensão',1,5,8,'','há 15 anos',1,'P'),
 (42,'Hipertensão',1,4,8,'','há 15 anos',1,'P'),
 (43,'Hiperlipidemia',2,2,8,'','há 15 anos',1,''),
 (44,'Hipertensão',2,5,8,'','há 15 anos',1,''),
 (45,'Hipertensão',2,4,8,'','há 15 anos',1,''),
 (46,'Hipertensão',1,5,9,'','há 35 anos',1,'P'),
 (47,'Diabetes',1,7,9,'','2008',1,'P'),
 (48,'Hipertensão',2,5,9,'','há 35 anos',1,''),
 (49,'Diabetes',2,7,9,'','2008',1,''),
 (50,'Hipertensão',1,5,10,'','há 13 anos',1,'P'),
 (51,'Diabetes',1,7,10,'','há 13 anos',1,'P'),
 (52,'Hipertensão',2,5,10,'','há 13 anos',1,''),
 (53,'Diabetes',2,7,10,'','há 13 anos',1,''),
 (54,'Diabetes',0,-1,11,NULL,NULL,0,'D'),
 (55,'Hiperlipidemia',1,2,11,'','não relatou',1,'P'),
 (56,'Hipertensão',1,7,11,'','há 10 anos',1,'P'),
 (57,'Hiperlipidemia',2,2,11,'','não relatou',1,''),
 (58,'Hipertensão',2,7,11,'','há 10 anos',1,''),
 (59,'Hipertensão',1,7,12,'','há 9 anos',1,'P'),
 (60,'Diabetes',1,5,12,'','há 9 anos',2,'P'),
 (61,'Retinopatia diabética',1,1,12,'','há 2 anos',1,'P'),
 (62,'Hipertensão',2,7,12,'','há 9 anos',1,''),
 (63,'Diabetes',2,5,12,'','há 9 anos',2,''),
 (64,'Retinopatia diabética',2,1,12,'','há 2 anos',1,''),
 (65,'Hipertensão',0,-1,13,NULL,NULL,0,'D'),
 (66,'Refluxo',0,-1,13,NULL,NULL,0,'D'),
 (67,'Edema',1,5,13,'','não relatou',2,'P'),
 (68,'Hiperlipidemia',1,7,13,'','há 2 anos',1,'P'),
 (69,'Edema',2,5,13,'','não relatou',2,''),
 (70,'Hiperlipidemia',2,7,13,'','há 2 anos',1,''),
 (71,'Hipertensão',1,5,14,'','há 13 anos',2,'P'),
 (72,'Diabetes',1,7,14,'','há 13 anos',1,'P'),
 (73,'Hipertensão',2,5,14,'','há 13 anos',2,''),
 (74,'Diabetes',2,7,14,'','há 13 anos',1,'');
/*!40000 ALTER TABLE `queixa` ENABLE KEYS */;


--
-- Definition of table `queixarespostaprimeira`
--

DROP TABLE IF EXISTS `queixarespostaprimeira`;
CREATE TABLE `queixarespostaprimeira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `fkResposta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_queixarespostaprimeira_1` (`fkResposta`),
  KEY `FK1E43344B8872A0F6` (`fkResposta`),
  CONSTRAINT `FK1E43344B8872A0F6` FOREIGN KEY (`fkResposta`) REFERENCES `respostaprimeira` (`id`),
  CONSTRAINT `FK_queixarespostaprimeira_1` FOREIGN KEY (`fkResposta`) REFERENCES `respostaprimeira` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queixarespostaprimeira`
--

/*!40000 ALTER TABLE `queixarespostaprimeira` DISABLE KEYS */;
INSERT INTO `queixarespostaprimeira` (`id`,`descricao`,`fkResposta`) VALUES 
 (1,'Hipertensão',1),
 (2,'Diabetes',1),
 (3,'Hipertensão',2),
 (4,'Diabetes',2),
 (5,'Hipertensão',3),
 (6,'Diabetes',3),
 (7,'Hipertensão',4),
 (8,'Diabetes',4),
 (9,'Hipertensão',5),
 (10,'Diabetes',5),
 (11,'Hipertensão',6),
 (12,'Diabetes',6),
 (13,'Hiperlipidemia',7),
 (14,'Hipertensão',7),
 (15,'Hiperlipidemia',8),
 (16,'Hipertensão',8),
 (17,'Hiperlipidemia',9),
 (18,'Hipertensão',9),
 (19,'Infarto do miocárdio',9),
 (20,'Diabetes',9),
 (21,'Alteração de peso',10),
 (22,'Hiperlipidemia',10),
 (23,'Diabetes',10),
 (24,'Hipertensão',11),
 (25,'Diabetes',11),
 (26,'Dor',12),
 (27,'Constipação',12),
 (28,'Diabetes',12),
 (29,'Diminuição da audição',13),
 (30,'Hipertensão',13),
 (31,'Diabetes',13),
 (32,'Alteração de peso',14),
 (33,'Hiperlipidemia',14),
 (34,'Diabetes',14),
 (35,'Hiperlipidemia',15),
 (36,'Hipertensão',15),
 (37,'Alteração de peso',16),
 (38,'Hiperlipidemia',16),
 (39,'Queimação',16),
 (40,'Diabetes',16),
 (41,'Hipertensão',17),
 (42,'Diabetes',17),
 (43,'Hiperlipidemia',18),
 (44,'Queimação',18),
 (45,'Diabetes',18);
/*!40000 ALTER TABLE `queixarespostaprimeira` ENABLE KEYS */;


--
-- Definition of table `queixarespostaquarta`
--

DROP TABLE IF EXISTS `queixarespostaquarta`;
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

--
-- Dumping data for table `queixarespostaquarta`
--

/*!40000 ALTER TABLE `queixarespostaquarta` DISABLE KEYS */;
/*!40000 ALTER TABLE `queixarespostaquarta` ENABLE KEYS */;


--
-- Definition of table `queixarespostasegunda`
--

DROP TABLE IF EXISTS `queixarespostasegunda`;
CREATE TABLE `queixarespostasegunda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroPRM` int(11) NOT NULL DEFAULT '0',
  `fkResposta2` int(11) NOT NULL DEFAULT '0',
  `flConheceOuPreocupa` varchar(1) DEFAULT NULL,
  `prioridade` int(10) unsigned NOT NULL,
  `descricao` varchar(125) DEFAULT NULL,
  `periodoSurgimento` varchar(45) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK685CED99A4FE1140` (`fkResposta2`),
  KEY `FKFD098D39A4FE1140` (`fkResposta2`),
  CONSTRAINT `FK685CED99A4FE1140` FOREIGN KEY (`fkResposta2`) REFERENCES `respostasegunda` (`id`),
  CONSTRAINT `FKFD098D39A4FE1140` FOREIGN KEY (`fkResposta2`) REFERENCES `respostasegunda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queixarespostasegunda`
--

/*!40000 ALTER TABLE `queixarespostasegunda` DISABLE KEYS */;
INSERT INTO `queixarespostasegunda` (`id`,`numeroPRM`,`fkResposta2`,`flConheceOuPreocupa`,`prioridade`,`descricao`,`periodoSurgimento`,`tipo`) VALUES 
 (1,0,1,NULL,2,'Hipertensão','há 13 anos','P'),
 (2,0,1,NULL,1,'Diabetes','há 13 anos','P'),
 (3,0,2,NULL,2,'Hipertensão','há 13 anos','P'),
 (4,0,2,NULL,1,'Diabetes','há 13 anos','P'),
 (5,0,3,NULL,2,'Hipertensão','há 13 anos','P'),
 (6,0,3,NULL,1,'Diabetes','há 13 anos','P'),
 (7,0,4,NULL,2,'Hipertensão','há 13 anos','P'),
 (8,0,4,NULL,1,'Diabetes','há 13 anos','P'),
 (9,0,5,NULL,1,'Hipertensão','há 13 anos',''),
 (10,0,5,NULL,2,'Diabetes','há 13 anos','P'),
 (11,0,6,NULL,2,'Edema','1 mês','P'),
 (12,0,6,NULL,1,'Hiperlipidemia',' 2 anos','P'),
 (13,0,7,NULL,2,'Hiperlipidemia','Não relatou','P'),
 (14,0,7,NULL,1,'Hipertensão','há 10 anos','P'),
 (17,0,9,NULL,2,'Hiperlipidemia','62 anos de idade','P'),
 (18,0,9,NULL,2,'Hipertensão','62 anos de idade','P'),
 (19,0,9,NULL,1,'Hipertensão','62 anos','P'),
 (23,0,11,NULL,2,'Hiperlipidemia','há 2 anos','P'),
 (24,0,11,NULL,1,'Diabetes','há 2 anos','P'),
 (25,0,12,NULL,1,'Hipertensão','1977','P'),
 (26,0,12,NULL,2,'Diabetes','2008','P'),
 (29,0,14,NULL,2,'Hipertensão','há 13 anos','P'),
 (30,0,14,NULL,1,'Diabetes','há 13 anos','P'),
 (31,0,15,NULL,1,'Hiperlipidemia','Não relatou','P'),
 (32,0,15,NULL,2,'Queimação','Não relatou','P'),
 (33,0,15,NULL,3,'Diabetes','Não relatou','P'),
 (34,0,16,NULL,1,'Constipação','não relatou','P'),
 (35,0,16,NULL,2,'Diabetes','há 30 anos','P'),
 (36,0,17,NULL,2,'Hiperlipidemia','62 anos de idade','P'),
 (37,0,17,NULL,2,'Hipertensão','62 anos de idade','P'),
 (38,0,17,NULL,1,'Hipertensão','62 anos de idade','P'),
 (42,0,19,NULL,1,'Hiperlipidemia','XXX','P'),
 (43,0,19,NULL,0,'Hipertensão','',''),
 (44,0,19,NULL,0,'Hipertensão','',''),
 (45,0,20,NULL,1,'Hiperlipidemia','xxxx','P'),
 (46,0,20,NULL,2,'Queimação','xxxx','P'),
 (47,0,20,NULL,0,'Diabetes','','');
/*!40000 ALTER TABLE `queixarespostasegunda` ENABLE KEYS */;


--
-- Definition of table `queixarespostaterceira`
--

DROP TABLE IF EXISTS `queixarespostaterceira`;
CREATE TABLE `queixarespostaterceira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(80) NOT NULL DEFAULT '',
  `fkResposta` int(11) NOT NULL,
  `numeroPRM` int(11) DEFAULT NULL,
  `periodoSurgimento` varchar(255) DEFAULT NULL,
  `prioridade` int(11) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1CE59807871504B2` (`fkResposta`),
  CONSTRAINT `FK1CE59807871504B2` FOREIGN KEY (`fkResposta`) REFERENCES `respostaterceira` (`id`),
  CONSTRAINT `FK_queixarespostaterceira_1` FOREIGN KEY (`fkResposta`) REFERENCES `respostaterceira` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queixarespostaterceira`
--

/*!40000 ALTER TABLE `queixarespostaterceira` DISABLE KEYS */;
INSERT INTO `queixarespostaterceira` (`id`,`descricao`,`fkResposta`,`numeroPRM`,`periodoSurgimento`,`prioridade`,`tipo`) VALUES 
 (1,'Hipertensão',1,0,'há 13 anos',2,NULL),
 (2,'Diabetes',1,0,'há 13 anos',1,NULL),
 (3,'Hipertensão',2,0,'há 13 anos',2,NULL),
 (4,'Diabetes',2,0,'há 13 anos',1,NULL),
 (5,'Hipertensão',3,0,'há 13 anos',2,NULL),
 (6,'Diabetes',3,0,'há 13 anos',1,NULL),
 (7,'Hipertensão',4,0,'há 13 anos',2,NULL),
 (8,'Diabetes',4,0,'há 13 anos',1,NULL),
 (9,'Hipertensão',5,0,'há 13 anos',2,NULL),
 (10,'Diabetes',5,0,'há 13 anos',1,NULL),
 (11,'Hiperlipidemia',6,0,'não relatou',2,NULL),
 (12,'Hipertensão',6,0,'há 10 anos',1,NULL),
 (13,'Edema',7,0,'não relatou',2,NULL),
 (14,'Hiperlipidemia',7,0,'2 anos',1,NULL),
 (15,'Hipertensão',8,0,'1977',1,NULL),
 (16,'Diabetes',8,0,'2008',1,NULL),
 (17,'Hiperlipidemia',9,0,'',0,NULL),
 (18,'Hipertensão',9,0,'',0,NULL),
 (19,'Hipertensão',9,0,'',0,NULL),
 (20,'Hiperlipidemia',10,0,'',0,NULL),
 (21,'Hipertensão',10,0,'',0,NULL),
 (22,'Hipertensão',10,0,'',0,NULL),
 (23,'Hiperlipidemia',11,0,'62 anos',1,NULL),
 (24,'Hipertensão',11,0,'62 anos',2,NULL),
 (25,'Hipertensão',11,0,'',0,NULL),
 (26,'Hiperlipidemia',12,0,'62 anos',1,NULL),
 (27,'Hipertensão',12,0,'62 anos',1,NULL),
 (28,'Hipertensão',12,0,'62 anos',2,NULL),
 (29,'Constipação',13,0,'Não relatou',1,NULL),
 (30,'Diabetes',13,0,'Não relatou',2,NULL),
 (31,'Hipertensão',14,0,'há 13 anos',2,NULL),
 (32,'Diabetes',14,0,'há 13 anos',1,NULL),
 (33,'Hiperlipidemia',15,0,'2 anos',2,NULL),
 (34,'Diabetes',15,0,'2 anos',1,NULL),
 (35,'Hiperlipidemia',16,0,'Não relatou',1,NULL),
 (36,'Queimação',16,0,'não relatou',2,NULL),
 (37,'Diabetes',16,0,'não relatou',3,NULL),
 (38,'Hiperlipidemia',17,0,'62 anos de idade',1,NULL),
 (39,'Hipertensão',17,0,'62 anos de idade',1,NULL),
 (40,'Hipertensão',17,0,'',0,NULL);
/*!40000 ALTER TABLE `queixarespostaterceira` ENABLE KEYS */;


--
-- Definition of table `razaoencontro`
--

DROP TABLE IF EXISTS `razaoencontro`;
CREATE TABLE `razaoencontro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `razaoencontro`
--

/*!40000 ALTER TABLE `razaoencontro` DISABLE KEYS */;
INSERT INTO `razaoencontro` (`id`,`descricao`,`idioma`) VALUES 
 (1,'Paciente sente medo de usar vários medicamentos','pt'),
 (2,'Paciente sente necessidade de conversar sobre seus problemas','pt'),
 (3,'Paciente acredita que adicionar medicamento significa fracasso','pt'),
 (4,'Paciente questiona a necessidade de usar medicamentos','pt'),
 (5,'Paciente questiona os efeitos dos medicamentos','pt'),
 (6,'Paciente prefere não tomar o medicamento quando se sente bem','pt'),
 (7,'Paciente desconhece para que servem os medicamentos','pt'),
 (8,'Paciente tem baixo de nível de conhecimento sobre doença e sobre os medicamentos','pt'),
 (9,'Paciente não tolera o efeito colateral dos medicamentos','pt'),
 (10,'Paciente exerce o controle sobre sua farmacoterapia','pt'),
 (11,'Paciente tem medo das possíveis reações adversas do medicamento','pt'),
 (12,'Paciente se sente confusa com os horários dos medicamentos','pt'),
 (13,'Paciente apresenta um problema de saúde que não está diretamente ligado à farmacoterapia','pt'),
 (14,'Paciente deseja entender a farmacoterapia','pt'),
 (15,'Paciente não consegue pagar pelo medicamento','pt'),
 (16,'Nenhuma das alternativas','pt'),
 (17,'Deseja cuidar mais da saúde e que a glicemia seja controlada','pt'),
 (18,'Espera reduzir o número de medicamentos que toma e reduzir a glicemia.','pt'),
 (19,'Espera reduzir o número de medicamentos que toma e reduzir a glicemia.','pt');
/*!40000 ALTER TABLE `razaoencontro` ENABLE KEYS */;


--
-- Definition of table `razaoencontrocaso`
--

DROP TABLE IF EXISTS `razaoencontrocaso`;
CREATE TABLE `razaoencontrocaso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `fkCasoClinico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5FA8FA2B8A1319FF` (`fkCasoClinico`),
  CONSTRAINT `FK5FA8FA2B8A1319FF` FOREIGN KEY (`fkCasoClinico`) REFERENCES `casoclinico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `razaoencontrocaso`
--

/*!40000 ALTER TABLE `razaoencontrocaso` DISABLE KEYS */;
INSERT INTO `razaoencontrocaso` (`id`,`descricao`,`fkCasoClinico`) VALUES 
 (1,'Paciente questiona a necessidade de usar medicamentos',1),
 (2,'Paciente se sente confusa com os horários dos medicamentos',2),
 (3,'Paciente sente medo de usar vários medicamentos',3),
 (4,'Paciente deseja entender a farmacoterapia',4),
 (5,'Paciente desconhece para que servem os medicamentos',5),
 (6,'Paciente sente necessidade de conversar sobre seus problemas',6),
 (7,'Paciente questiona os efeitos dos medicamentos',7),
 (8,'Paciente não tolera o efeito colateral dos medicamentos',8),
 (9,'Paciente não tolera o efeito colateral dos medicamentos',9),
 (10,'Paciente prefere não tomar o medicamento quando se sente bem',10),
 (11,'Paciente questiona a necessidade de usar medicamentos',11),
 (12,'Paciente questiona os efeitos dos medicamentos',12),
 (13,'Paciente questiona os efeitos dos medicamentos',13),
 (14,'Paciente sente medo de usar vários medicamentos',14),
 (15,'Deseja cuidar mais da saúde e que a glicemia seja controlada',5),
 (16,'Espera reduzir o número de medicamentos que toma e reduzir a glicemia.',3),
 (17,'Espera reduzir o número de medicamentos que toma e reduzir a glicemia.',3);
/*!40000 ALTER TABLE `razaoencontrocaso` ENABLE KEYS */;


--
-- Definition of table `respostaprimeira`
--

DROP TABLE IF EXISTS `respostaprimeira`;
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
  `conclusao` varchar(255) DEFAULT NULL,
  `experienciaMedicamentos1` varchar(255) DEFAULT NULL,
  `experienciaMedicamentos2` varchar(255) DEFAULT NULL,
  `experienciaMedicamentos3` varchar(255) DEFAULT NULL,
  `experienciaMedicamentos4` varchar(255) DEFAULT NULL,
  `experienciaMedicamentos5` varchar(255) DEFAULT NULL,
  `historiaMedicaPregressa` varchar(255) DEFAULT NULL,
  `historiafamiliar` varchar(255) DEFAULT NULL,
  `necessidadeAtencao1` varchar(255) DEFAULT NULL,
  `necessidadeAtencao2` varchar(255) DEFAULT NULL,
  `necessidadeAtencao3` varchar(255) DEFAULT NULL,
  `necessidadeAtencao4` varchar(255) DEFAULT NULL,
  `necessidadeAtencao5` varchar(255) DEFAULT NULL,
  `outroExpMed1Txt` varchar(255) DEFAULT NULL,
  `outroExpMed2Txt` varchar(255) DEFAULT NULL,
  `outroExpMed3Txt` varchar(255) DEFAULT NULL,
  `outroExpMed4Txt` varchar(255) DEFAULT NULL,
  `outroExpMed5Txt` varchar(255) DEFAULT NULL,
  `outroExpMedConcTxt` varchar(255) DEFAULT NULL,
  `outroRazaoEncontroTxt` varchar(255) DEFAULT NULL,
  `razaoEncontro` varchar(255) DEFAULT NULL,
  `anotacoesExtras` longtext,
  PRIMARY KEY (`id`),
  KEY `FK_respostaprimeira_1` (`fkConsulta`),
  KEY `FK88D8D79A5097F805` (`fkConsulta`),
  CONSTRAINT `FK88D8D79A5097F805` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`),
  CONSTRAINT `FK_respostaprimeira_1` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `respostaprimeira`
--

/*!40000 ALTER TABLE `respostaprimeira` DISABLE KEYS */;
INSERT INTO `respostaprimeira` (`id`,`alergias`,`altura`,`dataDeRealizacao`,`dataNascimento`,`escolaridade`,`flAlturaCerta`,`flBebeAlcool`,`flBebeAlcoolCerto`,`flBebeCafe`,`flBebeCafeCerto`,`flDataNascimentoCerta`,`flEscolaridadeCerta`,`flFuma`,`flFumaCerto`,`flGeneroCerto`,`flIMCCerto`,`flNomeCerto`,`flOcupacaoCerta`,`flPesoCerto`,`flPressaoDiastolicaCerta`,`flPressaoSistolicaCerta`,`flTemperaturaCerta`,`genero`,`IMC`,`medicosQueAtendem`,`moradiaFamilia`,`nome`,`ocupacao`,`peso`,`pressaoDiastolica`,`pressaoSistolica`,`temperatura`,`planoDeSaude`,`numeroTentativa`,`fkConsulta`,`flCorreto`,`comentario`,`comentarioAluno`,`nota`,`historiaAlcoolAnterior`,`historiaAlcoolAtual`,`historiaCafeAnterior`,`historiaCafeAtual`,`historiaTabacoAnterior`,`historiaTabacoAtual`,`tipoBebidaAlcoolica`,`conclusao`,`experienciaMedicamentos1`,`experienciaMedicamentos2`,`experienciaMedicamentos3`,`experienciaMedicamentos4`,`experienciaMedicamentos5`,`historiaMedicaPregressa`,`historiafamiliar`,`necessidadeAtencao1`,`necessidadeAtencao2`,`necessidadeAtencao3`,`necessidadeAtencao4`,`necessidadeAtencao5`,`outroExpMed1Txt`,`outroExpMed2Txt`,`outroExpMed3Txt`,`outroExpMed4Txt`,`outroExpMed5Txt`,`outroExpMedConcTxt`,`outroRazaoEncontroTxt`,`razaoEncontro`,`anotacoesExtras`) VALUES 
 (1,'Alergia a camarão, azeitona, salsicha e inseticida',1.45,'2012-09-24','1954-06-20','superior incompleto','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','F','F','V','V','V','V','F',28.09,'Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com irmão','M.A.S.A.','Aposentada',59,81,144,256,'Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil e farmácias comunitárias',1,1,'V',NULL,'Muito bem!',10,'',NULL,'','2-6 xícaras/dia','',NULL,NULL,'Intervenções educativas sobre a farmacoterapia e sobre a doença','Deseja melhorar/ controlar a(s) doença(s) e reduzir a quantidade de medicamentos que ingere','Paciente preocupa-se com a quantidade excessiva de medicamentos que ingere','Paciente diz que entende a farmacoterapia','Participa do grupo de canto da pastoral na igreja','Paciente relata aderir ao tratamento','Paciente foi hospitalizada por 11 dias devido a crises de HAS e Diabetes','Não relatou','V','V','V','V','V','','','','','','','','Paciente sente medo de usar vários medicamentos',NULL),
 (2,'Alergia a camarão, azeitona, salsicha e inseticida',1.45,'2012-09-26','1954-06-20','superior incompleto','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','F','F','V','V','V','V','F',28.1,'Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com um irmão','M.A.S.A.','Aposentada',59,81,144,256,'Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil e farmácias comunitárias. ',1,2,'V',NULL,'Muito bem!',10,'',NULL,'','2-6 xícaras/dia','',NULL,NULL,'Intervenções educativas sobre a farmacoterapia e sobre a doença',NULL,'Paciente preocupa-se com a quantidade excessiva de medicamentos que ingere','Paciente diz que entende a farmacoterapia','Participa do grupo de canto da pastoral na igreja','Paciente relata aderir ao tratamento','Paciente foi hospitalizada por 11 dias devido a crises de HAS e Diabetes','Não relatou','V','V','V','F','V','Deseja \"ficar boa\"','','','','','','','Paciente sente medo de usar vários medicamentos',NULL),
 (3,'Alergia a camarão, azeitona, salsicha e inseticida',1.45,'2012-09-26','1954-06-20','superior incompleto','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','F','F','V','V','V','V','F',28.1,'Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com um irmão','M.A.S.A.','Aposentada',59,81,144,256,'Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil e farmácias comunitárias. ',1,3,'F',NULL,'xxxxxxxxxxxxxxxxx',10,'',NULL,'','2-6 xícaras/dia','',NULL,NULL,'Intervenções educativas sobre a farmacoterapia e sobre a doença',NULL,'Paciente preocupa-se com a quantidade excessiva de medicamentos que ingere','Paciente diz que entende a farmacoterapia','Participa do grupo de canto da pastoral na igreja','Paciente relata aderir ao tratamento','Paciente foi hospitalizada por 11 dias devido a crises de HAS e Diabetes','Não relatou','V','V','V','F','V','\"Ficar boa\"','','','','','','','Paciente sente medo de usar vários medicamentos',NULL),
 (4,'Alergia a camarão, azeitona, salsicha e inseticida',1.45,'2012-09-26','1954-06-20','superior incompleto','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','F','F','V','V','V','V','F',28.1,'Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com um irmão','M.A.S.A.','Aposentada',59,81,144,256,'Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil e farmácias comunitárias. ',2,3,'V',NULL,'xxxxxxxxxxxxx',10,'',NULL,'','2-6 xícaras/dia','',NULL,NULL,'Intervenções educativas sobre a farmacoterapia e sobre a doença','Deseja melhorar/ controlar a(s) doença(s)','Paciente preocupa-se com a quantidade excessiva de medicamentos que ingere','Paciente diz que entende a farmacoterapia','Participa do grupo de canto da pastoral na igreja','Paciente relata aderir ao tratamento','Paciente foi hospitalizada por 11 dias devido a crises de HAS e Diabetes','Não relatou','V','V','V','F','V','','','','','','','','Paciente sente medo de usar vários medicamentos',NULL),
 (5,'Alergia a camarão, azeitona, salsicha e inseticida',1.45,'2012-09-26','1954-06-20','superior incompleto','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','F','F','V','V','V','V','F',28.1,'Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com um irmão','M.A.S.A.','Aposentada',59,81,144,256,'Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil e farmácias comunitárias. ',1,4,'V',NULL,'Muito bem!',10,'',NULL,'','2-6 xícaras/dia','',NULL,NULL,'Intervenções educativas sobre a farmacoterapia e sobre a doença',NULL,'Paciente preocupa-se com a quantidade excessiva de medicamentos que ingere','Paciente diz que entende a farmacoterapia','Participa do grupo de canto da pastoral na igreja','Paciente relata aderir ao tratamento','Paciente foi hospitalizada por 11 dias devido a crises de HAS e Diabetes','Não relatou','V','V','V','F','V','\"Ficar boa\"','','','','','','','Paciente sente medo de usar vários medicamentos',NULL),
 (6,'Alergia a camarão, azeitona, salsicha e inseticida',1.45,'2012-09-28','1954-06-20','superior incompleto','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','F','F','V','V','V','V','F',28.1,'Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com um irmão','M.A.S.A.','Aposentada',59,81,144,256,'Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos na Farmácia Popular do Brasil e farmácias comunitárias. ',1,5,'V',NULL,'',2.5,'',NULL,'','2-6 xícaras/dia','',NULL,NULL,'Intervenções educativas sobre a farmacoterapia e sobre a doença','Deseja melhorar/ controlar a(s) doença(s)','Paciente preocupa-se com a quantidade excessiva de medicamentos que ingere','Paciente diz que entende a farmacoterapia','Participa do grupo de canto da pastoral na igreja','Paciente relata aderir ao tratamento','Paciente foi hospitalizada por 11 dias devido a crises de HAS e Diabetes','Não relatou','V','V','V','V','V','','','','','','','','Paciente sente medo de usar vários medicamentos',NULL),
 (7,'Nunca apresentou alergia',1.56,'2012-10-03','1947-07-10','superior incompleto','V','V',NULL,'V',NULL,'V','V','F',NULL,'V','F','V','F','V','V','V','V','M',25.3,'Dra. S. (Clínico Geral) e Dr. P. (Cardiologista).','Mora com a esposa','M.A.O.','Aposentado pela Fundação Nacional de Saúde',61.5,80,136,126,'Plano Capes Saúde. Adquire os medicamentos na Farmácia Popular do Brasil e farmácias comunitárias.',1,6,'F',NULL,'Prezado Grupo SemPRM, vocês necessitam refazer o 1º atendimento, os seguintes dados necessitam ser revistos:\r\n1. Descrever o comportamento do paciente relacionado à farmacoterapia (vocês responderam = Paciente relata aderir ao tratamento) \r\n2. Conclusão: O que deve ser incorporado ao plano? (vocês responderam = As experiências subjetivas do paciente parecem não interferir na farmacoterapia. Reavaliar ao longo dos atendimentos). Nesse caso, notem que o paciente questiona os efeitos dos medicamentos.\r\nVocês tem até sexta 05/10, às 18h para enviarem a resposta à segunda tentativa, valendo 2,0 pontos.',0,'','2-6 copos/semana','','2-6 xícaras/dia','',NULL,'cerveja','As experiências subjetivas do paciente parecem não interferir na farmacoterapia. Reavaliar ao longo dos atendimentos','Deseja melhorar/ controlar a(s) doença(s)',NULL,'Não relatou','Não relatou','Paciente relata aderir ao tratamento','Paciente foi hospitalizado três vezes por crise de refluxo','Pais e irmãos - portadores de Hipertensão Arterial Sistêmica','V','V','V','F','V','',' Paciente questiona os efeitos dos medicamentos','','','','','','Paciente questiona os efeitos dos medicamentos',NULL),
 (8,'Alergia a antibióticos',1.51,'2012-10-03','1935-03-19','medio completo','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','V','V','V','V','V','V','M',23.4,'Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','Mora com uma Filha','J.J.','Aposentado',53.3,80,140,128,'Plano de Saúde: GEAP. Adquire os medicamentos na Farmácia Popular do Brasil e farmácias comunitárias',1,7,'V',NULL,'Prezado Grupo Atencêuticos,  vocês foram muito bem nesse primeiro atendimento! Vocês irão observar que o gabarito do caso que vocês escolheram apresenta  diferenças em algumas resposta (Preocupações do paciente com o medicamento, Comportamento do paciente relacionado a farmacoterapia, Conclusão do que deve ser incorporado ao plano; Quantidade de café consumido, Hipertensão cadastrado duas vezes), no entanto, a resposta de vocês foi considerada correta e adicionada como gabarito oficial desse PV! Na próxima quarta aguardo vocês para realizarmos a classificação dos PRM do PV J.F.C. \r\nParabéns!!!\r\n\r\nAtt.\r\n\r\nGiselle Brito ( Farmacêutica tutora)\r\n',2.5,'',NULL,'','2-6 xícaras/dia','',NULL,NULL,'Intervenções educativas sobre a farmacoterapia e sobre a doença','Deseja melhorar/ controlar a(s) doença(s)','Paciente tem medo das reações adversas dos medicamentos','Não relatou','Não relatou','Paciente relata aderir ao tratamento','Não relatou','Mãe e irmãos - portadores de Hipertensão Arterial Sistêmica','V','V','V','F','V','','','','','','','','Paciente não tolera o efeito colateral dos medicamentos',NULL),
 (9,'Alergia à penicilina',1.72,'2012-10-03','1946-05-17','fundamental completo','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','V','V','V','V','V','V','M',23.99,'Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','Mora com a esposa e um filho','J.F.C.','Aposentado',71,88,144,190,'Tem acesso ao sistema de saúde pelo SUS. Adquire seus medicamentos no posto da saúde e em farmácias comerciais.',1,8,'V',NULL,'Prezado Grupo Farmacuida, vocês foram muito bem nesse primeiro atendimento! O gabarito do caso que vocês escolheram apresenta diferenças em algumas resposta (comportamento, história médica pregressa, tabaco e revisão de sistemas), no entanto, a resposta de vocês foi considerada correta e adicionada como gabarito oficial desse pv, a partir de agora! Na próxima quarta aguardo vocês para realizarmos a classificação dos PRM do PV J.F.C. Parabéns!!!',2.5,'',NULL,'','2-6 xícaras/dia','1 ano',NULL,NULL,'Intervenções educativas sobre a farmacoterapia e sobre a doença','Não relatou',NULL,NULL,NULL,'Paciente relata aderir ao tratamento','Realizou três pontes de safena há 10 anos.','Pai ? portador de Diabetes Mellitus e Hipertensão Arterial Sistêmica','V','V','V','V','V','','Questiona a necessidade de usar os medicamentos todos os dias.','Segundo o paciente, tem uma tabela com os horários dos medicamentos, mas não compreende o porque de tomá-los todos os dias.','Seu pai sofria de Hipertensão Arterial Sistêmica e de Diabetes Mellitus.','','','','Paciente questiona a necessidade de usar medicamentos',NULL),
 (10,'Nunca apresentou alergia',1.6,'2012-10-03','1941-09-23','fundamental incompleto','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','V','F','V','V','V','V','F',29.51,'Clínico Geral e  Endocrinologista','Duas moradias: com o esposo em uma cidade do interior e com o neto na capital.','G.G.','Aposentada',75.55,70,130,276,'GEAP e SUS, adquire na Farmácia Popular',1,9,'V',NULL,'Prezado Grupo Cipolle, vocês foram muito bem nesse primeiro atendimento! O gabarito do caso que vocês escolheram apresenta diferenças em algumas respostas (razão do encontro, deseja/espera, grau de entendimento, conclusão: o que deve ser incorporado ao plano e revisão dos sistemas), no entanto, a resposta de vocês foi considerada correta e adicionada também como gabarito oficial desse pv! Na próxima quarta aguardo vocês para realizarmos a classificação dos PRM da PV G.G. Parabéns!!!',2.5,'',NULL,'','2-6 xícaras/dia','',NULL,NULL,NULL,NULL,'Não relatou',NULL,'É evangélica e acredita que Jesus vai curá-la de tudo','Não relatou','Possui cinco filhos, quatro de parto normal e um cesário','Mãe ? portadora de Diabetes Mellitus. Pai ? portador de Hipertensão Arterial Sistêmica','V','V','V','V','V','Cuidar mais da saúde','','paciente desconhece para que servem os medicamentos','','','Intervenções educativas sobre atividade física e alimentação','deseja cuidar mais da saúde e que a glicemia seja controlada',NULL,NULL),
 (11,'Não relatou',1.56,'2012-10-03','1949-09-08','superior incompleto','V','V',NULL,'V',NULL,'V','V','F',NULL,'V','F','V','F','V','V','V','V','M',23.95,' Dra. S. (Clínico Geral) e Dr. P. (Endocrinologista)','mora com três filhos','J.R.','aposentado',58.2,72,126,128,'Usuário do SUS, adquire os medicamentos na Unidade Básica de Saúde, na Farmácia Popular do Brasil e em farmácias de manipulação',1,10,'V',NULL,'Parabéns ao grupo. Só esqueceram de um pequeno detalhe que deve ser incorporado ao plano de cuidados: intervenções educativas sobre a doença e não apenas sobre a efetividade e segurança da farmacoterapia. Lembrem-se que a filosofia da Atenção farmacêutica é olhar o PACIENTE como um todo. Até a próxima consulta!',2.4,'','< 2 copos/semana','','2-6 xícaras/dia','',NULL,'cerveja',NULL,NULL,'Paciente tem medo das reações adversas dos medicamentos','Não relatou',NULL,'Paciente não adere ao tratamento','Não relatou','Pais e irmãos - portadores de Hipertensão Arterial Sistêmica','V','V','V','F','V','espera não se sentir mal ao tomar o medicamento','','','os pais e irmãos são hipertensos','','Investigar sobre a efetividade e segurança da farmacoterapia','','Paciente não tolera o efeito colateral dos medicamentos',NULL),
 (12,'Nunca apresentou alergia',1.64,'2012-10-03','1945-01-03','fundamental completo','V','F',NULL,'V',NULL,'V','V','V',NULL,'V','F','V','V','V','V','V','V','M',23,'Dra. S (Clínico geral). e Dr. P. (Endocrinologista)','mora com esposa e um dos filhos','F.B.O.','Aposentado',62,80,130,220,'Plano de saúde da Petrobrás',1,11,'V',NULL,'Prezado Grupo PharmaCareUFS, vocês foram muito bem nesse primeiro atendimento! Vocês irão observar que o gabarito do caso que vocês escolheram apresenta  diferenças em algumas resposta (Comportamento do paciente relacionado a farmacoterapia; Revisão dos sistemas), no entanto, a resposta de vocês foi considerada correta e adicionada como gabarito oficial desse PV! Na próxima quarta aguardo vocês para realizarmos a classificação dos PRM do PV F.B.O. \r\nParabéns!!!\r\n\r\nAtt.\r\n\r\nGiselle Brito ( Farmacêutica tutora)\r\n',2.5,'há dois anos',NULL,'','2-6 xícaras/dia','','10-20 cigarros por dia',NULL,'Intervenções educativas sobre a farmacoterapia e sobre a doença','Deseja melhorar/ controlar a(s) doença(s) e compreender a farmacoterapia','Paciente não apresenta nenhuma preocupação relacionada à farmacoterapia','Paciente diz que não entende a farmacoterapia','Paciente acredita em Deus, mas não é adepto a nenhuma religião','Paciente relata aderir ao tratamento','Não relatou','Pai, irmão e avô - portador de Diabetes Mellitus','V','V','V','F','V','','','','','','','','Paciente deseja entender a farmacoterapia',NULL),
 (13,'Alergia ao medicamento Profenid®, morfo e poeira',1.49,'2012-10-03','1943-05-12','superior completo','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','V','V','V','V','V','V','F',26.3,'Clínico geral (L.C), cardiologista (L.A.S.)','Mora com uma filha, duas netas e uma bisneta','E.V.','aposentada',58.4,75,135,310,'Não relata possuir plano de saúde e adquire os medicamentos na farmácia popular e no posto de saúde.',1,12,'V',NULL,'As respostas estão corretas. Gostaria de parabenizar a equipe pelo levantamento minuncioso que foi feito.',2.5,'Há 15 anos ',NULL,'','2-6 xícaras/dia','',NULL,NULL,NULL,'Deseja melhorar/ controlar a(s) doença(s) e reduzir a quantidade de medicamentos que ingere','Paciente tem medo das reações adversas dos medicamentos','Paciente diz que entende a farmacoterapia, mas não entende a doença',NULL,'Paciente não adere ao tratamento','Crise de hiperglicemia','Mãe ? portadora de Diabetes Mellitus. Pai ? portador de Hipertensão Arterial Sistêmica','V','V','V','F','V','','','','É evangélica','','Intervenções educativas sobre a farmacoterapia, doença, atividade física e alimentação','Espera reduzir o número de medicamentos que toma e reduzir a glicemia.',NULL,NULL),
 (14,'Não relatou',1.63,'2012-10-03','1946-08-29','medio completo','V','F',NULL,'V',NULL,'V','V','F',NULL,'V','F','F','F','V','V','V','V','F',37.41,'Endocrinologista (V.C.) e Cardiologista (J.B.R.) ','marido','E.B.R.','Dona de casa',99.4,70,120,252,'Petrobrás',1,13,'F',NULL,'',0,'parou há cinco anos',NULL,'','< 2 xícaras/dia','parou há 20 anos',NULL,NULL,'?	Estimular a adesão ao tratamento com intervenções educativas','Deseja melhorar/ controlar a(s) doença(s)','Paciente não acredita nos efeitos dos medicamentos','Paciente diz que não entende a farmacoterapia','Não relatou','Paciente não adere ao tratamento','Não relatou','Pai e mãe - portadores de Diabetes Mellitus','V','V','V','F','V','','','','','','','','Paciente sente medo de usar vários medicamentos',NULL),
 (15,'Nunca apresentou alergia',1.56,'2012-10-04','1947-07-10','superior incompleto','V','V',NULL,'V',NULL,'V','V','F',NULL,'V','F','V','F','V','V','V','V','M',25.3,'Dra. S. (Clínico Geral) e Dr. P. (Cardiologista)','mora com a esposa','M.A.O.','aposentado pela Fundação Nacional de Saúde',61.5,80,136,126,'Plano Capes Saúde Adquire os medicamentos na Farmácia Popular do Brasil e farmácias comunitárias.',2,6,'V',NULL,'Prezado Grupo SemPRM, vocês foram muito bem nessa 2ª tentativa do primeiro atendimento e vamos evoluir o nosso caso clínico! \r\nO gabarito do caso que vocês escolheram apresenta diferença na seguinte resposta: \"Conclusão: O que deve ser incorporado ao plano?\" (vocês responderam = Estimular a adesão ao tratamento com intervenções educativas). A resposta foi considerada correta, afinal é sempre importante estimular a adesão. No entanto, notem que o paciente em nenhum momento relata não aderir ao tratamento e a resposta do gabarito caberia melhor como conclusão nesse primeiro momento.\r\nNa próxima quarta aguardo vocês para realizarmos a classificação dos PRM do PV M.A.O. Parabéns!!!',2,'','2-6 copos/semana','','2-6 xícaras/dia','',NULL,'cerveja',NULL,'Deseja melhorar/ controlar a(s) doença(s)',NULL,'Não relatou','Não relatou','Não relatou','Paciente foi hospitalizado três vezes por crise de refluxo','Pais e irmãos - portadores de Hipertensão Arterial Sistêmica','V','V','V','F','V','','O paciente questiona os efeitos dos medicamentos','','','','Estimular a adesão ao tratamento com intervenções educativas','','Paciente questiona os efeitos dos medicamentos',NULL),
 (16,'Não relatou',1.63,'2012-10-05','1946-08-29','medio incompleto','V','F',NULL,'V',NULL,'V','F','F',NULL,'V','F','F','F','V','V','V','V','F',37.4,'Endocrinologista (V.C.), Cardiologista (J.B.R.) ','marido','E.B.R.','dona de casa ',99.4,70,120,252,'Petrobrás Adquire os medicamentos na Farmácia Popular do Brasil, farmácias comunitárias e no CASE',2,13,'V',NULL,'Prezado Grupo Farmavida, vocês foram muito bem nessa 2ª tentativa do primeiro atendimento! O gabarito do caso que vocês escolheram apresenta diferenças em algumas respostas: escolaridade e revisão dos sistemas. Quanto à escolaridade, não irei considerar como erro, visto que responderam de forma correta a esse item na primeira tentativa. Com relação à Revisão de Sistemas, a resposta de vocês foi considerada correta e adicionada como gabarito oficial desse pv! Na próxima quarta aguardo vocês para realizarmos a classificação dos PRM da PV E.B.R. Parabéns!!!',2,'parou há cinco anos',NULL,'','< 2 xícaras/dia','parou há 20 anos',NULL,NULL,'?	Estimular a adesão ao tratamento com intervenções educativas','Não relatou','Paciente não acredita nos efeitos dos medicamentos','Não relatou','Não relatou','Paciente não adere ao tratamento','Não relatou','Pai e mãe - portadores de Diabetes Mellitus','V','V','V','F','V','','','','','','','','Paciente se sente confusa com os horários dos medicamentos',NULL),
 (17,'Não relatou',25,'2012-10-17','2206-02-22','fundamental completo','F','F',NULL,'V',NULL,'F','F','V',NULL,'V','F','F','F','F','F','F','F','M',26.3,'XXX','XXXX','XXXXXX','XXXXXXX',25,25,25,25,'XXXXX',1,14,'V',NULL,'',0,'',NULL,'','','','',NULL,'?	Estimular a adesão ao tratamento com intervenções educativas','Não relatou','Não relatou','Não relatou','Não relatou','Não relatou','Não relatou','Não relatou','V','V','V','V','V','','','','','','','','Paciente acredita que adicionar medicamento significa fracasso',NULL),
 (18,'Não relatou',55,'2012-10-18','2012-02-25','fundamental incompleto','F','F',NULL,'F',NULL,'F','F','F',NULL,'F','F','F','F','F','F','F','F','M',15,'XXX','XXX','XXXX','XXX',5,55,55,55,'XXX',1,15,'V',NULL,'',0,'',NULL,'',NULL,'',NULL,NULL,'?	Estimular a adesão ao tratamento com intervenções educativas','Não relatou','Não relatou','Não relatou','Não relatou','Não relatou','Não relatou','Não relatou','F','F','F','F','','','','','','','','','Paciente sente medo de usar vários medicamentos',NULL);
/*!40000 ALTER TABLE `respostaprimeira` ENABLE KEYS */;


--
-- Definition of table `respostaquarta`
--

DROP TABLE IF EXISTS `respostaquarta`;
CREATE TABLE `respostaquarta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataRealizacao` date DEFAULT NULL,
  `fkConsulta` int(11) NOT NULL,
  `numeroTentativa` int(11) NOT NULL DEFAULT '0',
  `flCorreto` varchar(1) DEFAULT NULL,
  `comentario` text,
  `comentarioAluno` text,
  `nota` float DEFAULT NULL,
  `carta` tinytext,
  `alternativaRefMed1` longtext,
  `alternativaRefMed2` longtext,
  `farmacCrf` varchar(255) DEFAULT NULL,
  `farmacNome` varchar(255) DEFAULT NULL,
  `farmacTel` varchar(255) DEFAULT NULL,
  `motivosRefMedica` longtext,
  `nomeDr` varchar(255) DEFAULT NULL,
  `referencias` longtext,
  `telefone` varchar(255) DEFAULT NULL,
  `anotacoesExtras` longtext,
  PRIMARY KEY (`id`),
  KEY `FKB29DB8E35097F805` (`fkConsulta`),
  CONSTRAINT `FKB29DB8E35097F805` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`),
  CONSTRAINT `FK_respostaquarta_1` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `respostaquarta`
--

/*!40000 ALTER TABLE `respostaquarta` DISABLE KEYS */;
INSERT INTO `respostaquarta` (`id`,`dataRealizacao`,`fkConsulta`,`numeroTentativa`,`flCorreto`,`comentario`,`comentarioAluno`,`nota`,`carta`,`alternativaRefMed1`,`alternativaRefMed2`,`farmacCrf`,`farmacNome`,`farmacTel`,`motivosRefMedica`,`nomeDr`,`referencias`,`telefone`,`anotacoesExtras`) VALUES 
 (1,'2012-09-24',1,0,'V',NULL,'Muito bem!',10,NULL,'Tal e tal...','','','','','Tal e tal...','Drª. S.','Tal e tal...','xxxxxxxxx',NULL),
 (2,'2012-09-26',2,0,'V',NULL,'ok',10,NULL,'1.	Correlacionar com exames clínicos e laboratoriais e avaliar o risco-benefício de substituir o Captopril por outro anti-hipertensivo da sua escolha, desde que apresenta bons índices na avaliação risco/benefício e menor probabilidade de ocorrência das referida reação adversa, segundo as VI Diretrizes Brasileiras de Hipertensão, 2010.','','101010','turma1teste','xxxxxxx','A Srª. M.A.S.A. é portadora Hipertensão Arterial Sistêmica e Diabetes Mellitus tipo II há 13 anos. Durante a avaliação inicial no serviço de Atenção Farmacêutica foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados: a paciente relata que apresenta tosse seca quando utiliza o Captopril e isso a incomoda muito. \r\nA presença de reação adversa ao medicamento Captopril foi analisada por meio da base de dados Lexi-comp (referência oficial da Associação Americana de Farmacêuticos), a qual apontou presença de tosse seca em 0,5 a 2% dos casos durante o uso deste medicamento.\r\n\r\nObs: Segue em anexo o diário pessoal dos medicamentos utilizados pelo paciente.\r\n','Dr. S.','Charles F. Lacy, Lora L. Armstrong, Morton P. Goldman, Leonard L. Lance. Medicamentos Lexi-comp Manole. Editora Manole, 2009.\r\nSociedade Brasileira de Hipertensão. VI Diretrizes Brasileiras de Hipertensão, 2010.Disponível em: http://www.sbh.org.br/index.asp Acesso em: 21/09/2012.\r\n','xxxxxxxx',NULL),
 (3,'2012-09-26',3,0,'V',NULL,'ok',10,NULL,'1.	Correlacionar com exames clínicos e laboratoriais e avaliar o risco-benefício de substituir o Captopril por outro anti-hipertensivo da sua escolha, desde que apresenta bons índices na avaliação risco/benefício e menor probabilidade de ocorrência da referida reação adversa, segundo as VI Diretrizes Brasileiras de Hipertensão, 2010.','','xxxx','xxxxx','xxxxxxx','A Srª. M.A.S.A. é portadora de Hipertensão Arterial Sistêmica e Diabetes Mellitus tipo II há 13 anos. Durante a avaliação inicial no serviço de Atenção Farmacêutica foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados: a paciente relata que apresenta tosse seca quando utiliza o Captopril e isso a incomoda muito.\r\n \r\nA presença de reação adversa ao medicamento Captopril foi analisada por meio da base de dados Lexi-comp (referência oficial da Associação Americana de Farmacêuticos), a qual apontou presença de tosse seca em 0,5 a 2% dos casos durante o uso deste medicamento.\r\nObs: Segue em anexo o diário pessoal dos medicamentos utilizados pelo paciente.\r\n','Dr. S.','Charles F. Lacy, Lora L. Armstrong, Morton P. Goldman, Leonard L. Lance. Medicamentos Lexi-comp Manole. Editora Manole, 2009.\r\n\r\nSociedade Brasileira de Hipertensão. VI Diretrizes Brasileiras de Hipertensão, 2010.Disponível em: http://www.sbh.org.br/index.asp Acesso em: 21/09/2012.\r\n','xxxxxxxx',NULL),
 (4,'2012-09-26',4,0,'V',NULL,'ok',10,NULL,'1.	Correlacionar com exames clínicos e laboratoriais e avaliar o risco-benefício de substituir o Captopril por outro anti-hipertensivo da sua escolha, desde que apresenta bons índices na avaliação risco/benefício e menor probabilidade de ocorrência das referida reação adversa, segundo as VI Diretrizes Brasileiras de Hipertensão, 2010.','','0000','Vanessa','xxxxxxx','A Srª. M.A.S.A. é portadora Hipertensão Arterial Sistêmica e Diabetes Mellitus tipo II há 13 anos. Durante a avaliação inicial no serviço de Atenção Farmacêutica foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados: a paciente relata que apresenta tosse seca quando utiliza o Captopril e isso a incomoda muito. \r\n\r\nA presença de reação adversa ao medicamento  Captopril foi analisada por meio da base de dados Lexi-comp (referência oficial da Associação Americana de Farmacêuticos), a qual apontou presença de tosse seca em 0,5 a 2% dos casos durante o uso deste medicamento.\r\n\r\nObs: Segue em anexo o diário pessoal dos medicamentos utilizados pelo paciente.\r\n','Dr. S.','Charles F. Lacy, Lora L. Armstrong, Morton P. Goldman, Leonard L. Lance. Medicamentos Lexi-comp Manole. Editora Manole, 2009.\r\n\r\nSociedade Brasileira de Hipertensão. VI Diretrizes Brasileiras de Hipertensão, 2010.Disponível em: http://www.sbh.org.br/index.asp Acesso em: 21/09/2012.\r\n','xxxxxxxx',NULL),
 (5,'2012-09-28',5,0,'V',NULL,'',2.5,NULL,'xxxxxxxxxxx','xxxxxxxxxxx','xxxx','xxxxx','xxxxxxx','xxxxxxxxxx','','xxxxxxxxxxxxxxx','xxxxxxxx',NULL),
 (6,'2012-10-18',14,0,'F',NULL,'',0,NULL,'SDVGBNM SD.ÇLQOPI8Y6783QPD,MAJKb]fdfcbv3v5zdmlcj ;zs.c~zç,&#8354;ncn aclasd  lççzdcn . ,z,çz\r\nd, xclzxcm,  zbn jk11332\r\nZ3ZDM LC,A~;,CÇZ\r\nAZ CLZ D CN ÇZÇ~.CDV ,KJXKLCF,NBKXDMKNXÇZ.Ç]\r\n\r\nASDFGHJK,DAÇLDAMKCM., ZMXMLCLÇZ\\XC\r\n\r\nCV,.ZXÇC M,ZN D 25czv53z5cv45b 4xd12f56vx\r\n6n ncvbnnnmmcvbcm,,lçzad2514xb56b14x\r\nxv;,cv,','zfs,mjfklm,lcv45bf46fbg903ujklfnmkdf514bdnmks\r\nm,cfalncn lzkcA\r\n\r\n v z\r\nvs]b\r\n\r\nb x\r\nb\r\n\r\nn\r\ndn casjkldm         kdfnakljçlmkd\r\nvmlvaskmvgdv','5564654/464556456dgfdf','asdfmnjfcakls','003145696v z6cv 5-256','o PACIENTE TAL ESTÁ ) / : 266459ERFTASD@~KJMLKNKLN\r\nSDFGHJKLÇ~]DFGHJKLÇ~]DFGHJKLÇÃFAÇFAL~DFKLÃKLD~L~CMK;ÇZMC~Ç\\MKXD~KA~DK;,X~\\,X~ÇM\\CM\r\nASMDXÇA\\KXD,l]~dlkcv/a;.da\\jkxcçpjkmd s,cl\\mxd,~KCA\\,]S.;]~ZKXÇNHJPOAÇ\r\nLKSDÇXJMKXCÇP\\JOKLNXS .;,\\m zxçl\\j~l,a~SDLNJCCLÇMK/]Ç\\A.çs~.ç\r\nM,XCLM,/ÇA[]\r\nCD;A\\~JIKXNHJKLC,,S]ÃDX\r\nA]C;~ZCV,ZLÇCLOJDÃ~ÇD.]\\~\r\n\r\nC534\r\n6C12143X4V1Z14','dR. S.','sdfdfajcalçmkv~ça]c,m vscflça a,slf5b 56b45sdfvml a.scf\r\n\r\nm clojalc alsxbcv za\r\n\r\nv ~, cv ma,c fabj7890-=.Ç.Ç,VM,]A]','XXXXXXX',NULL),
 (7,'2012-10-24',6,0,'V',NULL,'Prezado Grupo SEMPRM, chegamos ao final dos atendimentos do nosso PV. Vocês foram muito bem na elaboração da carta de referência ao médico. Parabéns! Saber comunicar-se com outros profissionais de saúde é de suma importância na obtenção de resultados positivos com a prática da AtenFar! Próxima quarta nos veremos às 15h para a entrega dos resultados! Até lá!',2.5,NULL,'Correlacionar com exames clínicos e laboratoriais e avaliar o risco-benefício de substituir o Anlodipino por outro anti-hipertensivo da sua escolha, desde que apresente bons índices na avaliação risco/benefício e menor probabilidade de ocorrência da referida reação adversa, segundo as VI Diretrizes Brasileiras de Hipertensão, 2010.','','Fictício','Semprm','XXXX-XXXX','O Sr. M.A.O é portador de Hipertensão Arterial Sistêmica (HAS) e Hiperlipidemia há 2 anos. Durante a avaliação inicial no serviço de Atenção Farmacêutica foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados: O paciente relata que apresenta edema periférico há um mês desde que iniciou o tratamento com o medicamento Anlodipino.\r\n\r\nA presença de reação adversa ao medicamento Anlodipino foi analisado por meio da base de dados Lexi-Comp (referência oficial da Associação Americana de Farmacêuticos), a qual apontou a presença de edema periférico em 2 a 15% dos casos durante o uso deste medicamento.\r\n\r\nObs: Segue em anexo o diário pessoal de medicamentos utilizados pelo paciente.\r\n\r\n','P.','Charles F. Lacy, Lora L. Armstrong, Morton P. Goldman, Leonard L. Lance. Medicamentos Lexi-comp Manole. Editora Manole, 2011-2012.\r\n\r\nSociedade Brasileira de Hipertensão. VI Diretrizes Brasileiras de Hipertensão, 2010. Disponível em: http://www.sbh.org.br/index.asp Acesso em 24/10/2012.','XXXX-XXXX',NULL),
 (8,'2012-10-24',8,0,'V',NULL,'Prezado Grupo FARMACUIDA, chegamos ao final dos atendimentos do nosso PV. Vocês foram muito bem na elaboração da carta de referência ao médico. Parabéns! Saber comunicar-se com outros profissionais de saúde é de suma importância na obtenção de resultados positivos com a prática da AtenFar! Próxima quarta nos veremos às 15h para a entrega dos resultados! Até lá!',2.5,NULL,'\r\nNo tocante ao LDL-C, as estatinas são os medicamentos eleitos(Diretrizes da Sociedade Brasileira de Diabetes,2009)e segundo a IV Diretriz Brasileira Sobre Dislipidemias e Prevenção da Aterosclerose, as estatinas reduzem a mortalidade cardiovascular e a incidência de eventos isquêmicos coronários agudos, necessidade de revascularização do miocárdio, AVC (grau de recomendação I e nível de evidência A).','','1012','Farmacuida','XXXXX','O Senhor J.F.C. é portador de Hipertensão Arterial Sistêmica e Diabetes Mellitus tipo II há 10 anos e Hiperlipidemia. Durante a avaliação inicial no Serviço de Atenção Farmacêutica, foi considerado relevante para o acompanhamento farmacoterapêutico o seguinte dado: o paciente relatou ter Hiperlipidemia o que foi confirmado por exames laboratoriais e  até o momento não faz uso de medicamento para o controle do mesmo.\r\nSegundo a IV Diretriz Brasileira Sobre Dislipidemias e Prevenção da Aterosclerose,nos indivíduos com hiperlipidemia com alto risco cardiovascular as medidas não-farmacológicas e o tratamento com hipolipemiantes devem ser iniciados simultaneamente.\r\n\r\nOBS: Segue em anexo o diário dos medicamentos utilizados pelo paciente.\r\n','S.','Sociedade Brasileira de Cardiologia. IV Diretriz Brasileira Sobre Dislipidemias e Prevenção da Aterosclerose, 2007. Disponível em: http://publicacoes.cardiol.br/consenso/2007/diretriz-DA.pdf Acesso em: 24/10/2012.\r\n\r\nSociedade Brasileira de Diabetes. Diretrizes da Sociedade Brasileira de Diabetes, 2009.Disponível em: http://www.diabetes.org.br/attachments/diretrizes09_final.pdf Acesso em: 24/10/2012.','XXXXXXX',NULL),
 (9,'2012-10-24',7,0,'V',NULL,'Prezado Grupo Atencêuticos\r\n\r\nChegamos à reta final do nosso PV J.J. Diante das intervenções elaboradas imagino que o paciente de Vocês deve estar satisfeito com o cuidado prestado. Quanto à proposta da carta ao médico pude observar que as informações colocadas foram precisas e selecionadas de forma coerente a situação clínica do paciente.  As referências que vocês selecionaram fazem parte da realidade da prática clínica do médico, o que irá facilitar a compreensão deste profissional ao que foi sugerido de melhora na farmacoterapia. Além disso, vocês tiveram acesso a referências mais atuais que as apresentadas no nosso gabarito (IV Diretrizes sobre Dislipidemia). A única ressalva observada foi a falta do diário de medicamentos, deste modo, sugiro que vocês quando forem fazer as próximas cartas direcionadas a outros profissionais de saúde  anexem à ela este diário, para apresentar de forma prática ao profissional a farmacoterapia atual do paciente. Mais uma vez parabenizo o desempenho do grupo! Espero que nossas discussões tenham sido tão proveitosas para todos vocês quanto foi para nós Tutores!\r\n\r\nBoa sorte nos Cuidados ao paciente!!!\r\n\r\nAtt.,\r\n\r\nGiselle Brito\r\nFarmacêutica Tutora\r\n',2.4,NULL,'A escolha da classe terapêutica está condicionada ao tipo de dislipidemia presente,sendo as estatinas o tratamento mais recomendado, entretanto início de uma nova farmacoterapia seguirá seu critério de avaliação.','Sugerimos a avaliação do risco-benefício da substituição do medicamento Enalapril por outro anti-hipertensivo de sua escolha, que não apresente índices de ocorrência das referidas reações adversas, segundo VI Diretrizes Brasileiras de Hipertensão, 2010.','5689','Atencêuticos','(79)9806-1808','O senhor J.J. é portador de hiperlipidemia e Hipertensão Arterial Sistêmica (HAS) há 15 anos. Durante a avaliação do serviço de atenção farmacêutica, foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados:\r\n1-	O paciente é portador de hiperlipidemia e não faz uso de medicamento para controle;\r\n2-	O paciente relata que apresenta desconforto gastrointestinal, constipação e garganta seca e diz não tolerar esses efeitos colaterais.\r\n\r\nSegundo à IV Diretriz Brasileira sobre Dislipidemias e Prevenção da Aterosclerose os hipolipemiantes devem ser empregados sempre que não houver efeito satisfatório das medidas não-farmacológicas relacionadas à mudança do estilo de vida ou impossibilidade de aguardar esses efeitos por prioridade clínica.\r\nA presença de reação adversa ao medicamento Enalapril foi analisado por meio da base de dados LexiComp(referência oficial da Associação Americana de Farmacêuticos, a qual apontou presença de: Desconforto gastrointestinal (1-10% dos casos), garganta seca (1-2% dos casos), em pacientes durante uso deste medicamento. \r\n','Dr. José','IV Diretriz Brasileira sobre Dislipidemias e Prevenção da Aterosclerose, Departamento de Aterosclerose da Sociedade Brasileira de Cardiologia, Arquivos Brasileitos de Cardiologia - Volume 88, Suplemento I, Abril 2007, disponível em: http://publicacoes.cardiol.br/consenso/2007/diretriz-DA.pdf. Acessado em: 24/10/2012\r\n\r\nBrasil. Ministério da Saúde. Protocolo Clínico. Dislipidemia em pacientes de alto risco de desenvolver eventos cardiovasculares. Disponível em: http://portal.saude.gov.br/ portal/arquivos/pdf/pcdt_dlp_1015_docx.pdf. Acessado em: 23/10/2012;\r\n\r\nCharles F. Lacy, Lora L. Armstrong, Morton P. Goldman, Leonard L. Lance. Medicamentos Lexi-Comp Manole, 2011-2012.\r\n\r\nSociedade Brasileira de Hipertensão. VI Diretrizes Brasileiras de Hipertensão, 2010. Disponível em: http://www.sbh.org.br/index.asp. Acessado em: 21/09/2012.\r\n','(79) 9563-1478',NULL),
 (10,'2012-10-24',10,0,NULL,NULL,NULL,-1,NULL,'','','','','','','Dra. S.','','xxxxxxx',NULL),
 (11,'2012-10-24',10,0,NULL,NULL,NULL,-1,NULL,'Correlacionar com exames clínicos e laboratoriais e avaliar o risco benefício de substituir a losartana por outro anti-hipertensivo da sua escolha, desde que apresente bons índices na avaliação risco/benefício e menor probabilidade de ocorrência da referida reação adversa, segundo a Sociedade Brasileira de Hipertensão, 2010.\r\n','Favor considerar que no passado o paciente apresentou reação adversa ao Captopril, Hidroclorotiazida e o Propranolol,relatou sentir sensação de desmaio.','123','MAXCEF','xxxxx','O Sr. J. R. é portador de hipertensão arterial sistêmica há 35 anos e Diabetes Mellitus TIPO II desde 2008. Durante a avaliação inicial no serviço de Atenção Farmacêutica foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados: O paciente relata que apresenta crises de hipoglicemia quando utiliza o medicamento Losartana e que ele não tolera esse efeito colateral.\r\nA presença da reação adversa ao medicamento Losartana foi analisada por meio da base de pesquisa medscape, o qual apontou presença de hipoglicemia em 14% dos casos durante o uso deste medicamento. \r\nObs: Segue em anexo o diário pessoal dos medicamentos utilizados pelo paciente.','Dra. S.','','xxxxxxx',NULL),
 (12,'2012-10-24',10,0,NULL,NULL,NULL,-1,NULL,'Correlacionar com exames clínicos e laboratoriais e avaliar o risco benefício de substituir a losartana por outro anti-hipertensivo da sua escolha, desde que apresente bons índices na avaliação risco/benefício e menor probabilidade de ocorrência da referida reação adversa, segundo a Sociedade Brasileira de Hipertensão, 2010.\r\n','Favor considerar que no passado o paciente apresentou reação adversa ao Captopril, Hidroclorotiazida e o Propranolol,relatou sentir sensação de desmaio.','123','MAXCEF','xxxxx','O Sr. J. R. é portador de hipertensão arterial sistêmica há 35 anos e Diabetes Mellitus TIPO II desde 2008. Durante a avaliação inicial no serviço de Atenção Farmacêutica foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados: O paciente relata que apresenta crises de hipoglicemia quando utiliza o medicamento Losartana e que ele não tolera esse efeito colateral.\r\nA presença da reação adversa ao medicamento Losartana foi analisada por meio da base de pesquisa medscape, o qual apontou presença de hipoglicemia em 14% dos casos durante o uso deste medicamento. \r\nObs: Segue em anexo o diário pessoal dos medicamentos utilizados pelo paciente.','Dra. S.','MEDSCAPE. Disponível em: <http://search.medscape.com/news-search?newSearchHeader=1&queryText=losartan>. Acessado em: 24/10/2012.\r\n\r\nSociedade Brasileira de cardiologia. Disponível em:<http://fs.unb.br/bulasdecardiologia/bulas/L/losartanal.html>. Acessado em: 24/10/2012.','xxxxxxx',NULL),
 (13,'2012-10-24',9,0,'V',NULL,'Prezado Grupo Cipolle, chegamos ao final dos atendimentos do nosso PV. Como sempre, voces foram muito bem na elaboração da carta de referência ao médico. Parabéns! Saber comunicar-se com outros profissionais de saúde é de suma importância na obtenção de resultados positivos com a prática da AtenFar! Próxima quarta nos veremos às 15h para a entrega dos resultados! Até lá!',2.5,NULL,'Correlacionar os exames clínicos e laboratoriais e avaliar o risco-benefício de iniciar uma nova farmacoterapia para reduzir os níveis lipêmicos da paciente. Para tal, é recomendado o uso de algum medicamento da classe das estatinas, pois a paciente apresentou níveis séricos de LDL acima do referenciado pela Diretriz.','','xxxx','Cipolle','XXXX-XXXX','A Srª. G.G é portadora de Diabetes Mellitus tipo II há 2 anos e Hiperlipidemia. Durante a avaliação inicial no serviço de Atenção Farmacêutica foram considerados relevantes para o acompanhamento farmacoterapêutico os seguintes dados: \r\nA paciente relatou estar preocupada com o aumento nos níveis de colesterol e seus exames sugeriram o aparecimento de Esteatose hepática.  Também relatou não ter restrições com sal e gordura e não fazer exercícios físicos.\r\nNo hemograma mais recente (em anexo), os valores do colesterol total e triglicerídeos apresentaram-se acima dos valores de referência.\r\nNo perfil apresentado foi verificada a necessidade do início de uma farmacoterapia com agente hipolipêmico, com base nos valores de referência contidos na IV Diretriz Brasileira sobre Dislipidemias e Prevenção da Aterosclerose (2007).\r\n','X','Charles F. Lacy, Lora L. Armstrong, Morton P. Goldman, Leonard L. Lance. Medicamentos Lexi-comp Manole. Editora Manole, 2009.\r\nFormulário Terapêutico Nacional (2010). RENAME 2010/Ministério da Saúde ? 2 ed.\r\nIV Diretriz Brasileira sobre Dislipidemias e Prevenção da Aterosclerose. 2007\r\n','XXXX-XXXX',NULL),
 (14,'2012-10-24',12,0,'V',NULL,'Prezado Grupo, chegamos ao final dos atendimentos do nosso PV. Vocês foram ótimas na elaboração da carta de referência ao médico. Parabéns! Saber comunicar-se com outros profissionais de saúde é de suma importância na obtenção de resultados positivos com a prática da AtenFar! Próxima quarta nos veremos às 15h para a entrega dos resultados! Até lá!',2.5,NULL,'Avaliar a necessidade do uso da Hidroclorotiazida no tratamento da paciente, segundo as VI Diretrizes Brasileiras de Hipertensão, 2010.','','256','Horus','XXXXXX','A paciente E.V. portadora de Hipertensão Arterial Sistêmica e Diabetes Mellitus tipo II há treze anos, acompanhada pelo serviço de Atenção Farmacêutica apresentou  a prescrição dos seguintes medicamentos: Propranolol, Enalapril e Hidroclorotiazida, porém relata que \"não toma Hidroclorotiazida desde que foi prescrita, acredita que este medicamento não seja necessário, além de preferir não utilizá-lo pelo incômodo de ir muitas vezes ao banheiro\" (relato da paciente). De acordo com a Diretrizes Brasileiras de Hipertensão a paciente possui Hipertensão Arterial Sistêmica estágio I controlada, apresentando nas duas consultas farmacêuticas as seguintes medidas 135/75 e 130/80 mmHg.','L.A.S','Sociedade Brasileira de Hipertensão. VI Diretrizes Brasileiras de Hipertensão, 2010.\r\nDisponível em http://publicacoes.cardiol.br/consenso/2010/Diretriz_hipertensao_associados.pdf. Acessado em 24/10/2012.','XXXXXXX',NULL),
 (15,'2012-10-24',15,0,'V',NULL,'Prezado Grupo FARMAVIDA, chegamos ao final dos atendimentos do nosso PV. Vocês foram muito bem na elaboração da carta de referência ao médico. Parabéns! Saber comunicar-se com outros profissionais de saúde é de suma importância na obtenção de resultados positivos com a prática da AtenFar! Próxima quarta nos veremos às 15h para a entrega dos resultados! Até lá!',2.5,NULL,'Correlacionar com exames clínicos e laboratoriais e avaliar o risco-beneficio de subsidiar a Sinvastatina de 40 mg por Atorvastatina de 20 mg por outra classe de estatina, desde que apresente bons índices na avaliação risco/beneficio, reduzindo os trigliceríeos significativamente, quando comparada com outras estatinas menos potentes, sendo indicada em casos de Hiperlipedemia, segundo a IV Diretriz Brasileira sobre Dislipedemias e Preveção da Aterosclerose, Departamento de Aterosclerose da Sociedade Brasileira de Cardiologia 2008. ','Como a paciente também relata muita dor de estômago (queimação), desta forma, sugerimos avaliação para o uso de um inibidor de secreção ácida gástrica. Os inibidores da bomba de prótons, como o Omeprazol, fármaco usado no tratamento antiulceroso que envolve a inibição específica da bomba de ácido gástrico na célula parietal, segundo Goodman e Gilman, 2010.','870','Larissa, Luana, Ronison, Samuel','3245-2542','Em virtude do trabalho de acompanhamento farmacoterapêutico que vem sendo realizado na Universidade Federal de Sergipe (UFS). Sob supervisão da farmacêutica Blice.\r\n  Encaminhamos à Srª E.B.R., 66 anos,  que é portadora de Hiperlipidimia e Diabetes de Mellitus tipo II em uso dos medicamentos: Sinvastatina 40 mg, Insulina Aspart 2 a 12 U, para avaliação sobre as seguintes manifestações clínicas apresentadas:\r\n    Em seus exames laboratoriais, os níveis de colesterol estão acima dos limites de referência, mesmo em uso do medicamento citado. Segundo Goodman e Gilman, 2010, a Atorvastatina desempenha um papel de maior eficácia que as outras estatinas, apresentando um tempo de meia vida de cerca de 20 horas, de acordo com as bases de dados Lexi-comp (Referência oficial da Associação Americana de Farmacêuticos) a Atorvastatina reduz os triglicerídeos significamente, quando comparado com outra estatina menos potente como é o caso da ?Sinvastatina?, no qual houve uma redução de 37 a 55 % dos casos durante o uso deste medicamento. \r\n	A paciente também relata apresentar muita dor de estômago (queimação), desta forma, sugerimos avaliação. \r\nA próxima dispensação dos medicamentos dependerá de seu parecer ao tratamento.\r\nOBS: Segue em anexo o diário pessoal dos medicamentos utilizados pelo paciente.\r\n\r\n	','Divaldo Lyra','- IV Diretriz Brasileira sobre Dislipedemias e Preveção da Aterosclerose, Departamento de Aterosclerose da Sociedade Brasileira de Cardiologia 2008. Disponível em: http://publicacoes.cardiol.br/consenso/2008/diretriz.DA.pdf\r\n- GOODMAN & GILMAN. As bases farmacológicas da terapêutica. 11. ed. Rio de Janeiro: McGraw-Hill, 2005. 725 p.\r\n- KODA-KIMBLE, Mary Anne; YOUNG, Lloyd Yee; KRADJAN, Wayne A.; GUGLIELMO, B. Joseph. Manual de terapêutica aplicada. 7. ed. Rio de Janeiro: Guanabara Koogan, 2005.\r\n- BRUNTON, Laurence L.; LAZO, John S.; PARKER, Keith L. (Ed.). As bases farmacológicas da terapêutica. 11. ed. Rio de Janeiro: McGraw-Hill, 2010. 1821 p.	\r\n	','3218-3077',NULL),
 (16,'2012-10-24',11,0,'V',NULL,'Prezado Grupo Pharmacareufs\r\n\r\nChegamos à reta final do nosso PV F.B.O. Diante das intervenções elaboradas imagino que o paciente de Vocês deve estar satisfeito com o cuidado prestado. Quanto à proposta da carta ao médico pude observar que as informações colocadas foram precisas e selecionadas de forma coerente a situação clínica do paciente.  As referências que vocês selecionaram fazem parte da realidade da prática clínica do médico, o que irá facilitar a compreensão deste profissional ao que foi sugerido de melhora na farmacoterapia, por isso é redundante vocês colocarem na carta o trecho ?Analisando a base dado Micromedex 2.0, (umas das fonte de informação mais utilizadas e de maior credibilidade entre os profissionais de saúde)? . Além disso, vocês tiveram acesso a referências semelhantes as apresentadas no nosso gabarito. A única ressalva observada foi a falta do diário de medicamentos, deste modo, sugiro que vocês quando forem fazer as próximas cartas direcionadas a outros profissionais de saúde  anexem à ela este diário, para apresentar de forma prática ao profissional a farmacoterapia atual do paciente. Mais uma vez parabenizo o desempenho do grupo! Espero que nossas discussões tenham sido tão proveitosas para todos vocês quanto foi para nós Tutores!\r\n\r\nBoa sorte nos Cuidados ao paciente!!!\r\n\r\nAtt.,\r\n\r\nGiselle Brito\r\nFarmacêutica Tutora\r\n',2.4,NULL,'Avaliar a risco-benefício do uso da glimepirida, visto que, baseado em exames laboratoriais notou-se que somente o uso da metformina foi suficiente para controle dos níveis glicêmicos do paciente, segundo a diretrizes da Sociedade Brasileira de endocrinologia e metabolismo o uso da  metformina mostrou-se efetivo na redução das complicações\r\nvasculares ao longo do tempo, sugerindo que essa droga\r\ndeva ser considerada como droga de primeira escolha para\r\niniciar o tratamento medicamentoso de pacientes com diabetes\r\ntipo 2.','Avaliar o risco-benefício do uso tylex,devido o efeito adverso de constipação. Gostaríamos que avaliasse a substituição do tylex por outro medicamento da sua escolha desde que apresente bons níveis na avaliação risco-benefício e menor probabilidade de ocorrência da referida reação adversa.  ','999999999','Pharmacareufs','9999-9999','O Srº F.B.O é portador de diabetes mellitus tipo 2 há 30 anos.Durante a avaliação inicial no serviço da Atenção Farmacêutica forma consideradas relevantes para um acompanhamento farmacoterapêutico os seguintes dados: o paciente relata que fazia uso da metformina e ao fazer uso concomitante com a glimepirida passou mal com ela e teve uma crise de hipoglicemia na ultima vez que a utilizou e por isso suspendeu o uso da mesma.Analisando a base dado Micromedex 2.0,(umas das fonte de informação mais utilizadas e de maior credibilidade entre os profissionais de saúde) o qual relata como evento adverso da glimepirida causa hipoglicemia em adultos numa frequência de 4% a 19,7 % dos casos.Além disso foi relatado pelo paciente a presença de sintomas de constipação.Foi analisado na mesma base de dados que o medicamento tylex composto por paracetamol e codeína onde ambos princípios ativos podem causar constipação, porém não foi relatado a frequência do mesmo, medicamento este utilizado pelo paciente para dores nos pés.','Dra. S.','Micromedex 2.0 http://www-thomsonhc-com.ez20.periodicos.capes.gov.br\r\nFormulário Terapêutico Nacional 2010\r\nDiretrizes da Sociedade Brasileira de Endocrinologia e Metabolismo. http://www.endocrino.org.br/','9999-9999',NULL);
/*!40000 ALTER TABLE `respostaquarta` ENABLE KEYS */;


--
-- Definition of table `respostaquestionario`
--

DROP TABLE IF EXISTS `respostaquestionario`;
CREATE TABLE `respostaquestionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `justificativa` longtext,
  `numeroQuestao` int(11) NOT NULL,
  `opcao` varchar(255) DEFAULT NULL,
  `fkUsuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBBDC279E57682E1` (`fkUsuario`),
  CONSTRAINT `FKBBDC279E57682E1` FOREIGN KEY (`fkUsuario`) REFERENCES `usuario` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `respostaquestionario`
--

/*!40000 ALTER TABLE `respostaquestionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `respostaquestionario` ENABLE KEYS */;


--
-- Definition of table `respostasegunda`
--

DROP TABLE IF EXISTS `respostasegunda`;
CREATE TABLE `respostasegunda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataRealizacao` date DEFAULT NULL,
  `fkConsulta` int(11) NOT NULL,
  `numeroTentativa` int(11) NOT NULL DEFAULT '0',
  `flCorreto` varchar(1) DEFAULT NULL,
  `comentario` text,
  `comentarioAluno` text,
  `nota` float DEFAULT NULL,
  `carta` tinytext,
  `anotacoesExtras` longtext,
  PRIMARY KEY (`id`),
  KEY `FKEFEE246A5097F805` (`fkConsulta`),
  CONSTRAINT `FKEFEE246A5097F805` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`),
  CONSTRAINT `FK_respostasegunda_1` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `respostasegunda`
--

/*!40000 ALTER TABLE `respostasegunda` DISABLE KEYS */;
INSERT INTO `respostasegunda` (`id`,`dataRealizacao`,`fkConsulta`,`numeroTentativa`,`flCorreto`,`comentario`,`comentarioAluno`,`nota`,`carta`,`anotacoesExtras`) VALUES 
 (1,'2012-09-24',1,1,'V',NULL,'ótimo!',10,'xxxxxx',NULL),
 (2,'2012-09-26',2,1,'V',NULL,'Muito bem!',9.5,'xxxxxxxxx',NULL),
 (3,'2012-09-26',3,1,'V',NULL,'ok',10,'xxxxxxxxxx',NULL),
 (4,'2012-09-26',4,1,'V',NULL,'ok',10,'xxx',NULL),
 (5,'2012-09-28',5,1,'V',NULL,'',2.5,'xxxx',NULL),
 (6,'2012-10-10',6,1,'V',NULL,'Prezado Grupo SEMPRM, vocês foram muito bem no 2º atendimento do nosso paciente virtual M.A.O. Classificaram corretamente as suspeitas de PRM e propuseram intervenções importantes para a resolução dos mesmos! Apenas esqueceram de adicionar a TABELA DE HORÁRIO como uma das intervenções, isso é muito importante! Exceto esse lapso, vocês estão de parabéns! Na próxima quarta-feira, esperamos por vocês para analisarmos os desfechos dessas situações. Até lá!',2.3,'xxxxxx',NULL),
 (7,'2012-10-10',8,1,'V',NULL,'Prezado Grupo Farmacuida, vocês foram muito bem no 2º atendimento do nosso paciente virtual J.F.C. Classificaram corretamente as suspeitas de PRM e propuseram intervenções importantes para a resolução dos mesmos! Parabéns! Na próxima quarta-feira, esperamos por vocês para analisarmos os desfechos dessas situações. Até lá!',2.5,NULL,NULL),
 (9,'2012-10-10',7,1,'F',NULL,'',0,NULL,NULL),
 (11,'2012-10-10',9,1,'V',NULL,'Prezado Grupo CIPOLLE, vocês foram muito bem no 2º atendimento do nosso paciente virtual G.G. Classificaram corretamente as suspeitas de PRM e propuseram intervenções importantes para a resolução dos mesmos! Parabéns! Na próxima quarta-feira, esperamos por vocês para analisarmos os desfechos dessas situações. Até lá!',2.5,'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',NULL),
 (12,'2012-10-10',10,1,'V',NULL,'Gostaria de parabenizar o grupo, pois classificaram corretamente as suspeitas de PRM\'s e propuseram mais alternativas terapêuticas do que o gabarito do Paciente Virtual. Vocês estão no caminho certo!!! Beijos da Tutora e até a próxima aula!!!',2.5,NULL,NULL),
 (14,'2012-10-10',12,1,'V',NULL,'Gostaria de parabenizar o grupo, pois classificaram corretamente as suspeitas de PRM\'s e propuseram com clareza as alternativas terapêuticas. Vocês estão no caminho certo!!! Beijos da Tutora e até a próxima aula!!!',2.5,'xxxxxx',NULL),
 (15,'2012-10-10',13,1,'V',NULL,'Prezado Grupo FARMAVIDA, vocês foram muito bem no 2º atendimento do nosso paciente virtual E.B.R. Classificaram corretamente as suspeitas de PRM e propuseram intervenções importantes para a resolução dos mesmos! Parabéns! Na próxima quarta-feira, esperamos por vocês para analisarmos os desfechos dessas situações. Até lá!',2.5,'xxxxxxx',NULL),
 (16,'2012-10-10',11,1,'V',NULL,'Prezado Grupo PHARMACAREUFS, vocês foram muito bem nesse atendimento quanto a Classificação de PRM, esta se encontra correta em todos os itens, ocorreram algumas divergências entre o gabarito e a resposta de vocês, mas que não inviabilizaram o processo de documentação e de tomada de decisões.\r\n\r\nNo processo de intervenção, vocês lançaram mais alternativas que o gabarito e a resposta de vocês irá ser incluída no gabarito do PV a partir de agora. Contudo, gostaria que esclarecessem na carta de vocês o que seria \"Iniciar outro tipo de monitorização\", além da monitorização laboratorial.\r\n\r\nA nota de vocês desta segunda atividade será reduzida em alguns décimos visto que vocês foram recordados pelos tutores da importância de ser acrescentada a tabela de medicamentos. Na próxima quarta aguardo vocês para realizarmos a evolução do paciente F.B.O.\r\n\r\nAtt. Giselle Brito\r\n(Farmacêutica tutora)\r\n',2.3,'xxxxxxx',NULL),
 (17,'2012-10-12',7,2,'V',NULL,'Prezado Grupo Atencêuticos, apesar da solicitação de retorno para melhorar a documentação de vocês, vocês foram bem nesse segundo atendimento, mas ainda tenho algumas ressalvas quanto o processo de documentação! O gabarito do caso que vocês escolheram apresenta diferenças (Intervenções), no entanto, a resposta de vocês foi considerada correta. Mais uma vez peço atenção para a documentação! Ao conversar com a membra do grupo Carla Francisca, debatemos bastante acerca da real necessidade da tabela de medicamentos  e ela demonstrou que vocês entenderam que o paciente não tem problemas de adesão. No entanto, vocês classificaram o PRM (ao Atenolol) corretamente mas ao mesmo tempo afirmaram que o medicamento não estava sendo cumprido, confirma? Inclusive vi o grupo debater corretamente que a causa do PRM poderia ser uma possível interação com alimentos!!! Entendo que foi um momento de desatenção, diante disso não irei fazer com que vocês repitam a avaliação, mas serão penalizados com a retirada de alguns décimos. Na próxima quarta aguardo vocês para realizarmos a evolução do PV J.J. Parabéns!!!\r\n\r\nAtt. Giselle Brito\r\n(Farmacêutica tutora)\r\n',1.8,NULL,NULL),
 (19,'2012-10-17',14,1,'V',NULL,'',0,NULL,NULL),
 (20,'2012-10-18',15,1,'V',NULL,'',0,NULL,NULL);
/*!40000 ALTER TABLE `respostasegunda` ENABLE KEYS */;


--
-- Definition of table `respostaterceira`
--

DROP TABLE IF EXISTS `respostaterceira`;
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
  `proxEncontro` varchar(255) DEFAULT NULL,
  `anotacoesExtras` longtext,
  PRIMARY KEY (`id`),
  KEY `FK877B3B565097F805` (`fkConsulta`),
  CONSTRAINT `FK877B3B565097F805` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`),
  CONSTRAINT `FK_respostaalunoterceira_1` FOREIGN KEY (`fkConsulta`) REFERENCES `consulta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `respostaterceira`
--

/*!40000 ALTER TABLE `respostaterceira` DISABLE KEYS */;
INSERT INTO `respostaterceira` (`id`,`temperatura`,`pressaosistolica`,`pressaodiastolica`,`peso`,`fkConsulta`,`dataRealizacao`,`flCorreto`,`comentario`,`comentarioAluno`,`nota`,`imc`,`proxEncontro`,`anotacoesExtras`) VALUES 
 (1,128,130,80,59,1,'2012-09-24','V',NULL,'Rever efetividade da glibenclamida, você marcou como inefetivo? O horário do atenolol: 2h antes ou depois, n só depois!',8.5,28,'Rever a paciente em um mês. Reavaliar adesão ao tratamento, manutenção dos níveis pressóricos e da glicemia.',NULL),
 (2,128,130,80,59,2,'2012-09-26','V',NULL,'Ok',10,28.1,'Rever o paciente um mês. Reavaliar a adesão ao tratamento, a manutenção do controle dos níveis glicêmicos e pressóricos, avaliar o uso do Atenolol (suspeita de PRM?).',NULL),
 (3,128,130,80,59,3,'2012-09-26','V',NULL,'ok',10,28.1,'Rever o paciente em 1 mês. Reavaliar a adesão, a manutenção do controle glicêmico e pressórico, avaliar o uso do Atenolol (Suspeita de PRM?)',NULL),
 (4,128,130,80,59,4,'2012-09-26','V',NULL,'ok',10,28.1,'Rever a paciente em 1 mês. Reavaliar a adesão ao tratamento, a manutenção do controle da PA e da glicemia, o uso Atenolol (Suspeita de PRM?).',NULL),
 (5,128,130,80,59,5,'2012-09-28','V',NULL,'',2.5,28.1,'Rever a paciente xxxxxxxx',NULL),
 (6,144,140,80,71.3,8,'2012-10-17','V',NULL,'Prezado Grupo Farmacuida, vocês foram muitíssimo bem no 3º atendimento! Percebam que existem algumas diferenças entre a resposta de vocês e o gabarito:na situação do PRM, a resposta de vocês foi considerada correta e será adicionada como gabarito oficial do PV. Tenho certeza que o paciente virtual de vocês está muito feliz com os cuidados recebidos! Semana que vem nos veremos na terça e na quarta para a elaboração da carta ao médico, sugiro que estudem e façam um rascunho dessa carta com referências bibliográficas robustas e levem para as aulas! Iremos discutir! Até lá!!!',2.5,24.1,'30 dias após a consulta de hoje. \r\nSolicitamos que o paciente na próxima consulta traga um novo lipidograma(para verificar efetividade e cumprimento do atorvastatina).\r\n\r\nVerificar se o paciente continua aderindo ao tratamento com Nifedipino.',NULL),
 (7,126,125,70,61.5,6,'2012-10-17','V',NULL,'Prezado Grupo SEMPRM, vocês foram bem no 3º atendimento! Percebam que existem algumas diferenças entre a resposta de vocês e o gabarito: 1. na situação do PRM, a resposta de vocês foi considerada correta e será adicionada como gabarito oficial do PV. 2. No campo DATA DO PRÓXIMO ENCONTRO COM LEMBRETES, vocês esqueceram de mencionar pontos importantes para a continuação do seguimento deste PV (vide gabarito). 3. Na tabela de horário, é importante que coloquemos o tempo definido (ex: no mínimo quantos minutos antes do café?), isso ajuda a esclarecer os horários de tomada dos medicamentos e evitar erros futuros. Desse modo, alguns décimos foram subtraídos da nota de vocês, mas sem a necessidade de uma 2ª tentativa! Semana que vem nos veremos na terça e na quarta para a elaboração da carta ao médico, sugiro que estudem e façam um rascunho dessa carta com referências bibliográficas robustas. Até lá!!!',2.1,25.3,'Data do próximo encontro: Próximo mês (17/11/2012)\r\n\r\nSolicitar ao paciente exame de sangue para avaliação do lipidograma.',NULL),
 (8,128,120,70,55.2,10,'2012-10-17','V',NULL,'Prezado grupo, na situação do PRM, houve divergência entre a resposta de vocês com a do gabarito oficial do PV, pois no caso do uso da Metformina vocês classificaram como resolvida (objetivos alcançados, terapia finalizada) quando na verdade a situação era estável (objetivos alcançados / continua mesma terapia).  2. No campo DATA DO PRÓXIMO ENCONTRO COM LEMBRETES, vocês marcaram para reavaliar o paciente em dois meses, tal fato pode não ser bom pois lembrem que o paciente começou a aderir à farmacoterapia nessa última consulta o que requer um acompanhamento mais efetivo. Vocês também esqueceram de mencionar pontos importantes para a continuação do seguimento deste PV (vide gabarito). 3. Na tabela de horário, é importante que coloquemos o tempo definido (ex: no mínimo quantos minutos antes do café?), isso ajuda a esclarecer os horários de tomada dos medicamentos e evitar erros futuros. Desse modo, alguns décimos foram subtraídos da nota de vocês, mas sem a necessidade de uma 2ª tentativa! Semana que vem nos veremos na terça e na quarta para a elaboração da carta ao médico, sugiro que estudem e façam um rascunho dessa carta com referências bibliográficas robustas. Até lá!!!',2.1,22.7,'retornar daqui há 2 meses, necessário avaliar no próximo encontro exames laboratoriais relacionados a glicemia e aferir a pressão arterial. Realizar intervenção educativa sobre uso de bebidas alcoólicas e consumo excessivo de café.  ',NULL),
 (9,55,55,55,55,14,'2012-10-17','F',NULL,'',0,55,'',NULL),
 (10,128,120,70,55.2,14,'2012-10-17','F',NULL,'',0,22.7,'',NULL),
 (11,128,130,80,54,14,'2012-10-17','F',NULL,'',0,23.7,'',NULL),
 (12,128,130,80,54,7,'2012-10-17','F',NULL,'',0,23.7,'',NULL),
 (13,101,130,80,67,11,'2012-10-17','V',NULL,'Prezado Grupo PharmaCareUFS, vocês foram muito bem neste terceiro encontro! Vocês irão observar que o gabarito do caso que vocês escolheram apresenta diferenças em algumas resposta (Diário pessoal de medicamentos ? tomada da Metformina; situação ou estado clínico do problema de saúde; Classificação do PRM quando necessidade, efetividade, segurança e cumprimento), no entanto, a resposta de vocês foi considerada correta e adicionada como gabarito oficial desse PV! Na próxima quarta aguardo vocês para construirmos a carta ao médico da paciente F.B.O. \r\nParabéns!!!\r\n\r\nAtt. Giselle Brito\r\n(Farmacêutica tutora)\r\n',2.5,24.9,'Daqui a um mes para reavaliar os niveis glicemicos e se foi solucionado problema de constipaçao e dor nos pés.',NULL),
 (14,128,130,80,58,12,'2012-10-17','V',NULL,'Prezado Grupo, vocês foram ótimas no 3º atendimento! Na na situação do PRM, a resposta de vocês estava correta. PARABÉNS!!!!  2. No campo DATA DO PRÓXIMO ENCONTRO COM LEMBRETES, vocês mencionaram pontos importantes para a continuação do seguimento deste PV, e a resposta de vocês foi mais satisfatória que a resposta do gabarito oficial.MUITO BOM!!!! 3. Na tabela de horário, é importante que coloquemos o tempo definido (ex: no mínimo quantos minutos antes do café?), isso ajuda a esclarecer os horários de tomada dos medicamentos e evitar erros futuros. Desse modo, um décimo foi subtraído da nota de vocês, mas sem a necessidade de uma 2ª tentativa! Semana que vem nos veremos na terça e na quarta para a elaboração da carta ao médico, sugiro que estudem e façam um rascunho dessa carta com referências bibliográficas robustas. Até a próxima!!!',2.4,26.12,'',NULL),
 (15,163,130,70,75,9,'2012-10-17','V',NULL,'Prezado Grupo Cipolle, vocês foram muitíssimo bem no 3º atendimento! Parabéns, futuros farmacêuticos!!! Percebam que existem algumas diferenças entre a resposta de vocês e o gabarito: na tabela de horário, a resposta de vocês está correta e será adicionada como gabarito oficial do PV. Tenho certeza que a paciente virtual de vocês está muito feliz com os cuidados recebidos! Semana que vem nos veremos na terça e na quarta para a elaboração da carta ao médico, sugiro que estudem e façam um rascunho dessa carta com referências bibliográficas robustas e levem para as aulas! Iremos discutir! Até lá!!!',2.5,29.29,'Rever paciente em um mês. Avaliar resposta à sinvastatina, manutenção dos níveis glicêmicos, consulta a nutricionista, atividade física, exames laboratoriais e experiência subjetiva.',NULL),
 (16,105,110,70,105.75,15,'2012-10-18','V',NULL,'Prezado Grupo FARMAVIDA, atual VIDAFARMA, vocês foram muito bem na evolução da paciente virtual Srª. E.B.R. Tenho certeza que ela deve estar muito feliz com os cuidados que está recebendo de vocês! Percebam que existem algumas divergências entre a resposta de vocês e o gabarito, no entanto, a resposta de vocês está correta e será inserida no gabarito oficial do PV. Além disso, na tabela de horário ficou faltando o medicamento Vidalgliptina/Metformina, mas entendo que vocês não conseguiram visualizar com o problema que tivemos no sistema, logo aceitei a tabela de vocês! Tenho percebido o esforço do grupo e os parabenizo por isso! Semana que vem, nos encontraremos na terça e na quarta para elaborarmos a carta ao médico. Recomendo que façam um rascunho com referências bibliográficas robustas! Até lá! ',2.5,39.8,'Daqui há sete, dias rever o paciente observando os resultados se obteve melhora na troca de sinvastatina por atorvastatina ',NULL),
 (17,128,130,80,54,7,'2012-10-23','V',NULL,'Prezado Grupo Atencêuticos, vocês foram muito bem nesse terceiro atendimemnto. Tenho certeza que o paciente virtual de vocês está muito feliz com os serviços prestados. Existem algumas diferenças entre a resposta de vocês e o gabarito, mas apenas o erro na tabela de horário foi considerado. Próxima quarta nos encontraremos para elaborar a carta de referência ao médico. Estudem e façam um rascunho para facilitar os trabalhos! Até lá!',2.2,23.7,'Vide anexo enviado por e-mail.',NULL);
/*!40000 ALTER TABLE `respostaterceira` ENABLE KEYS */;


--
-- Definition of table `turma`
--

DROP TABLE IF EXISTS `turma`;
CREATE TABLE `turma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(2) DEFAULT NULL,
  `periodo` varchar(6) DEFAULT NULL,
  `fktutor` varchar(40) DEFAULT NULL,
  `nmDisciplina` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6998F652B972831` (`fktutor`),
  CONSTRAINT `FK6998F652B972831` FOREIGN KEY (`fktutor`) REFERENCES `tutor` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `turma`
--

/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` (`id`,`codigo`,`periodo`,`fktutor`,`nmDisciplina`) VALUES 
 (1,'00','2011/1','blicie','Teste'),
 (2,'10','2010/1','blicie','Turma Simulação'),
 (3,'1','2012/1','blicie','Atenção Farmacêutica');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;


--
-- Definition of table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
CREATE TABLE `tutor` (
  `login` varchar(255) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutor`
--

/*!40000 ALTER TABLE `tutor` DISABLE KEYS */;
INSERT INTO `tutor` (`login`,`nome`) VALUES 
 ('blicie','Blície Jennifer'),
 ('elisa','Elisa Souza Menendez'),
 ('giselle','Giselle Brito'),
 ('Jennifer','Jennifer'),
 ('viviane','Viviane Gibara');
/*!40000 ALTER TABLE `tutor` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `login` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `tpUsuario` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`login`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`login`,`email`,`senha`,`tpUsuario`,`nome`) VALUES 
 ('admin','admin@gmail.com','!p4c1ent3','Administrador','Administrador'),
 ('Atencêuticos','ju.agama@yahoo.com.br','atenceuticos','Aluno','Juliana Andrade Gama'),
 ('ATENFARMACÊUTICO','carla@hotmal.com','ATENFAR','Aluno','Juliana Andrade 2'),
 ('blicie','blicie@hotmail.com','79382503','Tutor',NULL),
 ('Cipolle','alinedosea@hotmail.com','cipolle','Aluno','Aline Santana Dosea'),
 ('elisa','elisa_menendez@hotmail.com','!p4c1ent3','Tutor',NULL),
 ('farmacuida','cinara_css@yahoo.com.br','272','Aluno','CINARA SANTOS SOUZA'),
 ('FARMAVIDA','roninho@hotmail.com','VITORIA','Aluno','JOSÉ RONILSON CUNHA LEITE'),
 ('giselle','gigilbrito@hotmail.com','300586','Tutor',NULL),
 ('horus','carmem.craveiro@yahoo.com.br','123456','Aluno','Maria do Carmo de Santana'),
 ('Jennifer','blicie@yahoo.com.br','painho','Tutor',NULL),
 ('MAXCEF','tedas88@hotmail.com','MAXCEF','Aluno','Daniele Lima Travassos'),
 ('pharmacareufs','andersontbom@hotmail.com','casa','Aluno','Anderson Tavares Mendonça'),
 ('semprm','julay_gouveia@hotmail.com','semprm','Aluno','Juliana Gouveia Galvão'),
 ('teste2','aluno@hotmail.com','1304','Aluno','Aluno teste2'),
 ('testetutor','tutor@hotmail.com','tutor','Aluno','Teste Tutor'),
 ('turma1teste','massia_consuelo@hotmail.com','turma1','Aluno','Turma 1 teste'),
 ('turma2teste','aline1@hotmail.com','turma2','Aluno','Turma 2 teste'),
 ('turma3teste','vivi@hotmail.com','teste3','Aluno','Vanessa '),
 ('VIDAFARMA','xxxx@hotmail.com','VIDA','Aluno','VIDA'),
 ('viviane','vivianegibara@hotmail.com','luana03','Tutor',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
