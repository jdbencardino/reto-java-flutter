package com.ibm.javaflutter.apppeliculasback.entities;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="film")
@Getter
@Setter

public class Film {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;

    @Column(name="title")
    private String title;

    @Column(name="description")
    private String description;

    @Column(name="date")
    private Date date;

    @Column(name="date_created")
    @CreationTimestamp
    private Date date_created;

    @Column(name="last_updated")
    @UpdateTimestamp
    private Date last_updated;

    @ManyToOne
    @JoinColumn(name="category_id", nullable = false)
    private Category category;

    @ManyToOne
    @JoinColumn(name="actor_id",     nullable = false)
    private Actor actor;

    @ManyToOne
    @JoinColumn(name="director_id", nullable = false)
    private Director director;

}
