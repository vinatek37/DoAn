/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.oauth2.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

/**
 *
 * @author Khiem Ha
 */
@Entity
@Table(name = "users")
@Data
public class User implements Serializable {

    public User() {
    }

    public User(User user) {
        this.phone = user.getPhone();
        this.mail = user.getMail();
        this.password = user.getPassword();
        this.active = user.getActive();
        this.role = user.getRole();
        this.created_at = user.getCreated_at();
        this.name = user.getName();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer id;

    @Column(name = "phone")
    private String phone;

    @Column(name = "mail")
    private String mail;

    @Column(name = "password")
    private String password;

    @Column(name = "active")
    private Integer active;

    @Column(name = "role")
    private Integer role;

    @Column(name = "created_at")
    private Date created_at;

    @Column(name = "name")
    private String name;

}
