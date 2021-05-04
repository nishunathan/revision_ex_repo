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

-- -----------------------------------------------------
-- Table `mydb`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Specialist` (
  `Field_area` INT NOT NULL,
  `Specialistcol` VARCHAR(45) NULL,
  `specialist_id` INT NOT NULL,
  PRIMARY KEY (`specialist_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doctor` (
  `Dateofbirth` DATE NULL,
  `Name` INT NOT NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` VARCHAR(45) NULL,
  `Salary` VARCHAR(45) NULL,
  `id` INT NOT NULL,
  `Specialist_specialist_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Doctor_Specialist_idx` (`Specialist_specialist_id` ASC),
  CONSTRAINT `fk_Doctor_Specialist`
    FOREIGN KEY (`Specialist_specialist_id`)
    REFERENCES `mydb`.`Specialist` (`specialist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medical` (
  `Overtime_rate` INT NOT NULL,
  `overtime_id` INT NOT NULL,
  PRIMARY KEY (`overtime_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Appointment` (
  `Date` DATE NOT NULL,
  `Time` VARCHAR(45) NULL,
  `id` INT NOT NULL,
  PRIMARY KEY (`Date`, `id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill` (
  `Total` FLOAT NOT NULL,
  `bill_id` INT NOT NULL,
  PRIMARY KEY (`bill_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `Name` INT NOT NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` VARCHAR(45) NULL,
  `Dateofbirth` VARCHAR(45) NULL,
  `Appointment_Date` DATE NOT NULL,
  `id` INT NOT NULL,
  `Doctor_id` INT NOT NULL,
  `Appointment_Date1` DATE NOT NULL,
  `Appointment_id` INT NOT NULL,
  `Bill_bill_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Appointment_Date1`, `Appointment_id`, `Bill_bill_id`),
  INDEX `fk_Patient_Doctor1_idx` (`Doctor_id` ASC),
  INDEX `fk_Patient_Appointment1_idx` (`Appointment_Date1` ASC, `Appointment_id` ASC),
  INDEX `fk_Patient_Bill1_idx` (`Bill_bill_id` ASC),
  CONSTRAINT `fk_Patient_Doctor1`
    FOREIGN KEY (`Doctor_id`)
    REFERENCES `mydb`.`Doctor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_Appointment1`
    FOREIGN KEY (`Appointment_Date1` , `Appointment_id`)
    REFERENCES `mydb`.`Appointment` (`Date` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_Bill1`
    FOREIGN KEY (`Bill_bill_id`)
    REFERENCES `mydb`.`Bill` (`bill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `Details` BLOB NOT NULL,
  `Method` VARCHAR(45) NULL,
  `payment_id` INT NOT NULL,
  PRIMARY KEY (`payment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bill_has_Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill_has_Payment` (
  `Bill_bill_id` INT NOT NULL,
  `Payment_payment_id` INT NOT NULL,
  PRIMARY KEY (`Bill_bill_id`, `Payment_payment_id`),
  INDEX `fk_Bill_has_Payment_Payment1_idx` (`Payment_payment_id` ASC),
  INDEX `fk_Bill_has_Payment_Bill1_idx` (`Bill_bill_id` ASC),
  CONSTRAINT `fk_Bill_has_Payment_Bill1`
    FOREIGN KEY (`Bill_bill_id`)
    REFERENCES `mydb`.`Bill` (`bill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bill_has_Payment_Payment1`
    FOREIGN KEY (`Payment_payment_id`)
    REFERENCES `mydb`.`Payment` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
