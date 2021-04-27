package com.ibm.javaflutter.apppeliculasback.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="film_actor")
@Getter
@Setter

public class Actor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;

    @Column(name="actor_name")
    private String actor_name;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "actor")
    private Set<Film> films;

}

