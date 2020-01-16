/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities.EcgFilter;

public class PreBlankParameters {
    /**
     * filter delays plus pre blanking delay
     */
    public int PRE_INIT_BLANK_COUNT;

    public int FILTER_DELAY;
    public int DER_DELAY;

    public PreBlankParameters(QRSDetectorParamsSettings qrsDetectorParamsSettings, int preBlank)
    {
        PRE_INIT_BLANK_COUNT = preBlank;
        FILTER_DELAY = (int)(((double)qrsDetectorParamsSettings.DERIV_LENGTH / 2) + ((double)qrsDetectorParamsSettings.LOWPASSBFFER_LGTH / 2 - 1) + (((double)qrsDetectorParamsSettings.HPBUFFER_LGTH - 1) / 2) + PRE_INIT_BLANK_COUNT);
        DER_DELAY = qrsDetectorParamsSettings.MOV_WINDOW_INTEGRATiON_WIDTH + FILTER_DELAY + qrsDetectorParamsSettings.MSEC100;
    }
}
