/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.controller;

import com.api.request.AccountRegisterRequest;
import com.api.response.SendOtpResponse;
import com.vinatek.utils.constant.RspConst;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import io.swagger.annotations.Authorization;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.api.service.AccountService;

/**
 *
 * @author Thuong
 */
@RestController
@RequestMapping(value = {"/api/account"})
public class AccountController {

    public static final Logger logger = Logger.getLogger(AccountController.class);
    @Autowired
    AccountService accountSV;

    @ApiOperation(
            value = "",
            notes = "Yêu cầu lấy đăng ký tài khoản", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/account-regiter", method = RequestMethod.POST)
    public ResponseEntity accountRegister(@RequestBody AccountRegisterRequest request) {
        logger.debug("request /request: = " + request.toString());
        return accountSV.accountRegister(request);
    }

     @ApiOperation(
            value = "",
            notes = "Lấy thông tin cá nhân", authorizations = {
                @Authorization(value = "Token Access")})

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ResponseEntity profile() {
        logger.debug("request /profile");
        return accountSV.profile();
    }
    
    @ApiOperation(
            value = "",
            notes = "Kiểm tra OTP")
    @ApiResponses(value = {
        @ApiResponse(code = RspConst.BAD_REQUEST_CODE, message = "Thiếu thông tin truyền lên hoặc null")
        ,    @ApiResponse(code = RspConst.INPUT_INVALID_CODE, message = "OTP không tồn tại hoặc không đúng")
        ,    @ApiResponse(code = RspConst.NOT_FOUND_CODE, message = "Tài khoản yêu cầu không tồn tại")
        ,    @ApiResponse(code = RspConst.INTERNAL_SERVER_ERROR_CODE, message = "Internal Server Error")
        ,    @ApiResponse(code = 200, message = RspConst.SUCCESS)
        ,    @ApiResponse(code = RspConst.OTP_RSP_CODE.OTP_EXPIRED_CODE, message = "OTP expired")})
    @ApiImplicitParams({
        @ApiImplicitParam(name = "otp", value = "", defaultValue = "", required = true, dataType = "string", paramType = "query")
        ,@ApiImplicitParam(name = "pid", value = "", required = false, example = "1", dataType = "string", paramType = "query")
        ,@ApiImplicitParam(name = "remove", value = "Xóa OTP trong trường hợp check thành công", required = false, example = "true", dataType = "boolean", paramType = "query")
    })
    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public ResponseEntity otpCheck(String otp, @RequestParam String pid, @RequestParam boolean remove) {
        logger.debug("request /check: " + otp + ". pid " + pid);
        return accountSV.otpCheck(otp, pid, remove);
    }
}
