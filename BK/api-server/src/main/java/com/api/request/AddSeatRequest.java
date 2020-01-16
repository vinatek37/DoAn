/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.request;

import io.swagger.annotations.ApiModelProperty;

/**
 *
 * @author Thuong
 */
public class AddSeatRequest {

    @ApiModelProperty(notes = "Bắt buộc trong trường hợp update")
    public Integer id;
    public Integer roomId;
    public String name;
    public Integer row;
    public String area;
    public String type;
    public Integer price;
}
