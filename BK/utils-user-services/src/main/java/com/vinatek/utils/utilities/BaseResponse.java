/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities;

import com.google.gson.Gson;
import com.vinatek.utils.constant.RspConst;

import java.io.Serializable;

/**
 *
 * @author viett
 */
public class BaseResponse implements Serializable {

    public int result;
    public String mess;
    public Object obj;

    public BaseResponse() {

    }

    public void success() {
        this.mess = RspConst.SUCCESS;
        this.result = RspConst.SUCCESS_CODE;
    }

    public void success(Object data) {
        this.mess = RspConst.SUCCESS;
        this.result = RspConst.SUCCESS_CODE;
        this.obj = data;
    }

    public void unAuthor() {
        this.mess = RspConst.UNAUTHORIZED;
        this.result = RspConst.UNAUTHORIZED_CODE;
    }

    public void unAuthor(String detail) {
        this.mess = RspConst.UNAUTHORIZED;
        this.result = RspConst.UNAUTHORIZED_CODE;
        this.obj = detail;
    }

    public void badRequest() {
        this.mess = RspConst.BAD_REQUEST;
        this.result = RspConst.BAD_REQUEST_CODE;
    }

    public void badRequest(String detail) {
        this.mess = detail;
        this.result = RspConst.BAD_REQUEST_CODE;
    }

    public void forbiden() {
        this.mess = RspConst.FORBIDDEN;
        this.result = RspConst.FORBIDDEN_CODE;
    }

    public void forbiden(String detail) {
        this.mess = detail;
        this.result = RspConst.FORBIDDEN_CODE;
    }

    public void notFound() {
        this.mess = RspConst.NOT_FOUND;
        this.result = RspConst.NOT_FOUND_CODE;
    }

    public void notFound(String detail) {
        this.mess = detail;
        this.result = RspConst.NOT_FOUND_CODE;
    }

    public void internalServer() {
        this.mess = RspConst.INTERNAL_SERVER_ERROR;
        this.result = RspConst.INTERNAL_SERVER_ERROR_CODE;
    }

    public void internalServer(String detail) {
        this.mess = RspConst.INTERNAL_SERVER_ERROR + ". " + detail;
        this.result = RspConst.INTERNAL_SERVER_ERROR_CODE;
    }

    public void internalServer(Object detail) {
        this.mess = RspConst.INTERNAL_SERVER_ERROR;
        this.result = RspConst.INTERNAL_SERVER_ERROR_CODE;
        this.obj = detail;
    }

    public BaseResponse(int result, String mess) {
        this.result = result;
        this.mess = mess;
    }

    public BaseResponse(int result, String mess, Object obj) {
        this.result = result;
        this.obj = obj;
        this.mess = mess;
    }

    @Override
    public String toString() {
        Gson gson = new Gson();
        return gson.toJson(this);
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }

    public static BaseResponse FORBIDDEN() {
        BaseResponse response = new BaseResponse();
        response.mess = RspConst.FORBIDDEN;
        response.result = RspConst.FORBIDDEN_CODE;
        return response;
    }

    public static BaseResponse BAD_REQUEST() {
        BaseResponse response = new BaseResponse();
        response.mess = RspConst.BAD_REQUEST;
        response.result = RspConst.BAD_REQUEST_CODE;
        return response;
    }

    public static BaseResponse PID_NOT_IN_ACCOUNT(String pid) {
        BaseResponse response = new BaseResponse();
        response.mess = RspConst.NOT_FOUND + ". Pid = " + pid + " not in this account";
        response.result = RspConst.NOT_FOUND_CODE;
        return response;
    }

    public static BaseResponse NOT_FOUND() {
        BaseResponse response = new BaseResponse();
        response.mess = RspConst.NOT_FOUND;
        response.result = RspConst.NOT_FOUND_CODE;
        return response;
    }

}
