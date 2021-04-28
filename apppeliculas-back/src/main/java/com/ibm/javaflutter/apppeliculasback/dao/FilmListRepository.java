package com.ibm.javaflutter.apppeliculasback.dao;

import com.ibm.javaflutter.apppeliculasback.entities.FilmList;
import com.ibm.javaflutter.apppeliculasback.helpers.ListType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RepositoryRestResource(collectionResourceRel = "filmLists", path = "film-lists")
public interface FilmListRepository extends JpaRepository<FilmList, Long> {
    List<FilmList> findByListTypeAndUserId(@RequestParam ListType type, @RequestParam Long id);
}
