/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Thuong
 */
@Entity
@Table(name = "event_adv")
public class EventAdv implements Serializable {

    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "movie_id")
    public Integer movieId;
    @Column(name = "image_banner")
    public String imageBanner;

    public EventAdv() {
    }

    public EventAdv(Integer movieId, String imageBanner) {
        this.movieId = movieId;
        this.imageBanner = imageBanner;
    }

}
