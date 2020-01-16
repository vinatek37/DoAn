/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.service;

import com.api.request.TicketBookingRequest;
import org.springframework.http.ResponseEntity;

/**
 *
 * @author Thuong
 */
public interface BookingService {

    public ResponseEntity getSeat(Integer roomId, Integer scheduleId);

    public ResponseEntity ticketBooking(TicketBookingRequest request);
    
}
