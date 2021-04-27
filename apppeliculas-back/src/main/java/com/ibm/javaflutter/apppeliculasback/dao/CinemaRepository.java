package com.ibm.javaflutter.apppeliculasback.dao;

import com.ibm.javaflutter.apppeliculasback.entities.Cinema;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CinemaRepository extends JpaRepository<Cinema, Long> {
}

