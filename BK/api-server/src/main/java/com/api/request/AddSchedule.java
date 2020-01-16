/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.request;

import io.swagger.annotations.ApiModelProperty;
import java.sql.Timestamp;

/**
 *
 * @author Thuong
 */
public class AddSchedule {

    @ApiModelProperty(notes = "Bắt buộc trong trường hợp update+delete Schedule")
    private Integer id;
    private Integer movieId;
    private Integer roomId;
    private Timestamp startTime;

    @Override
    public String toString() {
        return "AddSchedule{" + "id=" + id + ", movieId=" + movieId + ", roomId=" + roomId + ", startTime=" + startTime + '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

}
