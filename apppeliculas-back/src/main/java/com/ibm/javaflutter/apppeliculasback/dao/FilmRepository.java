package com.ibm.javaflutter.apppeliculasback.dao;

import com.ibm.javaflutter.apppeliculasback.entities.Category;
import com.ibm.javaflutter.apppeliculasback.entities.Film;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RequestParam;

public interface FilmRepository extends JpaRepository<Film, Long> {
    Page<Film> findByCategoryId(@RequestParam("id") Long id, Pageable pageable);
}
