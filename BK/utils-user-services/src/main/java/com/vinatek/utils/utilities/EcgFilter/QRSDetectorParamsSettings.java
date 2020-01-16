package com.vinatek.utils.utilities.EcgFilter;

public class QRSDetectorParamsSettings {

    /**
     * Sample rate in Hz.
     */
    public int SAMPLING_RATE;
    public double MS_PER_SAMPLE;
    public int MSEC10,
            MSEC25,
            MSEC30,
            MSEC80,
            MSEC95,
            MSEC100,
            MSEC125,
            MSEC150,
            MSEC160,
            MSEC175,
            MSEC195,
            MSEC200,
            MSEC220,
            MSEC250,
            MSEC300,
            MSEC360,
            MSEC450,
            MSEC1000,
            MSEC1500,
                    MSEC1650;
    public int DERIV_LENGTH;
    public int LOWPASSBFFER_LGTH;
    public int HPBUFFER_LGTH;
    /**
     * Moving window integration width.
     */
    public final int MOV_WINDOW_INTEGRATiON_WIDTH;


    public QRSDetectorParamsSettings(int samplingRate)
    {
        SAMPLING_RATE = samplingRate;
        MS_PER_SAMPLE = ((double)1000 / (double)SAMPLING_RATE);
        MSEC10 = ((int)(10 / MS_PER_SAMPLE + 0.5));
        MSEC25 = ((int)(25 / MS_PER_SAMPLE + 0.5));
        MSEC30 = ((int)(30 / MS_PER_SAMPLE + 0.5));
        MSEC80 = ((int)(80 / MS_PER_SAMPLE + 0.5));
        MSEC95 = ((int)(95 / MS_PER_SAMPLE + 0.5));
        MSEC100 = ((int)(100 / MS_PER_SAMPLE + 0.5));
        MSEC125 = ((int)(125 / MS_PER_SAMPLE + 0.5));
        MSEC150 = ((int)(150 / MS_PER_SAMPLE + 0.5));
        MSEC160 = ((int)(160 / MS_PER_SAMPLE + 0.5));
        MSEC175 = ((int)(175 / MS_PER_SAMPLE + 0.5));
        MSEC195 = ((int)(195 / MS_PER_SAMPLE + 0.5));
        MSEC200 = ((int)(200 / MS_PER_SAMPLE + 0.5));
        MSEC220 = ((int)(220 / MS_PER_SAMPLE + 0.5));
        MSEC250 = ((int)(250 / MS_PER_SAMPLE + 0.5));
        MSEC300 = ((int)(300 / MS_PER_SAMPLE + 0.5));
        MSEC360 = ((int)(360 / MS_PER_SAMPLE + 0.5));
        MSEC450 = ((int)(450 / MS_PER_SAMPLE + 0.5));
        MSEC1000 = SAMPLING_RATE;
        MSEC1500 = ((int)(1500 / MS_PER_SAMPLE));
        MSEC1650 = ((int)(1650 / MS_PER_SAMPLE));
        DERIV_LENGTH = MSEC10;
        LOWPASSBFFER_LGTH = ((int)(2 * MSEC25));
        HPBUFFER_LGTH = MSEC125;
        MOV_WINDOW_INTEGRATiON_WIDTH = MSEC80;
    }
}

