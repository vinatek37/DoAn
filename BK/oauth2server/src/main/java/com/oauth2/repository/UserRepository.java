/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.oauth2.repository;

import com.oauth2.model.User;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Khiem Ha
 */
@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User> findByMail(String mail);
    Optional<User> findByPhone(String phone);
}
