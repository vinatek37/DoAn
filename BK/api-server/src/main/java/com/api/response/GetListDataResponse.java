/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.response;

/**
 *
 * @author Thuong
 */
public class GetListDataResponse {

    private Object data;
    private Integer count;

    public GetListDataResponse() {
    }

    public GetListDataResponse(Object data, Integer count) {
        this.data = data;
        this.count = count;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

}
