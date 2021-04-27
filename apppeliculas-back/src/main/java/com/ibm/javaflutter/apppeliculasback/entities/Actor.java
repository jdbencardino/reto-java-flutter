package com.ibm.javaflutter.apppeliculasback.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="actor")
@Getter
@Setter

public class Actor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;

    @Column(name="name")
    private String actor_name;

    @ManyToMany(mappedBy = "actorSet")
    Set<Film> filmSet;

}

