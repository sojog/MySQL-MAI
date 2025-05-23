-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema uni
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema uni
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `uni` DEFAULT CHARACTER SET utf8 ;
USE `uni` ;

-- -----------------------------------------------------
-- Table `uni`.`profesori`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni`.`profesori` (
  `idprofesor` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NULL,
  `prenume` VARCHAR(45) NULL,
  `adresa` VARCHAR(45) NULL,
  `data_nasterii` DATE NULL,
  `grad` ENUM('I', 'II', 'III') NULL,
  PRIMARY KEY (`idprofesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uni`.`cursuri`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni`.`cursuri` (
  `id_curs` INT NOT NULL AUTO_INCREMENT,
  `titlu_curs` VARCHAR(45) NULL,
  `an` TINYINT(1) NULL DEFAULT 1,
  `semestru` TINYINT(1) NULL DEFAULT 1,
  `credite` TINYINT(1) NULL,
  PRIMARY KEY (`id_curs`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uni`.`studenti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni`.`studenti` (
  `idstudent` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NULL,
  `prenume` VARCHAR(45) NULL,
  `data_nasterii` DATETIME NULL,
  `gen` ENUM('M', 'F') NULL,
  `an` TINYINT(1) NULL DEFAULT 1,
  `grupa` VARCHAR(10) NULL,
  `bursa` INT NULL,
  `status` ENUM('restantier', 'bursier', 'admis') NULL DEFAULT 'admis',
  PRIMARY KEY (`idstudent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uni`.`didactic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni`.`didactic` (
  `id_prof` INT NOT NULL,
  `id_curs` INT NOT NULL,
  PRIMARY KEY (`id_prof`, `id_curs`),
  INDEX `fk_didactic_cursuri1_idx` (`id_curs` ASC) VISIBLE,
  CONSTRAINT `fk_didactic_profesori1`
    FOREIGN KEY (`id_prof`)
    REFERENCES `uni`.`profesori` (`idprofesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_didactic_cursuri1`
    FOREIGN KEY (`id_curs`)
    REFERENCES `uni`.`cursuri` (`id_curs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uni`.`note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uni`.`note` (
  `idnote` INT NOT NULL,
  `studenti_idstudent` INT NOT NULL,
  `cursuri_id_curs` INT NOT NULL,
  `valoare` INT NULL,
  `data_notare` DATE NULL,
  PRIMARY KEY (`idnote`),
  INDEX `fk_note_studenti1_idx` (`studenti_idstudent` ASC) VISIBLE,
  INDEX `fk_note_cursuri1_idx` (`cursuri_id_curs` ASC) VISIBLE,
  CONSTRAINT `fk_note_studenti1`
    FOREIGN KEY (`studenti_idstudent`)
    REFERENCES `uni`.`studenti` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_note_cursuri1`
    FOREIGN KEY (`cursuri_id_curs`)
    REFERENCES `uni`.`cursuri` (`id_curs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;





USE uni;

SELECT * FROM profesori;
SELECT * FROM studenti;
SELECT * FROM cursuri;
SELECT * FROM note;


INSERT INTO `cursuri` VALUES (11,'HTML',2,1,5),(12,'Informatica',1,2,4),(13,'PHP',2,2,5),(14,'MySQL',2,1,8),(15,'JavaScript',2,2,5),(16,'Tehnologii Web2',3,2,10),(17,'Design',1,1,5),(18,'Android',3,1,6),(19,'PHP OOP',3,2,10),(21,'Logica',1,1,5),(22,'Matematica',1,1,4),(23,'OOP',1,2,7),(24,'BD',2,1,8),(25,'Java',2,2,10),(26,'Tehnologii Web',2,2,5),(27,'Sec. Info.',3,1,5),(28,'Python',3,1,6),(29,'Limbaje formale',2,1,5);

INSERT INTO `profesori` VALUES (1,'Masalag','Sabin',NULL,'1974-04-28','I'),(2,'Buga','Cristi',NULL,'1979-05-22','II'),(3,'Luca','Relu',NULL,'1973-08-25','I'),(4,'Popescu','Laurentiu',NULL,'1969-10-02','II'),(5,'Iacob','Florin',NULL,'1967-06-28','III'),(6,'Anton','Mihaela',NULL,'1967-11-11','II'),(7,'Toma','Cosmin',NULL,'1976-07-07','II'),(8,'Padureanu','Cristian',NULL,'1978-08-28','I'),(9,'Ciob','Stefan',NULL,'1963-05-31','III'),(10,'Albu','Oana',NULL,'1960-10-07','II'),(11,'Moruz','Alexandru',NULL,'1973-04-08','II');

INSERT INTO `studenti` VALUES (100,'Stan','Tudor','1994-08-03','M',3,1,250,'admis'),(101,'Adam','Ionela','1994-05-09','F',3,2,NULL,'admis'),(102,'Petroiu','Ion','1994-03-15','M',3,3,350,'admis'),(103,'Pavel','Andreea','1993-09-11','F',3,1,NULL,'admis'),(104,'Bran','Andreea','1992-03-15','F',3,2,NULL,'admis'),(105,'Stanciu','Ionela','1992-12-18','F',3,3,NULL,'admis'),(106,'Tamas','George','1993-07-15','M',3,1,350,'admis'),(107,'Tucu','Alexandra','1994-09-21','F',3,2,NULL,'admis'),(108,'Popa','Alexandra','1993-12-18','F',3,3,NULL,'admis'),(109,'Merlusca','George','1993-07-25','M',3,1,350,'admis'),(110,'Stanescu','Andrei','1995-08-03','M',2,1,250,'admis'),(111,'Arhire','Ionut','1995-05-09','M',2,2,NULL,'admis'),(112,'Corbu','Ion','1995-03-15','M',2,3,350,'admis'),(113,'Tataru','Andreea','1994-09-21','F',2,1,NULL,'admis'),(114,'Craciunescu','Andreea','1996-03-15','F',2,2,NULL,'admis'),(115,'Apostol','Ionela','1993-12-28','F',2,3,NULL,'admis'),(116,'Tanase','George','1994-07-15','M',2,1,350,'admis'),(117,'Baciu','Alexandra','1995-09-11','F',2,2,NULL,'admis'),(118,'Anghel','Alexandra','1995-12-28','F',2,3,NULL,'admis'),(119,'Dobre','George','1996-07-15','M',2,1,350,'admis'),(120,'Pintescu','Andrei','1997-08-03','M',1,1,250,'admis'),(121,'Arhire','Alexandra','1996-05-09','F',1,2,NULL,'admis'),(122,'Cobzaru','George','1997-03-15','M',1,3,350,'admis'),(123,'Bucur','Andreea','1996-09-21','F',1,1,NULL,'admis'),(124,'Bumbescu','Andreea','2000-03-15','F',1,2,NULL,'admis'),(125,'Apostol','Alexandra','1997-12-28','F',1,3,NULL,'admis'),(126,'Cobza','George','1997-07-15','M',1,1,350,'admis'),(127,'Baciu','Andreea','1997-09-11','F',1,2,NULL,'admis');

INSERT INTO `didactic` VALUES (1,21),(9,21),(5,22),(3,23),(6,24),(7,24),(8,25),(2,26),(4,27),(7,28),(11,13),(11,19),(10,11),(9,12),(8,29),(6,14);

INSERT INTO `note` VALUES (1,111,21,8,'2017-10-10'),(2,111,22,9,'2018-03-07'),(3,111,23,10,'2017-12-20'),(4,111,24,9,'2017-12-31'),(5,111,25,7,'2017-11-13'),(6,111,26,8,'2018-01-14'),(7,112,21,7,'2017-11-24'),(8,112,22,6,'2018-01-28'),(9,112,23,5,'2017-12-30'),(10,112,24,6,'2017-12-26'),(11,112,25,7,'2018-03-04'),(12,112,26,4,'2018-03-22'),(13,113,21,9,'2017-11-28'),(14,113,22,9,'2018-01-13'),(15,113,23,7,'2018-03-23'),(16,113,24,10,'2017-11-13'),(17,113,25,4,'2017-10-26'),(18,113,26,7,'2018-03-09'),(19,114,21,6,'2017-11-11'),(20,114,22,9,'2017-11-29'),(21,114,23,10,'2018-03-18'),(22,114,24,4,'2018-03-01'),(23,114,25,5,'2017-12-21'),(24,114,26,4,'2018-01-21'),(25,115,21,10,'2018-02-21'),(26,115,22,7,'2017-11-06'),(27,115,23,10,'2017-12-24'),(28,115,24,10,'2018-02-18'),(29,115,25,8,'2018-01-13'),(30,115,26,9,'2018-01-02'),(31,116,21,10,'2018-02-28'),(32,116,22,10,'2018-02-06'),(33,116,23,9,'2017-10-16'),(34,117,21,7,'2017-10-24'),(35,117,22,6,'2017-12-03'),(36,117,23,4,'2017-12-14'),(37,118,21,7,'2017-10-09'),(38,118,22,7,'2018-02-26'),(39,118,23,7,'2017-11-07'),(40,119,21,7,'2017-12-12'),(41,119,22,8,'2017-12-17'),(42,119,23,9,'2018-03-12'),(43,101,21,8,'2017-10-10'),(44,105,21,10,'2018-02-21'),(45,108,21,7,'2017-10-09'),(46,107,21,7,'2017-10-24'),(47,124,21,6,'2017-11-11'),(48,126,21,10,'2018-02-28'),(49,103,21,9,'2017-11-28'),(50,109,21,7,'2017-12-12'),(51,102,21,7,'2017-11-24'),(52,103,22,9,'2018-01-13'),(53,105,22,7,'2017-11-06'),(54,101,22,9,'2018-03-07'),(55,124,22,9,'2017-11-29'),(56,109,22,8,'2017-12-17'),(57,107,22,6,'2017-12-03'),(58,102,22,6,'2018-01-28'),(59,126,22,10,'2018-02-06'),(60,108,22,7,'2018-02-26'),(61,107,23,4,'2017-12-14'),(62,108,23,7,'2017-11-07'),(63,101,23,10,'2017-12-20'),(64,126,23,9,'2017-10-16'),(65,109,23,9,'2018-03-12'),(66,124,23,10,'2018-03-18'),(67,103,23,7,'2018-03-23'),(68,105,23,10,'2017-12-24'),(69,102,23,5,'2017-12-30'),(70,105,24,10,'2018-02-18'),(71,101,24,9,'2017-12-31'),(72,102,24,6,'2017-12-26'),(73,103,24,10,'2017-11-13'),(74,124,24,4,'2018-03-01'),(75,124,25,5,'2017-12-21'),(76,101,25,7,'2017-11-13'),(77,105,25,8,'2018-01-13'),(78,102,25,7,'2018-03-04'),(79,103,25,4,'2017-10-26'),(80,103,26,7,'2018-03-09'),(81,101,26,8,'2018-01-14'),(82,105,26,9,'2018-01-02'),(83,124,26,4,'2018-01-21'),(84,102,26,4,'2018-03-22');

SELECT * FROM profesori;
SELECT * FROM studenti;
