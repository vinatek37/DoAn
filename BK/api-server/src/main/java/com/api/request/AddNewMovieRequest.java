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
public class AddNewMovieRequest {

    @ApiModelProperty(notes = "Bắt buộc trong trường hợp update Film")
    public Integer id;
    public Integer categoryId;
    public String name;
    public String language;
    public Integer duration;
    public Timestamp releaseDate;
    public Timestamp endDate;
    public String directors;
    public String cast;
    public String about;
    public String nation;
    public String thumbImageStringBase64;
    public String urlTrailler;
    public String urlFull;
    public Integer age;

}
