/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities.EcgFilter;

import com.vinatek.utils.utilities.ArrayHelper;
import com.vinatek.utils.utilities.DataEcgFile;

public class BaseProcessEcg {

    public static float[] initialization() {
        float[] preinputECGData = new float[BandpassFilter.NUMBER_OF_WEIGHTING_COEFF_IN_FILTER - 1];//82
        for (int rrr = 0; rrr < preinputECGData.length; rrr++) {
            preinputECGData[rrr] = 128;
        }
        return preinputECGData;
    }

    public static int[] SetData(String url, String apiURL, String token) {
        byte[] data = DataEcgFile.ReadFile(url, apiURL, token);
        int[] rawSignal = ArrayHelper.ByteArrayToIntArray(data);
        return rawSignal;
    }

    public static float[] GetBaseData(String ecgDataName, String apiURL, String token) {
        byte[] data = DataEcgFile.ReadFile(ecgDataName, apiURL, token);
        int[] rawSignal = ArrayHelper.ByteArrayToIntArray(data);
        float[] temp = new float[rawSignal.length];
        for (int i = 0; i < temp.length; i++) {
            temp[i] = rawSignal[i] & 0xff;
        }
        return temp;
    }

    public static float[] GetBaseDataView(String url, String apiURL, String token) {
        byte[] data = DataEcgFile.ReadFile(url, apiURL, token);
        int[] rawSignal = ArrayHelper.ByteArrayToIntArray(data);
        float[] temp = new float[rawSignal.length];
        for (int i = 0; i < temp.length; i++) {
            temp[i] = rawSignal[i] & 0xff;
        }

        float[] result = new float[temp.length - (6 * 960)];
        ArrayHelper.Copy(temp, 5 * 960, result, 0, result.length);
        return result;
    }
}
