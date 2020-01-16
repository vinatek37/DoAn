/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.response;

import java.sql.Timestamp;
import org.apache.log4j.Logger;

/**
 *
 * @author Thuong
 */
public class UserGetTicketResponse {

    public static final Logger LOG = Logger.getLogger(UserGetTicketResponse.class);
    private String code;
    private Integer price;
    private Timestamp startTime;
    private String movieName;
    private Integer duration;
    private String roomName;
    private String seatName;
    private Integer movieId;
    private Boolean state;
    private Integer id;

    public UserGetTicketResponse() {
    }

    public UserGetTicketResponse(String code, Integer price, Timestamp startTime, String movieName, Integer duration, String roomName, String seatName, Integer movieId, Boolean state, Integer id) {
        this.code = code;
        this.price = price;
        this.startTime = startTime;
        this.movieName = movieName;
        this.duration = duration;
        this.roomName = roomName;
        this.seatName = seatName;
        this.movieId = movieId;
        this.state = state;
        this.id = id;
    }
//this.setBlock(sqlResult[3] == null ? null : Boolean.parseBoolean(sqlResult[3].toString()));
    public boolean parseData(Object[] row) {
        try {
            this.code = row[0] == null ? "" : row[0].toString();
            this.price = Integer.parseInt(row[1] == null ? "0" : row[1].toString());
            this.startTime = Timestamp.valueOf(row[2] == null ? "11" : row[2].toString());
            this.movieName = row[3] == null ? null : row[3].toString();
            this.duration = Integer.parseInt(row[4] == null ? "0" : row[4].toString());
            this.roomName = row[5] == null ? null : row[5].toString();
            this.seatName = row[6] == null ? null : row[6].toString();;
            this.movieId = Integer.parseInt(row[7] == null ? "0" : row[7].toString());
            this.state = row[8] == null ? null : Boolean.parseBoolean(row[8].toString());
            this.id = Integer.parseInt(row[9] == null ? "0" : row[9].toString());
            return true;
        } catch (Exception ex) {
            LOG.error(ex.getMessage());
            return false;
        }
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

}
