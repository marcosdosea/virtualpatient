SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `pv1`.`tb_consulta_variavel` 
CHANGE COLUMN `NotaAluno` `NotaAluno` DECIMAL NOT NULL DEFAULT 0 ;

ALTER TABLE `pv1`.`tb_consulta_fixo` 
CHANGE COLUMN `EhGabarito` `EhGabarito` TINYINT(1) NOT NULL DEFAULT false ;

ALTER TABLE `pv1`.`tb_exames_fisicos` 
ADD COLUMN `CircunferenciaAbdominal` FLOAT(11) NULL DEFAULT NULL AFTER `IndiceMassaCorporea`;

ALTER TABLE `pv1`.`tb_turma_pessoa` 
CHANGE COLUMN `Ativa` `Ativa` TINYINT(1) NOT NULL DEFAULT FALSE ;

ALTER TABLE `pv1`.`tb_queixa_medicamentos` 
CHANGE COLUMN `Resolvido` `Resolvido` TINYINT(1) NOT NULL DEFAULT false ;

ALTER TABLE `pv1`.`tb_consulta_variavel_intervencao` 
CHANGE COLUMN `comunicaPaciente` `comunicaPaciente` TINYINT(1) NOT NULL DEFAULT false ,
CHANGE COLUMN `comunicaOutro` `comunicaOutro` TINYINT(1) NOT NULL DEFAULT false ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
