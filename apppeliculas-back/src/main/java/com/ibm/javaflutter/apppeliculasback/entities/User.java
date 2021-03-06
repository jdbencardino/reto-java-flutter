package com.ibm.javaflutter.apppeliculasback.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Inheritance (strategy = InheritanceType.JOINED)

@Entity
@Table(name="user")
@Getter
@Setter

public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;

    @Column(name="username")
    private String username;

    @Column(name="uid")
    private String uid;

    @Column(name="name")
    private String name;

    @Column(name="surname")
    private String surname;

    @Column(name="email")
    private String email;

    @OneToMany(mappedBy = "user")
    Set<FilmList> filmLists;
}
