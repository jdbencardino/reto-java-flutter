-- -----------------------------------------------------
-- Schema full-stack-ecommerce
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `peliculas-app-back`;

CREATE SCHEMA `peliculas-app-back`;
USE `peliculas-app-back` ;

-- -----------------------------------------------------
-- Table `peliculas-app-back`.`film_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas-app-back`.`film_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `peliculas-app-back`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas-app-back`.`film` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `date` DATETIME(6) DEFAULT NULL,
  `date_created` DATETIME(6) DEFAULT NULL,
  `last_updated` DATETIME(6) DEFAULT NULL,
  `category_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `film_category` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Add sample data
-- -----------------------------------------------------

INSERT INTO film_category(category_name) VALUES ('Terror');

INSERT INTO film (title, description, date, category_id, date_created)
VALUES ('Halloween', 'Película terror halloween', NOW(), 1, NOW());

INSERT INTO film (title, description, date, category_id, date_created)
VALUES ('Halloween2', 'Película terror halloween2', NOW(), 1, NOW());

INSERT INTO film (title, description, date, category_id, date_created)
VALUES ('Halloween3', 'Película terror halloween3', NOW(), 1, NOW());

INSERT INTO film (title, description, date, category_id, date_created)
VALUES ('Halloween: La vengaza', 'Película terror halloween 3.5', NOW(), 1, NOW());

INSERT INTO film (title, description, date, category_id, date_created)
VALUES ('Halloween4', 'Película terror halloween 4', NOW(), 1, NOW());

INSERT INTO film (title, description, date, category_id, date_created)
VALUES ('Halloween5', 'Película terror halloween 5', NOW(), 1, NOW());