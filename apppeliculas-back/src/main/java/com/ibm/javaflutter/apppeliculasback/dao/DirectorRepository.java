package com.ibm.javaflutter.apppeliculasback.dao;

import com.ibm.javaflutter.apppeliculasback.entities.Director;
import com.ibm.javaflutter.apppeliculasback.helpers.IsAdmin;
import org.springframework.data.jpa.repository.JpaRepository;

@IsAdmin
public interface DirectorRepository extends JpaRepository<Director, Long>{
}