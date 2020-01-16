/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.repo;

import com.api.db.entity.Schedule;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Thuong
 */
public interface ScheduleRepo extends JpaRepository<Schedule, Integer> {

    List<Schedule> findByMovieIdAndStartTimeGreaterThan(Integer movieId, Timestamp startTime);
    
    Optional<Schedule> findByIdEqualsAndStartTimeGreaterThan(Integer id, Timestamp startTime);
}
