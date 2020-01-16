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
@Table(name = "users")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public Integer id;

    @Column(name = "phone")
    public String phone;

    @Column(name = "mail")
    public String mail;

    @Column(name = "password")
    public String password;

    @Column(name = "active")
    public Boolean active;

    @Column(name = "role")
    public Integer role;

    @Column(name = "created_at")
    public Timestamp createdAt;

    @Column(name = "updated_at")
    public Timestamp updateAt;

    @Column(name = "name")
    public String name;

    @Column(name = "wallet")
    public Integer wallet;

    public User() {
    }

    public User(Integer id, String phone, String mail, String password, Boolean active, Integer role, Timestamp createdAt, Timestamp updateAt, String name, Integer wallet) {
        this.id = id;
        this.phone = phone;
        this.mail = mail;
        this.password = password;
        this.active = active;
        this.role = role;
        this.createdAt = createdAt;
        this.updateAt = updateAt;
        this.name = name;
        this.wallet = wallet;
    }

    public User(String phone, String mail, String password, Boolean active,
            Integer role, Timestamp createdAt, Timestamp updateAt,
            String name, Integer wallet) {
        this.phone = phone;
        this.mail = mail;
        this.password = password;
        this.active = active;
        this.role = role;
        this.createdAt = createdAt;
        this.updateAt = updateAt;
        this.name = name;
        this.wallet = wallet;
    }

}
