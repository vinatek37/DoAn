/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.request;

/**
 *
 * @author Thuong
 */
public class SearchSeatRequest {

    public Integer roomId;
    public String name;
    public Integer row;

    @Override
    public String toString() {
        return "SearchSeatRequest{" + "roomId=" + roomId + ", name=" + name + ", row=" + row + '}';
    }

}
