SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `pv1`.`tb_turma` DROP FOREIGN KEY `fk_tb_turma_tb_disciplina1` ;

ALTER TABLE `pv1`.`tb_turma` 
  ADD CONSTRAINT `fk_tb_turma_tb_disciplina1`
  FOREIGN KEY (`IdDisciplina` )
  REFERENCES `pv1`.`tb_disciplina` (`IdDisciplina` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `pv1`.`tb_consulta_variavel` DROP FOREIGN KEY `fk_tb_consulta_variavel_tb_estado_consulta1` ;

ALTER TABLE `pv1`.`tb_consulta_variavel` 
  ADD CONSTRAINT `fk_tb_consulta_variavel_tb_estado_consulta1`
  FOREIGN KEY (`idEstadoConsulta` )
  REFERENCES `pv1`.`tb_estado_consulta` (`idEstadoConsulta` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `pv1`.`tb_consulta_fixo` CHANGE COLUMN `EhGabarito` `EhGabarito` TINYINT(1) NOT NULL DEFAULT false  ;

ALTER TABLE `pv1`.`tb_turma_pessoa` DROP FOREIGN KEY `fk_tb_turma_has_tb_pessoa_tb_turma1` ;

ALTER TABLE `pv1`.`tb_turma_pessoa` 
  ADD CONSTRAINT `fk_tb_turma_has_tb_pessoa_tb_turma1`
  FOREIGN KEY (`IdTurma` )
  REFERENCES `pv1`.`tb_turma` (`IdTurma` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `pv1`.`tb_consulta_variavel_queixa` CHANGE COLUMN `Tipo` `Tipo` CHAR NOT NULL  ;

ALTER TABLE `pv1`.`tb_queixa_medicamentos` ADD COLUMN `IdSuspeitaPRM` INT(11) NOT NULL  AFTER `Cumprimento` , 
  ADD CONSTRAINT `fk_tb_queixa_medicamentos_tb_suspeita_prm1`
  FOREIGN KEY (`IdSuspeitaPRM` )
  REFERENCES `pv1`.`tb_suspeita_prm` (`IdSuspeitaPRM` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
, ADD INDEX `fk_tb_queixa_medicamentos_tb_suspeita_prm1` (`IdSuspeitaPRM` ASC) ;

ALTER TABLE `pv1`.`tb_diario_pessoal` CHANGE COLUMN `Periodo` `Periodo` CHAR NOT NULL  , DROP FOREIGN KEY `fk_tb_diario_pessoal_tb_medicamentos1` , DROP FOREIGN KEY `fk_tb_diario_pessoal_tb_consulta_fixo1` ;

ALTER TABLE `pv1`.`tb_diario_pessoal` 
  ADD CONSTRAINT `fk_tb_diario_pessoal_tb_medicamentos1`
  FOREIGN KEY (`IdMedicamento` )
  REFERENCES `pv1`.`tb_medicamentos` (`IdMedicamento` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION, 
  ADD CONSTRAINT `fk_tb_diario_pessoal_tb_consulta_fixo1`
  FOREIGN KEY (`IdConsultaFixo` )
  REFERENCES `pv1`.`tb_consulta_fixo` (`IdConsultaFixo` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `pv1`.`tb_consulta_variavel_intervencao` CHANGE COLUMN `comunicaPaciente` `comunicaPaciente` TINYINT(1) NOT NULL DEFAULT false  , CHANGE COLUMN `comunicaOutro` `comunicaOutro` TINYINT(1) NOT NULL DEFAULT false  , DROP FOREIGN KEY `fk_tb_intervencao_has_tb_consulta_variavel_tb_intervencao1` ;

ALTER TABLE `pv1`.`tb_consulta_variavel_intervencao` 
  ADD CONSTRAINT `fk_tb_intervencao_has_tb_consulta_variavel_tb_intervencao1`
  FOREIGN KEY (`IdIntervencao` )
  REFERENCES `pv1`.`tb_intervencao` (`IdIntervencao` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE  TABLE IF NOT EXISTS `pv1`.`tb_suspeita_prm` (
  `IdSuspeitaPRM` INT(11) NOT NULL AUTO_INCREMENT ,
  `Descricao` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`IdSuspeitaPRM`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
