/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.repo;

import com.api.db.entity.Movie;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Thuong
 */
public interface MovieRepo extends JpaRepository<Movie, Integer> {

    List<Movie> findByIdIn(List<Integer> id);

    @Query("SELECT u FROM Movie u WHERE DATE(u.releaseDate) <= DATE(NOW()) AND DATE(u.endDate) >= DATE(NOW())")
    List<Movie> listShowing();

    @Query("SELECT u FROM Movie u WHERE DATE(u.releaseDate) > DATE(NOW())")
    List<Movie> listComming();
}
