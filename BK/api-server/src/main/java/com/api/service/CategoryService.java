/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.service;

import com.api.request.AddSeatRequest;
import com.api.request.IdRequest;
import com.api.request.SearchSeatRequest;
import org.springframework.http.ResponseEntity;

/**
 *
 * @author Thuong
 */
public interface CategoryService {

    public ResponseEntity roomList();

    public ResponseEntity categoryList();

    public ResponseEntity insert(AddSeatRequest request);

    public ResponseEntity update(AddSeatRequest request);

    public ResponseEntity delete(IdRequest request);

    public ResponseEntity search(SearchSeatRequest request);
    
}
