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
@Table(name = "ticket")
public class Ticket implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public Integer id;

    @Column(name = "code")
    public String code;

    @Column(name = "schedule_id")
    public Integer scheduleId;

    @Column(name = "seat_id")
    public Integer seatId;

    @Column(name = "staff_id")
    public Integer staffId;

    @Column(name = "user_id")
    public Integer userId;

    @Column(name = "price")
    public Integer price;
    
    @Column(name = "state")
    public Boolean state;

    public Ticket() {
    }

    public Ticket(String code, Integer scheduleId, Integer seatId, Integer staffId, Integer userId, Integer price, Boolean state) {
        this.code = code;
        this.scheduleId = scheduleId;
        this.seatId = seatId;
        this.staffId = staffId;
        this.userId = userId;
        this.price = price;
        this.state =  state;
    }

}
