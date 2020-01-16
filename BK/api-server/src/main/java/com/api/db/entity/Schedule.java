/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.*;

/**
 *
 * @author Thuong
 */
@Entity
@Table(name = "schedule")
public class Schedule implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public Integer id;

    @Column(name = "movie_id")
    public Integer movieId;

    @Column(name = "room_id")
    public Integer roomId;

    @Column(name = "start_time")
    public Timestamp startTime;

    @Column(name = "end_time")
    public Timestamp endTime;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "movie_id", referencedColumnName = "id", insertable = false, updatable = false)
    public Movie movie;
}
