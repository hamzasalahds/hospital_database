DROP DATABASE IF EXISTS `hospital`;
CREATE DATABASE `hospital`;
USE `hospital` ;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;
-- -----------------------------------------------------
-- Table `hospital`.`Doctors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Doctors`;
CREATE TABLE IF NOT EXISTS `hospital`.`Doctors` (
  `doctor_id` TINYINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`doctor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Nurses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Nurses`;          
CREATE TABLE IF NOT EXISTS `hospital`.`Nurses` (
  `nurse_id` TINYINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`nurse_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Records_Patients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Records_Patients`;              
CREATE TABLE IF NOT EXISTS `hospital`.`Records_Patients` (
  `patient_id` SMALLINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `street` VARCHAR(255) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `zip` INT NOT NULL,
  `doctor_id` TINYINT NOT NULL,
  `nurse_id` TINYINT NOT NULL,
  PRIMARY KEY (`patient_id`),
  INDEX `fk_Patients_Doctors1_idx` (`doctor_id` ASC) VISIBLE,
  INDEX `fk_Patients_Nurses1_idx` (`nurse_id` ASC) VISIBLE,
  CONSTRAINT `fk_Patients_Doctors1`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `hospital`.`Doctors` (`doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patients_Nurses1`
    FOREIGN KEY (`nurse_id`)
    REFERENCES `hospital`.`Nurses` (`nurse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Testing_Methods`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Testing_Methods`;               
CREATE TABLE IF NOT EXISTS `hospital`.`Testing_Methods` (
  `method_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`method_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Records_Testing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Records_Testing`;
CREATE TABLE IF NOT EXISTS `hospital`.`Records_Testing` (
  `test_id` INT NOT NULL AUTO_INCREMENT,
  `test_date` DATETIME NOT NULL,
  `nurse_id` TINYINT NOT NULL,
  `patient_id` SMALLINT NOT NULL,
  `method_id` TINYINT NOT NULL,
  PRIMARY KEY (`test_id`),
  INDEX `fk_Testing_Records_Nurses1_idx` (`nurse_id` ASC) VISIBLE,
  INDEX `fk_Testing_Records_Patients1_idx` (`patient_id` ASC) VISIBLE,
  INDEX `fk_Testing_Records_Testing_Methods1_idx` (`method_id` ASC) VISIBLE,
  CONSTRAINT `Nurses55`
    FOREIGN KEY (`nurse_id`)
    REFERENCES `hospital`.`Nurses` (`nurse_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Testing_Records_Patients1`
    FOREIGN KEY (`patient_id`)
    REFERENCES `hospital`.`Records_Patients` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Testing_Records_Testing_Methods1`
    FOREIGN KEY (`method_id`)
    REFERENCES `hospital`.`Testing_Methods` (`method_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`COVID_Wing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`COVID_Wing`;
CREATE TABLE IF NOT EXISTS `hospital`.`COVID_Wing` (
  `floor` TINYINT NOT NULL,
  `room` SMALLINT NOT NULL,
  PRIMARY KEY (`floor`, `room`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Records_Doctors_Shifts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Records_Doctors_Shifts`;
CREATE TABLE IF NOT EXISTS `hospital`.`Records_Doctors_Shifts` (
  `shift_start` DATETIME NOT NULL,
  `shift_end` DATETIME NOT NULL,
  `doctor_id` TINYINT NOT NULL,
  PRIMARY KEY (`shift_start`, `shift_end`),
  INDEX `fk_Doctors_Shift_Records_Doctors1_idx` (`doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Doctors_Shift_Records_Doctors1`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `hospital`.`Doctors` (`doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Records_Nurses_Shifts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Records_Nurses_Shifts`;
CREATE TABLE IF NOT EXISTS `hospital`.`Records_Nurses_Shifts` (
  `shift_start` DATETIME NOT NULL,
  `shift_end` DATETIME NOT NULL,
  `nurse_id` TINYINT NOT NULL,
  PRIMARY KEY (`shift_start`, `shift_end`),
  INDEX `fk_Nurses_Shift_Records_Nurses1_idx` (`nurse_id` ASC) VISIBLE,
  CONSTRAINT `fk_Nurses_Shift_Records_Nurses1`
    FOREIGN KEY (`nurse_id`)
    REFERENCES `hospital`.`Nurses` (`nurse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Contact_Relationships`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Contact_Relationships`;
CREATE TABLE IF NOT EXISTS `hospital`.`Contact_Relationships` (
  `type_id` TINYINT NOT NULL AUTO_INCREMENT,
  `relationship_type` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Contact_Information`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Contact_Information`;
CREATE TABLE IF NOT EXISTS `hospital`.`Contact_Information` (
  `contact_id` SMALLINT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(50) NOT NULL,
  `phone_number` VARCHAR(50) NOT NULL,
  `type_id` TINYINT NOT NULL,
  PRIMARY KEY (`contact_id`),
  INDEX `fk_Contact_Information_Contact_Relationships1_idx` (`type_id` ASC) VISIBLE,
  CONSTRAINT `fk_Contact_Information_Contact_Relationships1`
    FOREIGN KEY (`type_id`)
    REFERENCES `hospital`.`Contact_Relationships` (`type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Records_Contacts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Records_Contacts`;
CREATE TABLE IF NOT EXISTS `hospital`.`Records_Contacts` (
  `patient_id` SMALLINT NOT NULL,
  `contact_id` SMALLINT NOT NULL,
  PRIMARY KEY (`patient_id`, `contact_id`),
  INDEX `fk_Contact_Records_Patients1_idx` (`patient_id` ASC) VISIBLE,
  INDEX `fk_Contact_Records_Contact_Information1_idx` (`contact_id` ASC) VISIBLE,
  CONSTRAINT `fk_Contact_Records_Patients1`
    FOREIGN KEY (`patient_id`)
    REFERENCES `hospital`.`Records_Patients` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contact_Records_Contact_Information1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `hospital`.`Contact_Information` (`contact_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Symptoms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Symptoms`;
CREATE TABLE IF NOT EXISTS `hospital`.`Symptoms` (
  `symptom_Id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`symptom_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Records_Symptoms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Records_Symptoms`;
CREATE TABLE IF NOT EXISTS `hospital`.`Records_Symptoms` (
  `patient_id` SMALLINT NOT NULL,
  `symptom_Id` INT NOT NULL,
  `start_date_time` DATETIME NOT NULL,
  PRIMARY KEY (`patient_id`, `symptom_Id`),
  INDEX `fk_Records_Symptoms_Symptoms1_idx` (`symptom_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Records_Symptoms_Patients1`
    FOREIGN KEY (`patient_id`)
    REFERENCES `hospital`.`Records_Patients` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Records_Symptoms_Symptoms1`
    FOREIGN KEY (`symptom_Id`)
    REFERENCES `hospital`.`Symptoms` (`symptom_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Covid_Treatments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Covid_Treatments`;
CREATE TABLE IF NOT EXISTS `hospital`.`Covid_Treatments` (
  `treatment_Id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`treatment_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Records_Treatments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Records_Treatments`;
CREATE TABLE IF NOT EXISTS `hospital`.`Records_Treatments` (
  `patient_id` SMALLINT NOT NULL,
  `treatment_Id` TINYINT NOT NULL,
  `start_date_time` DATETIME NOT NULL,
  `doctor_id` TINYINT NOT NULL,
  PRIMARY KEY (`patient_id`, `treatment_Id`),
  INDEX `fk_Patient_Treatment_Covid_Treatments1_idx` (`treatment_Id` ASC) VISIBLE,
  INDEX `fk_Patient_Treatment_Patients1_idx` (`patient_id` ASC) VISIBLE,
  INDEX `fk_Records_Treatments_Doctors1_idx` (`doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_Treatment_Covid_Treatments1`
    FOREIGN KEY (`treatment_Id`)
    REFERENCES `hospital`.`Covid_Treatments` (`treatment_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_Treatment_Patients1`
    FOREIGN KEY (`patient_id`)
    REFERENCES `hospital`.`Records_Patients` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Records_Treatments_Doctors1`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `hospital`.`Doctors` (`doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Records_Admissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Records_Admissions`;
CREATE TABLE IF NOT EXISTS `hospital`.`Records_Admissions` (
  `patient_id` SMALLINT NOT NULL,
  `floor` TINYINT NOT NULL,
  `room` SMALLINT NOT NULL,
  `date_of_admission` DATETIME NOT NULL,
  PRIMARY KEY (`patient_id`, `floor`, `room`),
  INDEX `fk_Hospital_Admissions_COVID_Wing1_idx` (`floor` ASC, `room` ASC) VISIBLE,
  CONSTRAINT `fk_Hospital_Admissions_Patients1`
    FOREIGN KEY (`patient_id`)
    REFERENCES `hospital`.`Records_Patients` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hospital_Admissions_COVID_Wing1`
    FOREIGN KEY (`floor` , `room`)
    REFERENCES `hospital`.`COVID_Wing` (`floor` , `room`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



