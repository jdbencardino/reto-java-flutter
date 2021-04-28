-- -----------------------------------------------------
-- Schema peliculas-app-back
-- -----------------------------------------------------
USE `peliculas-app-back` ;

-- -----------------------------------------------------
-- Table `peliculas-app-back`.`user_film_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas-app-back`.`user_film_list` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT(20) NOT NULL,
    `film_id` BIGINT(20) NOT NULL,
    `list_type` ENUM('views', 'to_see', 'favorite', 'available_cinema'),
    PRIMARY KEY (`id`),
    KEY `fk_list_user` (`user_id`),
    KEY `fk_list_film` (`film_id`),
    CONSTRAINT `fk_list_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_list_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Add sample data
-- -----------------------------------------------------
INSERT INTO user_film_list (user_id, film_id, list_type)
VALUES (1, 4, 'to_see');

INSERT INTO user_film_list (user_id, film_id, list_type)
VALUES (1, 2, 'to_see');

INSERT INTO user_film_list (user_id, film_id, list_type)
VALUES (1, 1, 'favorite');

INSERT INTO user_film_list (user_id, film_id, list_type)
VALUES (1, 1, 'views');

INSERT INTO user_film_list (user_id, film_id, list_type)
VALUES (4, 4, 'available_cinema');

INSERT INTO user_film_list (user_id, film_id, list_type)
VALUES (4, 1, 'available_cinema');

