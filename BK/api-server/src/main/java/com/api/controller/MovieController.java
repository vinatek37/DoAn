/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.controller;

import com.api.db.entity.Movie;
import com.api.request.AddNewMovieRequest;
import com.api.request.GetMovieFreeSlideRequest;
import com.api.request.IdRequest;
import com.api.request.SearchMovieRequest;
import com.api.service.MovieService;
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
@RequestMapping(value = {"/api/movie"})
public class MovieController {

    public static final Logger logger = Logger.getLogger(MovieController.class);
    @Autowired
    MovieService movieService;

    @ApiOperation(
            value = "",
            notes = "Danh sách movie không nằm trong danh sách Slide", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/list-free-slide", method = RequestMethod.POST)
    public ResponseEntity getSlide(@RequestBody GetMovieFreeSlideRequest request) {
        logger.debug("request /list-free-slide");
        return movieService.getFree(request);
    }

    @ApiOperation(
            value = "",
            notes = "Danh sách film đang chiếu", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/list-showing", method = RequestMethod.GET)
    public ResponseEntity getListShowing() {
        logger.debug("request /list-showing");
        return movieService.getListShowing();
    }

    @ApiOperation(
            value = "",
            notes = "Danh sách film đang chiếu", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/list-comming", method = RequestMethod.GET)
    public ResponseEntity getListComming() {
        logger.debug("request /list-comming");
        return movieService.getListComming();
    }

    @ApiOperation(
            response = Movie.class,
            value = "",
            notes = "Thông tin chi tiết film", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public ResponseEntity movieDetails(@RequestParam Integer movieId) {
        logger.debug("request /details: id = " + movieId);
        return movieService.movieDetails(movieId);
    }

    @ApiOperation(
            response = Movie.class,
            value = "",
            notes = "Lịch chiếu", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/schedule-by-movie-id", method = RequestMethod.GET)
    public ResponseEntity getScheduleByFilmId(@RequestParam Integer movieId) {
        logger.debug("request /schedule-by-movie-id: id = " + movieId);
        return movieService.getScheduleByFilmId(movieId);
    }

    @ApiOperation(
            response = Movie.class,
            value = "",
            notes = "Thêm mới film", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ResponseEntity insertNewMovie(@RequestBody AddNewMovieRequest request) {
        logger.debug("request /add = " + request.toString());
        return movieService.insertNewMovie(request);
    }
    
     @ApiOperation(
            response = Movie.class,
            value = "",
            notes = "Chỉnh sửa film", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    public ResponseEntity updateMovie(@RequestBody AddNewMovieRequest request) {
        logger.debug("request /update = " + request.toString());
        return movieService.updateMovie(request);
    }
    
      @ApiOperation(
            value = "",
            notes = "Xóa film", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    public ResponseEntity deleteMovie(@RequestBody IdRequest request) {
        logger.debug("request /delete = " + request.toString());
        return movieService.deleteMovie(request);
    }
    
      @ApiOperation(
            response = Movie.class,
            value = "",
            notes = "Tìm kiếm film", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public ResponseEntity searchMovie(@RequestBody SearchMovieRequest request) {
        logger.debug("request /search:  = " + request);
        return movieService.search(request);
    }
}
