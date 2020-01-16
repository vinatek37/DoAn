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
@Table(name = "movie")
public class Movie implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public Integer id;
    @Column(name = "category_id")
    public Integer categoryId;
    @Column(name = "name")
    public String name;
    @Column(name = "language")
    public String language;
    @Column(name = "duration")
    public Integer duration;
    @Column(name = "release_date")
    public Timestamp releaseDate;
    @Column(name = "end_date")
    public Timestamp endDate;
    @Column(name = "directors")
    public String directors;
    @Column(name = "cast")
    public String cast;
    @Column(name = "about")
    public String about;
    @Column(name = "nation")
    public String nation;
    @Column(name = "thumb_image")
    public String thumbImage;
    @Column(name = "url_trailler")
    public String urlTrailler;
    @Column(name = "url_full")
    public String urlFull;
    @Column(name = "age")
    public Integer age;
}
