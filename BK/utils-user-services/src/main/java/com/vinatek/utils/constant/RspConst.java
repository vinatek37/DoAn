package com.vinatek.utils.constant;

public class RspConst {

    public static final String SUCCESS = "Success";
    public static final int SUCCESS_CODE = 200;

    public static final String BAD_REQUEST = "Bad request";
    public static final int BAD_REQUEST_CODE = 400;

    public static final String UNAUTHORIZED = "Unauthorized";
    public static final int UNAUTHORIZED_CODE = 401;

    public static final String FORBIDDEN = "Forbidden";
    public static final int FORBIDDEN_CODE = 403;

    public static final String NOT_FOUND = "Not found";
    public static final int NOT_FOUND_CODE = 404;

    public static final String INPUT_INVALID = "Input invalid";
    public static final int INPUT_INVALID_CODE = 422;

    public static final String INTERNAL_SERVER_ERROR = "Lỗi máy chủ";
    public static final int INTERNAL_SERVER_ERROR_CODE = 500;

    public static class CUSTOM_CODE {

        public static final String ERROR_CONNECT_AD = "Connect Server AD error";
        public static final int ERROR_CONNECT_AD_CODE = 4444;

        public static final String UNAUTHOR_AD_ERROR = "AD system unauthor";
        public static final int UNAUTHOR_AD_ERROR_CODE = 4445;

        public static final String INTERNAL_ERROR_AD = "Internal error with Authen AD";
        public static final int INTERNAL_ERROR_AD_CODE = 4446;

        public static final String MAIL_USED = "mail was used";
        public static final int MAIL_USED_CODE = 423;

        public static final String PHONE_USED = "Phonenumber was used";
        public static final int PHONE_USED_CODE = 424;

        public static final String PID_USED = "PID was used";
        public static final int PID_USED_CODE = 425;

        public static final String PID_NOT_EXISTS = "PID not exists";
        public static final int PID_NOT_EXISTS_CODE = 426;

        public static final String EMAIL_AND_PHONE_EMPTY = "Email and Phone in PID is empty";
        public static final int EMAIL_AND_PHONE_EMPTY_CODE = 427;

        public static final String CONNECT_VIN_SERVER_ERROR = "Cannot get pid info from Vin server";
        public static final int CONNECT_VIN_SERVER_ERROR_CODE = 428;

        public static final String PASSWORD_INVALID = "Password must be minimum 6 characters, at least one letter and one number("
                + " regex in back_end: ^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]*)(?=.*[@#$%^&+=]*)(?=\\S+$).{6,}$";
        public static final int PASSWORD_INVALID_CODE = 429;
        
        public static final String USER_IS_LOCKED = "User is currently locked";
        public static final int USER_IS_LOCKED_CODE = 430;
    }

    public static class OTP_RSP_CODE {

        public static final String OTP_EXPIRED = "Otp expired";
        public static final int OTP_EXPIRED_CODE = 4221;

        public static final String OTP_DELAY = "Delaying between 2 consecutive times";
        public static final int OTP_DELAY_CODE = 4222;

        public static final String OTP_LIMITED = "Limited on this day";
        public static final int OTP_LIMITED_CODE = 4223;
    }
}
