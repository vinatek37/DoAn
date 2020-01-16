/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities;

import org.springframework.util.Base64Utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NguyenHoang
 */
public class ObjHelper {

    public static byte[] getBytes(float x) {
        return getBytes(Float.floatToRawIntBits(x));
    }

    public static byte[] getBytes(int x) {
        return new byte[]{
            (byte) (x >>> 24),
            (byte) (x >>> 16),
            (byte) (x >>> 8),
            (byte) x
        };
    }

    private static byte[] ByteFromFloatArray(float[] data) {
        List<Byte> lstByte = new ArrayList<>();
        for (float fl : data) {
            byte[] result = getBytes(fl);
            for (byte bt : result) {
                lstByte.add(bt);
            }
        }

        int size = lstByte.size();
        byte[] ar = new byte[size];
        for (int i = 0; i < size; i++) {
            ar[i] = lstByte.get(i);
        }
        return ar;
    }

    private static byte[] ByteFromIntArray(int[] data) {
        List<Byte> lstByte = new ArrayList<>();
        for (int fl : data) {
            byte[] result = getBytes(fl);
            for (byte bt : result) {
                lstByte.add(bt);
            }
        }

        int size = lstByte.size();
        byte[] ar = new byte[size];
        for (int i = 0; i < size; i++) {
            ar[i] = lstByte.get(i);
        }
        return ar;
    }

    public static String StringFromFloatArray(float[] data) {
        byte[] value = ByteFromFloatArray(data);
        return Base64Utils.encodeToString(value);
    }

    public static String StringFromIntArray(int[] data) {
        byte[] value = ByteFromIntArray(data);
        return Base64Utils.encodeToString(value);
    }

    public static <T> void SetValue(String field, Object value){
    }

    public static <T> T SetValue(T t, String name, Object value) {
        Class<?> clazz = t.getClass();
        try {
            Field field = clazz.getDeclaredField(name);
            field.setAccessible(true);
            field.set(t, value);
        } catch (NoSuchFieldException | IllegalAccessException e) {
        }
        return t;
    }
}
