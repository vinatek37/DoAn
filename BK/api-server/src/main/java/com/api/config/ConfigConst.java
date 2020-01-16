/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.api.config;


/**
 *
 * @author Thuong
 */
public class ConfigConst {

    public static ConfigConst config = new ConfigConst();
    
    public String filmImageFolder() {
        return (String) ApplicationProperties.configuration.getProperty("filmImageFolder");
    }

    public String slideImageFolder() {
        return (String) ApplicationProperties.configuration.getProperty("slideImageFolder");
    }
    public String slideUrl() {
        return (String) ApplicationProperties.configuration.getProperty("slideUrl");
    }
    public String imagesUrl() {
        return (String) ApplicationProperties.configuration.getProperty("imagesUrl");
    }

    public Integer otpDelaySeconds() {
        return Integer.valueOf(ApplicationProperties.configuration.getProperty("OTP_DELAY_SECONDS") == null
                ? "0" : (String) ApplicationProperties.configuration.getProperty("OTP_DELAY_SECONDS"));
    }

    public Integer otpLimitPerDay() {
        return Integer.valueOf(ApplicationProperties.configuration.getProperty("OTP_LIMIT_ON_DAY") == null
                ? "0" : (String) ApplicationProperties.configuration.getProperty("OTP_LIMIT_ON_DAY"));
    }

    public Integer otpExpireTimeSeconds() {
        return Integer.valueOf(ApplicationProperties.configuration.getProperty("OTP_EXPIRE_TIME_SECONDS") == null
                ? "0" : (String) ApplicationProperties.configuration.getProperty("OTP_EXPIRE_TIME_SECONDS"));
    }

    public Integer MAX_QUEUE_SIZE() {
        return Integer.valueOf(ApplicationProperties.configuration.getProperty("MAX_QUEUE_SIZE") == null
                ? "0" : (String) ApplicationProperties.configuration.getProperty("MAX_QUEUE_SIZE"));
    }

    public Integer NUMBER_THREAD() {
        return Integer.valueOf(ApplicationProperties.configuration.getProperty("NUMBER_THREAD") == null
                ? "0" : (String) ApplicationProperties.configuration.getProperty("NUMBER_THREAD"));
    }

}
