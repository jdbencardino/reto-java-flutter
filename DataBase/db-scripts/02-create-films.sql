-- -----------------------------------------------------
-- Schema peliculas-app-back
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
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `peliculas-app-back`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas-app-back`.`director` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `peliculas-app-back`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas-app-back`.`actor` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)
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
  `director_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  KEY `fk_director` (`director_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `film_category` (`id`),
  CONSTRAINT `fk_director` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `peliculas-app-back`.`actor_film`
-- -----------------------------------------------------
CREATE TABLE `actor_film` (
    `film_id` BIGINT(20) NOT NULL,
    `actor_id` BIGINT(20) NOT NULL,
    PRIMARY KEY (`film_id`, `actor_id`),
    KEY `fk_film` (`film_id`),
    KEY `fk_actor` (`actor_id`),
    CONSTRAINT `fk_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_actor` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB;


-- -----------------------------------------------------
-- Add sample data
-- -----------------------------------------------------


-- Generos
INSERT INTO film_category(category_name) VALUES ('Terror');
INSERT INTO film_category(category_name) VALUES ('Accion');

-- Director
INSERT INTO director(name) VALUES ('Michael Bay');

-- Actor
INSERT INTO actor(name) VALUES ('George Clooney');
INSERT INTO actor(name) VALUES ('Orlando Bloom');

-- Películas
INSERT INTO film (title, description, date, category_id, date_created, director_id)
VALUES ('Halloween', 'Película terror halloween', NOW(), 1, NOW(), 1);

INSERT INTO film (title, description, date, category_id, date_created, director_id)
VALUES ('Halloween2', 'Película terror halloween2', NOW(), 1, NOW(),1);

INSERT INTO film (title, description, date, category_id, date_created, director_id)
VALUES ('Halloween3', 'Película terror halloween3', NOW(), 1, NOW(),1);

INSERT INTO film (title, description, date, category_id, date_created, director_id)
VALUES ('Halloween: La vengaza', 'Película terror halloween 3.5', NOW(), 1, NOW(),1);

INSERT INTO film (title, description, date, category_id, date_created, director_id)
VALUES ('Halloween4', 'Película terror halloween 4', NOW(), 1, NOW(),1);

INSERT INTO film (title, description, date, category_id, date_created, director_id)
VALUES ('Halloween5', 'Película terror halloween 5', NOW(), 1, NOW(),1);

-- Actores de peliculas
INSERT INTO actor_film(film_id, actor_id) VALUES (4,1);
INSERT INTO actor_film(film_id, actor_id) VALUES (4,2);
INSERT INTO actor_film(film_id, actor_id) VALUES (1,1);