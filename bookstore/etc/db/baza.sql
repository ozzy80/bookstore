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
-- Table `knjizara`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`users` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`users` (
  `username` VARCHAR(50) NOT NULL UNIQUE,
  `password` VARCHAR(50) NOT NULL,
  `enabled` TINYINT(1) NOT NULL,
  `userId` INT(11) NOT NULL AUTO_INCREMENT,
  `customerId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB
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
  CONSTRAINT `fk_authorities_users`
    FOREIGN KEY (`username`)
    REFERENCES `knjizara`.`users` (`username`))
ENGINE = InnoDB
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
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`shippingaddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`shippingaddress` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`shippingaddress` (
  `shippingAddressId` INT(11) NOT NULL AUTO_INCREMENT,
  `apartmentNumber` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `country` VARCHAR(255) NULL DEFAULT NULL,
  `postalCode` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `streetName` VARCHAR(255) NULL DEFAULT NULL,
  `customer_customerId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`shippingAddressId`),
  INDEX `FK_kp5axwmlh26rmgtx8hasjw32a` (`customer_customerId` ASC),
  CONSTRAINT `FK_kp5axwmlh26rmgtx8hasjw32a`
    FOREIGN KEY (`customer_customerId`)
    REFERENCES `knjizara`.`customer` (`customerId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`cart` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`cart` (
  `cartId` INT(11) NOT NULL AUTO_INCREMENT,
  `grandTotal` DOUBLE NULL DEFAULT NULL,
  `customerId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cartId`),
  INDEX `FK_phw8s97kjckd9ejjxoa6t1v97` (`customerId` ASC),
  CONSTRAINT `FK_phw8s97kjckd9ejjxoa6t1v97`
    FOREIGN KEY (`customerId`)
    REFERENCES `knjizara`.`customer` (`customerId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`customer` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`customer` (
  `customerId` INT(11) NOT NULL AUTO_INCREMENT,
  `customerEmail` VARCHAR(255) NULL DEFAULT NULL,
  `customerName` VARCHAR(255) NULL DEFAULT NULL,
  `enabled` BIT(1) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  `username` VARCHAR(255) NULL DEFAULT NULL,
  `billingAddressId` INT(11) NULL DEFAULT NULL,
  `cartId` INT(11) NULL DEFAULT NULL,
  `shippingAddressId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`customerId`),
  INDEX `FK_mtw9l8vwffxp289ya2xc76ga3` (`billingAddressId` ASC),
  INDEX `FK_ib3d22903soyarhf3s9hatrgs` (`cartId` ASC),
  INDEX `FK_bmse5m5dyprp601k0dhsm0j4r` (`shippingAddressId` ASC),
  CONSTRAINT `FK_bmse5m5dyprp601k0dhsm0j4r`
    FOREIGN KEY (`shippingAddressId`)
    REFERENCES `knjizara`.`shippingaddress` (`shippingAddressId`),
  CONSTRAINT `FK_ib3d22903soyarhf3s9hatrgs`
    FOREIGN KEY (`cartId`)
    REFERENCES `knjizara`.`cart` (`cartId`),
  CONSTRAINT `FK_mtw9l8vwffxp289ya2xc76ga3`
    FOREIGN KEY (`billingAddressId`)
    REFERENCES `knjizara`.`billingaddress` (`billingAddressId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`billingaddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`billingaddress` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`billingaddress` (
  `billingAddressId` INT(11) NOT NULL AUTO_INCREMENT,
  `apartmentNumber` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `country` VARCHAR(255) NULL DEFAULT NULL,
  `postalCode` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(255) NULL DEFAULT NULL,
  `streetName` VARCHAR(255) NULL DEFAULT NULL,
  `customer_customerId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`billingAddressId`),
  INDEX `FK_i2cdj3dyr8ndgddd2bvgt9sj2` (`customer_customerId` ASC),
  CONSTRAINT `FK_i2cdj3dyr8ndgddd2bvgt9sj2`
    FOREIGN KEY (`customer_customerId`)
    REFERENCES `knjizara`.`customer` (`customerId`))
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
AUTO_INCREMENT = 5
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
-- Table `knjizara`.`cartitem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`cartitem` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`cartitem` (
  `cartItemId` INT(11) NOT NULL AUTO_INCREMENT,
  `quantity` INT(11) NULL DEFAULT NULL,
  `totalPrice` DOUBLE NULL DEFAULT NULL,
  `productId` BIGINT(20) NULL DEFAULT NULL,
  `cartId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cartItemId`),
  INDEX `FK_dmdb6wgmc7brt4xq7q77fy9m7` (`productId` ASC),
  INDEX `FK_lnihf1ejcjeelthi5b80fjsjo` (`cartId` ASC),
  CONSTRAINT `FK_dmdb6wgmc7brt4xq7q77fy9m7`
    FOREIGN KEY (`productId`)
    REFERENCES `knjizara`.`knjiga` (`ISBN`),
  CONSTRAINT `FK_lnihf1ejcjeelthi5b80fjsjo`
    FOREIGN KEY (`cartId`)
    REFERENCES `knjizara`.`cart` (`cartId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `knjizara`.`customerorder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `knjizara`.`customerorder` ;

CREATE TABLE IF NOT EXISTS `knjizara`.`customerorder` (
  `customerOrderId` INT(11) NOT NULL AUTO_INCREMENT,
  `billingAddressId` INT(11) NULL DEFAULT NULL,
  `cartId` INT(11) NULL DEFAULT NULL,
  `customerId` INT(11) NULL DEFAULT NULL,
  `shippingAddressId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`customerOrderId`),
  INDEX `FK_sr8agpevh46lsyyt71letasue` (`billingAddressId` ASC),
  INDEX `FK_kpgns6o3ay2s2njamgh4y5gb7` (`cartId` ASC),
  INDEX `FK_ixdsuv40qjm4j4jr93x2udlh0` (`customerId` ASC),
  INDEX `FK_2q0bs35vec7xgxtvheqmoorkc` (`shippingAddressId` ASC),
  CONSTRAINT `FK_2q0bs35vec7xgxtvheqmoorkc`
    FOREIGN KEY (`shippingAddressId`)
    REFERENCES `knjizara`.`shippingaddress` (`shippingAddressId`),
  CONSTRAINT `FK_ixdsuv40qjm4j4jr93x2udlh0`
    FOREIGN KEY (`customerId`)
    REFERENCES `knjizara`.`customer` (`customerId`),
  CONSTRAINT `FK_kpgns6o3ay2s2njamgh4y5gb7`
    FOREIGN KEY (`cartId`)
    REFERENCES `knjizara`.`cart` (`cartId`),
  CONSTRAINT `FK_sr8agpevh46lsyyt71letasue`
    FOREIGN KEY (`billingAddressId`)
    REFERENCES `knjizara`.`billingaddress` (`billingAddressId`))
ENGINE = InnoDB
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
AUTO_INCREMENT = 7
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
  `Komada` SMALLINT NOT NULL,
  PRIMARY KEY (`ISBN`),
  CONSTRAINT `fk_Potpisane_knjige_knjiga1`
    FOREIGN KEY (`ISBN`)
    REFERENCES `knjizara`.`knjiga` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;