/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.response;

import com.api.db.entity.Movie;
import java.sql.Timestamp;

/**
 *
 * @author Thuong
 */
public class SlideRsp extends Movie {

    private String imageSlide;

    public SlideRsp() {
    }

    public SlideRsp(Movie mv, String img) {
        this.imageSlide = img;
        this.about = mv.about;
        this.cast = mv.cast;
        this.categoryId = mv.categoryId;
        this.directors = mv.directors;
        this.duration = mv.duration;
        this.id = mv.id;
        this.language = mv.language;
        this.name = mv.name;
        this.nation = mv.nation;
        this.releaseDate = mv.releaseDate;
        this.thumbImage = mv.thumbImage;
        this.urlFull = mv.urlFull;
        this.urlTrailler = mv.urlTrailler;
    }

    public SlideRsp(String imageSlide) {
        this.imageSlide = imageSlide;
    }

    public String getImageSlide() {
        return imageSlide;
    }

    public void setImageSlide(String imageSlide) {
        this.imageSlide = imageSlide;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Timestamp getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Timestamp releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDirectors() {
        return directors;
    }

    public void setDirectors(String directors) {
        this.directors = directors;
    }

    public String getCast() {
        return cast;
    }

    public void setCast(String cast) {
        this.cast = cast;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getThumbImage() {
        return thumbImage;
    }

    public void setThumbImage(String thumbImage) {
        this.thumbImage = thumbImage;
    }

    public String getUrlTrailler() {
        return urlTrailler;
    }

    public void setUrlTrailler(String urlTrailler) {
        this.urlTrailler = urlTrailler;
    }

    public String getUrlFull() {
        return urlFull;
    }

    public void setUrlFull(String urlFull) {
        this.urlFull = urlFull;
    }

}
