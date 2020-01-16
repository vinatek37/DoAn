/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.service;

import com.api.request.AddNewMovieRequest;
import com.api.request.GetMovieFreeSlideRequest;
import com.api.request.IdRequest;
import com.api.request.SearchMovieRequest;
import org.springframework.http.ResponseEntity;

/**
 *
 * @author Thuong
 */
public interface MovieService {

    public ResponseEntity getFree(GetMovieFreeSlideRequest request);

    public ResponseEntity movieDetails(Integer movieId);

    public ResponseEntity getListShowing();

    public ResponseEntity getListComming();

    public ResponseEntity getScheduleByFilmId(Integer movieId);

    public ResponseEntity insertNewMovie(AddNewMovieRequest request);

    public ResponseEntity updateMovie(AddNewMovieRequest request);

    public ResponseEntity deleteMovie(IdRequest request);

    public ResponseEntity search(SearchMovieRequest request);


}
