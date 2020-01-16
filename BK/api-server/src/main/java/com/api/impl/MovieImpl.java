/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.impl;

import com.api.auth.AuthenService;
import com.api.config.ConfigConst;
import com.api.db.entity.EventAdv;
import com.api.db.entity.Movie;
import com.api.db.entity.Schedule;
import com.api.db.service.DbEventAdvService;
import com.api.db.service.DbMovieService;
import com.api.db.service.DbScheduleService;
import com.api.request.AddNewMovieRequest;
import com.api.request.GetMovieFreeSlideRequest;
import com.api.request.IdRequest;
import com.api.request.SearchMovieRequest;
import com.api.response.GetListDataResponse;
import com.api.service.MovieService;
import com.vinatek.utils.utilities.BaseResponse;
import com.vinatek.utils.utilities.DateTimeHelper;
import com.vinatek.utils.utilities.FileHelper;
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
public class MovieImpl implements MovieService {

    public static final Logger LOG = Logger.getLogger(MovieImpl.class);
    @Autowired
    DbEventAdvService dbEventSV;
    @Autowired
    DbMovieService dbMove;
    @Autowired
    DbScheduleService dbSchedule;
    
    @Override
    public ResponseEntity getFree(GetMovieFreeSlideRequest request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        List<EventAdv> lstUsed = dbEventSV.getAll();
        List<Integer> lstMovieUsed = new ArrayList<>();
        lstUsed.forEach((data) -> {
            lstMovieUsed.add(data.movieId);
        });
        List<Movie> lstMv = dbMove.getListSlideFree(request, lstMovieUsed);
        Integer total = dbMove.countPatientByPidPhoneMail(request, lstMovieUsed);
        GetListDataResponse data = new GetListDataResponse(lstMv, total);
        response.success(data);
        LOG.debug("getFree:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity movieDetails(Integer movieId) {
        BaseResponse response = new BaseResponse();
        Movie data = dbMove.getById(movieId);
        response.success(data);
        LOG.debug("movieDetails:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity getListShowing() {
        BaseResponse response = new BaseResponse();
        List<Movie> data = dbMove.listShowing();
        response.success(data);
        LOG.debug("getListShowing:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity getListComming() {
        BaseResponse response = new BaseResponse();
        List<Movie> data = dbMove.getListComing();
        response.success(data);
        LOG.debug("getListComming:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity getScheduleByFilmId(Integer movieId) {
        BaseResponse response = new BaseResponse();
        List<Schedule> data = dbSchedule.getListScheduleByMovieId(movieId);
        response.success(data);
        LOG.debug("getScheduleByFilmId:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity insertNewMovie(AddNewMovieRequest request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Boolean isSaveFile;
        try {
            String fileName = "film_image_" + DateTimeHelper.getCurrentTime() + ".jpg";
            isSaveFile = FileHelper.WriteImageFile(request.thumbImageStringBase64, ConfigConst.config.filmImageFolder(), fileName);
            if (isSaveFile) {
                Movie data = new Movie();
                data.about = request.about;
                data.age = request.age;
                data.cast = request.cast;
                data.categoryId = request.categoryId;
                data.directors = request.directors;
                data.duration = request.duration;
                data.endDate = request.endDate;
                data.language = request.language;
                data.name = request.name;
                data.nation = request.nation;
                data.releaseDate = request.releaseDate;
                data.thumbImage = ConfigConst.config.imagesUrl() + fileName;
                data.urlFull = request.urlFull;
                data.urlTrailler = request.urlTrailler;
                if (dbMove.save(data)) {
                    response.success(data);
                } else {
                    response.internalServer(". Cannot create EventAdv");
                }
            } else {
                response.internalServer(". Cannot write image data");
            }
        } catch (IOException ex) {
            LOG.error(ex.getMessage());
            response.internalServer();
        }
        LOG.debug("add:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity updateMovie(AddNewMovieRequest request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Movie data = dbMove.getById(request.id);
        if (data == null) {
            response.badRequest();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Boolean isSaveFile;
        try {
            if (!StringHelper.IsEmpty(request.thumbImageStringBase64)) {
                String fileName = "film_image_" + DateTimeHelper.getCurrentTime() + ".jpg";
                isSaveFile = FileHelper.WriteImageFile(request.thumbImageStringBase64, ConfigConst.config.filmImageFolder(), fileName);
                if (!isSaveFile) {
                    response.internalServer(". Cannot write image data");
                    return ResponseEntity.status(HttpStatus.OK).body(response);
                }
                data.thumbImage = ConfigConst.config.imagesUrl() + fileName;
            }

            if (request.about != null) {
                data.about = request.about;
            }
            if (request.age != null) {
                data.age = request.age;
            }
            if (request.cast != null) {
                data.cast = request.cast;
            }
            if (request.categoryId != null) {
                data.categoryId = request.categoryId;
            }
            if (request.directors != null) {
                data.directors = request.directors;
            }
            if (request.duration != null) {
                data.duration = request.duration;
            }
            if (request.endDate != null) {
                data.endDate = request.endDate;
            }
            if (request.language != null) {
                data.language = request.language;
            }
            if (request.name != null) {
                data.name = request.name;
            }
            if (request.nation != null) {
                data.nation = request.nation;
            }
            if (request.releaseDate != null) {
                data.releaseDate = request.releaseDate;
            }
            if (request.urlFull != null) {
                data.urlFull = request.urlFull;
            }
            if (request.urlTrailler != null) {
                data.urlTrailler = request.urlTrailler;
            }
            if (dbMove.save(data)) {
                response.success(data);
            } else {
                response.internalServer(". Cannot create EventAdv");
            }
        } catch (IOException ex) {
            LOG.error(ex.getMessage());
            response.internalServer();
        }
        LOG.debug("update:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity deleteMovie(IdRequest request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Movie data = dbMove.getById(request.id);
        if (data == null) {
            response.badRequest();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        try {
            dbMove.delete(data);
            response.success();
        } catch (Exception ex) {
            LOG.error(ex.getMessage());
            response.internalServer();
        }
        LOG.debug("deleteMovie:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity search(SearchMovieRequest request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        List<Movie> data = dbMove.search(request);
        response.success(data);
        LOG.debug("search:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

}
