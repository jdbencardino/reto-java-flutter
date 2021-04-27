package com.ibm.javaflutter.apppeliculasback.entities;

import lombok.Getter;
import lombok.Setter;
import oracle.jrockit.jfr.openmbean.ProducerDescriptorType;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name="offer")
@Getter
@Setter

public class Offer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;

    @Column(name="description")
    private String description;

    @Column(name="deadline")
    private Date deadline;

    @Column(name="addPoints")
    private int addPoints;

    @Column(name="subPoints")
    private int subPoints;

    @ManyToOne
    @JoinColumn(name="cinema_id", nullable = false)
    private Cinema cinema;
}

