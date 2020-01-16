/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.oauth2.config;

/**
 *
 * @author Thuong
 */
public class AccountTypeConstant {

    public class ROLE {

        public static final int USER = 0;
        public static final int ADMIN = 1;

        public static final String USER_STR = "ROLE_USER";
        public static final String ADMIN_STR = "ROLE_ADMIN";

    }

    public class AccountStateConst {

        public static final int ACTIVE = 1;
        public static final int BLOCK = 0;
    }
}
