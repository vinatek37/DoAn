/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities.EcgFilter;

import com.vinatek.utils.utilities.ArrayHelper;

public class Qrs_Detector {

    private static int EcgView_F = 960;
    private static final int MAX_HEART_RATE_ABLE_TO_DETECT = 225;//195, 299

    private static int calculateBMPFromCount(int count) {
        float calculatedBMP = 0f;
        calculatedBMP = 60f / ((float) count / (EcgView_F));
        if (calculatedBMP < 0) {
            calculatedBMP = 0;
        }
        return (int) calculatedBMP;
    }

    public static QrsDetectorModel DetectQRS(String url, String apiURL, String token) {
        int[] rawSignal = BaseProcessEcg.SetData(url, apiURL, token);
        return DetectQRSFromData(rawSignal);
    }

    public static QrsDetectorModel DetectQRSView(String url, String apiURL, String token) {
        QrsDetectorModel model = DetectQRS(url, apiURL, token);
        float[] temp = model.data;
        float[] result = new float[temp.length - (6 * 960)];
        ArrayHelper.Copy(temp, 5 * 960, result, 0, result.length);
        model.data = result;
        return model;
    }

    public static QrsDetectorModel DetectQRSFromData(int[] rawSignal) {
        RRIntervals mRRI = new RRIntervals();
        float[] preinputECGData = BaseProcessEcg.initialization();
        float[] temp = new float[rawSignal.length];
        for (int i = 0; i < temp.length; i++) {
            temp[i] = rawSignal[i] & 0xff;
        }

        float[] freFilter = BandpassFilter.bandpassFIRSmoothingFilter(
                temp, preinputECGData);

        int[] heartBeatIndicatorPositionInArray = new int[rawSignal.length];
        int[] heartRateBetween2RPeakPositionInArray = new int[rawSignal.length];
        for (int i = 0; i < rawSignal.length; i++) {
            heartBeatIndicatorPositionInArray[i] = 0;
            heartRateBetween2RPeakPositionInArray[i] = 0;
        }
        QrsCalculate qrsDetector = InitDetectorFactory.createQRSDetector3(EcgView_F);
        int lastPeak = -1;
        for (int i = 0; i < rawSignal.length; i++) {
            int result = qrsDetector.QRSAdvancedDetector(rawSignal[i]);
            if (result != 0) {
                if (lastPeak == -1) {
                    lastPeak = i - result;
                    //TODO change real indicator algorithm here
                    if (heartBeatIndicatorPositionInArray.length > (lastPeak + 30))//23
                    {
                        heartBeatIndicatorPositionInArray[lastPeak + 30] = 1;//23
                    } else {
                        heartBeatIndicatorPositionInArray[heartBeatIndicatorPositionInArray.length - 2] = 1;
                    }
                } else {
                    int temps = i - result;
                    int bpm = calculateBMPFromCount(temps - lastPeak);
                    if (bpm < MAX_HEART_RATE_ABLE_TO_DETECT) {
                        //TODO change real indicator algorithm here
                        if (heartBeatIndicatorPositionInArray.length > (temps + 30))//23
                        {
                            heartBeatIndicatorPositionInArray[temps + 30] = 1;//23
                        } else {
                            heartBeatIndicatorPositionInArray[heartBeatIndicatorPositionInArray.length - 2] = 1;
                        }
                        mRRI.putBPM(bpm);
                        if (heartRateBetween2RPeakPositionInArray.length > (lastPeak
                                + (temps - lastPeak) / 2 + 17))//17
                        {
                            heartRateBetween2RPeakPositionInArray[lastPeak
                                    + (temps - lastPeak) / 2 + 17] = bpm;//17
                        } else {
                            heartRateBetween2RPeakPositionInArray[heartRateBetween2RPeakPositionInArray.length - 2] = bpm;
                        }
                        lastPeak = temps;
                    }
                }
            }
        }

        QrsDetectorModel model = new QrsDetectorModel();
        model.data = freFilter;
        model.position = heartBeatIndicatorPositionInArray;
        model.value = heartRateBetween2RPeakPositionInArray;
        model.minValue = mRRI.getMinBPM();
        model.maxValue = mRRI.getMaxBPM();
        model.avgValue = mRRI.getAverageBPM();

        return model;
    }
}
