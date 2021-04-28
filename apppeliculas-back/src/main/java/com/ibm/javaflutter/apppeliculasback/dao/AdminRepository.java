package com.ibm.javaflutter.apppeliculasback.dao;

import com.ibm.javaflutter.apppeliculasback.entities.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepository extends JpaRepository<Admin, Long> {
}
