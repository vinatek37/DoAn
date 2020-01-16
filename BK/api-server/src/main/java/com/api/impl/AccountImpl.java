/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.impl;

import com.api.auth.AuthenService;
import com.api.constant.AccountTypeConst;
import com.api.db.entity.User;
import com.api.request.AccountRegisterRequest;
import com.api.db.service.DbAccountService;
import com.vinatek.utils.utilities.BaseResponse;
import com.vinatek.utils.utilities.StringHelper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import com.api.service.AccountService;
import com.vinatek.utils.utilities.DateTimeHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 *
 * @author Thuong
 */
@Service
public class AccountImpl implements AccountService {

    public static final Logger LOG = Logger.getLogger(AccountImpl.class);
    @Autowired
    DbAccountService dbAccountSV;

    private PasswordEncoder passwordEncoder;

    public AccountImpl() {
        passwordEncoder = new BCryptPasswordEncoder();
    }

    @Override
    public ResponseEntity accountRegister(AccountRegisterRequest request) {
        BaseResponse response = new BaseResponse();
        if (StringHelper.IsEmpty(request.getPhone()) || StringHelper.IsEmpty(request.getEmail())) {
            response.badRequest("Số điện thoại hoặc Email không được để trống");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (StringHelper.IsEmpty(request.getPassword())) {
            response.badRequest("Mật khẩu không được để trống");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        User usMail = dbAccountSV.getByMail(request.getEmail());
        User usPhone = dbAccountSV.getByPhone(request.getPhone());
        if (usMail != null) {
            response.badRequest("Email đã được sử dụng");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        if (usPhone != null) {
            response.badRequest("SĐT đã được sử dụng");
            return ResponseEntity.status(HttpStatus.OK).body(response);
        }
        String password = passwordEncoder.encode(request.getPassword());
        User us = new User(request.getPhone(), request.getEmail(), password, true,
                AccountTypeConst.ROLE.USER, DateTimeHelper.getCurrentTimestamp(), DateTimeHelper.getCurrentTimestamp(),
                request.getName(), 0);
        if (dbAccountSV.save(us)) {
            response.success("Đăng ký tài khoản thành công");
        }
        LOG.debug("accountRegister:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity otpCheck(String otp, String pid, Boolean remove) {
        BaseResponse response = new BaseResponse();
        response.success();
        LOG.debug("Result password forgot request:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }

    @Override
    public ResponseEntity profile() {
        BaseResponse response = new BaseResponse();
        String username = AuthenService.Instance().getUsersName();
        if (username == null) {
            response.unAuthor();
            ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }
        User userData = dbAccountSV.getByMailOrPhone(username, username);
        if (userData == null) {
            response.unAuthor();
            ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
        }
        response.success(userData);
        LOG.debug("profile:" + response.toString());
        return ResponseEntity.status(HttpStatus.OK).body(response);
    }
}
