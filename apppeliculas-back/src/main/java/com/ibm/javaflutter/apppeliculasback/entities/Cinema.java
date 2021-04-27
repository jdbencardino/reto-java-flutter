package com.ibm.javaflutter.apppeliculasback.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table (name = "cinema")
@PrimaryKeyJoinColumn(name = "user_id")

@Setter
@Getter

public class Cinema extends User{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;

    @Column(name = "web")
    private String web;

    @Column(name = "adress")
    private String address;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "cinema")
    private Set<Offer> offers;

}

