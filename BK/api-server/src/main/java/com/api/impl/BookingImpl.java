/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.impl;

import com.api.auth.AuthenService;
import com.api.db.entity.EventAdv;
import com.api.db.entity.Movie;
import com.api.db.entity.Schedule;
import com.api.db.entity.Seat;
import com.api.db.entity.Ticket;
import com.api.db.service.DbEventAdvService;
import com.api.db.service.DbMovieService;
import com.api.db.service.DbScheduleService;
import com.api.db.service.DbSeatService;
import com.api.db.service.DbTicketService;
import static com.api.impl.AccountImpl.LOG;
import com.api.request.TicketBookingRequest;
import com.api.response.GetListDataResponse;
import com.api.service.BookingService;
import com.vinatek.utils.utilities.BaseResponse;
import com.vinatek.utils.utilities.DateTimeHelper;
import com.vinatek.utils.utilities.StringHelper;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
public class BookingImpl implements BookingService {

    public static final Logger LOG = Logger.getLogger(BookingImpl.class);
    @Autowired
    DbEventAdvService dbEventSV;
    @Autowired
    DbMovieService dbMove;
    @Autowired
    DbSeatService dbSeatService;
    @Autowired
    DbTicketService dbTicketService;
    @Autowired
    DbScheduleService dbScheduleService;

    @Override
    public ResponseEntity getSeat(Integer roomId, Integer scheduleId) {
        BaseResponse response = new BaseResponse();
        List<Seat> listSeat = dbSeatService.listSeatInRoom(roomId);
        if (listSeat == null || listSeat.isEmpty()) {
            response.badRequest();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Schedule scheduleValid = dbScheduleService.getScheduleToCheckSeat(scheduleId);
        if (scheduleValid == null) {
            response.badRequest(". Schedule not found or started");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Map<Integer, Ticket> listTicketBySchedule = dbTicketService.listTicketBySchedule(scheduleId);
        if (!listTicketBySchedule.isEmpty()) {
            for (int i = 0; i < listSeat.size(); i++) {
                if (listTicketBySchedule.containsKey(listSeat.get(i).seatId)) {
                    listSeat.get(i).isEmpty = false;
                }
            }
        }
        response.success(listSeat);
        LOG.debug("getFree:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity ticketBooking(TicketBookingRequest request) {
        BaseResponse response = new BaseResponse();
        if (request.getEmptySeatId() == null
                || request.getEmptySeatId().isEmpty()
                || request.getSchudeleId() == null
                || (request.getUserId() == null
                && request.getStaffId() == null)) {
            response.badRequest();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Schedule scheduleValid = dbScheduleService.getScheduleToCheckSeat(request.getSchudeleId());
        if (scheduleValid == null) {
            response.badRequest(". Schedule not found or started");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        //check empty seat
        String code = DateTimeHelper.getStringTime("yyyyMMdd") + "_" + StringHelper.RandomString(5).toUpperCase() + "_" + request.getSchudeleId();
        List<Ticket> listTiket = new ArrayList<>();
        for (Integer seatId : request.getEmptySeatId()) {
            Ticket ticket = dbTicketService.findBySeatIdAndScheduleId(seatId, request.getSchudeleId());
            if (ticket != null) {
                response.forbiden(". seatId = " + seatId + " has been booked");
                return ResponseEntity.status(HttpStatus.OK).body(response);
            }
            
            Ticket data = new Ticket(code, request.getSchudeleId(),
                    seatId, request.getStaffId(),
                    request.getUserId(), request.getPrice(), Boolean.FALSE);
            listTiket.add(data);
        }
        List<Ticket> result = dbTicketService.save(listTiket);
        if (result == null) {
            response.internalServer();
        } else {
            response.success(result);
        }
        LOG.debug("ticketBooking:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }
}
