package com.ibm.javaflutter.apppeliculasback.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table (name = "subscriber")
@PrimaryKeyJoinColumn(name = "user_id")

@Getter
@Setter

public class Subscriber extends User{

//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name="id")
//    private long id;

    @Column(name = "points")
    private String points;

}
