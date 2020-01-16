/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities;

/**
 *
 * @author Dzungvd <dung.vuongdinh.vn@gmail.com>
 */
public class NumberHelper {
    public static int FloatToUInt32Bits(float f) {
        return Float.floatToIntBits(f);
    }

    public static boolean IntegerIsEmpty(Integer i) {
        return (i == null || i == 0);
    }

    public static boolean LongIsEmpty(Long i) {
        return (i == null || i == 0);
    }    
}
