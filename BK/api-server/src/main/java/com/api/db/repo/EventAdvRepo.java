/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.repo;

import com.api.db.entity.EventAdv;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Thuong
 */
public interface EventAdvRepo extends JpaRepository<EventAdv, Integer> {
    
}
