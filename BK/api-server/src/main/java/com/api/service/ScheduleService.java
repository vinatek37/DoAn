/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.service;

import com.api.request.AddSchedule;
import com.api.request.IdRequest;
import com.api.request.SearchScheduleRequest;
import org.springframework.http.ResponseEntity;

/**
 *
 * @author Thuong
 */
public interface ScheduleService {

    public ResponseEntity insertSchedule(AddSchedule request);

    public ResponseEntity updateSchdule(AddSchedule request);

    public ResponseEntity deleteSchdule(IdRequest request);

    public ResponseEntity search(SearchScheduleRequest request);

    public ResponseEntity getById(Integer scheduleId);

}
