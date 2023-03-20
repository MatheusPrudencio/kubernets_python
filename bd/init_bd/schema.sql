-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

CREATE TABLE  IF NOT EXISTS `paciente` (
  `nome` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_paciente` int unsigned NOT NULL AUTO_INCREMENT,
  `saldo` int NOT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS `psicologo` (
  `nome` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_psicologo` int unsigned NOT NULL AUTO_INCREMENT,
  `saldo` varchar(45) NOT NULL,
  `cnp` varchar(45) NOT NULL,
  PRIMARY KEY (`id_psicologo`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `CNP_UNIQUE` (`CNP` ASC) VISIBLE);


CREATE TABLE IF NOT EXISTS `sessao` (
  `id_sessao` int NOT NULL AUTO_INCREMENT,
  `recorrencia` varchar(255) NOT NULL,
  `dia_semana` int NOT NULL,
  `hora_inicio` varchar(30) NOT NULL,
  `id_psicologo` int UNSIGNED NOT NULL,
  `em_grupo` int NOT NULL,
  `duracao` varchar(30) NOT NULL,
  `valor` int NOT NULL, 
  PRIMARY KEY (`id_sessao`,`id_psicologo`),
  INDEX `fk_sessao_psicologo_idx` (`id_psicologo` ASC) VISIBLE,
  CONSTRAINT `fk_sessao_psicologo`
  FOREIGN KEY (`id_psicologo`)
  REFERENCES `psicologo` (`id_psicologo`)
);

CREATE TABLE IF NOT EXISTS `mydb`.`paciente_tem_sessao` (
  `id_paciente` INT UNSIGNED NOT NULL,
  `id_sessao` INT NOT NULL,
  `id_psicologo` INT UNSIGNED NOT NULL,
  `data` DATE NOT NULL,
  `pago` int NOT NULL,
  PRIMARY KEY (`id_paciente`, `id_sessao`, `id_psicologo`),
  INDEX `fk_paciente_has_sessao_sessao1_idx` (`id_sessao` ASC, `id_psicologo` ASC) VISIBLE,
  INDEX `fk_paciente_has_sessao_paciente1_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_paciente_has_sessao_paciente1`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `mydb`.`paciente` (`id_paciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paciente_has_sessao_sessao1`
    FOREIGN KEY (`id_sessao` , `id_psicologo`)
    REFERENCES `mydb`.`sessao` (`id_sessao` , `id_psicologo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
