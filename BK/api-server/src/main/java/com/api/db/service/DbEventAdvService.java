/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.service;

import com.api.db.entity.EventAdv;
import com.api.db.repo.EventAdvRepo;
import com.vinatek.utils.utilities.NumberHelper;
import java.util.List;
import java.util.Optional;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Thuong
 */
@Service
public class DbEventAdvService {

    public static final Logger logger = Logger.getLogger(DbEventAdvService.class);
    @Autowired
    EventAdvRepo repo;

    public List<EventAdv> getAll() {
        return repo.findAll();
    }

    public EventAdv getById(Integer id) {
        if (NumberHelper.IntegerIsEmpty(id)) {
            return null;
        }
        EventAdv result = null;
        try {
            Optional<EventAdv> qery = repo.findById(id);
            if (qery.isPresent()) {
                result = qery.get();
            }
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }
        return result;
    }

    public boolean save(EventAdv data) {
        if (repo.save(data) != null) {
            return true;
        }
        return false;
    }

    public void delete(EventAdv data) {
        repo.delete(data);
    }
}
