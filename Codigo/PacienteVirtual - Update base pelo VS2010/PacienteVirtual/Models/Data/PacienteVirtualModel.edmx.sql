
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 05/20/2013 12:45:02
-- Generated from EDMX file: D:\Projetos\PV\virtualpatient - Cópia\Codigo\PacienteVirtual\PacienteVirtual\Models\Data\PacienteVirtualModel.edmx
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
IF OBJECT_ID(N'[pv1].[FK_Curso_Instituicao]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_curso] DROP CONSTRAINT [FK_Curso_Instituicao];
GO
IF OBJECT_ID(N'[pv1].[FK_Instituicao]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_turma] DROP CONSTRAINT [FK_Instituicao];
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
IF OBJECT_ID(N'[pv1].[fk_tb_consulta_variavel_has_tb_medicamentos_tb_consulta_varia1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_medicamentos_anteriores] DROP CONSTRAINT [fk_tb_consulta_variavel_has_tb_medicamentos_tb_consulta_varia1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_consulta_variavel_has_tb_medicamentos_tb_consulta_varia2]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_medicamento_prescrito] DROP CONSTRAINT [fk_tb_consulta_variavel_has_tb_medicamentos_tb_consulta_varia2];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_medicamentos_anteriores] DROP CONSTRAINT [fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos2]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_medicamento_prescrito] DROP CONSTRAINT [fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos2];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_consulta_variavel_has_tb_parametro_clinico_tb_consulta_1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_consulta_parametro] DROP CONSTRAINT [fk_tb_consulta_variavel_has_tb_parametro_clinico_tb_consulta_1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_consulta_variavel_has_tb_parametro_clinico_tb_parametro1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_consulta_parametro] DROP CONSTRAINT [fk_tb_consulta_variavel_has_tb_parametro_clinico_tb_parametro1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_consulta_variavel_tb_relato_clinico1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_consulta_variavel] DROP CONSTRAINT [fk_tb_consulta_variavel_tb_relato_clinico1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_curso_has_tb_disciplina_tb_curso1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_curso_disciplina] DROP CONSTRAINT [fk_tb_curso_has_tb_disciplina_tb_curso1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_curso_has_tb_disciplina_tb_disciplina1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_curso_disciplina] DROP CONSTRAINT [fk_tb_curso_has_tb_disciplina_tb_disciplina1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_demograficos_antropometricos_tb_consulta_fixo1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_demograficos_antropometricos] DROP CONSTRAINT [fk_tb_demograficos_antropometricos_tb_consulta_fixo1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_demograficos_antropometricos_tb_escolaridade1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_demograficos_antropometricos] DROP CONSTRAINT [fk_tb_demograficos_antropometricos_tb_escolaridade1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_demograficos_antropometricos_tb_ocupacao1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_demograficos_antropometricos] DROP CONSTRAINT [fk_tb_demograficos_antropometricos_tb_ocupacao1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_demograficos_antropometricos_tb_plano_saude1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_demograficos_antropometricos] DROP CONSTRAINT [fk_tb_demograficos_antropometricos_tb_plano_saude1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_estilo_vida_tb_consulta_variavel1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_estilo_vida] DROP CONSTRAINT [fk_tb_estilo_vida_tb_consulta_variavel1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_exames_fisicos_tb_alergia1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_exames_fisicos] DROP CONSTRAINT [fk_tb_exames_fisicos_tb_alergia1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_exames_fisicos_tb_consulta_variavel1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_exames_fisicos] DROP CONSTRAINT [fk_tb_exames_fisicos_tb_consulta_variavel1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_experiencia_medicamentos_tb_consulta_fixo1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_experiencia_medicamentos] DROP CONSTRAINT [fk_tb_experiencia_medicamentos_tb_consulta_fixo1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_experiencia_medicamentos_tb_resposta1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_experiencia_medicamentos] DROP CONSTRAINT [fk_tb_experiencia_medicamentos_tb_resposta1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_experiencia_medicamentos_tb_resposta2]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_experiencia_medicamentos] DROP CONSTRAINT [fk_tb_experiencia_medicamentos_tb_resposta2];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_experiencia_medicamentos_tb_resposta3]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_experiencia_medicamentos] DROP CONSTRAINT [fk_tb_experiencia_medicamentos_tb_resposta3];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_experiencia_medicamentos_tb_resposta4]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_experiencia_medicamentos] DROP CONSTRAINT [fk_tb_experiencia_medicamentos_tb_resposta4];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_experiencia_medicamentos_tb_resposta5]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_experiencia_medicamentos] DROP CONSTRAINT [fk_tb_experiencia_medicamentos_tb_resposta5];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_experiencia_medicamentos_tb_resposta6]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_experiencia_medicamentos] DROP CONSTRAINT [fk_tb_experiencia_medicamentos_tb_resposta6];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_historia_tb_consulta_fixo1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_historia] DROP CONSTRAINT [fk_tb_historia_tb_consulta_fixo1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_medicamento_prescrito_tb_consulta_variavel1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_medicamento_nao_prescrito] DROP CONSTRAINT [fk_tb_medicamento_prescrito_tb_consulta_variavel1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_medicamento_prescrito_tb_medicamentos1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_medicamento_nao_prescrito] DROP CONSTRAINT [fk_tb_medicamento_prescrito_tb_medicamentos1];
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
IF OBJECT_ID(N'[pv1].[fk_tb_razao_encontro_tb_consulta_variavel1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_razao_encontro] DROP CONSTRAINT [fk_tb_razao_encontro_tb_consulta_variavel1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_razao_encontro_tb_resposta1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_razao_encontro] DROP CONSTRAINT [fk_tb_razao_encontro_tb_resposta1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_relato_clinico_tb_paciente1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_relato_clinico] DROP CONSTRAINT [fk_tb_relato_clinico_tb_paciente1];
GO
IF OBJECT_ID(N'[pv1].[fk_tb_resposta_tb_pergunta1]', 'F') IS NOT NULL
    ALTER TABLE [pv1].[tb_resposta] DROP CONSTRAINT [fk_tb_resposta_tb_pergunta1];
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
IF OBJECT_ID(N'[pv1].[my_aspnet_applications]', 'U') IS NOT NULL
    DROP TABLE [pv1].[my_aspnet_applications];
GO
IF OBJECT_ID(N'[pv1].[my_aspnet_membership]', 'U') IS NOT NULL
    DROP TABLE [pv1].[my_aspnet_membership];
GO
IF OBJECT_ID(N'[pv1].[my_aspnet_profiles]', 'U') IS NOT NULL
    DROP TABLE [pv1].[my_aspnet_profiles];
GO
IF OBJECT_ID(N'[pv1].[my_aspnet_roles]', 'U') IS NOT NULL
    DROP TABLE [pv1].[my_aspnet_roles];
GO
IF OBJECT_ID(N'[pv1].[my_aspnet_sessioncleanup]', 'U') IS NOT NULL
    DROP TABLE [pv1].[my_aspnet_sessioncleanup];
GO
IF OBJECT_ID(N'[pv1].[my_aspnet_sessions]', 'U') IS NOT NULL
    DROP TABLE [pv1].[my_aspnet_sessions];
GO
IF OBJECT_ID(N'[pv1].[my_aspnet_users]', 'U') IS NOT NULL
    DROP TABLE [pv1].[my_aspnet_users];
GO
IF OBJECT_ID(N'[pv1].[my_aspnet_usersinroles]', 'U') IS NOT NULL
    DROP TABLE [pv1].[my_aspnet_usersinroles];
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
IF OBJECT_ID(N'[pv1].[tb_alergia]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_alergia];
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
IF OBJECT_ID(N'[pv1].[tb_curso]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_curso];
GO
IF OBJECT_ID(N'[pv1].[tb_curso_disciplina]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_curso_disciplina];
GO
IF OBJECT_ID(N'[pv1].[tb_demograficos_antropometricos]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_demograficos_antropometricos];
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
IF OBJECT_ID(N'[pv1].[tb_razao_encontro]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_razao_encontro];
GO
IF OBJECT_ID(N'[pv1].[tb_relato_clinico]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_relato_clinico];
GO
IF OBJECT_ID(N'[pv1].[tb_resposta]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_resposta];
GO
IF OBJECT_ID(N'[pv1].[tb_turma]', 'U') IS NOT NULL
    DROP TABLE [pv1].[tb_turma];
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

-- Creating table 'aluno'
CREATE TABLE [dbo].[aluno] (
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
    [liberado] char(1)  NULL,
    [fkConsultaAtual] int  NULL,
    [nrConsulta] int  NOT NULL,
    [nrTentativa] int  NOT NULL,
    [flAcessoCasa] varchar(1)  NULL,
    [flAcessoCasaAmigo] varchar(1)  NULL,
    [flAcessoOutro] varchar(1)  NULL,
    [flAcessoUniversidade] varchar(1)  NULL
);
GO

-- Creating table 'casoclinico'
CREATE TABLE [dbo].[casoclinico] (
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

-- Creating table 'consulta'
CREATE TABLE [dbo].[consulta] (
    [id] int IDENTITY(1,1) NOT NULL,
    [fkCasoClinico] int  NOT NULL,
    [fkAluno] varchar(40)  NOT NULL
);
GO

-- Creating table 'intervencao'
CREATE TABLE [dbo].[intervencao] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NULL,
    [numeroEtapa] int  NOT NULL,
    [numeroIntervencao] int  NOT NULL,
    [fkCasoClinico] int  NULL
);
GO

-- Creating table 'intervencaorespostaquarta'
CREATE TABLE [dbo].[intervencaorespostaquarta] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NULL,
    [justificativa] longtext  NULL,
    [numeroIntervencao] int  NOT NULL,
    [fkResposta4] int  NOT NULL
);
GO

-- Creating table 'intervencaorespostasegunda'
CREATE TABLE [dbo].[intervencaorespostasegunda] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NULL,
    [justificativa] longtext  NULL,
    [numeroIntervencao] int  NULL,
    [fkResposta2] int  NOT NULL
);
GO

-- Creating table 'medicamentonaoprescrito'
CREATE TABLE [dbo].[medicamentonaoprescrito] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NULL,
    [dosagem] varchar(255)  NULL,
    [posologia] varchar(255)  NULL,
    [fkCasoClinico] int  NULL,
    [flItalico] varchar(255)  NULL
);
GO

-- Creating table 'medicamentoprescrito'
CREATE TABLE [dbo].[medicamentoprescrito] (
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

-- Creating table 'medicamentoqueixa'
CREATE TABLE [dbo].[medicamentoqueixa] (
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

-- Creating table 'medicamentoqueixaquarta'
CREATE TABLE [dbo].[medicamentoqueixaquarta] (
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

-- Creating table 'medicamentoqueixasegunda'
CREATE TABLE [dbo].[medicamentoqueixasegunda] (
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

-- Creating table 'parametroclinico'
CREATE TABLE [dbo].[parametroclinico] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NULL,
    [unidade] varchar(255)  NULL,
    [valor] float  NOT NULL,
    [valorDeReferencia] varchar(255)  NULL,
    [fkCasoClinico] int  NULL
);
GO

-- Creating table 'queixa'
CREATE TABLE [dbo].[queixa] (
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

-- Creating table 'queixarespostaprimeira'
CREATE TABLE [dbo].[queixarespostaprimeira] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(255)  NOT NULL,
    [fkResposta] int  NOT NULL
);
GO

-- Creating table 'queixarespostaquarta'
CREATE TABLE [dbo].[queixarespostaquarta] (
    [id] int IDENTITY(1,1) NOT NULL,
    [numeroPRM] int  NOT NULL,
    [fkResposta4] int  NOT NULL,
    [periodoSurgimento] varchar(45)  NULL,
    [flConheceOuPreocupa] varchar(1)  NULL,
    [prioridade] bigint  NOT NULL,
    [descricao] varchar(125)  NULL
);
GO

-- Creating table 'queixarespostasegunda'
CREATE TABLE [dbo].[queixarespostasegunda] (
    [id] int IDENTITY(1,1) NOT NULL,
    [numeroPRM] int  NOT NULL,
    [fkResposta2] int  NOT NULL,
    [flConheceOuPreocupa] varchar(1)  NULL,
    [prioridade] bigint  NOT NULL,
    [descricao] varchar(125)  NULL,
    [periodoSurgimento] varchar(45)  NULL
);
GO

-- Creating table 'queixarespostaterceira'
CREATE TABLE [dbo].[queixarespostaterceira] (
    [id] int IDENTITY(1,1) NOT NULL,
    [descricao] varchar(80)  NOT NULL,
    [fkResposta] int  NOT NULL
);
GO

-- Creating table 'respostaprimeira'
CREATE TABLE [dbo].[respostaprimeira] (
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

-- Creating table 'respostaquarta'
CREATE TABLE [dbo].[respostaquarta] (
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

-- Creating table 'respostasegunda'
CREATE TABLE [dbo].[respostasegunda] (
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

-- Creating table 'respostaterceira'
CREATE TABLE [dbo].[respostaterceira] (
    [id] int IDENTITY(1,1) NOT NULL,
    [temperatura] float  NULL,
    [pressaosistolica] bigint  NULL,
    [pressaodiastolica] bigint  NULL,
    [peso] float  NULL,
    [fkConsulta] int  NOT NULL,
    [dataRealizacao] datetime  NOT NULL,
    [flCorreto] varchar(1)  NULL,
    [comentario] varchar(65535)  NULL,
    [comentarioAluno] varchar(65535)  NULL,
    [nota] float  NULL,
    [imc] float  NOT NULL
);
GO

-- Creating table 'tb_curso'
CREATE TABLE [dbo].[tb_curso] (
    [IdCurso] int  NOT NULL,
    [NomeCurso] varchar(45)  NOT NULL,
    [IdInstituicao] int  NOT NULL
);
GO

-- Creating table 'tb_disciplina'
CREATE TABLE [dbo].[tb_disciplina] (
    [IdDisciplina] int IDENTITY(1,1) NOT NULL,
    [NomeDisciplina] varchar(45)  NOT NULL
);
GO

-- Creating table 'tb_disciplina_curso'
CREATE TABLE [dbo].[tb_disciplina_curso] (
    [IdDisciplina] int  NOT NULL,
    [IdCurso] varchar(45)  NOT NULL
);
GO

-- Creating table 'tb_instituicao'
CREATE TABLE [dbo].[tb_instituicao] (
    [IdInstituicao] int  NOT NULL,
    [NomeInstituicao] varchar(45)  NOT NULL,
    [Sigla] varchar(10)  NOT NULL
);
GO

-- Creating table 'tb_perfil_usuario'
CREATE TABLE [dbo].[tb_perfil_usuario] (
    [IdPerfil] int  NOT NULL,
    [NomePerfil] varchar(45)  NOT NULL
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

-- Creating table 'tb_usuario'
CREATE TABLE [dbo].[tb_usuario] (
    [IdUsuario] int IDENTITY(1,1) NOT NULL,
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

-- Creating table 'turma'
CREATE TABLE [dbo].[turma] (
    [id] int IDENTITY(1,1) NOT NULL,
    [codigo] varchar(2)  NULL,
    [periodo] varchar(6)  NULL,
    [fktutor] varchar(40)  NULL,
    [nmDisciplina] varchar(255)  NULL
);
GO

-- Creating table 'tutor'
CREATE TABLE [dbo].[tutor] (
    [login] varchar(255)  NOT NULL,
    [nome] varchar(255)  NULL
);
GO

-- Creating table 'usuario'
CREATE TABLE [dbo].[usuario] (
    [login] varchar(255)  NOT NULL,
    [email] varchar(255)  NULL,
    [senha] varchar(255)  NULL,
    [tpUsuario] varchar(255)  NULL,
    [nome] varchar(255)  NULL
);
GO

-- Creating table 'tb_video'
CREATE TABLE [dbo].[tb_video] (
    [IdVideo] int IDENTITY(1,1) NOT NULL,
    [NomeVideo] varchar(45)  NOT NULL,
    [Video] longblob  NOT NULL
);
GO

-- Creating table 'my_aspnet_applications'
CREATE TABLE [dbo].[my_aspnet_applications] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(256)  NULL,
    [description] varchar(256)  NULL
);
GO

-- Creating table 'my_aspnet_membership'
CREATE TABLE [dbo].[my_aspnet_membership] (
    [userId] int  NOT NULL,
    [Email] varchar(128)  NULL,
    [Comment] varchar(255)  NULL,
    [Password] varchar(128)  NOT NULL,
    [PasswordKey] varchar(32)  NULL,
    [PasswordFormat] tinyint  NULL,
    [PasswordQuestion] varchar(255)  NULL,
    [PasswordAnswer] varchar(255)  NULL,
    [IsApproved] bool  NULL,
    [LastActivityDate] datetime  NULL,
    [LastLoginDate] datetime  NULL,
    [LastPasswordChangedDate] datetime  NULL,
    [CreationDate] datetime  NULL,
    [IsLockedOut] bool  NULL,
    [LastLockedOutDate] datetime  NULL,
    [FailedPasswordAttemptCount] bigint  NULL,
    [FailedPasswordAttemptWindowStart] datetime  NULL,
    [FailedPasswordAnswerAttemptCount] bigint  NULL,
    [FailedPasswordAnswerAttemptWindowStart] datetime  NULL
);
GO

-- Creating table 'my_aspnet_profiles'
CREATE TABLE [dbo].[my_aspnet_profiles] (
    [userId] int  NOT NULL,
    [valueindex] longtext  NULL,
    [stringdata] longtext  NULL,
    [binarydata] longblob  NULL,
    [lastUpdatedDate] datetime  NOT NULL
);
GO

-- Creating table 'my_aspnet_roles'
CREATE TABLE [dbo].[my_aspnet_roles] (
    [id] int IDENTITY(1,1) NOT NULL,
    [applicationId] int  NOT NULL,
    [name] varchar(255)  NOT NULL
);
GO

-- Creating table 'my_aspnet_sessioncleanup'
CREATE TABLE [dbo].[my_aspnet_sessioncleanup] (
    [LastRun] datetime  NOT NULL,
    [IntervalMinutes] int  NOT NULL,
    [ApplicationId] int  NOT NULL
);
GO

-- Creating table 'my_aspnet_sessions'
CREATE TABLE [dbo].[my_aspnet_sessions] (
    [SessionId] varchar(191)  NOT NULL,
    [ApplicationId] int  NOT NULL,
    [Created] datetime  NOT NULL,
    [Expires] datetime  NOT NULL,
    [LockDate] datetime  NOT NULL,
    [LockId] int  NOT NULL,
    [Timeout] int  NOT NULL,
    [Locked] bool  NOT NULL,
    [SessionItems] longblob  NULL,
    [Flags] int  NOT NULL
);
GO

-- Creating table 'my_aspnet_users'
CREATE TABLE [dbo].[my_aspnet_users] (
    [id] int IDENTITY(1,1) NOT NULL,
    [applicationId] int  NOT NULL,
    [name] varchar(256)  NOT NULL,
    [isAnonymous] bool  NOT NULL,
    [lastActivityDate] datetime  NULL
);
GO

-- Creating table 'my_aspnet_usersinroles'
CREATE TABLE [dbo].[my_aspnet_usersinroles] (
    [userId] int  NOT NULL,
    [roleId] int  NOT NULL
);
GO

-- Creating table 'tb_alergia'
CREATE TABLE [dbo].[tb_alergia] (
    [IdAlergia] int  NOT NULL,
    [Alergia] varchar(100)  NOT NULL
);
GO

-- Creating table 'tb_consulta_fixo'
CREATE TABLE [dbo].[tb_consulta_fixo] (
    [IdConsutaFixo] bigint IDENTITY(1,1) NOT NULL,
    [IdPaciente] int  NOT NULL,
    [EhGabarito] bool  NOT NULL
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
    [Data] datetime  NULL,
    [IdRelato] int  NOT NULL,
    [Lembretes] varchar(65535)  NULL,
    [EhGabarito] bool  NOT NULL,
    [tb_resposta_IdResposta] int  NULL
);
GO

-- Creating table 'tb_demograficos_antropometricos'
CREATE TABLE [dbo].[tb_demograficos_antropometricos] (
    [IdConsutaFixo] bigint  NOT NULL,
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
    [Glicemia] float  NULL,
    [IdAlergia] int  NOT NULL
);
GO

-- Creating table 'tb_experiencia_medicamentos'
CREATE TABLE [dbo].[tb_experiencia_medicamentos] (
    [IdConsutaFixo] bigint  NOT NULL,
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
    [IdConsutaFixo] bigint  NOT NULL,
    [HistoriaMedicaPregressa] varchar(255)  NOT NULL,
    [HistoriaFamiliar] varchar(255)  NOT NULL
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
    [IdConsutaFixo] bigint  NOT NULL,
    [IdConsultaVariavel] bigint  NOT NULL,
    [GrupoAtividades] int  NOT NULL,
    [EstadoPreenchimento] int  NOT NULL
);
GO

-- Creating table 'tb_parametro_clinico'
CREATE TABLE [dbo].[tb_parametro_clinico] (
    [IdParamentoClinico] int  NOT NULL,
    [ParametroClinico] varchar(100)  NOT NULL
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

-- Creating table 'tb_curso_disciplina'
CREATE TABLE [dbo].[tb_curso_disciplina] (
    [tb_curso_IdCurso] int  NOT NULL,
    [tb_disciplina_IdDisciplina] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [login] in table 'aluno'
ALTER TABLE [dbo].[aluno]
ADD CONSTRAINT [PK_aluno]
    PRIMARY KEY CLUSTERED ([login] ASC);
GO

-- Creating primary key on [id] in table 'casoclinico'
ALTER TABLE [dbo].[casoclinico]
ADD CONSTRAINT [PK_casoclinico]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'consulta'
ALTER TABLE [dbo].[consulta]
ADD CONSTRAINT [PK_consulta]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'intervencao'
ALTER TABLE [dbo].[intervencao]
ADD CONSTRAINT [PK_intervencao]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'intervencaorespostaquarta'
ALTER TABLE [dbo].[intervencaorespostaquarta]
ADD CONSTRAINT [PK_intervencaorespostaquarta]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'intervencaorespostasegunda'
ALTER TABLE [dbo].[intervencaorespostasegunda]
ADD CONSTRAINT [PK_intervencaorespostasegunda]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'medicamentonaoprescrito'
ALTER TABLE [dbo].[medicamentonaoprescrito]
ADD CONSTRAINT [PK_medicamentonaoprescrito]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'medicamentoprescrito'
ALTER TABLE [dbo].[medicamentoprescrito]
ADD CONSTRAINT [PK_medicamentoprescrito]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'medicamentoqueixa'
ALTER TABLE [dbo].[medicamentoqueixa]
ADD CONSTRAINT [PK_medicamentoqueixa]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'medicamentoqueixaquarta'
ALTER TABLE [dbo].[medicamentoqueixaquarta]
ADD CONSTRAINT [PK_medicamentoqueixaquarta]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'medicamentoqueixasegunda'
ALTER TABLE [dbo].[medicamentoqueixasegunda]
ADD CONSTRAINT [PK_medicamentoqueixasegunda]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'parametroclinico'
ALTER TABLE [dbo].[parametroclinico]
ADD CONSTRAINT [PK_parametroclinico]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'queixa'
ALTER TABLE [dbo].[queixa]
ADD CONSTRAINT [PK_queixa]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'queixarespostaprimeira'
ALTER TABLE [dbo].[queixarespostaprimeira]
ADD CONSTRAINT [PK_queixarespostaprimeira]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'queixarespostaquarta'
ALTER TABLE [dbo].[queixarespostaquarta]
ADD CONSTRAINT [PK_queixarespostaquarta]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'queixarespostasegunda'
ALTER TABLE [dbo].[queixarespostasegunda]
ADD CONSTRAINT [PK_queixarespostasegunda]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'queixarespostaterceira'
ALTER TABLE [dbo].[queixarespostaterceira]
ADD CONSTRAINT [PK_queixarespostaterceira]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'respostaprimeira'
ALTER TABLE [dbo].[respostaprimeira]
ADD CONSTRAINT [PK_respostaprimeira]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'respostaquarta'
ALTER TABLE [dbo].[respostaquarta]
ADD CONSTRAINT [PK_respostaquarta]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'respostasegunda'
ALTER TABLE [dbo].[respostasegunda]
ADD CONSTRAINT [PK_respostasegunda]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'respostaterceira'
ALTER TABLE [dbo].[respostaterceira]
ADD CONSTRAINT [PK_respostaterceira]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [IdCurso] in table 'tb_curso'
ALTER TABLE [dbo].[tb_curso]
ADD CONSTRAINT [PK_tb_curso]
    PRIMARY KEY CLUSTERED ([IdCurso] ASC);
GO

-- Creating primary key on [IdDisciplina] in table 'tb_disciplina'
ALTER TABLE [dbo].[tb_disciplina]
ADD CONSTRAINT [PK_tb_disciplina]
    PRIMARY KEY CLUSTERED ([IdDisciplina] ASC);
GO

-- Creating primary key on [IdDisciplina], [IdCurso] in table 'tb_disciplina_curso'
ALTER TABLE [dbo].[tb_disciplina_curso]
ADD CONSTRAINT [PK_tb_disciplina_curso]
    PRIMARY KEY CLUSTERED ([IdDisciplina], [IdCurso] ASC);
GO

-- Creating primary key on [IdInstituicao] in table 'tb_instituicao'
ALTER TABLE [dbo].[tb_instituicao]
ADD CONSTRAINT [PK_tb_instituicao]
    PRIMARY KEY CLUSTERED ([IdInstituicao] ASC);
GO

-- Creating primary key on [IdPerfil] in table 'tb_perfil_usuario'
ALTER TABLE [dbo].[tb_perfil_usuario]
ADD CONSTRAINT [PK_tb_perfil_usuario]
    PRIMARY KEY CLUSTERED ([IdPerfil] ASC);
GO

-- Creating primary key on [IdTurma] in table 'tb_turma'
ALTER TABLE [dbo].[tb_turma]
ADD CONSTRAINT [PK_tb_turma]
    PRIMARY KEY CLUSTERED ([IdTurma] ASC);
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

-- Creating primary key on [id] in table 'turma'
ALTER TABLE [dbo].[turma]
ADD CONSTRAINT [PK_turma]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [login] in table 'tutor'
ALTER TABLE [dbo].[tutor]
ADD CONSTRAINT [PK_tutor]
    PRIMARY KEY CLUSTERED ([login] ASC);
GO

-- Creating primary key on [login] in table 'usuario'
ALTER TABLE [dbo].[usuario]
ADD CONSTRAINT [PK_usuario]
    PRIMARY KEY CLUSTERED ([login] ASC);
GO

-- Creating primary key on [IdVideo], [NomeVideo] in table 'tb_video'
ALTER TABLE [dbo].[tb_video]
ADD CONSTRAINT [PK_tb_video]
    PRIMARY KEY CLUSTERED ([IdVideo], [NomeVideo] ASC);
GO

-- Creating primary key on [id] in table 'my_aspnet_applications'
ALTER TABLE [dbo].[my_aspnet_applications]
ADD CONSTRAINT [PK_my_aspnet_applications]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [userId] in table 'my_aspnet_membership'
ALTER TABLE [dbo].[my_aspnet_membership]
ADD CONSTRAINT [PK_my_aspnet_membership]
    PRIMARY KEY CLUSTERED ([userId] ASC);
GO

-- Creating primary key on [userId] in table 'my_aspnet_profiles'
ALTER TABLE [dbo].[my_aspnet_profiles]
ADD CONSTRAINT [PK_my_aspnet_profiles]
    PRIMARY KEY CLUSTERED ([userId] ASC);
GO

-- Creating primary key on [id] in table 'my_aspnet_roles'
ALTER TABLE [dbo].[my_aspnet_roles]
ADD CONSTRAINT [PK_my_aspnet_roles]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [ApplicationId] in table 'my_aspnet_sessioncleanup'
ALTER TABLE [dbo].[my_aspnet_sessioncleanup]
ADD CONSTRAINT [PK_my_aspnet_sessioncleanup]
    PRIMARY KEY CLUSTERED ([ApplicationId] ASC);
GO

-- Creating primary key on [SessionId], [ApplicationId] in table 'my_aspnet_sessions'
ALTER TABLE [dbo].[my_aspnet_sessions]
ADD CONSTRAINT [PK_my_aspnet_sessions]
    PRIMARY KEY CLUSTERED ([SessionId], [ApplicationId] ASC);
GO

-- Creating primary key on [id] in table 'my_aspnet_users'
ALTER TABLE [dbo].[my_aspnet_users]
ADD CONSTRAINT [PK_my_aspnet_users]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [userId], [roleId] in table 'my_aspnet_usersinroles'
ALTER TABLE [dbo].[my_aspnet_usersinroles]
ADD CONSTRAINT [PK_my_aspnet_usersinroles]
    PRIMARY KEY CLUSTERED ([userId], [roleId] ASC);
GO

-- Creating primary key on [IdAlergia] in table 'tb_alergia'
ALTER TABLE [dbo].[tb_alergia]
ADD CONSTRAINT [PK_tb_alergia]
    PRIMARY KEY CLUSTERED ([IdAlergia] ASC);
GO

-- Creating primary key on [IdConsutaFixo] in table 'tb_consulta_fixo'
ALTER TABLE [dbo].[tb_consulta_fixo]
ADD CONSTRAINT [PK_tb_consulta_fixo]
    PRIMARY KEY CLUSTERED ([IdConsutaFixo] ASC);
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

-- Creating primary key on [IdConsutaFixo] in table 'tb_demograficos_antropometricos'
ALTER TABLE [dbo].[tb_demograficos_antropometricos]
ADD CONSTRAINT [PK_tb_demograficos_antropometricos]
    PRIMARY KEY CLUSTERED ([IdConsutaFixo] ASC);
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

-- Creating primary key on [IdConsutaFixo] in table 'tb_experiencia_medicamentos'
ALTER TABLE [dbo].[tb_experiencia_medicamentos]
ADD CONSTRAINT [PK_tb_experiencia_medicamentos]
    PRIMARY KEY CLUSTERED ([IdConsutaFixo] ASC);
GO

-- Creating primary key on [IdConsutaFixo] in table 'tb_historia'
ALTER TABLE [dbo].[tb_historia]
ADD CONSTRAINT [PK_tb_historia]
    PRIMARY KEY CLUSTERED ([IdConsutaFixo] ASC);
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

-- Creating primary key on [IdParamentoClinico] in table 'tb_parametro_clinico'
ALTER TABLE [dbo].[tb_parametro_clinico]
ADD CONSTRAINT [PK_tb_parametro_clinico]
    PRIMARY KEY CLUSTERED ([IdParamentoClinico] ASC);
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

-- Creating primary key on [tb_curso_IdCurso], [tb_disciplina_IdDisciplina] in table 'tb_curso_disciplina'
ALTER TABLE [dbo].[tb_curso_disciplina]
ADD CONSTRAINT [PK_tb_curso_disciplina]
    PRIMARY KEY NONCLUSTERED ([tb_curso_IdCurso], [tb_disciplina_IdDisciplina] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [fkConsultaAtual] in table 'aluno'
ALTER TABLE [dbo].[aluno]
ADD CONSTRAINT [FK_aluno_2]
    FOREIGN KEY ([fkConsultaAtual])
    REFERENCES [dbo].[consulta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_aluno_2'
CREATE INDEX [IX_FK_aluno_2]
ON [dbo].[aluno]
    ([fkConsultaAtual]);
GO

-- Creating foreign key on [fkAluno] in table 'consulta'
ALTER TABLE [dbo].[consulta]
ADD CONSTRAINT [FK_consulta_2]
    FOREIGN KEY ([fkAluno])
    REFERENCES [dbo].[aluno]
        ([login])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_consulta_2'
CREATE INDEX [IX_FK_consulta_2]
ON [dbo].[consulta]
    ([fkAluno]);
GO

-- Creating foreign key on [fkConsultaAtual] in table 'aluno'
ALTER TABLE [dbo].[aluno]
ADD CONSTRAINT [FK_FK589C4EBDD526F1E]
    FOREIGN KEY ([fkConsultaAtual])
    REFERENCES [dbo].[consulta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK589C4EBDD526F1E'
CREATE INDEX [IX_FK_FK589C4EBDD526F1E]
ON [dbo].[aluno]
    ([fkConsultaAtual]);
GO

-- Creating foreign key on [fkAluno] in table 'consulta'
ALTER TABLE [dbo].[consulta]
ADD CONSTRAINT [FK_FKDE2881F52977839B]
    FOREIGN KEY ([fkAluno])
    REFERENCES [dbo].[aluno]
        ([login])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKDE2881F52977839B'
CREATE INDEX [IX_FK_FKDE2881F52977839B]
ON [dbo].[consulta]
    ([fkAluno]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'consulta'
ALTER TABLE [dbo].[consulta]
ADD CONSTRAINT [FK_Consulta_1]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinico]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Consulta_1'
CREATE INDEX [IX_FK_Consulta_1]
ON [dbo].[consulta]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'intervencao'
ALTER TABLE [dbo].[intervencao]
ADD CONSTRAINT [FK_FK91D9EFAE8A1319FF]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinico]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK91D9EFAE8A1319FF'
CREATE INDEX [IX_FK_FK91D9EFAE8A1319FF]
ON [dbo].[intervencao]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'medicamentoprescrito'
ALTER TABLE [dbo].[medicamentoprescrito]
ADD CONSTRAINT [FK_FKAA358BEF8A1319FF]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinico]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKAA358BEF8A1319FF'
CREATE INDEX [IX_FK_FKAA358BEF8A1319FF]
ON [dbo].[medicamentoprescrito]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'parametroclinico'
ALTER TABLE [dbo].[parametroclinico]
ADD CONSTRAINT [FK_FKAAEE312E8A1319FF]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinico]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKAAEE312E8A1319FF'
CREATE INDEX [IX_FK_FKAAEE312E8A1319FF]
ON [dbo].[parametroclinico]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'medicamentonaoprescrito'
ALTER TABLE [dbo].[medicamentonaoprescrito]
ADD CONSTRAINT [FK_FKBF69A97F8A1319FF]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinico]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKBF69A97F8A1319FF'
CREATE INDEX [IX_FK_FKBF69A97F8A1319FF]
ON [dbo].[medicamentonaoprescrito]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'queixa'
ALTER TABLE [dbo].[queixa]
ADD CONSTRAINT [FK_FKC773DEB18A1319FF]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinico]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKC773DEB18A1319FF'
CREATE INDEX [IX_FK_FKC773DEB18A1319FF]
ON [dbo].[queixa]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkCasoClinico] in table 'consulta'
ALTER TABLE [dbo].[consulta]
ADD CONSTRAINT [FK_FKDE2881F58A1319FF]
    FOREIGN KEY ([fkCasoClinico])
    REFERENCES [dbo].[casoclinico]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKDE2881F58A1319FF'
CREATE INDEX [IX_FK_FKDE2881F58A1319FF]
ON [dbo].[consulta]
    ([fkCasoClinico]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostaterceira'
ALTER TABLE [dbo].[respostaterceira]
ADD CONSTRAINT [FK_respostaalunoterceira_1]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consulta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_respostaalunoterceira_1'
CREATE INDEX [IX_FK_respostaalunoterceira_1]
ON [dbo].[respostaterceira]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostaprimeira'
ALTER TABLE [dbo].[respostaprimeira]
ADD CONSTRAINT [FK_respostaprimeira_1]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consulta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_respostaprimeira_1'
CREATE INDEX [IX_FK_respostaprimeira_1]
ON [dbo].[respostaprimeira]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostaquarta'
ALTER TABLE [dbo].[respostaquarta]
ADD CONSTRAINT [FK_respostaquarta_1]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consulta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_respostaquarta_1'
CREATE INDEX [IX_FK_respostaquarta_1]
ON [dbo].[respostaquarta]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostasegunda'
ALTER TABLE [dbo].[respostasegunda]
ADD CONSTRAINT [FK_respostasegunda_1]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consulta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_respostasegunda_1'
CREATE INDEX [IX_FK_respostasegunda_1]
ON [dbo].[respostasegunda]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostaterceira'
ALTER TABLE [dbo].[respostaterceira]
ADD CONSTRAINT [FK_FK877B3B565097F805]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consulta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK877B3B565097F805'
CREATE INDEX [IX_FK_FK877B3B565097F805]
ON [dbo].[respostaterceira]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostaprimeira'
ALTER TABLE [dbo].[respostaprimeira]
ADD CONSTRAINT [FK_FK88D8D79A5097F805]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consulta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK88D8D79A5097F805'
CREATE INDEX [IX_FK_FK88D8D79A5097F805]
ON [dbo].[respostaprimeira]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostaquarta'
ALTER TABLE [dbo].[respostaquarta]
ADD CONSTRAINT [FK_FKB29DB8E35097F805]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consulta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKB29DB8E35097F805'
CREATE INDEX [IX_FK_FKB29DB8E35097F805]
ON [dbo].[respostaquarta]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkConsulta] in table 'respostasegunda'
ALTER TABLE [dbo].[respostasegunda]
ADD CONSTRAINT [FK_FKEFEE246A5097F805]
    FOREIGN KEY ([fkConsulta])
    REFERENCES [dbo].[consulta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKEFEE246A5097F805'
CREATE INDEX [IX_FK_FKEFEE246A5097F805]
ON [dbo].[respostasegunda]
    ([fkConsulta]);
GO

-- Creating foreign key on [fkResposta4] in table 'intervencaorespostaquarta'
ALTER TABLE [dbo].[intervencaorespostaquarta]
ADD CONSTRAINT [FK_intervencaorespostaquarta_1]
    FOREIGN KEY ([fkResposta4])
    REFERENCES [dbo].[respostaquarta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_intervencaorespostaquarta_1'
CREATE INDEX [IX_FK_intervencaorespostaquarta_1]
ON [dbo].[intervencaorespostaquarta]
    ([fkResposta4]);
GO

-- Creating foreign key on [fkResposta4] in table 'intervencaorespostaquarta'
ALTER TABLE [dbo].[intervencaorespostaquarta]
ADD CONSTRAINT [FK_FK800BA011D2B646E7]
    FOREIGN KEY ([fkResposta4])
    REFERENCES [dbo].[respostaquarta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK800BA011D2B646E7'
CREATE INDEX [IX_FK_FK800BA011D2B646E7]
ON [dbo].[intervencaorespostaquarta]
    ([fkResposta4]);
GO

-- Creating foreign key on [fkResposta2] in table 'intervencaorespostasegunda'
ALTER TABLE [dbo].[intervencaorespostasegunda]
ADD CONSTRAINT [FK_intervencaorespostasegunda_1]
    FOREIGN KEY ([fkResposta2])
    REFERENCES [dbo].[respostasegunda]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_intervencaorespostasegunda_1'
CREATE INDEX [IX_FK_intervencaorespostasegunda_1]
ON [dbo].[intervencaorespostasegunda]
    ([fkResposta2]);
GO

-- Creating foreign key on [fkResposta2] in table 'intervencaorespostasegunda'
ALTER TABLE [dbo].[intervencaorespostasegunda]
ADD CONSTRAINT [FK_FKD03D22FCA4FE1140]
    FOREIGN KEY ([fkResposta2])
    REFERENCES [dbo].[respostasegunda]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKD03D22FCA4FE1140'
CREATE INDEX [IX_FK_FKD03D22FCA4FE1140]
ON [dbo].[intervencaorespostasegunda]
    ([fkResposta2]);
GO

-- Creating foreign key on [fkQueixa] in table 'medicamentoqueixa'
ALTER TABLE [dbo].[medicamentoqueixa]
ADD CONSTRAINT [FK_medicamentoqueixa_1]
    FOREIGN KEY ([fkQueixa])
    REFERENCES [dbo].[queixa]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_medicamentoqueixa_1'
CREATE INDEX [IX_FK_medicamentoqueixa_1]
ON [dbo].[medicamentoqueixa]
    ([fkQueixa]);
GO

-- Creating foreign key on [fkQueixa] in table 'medicamentoqueixa'
ALTER TABLE [dbo].[medicamentoqueixa]
ADD CONSTRAINT [FK_FK8099C4A73D02FC3D]
    FOREIGN KEY ([fkQueixa])
    REFERENCES [dbo].[queixa]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK8099C4A73D02FC3D'
CREATE INDEX [IX_FK_FK8099C4A73D02FC3D]
ON [dbo].[medicamentoqueixa]
    ([fkQueixa]);
GO

-- Creating foreign key on [fkQueixaQuarta] in table 'medicamentoqueixaquarta'
ALTER TABLE [dbo].[medicamentoqueixaquarta]
ADD CONSTRAINT [FK_medicamentoqueixaquarta_1]
    FOREIGN KEY ([fkQueixaQuarta])
    REFERENCES [dbo].[queixarespostaquarta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_medicamentoqueixaquarta_1'
CREATE INDEX [IX_FK_medicamentoqueixaquarta_1]
ON [dbo].[medicamentoqueixaquarta]
    ([fkQueixaQuarta]);
GO

-- Creating foreign key on [fkQueixaQuarta] in table 'medicamentoqueixaquarta'
ALTER TABLE [dbo].[medicamentoqueixaquarta]
ADD CONSTRAINT [FK_FK78D999E947C18322]
    FOREIGN KEY ([fkQueixaQuarta])
    REFERENCES [dbo].[queixarespostaquarta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK78D999E947C18322'
CREATE INDEX [IX_FK_FK78D999E947C18322]
ON [dbo].[medicamentoqueixaquarta]
    ([fkQueixaQuarta]);
GO

-- Creating foreign key on [fkQueixaSegunda] in table 'medicamentoqueixasegunda'
ALTER TABLE [dbo].[medicamentoqueixasegunda]
ADD CONSTRAINT [FK_medicamentoqueixasegunda_1]
    FOREIGN KEY ([fkQueixaSegunda])
    REFERENCES [dbo].[queixarespostasegunda]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_medicamentoqueixasegunda_1'
CREATE INDEX [IX_FK_medicamentoqueixasegunda_1]
ON [dbo].[medicamentoqueixasegunda]
    ([fkQueixaSegunda]);
GO

-- Creating foreign key on [fkQueixaSegunda] in table 'medicamentoqueixasegunda'
ALTER TABLE [dbo].[medicamentoqueixasegunda]
ADD CONSTRAINT [FK_FKF12E64244E1862F8]
    FOREIGN KEY ([fkQueixaSegunda])
    REFERENCES [dbo].[queixarespostasegunda]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKF12E64244E1862F8'
CREATE INDEX [IX_FK_FKF12E64244E1862F8]
ON [dbo].[medicamentoqueixasegunda]
    ([fkQueixaSegunda]);
GO

-- Creating foreign key on [fkResposta] in table 'queixarespostaprimeira'
ALTER TABLE [dbo].[queixarespostaprimeira]
ADD CONSTRAINT [FK_queixarespostaprimeira_1]
    FOREIGN KEY ([fkResposta])
    REFERENCES [dbo].[respostaprimeira]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_queixarespostaprimeira_1'
CREATE INDEX [IX_FK_queixarespostaprimeira_1]
ON [dbo].[queixarespostaprimeira]
    ([fkResposta]);
GO

-- Creating foreign key on [fkResposta] in table 'queixarespostaprimeira'
ALTER TABLE [dbo].[queixarespostaprimeira]
ADD CONSTRAINT [FK_FK1E43344B8872A0F6]
    FOREIGN KEY ([fkResposta])
    REFERENCES [dbo].[respostaprimeira]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK1E43344B8872A0F6'
CREATE INDEX [IX_FK_FK1E43344B8872A0F6]
ON [dbo].[queixarespostaprimeira]
    ([fkResposta]);
GO

-- Creating foreign key on [fkResposta4] in table 'queixarespostaquarta'
ALTER TABLE [dbo].[queixarespostaquarta]
ADD CONSTRAINT [FK_queixarespostaquarta_1]
    FOREIGN KEY ([fkResposta4])
    REFERENCES [dbo].[respostaquarta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_queixarespostaquarta_1'
CREATE INDEX [IX_FK_queixarespostaquarta_1]
ON [dbo].[queixarespostaquarta]
    ([fkResposta4]);
GO

-- Creating foreign key on [fkResposta4] in table 'queixarespostaquarta'
ALTER TABLE [dbo].[queixarespostaquarta]
ADD CONSTRAINT [FK_FK5BA98DD4D2B646E7]
    FOREIGN KEY ([fkResposta4])
    REFERENCES [dbo].[respostaquarta]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK5BA98DD4D2B646E7'
CREATE INDEX [IX_FK_FK5BA98DD4D2B646E7]
ON [dbo].[queixarespostaquarta]
    ([fkResposta4]);
GO

-- Creating foreign key on [fkResposta2] in table 'queixarespostasegunda'
ALTER TABLE [dbo].[queixarespostasegunda]
ADD CONSTRAINT [FK_FK685CED99A4FE1140]
    FOREIGN KEY ([fkResposta2])
    REFERENCES [dbo].[respostasegunda]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK685CED99A4FE1140'
CREATE INDEX [IX_FK_FK685CED99A4FE1140]
ON [dbo].[queixarespostasegunda]
    ([fkResposta2]);
GO

-- Creating foreign key on [fkResposta2] in table 'queixarespostasegunda'
ALTER TABLE [dbo].[queixarespostasegunda]
ADD CONSTRAINT [FK_FKFD098D39A4FE1140]
    FOREIGN KEY ([fkResposta2])
    REFERENCES [dbo].[respostasegunda]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FKFD098D39A4FE1140'
CREATE INDEX [IX_FK_FKFD098D39A4FE1140]
ON [dbo].[queixarespostasegunda]
    ([fkResposta2]);
GO

-- Creating foreign key on [fkResposta] in table 'queixarespostaterceira'
ALTER TABLE [dbo].[queixarespostaterceira]
ADD CONSTRAINT [FK_queixarespostaterceira_1]
    FOREIGN KEY ([fkResposta])
    REFERENCES [dbo].[respostaterceira]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_queixarespostaterceira_1'
CREATE INDEX [IX_FK_queixarespostaterceira_1]
ON [dbo].[queixarespostaterceira]
    ([fkResposta]);
GO

-- Creating foreign key on [fkResposta] in table 'queixarespostaterceira'
ALTER TABLE [dbo].[queixarespostaterceira]
ADD CONSTRAINT [FK_FK1CE59807871504B2]
    FOREIGN KEY ([fkResposta])
    REFERENCES [dbo].[respostaterceira]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK1CE59807871504B2'
CREATE INDEX [IX_FK_FK1CE59807871504B2]
ON [dbo].[queixarespostaterceira]
    ([fkResposta]);
GO

-- Creating foreign key on [IdInstituicao] in table 'tb_curso'
ALTER TABLE [dbo].[tb_curso]
ADD CONSTRAINT [FK_Curso_Instituicao]
    FOREIGN KEY ([IdInstituicao])
    REFERENCES [dbo].[tb_instituicao]
        ([IdInstituicao])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Curso_Instituicao'
CREATE INDEX [IX_FK_Curso_Instituicao]
ON [dbo].[tb_curso]
    ([IdInstituicao]);
GO

-- Creating foreign key on [IdDisciplina] in table 'tb_disciplina_curso'
ALTER TABLE [dbo].[tb_disciplina_curso]
ADD CONSTRAINT [FK_Disciplina]
    FOREIGN KEY ([IdDisciplina])
    REFERENCES [dbo].[tb_disciplina]
        ([IdDisciplina])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdInstituicao] in table 'tb_turma'
ALTER TABLE [dbo].[tb_turma]
ADD CONSTRAINT [FK_Instituicao]
    FOREIGN KEY ([IdInstituicao])
    REFERENCES [dbo].[tb_instituicao]
        ([IdInstituicao])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Instituicao'
CREATE INDEX [IX_FK_Instituicao]
ON [dbo].[tb_turma]
    ([IdInstituicao]);
GO

-- Creating foreign key on [fktutor] in table 'turma'
ALTER TABLE [dbo].[turma]
ADD CONSTRAINT [FK_FK6998F652B972831]
    FOREIGN KEY ([fktutor])
    REFERENCES [dbo].[tutor]
        ([login])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FK6998F652B972831'
CREATE INDEX [IX_FK_FK6998F652B972831]
ON [dbo].[turma]
    ([fktutor]);
GO

-- Creating foreign key on [IdAlergia] in table 'tb_exames_fisicos'
ALTER TABLE [dbo].[tb_exames_fisicos]
ADD CONSTRAINT [fk_tb_exames_fisicos_tb_alergia1]
    FOREIGN KEY ([IdAlergia])
    REFERENCES [dbo].[tb_alergia]
        ([IdAlergia])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_exames_fisicos_tb_alergia1'
CREATE INDEX [IX_fk_tb_exames_fisicos_tb_alergia1]
ON [dbo].[tb_exames_fisicos]
    ([IdAlergia]);
GO

-- Creating foreign key on [IdConsutaFixo] in table 'tb_demograficos_antropometricos'
ALTER TABLE [dbo].[tb_demograficos_antropometricos]
ADD CONSTRAINT [fk_tb_demograficos_antropometricos_tb_consulta_fixo1]
    FOREIGN KEY ([IdConsutaFixo])
    REFERENCES [dbo].[tb_consulta_fixo]
        ([IdConsutaFixo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdConsutaFixo] in table 'tb_experiencia_medicamentos'
ALTER TABLE [dbo].[tb_experiencia_medicamentos]
ADD CONSTRAINT [fk_tb_experiencia_medicamentos_tb_consulta_fixo1]
    FOREIGN KEY ([IdConsutaFixo])
    REFERENCES [dbo].[tb_consulta_fixo]
        ([IdConsutaFixo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdConsutaFixo] in table 'tb_historia'
ALTER TABLE [dbo].[tb_historia]
ADD CONSTRAINT [fk_tb_historia_tb_consulta_fixo1]
    FOREIGN KEY ([IdConsutaFixo])
    REFERENCES [dbo].[tb_consulta_fixo]
        ([IdConsutaFixo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdConsutaFixo] in table 'tb_paciente_pessoa_turma'
ALTER TABLE [dbo].[tb_paciente_pessoa_turma]
ADD CONSTRAINT [fk_tb_paciente_pessoa_turma_tb_consulta_fixo1]
    FOREIGN KEY ([IdConsutaFixo])
    REFERENCES [dbo].[tb_consulta_fixo]
        ([IdConsutaFixo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_paciente_pessoa_turma_tb_consulta_fixo1'
CREATE INDEX [IX_fk_tb_paciente_pessoa_turma_tb_consulta_fixo1]
ON [dbo].[tb_paciente_pessoa_turma]
    ([IdConsutaFixo]);
GO

-- Creating foreign key on [IdConsultaVariavel] in table 'tb_consulta_parametro'
ALTER TABLE [dbo].[tb_consulta_parametro]
ADD CONSTRAINT [fk_tb_consulta_variavel_has_tb_parametro_clinico_tb_consulta_1]
    FOREIGN KEY ([IdConsultaVariavel])
    REFERENCES [dbo].[tb_consulta_variavel]
        ([IdConsultaVariavel])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdParamentoClinico] in table 'tb_consulta_parametro'
ALTER TABLE [dbo].[tb_consulta_parametro]
ADD CONSTRAINT [fk_tb_consulta_variavel_has_tb_parametro_clinico_tb_parametro1]
    FOREIGN KEY ([IdParamentoClinico])
    REFERENCES [dbo].[tb_parametro_clinico]
        ([IdParamentoClinico])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_consulta_variavel_has_tb_parametro_clinico_tb_parametro1'
CREATE INDEX [IX_fk_tb_consulta_variavel_has_tb_parametro_clinico_tb_parametro1]
ON [dbo].[tb_consulta_parametro]
    ([IdParamentoClinico]);
GO

-- Creating foreign key on [IdConsultaVariavel] in table 'tb_medicamentos_anteriores'
ALTER TABLE [dbo].[tb_medicamentos_anteriores]
ADD CONSTRAINT [fk_tb_consulta_variavel_has_tb_medicamentos_tb_consulta_varia1]
    FOREIGN KEY ([IdConsultaVariavel])
    REFERENCES [dbo].[tb_consulta_variavel]
        ([IdConsultaVariavel])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdConsultaVariavel] in table 'tb_medicamento_prescrito'
ALTER TABLE [dbo].[tb_medicamento_prescrito]
ADD CONSTRAINT [fk_tb_consulta_variavel_has_tb_medicamentos_tb_consulta_varia2]
    FOREIGN KEY ([IdConsultaVariavel])
    REFERENCES [dbo].[tb_consulta_variavel]
        ([IdConsultaVariavel])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdRelato] in table 'tb_consulta_variavel'
ALTER TABLE [dbo].[tb_consulta_variavel]
ADD CONSTRAINT [fk_tb_consulta_variavel_tb_relato_clinico1]
    FOREIGN KEY ([IdRelato])
    REFERENCES [dbo].[tb_relato_clinico]
        ([IdRelato])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_consulta_variavel_tb_relato_clinico1'
CREATE INDEX [IX_fk_tb_consulta_variavel_tb_relato_clinico1]
ON [dbo].[tb_consulta_variavel]
    ([IdRelato]);
GO

-- Creating foreign key on [IdConsultaVariavel] in table 'tb_estilo_vida'
ALTER TABLE [dbo].[tb_estilo_vida]
ADD CONSTRAINT [fk_tb_estilo_vida_tb_consulta_variavel1]
    FOREIGN KEY ([IdConsultaVariavel])
    REFERENCES [dbo].[tb_consulta_variavel]
        ([IdConsultaVariavel])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdConsultaVariavel] in table 'tb_exames_fisicos'
ALTER TABLE [dbo].[tb_exames_fisicos]
ADD CONSTRAINT [fk_tb_exames_fisicos_tb_consulta_variavel1]
    FOREIGN KEY ([IdConsultaVariavel])
    REFERENCES [dbo].[tb_consulta_variavel]
        ([IdConsultaVariavel])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IdConsultaVariavel] in table 'tb_medicamento_nao_prescrito'
ALTER TABLE [dbo].[tb_medicamento_nao_prescrito]
ADD CONSTRAINT [fk_tb_medicamento_prescrito_tb_consulta_variavel1]
    FOREIGN KEY ([IdConsultaVariavel])
    REFERENCES [dbo].[tb_consulta_variavel]
        ([IdConsultaVariavel])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
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

-- Creating foreign key on [IdEscolaridade] in table 'tb_demograficos_antropometricos'
ALTER TABLE [dbo].[tb_demograficos_antropometricos]
ADD CONSTRAINT [fk_tb_demograficos_antropometricos_tb_escolaridade1]
    FOREIGN KEY ([IdEscolaridade])
    REFERENCES [dbo].[tb_escolaridade]
        ([IdEscolaridade])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_demograficos_antropometricos_tb_escolaridade1'
CREATE INDEX [IX_fk_tb_demograficos_antropometricos_tb_escolaridade1]
ON [dbo].[tb_demograficos_antropometricos]
    ([IdEscolaridade]);
GO

-- Creating foreign key on [IdOcupacao] in table 'tb_demograficos_antropometricos'
ALTER TABLE [dbo].[tb_demograficos_antropometricos]
ADD CONSTRAINT [fk_tb_demograficos_antropometricos_tb_ocupacao1]
    FOREIGN KEY ([IdOcupacao])
    REFERENCES [dbo].[tb_ocupacao]
        ([IdOcupacao])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_demograficos_antropometricos_tb_ocupacao1'
CREATE INDEX [IX_fk_tb_demograficos_antropometricos_tb_ocupacao1]
ON [dbo].[tb_demograficos_antropometricos]
    ([IdOcupacao]);
GO

-- Creating foreign key on [IdPlanoSaude] in table 'tb_demograficos_antropometricos'
ALTER TABLE [dbo].[tb_demograficos_antropometricos]
ADD CONSTRAINT [fk_tb_demograficos_antropometricos_tb_plano_saude1]
    FOREIGN KEY ([IdPlanoSaude])
    REFERENCES [dbo].[tb_plano_saude]
        ([IdPlanoSaude])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_demograficos_antropometricos_tb_plano_saude1'
CREATE INDEX [IX_fk_tb_demograficos_antropometricos_tb_plano_saude1]
ON [dbo].[tb_demograficos_antropometricos]
    ([IdPlanoSaude]);
GO

-- Creating foreign key on [IdRespostaEsperaTratamento] in table 'tb_experiencia_medicamentos'
ALTER TABLE [dbo].[tb_experiencia_medicamentos]
ADD CONSTRAINT [fk_tb_experiencia_medicamentos_tb_resposta1]
    FOREIGN KEY ([IdRespostaEsperaTratamento])
    REFERENCES [dbo].[tb_resposta]
        ([IdResposta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_experiencia_medicamentos_tb_resposta1'
CREATE INDEX [IX_fk_tb_experiencia_medicamentos_tb_resposta1]
ON [dbo].[tb_experiencia_medicamentos]
    ([IdRespostaEsperaTratamento]);
GO

-- Creating foreign key on [IdRespostaPreocupacoes] in table 'tb_experiencia_medicamentos'
ALTER TABLE [dbo].[tb_experiencia_medicamentos]
ADD CONSTRAINT [fk_tb_experiencia_medicamentos_tb_resposta2]
    FOREIGN KEY ([IdRespostaPreocupacoes])
    REFERENCES [dbo].[tb_resposta]
        ([IdResposta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_experiencia_medicamentos_tb_resposta2'
CREATE INDEX [IX_fk_tb_experiencia_medicamentos_tb_resposta2]
ON [dbo].[tb_experiencia_medicamentos]
    ([IdRespostaPreocupacoes]);
GO

-- Creating foreign key on [IdRespostaGrauEntendimento] in table 'tb_experiencia_medicamentos'
ALTER TABLE [dbo].[tb_experiencia_medicamentos]
ADD CONSTRAINT [fk_tb_experiencia_medicamentos_tb_resposta3]
    FOREIGN KEY ([IdRespostaGrauEntendimento])
    REFERENCES [dbo].[tb_resposta]
        ([IdResposta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_experiencia_medicamentos_tb_resposta3'
CREATE INDEX [IX_fk_tb_experiencia_medicamentos_tb_resposta3]
ON [dbo].[tb_experiencia_medicamentos]
    ([IdRespostaGrauEntendimento]);
GO

-- Creating foreign key on [IdRespostaCultural] in table 'tb_experiencia_medicamentos'
ALTER TABLE [dbo].[tb_experiencia_medicamentos]
ADD CONSTRAINT [fk_tb_experiencia_medicamentos_tb_resposta4]
    FOREIGN KEY ([IdRespostaCultural])
    REFERENCES [dbo].[tb_resposta]
        ([IdResposta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_experiencia_medicamentos_tb_resposta4'
CREATE INDEX [IX_fk_tb_experiencia_medicamentos_tb_resposta4]
ON [dbo].[tb_experiencia_medicamentos]
    ([IdRespostaCultural]);
GO

-- Creating foreign key on [IdRespostaComportamento] in table 'tb_experiencia_medicamentos'
ALTER TABLE [dbo].[tb_experiencia_medicamentos]
ADD CONSTRAINT [fk_tb_experiencia_medicamentos_tb_resposta5]
    FOREIGN KEY ([IdRespostaComportamento])
    REFERENCES [dbo].[tb_resposta]
        ([IdResposta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_experiencia_medicamentos_tb_resposta5'
CREATE INDEX [IX_fk_tb_experiencia_medicamentos_tb_resposta5]
ON [dbo].[tb_experiencia_medicamentos]
    ([IdRespostaComportamento]);
GO

-- Creating foreign key on [IdRespostaIncorporadoPlano] in table 'tb_experiencia_medicamentos'
ALTER TABLE [dbo].[tb_experiencia_medicamentos]
ADD CONSTRAINT [fk_tb_experiencia_medicamentos_tb_resposta6]
    FOREIGN KEY ([IdRespostaIncorporadoPlano])
    REFERENCES [dbo].[tb_resposta]
        ([IdResposta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_experiencia_medicamentos_tb_resposta6'
CREATE INDEX [IX_fk_tb_experiencia_medicamentos_tb_resposta6]
ON [dbo].[tb_experiencia_medicamentos]
    ([IdRespostaIncorporadoPlano]);
GO

-- Creating foreign key on [IdMedicamento] in table 'tb_medicamento_nao_prescrito'
ALTER TABLE [dbo].[tb_medicamento_nao_prescrito]
ADD CONSTRAINT [fk_tb_medicamento_prescrito_tb_medicamentos1]
    FOREIGN KEY ([IdMedicamento])
    REFERENCES [dbo].[tb_medicamentos]
        ([IdMedicamento])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_medicamento_prescrito_tb_medicamentos1'
CREATE INDEX [IX_fk_tb_medicamento_prescrito_tb_medicamentos1]
ON [dbo].[tb_medicamento_nao_prescrito]
    ([IdMedicamento]);
GO

-- Creating foreign key on [IdMedicamento] in table 'tb_medicamento_prescrito'
ALTER TABLE [dbo].[tb_medicamento_prescrito]
ADD CONSTRAINT [fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos2]
    FOREIGN KEY ([IdMedicamento])
    REFERENCES [dbo].[tb_medicamentos]
        ([IdMedicamento])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos2'
CREATE INDEX [IX_fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos2]
ON [dbo].[tb_medicamento_prescrito]
    ([IdMedicamento]);
GO

-- Creating foreign key on [IdMedicamento] in table 'tb_medicamentos_anteriores'
ALTER TABLE [dbo].[tb_medicamentos_anteriores]
ADD CONSTRAINT [fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos1]
    FOREIGN KEY ([IdMedicamento])
    REFERENCES [dbo].[tb_medicamentos]
        ([IdMedicamento])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos1'
CREATE INDEX [IX_fk_tb_consulta_variavel_has_tb_medicamentos_tb_medicamentos1]
ON [dbo].[tb_medicamentos_anteriores]
    ([IdMedicamento]);
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

-- Creating foreign key on [IdPaciente] in table 'tb_relato_clinico'
ALTER TABLE [dbo].[tb_relato_clinico]
ADD CONSTRAINT [fk_tb_relato_clinico_tb_paciente1]
    FOREIGN KEY ([IdPaciente])
    REFERENCES [dbo].[tb_paciente]
        ([IdPaciente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_relato_clinico_tb_paciente1'
CREATE INDEX [IX_fk_tb_relato_clinico_tb_paciente1]
ON [dbo].[tb_relato_clinico]
    ([IdPaciente]);
GO

-- Creating foreign key on [IdPergunta] in table 'tb_resposta'
ALTER TABLE [dbo].[tb_resposta]
ADD CONSTRAINT [fk_tb_resposta_tb_pergunta1]
    FOREIGN KEY ([IdPergunta])
    REFERENCES [dbo].[tb_pergunta]
        ([IdPergunta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'fk_tb_resposta_tb_pergunta1'
CREATE INDEX [IX_fk_tb_resposta_tb_pergunta1]
ON [dbo].[tb_resposta]
    ([IdPergunta]);
GO

-- Creating foreign key on [tb_curso_IdCurso] in table 'tb_curso_disciplina'
ALTER TABLE [dbo].[tb_curso_disciplina]
ADD CONSTRAINT [FK_tb_curso_disciplina_CursoE]
    FOREIGN KEY ([tb_curso_IdCurso])
    REFERENCES [dbo].[tb_curso]
        ([IdCurso])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [tb_disciplina_IdDisciplina] in table 'tb_curso_disciplina'
ALTER TABLE [dbo].[tb_curso_disciplina]
ADD CONSTRAINT [FK_tb_curso_disciplina_DisciplinaE]
    FOREIGN KEY ([tb_disciplina_IdDisciplina])
    REFERENCES [dbo].[tb_disciplina]
        ([IdDisciplina])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_tb_curso_disciplina_DisciplinaE'
CREATE INDEX [IX_FK_tb_curso_disciplina_DisciplinaE]
ON [dbo].[tb_curso_disciplina]
    ([tb_disciplina_IdDisciplina]);
GO

-- Creating foreign key on [tb_resposta_IdResposta] in table 'tb_consulta_variavel'
ALTER TABLE [dbo].[tb_consulta_variavel]
ADD CONSTRAINT [FK_tb_razao_encontro]
    FOREIGN KEY ([tb_resposta_IdResposta])
    REFERENCES [dbo].[tb_resposta]
        ([IdResposta])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_tb_razao_encontro'
CREATE INDEX [IX_FK_tb_razao_encontro]
ON [dbo].[tb_consulta_variavel]
    ([tb_resposta_IdResposta]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------