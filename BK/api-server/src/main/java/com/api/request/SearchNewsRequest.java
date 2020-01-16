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
public class SearchNewsRequest {

    private String title;
    private String content;
    private Integer move_id;
    private Integer type;

    @Override
    public String toString() {
        return "SearchNewsRequest{" + "title=" + title + ", content=" + content + ", move_id=" + move_id + ", type=" + type + '}';
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getMove_id() {
        return move_id;
    }

    public void setMove_id(Integer move_id) {
        this.move_id = move_id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

}
