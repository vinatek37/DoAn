/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities;

import java.util.Random;

import static java.nio.charset.StandardCharsets.UTF_8;

/**
 *
 * @author Dzungvd <dung.vuongdinh.vn@gmail.com>
 */
public class StringHelper {

    public static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(StringHelper.class);

    public static boolean IsEmpty(String str) {
        return (str == null || str.isEmpty());
    }

    public static String ConvertUTF_8(String origin) {
        byte ptext[] = origin.getBytes();
        return new String(ptext, UTF_8);
    }

    private static final Random Rng = new Random();
    private static final String Chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
    private static final String CharsLower = "abcdefghijklmnopqrstuvwxyz1234567890";

    public static String RandomString(int size) {
        char[] buffer = new char[size];

        for (char i = 0; i < size; i++) {
            int index = Rng.nextInt(Chars.length());
            buffer[i] = Chars.charAt(index);
        }

        return new String(buffer);
    }

    public static String RandomStringLowercase(int size) {
        char[] buffer = new char[size];

        for (char i = 0; i < size; i++) {
            int index = Rng.nextInt(CharsLower.length());
            buffer[i] = CharsLower.charAt(index);
        }

        return new String(buffer);
    }

    public static String getAvatarFilename(int userId) {
        return String.valueOf(userId) + "_" + String.valueOf(System.currentTimeMillis()) + ".jpg";
    }

    public static String generateRandomOTP() {
        try {
            int n = 100000 + new Random().nextInt(900000);
            return String.valueOf(n);

        } catch (Exception e) {
            return "123456";
        }
    }
}
