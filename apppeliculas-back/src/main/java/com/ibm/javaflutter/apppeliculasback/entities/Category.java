package com.ibm.javaflutter.apppeliculasback.entities;
import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="film_category")
@Getter
@Setter

public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;

    @Column(name="category_name")
    private String category_name;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "category")
    private Set<Film> films;

}
