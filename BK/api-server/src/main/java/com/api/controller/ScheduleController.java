/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.controller;

import com.api.request.AddSchedule;
import com.api.request.IdRequest;
import com.api.request.SearchScheduleRequest;
import com.api.service.ScheduleService;
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
@RequestMapping(value = {"/api/schedule"})
public class ScheduleController {

    public static final Logger LOG = Logger.getLogger(ScheduleController.class);

    @Autowired
    ScheduleService services;

    @ApiOperation(
            value = "",
            notes = "Thêm mới Lịch chiếu", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ResponseEntity insertSchedule(@RequestBody AddSchedule request) {
        LOG.debug("request /add = " + request.toString());
        return services.insertSchedule(request);
    }

    @ApiOperation(
            value = "",
            notes = "Chỉnh sửa film", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    public ResponseEntity updateSchdule(@RequestBody AddSchedule request) {
        LOG.debug("request /update = " + request.toString());
        return services.updateSchdule(request);
    }

    @ApiOperation(
            value = "",
            notes = "Xóa schedule", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    public ResponseEntity deleteSchdule(@RequestBody IdRequest request) {
        LOG.debug("request /delete = " + request.toString());
        return services.deleteSchdule(request);
    }

    @ApiOperation(
            value = "",
            notes = "Tìm kiếm schedule", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public ResponseEntity searchSchdule(@RequestBody SearchScheduleRequest request) {
        LOG.debug("request /search:  = " + request);
        return services.search(request);
    }
    
    @ApiOperation(
            value = "",
            notes = "Lấy chi tiết theo ID", authorizations = {
                @Authorization(value = "Token Access")})
    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ResponseEntity movieDetails(@RequestParam Integer scheduleId) {
        LOG.debug("request /scheduleId: id = " + scheduleId);
        return services.getById(scheduleId);
    }
}
