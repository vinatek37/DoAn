/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.service;

import com.api.db.entity.User;
import com.vinatek.utils.utilities.StringHelper;
import java.util.Optional;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.api.db.repo.AccountRepository;

/**
 *
 * @author Thuong
 */
@Service
public class DbAccountService {

    public static final Logger logger = Logger.getLogger(DbAccountService.class);
    @Autowired
    AccountRepository repo;

    public User getById(String pid) {
        if (StringHelper.IsEmpty(pid)) {
            return null;
        }
        User result = null;
        try {
            Optional<User> qery = repo.findById(pid);
            if (qery.isPresent()) {
                result = qery.get();
            }
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }
        return result;
    }

    public boolean save(User user) {
        if (repo.save(user) != null) {
            return true;
        }
        return false;
    }

    public User getByMailOrPhone(String phone, String mail) {
        if (StringHelper.IsEmpty(mail) || StringHelper.IsEmpty(phone)) {
            return null;
        }
        User result = null;
        try {
            Optional<User> qery = repo.findByMailOrPhone(mail, phone);
            if (qery.isPresent()) {
                result = qery.get();
            }
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }
        return result;
    }

    public User getByMail(String mail) {
        if (StringHelper.IsEmpty(mail)) {
            return null;
        }
        User result = null;
        try {
            Optional<User> qery = repo.findByMail(mail);
            if (qery.isPresent()) {
                result = qery.get();
            }
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }
        return result;
    }

    public User getByPhone(String phone) {
        if (StringHelper.IsEmpty(phone)) {
            return null;
        }
        User result = null;
        try {
            Optional<User> qery = repo.findByPhone(phone);
            if (qery.isPresent()) {
                result = qery.get();
            }
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }
        return result;
    }

    public void delete(User user) {
        repo.delete(user);
    }
}
