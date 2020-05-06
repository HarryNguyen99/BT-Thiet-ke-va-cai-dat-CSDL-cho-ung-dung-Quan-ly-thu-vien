CREATE SCHEMA IF NOT EXISTS `QL thu vien` DEFAULT CHARACTER SET utf8 ;
USE `QL thu vien` ;


CREATE TABLE IF NOT EXISTS `QL thu vien`.`Tác Giả` (
  `maTG` VARCHAR(10) NOT NULL,
  `tenTG` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`maTG`));


CREATE TABLE IF NOT EXISTS `QL thu vien`.`Nhà Xuất Bản` (
  `maNXB` VARCHAR(20) NOT NULL,
  `tenNXB` VARCHAR(255) NOT NULL,
  `diachi` VARCHAR(100) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `sdt` INT NOT NULL,
  PRIMARY KEY (`maNXB`));


CREATE TABLE IF NOT EXISTS `QL thu vien`.`Thư Viện` (
  `maTV` INT NOT NULL,
  `TenTV` VARCHAR(255) NOT NULL,
  `sdt` INT NULL,
  `email` VARCHAR(45) NULL,
  `diachi` VARCHAR(45) NULL,
  PRIMARY KEY (`maTV`));


CREATE TABLE IF NOT EXISTS `QL thu vien`.`loại sách` (
  `maLS` VARCHAR(10) NOT NULL,
  `TenLS` NVARCHAR(50) NOT NULL,
  `Tác Giả_maTG` VARCHAR(10) NOT NULL,
  `Nhà Xuất Bản_maNXB` VARCHAR(20) NOT NULL,
  `Thư Viện_maTV` INT NOT NULL,
  PRIMARY KEY (`maLS`),
  INDEX `fk_loại sách_Tác Giả1_idx` (`Tác Giả_maTG` ASC),
  INDEX `fk_loại sách_Nhà Xuất Bản1_idx` (`Nhà Xuất Bản_maNXB` ASC),
  INDEX `fk_loại sách_Thư Viện1_idx` (`Thư Viện_maTV` ASC),
  CONSTRAINT `fk_loại sách_Tác Giả1`
    FOREIGN KEY (`Tác Giả_maTG`)
    REFERENCES `QL thu vien`.`Tác Giả` (`maTG`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_loại sách_Nhà Xuất Bản1`
    FOREIGN KEY (`Nhà Xuất Bản_maNXB`)
    REFERENCES `QL thu vien`.`Nhà Xuất Bản` (`maNXB`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_loại sách_Thư Viện1`
    FOREIGN KEY (`Thư Viện_maTV`)
    REFERENCES `QL thu vien`.`Thư Viện` (`maTV`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `QL thu vien`.`Sách` (
  `maSach` VARCHAR(10) NOT NULL,
  `tenSach` NVARCHAR(50) NOT NULL,
  `namsuatban` DATE NOT NULL,
  `loại sách_maLS` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`maSach`),
  INDEX `fk_Sách_loại sách1_idx` (`loại sách_maLS` ASC),
  CONSTRAINT `fk_Sách_loại sách1`
    FOREIGN KEY (`loại sách_maLS`)
    REFERENCES `QL thu vien`.`loại sách` (`maLS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `QL thu vien`.`Thẻ Đọc Giả` (
  `maDG` VARCHAR(10) NOT NULL,
  `tenDG` NVARCHAR(50) NOT NULL,
  `sdt` INT NOT NULL,
  `diachi` NVARCHAR(100) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `anh` VARCHAR(100) NULL,
  PRIMARY KEY (`maDG`));



CREATE TABLE IF NOT EXISTS `QL thu vien`.`phiếu mượn` (
  `maSach` VARCHAR(10) NOT NULL,
  `maSV` VARCHAR(10) NOT NULL,
  `ngaymuon` DATE NOT NULL,
  `ngaytra` DATE NOT NULL,
  PRIMARY KEY (`maSach`, `maSV`),
  INDEX `maSV_idx` (`maSV` ASC),
  CONSTRAINT `maSach`
    FOREIGN KEY (`maSach`)
    REFERENCES `QL thu vien`.`Sách` (`maSach`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `maSV`
    FOREIGN KEY (`maSV`)
    REFERENCES `QL thu vien`.`Thẻ Đọc Giả` (`maDG`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `QL thu vien`.`Nhân Viên` (
  `maNV` VARCHAR(10) NOT NULL,
  `tenNV` VARCHAR(255) NOT NULL,
  `sdt` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `diachi` VARCHAR(45) NOT NULL,
  `Thư Viện_maTV` INT NOT NULL,
  PRIMARY KEY (`maNV`),
  INDEX `fk_Nhân Viên_Thư Viện1_idx` (`Thư Viện_maTV` ASC),
  CONSTRAINT `fk_Nhân Viên_Thư Viện1`
    FOREIGN KEY (`Thư Viện_maTV`)
    REFERENCES `QL thu vien`.`Thư Viện` (`maTV`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);