/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.controller;

import com.api.request.TicketBookingRequest;
import com.api.service.BookingService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Thuong
 */
@RestController
@RequestMapping(value = {"/api/booking"})
public class BookingController {

    public static final Logger logger = Logger.getLogger(EventAdvController.class);
    @Autowired
    BookingService bookingService;

    @ApiOperation(
            value = "",
            notes = "Danh sách ghế và trạng thái", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/seat", method = RequestMethod.GET)
    public ResponseEntity getSeat(@RequestParam Integer roomId, @RequestParam Integer scheduleId) {
        logger.debug("request /seat: roomId = " + roomId + ". scheduleId = " + scheduleId);
        return bookingService.getSeat(roomId, scheduleId);
    }

    @ApiOperation(
            value = "",
            notes = "Đặt vé online", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/ticket-booking", method = RequestMethod.POST)
    public ResponseEntity ticketBooking(@RequestBody TicketBookingRequest request) {
        logger.debug("request /ticket-booking:" + request.toString());
        return bookingService.ticketBooking(request);
    }
}
