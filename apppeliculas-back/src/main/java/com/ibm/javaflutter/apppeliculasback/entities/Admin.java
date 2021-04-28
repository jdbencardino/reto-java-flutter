package com.ibm.javaflutter.apppeliculasback.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "admin")
@PrimaryKeyJoinColumn(name = "user_id")

@Getter
@Setter

public class Admin extends User{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;
}
