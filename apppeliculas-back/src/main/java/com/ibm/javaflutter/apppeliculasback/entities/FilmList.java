package com.ibm.javaflutter.apppeliculasback.entities;

import com.ibm.javaflutter.apppeliculasback.helpers.ListType;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="user_film_list")
@Getter
@Setter

public class FilmList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "film_id")
    private Film film;

    @Enumerated(EnumType.STRING) //TODO revisar si es ordinal o string
    @Column(name = "list_type")
    private ListType listType;
}
