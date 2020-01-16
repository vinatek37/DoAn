/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.request;

import java.util.List;

/**
 *
 * @author Thuong
 */
public class TicketBookingRequest {

    private Integer schudeleId;
    private Integer staffId;
    private Integer userId;
    private Integer price;
    private List<Integer> emptySeatId;

    @Override
    public String toString() {
        return "TicketBookingRequest{" + "schudeleId=" + schudeleId + ", staffId=" + staffId + ", userId=" + userId + ", price=" + price + ", emptySeatId=" + emptySeatId + '}';
    }

    public Integer getSchudeleId() {
        return schudeleId;
    }

    public void setSchudeleId(Integer schudeleId) {
        this.schudeleId = schudeleId;
    }

    public Integer getStaffId() {
        return staffId;
    }

    public void setStaffId(Integer staffId) {
        this.staffId = staffId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public List<Integer> getEmptySeatId() {
        return emptySeatId;
    }

    public void setEmptySeatId(List<Integer> emptySeatId) {
        this.emptySeatId = emptySeatId;
    }

}
