/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.oauth2.service;

import com.oauth2.config.ApiConfig;
import com.oauth2.model.CustomUserDetail;
import com.oauth2.model.User;
import com.oauth2.repository.UserRepository;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 *
 * @author Thuong
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    private static final Logger LOG = Logger.getLogger(UserDetailsService.class);

    @Autowired
    UserRepository repository;

    @Autowired
    LoginAttemptService loginAttemptService;

    @Autowired
    HttpServletRequest request;

    @Override
    public UserDetails loadUserByUsername(String mail) throws UsernameNotFoundException {
        LOG.debug("To check user: " + mail);

        String ip = getClientIP();
        if (loginAttemptService.isBlocked(ip)) {
            LOG.debug("IP: " + ip + " is blocked for " + ApiConfig.config.lockTimeAfterLoginFail);
            throw new RuntimeException(ApiConfig.config.maxLoginAttempt + " times login failed. Blocked 2 minutes!");
        }

        if (mail == null || mail.isEmpty()) {
            throw new UsernameNotFoundException("Username was not found. ");
        }

        Optional<User> optionalUser;
        String isPhoneNumber = "^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\\s\\./0-9]*$";
        Boolean isEmailLogin = !mail.matches(isPhoneNumber);
        if (mail.matches(isPhoneNumber)) {
            String tmp = PhoneCovert.CONVERT_PHONE(mail);
            optionalUser = repository.findByPhone(tmp);
        } else {

            optionalUser = repository.findByMail(mail);
        }
        optionalUser.orElseThrow(() -> new UsernameNotFoundException("wrong email or password"));
        return optionalUser.map(users -> new CustomUserDetail(users, isEmailLogin)).get();
    }

    private String getClientIP() {
        String xfHeader = request.getHeader("X-Forwarded-For");
        if (xfHeader == null) {
            return request.getRemoteAddr();
        }

        return xfHeader.split(",")[0];
    }
}
