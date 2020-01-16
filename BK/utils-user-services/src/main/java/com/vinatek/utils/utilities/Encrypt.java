/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.util.Base64;

/**
 *
 * @author ADMIN
 */
public class Encrypt {

    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(Encrypt.class);

    final protected static char[] hexArray = "0123456789ABCDEF".toCharArray();
    
    public static String bytesToHex(byte[] bytes) {
        if (bytes == null) {
            return "";
        }
        char[] hexChars = new char[bytes.length * 2];
        int v;
        for (int j = 0; j < bytes.length; j++) {
            v = bytes[j] & 0xFF;
            hexChars[j * 2] = hexArray[v >>> 4];
            hexChars[j * 2 + 1] = hexArray[v & 0x0F];
        }
        return new String(hexChars);
    }

    public static byte[] hexToBytes(String hex) {
        if (hex == null) {
            return null;
        }
        int len = hex.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4) + Character.digit(hex.charAt(i + 1), 16));
        }
        return data;
    }

    public static byte[] computeSHA1(byte[] input, int offset, int len) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            md.update(input, offset, len);
            return md.digest();
        } catch (Exception ex) {
            logger.debug("Exception: " + ex);
        }
        return null;
    }
    
    public static byte[] computeSHA256(byte[] input, int offset, int len) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(input, offset, len);
            return md.digest();
        } catch (Exception ex) {
            logger.debug("Exception: " + ex);
        }
        return null;
    }    
    
    public static String Sha1HashWithHex(String input) {
        try {
            byte[] data = input.getBytes("UTF-8");
            return bytesToHex(computeSHA1(data, 0, data.length));
        } catch (UnsupportedEncodingException ex) {
            logger.debug("Exception: " + ex);
        }   
        return null;
    }
    
    public static String Sha2HashWithHex(String input) {
        try {
            byte[] data = input.getBytes("UTF-8");
            return bytesToHex(computeSHA256(data, 0, data.length));
        } catch (UnsupportedEncodingException ex) {
            logger.debug("Exception: " + ex);
        }        
        return null;
    }

    public static byte[] Base64StringToBytes(String strData) {
        byte[] baseData = Base64.getDecoder().decode(strData);
        return baseData;
    }
           
    public static String BytesToBase64String(byte[] data) {
        String strData = Base64.getEncoder().encodeToString(data);
        return strData;
    }
}
