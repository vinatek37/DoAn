/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.service;

import com.api.request.event.CreateEventAdv;
import org.springframework.http.ResponseEntity;

/**
 *
 * @author Thuong
 */
public interface EventAdvService {

    public ResponseEntity getSlide();

    public ResponseEntity add(CreateEventAdv request);

    public ResponseEntity delete(CreateEventAdv request);

    public ResponseEntity edit(CreateEventAdv request);
    
}
