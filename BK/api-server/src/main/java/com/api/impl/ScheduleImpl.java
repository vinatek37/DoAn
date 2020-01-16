/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.impl;

import com.api.auth.AuthenService;
import com.api.config.ConfigConst;
import com.api.db.entity.Movie;
import com.api.db.entity.Schedule;
import com.api.db.service.DbScheduleService;
import com.api.request.AddSchedule;
import com.api.request.IdRequest;
import com.api.request.SearchScheduleRequest;
import com.api.service.ScheduleService;
import com.vinatek.utils.utilities.BaseResponse;
import com.vinatek.utils.utilities.DateTimeHelper;
import com.vinatek.utils.utilities.FileHelper;
import com.vinatek.utils.utilities.NumberHelper;
import java.io.IOException;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

/**
 *
 * @author Thuong
 */
@Service
public class ScheduleImpl implements ScheduleService {

    public static final Logger LOG = Logger.getLogger(ScheduleImpl.class);

    @Autowired
    DbScheduleService dbScheduleService;

    @Override
    public ResponseEntity insertSchedule(AddSchedule request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (NumberHelper.IntegerIsEmpty(request.getMovieId())
                || NumberHelper.IntegerIsEmpty(request.getRoomId())) {
            response.badRequest();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Schedule data = new Schedule();
        data.movieId = request.getMovieId();
        data.roomId = request.getRoomId();
        data.startTime = request.getStartTime();
        Schedule result = dbScheduleService.save(data);
        if (result != null) {
            response.success(data);
        } else {
            response.internalServer(". Cannot create Schedule");
        }

        LOG.debug("add:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity updateSchdule(AddSchedule request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Schedule data = dbScheduleService.getById(request.getId());
        if (data == null) {
            response.badRequest();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (!NumberHelper.IntegerIsEmpty(request.getMovieId())) {
            data.movieId = request.getMovieId();
        }
        if (!NumberHelper.IntegerIsEmpty(request.getRoomId())) {
            data.roomId = request.getRoomId();
        }
        if (request.getStartTime() != null) {
            data.startTime = request.getStartTime();
        }
        Schedule result = dbScheduleService.save(data);
        if (result != null) {
            response.success(data);
        } else {
            response.internalServer(". Cannot update Schedule");
        }

        LOG.debug("update Schedule:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity deleteSchdule(IdRequest request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Schedule data = dbScheduleService.getById(request.id);
        if (data == null) {
            response.badRequest();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }

        dbScheduleService.delete(data);
        response.success(data);
        LOG.debug("delete Schedule:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity search(SearchScheduleRequest request) {
          BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        List<Schedule> data = dbScheduleService.search(request);
        response.success(data);
        LOG.debug("search:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity getById(Integer scheduleId) {
        BaseResponse response = new BaseResponse();
        Schedule data = dbScheduleService.getById(scheduleId);
        response.success(data);
        LOG.debug("scheduleDtail:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

  
}
