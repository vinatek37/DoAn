/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.controller;

import com.api.response.UserGetTicketResponse;
import com.api.service.TciketService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Thuong
 */
@RestController
@RequestMapping(value = {"/api/ticket"})
public class TicketController {

    public static final Logger logger = Logger.getLogger(MovieController.class);
    @Autowired
    TciketService services;

    @ApiOperation(
            response = UserGetTicketResponse.class,
            value = "",
            notes = "Danh sách vé đã mua", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public ResponseEntity getTicketHistory() {
        logger.debug("request /history");
        return services.getTicketHistory();
    }

    @ApiOperation(
            response = UserGetTicketResponse.class,
            value = "",
            notes = "admin tim kiếm vé", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/get-by-code", method = RequestMethod.GET)
    public ResponseEntity getByCode(@RequestParam(required = false) String code) {
        logger.debug("request /getByCode: code= " + code);
        return services.getByCode(code);
    }
    
    
    @ApiOperation(
            response = UserGetTicketResponse.class,
            value = "",
            notes = "admin get all  ticket", authorizations = {
                @Authorization(value = "Token Access")})
    @RequestMapping(value = "/get-all", method = RequestMethod.GET)
    public ResponseEntity getAllTicket() {
        logger.debug("request /getAllTicket");
        return services.getAllTicket();
    }
    
     @ApiOperation(
            value = "",
            notes = "Cập nhật trạng thái vé", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public ResponseEntity updateStateTicket(@RequestParam(required = false) Integer code) {
        logger.debug("request /update code= " + code);
        return services.updateTicket(code);
    }
}
