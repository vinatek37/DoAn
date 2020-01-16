package com.vinatek.utils.utilities.EcgFilter;

public class Frequency_Filter {

    private static float[] ReturnData(int[] rawSignal, float[] preinputECGData) {
        float[] temp = new float[rawSignal.length];
        for (int i = 0; i < temp.length; i++) {
            temp[i] = rawSignal[i] & 0xff;
        }
        return BandpassFilter.bandpassFIRSmoothingFilter(
                temp, preinputECGData);
    }

    public static float[] GetFrequencyFilterData(String ecgDataName, String apiURL, String token) {
        float[] preinputECGData = BaseProcessEcg.initialization();
        float[] tempData = BaseProcessEcg.GetBaseData(ecgDataName, apiURL, token);
        return BandpassFilter.bandpassFIRSmoothingFilter(
                tempData, preinputECGData);
    }
}
