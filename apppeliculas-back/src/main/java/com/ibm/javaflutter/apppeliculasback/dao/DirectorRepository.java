package com.ibm.javaflutter.apppeliculasback.dao;

import com.ibm.javaflutter.apppeliculasback.entities.Director;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "filmDirector", path = "film-director")
public interface DirectorRepository extends JpaRepository<Director, Long>{
}