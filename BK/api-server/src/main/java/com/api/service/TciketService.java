/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.service;

import org.springframework.http.ResponseEntity;

/**
 *
 * @author Thuong
 */
public interface TciketService {

    public ResponseEntity getTicketHistory();

    public ResponseEntity getByCode(String code);

    public ResponseEntity getAllTicket();

    public ResponseEntity updateTicket(Integer code);
    
    
}
