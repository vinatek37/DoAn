/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.impl;

import com.api.auth.AuthenService;
import com.api.config.ConfigConst;
import com.api.db.entity.News;
import com.api.db.service.DbMovieService;
import com.api.db.service.DbNewsService;
import com.api.request.AddNewsRequest;
import com.api.request.IdRequest;
import com.api.request.SearchNewsRequest;
import com.api.service.NewsService;
import com.vinatek.utils.utilities.BaseResponse;
import com.vinatek.utils.utilities.DateTimeHelper;
import com.vinatek.utils.utilities.FileHelper;
import com.vinatek.utils.utilities.NumberHelper;
import com.vinatek.utils.utilities.StringHelper;
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
public class NewsImpl implements NewsService {

    public static final Logger LOG = Logger.getLogger(NewsImpl.class);
    @Autowired
    DbNewsService dbNewsService;
    @Autowired
    DbMovieService dbMovieService;

    @Override
    public ResponseEntity getListNews() {
        BaseResponse response = new BaseResponse();
        List<News> listNews = dbNewsService.findListNews();
        response.success(listNews);
        LOG.debug("getListNews:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity insert(AddNewsRequest request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (dbMovieService.getById(request.moveId) == null) {
            response.badRequest(". Movie not exists");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Boolean isSaveFile;
        try {
            String fileName = "news_image_" + DateTimeHelper.getCurrentTime() + ".jpg";
            isSaveFile = FileHelper.WriteImageFile(request.image, ConfigConst.config.filmImageFolder(), fileName);
            if (isSaveFile) {
                News data = new News();
                data.content = request.content;
                data.createAd = DateTimeHelper.getCurrentTimestamp();
                data.image = ConfigConst.config.imagesUrl() + fileName;
                data.move_id = request.moveId;
                data.title = request.title;
                data.type = request.type;
                News result = dbNewsService.save(data);
                response.success(result);
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
    public ResponseEntity update(AddNewsRequest request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (!NumberHelper.IntegerIsEmpty(request.type) && dbMovieService.getById(request.moveId) == null) {
            response.badRequest(". Movie not exists");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        News data = dbNewsService.getById(request.id);
        if (data == null) {
            response.badRequest();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Boolean isSaveFile;
        try {
            if (!StringHelper.IsEmpty(request.image)) {
                String fileName = "news_image_" + DateTimeHelper.getCurrentTime() + ".jpg";
                isSaveFile = FileHelper.WriteImageFile(request.image, ConfigConst.config.filmImageFolder(), fileName);
                if (!isSaveFile) {
                    response.internalServer(". Cannot write image data");
                    return ResponseEntity.status(HttpStatus.OK).body(response);
                }
                data.image = ConfigConst.config.imagesUrl() + fileName;
            }
            if (request.content != null) {
                data.content = request.content;
            }
            if (request.title != null) {
                data.title = request.title;
            }
            if (NumberHelper.IntegerIsEmpty(request.moveId)) {
                data.move_id = request.moveId;
            }

            if (NumberHelper.IntegerIsEmpty(request.type)) {
                data.type = request.type;
            }
            response.success(dbNewsService.save(data));
        } catch (IOException ex) {
            LOG.error(ex.getMessage());
            response.internalServer();
        }
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
        News data = dbNewsService.getById(request.id);
        if (data == null) {
            response.badRequest();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        try {
            dbNewsService.delete(data);
            response.success();
        } catch (Exception ex) {
            LOG.error(ex.getMessage());
            response.internalServer();
        }
        LOG.debug("deleteMovie:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity search(SearchNewsRequest request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        List<News> data = dbNewsService.search(request);
        response.success(data);
        LOG.debug("search:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity newDetails(Integer movieId) {
        BaseResponse response = new BaseResponse();
        News data = dbNewsService.getById(movieId);
        response.success(data);
        LOG.debug("newDtail:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }
}
