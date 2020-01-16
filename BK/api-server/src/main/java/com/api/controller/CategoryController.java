/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.controller;

import com.api.db.entity.Seat;
import com.api.request.AddSeatRequest;
import com.api.request.IdRequest;
import com.api.request.SearchSeatRequest;
import com.api.service.CategoryService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Thuong
 */
@RestController
@RequestMapping(value = {"/api/category"})
public class CategoryController {

    public static final Logger LOG = Logger.getLogger(CategoryController.class);
    @Autowired
    CategoryService categoryService;
    
    //QL Danh mục film
    @ApiOperation(
            value = "",
            notes = "Danh sách danh mục film", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/cagegory-list", method = RequestMethod.GET)
    public ResponseEntity categoryList() {
        LOG.info("request /cagegory-list");
        return categoryService.categoryList();
    }

    //QL Room
    @ApiOperation(
            value = "",
            notes = "Danh sách phòng", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/room-list", method = RequestMethod.GET)
    public ResponseEntity roomList() {
        LOG.info("request /room-list");
        return categoryService.roomList();
    }
    // QL Seats
    @ApiOperation(
            value = "",
            response = Seat.class,
            notes = "Thêm mới ", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/seat-add", method = RequestMethod.POST)
    public ResponseEntity insert(@RequestBody AddSeatRequest request) {
        LOG.debug("request /seat-add = " + request.toString());
        return categoryService.insert(request);
    }

    @ApiOperation(
            response = Seat.class,
            value = "",
            notes = "Chỉnh sửa", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/seat-update", method = RequestMethod.PUT)
    public ResponseEntity update(@RequestBody AddSeatRequest request) {
        LOG.debug("request /update = " + request.toString());
        return categoryService.update(request);
    }

    @ApiOperation(
            response = Seat.class,
            value = "",
            notes = "Xóa Seat", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/seat-delete", method = RequestMethod.DELETE)
    public ResponseEntity delete(@RequestBody IdRequest request) {
        LOG.debug("request /seat-delete = " + request.toString());
        return categoryService.delete(request);
    }

    @ApiOperation(
            response = Seat.class,
            value = "",
            notes = "Tìm kiếm", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/seat-search", method = RequestMethod.POST)
    public ResponseEntity search(@RequestBody SearchSeatRequest request) {
        LOG.debug("request /seat-search:  = " + request);
        return categoryService.search(request);
    }
}
