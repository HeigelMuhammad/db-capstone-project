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
-- Table `mydb`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`menu` (
  `idmenu` INT NOT NULL AUTO_INCREMENT,
  `hidangan_pembuka` VARCHAR(45) NOT NULL,
  `hidangan_utama` VARCHAR(45) NOT NULL,
  `hidangan_penutup` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmenu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pelanggan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pelanggan` (
  `idpelanggan` INT NOT NULL AUTO_INCREMENT,
  `nama` VARCHAR(45) NOT NULL,
  `kontak` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpelanggan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pesanan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pesanan` (
  `idpesanan` INT NOT NULL AUTO_INCREMENT,
  `tanggal` DATE NOT NULL,
  `jumlah_pesanan` INT NOT NULL,
  `total_biaya` INT NOT NULL,
  `pesanancol` VARCHAR(45) NULL,
  PRIMARY KEY (`idpesanan`),
  UNIQUE INDEX `idpesanan_UNIQUE` (`idpesanan` ASC) VISIBLE,
  CONSTRAINT `idmenu`
    FOREIGN KEY ()
    REFERENCES `mydb`.`menu` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idpelanggan`
    FOREIGN KEY ()
    REFERENCES `mydb`.`pelanggan` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`status_pesanan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`status_pesanan` (
  `idstatus_pesanan` INT NOT NULL AUTO_INCREMENT,
  `status_pesanan` VARCHAR(45) NOT NULL,
  `tanggal` DATE NOT NULL,
  PRIMARY KEY (`idstatus_pesanan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pemesanan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pemesanan` (
  `idpemesanan` INT NOT NULL AUTO_INCREMENT,
  `tanggal_pemesanan` DATE NOT NULL,
  `no_meja` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpemesanan`),
  CONSTRAINT `idpesanan`
    FOREIGN KEY ()
    REFERENCES `mydb`.`pesanan` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idstatus_pesanan`
    FOREIGN KEY ()
    REFERENCES `mydb`.`status_pesanan` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idpelanggan`
    FOREIGN KEY ()
    REFERENCES `mydb`.`pelanggan` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idmenu`
    FOREIGN KEY ()
    REFERENCES `mydb`.`menu` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`staff` (
  `idstaff` INT NOT NULL AUTO_INCREMENT,
  `gaji` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idstaff`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
