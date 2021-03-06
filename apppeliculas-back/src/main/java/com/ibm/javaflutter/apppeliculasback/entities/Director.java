package com.ibm.javaflutter.apppeliculasback.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="director")
@Getter
@Setter

public class Director {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;

    @Column(name="name")
    private String director_name;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "director")
    private Set<Film> films;

}
