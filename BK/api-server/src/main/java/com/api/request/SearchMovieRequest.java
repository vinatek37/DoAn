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
public class SearchMovieRequest {

    private String name;
    private String nation;
    private Integer categoryId;
    private String language;
    private Integer age;

    @Override
    public String toString() {
        return "SearchMovieRequest{" + "name=" + name + ", categoryId=" + categoryId + ", language=" + language + ", nation=" + nation + ", age=" + age + '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

}
