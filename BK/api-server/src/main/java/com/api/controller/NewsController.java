/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.controller;

import static com.api.controller.ScheduleController.LOG;
import com.api.db.entity.News;
import com.api.request.AddNewsRequest;
import com.api.request.IdRequest;
import com.api.request.SearchNewsRequest;
import com.api.service.NewsService;
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
@RequestMapping(value = {"/api/news"})
public class NewsController {

    public static final Logger logger = Logger.getLogger(MovieController.class);
    @Autowired
    NewsService newsService;

    @ApiOperation(
            value = "",
            response = News.class,
            notes = "Lấy danh sách tin tức", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/get-list", method = RequestMethod.GET)
    public ResponseEntity getListNews() {
        logger.debug("request /get-list");
        return newsService.getListNews();
    }

    @ApiOperation(
            value = "",
            response = News.class,
            notes = "Thêm mới Tin tức", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ResponseEntity insert(@RequestBody AddNewsRequest request) {
        LOG.debug("request /add = " + request.toString());
        return newsService.insert(request);
    }

    @ApiOperation(
            response = News.class,
            value = "",
            notes = "Chỉnh sửa", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    public ResponseEntity update(@RequestBody AddNewsRequest request) {
        LOG.debug("request /update = " + request.toString());
        return newsService.update(request);
    }
    
    @ApiOperation(
            response = News.class,
            value = "",
            notes = "Lấy chi tiết theo ID", authorizations = {
                @Authorization(value = "Token Access")})
    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ResponseEntity movieDetails(@RequestParam Integer newsId) {
        logger.debug("request /details: id = " + newsId);
        return newsService.newDetails(newsId);
    }

    @ApiOperation(
            response = News.class,
            value = "",
            notes = "Xóa schedule", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    public ResponseEntity delete(@RequestBody IdRequest request) {
        LOG.debug("request /delete = " + request.toString());
        return newsService.delete(request);
    }

    @ApiOperation(
            response = News.class,
            value = "",
            notes = "Tìm kiếm", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public ResponseEntity search(@RequestBody SearchNewsRequest request) {
        LOG.debug("request /search:  = " + request);
        return newsService.search(request);
    }
}
