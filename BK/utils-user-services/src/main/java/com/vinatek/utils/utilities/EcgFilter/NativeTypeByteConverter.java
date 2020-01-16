package com.vinatek.utils.utilities.EcgFilter;

import com.vinatek.utils.utilities.NumberHelper;


public class NativeTypeByteConverter {

    public static byte[] float2Byte(float[] inData) {
        int j = 0;
        int length = inData.length;
        byte[] outData = new byte[length * 4];
        for (int i = 0; i < length; i++) {
            int data = NumberHelper.FloatToUInt32Bits(inData[i]);
            outData[j++] = (byte) (data >> 0);
            outData[j++] = (byte) (data >> 8);
            outData[j++] = (byte) (data >> 16);
            outData[j++] = (byte) (data >> 24);
        }
        return outData;
    }

}
