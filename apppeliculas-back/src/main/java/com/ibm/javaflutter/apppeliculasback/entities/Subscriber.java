package com.ibm.javaflutter.apppeliculasback.entities;

import javax.persistence.*;

@Entity
@Table (name = "subscriber")
@PrimaryKeyJoinColumn(name = "user_id")

public class Subscriber extends User{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;

    @Column(name = "points")
    private String points;

}
