/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.response;

import io.swagger.annotations.ApiModelProperty;

/**
 *
 * @author Thuong
 */
public class SendOtpResponse {

    @ApiModelProperty(notes = "Kết quả yêu cầu OTP:  0 : Gửi thành công\n"
            //            + "     1 : User không tồn tại trong hệ thống\n"
            + "     2 : Gửi quá MAX_OTP_PER_DAY 1 ngày\n"
            + "     3 : Thời gian gửi OTP giữa 2 lần liên tiếp OTP_EXPIRE\n"
            + "     4 : Lỗi do hệ thống gửi OTP\n")
//            + "     5 : Tài khoản đang bị lock, ko cho phép reset password")
    private Integer resultSendOtp;

    @ApiModelProperty(notes = "Thời gian có thể gửi yêu cầu OTP lần tiếp theo giây, trong trường hợp resultSendOtp = 3")
    private Integer deplayingTime;

    public Integer getDeplayingTime() {
        return deplayingTime;
    }

    public void setDeplayingTime(Integer deplayingTime) {
        this.deplayingTime = deplayingTime;
    }

    public Integer getResultSendOtp() {
        return resultSendOtp;
    }

    public void setResultSendOtp(Integer resultSendOtp) {
        this.resultSendOtp = resultSendOtp;
    }

    @Override
    public String toString() {
        return "PasswordForgotResponse{" + "resultSendOtp=" + resultSendOtp + '}';
    }

}
