/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.auth;

import com.api.constant.AccountTypeConst;
import java.util.Collection;
import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.provider.OAuth2Authentication;

/**
 *
 * @author Thai1108
 */
public class AuthenService {

    private static final Logger logger = Logger.getLogger(AuthenService.class);
    private static AuthenService instance = new AuthenService();

    public static AuthenService Instance() {
        return instance;
    }

    private AuthenService() {
    }

    public String getUsersName() {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            OAuth2Authentication oa = (OAuth2Authentication) authentication;
            Collection<GrantedAuthority> aus = oa.getAuthorities();
            for (GrantedAuthority au : aus) {
                logger.info(au.getAuthority());
                if (au.getAuthority().equalsIgnoreCase(AccountTypeConst.ROLE.USER_STR)) {
                    return oa.getName();
                }
                if (au.getAuthority().equalsIgnoreCase(AccountTypeConst.ROLE.ADMIN_STR)) {
                    return oa.getName();
                }
            }
        } catch (Exception ex) {
            return null;
        }
        return null;
    }

    public boolean isUser() {
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        OAuth2Authentication oa = (OAuth2Authentication) authentication;
//        Collection<GrantedAuthority> aus = oa.getAuthorities();
//        for (GrantedAuthority au : aus) {
//            logger.info(au.getAuthority());
//            if (au.getAuthority().equalsIgnoreCase(AccountTypeConst.ROLE.USER_STR)) {
        return true;
//            }
//        }
//
//        return false;
    }

    public boolean isAdmin() {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            OAuth2Authentication oa = (OAuth2Authentication) authentication;
            Collection<GrantedAuthority> aus = oa.getAuthorities();
            for (GrantedAuthority au : aus) {
                logger.info(au.getAuthority());
                if (au.getAuthority().equalsIgnoreCase(AccountTypeConst.ROLE.ADMIN_STR)) {
                    return true;
                }
            }
        } catch (Exception ex) {
            return false;
        }
        return false;
    }
}
