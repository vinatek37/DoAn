/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.impl;

import com.api.auth.AuthenService;
import com.api.config.ConfigConst;
import com.api.db.entity.Movie;
import com.api.db.entity.Ticket;
import com.api.db.entity.User;
import com.api.db.service.DbAccountService;
import com.api.db.service.DbTicketService;
import static com.api.impl.MovieImpl.LOG;
import com.api.service.TciketService;
import com.vinatek.utils.utilities.BaseResponse;
import com.vinatek.utils.utilities.DateTimeHelper;
import com.vinatek.utils.utilities.FileHelper;
import com.vinatek.utils.utilities.NumberHelper;
import java.io.IOException;
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
public class TicketImp implements TciketService {

    public static final Logger LOG = Logger.getLogger(TicketImp.class);
    @Autowired
    DbAccountService dbAccountService;
    @Autowired
    DbTicketService dbTicketService;

    @Override
    public ResponseEntity getTicketHistory() {
        BaseResponse response = new BaseResponse();
        String username = AuthenService.Instance().getUsersName();
        User user = dbAccountService.getByMailOrPhone(username, username);
        if (user == null) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        response.success(dbTicketService.getHistory(user.id));
        LOG.debug("getTicketHistory:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity getByCode(String code) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        response.success(dbTicketService.getByCode(code));
        LOG.debug("getTicketHistory:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity getAllTicket() {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        response.success(dbTicketService.getAllTicket());
        LOG.debug("getAllTicket:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity updateTicket(Integer code) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (NumberHelper.IntegerIsEmpty(code)) {
            response.badRequest(". Code not null");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Ticket data = dbTicketService.getById(code);
        if (data == null) {
            response.badRequest();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (!data.state) {
            data.state = Boolean.TRUE;
            response.success(dbTicketService.save(data));
        } else {
            response.badRequest(" Vé đã giao cho khách");
        }

        LOG.debug("update:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

}
