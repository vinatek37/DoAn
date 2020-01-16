/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities;

import org.springframework.util.Base64Utils;

/**
 *
 * @author Dzungvd <dung.vuongdinh.vn@gmail.com>
 */
public class ArrayHelper {
    public static int[] ByteArrayToIntArray(byte[] data) {
        int[] result = new int[data.length];
        for (int i = 0; i < data.length; i++) {
            result[i] = data[i];
        }
        
        return result;
    }
    
    public static byte[] IntArrayToByteArray(int[] data) {
        byte[] result = new byte[data.length];
        for (int i = 0; i < data.length; i++) {
            result[i] = (byte)data[i];
        }
        
        return result;
    }    

    public static float[] ByteArrayToFloatArray(byte[] data) {
        float[] result = new float[data.length];
        for (int i = 0; i < data.length; i++) {
            result[i] = data[i];
        }
        
        return result;
    }

    public static byte[] FloatArrayToByteArray(float[] data) {
        byte[] result = new byte[data.length];
        for (int i = 0; i < data.length; i++) {
            result[i] = (byte)(data[i]);
        }
        
        return result;
    }
    
    public static String FloatArrayToBase64String(float[] data) {
        byte[] value = FloatArrayToByteArray(data);
        return Base64Utils.encodeToString(value);
        
    }
    
    public static void Copy(Object src, int srcPos, Object dest, int destPos, int length) {
        System.arraycopy(src, srcPos, dest, destPos, length);
    }
}
