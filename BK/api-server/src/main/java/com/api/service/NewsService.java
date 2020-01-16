/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.service;

import com.api.request.AddNewsRequest;
import com.api.request.IdRequest;
import com.api.request.SearchNewsRequest;
import org.springframework.http.ResponseEntity;

/**
 *
 * @author Thuong
 */
public interface NewsService {

    public ResponseEntity getListNews();

    public ResponseEntity insert(AddNewsRequest request);

    public ResponseEntity update(AddNewsRequest request);

    public ResponseEntity delete(IdRequest request);

    public ResponseEntity search(SearchNewsRequest request);

    public ResponseEntity newDetails(Integer movieId);
    
}
