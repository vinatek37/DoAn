/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.constant;

/**
 *
 * @author viett
 */
public class AccountConst {

    public class State {

        public static final int NEW_REGISTER = 0;
        public static final int ACTIVE = 1;
        public static final int BANNED = 2;
    }

    public class Role {

        public static final int PATIENT = 0;
        public static final int DOCTOR = 1;
        public static final int ADMIN = 2;
        public static final int RECEPTIONIST = 3;
        public static final int CUSTOM_CARE = 4;
        
        public static final String PATIENT_STR = "ROLE_PATIENT";
        public static final String DOCTOR_STR = "ROLE_DOCTOR";
        public static final String ADMIN_STR = "ROLE_ADMIN";
        public static final String RECEPTIONIST_STR = "ROLE_RECEPTIONIST";
        public static final String CUSTOM_CARE_STR = "ROLE_CUSTOM_CARE";
    }

    public class smokeRegulary {

        public static final int NEVER = 0;
        public static final int RARELY = 1;
        public static final int SOMETIMES = 2;
        public static final int OFTEN = 3;
    }
}
