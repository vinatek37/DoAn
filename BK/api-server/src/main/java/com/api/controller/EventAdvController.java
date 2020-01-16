/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.controller;

import com.api.request.event.CreateEventAdv;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.api.service.EventAdvService;
import org.springframework.web.bind.annotation.RequestBody;

/**
 *
 * @author Thuong
 */
@RestController
@RequestMapping(value = {"/api/event"})
public class EventAdvController {

    public static final Logger logger = Logger.getLogger(EventAdvController.class);
    @Autowired
    EventAdvService movieService;

    @ApiOperation(
            value = "",
            notes = "Dữ liệu hiển thị slide", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ResponseEntity getSlide() {
        logger.debug("request /list");
        return movieService.getSlide();
    }

    @ApiOperation(
            value = "",
            notes = "Thêm EventAdv", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ResponseEntity add(@RequestBody CreateEventAdv request) {
        logger.debug("request /add: " + request.getMoveId());
        return movieService.add(request);
    }
    
    @ApiOperation(
            value = "",
            notes = "Xóa EventAdv", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    public ResponseEntity delete(@RequestBody CreateEventAdv request) {
        logger.debug("request /delete: " + request.getMoveId());
        return movieService.delete(request);
    }
    
      
    @ApiOperation(
            value = "",
            notes = "Chỉnh sửa EventAdv", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    public ResponseEntity edit(@RequestBody CreateEventAdv request) {
        logger.debug("request /update: " + request.getMoveId());
        return movieService.edit(request);
    }
}
