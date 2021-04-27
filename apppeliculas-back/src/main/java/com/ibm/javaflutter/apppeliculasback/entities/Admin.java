package com.ibm.javaflutter.apppeliculasback.entities;

import javax.persistence.*;

@Entity
@Table(name = "admin")
@PrimaryKeyJoinColumn(name = "user_id")

public class Admin extends User{

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;
}
