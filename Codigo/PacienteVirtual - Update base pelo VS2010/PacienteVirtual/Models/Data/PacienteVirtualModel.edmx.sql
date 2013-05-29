
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 05/28/2013 22:41:49
-- Generated from EDMX file: D:\Projetos\PV\Projeto\virtualpatient\Codigo\PacienteVirtual - Update base pelo VS2010\PacienteVirtual\Models\Data\PacienteVirtualModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[pv1].[FK_aluno_2]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[aluno] DROP CONSTRAINT [FK_aluno_2];
GO
IF OBJECT_ID(N'[pv1].[FK_Consulta_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[consulta] DROP CONSTRAINT [FK_Consulta_1];
GO
IF OBJECT_ID(N'[pv1].[FK_consulta_2]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[consulta] DROP CONSTRAINT [FK_consulta_2];
GO
IF OBJECT_ID(N'[pv1].[FK_intervencaorespostaquarta_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[intervencaorespostaquarta] DROP CONSTRAINT [FK_intervencaorespostaquarta_1];
GO
IF OBJECT_ID(N'[pv1].[FK_intervencaorespostasegunda_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[intervencaorespostasegunda] DROP CONSTRAINT [FK_intervencaorespostasegunda_1];
GO
IF OBJECT_ID(N'[pv1].[FK_medicamentoqueixa_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[medicamentoqueixa] DROP CONSTRAINT [FK_medicamentoqueixa_1];
GO
IF OBJECT_ID(N'[pv1].[FK_medicamentoqueixaquarta_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[medicamentoqueixaquarta] DROP CONSTRAINT [FK_medicamentoqueixaquarta_1];
GO
IF OBJECT_ID(N'[pv1].[FK_medicamentoqueixasegunda_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[medicamentoqueixasegunda] DROP CONSTRAINT [FK_medicamentoqueixasegunda_1];
GO
IF OBJECT_ID(N'[pv1].[FK_queixarespostaprimeira_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[queixarespostaprimeira] DROP CONSTRAINT [FK_queixarespostaprimeira_1];
GO
IF OBJECT_ID(N'[pv1].[FK_queixarespostaquarta_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[queixarespostaquarta] DROP CONSTRAINT [FK_queixarespostaquarta_1];
GO
IF OBJECT_ID(N'[pv1].[FK_queixarespostaterceira_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[queixarespostaterceira] DROP CONSTRAINT [FK_queixarespostaterceira_1];
GO
IF OBJECT_ID(N'[pv1].[FK_respostaalunoterceira_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[respostaterceira] DROP CONSTRAINT [FK_respostaalunoterceira_1];
GO
IF OBJECT_ID(N'[pv1].[FK_respostaprimeira_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[respostaprimeira] DROP CONSTRAINT [FK_respostaprimeira_1];
GO
IF OBJECT_ID(N'[pv1].[FK_respostaquarta_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[respostaquarta] DROP CONSTRAINT [FK_respostaquarta_1];
GO
IF OBJECT_ID(N'[pv1].[FK_respostasegunda_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[respostasegunda] DROP CONSTRAINT [FK_respostasegunda_1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_paciente_pessoa_turma_tb_consulta_fixo1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_paciente_pessoa_turma] DROP CONSTRAINT [fk_tb_paciente_pessoa_turma_tb_consulta_fixo1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_paciente_pessoa_turma_tb_consulta_variavel1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_paciente_pessoa_turma] DROP CONSTRAINT [fk_tb_paciente_pessoa_turma_tb_consulta_variavel1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_paciente_pessoa_turma_tb_paciente1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_paciente_pessoa_turma] DROP CONSTRAINT [fk_tb_paciente_pessoa_turma_tb_paciente1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_paciente_pessoa_turma_tb_turma_has_tb_pessoa1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_paciente_pessoa_turma] DROP CONSTRAINT [fk_tb_paciente_pessoa_turma_tb_turma_has_tb_pessoa1];
GO
IF OBJECT_ID(N'[pv1].[FK_FK1CE59807871504B2]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[queixarespostaterceira] DROP CONSTRAINT [FK_FK1CE59807871504B2];
GO
IF OBJECT_ID(N'[pv1].[FK_FK1E43344B8872A0F6]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[queixarespostaprimeira] DROP CONSTRAINT [FK_FK1E43344B8872A0F6];
GO
IF OBJECT_ID(N'[pv1].[FK_FK589C4EBDD526F1E]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[aluno] DROP CONSTRAINT [FK_FK589C4EBDD526F1E];
GO
IF OBJECT_ID(N'[pv1].[FK_FK5BA98DD4D2B646E7]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[queixarespostaquarta] DROP CONSTRAINT [FK_FK5BA98DD4D2B646E7];
GO
IF OBJECT_ID(N'[pv1].[FK_FK685CED99A4FE1140]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[queixarespostasegunda] DROP CONSTRAINT [FK_FK685CED99A4FE1140];
GO
IF OBJECT_ID(N'[pv1].[FK_FK78D999E947C18322]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[medicamentoqueixaquarta] DROP CONSTRAINT [FK_FK78D999E947C18322];
GO
IF OBJECT_ID(N'[pv1].[FK_FK800BA011D2B646E7]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[intervencaorespostaquarta] DROP CONSTRAINT [FK_FK800BA011D2B646E7];
GO
IF OBJECT_ID(N'[pv1].[FK_FK8099C4A73D02FC3D]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[medicamentoqueixa] DROP CONSTRAINT [FK_FK8099C4A73D02FC3D];
GO
IF OBJECT_ID(N'[pv1].[FK_FK877B3B565097F805]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[respostaterceira] DROP CONSTRAINT [FK_FK877B3B565097F805];
GO
IF OBJECT_ID(N'[pv1].[FK_FK88D8D79A5097F805]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[respostaprimeira] DROP CONSTRAINT [FK_FK88D8D79A5097F805];
GO
IF OBJECT_ID(N'[pv1].[FK_FK91D9EFAE8A1319FF]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[intervencao] DROP CONSTRAINT [FK_FK91D9EFAE8A1319FF];
GO
IF OBJECT_ID(N'[pv1].[FK_FKAA358BEF8A1319FF]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[medicamentoprescrito] DROP CONSTRAINT [FK_FKAA358BEF8A1319FF];
GO
IF OBJECT_ID(N'[pv1].[FK_FKAAEE312E8A1319FF]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[parametroclinico] DROP CONSTRAINT [FK_FKAAEE312E8A1319FF];
GO
IF OBJECT_ID(N'[pv1].[FK_FKB29DB8E35097F805]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[respostaquarta] DROP CONSTRAINT [FK_FKB29DB8E35097F805];
GO
IF OBJECT_ID(N'[pv1].[FK_FKBF69A97F8A1319FF]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[medicamentonaoprescrito] DROP CONSTRAINT [FK_FKBF69A97F8A1319FF];
GO
IF OBJECT_ID(N'[pv1].[FK_FKC773DEB18A1319FF]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[queixa] DROP CONSTRAINT [FK_FKC773DEB18A1319FF];
GO
IF OBJECT_ID(N'[pv1].[FK_FKD03D22FCA4FE1140]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[intervencaorespostasegunda] DROP CONSTRAINT [FK_FKD03D22FCA4FE1140];
GO
IF OBJECT_ID(N'[pv1].[FK_FKDE2881F52977839B]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[consulta] DROP CONSTRAINT [FK_FKDE2881F52977839B];
GO
IF OBJECT_ID(N'[pv1].[FK_FKDE2881F58A1319FF]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[consulta] DROP CONSTRAINT [FK_FKDE2881F58A1319FF];
GO
IF OBJECT_ID(N'[pv1].[FK_FKEFEE246A5097F805]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[respostasegunda] DROP CONSTRAINT [FK_FKEFEE246A5097F805];
GO
IF OBJECT_ID(N'[pv1].[FK_FKF12E64244E1862F8]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[medicamentoqueixasegunda] DROP CONSTRAINT [FK_FKF12E64244E1862F8];
GO
IF OBJECT_ID(N'[pv1].[FK_FKFD098D39A4FE1140]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[queixarespostasegunda] DROP CONSTRAINT [FK_FKFD098D39A4FE1140];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[pv1].[aluno]', 'U') IS NOT NULL
    DROP TABLE [pv1].[aluno];
GO
IF OBJECT_ID(N'[pv1].[casoclinico]', 'U') IS NOT NULL
    DROP TABLE [pv1].[casoclinico];
GO
IF OBJECT_ID(N'[pv1].[consulta]', 'U') IS NOT NULL
    DROP TABLE [pv1].[consulta];
GO
IF OBJECT_ID(N'[pv1].[intervencao]', 'U') IS NOT NULL
    DROP TABLE [pv1].[intervencao];
GO
IF OBJECT_ID(N'[pv1].[intervencaorespostaquarta]', 'U') IS NOT NULL
    DROP TABLE [pv1].[intervencaorespostaquarta];
GO
IF OBJECT_ID(N'[pv1].[intervencaorespostasegunda]', 'U') IS NOT NULL
    DROP TABLE [pv1].[intervencaorespostasegunda];
GO
IF OBJECT_ID(N'[pv1].[medicamentonaoprescrito]', 'U') IS NOT NULL
    DROP TABLE [pv1].[medicamentonaoprescrito];
GO
IF OBJECT_ID(N'[pv1].[medicamentoprescrito]', 'U') IS NOT NULL
    DROP TABLE [pv1].[medicamentoprescrito];
GO
IF OBJECT_ID(N'[pv1].[medicamentoqueixa]', 'U') IS NOT NULL
    DROP TABLE [pv1].[medicamentoqueixa];
GO
IF OBJECT_ID(N'[pv1].[medicamentoqueixaquarta]', 'U') IS NOT NULL
    DROP TABLE [pv1].[medicamentoqueixaquarta];
GO
IF OBJECT_ID(N'[pv1].[medicamentoqueixasegunda]', 'U') IS NOT NULL
    DROP TABLE [pv1].[medicamentoqueixasegunda];
GO
IF OBJECT_ID(N'[pv1].[parametroclinico]', 'U') IS NOT NULL
    DROP TABLE [pv1].[parametroclinico];
GO
IF OBJECT_ID(N'[pv1].[queixa]', 'U') IS NOT NULL
    DROP TABLE [pv1].[queixa];
GO
IF OBJECT_ID(N'[pv1].[queixarespostaprimeira]', 'U') IS NOT NULL
    DROP TABLE [pv1].[queixarespostaprimeira];
GO
IF OBJECT_ID(N'[pv1].[queixarespostaquarta]', 'U') IS NOT NULL
    DROP TABLE [pv1].[queixarespostaquarta];
GO
IF OBJECT_ID(N'[pv1].[queixarespostasegunda]', 'U') IS NOT NULL
    DROP TABLE [pv1].[queixarespostasegunda];
GO
IF OBJECT_ID(N'[pv1].[queixarespostaterceira]', 'U') IS NOT NULL
    DROP TABLE [pv1].[queixarespostaterceira];
GO
IF OBJECT_ID(N'[pv1].[respostaprimeira]', 'U') IS NOT NULL
    DROP TABLE [pv1].[respostaprimeira];
GO
IF OBJECT_ID(N'[pv1].[respostaquarta]', 'U') IS NOT NULL
    DROP TABLE [pv1].[respostaquarta];
GO
IF OBJECT_ID(N'[pv1].[respostasegunda]', 'U') IS NOT NULL
    DROP TABLE [pv1].[respostasegunda];
GO
IF OBJECT_ID(N'[pv1].[respostaterceira]', 'U') IS NOT NULL
    DROP TABLE [pv1].[respostaterceira];
GO
IF OBJECT_ID(N'[pv1].[tb_acao_alternativa]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_acao_alternativa];
GO
IF OBJECT_ID(N'[pv1].[tb_acao_queixa]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_acao_queixa];
GO
IF OBJECT_ID(N'[pv1].[tb_alergia]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_alergia];
GO
IF OBJECT_ID(N'[pv1].[tb_alergia_exames_fisicos]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_alergia_exames_fisicos];
GO
IF OBJECT_ID(N'[pv1].[tb_consulta_fixo]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_consulta_fixo];
GO
IF OBJECT_ID(N'[pv1].[tb_consulta_parametro]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_consulta_parametro];
GO
IF OBJECT_ID(N'[pv1].[tb_consulta_variavel]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_consulta_variavel];
GO
IF OBJECT_ID(N'[pv1].[tb_consulta_variavel_queixa]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_consulta_variavel_queixa];
GO
IF OBJECT_ID(N'[pv1].[tb_curso]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_curso];
GO
IF OBJECT_ID(N'[pv1].[tb_curso_disciplina]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_curso_disciplina];
GO
IF OBJECT_ID(N'[pv1].[tb_demograficos_antropometricos]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_demograficos_antropometricos];
GO
IF OBJECT_ID(N'[pv1].[tb_diario_pessoal]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_diario_pessoal];
GO
IF OBJECT_ID(N'[pv1].[tb_disciplina]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_disciplina];
GO
IF OBJECT_ID(N'[pv1].[tb_escolaridade]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_escolaridade];
GO
IF OBJECT_ID(N'[pv1].[tb_estilo_vida]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_estilo_vida];
GO
IF OBJECT_ID(N'[pv1].[tb_exames_fisicos]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_exames_fisicos];
GO
IF OBJECT_ID(N'[pv1].[tb_experiencia_medicamentos]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_experiencia_medicamentos];
GO
IF OBJECT_ID(N'[pv1].[tb_historia]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_historia];
GO
IF OBJECT_ID(N'[pv1].[tb_historico]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_historico];
GO
IF OBJECT_ID(N'[pv1].[tb_instituicao]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_instituicao];
GO
IF OBJECT_ID(N'[pv1].[tb_medicamento_nao_prescrito]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_medicamento_nao_prescrito];
GO
IF OBJECT_ID(N'[pv1].[tb_medicamento_prescrito]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_medicamento_prescrito];
GO
IF OBJECT_ID(N'[pv1].[tb_medicamentos]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_medicamentos];
GO
IF OBJECT_ID(N'[pv1].[tb_medicamentos_anteriores]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_medicamentos_anteriores];
GO
IF OBJECT_ID(N'[pv1].[tb_ocupacao]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_ocupacao];
GO
IF OBJECT_ID(N'[pv1].[tb_paciente]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_paciente];
GO
IF OBJECT_ID(N'[pv1].[tb_paciente_pessoa_turma]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_paciente_pessoa_turma];
GO
IF OBJECT_ID(N'[pv1].[tb_parametro_clinico]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_parametro_clinico];
GO
IF OBJECT_ID(N'[pv1].[tb_perfil_usuario]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_perfil_usuario];
GO
IF OBJECT_ID(N'[pv1].[tb_pergunta]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_pergunta];
GO
IF OBJECT_ID(N'[pv1].[tb_pessoa]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_pessoa];
GO
IF OBJECT_ID(N'[pv1].[tb_plano_saude]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_plano_saude];
GO
IF OBJECT_ID(N'[pv1].[tb_queixa]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_queixa];
GO
IF OBJECT_ID(N'[pv1].[tb_queixa_medicamentos]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_queixa_medicamentos];
GO
IF OBJECT_ID(N'[pv1].[tb_razao_encontro]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_razao_encontro];
GO
IF OBJECT_ID(N'[pv1].[tb_relato_clinico]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_relato_clinico];
GO
IF OBJECT_ID(N'[pv1].[tb_resposta]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_resposta];
GO
IF OBJECT_ID(N'[pv1].[tb_sistema]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_sistema];
GO
IF OBJECT_ID(N'[pv1].[tb_turma]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_turma];
GO
IF OBJECT_ID(N'[pv1].[tb_turma_pessoa]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_turma_pessoa];
GO
IF OBJECT_ID(N'[pv1].[tb_turma_pessoa_relato]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_turma_pessoa_relato];
GO
IF OBJECT_ID(N'[pv1].[tb_usuario]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_usuario];
GO
IF OBJECT_ID(N'[pv1].[tb_usuario_turma]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_usuario_turma];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'alunoes'
CREATE TABLE [dbo].[alunoes] (
    [login] varchar(40)  NOT NULL,
    [anoInicioCurso] int  NOT NULL,
    [flCursouAssistenciaFarmaceutica] varchar(1)  NULL,
    [flCursouAtencaoFarmaceutica] varchar(1)  NULL,
    [flCursouDispencaoFarmaceutica] varchar(1)  NULL,
    [flCursouFarmaciaClinica] varchar(1)  NULL,
    [flCursouIntroducaoFarmacia] varchar(1)  NULL,
    [flCursouSemiologiaFarmaceutica] varchar(1)  NULL,
    [flCursouTopicosFarmaciaClinica] varchar(1)  NULL,
    [genero] varchar(1)  NULL,
    [idade] int  NOT NULL,
    [matricula] varchar(8)  NULL,
    [fkTurma] int  NULL,
    [nome] varchar(45)  NOT NULL,
    [liberado] varchar(1)  NULL,
    [fkConsultaAtual] int  NULL,
    [nrConsulta] int  NOT NULL,
    [nrTentativa] int  NOT NULL,
    [flAcessoCasa] varchar(1)  NULL,
    [flAcessoCasaAmigo] varchar(1)  NULL,
    [flAcessoOutro] varchar(1)  NULL,
    [flAcessoUniversidade] varchar(1)  NULL
);
GO

-- Creating table 'casoclinicoes'
CREATE TABLE [dbo].[casoclinicoes] (
    [id] int IDENTITY(1,1) NOT NULL,
    [alergias] varchar(255)  NULL,
    [altura] float  NOT NULL,
    [dataNascimento] datetime  NULL,
    [disponibilidade] varchar(255)  NULL,
    [escolaridade] varchar(255)  NULL,
    [flBebeAlcool] varchar(255)  NULL,
    [flBebeCafe] varchar(255)  NULL,
    [flFuma] varchar(255)  NULL,
    [genero] varchar(255)  NULL,
    [medicosQueAtendem] varchar(255)  NULL,
    [moradiaFamilia] varchar(255)  NULL,
    [nome] varchar(255)  NULL,
    [ocupacao] varchar(255)  NULL,
    [peso] float  NOT NULL,
    [planoDeSaude] varchar(255)  NULL,
    [pressaoDiastolica] int  NOT NULL,
    [pressaoSistolica] int  NOT NULL,
    [relatoDeCasoPrimeiraConsulta] longtext  NULL,
    [relatoDeCasoTerceiraConsulta] longtext  NULL,
    [temperatura] float  NOT NULL,
    [historiaAlcoolAnterior] varchar(255)  NULL,
    [historiaAlcoolAtual] varchar(255)  NULL,
    [historiaCafeAnterior] varchar(255)  NULL,
    [historiaCafeAtual] varchar(255)  NULL,
    [historiaTabacoAnterior] varchar(255)  NULL,
    [historiaTabacoAtual] varchar(255)  NULL,
    [peso2] float  NULL,
    [pressaoDiastolica2] int  NULL,
    [pressaoSistolica2] int  NULL,
    [temperatura2] float  NULL,
    [tipoBebidaAlcoolica] varchar(255)  NULL
);
GO

-- Creating table 'consultas'
CREATE TABLE [dbo].[consultas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [fkCasoClinico] int  NOT NULL,
    [fkAluno] varchar(40)  NOT NULL
);
GO

-- Creating table 'intervencaos'
CREATE TABLE [dbo].[intervencaos] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NULL,
    [numeroEtapa] int  NOT NULL,
    [numeroIntervencao] int  NOT NULL,
    [fkCasoClinico] int  NULL
);
GO

-- Creating table 'intervencaorespostaquartas'
CREATE TABLE [dbo].[intervencaorespostaquartas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NULL,
    [justificativa] longtext  NULL,
    [numeroIntervencao] int  NOT NULL,
    [fkResposta4] int  NOT NULL
);
GO

-- Creating table 'intervencaorespostasegundas'
CREATE TABLE [dbo].[intervencaorespostasegundas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NULL,
    [justificativa] longtext  NULL,
    [numeroIntervencao] int  NULL,
    [fkResposta2] int  NOT NULL
);
GO

-- Creating table 'medicamentonaoprescritoes'
CREATE TABLE [dbo].[medicamentonaoprescritoes] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NULL,
    [dosagem] varchar(255)  NULL,
    [posologia] varchar(255)  NULL,
    [fkCasoClinico] int  NULL,
    [flItalico] varchar(255)  NULL
);
GO

-- Creating table 'medicamentoprescritoes'
CREATE TABLE [dbo].[medicamentoprescritoes] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NULL,
    [dosagem] varchar(255)  NULL,
    [especialidadeMedico] varchar(255)  NULL,
    [nmMedico] varchar(255)  NULL,
    [posologia] varchar(255)  NULL,
    [fkCasoClinico] int  NULL,
    [flItalico] varchar(255)  NULL
);
GO

-- Creating table 'medicamentoqueixas'
CREATE TABLE [dbo].[medicamentoqueixas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(150)  NULL,
    [dose] varchar(80)  NULL,
    [efetivo] varchar(1)  NULL,
    [necessario] varchar(1)  NULL,
    [periodo] varchar(80)  NULL,
    [seguro] varchar(1)  NULL,
    [cumprimento] varchar(1)  NULL,
    [fkQueixa] int  NOT NULL,
    [conheceCumpre] varchar(1)  NULL
);
GO

-- Creating table 'medicamentoqueixaquartas'
CREATE TABLE [dbo].[medicamentoqueixaquartas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(150)  NULL,
    [dose] varchar(80)  NULL,
    [efetivo] varchar(1)  NULL,
    [necessario] varchar(1)  NULL,
    [periodo] varchar(80)  NULL,
    [seguro] varchar(1)  NULL,
    [cumprimento] varchar(1)  NULL,
    [fkQueixaQuarta] int  NOT NULL,
    [conheceCumpre] varchar(1)  NULL
);
GO

-- Creating table 'medicamentoqueixasegundas'
CREATE TABLE [dbo].[medicamentoqueixasegundas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(150)  NULL,
    [dose] varchar(80)  NULL,
    [efetivo] varchar(1)  NULL,
    [necessario] varchar(1)  NULL,
    [periodo] varchar(80)  NULL,
    [seguro] varchar(1)  NULL,
    [cumprimento] varchar(1)  NULL,
    [fkQueixaSegunda] int  NOT NULL,
    [conheceCumpre] varchar(1)  NULL
);
GO

-- Creating table 'parametroclinicoes'
CREATE TABLE [dbo].[parametroclinicoes] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NULL,
    [unidade] varchar(255)  NULL,
    [valor] float  NOT NULL,
    [valorDeReferencia] varchar(255)  NULL,
    [fkCasoClinico] int  NULL
);
GO

-- Creating table 'queixas'
CREATE TABLE [dbo].[queixas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NULL,
    [numeroEtapa] int  NOT NULL,
    [numeroPRM] int  NOT NULL,
    [fkCasoClinico] int  NULL,
    [conheceOuPreocupa] varchar(255)  NULL,
    [periodoSurgimento] varchar(255)  NULL,
    [prioridade] int  NULL
);
GO

-- Creating table 'queixarespostaprimeiras'
CREATE TABLE [dbo].[queixarespostaprimeiras] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NOT NULL,
    [fkResposta] int  NOT NULL
);
GO

-- Creating table 'queixarespostaquartas'
CREATE TABLE [dbo].[queixarespostaquartas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [numeroPRM] int  NOT NULL,
    [fkResposta4] int  NOT NULL,
    [periodoSurgimento] varchar(45)  NULL,
    [flConheceOuPreocupa] varchar(1)  NULL,
    [prioridade] bigint  NOT NULL,
    [descricao] varchar(125)  NULL
);
GO

-- Creating table 'queixarespostasegundas'
CREATE TABLE [dbo].[queixarespostasegundas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [numeroPRM] int  NOT NULL,
    [fkResposta2] int  NOT NULL,
    [flConheceOuPreocupa] varchar(1)  NULL,
    [prioridade] bigint  NOT NULL,
    [descricao] varchar(125)  NULL,
    [periodoSurgimento] varchar(45)  NULL
);
GO

-- Creating table 'queixarespostaterceiras'
CREATE TABLE [dbo].[queixarespostaterceiras] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(80)  NOT NULL,
    [fkResposta] int  NOT NULL
);
GO

-- Creating table 'respostaprimeiras'
CREATE TABLE [dbo].[respostaprimeiras] (
    [id] int IDENTITY(1,1) NOT NULL,
    [alergias] varchar(255)  NULL,
    [altura] float  NOT NULL,
    [dataDeRealizacao] datetime  NULL,
    [dataNascimento] datetime  NULL,
    [escolaridade] varchar(255)  NULL,
    [flAlturaCerta] varchar(255)  NULL,
    [flBebeAlcool] varchar(255)  NULL,
    [flBebeAlcoolCerto] varchar(255)  NULL,
    [flBebeCafe] varchar(255)  NULL,
    [flBebeCafeCerto] varchar(255)  NULL,
    [flDataNascimentoCerta] varchar(255)  NULL,
    [flEscolaridadeCerta] varchar(255)  NULL,
    [flFuma] varchar(255)  NULL,
    [flFumaCerto] varchar(255)  NULL,
    [flGeneroCerto] varchar(255)  NULL,
    [flIMCCerto] varchar(255)  NULL,
    [flNomeCerto] varchar(255)  NULL,
    [flOcupacaoCerta] varchar(255)  NULL,
    [flPesoCerto] varchar(255)  NULL,
    [flPressaoDiastolicaCerta] varchar(255)  NULL,
    [flPressaoSistolicaCerta] varchar(255)  NULL,
    [flTemperaturaCerta] varchar(255)  NULL,
    [genero] varchar(255)  NULL,
    [IMC] float  NULL,
    [medicosQueAtendem] varchar(255)  NULL,
    [moradiaFamilia] varchar(255)  NULL,
    [nome] varchar(255)  NULL,
    [ocupacao] varchar(255)  NULL,
    [peso] float  NOT NULL,
    [pressaoDiastolica] int  NOT NULL,
    [pressaoSistolica] int  NOT NULL,
    [temperatura] float  NOT NULL,
    [planoDeSaude] varchar(255)  NULL,
    [numeroTentativa] bigint  NOT NULL,
    [fkConsulta] int  NOT NULL,
    [flCorreto] varchar(1)  NULL,
    [comentario] varchar(65535)  NULL,
    [comentarioAluno] varchar(65535)  NULL,
    [nota] float  NOT NULL,
    [historiaAlcoolAnterior] varchar(255)  NULL,
    [historiaAlcoolAtual] varchar(255)  NULL,
    [historiaCafeAnterior] varchar(255)  NULL,
    [historiaCafeAtual] varchar(255)  NULL,
    [historiaTabacoAnterior] varchar(255)  NULL,
    [historiaTabacoAtual] varchar(255)  NULL,
    [tipoBebidaAlcoolica] varchar(255)  NULL
);
GO

-- Creating table 'respostaquartas'
CREATE TABLE [dbo].[respostaquartas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [dataRealizacao] datetime  NOT NULL,
    [fkConsulta] int  NOT NULL,
    [numeroTentativa] int  NOT NULL,
    [flCorreto] varchar(1)  NULL,
    [comentario] varchar(65535)  NULL,
    [comentarioAluno] varchar(65535)  NULL,
    [nota] float  NULL,
    [carta] varchar(255)  NULL
);
GO

-- Creating table 'respostasegundas'
CREATE TABLE [dbo].[respostasegundas] (
    [id] int IDENTITY(1,1) NOT NULL,
    [dataRealizacao] datetime  NOT NULL,
    [fkConsulta] int  NOT NULL,
    [numeroTentativa] int  NOT NULL,
    [flCorreto] varchar(1)  NULL,
    [comentario] varchar(65535)  NULL,
    [comentarioAluno] varchar(65535)  NULL,
    [nota] float  NULL,
    [carta] varchar(255)  NULL
);
GO

-- Creating table 'respostaterceiras'
CREATE TABLE [dbo].[respostaterceiras] (
    [id] int IDENTITY(1,1) NOT NULL,
    [temperatura] float  NULL,
    [pressaosistolica] bigint  NULL,
    [pressaodiastolica] bigint  NULL,
    [peso] float  NULL,
    [fkConsulta] int  NOT NULL,
    [dataRealizacao] datetime  NULL,
    [flCorreto] varchar(1)  NULL,
    [comentario] varchar(65535)  NULL,
    [comentarioAluno] varchar(65535)  NULL,
    [nota] float  NULL,
    [imc] float  NOT NULL
);
GO

-- Creating table 'tb_acao_alternativa'
CREATE TABLE [dbo].[tb_acao_alternativa] (
    [IdAcaoAlternativa] int  NOT NULL,
    [DescricaoAcao] varchar(50)  NULL
);
GO

-- Creating table 'tb_acao_queixa'
CREATE TABLE [dbo].[tb_acao_queixa] (
    [IdAcaoQueixa] int IDENTITY(1,1) NOT NULL,
    [DescricaoAcao] varchar(100)  NOT NULL
);
GO

-- Creating table 'tb_alergia'
CREATE TABLE [dbo].[tb_alergia] (
    [IdAlergia] int  NOT NULL,
    [Alergia] varchar(100)  NOT NULL
);
GO

-- Creating table 'tb_alergia_exames_fisicos'
CREATE TABLE [dbo].[tb_alergia_exames_fisicos] (
    [IdAlergia] int  NOT NULL,
    [IdConsultaVariavel] bigint  NOT NULL
);
GO

-- Creating table 'tb_consulta_fixo'
CREATE TABLE [dbo].[tb_consulta_fixo] (
    [IdConsultaFixo] bigint IDENTITY(1,1) NOT NULL,
    [IdTurma] int  NOT NULL,
    [IdPessoa] int  NOT NULL,
    [EstadoPreenchimento] varchar(1)  NOT NULL,
    [EhGabarito] bool  NOT NULL,
    [DataAtualizacao] datetime  NULL,
    [ComentariosTutor] varchar(65535)  NULL
);
GO

-- Creating table 'tb_consulta_parametro'
CREATE TABLE [dbo].[tb_consulta_parametro] (
    [IdConsultaVariavel] bigint  NOT NULL,
    [IdParamentoClinico] int  NOT NULL,
    [Valor] float  NULL,
    [ValorReferencia] float  NULL,
    [Unidade] varchar(20)  NULL
);
GO

-- Creating table 'tb_consulta_variavel'
CREATE TABLE [dbo].[tb_consulta_variavel] (
    [IdConsultaVariavel] bigint IDENTITY(1,1) NOT NULL,
    [IdConsultaFixo] bigint  NOT NULL,
    [IdRelato] int  NOT NULL,
    [IdRazaoEncontro] int  NOT NULL,
    [DataPreenchimento] datetime  NULL,
    [Lembretes] varchar(65535)  NULL,
    [ComentariosTutor] varchar(65535)  NULL
);
GO

-- Creating table 'tb_consulta_variavel_queixa'
CREATE TABLE [dbo].[tb_consulta_variavel_queixa] (
    [IdConsultaVariavel] bigint  NOT NULL,
    [IdQueixa] int  NOT NULL,
    [IdAcaoQueixa] int  NOT NULL,
    [Motivo] varchar(1)  NOT NULL,
    [Desde] varchar(40)  NULL,
    [Prioridade] int  NULL
);
GO

-- Creating table 'tb_curso'
CREATE TABLE [dbo].[tb_curso] (
    [IdCurso] int  NOT NULL,
    [NomeCurso] varchar(45)  NOT NULL,
    [IdInstituicao] int  NOT NULL
);
GO

-- Creating table 'tb_curso_disciplina'
CREATE TABLE [dbo].[tb_curso_disciplina] (
    [IdCurso] int  NOT NULL,
    [IdDisciplina] int  NOT NULL
);
GO

-- Creating table 'tb_demograficos_antropometricos'
CREATE TABLE [dbo].[tb_demograficos_antropometricos] (
    [IdConsultaFixo] bigint  NOT NULL,
    [Nome] varchar(50)  NOT NULL,
    [Genero] varchar(1)  NOT NULL,
    [DataNascimento] datetime  NULL,
    [MedicosAtendem] varchar(255)  NULL,
    [MoradiaFamilia] varchar(100)  NULL,
    [OndeAdquireMedicamentos] varchar(100)  NULL,
    [IdEscolaridade] int  NOT NULL,
    [IdOcupacao] int  NOT NULL,
    [IdPlanoSaude] int  NOT NULL
);
GO

-- Creating table 'tb_diario_pessoal'
CREATE TABLE [dbo].[tb_diario_pessoal] (
    [IdConsultaFixo] bigint  NOT NULL,
    [IdMedicamento] int  NOT NULL,
    [Periodo] varchar(1)  NOT NULL,
    [Horario] varchar(20)  NULL,
    [Quantidade] varchar(20)  NULL,
    [TipoBebida] varchar(1)  NULL
);
GO

-- Creating table 'tb_disciplina'
CREATE TABLE [dbo].[tb_disciplina] (
    [IdDisciplina] int IDENTITY(1,1) NOT NULL,
    [NomeDisciplina] varchar(45)  NOT NULL
);
GO

-- Creating table 'tb_escolaridade'
CREATE TABLE [dbo].[tb_escolaridade] (
    [IdEscolaridade] int  NOT NULL,
    [Nivel] varchar(100)  NOT NULL
);
GO

-- Creating table 'tb_estilo_vida'
CREATE TABLE [dbo].[tb_estilo_vida] (
    [IdConsultaVariavel] bigint  NOT NULL,
    [TabacoConsumo] bool  NOT NULL,
    [TabacoUso] smallint  NOT NULL,
    [TabacoParou] varchar(50)  NULL,
    [CafeConsumo] bool  NOT NULL,
    [CafeUso] smallint  NOT NULL,
    [CafeParou] varchar(50)  NULL,
    [AlcoolConsumo] bool  NOT NULL,
    [AlcoolUso] smallint  NOT NULL,
    [AlcoolTipoBebida] varchar(50)  NULL,
    [AlcoolParou] varchar(50)  NULL
);
GO

-- Creating table 'tb_exames_fisicos'
CREATE TABLE [dbo].[tb_exames_fisicos] (
    [IdConsultaVariavel] bigint  NOT NULL,
    [Peso] float  NULL,
    [Altura] float  NULL,
    [PressaoDiastolica] float  NULL,
    [PressaoSistolica] float  NULL,
    [Glicemia] float  NULL
);
GO

-- Creating table 'tb_experiencia_medicamentos'
CREATE TABLE [dbo].[tb_experiencia_medicamentos] (
    [IdConsultaFixo] bigint  NOT NULL,
    [IdRespostaEsperaTratamento] int  NOT NULL,
    [IdRespostaPreocupacoes] int  NOT NULL,
    [IdRespostaGrauEntendimento] int  NOT NULL,
    [IdRespostaCultural] int  NOT NULL,
    [IdRespostaComportamento] int  NOT NULL,
    [IdRespostaIncorporadoPlano] int  NOT NULL,
    [AtencaoEsperaTratamento] bool  NOT NULL,
    [AtencaoPreocupacoes] bool  NOT NULL,
    [AtencaoGrauEntendimento] bool  NOT NULL,
    [AtencaoCultural] bool  NOT NULL,
    [AtencaoComportamento] bool  NOT NULL
);
GO

-- Creating table 'tb_historia'
CREATE TABLE [dbo].[tb_historia] (
    [IdConsultaFixo] bigint  NOT NULL,
    [HistoriaMedicaPregressa] varchar(255)  NOT NULL,
    [HistoriaFamiliar] varchar(255)  NOT NULL
);
GO

-- Creating table 'tb_historico'
CREATE TABLE [dbo].[tb_historico] (
    [IdHistorico] bigint IDENTITY(1,1) NOT NULL,
    [IdPessoa] int  NOT NULL,
    [IdTurma] int  NOT NULL,
    [IdPaciente] int  NOT NULL,
    [IdTutor] int  NOT NULL,
    [IdRelato] int  NOT NULL,
    [DataEnvio] datetime  NULL,
    [DataResposta] datetime  NULL,
    [Estado] int  NULL,
    [ComentarioTutor] varchar(65535)  NULL
);
GO

-- Creating table 'tb_instituicao'
CREATE TABLE [dbo].[tb_instituicao] (
    [IdInstituicao] int  NOT NULL,
    [NomeInstituicao] varchar(45)  NOT NULL,
    [Sigla] varchar(10)  NOT NULL
);
GO

-- Creating table 'tb_medicamento_nao_prescrito'
CREATE TABLE [dbo].[tb_medicamento_nao_prescrito] (
    [IdConsultaVariavel] bigint  NOT NULL,
    [IdMedicamento] int  NOT NULL,
    [Fitoterapico] bool  NOT NULL,
    [Dosagem] varchar(50)  NULL,
    [Posologia] varchar(50)  NULL
);
GO

-- Creating table 'tb_medicamento_prescrito'
CREATE TABLE [dbo].[tb_medicamento_prescrito] (
    [IdConsultaVariavel] bigint  NOT NULL,
    [IdMedicamento] int  NOT NULL,
    [Fitoterapico] bool  NULL,
    [Dosagem] varchar(50)  NULL,
    [Posologia] varchar(50)  NULL,
    [Prescritor] varchar(50)  NULL,
    [Especialidade] varchar(50)  NULL
);
GO

-- Creating table 'tb_medicamentos'
CREATE TABLE [dbo].[tb_medicamentos] (
    [IdMedicamento] int IDENTITY(1,1) NOT NULL,
    [Nome] varchar(100)  NOT NULL
);
GO

-- Creating table 'tb_medicamentos_anteriores'
CREATE TABLE [dbo].[tb_medicamentos_anteriores] (
    [IdConsultaVariavel] bigint  NOT NULL,
    [IdMedicamento] int  NOT NULL,
    [Indicacao] varchar(100)  NULL,
    [Resposta] varchar(100)  NULL,
    [Periodo] varchar(100)  NULL
);
GO

-- Creating table 'tb_ocupacao'
CREATE TABLE [dbo].[tb_ocupacao] (
    [IdOcupacao] int  NOT NULL,
    [Descricao] varchar(100)  NOT NULL
);
GO

-- Creating table 'tb_paciente'
CREATE TABLE [dbo].[tb_paciente] (
    [IdPaciente] int IDENTITY(1,1) NOT NULL,
    [Nome] varchar(100)  NOT NULL,
    [Foto] longblob  NULL
);
GO

-- Creating table 'tb_paciente_pessoa_turma'
CREATE TABLE [dbo].[tb_paciente_pessoa_turma] (
    [IdPessoa] int  NOT NULL,
    [IdTurma] int  NOT NULL,
    [IdPaciente] int  NOT NULL,
    [IdConsultaFixo] bigint  NOT NULL,
    [IdConsultaVariavel] bigint  NOT NULL,
    [GrupoAtividades] int  NOT NULL,
    [EstadoPreenchimento] int  NOT NULL
);
GO

-- Creating table 'tb_parametro_clinico'
CREATE TABLE [dbo].[tb_parametro_clinico] (
    [IdParametroClinico] int  NOT NULL,
    [ParametroClinico] varchar(100)  NOT NULL
);
GO

-- Creating table 'tb_perfil_usuario'
CREATE TABLE [dbo].[tb_perfil_usuario] (
    [IdPerfil] int  NOT NULL,
    [NomePerfil] varchar(45)  NOT NULL
);
GO

-- Creating table 'tb_pergunta'
CREATE TABLE [dbo].[tb_pergunta] (
    [IdPergunta] int  NOT NULL,
    [Pergunta] varchar(255)  NOT NULL
);
GO

-- Creating table 'tb_pessoa'
CREATE TABLE [dbo].[tb_pessoa] (
    [IdPessoa] int IDENTITY(1,1) NOT NULL,
    [Nome] varchar(50)  NOT NULL
);
GO

-- Creating table 'tb_plano_saude'
CREATE TABLE [dbo].[tb_plano_saude] (
    [IdPlanoSaude] int  NOT NULL,
    [Nome] varchar(100)  NOT NULL
);
GO

-- Creating table 'tb_queixa'
CREATE TABLE [dbo].[tb_queixa] (
    [IdQueixa] int IDENTITY(1,1) NOT NULL,
    [DescricaoQueixa] varchar(100)  NOT NULL,
    [IdSistema] int  NOT NULL
);
GO

-- Creating table 'tb_queixa_medicamentos'
CREATE TABLE [dbo].[tb_queixa_medicamentos] (
    [IdConsultaVariavel] bigint  NOT NULL,
    [IdQueixa] int  NOT NULL,
    [IdMedicamento] int  NOT NULL,
    [SuspeitaIdAcaoQueixa] int  NOT NULL,
    [Dose] varchar(20)  NULL,
    [Desde] varchar(40)  NULL,
    [Necessario] bool  NOT NULL,
    [Efetivo] bool  NOT NULL,
    [Seguro] bool  NOT NULL,
    [Cumprimento] bool  NOT NULL,
    [IdAcaoAlternativa1] int  NOT NULL,
    [IdAcaoAlternativa2] int  NOT NULL
);
GO

-- Creating table 'tb_razao_encontro'
CREATE TABLE [dbo].[tb_razao_encontro] (
    [IdRazaoEncontro] int  NOT NULL,
    [DescricaoRazao] varchar(100)  NOT NULL
);
GO

-- Creating table 'tb_relato_clinico'
CREATE TABLE [dbo].[tb_relato_clinico] (
    [IdRelato] int IDENTITY(1,1) NOT NULL,
    [IdPaciente] int  NOT NULL,
    [OrdemCronologia] int  NOT NULL,
    [RelatoTextual] varchar(65535)  NULL,
    [RelatoVideo] longblob  NULL,
    [NivelDificuldade] int  NOT NULL
);
GO

-- Creating table 'tb_resposta'
CREATE TABLE [dbo].[tb_resposta] (
    [IdResposta] int  NOT NULL,
    [Resposta] varchar(255)  NOT NULL,
    [IdPergunta] int  NOT NULL
);
GO

-- Creating table 'tb_sistema'
CREATE TABLE [dbo].[tb_sistema] (
    [IdSistema] int IDENTITY(1,1) NOT NULL,
    [NomeSistema] varchar(100)  NOT NULL
);
GO

-- Creating table 'tb_turma'
CREATE TABLE [dbo].[tb_turma] (
    [IdTurma] int IDENTITY(1,1) NOT NULL,
    [Codigo] varchar(2)  NULL,
    [Periodo] varchar(6)  NULL,
    [IdDisciplina] int  NOT NULL,
    [IdInstituicao] int  NOT NULL
);
GO

-- Creating table 'tb_turma_pessoa'
CREATE TABLE [dbo].[tb_turma_pessoa] (
    [IdTurma] int  NOT NULL,
    [IdPessoa] int  NOT NULL
);
GO

-- Creating table 'tb_turma_pessoa_relato'
CREATE TABLE [dbo].[tb_turma_pessoa_relato] (
    [IdTurma] int  NOT NULL,
    [IdPessoa] int  NOT NULL,
    [IdRelato] int  NOT NULL
);
GO

-- Creating table 'tb_usuario'
CREATE TABLE [dbo].[tb_usuario] (
    [IdUsuario] bigint IDENTITY(1,1) NOT NULL,
    [Cpf] varchar(11)  NOT NULL,
    [NomeUsuario] varchar(50)  NOT NULL,
    [Email] varchar(50)  NOT NULL,
    [Login] varchar(50)  NOT NULL,
    [Senha] varchar(50)  NOT NULL,
    [tpUsuario] varchar(255)  NULL
);
GO

-- Creating table 'tb_usuario_turma'
CREATE TABLE [dbo].[tb_usuario_turma] (
    [IdTurma] int  NOT NULL,
    [IdUsuario] bigint  NOT NULL,
    [IdPerfilUsuario] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [login] in table 'alunoes'
ALTER TABLE [dbo].[alunoes]
ADD CONSTRAINT [PK_alunoes]
    PRIMARY KEY CLUSTERED ([login] ASC);
GO

-- Creating primary key on [id] in table 'casoclinicoes'
ALTER TABLE [dbo].[casoclinicoes]
ADD CONSTRAINT [PK_casoclinicoes]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'consultas'
ALTER TABLE [dbo].[consultas]
ADD CONSTRAINT [PK_consultas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'intervencaos'
ALTER TABLE [dbo].[intervencaos]
ADD CONSTRAINT [PK_intervencaos]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'intervencaorespostaquartas'
ALTER TABLE [dbo].[intervencaorespostaquartas]
ADD CONSTRAINT [PK_intervencaorespostaquartas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'intervencaorespostasegundas'
ALTER TABLE [dbo].[intervencaorespostasegundas]
ADD CONSTRAINT [PK_intervencaorespostasegundas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'medicamentonaoprescritoes'
ALTER TABLE [dbo].[medicamentonaoprescritoes]
ADD CONSTRAINT [PK_medicamentonaoprescritoes]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'medicamentoprescritoes'
ALTER TABLE [dbo].[medicamentoprescritoes]
ADD CONSTRAINT [PK_medicamentoprescritoes]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'medicamentoqueixas'
ALTER TABLE [dbo].[medicamentoqueixas]
ADD CONSTRAINT [PK_medicamentoqueixas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'medicamentoqueixaquartas'
ALTER TABLE [dbo].[medicamentoqueixaquartas]
ADD CONSTRAINT [PK_medicamentoqueixaquartas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'medicamentoqueixasegundas'
ALTER TABLE [dbo].[medicamentoqueixasegundas]
ADD CONSTRAINT [PK_medicamentoqueixasegundas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'parametroclinicoes'
ALTER TABLE [dbo].[parametroclinicoes]
ADD CONSTRAINT [PK_parametroclinicoes]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'queixas'
ALTER TABLE [dbo].[queixas]
ADD CONSTRAINT [PK_queixas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'queixarespostaprimeiras'
ALTER TABLE [dbo].[queixarespostaprimeiras]
ADD CONSTRAINT [PK_queixarespostaprimeiras]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'queixarespostaquartas'
ALTER TABLE [dbo].[queixarespostaquartas]
ADD CONSTRAINT [PK_queixarespostaquartas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'queixarespostasegundas'
ALTER TABLE [dbo].[queixarespostasegundas]
ADD CONSTRAINT [PK_queixarespostasegundas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'queixarespostaterceiras'
ALTER TABLE [dbo].[queixarespostaterceiras]
ADD CONSTRAINT [PK_queixarespostaterceiras]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'respostaprimeiras'
ALTER TABLE [dbo].[respostaprimeiras]
ADD CONSTRAINT [PK_respostaprimeiras]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'respostaquartas'
ALTER TABLE [dbo].[respostaquartas]
ADD CONSTRAINT [PK_respostaquartas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'respostasegundas'
ALTER TABLE [dbo].[respostasegundas]
ADD CONSTRAINT [PK_respostasegundas]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'respostaterceiras'
ALTER TABLE [dbo].[respostaterceiras]
ADD CONSTRAINT [PK_respostaterceiras]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [IdAcaoAlternativa] in table 'tb_acao_alternativa'
ALTER TABLE [dbo].[tb_acao_alternativa]
ADD CONSTRAINT [PK_tb_acao_alternativa]
    PRIMARY KEY CLUSTERED ([IdAcaoAlternativa] ASC);
GO

-- Creating primary key on [IdAcaoQueixa] in table 'tb_acao_queixa'
ALTER TABLE [dbo].[tb_acao_queixa]
ADD CONSTRAINT [PK_tb_acao_queixa]
    PRIMARY KEY CLUSTERED ([IdAcaoQueixa] ASC);
GO

-- Creating primary key on [IdAlergia] in table 'tb_alergia'
ALTER TABLE [dbo].[tb_alergia]
ADD CONSTRAINT [PK_tb_alergia]
    PRIMARY KEY CLUSTERED ([IdAlergia] ASC);
GO

-- Creating primary key on [IdAlergia], [IdConsultaVariavel] in table 'tb_alergia_exames_fisicos'
ALTER TABLE [dbo].[tb_alergia_exames_fisicos]
ADD CONSTRAINT [PK_tb_alergia_exames_fisicos]
    PRIMARY KEY CLUSTERED ([IdAlergia], [IdConsultaVariavel] ASC);
GO

-- Creating primary key on [IdConsultaFixo] in table 'tb_consulta_fixo'
ALTER TABLE [dbo].[tb_consulta_fixo]
ADD CONSTRAINT [PK_tb_consulta_fixo]
    PRIMARY KEY CLUSTERED ([IdConsultaFixo] ASC);
GO

-- Creating primary key on [IdConsultaVariavel], [IdParamentoClinico] in table 'tb_consulta_parametro'
ALTER TABLE [dbo].[tb_consulta_parametro]
ADD CONSTRAINT [PK_tb_consulta_parametro]
    PRIMARY KEY CLUSTERED ([IdConsultaVariavel], [IdParamentoClinico] ASC);
GO

-- Creating primary key on [IdConsultaVariavel] in table 'tb_consulta_variavel'
ALTER TABLE [dbo].[tb_consulta_variavel]
ADD CONSTRAINT [PK_tb_consulta_variavel]
    PRIMARY KEY CLUSTERED ([IdConsultaVariavel] ASC);
GO

-- Creating primary key on [IdConsultaVariavel], [IdQueixa] in table 'tb_consulta_variavel_queixa'
ALTER TABLE [dbo].[tb_consulta_variavel_queixa]
ADD CONSTRAINT [PK_tb_consulta_variavel_queixa]
    PRIMARY KEY CLUSTERED ([IdConsultaVariavel], [IdQueixa] ASC);
GO

-- Creating primary key on [IdCurso] in table 'tb_curso'
ALTER TABLE [dbo].[tb_curso]
ADD CONSTRAINT [PK_tb_curso]
    PRIMARY KEY CLUSTERED ([IdCurso] ASC);
GO

-- Creating primary key on [IdCurso], [IdDisciplina] in table 'tb_curso_disciplina'
ALTER TABLE [dbo].[tb_curso_disciplina]
ADD CONSTRAINT [PK_tb_curso_disciplina]
    PRIMARY KEY CLUSTERED ([IdCurso], [IdDisciplina] ASC);
GO

-- Creating primary key on [IdConsultaFixo] in table 'tb_demograficos_antropometricos'
ALTER TABLE [dbo].[tb_demograficos_antropometricos]
ADD CONSTRAINT [PK_tb_demograficos_antropometricos]
    PRIMARY KEY CLUSTERED ([IdConsultaFixo] ASC);
GO

-- Creating primary key on [IdConsultaFixo], [IdMedicamento] in table 'tb_diario_pessoal'
ALTER TABLE [dbo].[tb_diario_pessoal]
ADD CONSTRAINT [PK_tb_diario_pessoal]
    PRIMARY KEY CLUSTERED ([IdConsultaFixo], [IdMedicamento] ASC);
GO

-- Creating primary key on [IdDisciplina] in table 'tb_disciplina'
ALTER TABLE [dbo].[tb_disciplina]
ADD CONSTRAINT [PK_tb_disciplina]
    PRIMARY KEY CLUSTERED ([IdDisciplina] ASC);
GO

-- Creating primary key on [IdEscolaridade] in table 'tb_escolaridade'
ALTER TABLE [dbo].[tb_escolaridade]
ADD CONSTRAINT [PK_tb_escolaridade]
    PRIMARY KEY CLUSTERED ([IdEscolaridade] ASC);
GO

-- Creating primary key on [IdConsultaVariavel] in table 'tb_estilo_vida'
ALTER TABLE [dbo].[tb_estilo_vida]
ADD CONSTRAINT [PK_tb_estilo_vida]
    PRIMARY KEY CLUSTERED ([IdConsultaVariavel] ASC);
GO

-- Creating primary key on [IdConsultaVariavel] in table 'tb_exames_fisicos'
ALTER TABLE [dbo].[tb_exames_fisicos]
ADD CONSTRAINT [PK_tb_exames_fisicos]
    PRIMARY KEY CLUSTERED ([IdConsultaVariavel] ASC);
GO

-- Creating primary key on [IdConsultaFixo] in table 'tb_experiencia_medicamentos'
ALTER TABLE [dbo].[tb_experiencia_medicamentos]
ADD CONSTRAINT [PK_tb_experiencia_medicamentos]
    PRIMARY KEY CLUSTERED ([IdConsultaFixo] ASC);
GO

-- Creating primary key on [IdConsultaFixo] in table 'tb_historia'
ALTER TABLE [dbo].[tb_historia]
ADD CONSTRAINT [PK_tb_historia]
    PRIMARY KEY CLUSTERED ([IdConsultaFixo] ASC);
GO

-- Creating primary key on [IdHistorico] in table 'tb_historico'
ALTER TABLE [dbo].[tb_historico]
ADD CONSTRAINT [PK_tb_historico]
    PRIMARY KEY CLUSTERED ([IdHistorico] ASC);
GO

-- Creating primary key on [IdInstituicao] in table 'tb_instituicao'
ALTER TABLE [dbo].[tb_instituicao]
ADD CONSTRAINT [PK_tb_instituicao]
    PRIMARY KEY CLUSTERED ([IdInstituicao] ASC);
GO

-- Creating primary key on [IdConsultaVariavel], [IdMedicamento] in table 'tb_medicamento_nao_prescrito'
ALTER TABLE [dbo].[tb_medicamento_nao_prescrito]
ADD CONSTRAINT [PK_tb_medicamento_nao_prescrito]
    PRIMARY KEY CLUSTERED ([IdConsultaVariavel], [IdMedicamento] ASC);
GO

-- Creating primary key on [IdConsultaVariavel], [IdMedicamento] in table 'tb_medicamento_prescrito'
ALTER TABLE [dbo].[tb_medicamento_prescrito]
ADD CONSTRAINT [PK_tb_medicamento_prescrito]
    PRIMARY KEY CLUSTERED ([IdConsultaVariavel], [IdMedicamento] ASC);
GO

-- Creating primary key on [IdMedicamento] in table 'tb_medicamentos'
ALTER TABLE [dbo].[tb_medicamentos]
ADD CONSTRAINT [PK_tb_medicamentos]
    PRIMARY KEY CLUSTERED ([IdMedicamento] ASC);
GO

-- Creating primary key on [IdConsultaVariavel], [IdMedicamento] in table 'tb_medicamentos_anteriores'
ALTER TABLE [dbo].[tb_medicamentos_anteriores]
ADD CONSTRAINT [PK_tb_medicamentos_anteriores]
    PRIMARY KEY CLUSTERED ([IdConsultaVariavel], [IdMedicamento] ASC);
GO

-- Creating primary key on [IdOcupacao] in table 'tb_ocupacao'
ALTER TABLE [dbo].[tb_ocupacao]
ADD CONSTRAINT [PK_tb_ocupacao]
    PRIMARY KEY CLUSTERED ([IdOcupacao] ASC);
GO

-- Creating primary key on [IdPaciente] in table 'tb_paciente'
ALTER TABLE [dbo].[tb_paciente]
ADD CONSTRAINT [PK_tb_paciente]
    PRIMARY KEY CLUSTERED ([IdPaciente] ASC);
GO

-- Creating primary key on [IdPessoa], [IdTurma], [IdPaciente] in table 'tb_paciente_pessoa_turma'
ALTER TABLE [dbo].[tb_paciente_pessoa_turma]
ADD CONSTRAINT [PK_tb_paciente_pessoa_turma]
    PRIMARY KEY CLUSTERED ([IdPessoa], [IdTurma], [IdPaciente] ASC);
GO

-- Creating primary key on [IdParametroClinico] in table 'tb_parametro_clinico'
ALTER TABLE [dbo].[tb_parametro_clinico]
ADD CONSTRAINT [PK_tb_parametro_clinico]
    PRIMARY KEY CLUSTERED ([IdParametroClinico] ASC);
GO

-- Creating primary key on [IdPerfil] in table 'tb_perfil_usuario'
ALTER TABLE [dbo].[tb_perfil_usuario]
ADD CONSTRAINT [PK_tb_perfil_usuario]
    PRIMARY KEY CLUSTERED ([IdPerfil] ASC);
GO

-- Creating primary key on [IdPergunta] in table 'tb_pergunta'
ALTER TABLE [dbo].[tb_pergunta]
ADD CONSTRAINT [PK_tb_pergunta]
    PRIMARY KEY CLUSTERED ([IdPergunta] ASC);
GO

-- Creating primary key on [IdPessoa] in table 'tb_pessoa'
ALTER TABLE [dbo].[tb_pessoa]
ADD CONSTRAINT [PK_tb_pessoa]
    PRIMARY KEY CLUSTERED ([IdPessoa] ASC);
GO

-- Creating primary key on [IdPlanoSaude] in table 'tb_plano_saude'
ALTER TABLE [dbo].[tb_plano_saude]
ADD CONSTRAINT [PK_tb_plano_saude]
    PRIMARY KEY CLUSTERED ([IdPlanoSaude] ASC);
GO

-- Creating primary key on [IdQueixa] in table 'tb_queixa'
ALTER TABLE [dbo].[tb_queixa]
ADD CONSTRAINT [PK_tb_queixa]
    PRIMARY KEY CLUSTERED ([IdQueixa] ASC);
GO

-- Creating primary key on [IdConsultaVariavel], [IdQueixa], [IdMedicamento] in table 'tb_queixa_medicamentos'
ALTER TABLE [dbo].[tb_queixa_medicamentos]
ADD CONSTRAINT [PK_tb_queixa_medicamentos]
    PRIMARY KEY CLUSTERED ([IdConsultaVariavel], [IdQueixa], [IdMedicamento] ASC);
GO

-- Creating primary key on [IdRazaoEncontro] in table 'tb_razao_encontro'
ALTER TABLE [dbo].[tb_razao_encontro]
ADD CONSTRAINT [PK_tb_razao_encontro]
    PRIMARY KEY CLUSTERED ([IdRazaoEncontro] ASC);
GO

-- Creating primary key on [IdRelato] in table 'tb_relato_clinico'
ALTER TABLE [dbo].[tb_relato_clinico]
ADD CONSTRAINT [PK_tb_relato_clinico]
    PRIMARY KEY CLUSTERED ([IdRelato] ASC);
GO

-- Creating primary key on [IdResposta] in table 'tb_resposta'
ALTER TABLE [dbo].[tb_resposta]
ADD CONSTRAINT [PK_tb_resposta]
    PRIMARY KEY CLUSTERED ([IdResposta] ASC);
GO

-- Creating primary key on [IdSistema] in table 'tb_sistema'
ALTER TABLE [dbo].[tb_sistema]
ADD CONSTRAINT [PK_tb_sistema]
    PRIMARY KEY CLUSTERED ([IdSistema] ASC);
GO

-- Creating primary key on [IdTurma] in table 'tb_turma'
ALTER TABLE [dbo].[tb_turma]
ADD CONSTRAINT [PK_tb_turma]
    PRIMARY KEY CLUSTERED ([IdTurma] ASC);
GO

-- Creating primary key on [IdTurma], [IdPessoa] in table 'tb_turma_pessoa'
ALTER TABLE [dbo].[tb_turma_pessoa]
ADD CONSTRAINT [PK_tb_turma_pessoa]
    PRIMARY KEY CLUSTERED ([IdTurma], [IdPessoa] ASC);
GO

-- Creating primary key on [IdTurma], [IdPessoa], [IdRelato] in table 'tb_turma_pessoa_relato'
ALTER TABLE [dbo].[tb_turma_pessoa_relato]
ADD CONSTRAINT [PK_tb_turma_pessoa_relato]
    PRIMARY KEY CLUSTERED ([IdTurma], [IdPessoa], [IdRelato] ASC);
GO

-- Creating primary key on [IdUsuario] in table 'tb_usuario'
ALTER TABLE [dbo].[tb_usuario]
ADD CONSTRAINT [PK_tb_usuario]
    PRIMARY KEY CLUSTERED ([IdUsuario] ASC);
GO

-- Creating primary key on [IdTurma], [IdUsuario] in table 'tb_usuario_turma'
ALTER TABLE [dbo].[tb_usuario_turma]
ADD CONSTRAINT [PK_tb_usuario_turma]
    PRIMARY KEY CLUSTERED ([IdTurma], [IdUsuario] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [fkConsultaAtual] in table 'alunoes'
ALTER TABLE [dbo].[alunoes]
ADD CONSTRAINT [FK_aluno_2]
    FOREIGN KEY ([fkConsultaAtual])
    REFERENCES [dbo].[consultas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_aluno_2'
CREATE INDEX [IX_FK_aluno_2]
ON [dbo].[alunoes]
    ([fkConsultaAtual]);
GO

-- Creating foreign key on [fkAluno] in table 'consultas'
ALTER TABLE [dbo].[consultas]
ADD CONSTRAINT [FK_consulta_2]
    FOREIGN KEY ([fkAluno])
    REFERENCES [dbo].[alunoes]
        ([login])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_consulta_2'
CREATE INDEX [IX_FK_consulta_2]
ON [dbo].[consultas]
    ([fkAluno]);
GO

-- Creating foreign key on [fkConsultaAtual] in table 'alunoes'
ALTER TABLE [dbo].[alunoes]
ADD CONSTRAINT [FK_FK589C4EBDD526F1E]
    FOREIGN KEY ([fkConsultaAtual])
    REFERENCES [dbo].[consultas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK589C4EBDD526F1E'
CREATE INDEX [IX_FK_FK589C4EBDD526F1E]
ON [dbo].[alunoes]
    ([fkConsultaAtual]);
GO

-- Creating foreign key on [fkAluno] in table 'consultas'
ALTER TABLE [dbo].[consultas]
ADD CONSTRAINT [FK_FKDE2881F52977839B]
    FOREIGN KEY ([fkAluno])
    REFERENCES [dbo].[alunoes]
        ([login])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKDE2881F52977839B'
CREATE INDEX [IX_FK_FKDE2881F52977839B]
ON [dbo].[consultas]
    ([fkAluno]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'consultas'
ALTER TABLE [dbo].[consultas]
ADD CONSTRAINT [FK_Consulta_1]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinicoes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Consulta_1'
CREATE INDEX [IX_FK_Consulta_1]
ON [dbo].[consultas]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'intervencaos'
ALTER TABLE [dbo].[intervencaos]
ADD CONSTRAINT [FK_FK91D9EFAE8A1319FF]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinicoes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK91D9EFAE8A1319FF'
CREATE INDEX [IX_FK_FK91D9EFAE8A1319FF]
ON [dbo].[intervencaos]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'medicamentoprescritoes'
ALTER TABLE [dbo].[medicamentoprescritoes]
ADD CONSTRAINT [FK_FKAA358BEF8A1319FF]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinicoes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKAA358BEF8A1319FF'
CREATE INDEX [IX_FK_FKAA358BEF8A1319FF]
ON [dbo].[medicamentoprescritoes]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'parametroclinicoes'
ALTER TABLE [dbo].[parametroclinicoes]
ADD CONSTRAINT [FK_FKAAEE312E8A1319FF]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinicoes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKAAEE312E8A1319FF'
CREATE INDEX [IX_FK_FKAAEE312E8A1319FF]
ON [dbo].[parametroclinicoes]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'medicamentonaoprescritoes'
ALTER TABLE [dbo].[medicamentonaoprescritoes]
ADD CONSTRAINT [FK_FKBF69A97F8A1319FF]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinicoes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKBF69A97F8A1319FF'
CREATE INDEX [IX_FK_FKBF69A97F8A1319FF]
ON [dbo].[medicamentonaoprescritoes]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'queixas'
ALTER TABLE [dbo].[queixas]
ADD CONSTRAINT [FK_FKC773DEB18A1319FF]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinicoes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKC773DEB18A1319FF'
CREATE INDEX [IX_FK_FKC773DEB18A1319FF]
ON [dbo].[queixas]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'consultas'
ALTER TABLE [dbo].[consultas]
ADD CONSTRAINT [FK_FKDE2881F58A1319FF]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinicoes]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKDE2881F58A1319FF'
CREATE INDEX [IX_FK_FKDE2881F58A1319FF]
ON [dbo].[consultas]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostaterceiras'
ALTER TABLE [dbo].[respostaterceiras]
ADD CONSTRAINT [FK_respostaalunoterceira_1]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consultas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_respostaalunoterceira_1'
CREATE INDEX [IX_FK_respostaalunoterceira_1]
ON [dbo].[respostaterceiras]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostaprimeiras'
ALTER TABLE [dbo].[respostaprimeiras]
ADD CONSTRAINT [FK_respostaprimeira_1]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consultas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_respostaprimeira_1'
CREATE INDEX [IX_FK_respostaprimeira_1]
ON [dbo].[respostaprimeiras]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostaquartas'
ALTER TABLE [dbo].[respostaquartas]
ADD CONSTRAINT [FK_respostaquarta_1]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consultas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_respostaquarta_1'
CREATE INDEX [IX_FK_respostaquarta_1]
ON [dbo].[respostaquartas]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostasegundas'
ALTER TABLE [dbo].[respostasegundas]
ADD CONSTRAINT [FK_respostasegunda_1]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consultas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_respostasegunda_1'
CREATE INDEX [IX_FK_respostasegunda_1]
ON [dbo].[respostasegundas]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostaterceiras'
ALTER TABLE [dbo].[respostaterceiras]
ADD CONSTRAINT [FK_FK877B3B565097F805]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consultas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK877B3B565097F805'
CREATE INDEX [IX_FK_FK877B3B565097F805]
ON [dbo].[respostaterceiras]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostaprimeiras'
ALTER TABLE [dbo].[respostaprimeiras]
ADD CONSTRAINT [FK_FK88D8D79A5097F805]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consultas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK88D8D79A5097F805'
CREATE INDEX [IX_FK_FK88D8D79A5097F805]
ON [dbo].[respostaprimeiras]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostaquartas'
ALTER TABLE [dbo].[respostaquartas]
ADD CONSTRAINT [FK_FKB29DB8E35097F805]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consultas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKB29DB8E35097F805'
CREATE INDEX [IX_FK_FKB29DB8E35097F805]
ON [dbo].[respostaquartas]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostasegundas'
ALTER TABLE [dbo].[respostasegundas]
ADD CONSTRAINT [FK_FKEFEE246A5097F805]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consultas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKEFEE246A5097F805'
CREATE INDEX [IX_FK_FKEFEE246A5097F805]
ON [dbo].[respostasegundas]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkResposta4] in table 'intervencaorespostaquartas'
ALTER TABLE [dbo].[intervencaorespostaquartas]
ADD CONSTRAINT [FK_intervencaorespostaquarta_1]
    FOREIGN KEY ([fkResposta4])
    REFERENCES [dbo].[respostaquartas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_intervencaorespostaquarta_1'
CREATE INDEX [IX_FK_intervencaorespostaquarta_1]
ON [dbo].[intervencaorespostaquartas]
    ([fkResposta4]);
GO

-- Creating foreign key on [fkResposta4] in table 'intervencaorespostaquartas'
ALTER TABLE [dbo].[intervencaorespostaquartas]
ADD CONSTRAINT [FK_FK800BA011D2B646E7]
    FOREIGN KEY ([fkResposta4])
    REFERENCES [dbo].[respostaquartas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK800BA011D2B646E7'
CREATE INDEX [IX_FK_FK800BA011D2B646E7]
ON [dbo].[intervencaorespostaquartas]
    ([fkResposta4]);
GO

-- Creating foreign key on [fkResposta2] in table 'intervencaorespostasegundas'
ALTER TABLE [dbo].[intervencaorespostasegundas]
ADD CONSTRAINT [FK_intervencaorespostasegunda_1]
    FOREIGN KEY ([fkResposta2])
    REFERENCES [dbo].[respostasegundas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_intervencaorespostasegunda_1'
CREATE INDEX [IX_FK_intervencaorespostasegunda_1]
ON [dbo].[intervencaorespostasegundas]
    ([fkResposta2]);
GO

-- Creating foreign key on [fkResposta2] in table 'intervencaorespostasegundas'
ALTER TABLE [dbo].[intervencaorespostasegundas]
ADD CONSTRAINT [FK_FKD03D22FCA4FE1140]
    FOREIGN KEY ([fkResposta2])
    REFERENCES [dbo].[respostasegundas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKD03D22FCA4FE1140'
CREATE INDEX [IX_FK_FKD03D22FCA4FE1140]
ON [dbo].[intervencaorespostasegundas]
    ([fkResposta2]);
GO

-- Creating foreign key on [fkQueixa] in table 'medicamentoqueixas'
ALTER TABLE [dbo].[medicamentoqueixas]
ADD CONSTRAINT [FK_medicamentoqueixa_1]
    FOREIGN KEY ([fkQueixa])
    REFERENCES [dbo].[queixas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_medicamentoqueixa_1'
CREATE INDEX [IX_FK_medicamentoqueixa_1]
ON [dbo].[medicamentoqueixas]
    ([fkQueixa]);
GO

-- Creating foreign key on [fkQueixa] in table 'medicamentoqueixas'
ALTER TABLE [dbo].[medicamentoqueixas]
ADD CONSTRAINT [FK_FK8099C4A73D02FC3D]
    FOREIGN KEY ([fkQueixa])
    REFERENCES [dbo].[queixas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK8099C4A73D02FC3D'
CREATE INDEX [IX_FK_FK8099C4A73D02FC3D]
ON [dbo].[medicamentoqueixas]
    ([fkQueixa]);
GO

-- Creating foreign key on [fkQueixaQuarta] in table 'medicamentoqueixaquartas'
ALTER TABLE [dbo].[medicamentoqueixaquartas]
ADD CONSTRAINT [FK_medicamentoqueixaquarta_1]
    FOREIGN KEY ([fkQueixaQuarta])
    REFERENCES [dbo].[queixarespostaquartas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_medicamentoqueixaquarta_1'
CREATE INDEX [IX_FK_medicamentoqueixaquarta_1]
ON [dbo].[medicamentoqueixaquartas]
    ([fkQueixaQuarta]);
GO

-- Creating foreign key on [fkQueixaQuarta] in table 'medicamentoqueixaquartas'
ALTER TABLE [dbo].[medicamentoqueixaquartas]
ADD CONSTRAINT [FK_FK78D999E947C18322]
    FOREIGN KEY ([fkQueixaQuarta])
    REFERENCES [dbo].[queixarespostaquartas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK78D999E947C18322'
CREATE INDEX [IX_FK_FK78D999E947C18322]
ON [dbo].[medicamentoqueixaquartas]
    ([fkQueixaQuarta]);
GO

-- Creating foreign key on [fkQueixaSegunda] in table 'medicamentoqueixasegundas'
ALTER TABLE [dbo].[medicamentoqueixasegundas]
ADD CONSTRAINT [FK_medicamentoqueixasegunda_1]
    FOREIGN KEY ([fkQueixaSegunda])
    REFERENCES [dbo].[queixarespostasegundas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_medicamentoqueixasegunda_1'
CREATE INDEX [IX_FK_medicamentoqueixasegunda_1]
ON [dbo].[medicamentoqueixasegundas]
    ([fkQueixaSegunda]);
GO

-- Creating foreign key on [fkQueixaSegunda] in table 'medicamentoqueixasegundas'
ALTER TABLE [dbo].[medicamentoqueixasegundas]
ADD CONSTRAINT [FK_FKF12E64244E1862F8]
    FOREIGN KEY ([fkQueixaSegunda])
    REFERENCES [dbo].[queixarespostasegundas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKF12E64244E1862F8'
CREATE INDEX [IX_FK_FKF12E64244E1862F8]
ON [dbo].[medicamentoqueixasegundas]
    ([fkQueixaSegunda]);
GO

-- Creating foreign key on [fkResposta] in table 'queixarespostaprimeiras'
ALTER TABLE [dbo].[queixarespostaprimeiras]
ADD CONSTRAINT [FK_queixarespostaprimeira_1]
    FOREIGN KEY ([fkResposta])
    REFERENCES [dbo].[respostaprimeiras]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_queixarespostaprimeira_1'
CREATE INDEX [IX_FK_queixarespostaprimeira_1]
ON [dbo].[queixarespostaprimeiras]
    ([fkResposta]);
GO

-- Creating foreign key on [fkResposta] in table 'queixarespostaprimeiras'
ALTER TABLE [dbo].[queixarespostaprimeiras]
ADD CONSTRAINT [FK_FK1E43344B8872A0F6]
    FOREIGN KEY ([fkResposta])
    REFERENCES [dbo].[respostaprimeiras]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK1E43344B8872A0F6'
CREATE INDEX [IX_FK_FK1E43344B8872A0F6]
ON [dbo].[queixarespostaprimeiras]
    ([fkResposta]);
GO

-- Creating foreign key on [fkResposta4] in table 'queixarespostaquartas'
ALTER TABLE [dbo].[queixarespostaquartas]
ADD CONSTRAINT [FK_queixarespostaquarta_1]
    FOREIGN KEY ([fkResposta4])
    REFERENCES [dbo].[respostaquartas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_queixarespostaquarta_1'
CREATE INDEX [IX_FK_queixarespostaquarta_1]
ON [dbo].[queixarespostaquartas]
    ([fkResposta4]);
GO

-- Creating foreign key on [fkResposta4] in table 'queixarespostaquartas'
ALTER TABLE [dbo].[queixarespostaquartas]
ADD CONSTRAINT [FK_FK5BA98DD4D2B646E7]
    FOREIGN KEY ([fkResposta4])
    REFERENCES [dbo].[respostaquartas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK5BA98DD4D2B646E7'
CREATE INDEX [IX_FK_FK5BA98DD4D2B646E7]
ON [dbo].[queixarespostaquartas]
    ([fkResposta4]);
GO

-- Creating foreign key on [fkResposta2] in table 'queixarespostasegundas'
ALTER TABLE [dbo].[queixarespostasegundas]
ADD CONSTRAINT [FK_FK685CED99A4FE1140]
    FOREIGN KEY ([fkResposta2])
    REFERENCES [dbo].[respostasegundas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK685CED99A4FE1140'
CREATE INDEX [IX_FK_FK685CED99A4FE1140]
ON [dbo].[queixarespostasegundas]
    ([fkResposta2]);
GO

-- Creating foreign key on [fkResposta2] in table 'queixarespostasegundas'
ALTER TABLE [dbo].[queixarespostasegundas]
ADD CONSTRAINT [FK_FKFD098D39A4FE1140]
    FOREIGN KEY ([fkResposta2])
    REFERENCES [dbo].[respostasegundas]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKFD098D39A4FE1140'
CREATE INDEX [IX_FK_FKFD098D39A4FE1140]
ON [dbo].[queixarespostasegundas]
    ([fkResposta2]);
GO

-- Creating foreign key on [fkResposta] in table 'queixarespostaterceiras'
ALTER TABLE [dbo].[queixarespostaterceiras]
ADD CONSTRAINT [FK_queixarespostaterceira_1]
    FOREIGN KEY ([fkResposta])
    REFERENCES [dbo].[respostaterceiras]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_queixarespostaterceira_1'
CREATE INDEX [IX_FK_queixarespostaterceira_1]
ON [dbo].[queixarespostaterceiras]
    ([fkResposta]);
GO

-- Creating foreign key on [fkResposta] in table 'queixarespostaterceiras'
ALTER TABLE [dbo].[queixarespostaterceiras]
ADD CONSTRAINT [FK_FK1CE59807871504B2]
    FOREIGN KEY ([fkResposta])
    REFERENCES [dbo].[respostaterceiras]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK1CE59807871504B2'
CREATE INDEX [IX_FK_FK1CE59807871504B2]
ON [dbo].[queixarespostaterceiras]
    ([fkResposta]);
GO

-- Creating foreign key on [IdConsultaFixo] in table 'tb_paciente_pessoa_turma'
ALTER TABLE [dbo].[tb_paciente_pessoa_turma]
ADD CONSTRAINT [fk_tb_paciente_pessoa_turma_tb_consulta_fixo1]
    FOREIGN KEY ([IdConsultaFixo])
    REFERENCES [dbo].[tb_consulta_fixo]
        ([IdConsultaFixo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_paciente_pessoa_turma_tb_consulta_fixo1'
CREATE INDEX [IX_fk_tb_paciente_pessoa_turma_tb_consulta_fixo1]
ON [dbo].[tb_paciente_pessoa_turma]
    ([IdConsultaFixo]);
GO

-- Creating foreign key on [IdConsultaVariavel] in table 'tb_paciente_pessoa_turma'
ALTER TABLE [dbo].[tb_paciente_pessoa_turma]
ADD CONSTRAINT [fk_tb_paciente_pessoa_turma_tb_consulta_variavel1]
    FOREIGN KEY ([IdConsultaVariavel])
    REFERENCES [dbo].[tb_consulta_variavel]
        ([IdConsultaVariavel])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_paciente_pessoa_turma_tb_consulta_variavel1'
CREATE INDEX [IX_fk_tb_paciente_pessoa_turma_tb_consulta_variavel1]
ON [dbo].[tb_paciente_pessoa_turma]
    ([IdConsultaVariavel]);
GO

-- Creating foreign key on [IdPaciente] in table 'tb_paciente_pessoa_turma'
ALTER TABLE [dbo].[tb_paciente_pessoa_turma]
ADD CONSTRAINT [fk_tb_paciente_pessoa_turma_tb_paciente1]
    FOREIGN KEY ([IdPaciente])
    REFERENCES [dbo].[tb_paciente]
        ([IdPaciente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_paciente_pessoa_turma_tb_paciente1'
CREATE INDEX [IX_fk_tb_paciente_pessoa_turma_tb_paciente1]
ON [dbo].[tb_paciente_pessoa_turma]
    ([IdPaciente]);
GO

-- Creating foreign key on [IdTurma], [IdPessoa] in table 'tb_paciente_pessoa_turma'
ALTER TABLE [dbo].[tb_paciente_pessoa_turma]
ADD CONSTRAINT [fk_tb_paciente_pessoa_turma_tb_turma_has_tb_pessoa1]
    FOREIGN KEY ([IdTurma], [IdPessoa])
    REFERENCES [dbo].[tb_turma_pessoa]
        ([IdTurma], [IdPessoa])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------