package com.ibm.javaflutter.apppeliculasback.dao;

import com.ibm.javaflutter.apppeliculasback.entities.Actor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

public interface ActorRepository extends JpaRepository<Actor, Long>{
}
