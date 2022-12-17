USE university;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`term`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`term` ;

CREATE TABLE IF NOT EXISTS `mydb`.`term` (
  `term_id` INT NOT NULL,
  `term` VARCHAR(45) NOT NULL,
  `year` YEAR(4) NOT NULL,
  PRIMARY KEY (`term_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`college`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`college` ;

CREATE TABLE IF NOT EXISTS `mydb`.`college` (
  `college_id` INT NOT NULL,
  `college` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`college_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`department` ;

CREATE TABLE IF NOT EXISTS `mydb`.`department` (
  `department_id` VARCHAR(4) NOT NULL,
  `department` VARCHAR(45) NOT NULL,
  `college_id` INT NOT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `fk_department_college1_idx` (`college_id` ASC) VISIBLE,
  CONSTRAINT `fk_department_college1`
    FOREIGN KEY (`college_id`)
    REFERENCES `mydb`.`college` (`college_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`faculty` ;

CREATE TABLE IF NOT EXISTS `mydb`.`faculty` (
  `faculty_id` INT NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `department_id` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`faculty_id`),
  INDEX `fk_faculty_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_faculty_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `mydb`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`course` ;

CREATE TABLE IF NOT EXISTS `mydb`.`course` (
  `course_id` INT NOT NULL,
  `course_num` INT NOT NULL,
  `course_title` VARCHAR(45) NOT NULL,
  `credits` INT NOT NULL,
  `department_id` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `mydb`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`section` ;

CREATE TABLE IF NOT EXISTS `mydb`.`section` (
  `section_id` INT NOT NULL,
  `section_number` INT NOT NULL,
  `capacity` INT NOT NULL,
  `term_id` INT NOT NULL,
  `faculty_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
  INDEX `fk_section_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  INDEX `fk_section_course1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_term1`
    FOREIGN KEY (`term_id`)
    REFERENCES `mydb`.`term` (`term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `mydb`.`faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`student` ;

CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `student_id` INT NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(1) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `mydb`.`enrollment` (
  `section_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`section_id`, `student_id`),
  INDEX `fk_section_has_student_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_section_has_student_section1_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_has_student_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `mydb`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_has_student_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `mydb`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO college VALUES 
    (1, 'Physical Science and Engineering'),
    (2, 'College of Business and Communication'),
    (3, 'College of Language and Letters');
    
INSERT INTO department VALUES 
    ('CIT', 'Computer Information Technology', 1),
    ('ECON', 'Economics', 2),
    ('HUM', 'Humanities', 3);
    
INSERT INTO course VALUES 
    (1, 111, 'Intro to Databases', 3, 'CIT'),
    (2, 150, 'Micro Economics', 3, 'ECON'),
    (3, 376, 'Classical Heritage', 2, 'HUM'),
    (4, 388, 'Econometrics', 4, 'ECON');

INSERT INTO faculty VALUES 
    (1, 'Morring', 'Marty', 'CIT'),
    (2, 'Barney', 'Bill', 'CIT'),
    (3, 'Barrus', 'Ben', 'ECON'),
    (4, 'Norris', 'Nate', 'ECON'),
    (5, 'Jensen', 'John', 'HUM');

INSERT INTO term VALUES 
    (1, 'Fall', 2019),
    (2, 'Winter', 2018);
    
INSERT INTO student VALUES 
    (1, 'Miller', 'Paul', 'M', 'Dallas', 'TX', '1996-02-22'),
    (2, 'Smith', 'Katie', 'F', 'Provo', 'UT', '1995-07-22'),
    (3, 'Jones', 'Kelly', 'F', 'Provo', 'UT', '1998-06-22'),
    (4, 'Merrill', 'Devon', 'M', 'Mesa', 'AZ', '2000-07-22'),
    (5, 'Murdock', 'Mandy', 'F' ,'Topeka', 'KS', '1996-11-22'),
    (6, 'Adams', 'Alece', 'F', 'Rigby', 'ID', '1997-05-22'),
    (7, 'Carlson', 'Bryce', 'M', 'Bozeman', 'MT', '1997-11-22'),
    (8, 'Larsen', 'Preston', 'M', 'Decatur', 'TN', '1996-09-22'),
    (9, 'Madsen', 'Julia', 'F', 'Rexburg', 'ID', '1998-09-22'),
    (10, 'Sorensen', 'Susan', 'F', 'Mesa', 'AZ', '1998-08-09');

INSERT INTO section VALUES 
    (1, 1, 30, 1, 1, 1), -- CIT 111 1 Fall
    (2, 1, 50, 1, 4, 2), -- ECON 150 1 Fall
    (3, 2, 50, 1, 4, 2), -- ECON 150 2 Fall
    (4, 1, 35, 1, 3, 4), -- ECON 388 1 Fall 
    (5, 1, 30, 1, 5, 3), -- HUM 376 1 Fall
    (6, 2, 30, 2, 1, 1), -- CIT 111 2 Winter
    (7, 3, 35, 2, 2, 1), -- CIT 111 3 Winter
    (8, 1, 50, 2, 4, 2), -- ECON 150 1 Winter
    (9, 2, 50, 2, 4, 2), -- ECON 150 2 Winter
    (10, 1, 30, 2, 5, 3); -- HUM 376 1 Winter
    
INSERT INTO enrollment VALUES 
    (7, 6), 
    (6, 7),
    (8, 7),
    (10, 7),
    (5, 4),
    (9, 9),
    (4, 2),
    (4, 3),
    (4, 5),
    (5, 5),
    (1, 1),
    (3, 1),
    (9, 8),
    (6, 10);