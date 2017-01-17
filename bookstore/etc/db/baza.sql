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
-- Table `knjizara`.`Adresa_isporuke`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`Adresa_isporuke` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`Adresa_isporuke` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Broj_kuce` VARCHAR(255) NOT NULL,
  `Grad` VARCHAR(255) NOT NULL,
  `Drzava` VARCHAR(255) NOT NULL,
  `Postanski_broj` VARCHAR(255) NOT NULL,
  `Provincija` VARCHAR(255) NOT NULL,
  `Ulica` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`Adresa_kartice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`Adresa_kartice` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`Adresa_kartice` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `Broj_kuce` VARCHAR(255) NOT NULL,
  `Grad` VARCHAR(255) NOT NULL,
  `Drzava` VARCHAR(255) NOT NULL,
  `postanski_broj` VARCHAR(255) NOT NULL,
  `Provincija` VARCHAR(255) NOT NULL,
  `Ulica` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`users` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`users` (
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `enabled` TINYINT(1) NOT NULL,
  `userId` INT(11) NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `telefon` VARCHAR(45) NULL,
  `Adresa_isporukeId` INT(11) NOT NULL,
  `Adresa_karticeId` INT(11) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `username` (`username` ASC),
  INDEX `fk_users_shippingaddress1_idx` (`Adresa_isporukeId` ASC),
  INDEX `fk_users_billingaddress1_idx` (`Adresa_karticeId` ASC),
  CONSTRAINT `fk_users_shippingaddress1`
    FOREIGN KEY (`Adresa_isporukeId`)
    REFERENCES `knjizara`.`Adresa_isporuke` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_billingaddress1`
    FOREIGN KEY (`Adresa_karticeId`)
    REFERENCES `knjizara`.`Adresa_kartice` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`authorities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`authorities` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`authorities` (
  `username` VARCHAR(50) NOT NULL,
  `authority` VARCHAR(50) NOT NULL,
  `authorityId` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`authorityId`),
  INDEX `fk_authorities_users` (`username` ASC),
  CONSTRAINT `fk_authorities_users`
    FOREIGN KEY (`username`)
    REFERENCES `knjizara`.`users` (`username`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


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
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`narudzbenica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`narudzbenica` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`narudzbenica` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `datum_pravljenja` DATE NOT NULL,
  `datum_isporuke` DATE NULL,
  `status` VARCHAR(45) NOT NULL,
  `korisnikId` INT(11) NOT NULL,
  `adresa_karticeId` INT(11) NULL,
  `adresa_isporukeId` INT(11) NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_cart_users1_idx` (`korisnikId` ASC),
  INDEX `fk_cart_billingaddress1_idx` (`adresa_karticeId` ASC),
  INDEX `fk_cart_shippingaddress1_idx` (`adresa_isporukeId` ASC),
  CONSTRAINT `fk_cart_users1`
    FOREIGN KEY (`korisnikId`)
    REFERENCES `knjizara`.`users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_billingaddress1`
    FOREIGN KEY (`adresa_karticeId`)
    REFERENCES `knjizara`.`Adresa_kartice` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_shippingaddress1`
    FOREIGN KEY (`adresa_isporukeId`)
    REFERENCES `knjizara`.`Adresa_isporuke` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
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
AUTO_INCREMENT = 3
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
AUTO_INCREMENT = 3
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
  `pismo_ID_pisma` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `fk_Knjiga_Izdavac1_idx` (`Izdavac_ID_izdavaca` ASC),
  INDEX `FK_ogl23r3w3fjqx8ol9qt9fmue8` (`pismo_ID_pisma` ASC),
  CONSTRAINT `FK_ogl23r3w3fjqx8ol9qt9fmue8`
    FOREIGN KEY (`pismo_ID_pisma`)
    REFERENCES `knjizara`.`pismo` (`ID_pisma`),
  CONSTRAINT `fk_Knjiga_Izdavac1`
    FOREIGN KEY (`Izdavac_ID_izdavaca`)
    REFERENCES `knjizara`.`izdavac` (`ID_izdavaca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`narudzbina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`narudzbina` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`narudzbina` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `kolicina` INT(11) NOT NULL,
  `cena` DOUBLE NOT NULL,
  `ISBN` BIGINT(13) NOT NULL,
  `narudzbenicaId` INT(11) NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_cartitem_knjiga1_idx` (`ISBN` ASC),
  INDEX `fk_cartitem_cart1_idx` (`narudzbenicaId` ASC),
  CONSTRAINT `fk_cartitem_knjiga1`
    FOREIGN KEY (`ISBN`)
    REFERENCES `knjizara`.`knjiga` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cartitem_cart1`
    FOREIGN KEY (`narudzbenicaId`)
    REFERENCES `knjizara`.`narudzbenica` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`knjiga_ima_autor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`knjiga_ima_autor` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`knjiga_ima_autor` (
  `ISBN` BIGINT(13) NOT NULL,
  `ID_autora` INT(11) NOT NULL,
  PRIMARY KEY (`ISBN`, `ID_autora`),
  INDEX `fk_Knjiga_ima_Autor_Autor1_idx` (`ID_autora` ASC),
  INDEX `fk_knjiga_ima_autor_knjiga1_idx` (`ISBN` ASC),
  CONSTRAINT `fk_Knjiga_ima_Autor_Autor1`
    FOREIGN KEY (`ID_autora`)
    REFERENCES `knjizara`.`autor` (`ID_autora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_knjiga_ima_autor_knjiga1`
    FOREIGN KEY (`ISBN`)
    REFERENCES `knjizara`.`knjiga` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`knjiga_ima_zanr`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`knjiga_ima_zanr` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`knjiga_ima_zanr` (
  `ISBN` BIGINT(13) NOT NULL,
  `ID_zanra` INT(11) NOT NULL,
  PRIMARY KEY (`ISBN`, `ID_zanra`),
  INDEX `fk_Knjiga_ima_Zanr_Zanr1_idx` (`ID_zanra` ASC),
  INDEX `fk_knjiga_ima_zanr_knjiga1_idx` (`ISBN` ASC),
  CONSTRAINT `fk_Knjiga_ima_Zanr_Zanr1`
    FOREIGN KEY (`ID_zanra`)
    REFERENCES `knjizara`.`zanr` (`ID_zanra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_knjiga_ima_zanr_knjiga1`
    FOREIGN KEY (`ISBN`)
    REFERENCES `knjizara`.`knjiga` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`potpisane_knjige`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`potpisane_knjige` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`potpisane_knjige` (
  `ISBN` BIGINT(13) NOT NULL,
  `Komada` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`ISBN`),
  CONSTRAINT `fk_Potpisane_knjige_knjiga1`
    FOREIGN KEY (`ISBN`)
    REFERENCES `knjizara`.`knjiga` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`top_knjige`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`top_knjige` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`top_knjige` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `knjiga_ISBN` BIGINT(13) NOT NULL,
  `pocetak_vazenja` DATE NOT NULL,
  `kraj_vazenja` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `knjiga_ISBN` (`knjiga_ISBN` ASC, `pocetak_vazenja` ASC),
  INDEX `fk_top_knjige_knjiga1_idx` (`knjiga_ISBN` ASC),
  CONSTRAINT `fk_top_knjige_knjiga1`
    FOREIGN KEY (`knjiga_ISBN`)
    REFERENCES `knjizara`.`knjiga` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
