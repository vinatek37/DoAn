/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.oauth2.config;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;


public class Config {
    
    @SerializedName("maxLoginAttempt")
    @Expose
    public int maxLoginAttempt;

    @SerializedName("loginAttempPeriod")
    @Expose
    public int loginAttempPeriod;

    @SerializedName("lockTimeAfterLoginFail")
    @Expose
    public int lockTimeAfterLoginFail;
}
