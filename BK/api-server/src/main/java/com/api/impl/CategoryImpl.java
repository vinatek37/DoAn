/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.impl;

import com.api.auth.AuthenService;
import com.api.config.ConfigConst;
import com.api.db.entity.Categories;
import com.api.db.entity.News;
import com.api.db.entity.Room;
import com.api.db.entity.Seat;
import com.api.db.repo.RoomRepo;
import com.api.db.service.DbCategoryService;
import com.api.db.service.DbSeatService;
import static com.api.impl.NewsImpl.LOG;
import com.api.request.AddSeatRequest;
import com.api.request.IdRequest;
import com.api.request.SearchSeatRequest;
import com.api.response.SlideRsp;
import com.api.service.CategoryService;
import com.vinatek.utils.utilities.BaseResponse;
import com.vinatek.utils.utilities.DateTimeHelper;
import com.vinatek.utils.utilities.FileHelper;
import com.vinatek.utils.utilities.NumberHelper;
import com.vinatek.utils.utilities.StringHelper;
import java.io.IOException;
import java.util.ArrayList;
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
public class CategoryImpl implements CategoryService {

    public static final Logger LOG = Logger.getLogger(CategoryImpl.class);
    @Autowired
    DbCategoryService dbCategoryService;
    @Autowired
    DbSeatService dbSeatService;
    @Autowired
    RoomRepo roomRepo;

    @Override
    public ResponseEntity roomList() {
        BaseResponse response = new BaseResponse();
        List<Room> dataRsp = dbCategoryService.getRoomList();
        response.success(dataRsp);
        LOG.debug("roomList:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity categoryList() {
        BaseResponse response = new BaseResponse();
        List<Categories> dataRsp = dbCategoryService.getCategoryList();
        response.success(dataRsp);
        LOG.debug("categoryList:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity insert(AddSeatRequest request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (NumberHelper.IntegerIsEmpty(request.roomId) || roomRepo.findById(request.roomId) == null) {
            response.badRequest("Room not exists");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }

        Seat data = new Seat();
        data.roomId = request.roomId;
        data.name = request.name;
        data.row = request.row;
        data.area = request.area;
        data.price = request.price;
        data.type = request.type;
        data.isEmpty = true;
        Seat result = dbSeatService.save(data);
        response.success(result);
        LOG.debug("add:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity update(AddSeatRequest request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Seat data = dbSeatService.getById(request.id);
        if (NumberHelper.IntegerIsEmpty(request.id) || data == null) {
            response.badRequest("Seat not exists");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (NumberHelper.IntegerIsEmpty(request.roomId) || roomRepo.findById(request.roomId) == null) {
            response.badRequest("Room not exists");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (!NumberHelper.IntegerIsEmpty(request.roomId)) {
            data.roomId = request.roomId;
        }
        if (!StringHelper.IsEmpty(request.name)) {
            data.name = request.name;
        }
        if (!NumberHelper.IntegerIsEmpty(request.row)) {
            data.row = request.row;
        }
        if (!StringHelper.IsEmpty(request.area)) {
            data.area = request.area;
        }
        if (!NumberHelper.IntegerIsEmpty(request.price)) {
            data.price = request.price;
        }
        if (!StringHelper.IsEmpty(request.type)) {
            data.type = request.type;
        }
        data.isEmpty = true;
        Seat result = dbSeatService.save(data);
        response.success(result);
        LOG.debug("update:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity delete(IdRequest request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Seat data = dbSeatService.getById(request.id);
        if (data == null) {
            response.badRequest();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        try {
            dbSeatService.delete(data);
            response.success();
        } catch (Exception ex) {
            LOG.error(ex.getMessage());
            response.internalServer();
        }
        LOG.debug("deleteSeat:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity search(SearchSeatRequest request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        List<Seat> data = dbSeatService.search(request);
        response.success(data);
        LOG.debug("search:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

}
