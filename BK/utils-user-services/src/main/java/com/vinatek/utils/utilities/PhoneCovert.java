/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities;

/**
 *
 * @author viett
 */
public class PhoneCovert {

    public static String CONVERT_PHONE(String phone) {
        String tmp = phone.replace(" ", "");
        if (tmp.startsWith("+")) {
            tmp = tmp.replace("+", "");
        }
        if (tmp.startsWith("840")) {
            tmp = tmp.replace("840", "0");
        } else {
            if (tmp.startsWith("84")) {
                tmp = tmp.replace("84", "0");
            }
        }
        return tmp;
    }
}
