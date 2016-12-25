-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Schema knjizara
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `knjizara` ;

-- -----------------------------------------------------
-- Schema knjizara
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `knjizara` DEFAULT CHARACTER SET utf8 ;
USE `knjizara` ;

-- -----------------------------------------------------
-- Table `knjizara`.`autor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`autor` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`autor` (
  `ID_autora` INT(11) NOT NULL AUTO_INCREMENT,
  `Ime` VARCHAR(45) NOT NULL,
  `Prezime` VARCHAR(45) NOT NULL,
  `Opis` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_autora`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`izdavac`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`izdavac` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`izdavac` (
  `ID_izdavaca` INT(11) NOT NULL AUTO_INCREMENT,
  `Naziv` VARCHAR(45) NOT NULL,
  `Adresa` VARCHAR(100) NOT NULL,
  `Grad` VARCHAR(45) NOT NULL,
  `Drzava` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_izdavaca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`knjiga`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`knjiga` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`knjiga` (
  `ISBN` BIGINT(13) NOT NULL,
  `Naziv` VARCHAR(100) NOT NULL,
  `Opis` TEXT NULL DEFAULT NULL,
  `Dostupno_komada` SMALLINT(6) NULL DEFAULT NULL,
  `Format` VARCHAR(15) NOT NULL,
  `Broj_strana` SMALLINT(6) NOT NULL,
  `Godina_izdanja` DATE NOT NULL,
  `Cena` DOUBLE(10,2) NOT NULL,
  `Na_popustu` TINYINT(3) NULL DEFAULT NULL,
  `Izdavac_ID_izdavaca` INT(11) NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `fk_Knjiga_Izdavac1_idx` (`Izdavac_ID_izdavaca` ASC),
  CONSTRAINT `fk_Knjiga_Izdavac1`
    FOREIGN KEY (`Izdavac_ID_izdavaca`)
    REFERENCES `knjizara`.`izdavac` (`ID_izdavaca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`knjiga_ima_autor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`knjiga_ima_autor` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`knjiga_ima_autor` (
  `knjiga_ISBN` BIGINT(13) NOT NULL,
  `Autor_ID_autora` INT(11) NOT NULL,
  PRIMARY KEY (`knjiga_ISBN`, `Autor_ID_autora`),
  INDEX `fk_Knjiga_ima_Autor_Autor1_idx` (`Autor_ID_autora` ASC),
  INDEX `fk_knjiga_ima_autor_knjiga1_idx` (`knjiga_ISBN` ASC),
  CONSTRAINT `fk_Knjiga_ima_Autor_Autor1`
    FOREIGN KEY (`Autor_ID_autora`)
    REFERENCES `knjizara`.`autor` (`ID_autora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_knjiga_ima_autor_knjiga1`
    FOREIGN KEY (`knjiga_ISBN`)
    REFERENCES `knjizara`.`knjiga` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`pismo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`pismo` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`pismo` (
  `ID_pisma` INT(11) NOT NULL AUTO_INCREMENT,
  `Vrsta` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID_pisma`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`knjiga_ima_pismo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`knjiga_ima_pismo` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`knjiga_ima_pismo` (
  `knjiga_ISBN` BIGINT(13) NOT NULL,
  `Pismo_ID_pisma` INT(11) NOT NULL,
  PRIMARY KEY (`knjiga_ISBN`, `Pismo_ID_pisma`),
  INDEX `fk_Knjiga_ima_Pismo_Pismo1_idx` (`Pismo_ID_pisma` ASC),
  INDEX `fk_knjiga_ima_pismo_knjiga1_idx` (`knjiga_ISBN` ASC),
  CONSTRAINT `fk_Knjiga_ima_Pismo_Pismo1`
    FOREIGN KEY (`Pismo_ID_pisma`)
    REFERENCES `knjizara`.`pismo` (`ID_pisma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_knjiga_ima_pismo_knjiga1`
    FOREIGN KEY (`knjiga_ISBN`)
    REFERENCES `knjizara`.`knjiga` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`zanr`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`zanr` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`zanr` (
  `ID_zanra` INT(11) NOT NULL AUTO_INCREMENT,
  `Naziv` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_zanra`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`knjiga_ima_zanr`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`knjiga_ima_zanr` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`knjiga_ima_zanr` (
  `knjiga_ISBN` BIGINT(13) NOT NULL,
  `Zanr_ID_zanra` INT(11) NOT NULL,
  PRIMARY KEY (`knjiga_ISBN`, `Zanr_ID_zanra`),
  INDEX `fk_Knjiga_ima_Zanr_Zanr1_idx` (`Zanr_ID_zanra` ASC),
  INDEX `fk_knjiga_ima_zanr_knjiga1_idx` (`knjiga_ISBN` ASC),
  CONSTRAINT `fk_Knjiga_ima_Zanr_Zanr1`
    FOREIGN KEY (`Zanr_ID_zanra`)
    REFERENCES `knjizara`.`zanr` (`ID_zanra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_knjiga_ima_zanr_knjiga1`
    FOREIGN KEY (`knjiga_ISBN`)
    REFERENCES `knjizara`.`knjiga` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`Potpisane_knjige`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`Potpisane_knjige` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`Potpisane_knjige` (
  `knjiga_ISBN` BIGINT(13) NOT NULL,
  `Komada` SMALLINT NOT NULL,
  PRIMARY KEY (`knjiga_ISBN`),
  CONSTRAINT `fk_Potpisane_knjige_knjiga1`
    FOREIGN KEY (`knjiga_ISBN`)
    REFERENCES `knjizara`.`knjiga` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
