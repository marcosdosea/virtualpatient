-- Nova disciplina

INSERT INTO `pv1`.`tb_disciplina` (`NomeDisciplina`) VALUES ('Administrador do Sistema');

-- Novas turmas 

INSERT INTO `pv1`.`tb_turma` (`IdTurma`, `IdDisciplina`, `IdCurso`, `IdInstituicao`, `Codigo`, `Periodo`, `Ativa`) VALUES ('4', '4', '2', '1', 'ENF01-ADMIN', '2014-1', '1');
INSERT INTO `pv1`.`tb_turma` (`IdTurma`, `IdDisciplina`, `IdCurso`, `IdInstituicao`, `Codigo`, `Periodo`, `Ativa`) VALUES ('5', '4', '1', '1', 'FAR01-ADMIN', '2014-1', '1');

-- Novos Administradores

INSERT INTO `pv1`.`my_aspnet_roles` (`id`, `applicationId`, `name`) VALUES ('4', '1', 'administrador_enfermagem');
INSERT INTO `pv1`.`my_aspnet_roles` (`id`, `applicationId`, `name`) VALUES ('5', '1', 'administrador_farmacia');

-- Torna Alessandra, Werlissandra e Elielma em Administradoras Enfermagem e Farmacia 

INSERT INTO `pv1`.`tb_turma_pessoa` (`IdTurma`, `IdPessoa`, `IdRole`, `Ativa`) VALUES ('5', '5', '5', '1');
INSERT INTO `pv1`.`tb_turma_pessoa` (`IdTurma`, `IdPessoa`, `IdRole`, `Ativa`) VALUES ('5', '9', '5', '1');
INSERT INTO `pv1`.`tb_turma_pessoa` (`IdTurma`, `IdPessoa`, `IdRole`, `Ativa`) VALUES ('4', '6', '4', '1');

-- novo estado de preenchimento

INSERT INTO `pv1`.`tb_estado_consulta` (`IdEstadoConsulta`, `DescricaoEstado`) VALUES ('8', 'Gabarito Em Preenchimento');

-- tirar os espaços em branco do campo SimetriaToracica de oxigenação

ALTER TABLE `pv1`.`tb_oxiginecao` 
CHANGE COLUMN `SimetriaToracica` `SimetriaToracica` ENUM('Simetrico','AssimetricoUnilateral','AssimetricoBilateral') NOT NULL DEFAULT 'Simetrico' ;

-- remove turmas duplicadas

DELETE FROM `pv1`.`tb_turma` WHERE `IdTurma`='6';
DELETE FROM `pv1`.`tb_turma` WHERE `IdTurma`='7';
