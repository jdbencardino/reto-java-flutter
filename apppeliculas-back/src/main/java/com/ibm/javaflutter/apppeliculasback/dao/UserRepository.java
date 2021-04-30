package com.ibm.javaflutter.apppeliculasback.dao;

import com.ibm.javaflutter.apppeliculasback.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    List<User> findByUid(@RequestParam("uid") String uid);

    @Transactional
    Long deleteByUid(@RequestParam("uid") String uid);
}