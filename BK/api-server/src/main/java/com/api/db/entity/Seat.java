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
@Table(name = "seats")
public class Seat implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "seat_id")
    public Integer seatId;

    @Column(name = "room_id")
    public Integer roomId;

    @Column(name = "name")
    public String name;

    @Column(name = "row")
    public Integer row;

    @Column(name = "area")
    public String area;

    @Column(name = "type")
    public String type;

    @Column(name = "price")
    public Integer price;
    
    @Column(name = "is_empty")
    public Boolean isEmpty;
}
