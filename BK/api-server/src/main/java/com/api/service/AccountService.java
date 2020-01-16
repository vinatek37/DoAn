/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.service;

import com.api.request.AccountRegisterRequest;
import org.springframework.http.ResponseEntity;

/**
 *
 * @author Thuong
 */
public interface AccountService {

    public ResponseEntity accountRegister(AccountRegisterRequest request);

    public ResponseEntity otpCheck(String otp, String pid, Boolean remove);

    public ResponseEntity profile();

}
