package com.ibm.javaflutter.apppeliculasback.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

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

    @Column(name="password")
    private String password;

    @Column(name="name")
    private String name;

    @Column(name="surname")
    private String surname;

    @Column(name="email")
    private String email;
}
