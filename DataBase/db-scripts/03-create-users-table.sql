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
  `uid` VARCHAR(255)  NOT NULL UNIQUE,
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
  `user_id` BIGINT(20) NOT NULL,
  `points` INT UNSIGNED DEFAULT 0,
  PRIMARY KEY (`user_id`),
  KEY `fk_subscriber_user` (`user_id`),
  CONSTRAINT `fk_subscriber_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `peliculas-app-back`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas-app-back`.`admin` (
  `user_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_admin_user` (`user_id`),
  CONSTRAINT `fk_admin_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `peliculas-app-back`.`cinema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas-app-back`.`cinema` (
  `user_id` BIGINT(20) NOT NULL,
  `web` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_cinema_user` (`user_id`),
  CONSTRAINT `fk_cinema_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
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
  `add_points` INT UNSIGNED DEFAULT 0,
  `sub_points` INT UNSIGNED DEFAULT 0,
  `cinema_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cinema` (`cinema_id`),
  CONSTRAINT `fk_cinema` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`user_id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Add sample data
-- -----------------------------------------------------
INSERT INTO user (username, uid, name, surname, email)
VALUES ('juan', 'd82VKvafUXSp0xR9UBgm1ylYW5C3', 'juan','bencardino', 'c@ibm.com');

INSERT INTO user (username, uid, name, surname, email)
VALUES ('diego', 'fXQO2wnq1CgVuQcpmp1PLWoohVU2', 'diego','bencardino', 'g@ibm.com');

INSERT INTO user (username, uid, name, surname, email)
VALUES ('santiago', 'xPErLFozJQS1bXj9LsYbFBKj1nJ3', 'santiago','londono', 'asss@ibm.com');

INSERT INTO user (username, uid, name, surname, email)
VALUES ('cristian', 'zML2arxgdXRHSVSy2xerJtwnvAm1', 'cristian','arenas', 'as@ibm.com');

INSERT INTO subscriber (points, user_id) VALUES (10, 2);
INSERT INTO admin (user_id) VALUES (3);
INSERT INTO cinema (web, address, user_id) VALUES ('ibm.com','cra 1 #2 - 3', 4);

INSERT INTO offer(description, deadline, add_points, sub_points, cinema_id) 
VALUES ('Oferton', '2021-05-29', 10 , 0, 4);