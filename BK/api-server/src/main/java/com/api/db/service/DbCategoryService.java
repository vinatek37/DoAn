/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.service;

import com.api.db.entity.Categories;
import com.api.db.entity.Room;
import com.api.db.repo.CategoryRepo;
import com.api.db.repo.MovieRepo;
import com.api.db.repo.RoomRepo;
import com.api.db.repo.ScheduleRepo;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Thuong
 */
@Service
public class DbCategoryService {

    public static final Logger logger = Logger.getLogger(DbScheduleService.class);
    @Autowired
    MovieRepo movieRepo;
    @Autowired
    ScheduleRepo scheduleRepo;
    @Autowired
    RoomRepo roomRepo;
    @Autowired
    CategoryRepo categoryRepo;
    @PersistenceContext
    EntityManager entityManager;

    public List<Room> getRoomList() {
        return roomRepo.findAll();
    }

    public List<Categories> getCategoryList() {
        return categoryRepo.findAll();
    }
}
