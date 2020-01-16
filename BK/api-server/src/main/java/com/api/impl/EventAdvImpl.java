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
import com.api.db.service.DbAccountService;
import com.api.db.service.DbEventAdvService;
import com.api.db.service.DbMovieService;
import static com.api.impl.AccountImpl.LOG;
import com.api.request.event.CreateEventAdv;
import com.api.response.SlideRsp;
import com.vinatek.utils.utilities.BaseResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import com.api.service.EventAdvService;
import com.vinatek.utils.utilities.FileHelper;
import com.vinatek.utils.utilities.NumberHelper;
import com.vinatek.utils.utilities.StringHelper;
import java.io.IOException;
import org.apache.log4j.Logger;

/**
 *
 * @author Thuong
 */
@Service
public class EventAdvImpl implements EventAdvService {

    public static final Logger LOG = Logger.getLogger(EventAdvImpl.class);
    @Autowired
    DbEventAdvService dbEventSV;
    @Autowired
    DbMovieService dbMove;

    @Override
    public ResponseEntity getSlide() {
        BaseResponse response = new BaseResponse();
        List<EventAdv> lstEvent = dbEventSV.getAll();
        Map<Integer, Movie> lstMovie = dbMove.getByListEvent(lstEvent);
        List<SlideRsp> dataRsp = new ArrayList<>();
        lstEvent.forEach((event) -> {
            SlideRsp slideData = new SlideRsp(lstMovie.get(event.movieId), event.imageBanner);
            dataRsp.add(slideData);
        });
        response.success(dataRsp);
        LOG.debug("getSlide:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity add(CreateEventAdv request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (NumberHelper.IntegerIsEmpty(request.getMoveId()) || StringHelper.IsEmpty(request.getImageBase64())) {
            response.badRequest("moveId || image data is empty");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Movie movie = dbMove.getById(request.getMoveId());
        if (movie == null) {
            response.badRequest(". Movie not found");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Boolean isSaveFile;
        try {
            String fileName = request.getMoveId() + "_silde.jpg";
            isSaveFile = FileHelper.WriteImageFile(request.getImageBase64(), ConfigConst.config.slideImageFolder(), fileName);
            if (isSaveFile) {
                EventAdv data = new EventAdv(request.getMoveId(), ConfigConst.config.slideUrl() + fileName);
                if (dbEventSV.save(data)) {
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
    public ResponseEntity delete(CreateEventAdv request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (NumberHelper.IntegerIsEmpty(request.getMoveId())) {
            response.badRequest("moveId  is empty");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        EventAdv event = dbEventSV.getById(request.getMoveId());
        if (event == null) {
            response.badRequest(". EventAdv not found");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        dbEventSV.delete(event);
        response.success();
        LOG.debug("delete:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity edit(CreateEventAdv request) {
        BaseResponse response = new BaseResponse();
        if (!AuthenService.Instance().isAdmin()) {
            response.unAuthor();
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (NumberHelper.IntegerIsEmpty(request.getMoveId()) || StringHelper.IsEmpty(request.getImageBase64())) {
            response.badRequest("moveId || image data is empty");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        EventAdv event = dbEventSV.getById(request.getMoveId());
        if (event == null) {
            response.badRequest(". EventAdv not found");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        Boolean isSaveFile;
        try {
            String fileName = request.getMoveId() + "_silde.jpg";
            isSaveFile = FileHelper.WriteImageFile(request.getImageBase64(), ConfigConst.config.slideImageFolder(), fileName);
            if (isSaveFile) {
                EventAdv data = new EventAdv(request.getMoveId(), ConfigConst.config.slideUrl() + fileName);
                if (dbEventSV.save(data)) {
                    response.success();
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

        LOG.debug("edit:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

}
