SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `pv1`.`tb_carta` 
DROP FOREIGN KEY `fk_tb_carta_tb_curso1`;

ALTER TABLE `pv1`.`tb_consulta_variavel` 
CHANGE COLUMN `NotaAluno` `NotaAluno` DECIMAL NOT NULL DEFAULT 0 ;

ALTER TABLE `pv1`.`tb_consulta_fixo` 
CHANGE COLUMN `EhGabarito` `EhGabarito` TINYINT(1) NOT NULL DEFAULT false ;

ALTER TABLE `pv1`.`tb_turma_pessoa` 
CHANGE COLUMN `Ativa` `Ativa` TINYINT(1) NOT NULL DEFAULT FALSE ;

ALTER TABLE `pv1`.`tb_queixa_medicamentos` 
CHANGE COLUMN `Resolvido` `Resolvido` TINYINT(1) NOT NULL DEFAULT false ;

ALTER TABLE `pv1`.`tb_consulta_variavel_intervencao` 
CHANGE COLUMN `comunicaPaciente` `comunicaPaciente` TINYINT(1) NOT NULL DEFAULT false ,
CHANGE COLUMN `comunicaOutro` `comunicaOutro` TINYINT(1) NOT NULL DEFAULT false ;

ALTER TABLE `pv1`.`tb_carta` 
DROP COLUMN `IdCursoProfissionalEncaminhado`,
ADD COLUMN `IdEspecialidade` INT(11) NOT NULL AFTER `IdConsultaVariavel`,
ADD INDEX `fk_tb_carta_tb_especialidade1_idx` (`IdEspecialidade` ASC),
DROP INDEX `fk_tb_carta_tb_curso1_idx` ;

CREATE TABLE IF NOT EXISTS `pv1`.`tb_especialidade` (
  `IdEspecialidade` INT(11) NOT NULL AUTO_INCREMENT,
  `Descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`IdEspecialidade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci;

ALTER TABLE `pv1`.`tb_carta` 
ADD CONSTRAINT `fk_tb_carta_tb_especialidade1`
  FOREIGN KEY (`IdEspecialidade`)
  REFERENCES `pv1`.`tb_especialidade` (`IdEspecialidade`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
