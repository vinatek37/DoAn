/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.db.repo;

import com.api.db.entity.User;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Thuong
 */
public interface AccountRepository extends JpaRepository<User, String> {

    public Optional<User> findByPhone(String phone);

    public Optional<User> findByMail(String mail);

    public Optional<User> findByMailOrPhone(String mail, String phone);
}
