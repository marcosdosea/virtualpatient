-- Aumento do campo justificativa da consulta intervenção

ALTER TABLE `pv1`.`tb_consulta_variavel_intervencao` 
CHANGE COLUMN `Justificativa` `Justificativa` VARCHAR(500) NULL DEFAULT NULL ;
