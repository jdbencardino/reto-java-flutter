package com.ibm.javaflutter.apppeliculasback.dao;

import com.ibm.javaflutter.apppeliculasback.entities.Subscriber;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SubscriberRepository extends JpaRepository<Subscriber, Long> {
}
