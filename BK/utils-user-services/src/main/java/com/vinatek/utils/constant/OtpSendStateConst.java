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
public class OtpSendStateConst {
    // 0 : Gửi thành công
    // 1 : User không tồn tại trong hệ thống
    // 2 : Không gửi quá MAX_OTP_PER_DAY 1 ngày
    // 3 : Thời gian gửi OTP giữa 2 lần liên tiếp OTP_EXPIRE
    // 4 : Lỗi do hệ thống gửi OTP
    // 5 : Tài khoản đang bị lock, ko cho phép reset password
    
    public static final int SUCCESS = 0;
    public static final int USER_NOT_FOUND = 1;
    public static final int LIMITED_IN_DAY = 2;
    public static final int DELAYED = 3;
    public static final int OTP_SERVER_ERROR = 4;
    public static final int USER_IS_LOCKED = 5;
}
