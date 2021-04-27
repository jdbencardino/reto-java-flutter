-- -----------------------------------------------------
-- Schema peliculas-app-back
-- -----------------------------------------------------
USE `peliculas-app-back` ;

-- -----------------------------------------------------
-- Table `peliculas-app-back`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas-app-back`.`user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255)  NOT NULL,
  `password` VARCHAR(255)  NOT NULL,
  `name` VARCHAR(255)  NULL DEFAULT NULL,
  `surname` VARCHAR(255)  NULL DEFAULT NULL,
  `email` VARCHAR(255)  NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `peliculas-app-back`.`subscriber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas-app-back`.`subscriber` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `points` INT UNSIGNED DEFAULT 0,
  `user_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `peliculas-app-back`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas-app-back`.`admin` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`user_id`)
  -- ,
  -- CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `peliculas-app-back`.`cinema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas-app-back`.`cinema` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `web` VARCHAR(255) NULL DEFAULT NULL,
  `adress` VARCHAR(255) NULL DEFAULT NULL,
  `user_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`user_id`)
  -- ,
  -- CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `peliculas-app-back`.`offer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas-app-back`.`offer` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `deadline` DATETIME(6) DEFAULT NULL,
  `addPoints` INT UNSIGNED DEFAULT 0,
  `subPoints` INT UNSIGNED DEFAULT 0,
  `cinema_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cinema` (`cinema_id`),
  CONSTRAINT `fk_cinema` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Add sample data
-- -----------------------------------------------------
INSERT INTO user (username, password, name, surname, email)
VALUES ('juan', '123', 'juan','bencardino', 'j@ibm.com');

INSERT INTO user (username, password, name, surname, email)
VALUES ('diego', '456', 'diego','bencardino', 'd@ibm.com');

INSERT INTO user (username, password, name, surname, email)
VALUES ('santiago', '789', 'santiago','londono', 's@ibm.com');

INSERT INTO user (username, password, name, surname, email)
VALUES ('cristian', '012', 'cristian','arenas', 'cd@ibm.com');

INSERT INTO subscriber (points, user_id) VALUES (10, 2);
INSERT INTO admin (user_id) VALUES (3);
INSERT INTO cinema (web, adress, user_id) VALUES ('ibm.com','cra 1 #2 - 3', 4);

INSERT INTO offer(description, deadline, addPoints, subPoints, cinema_id) 
VALUES ('Oferton', '2021-05-29', 10 , 0, 1);