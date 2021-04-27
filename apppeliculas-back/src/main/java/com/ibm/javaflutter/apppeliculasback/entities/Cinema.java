package com.ibm.javaflutter.apppeliculasback.entities;

import javax.persistence.*;

@Entity
@Table (name = "cinema")
@PrimaryKeyJoinColumn(name = "user_id")

public class Cinema extends User{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;

    @Column(name = "web")
    private String web;

    @Column(name = "adress")
    private String address;

}