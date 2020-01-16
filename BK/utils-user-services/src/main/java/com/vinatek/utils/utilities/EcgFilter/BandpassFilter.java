/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities.EcgFilter;

public class BandpassFilter {
    public static float[] BCoeffInSmoothing = new float[] { 0.0144f, 0f,
        -0.0287f, 0f, 0.0144f };
    public static float[] ACoeffInSmoothing = new float[] { 1f, -3.6333f,
        4.9575f, -3.0152f, 0.6909f };

    /**
     * Bandpass smoothing filter 0.05-40Hz, Butterworth 2nd order. A &
     * BCoeffInSmoothing are calculated using MATLAB. Pre input and output are
     * required for continuous realtime filtering.
     * 
     * @param inputECGData
     *            Input signal, size of SAMPLE_READ_FOR_DRAWING (90 samples
     *            usually)
     * @param preinputECGData
     *            Pre-x (input), 4 elements
     * @param preoutputECGData
     *            Pre-y (output), also 4 elements
     */
    public static float[] bandpassSmoothing(float[] inputECGData,
            float[] preinputECGData, float[] preoutputECGData)
    {
        float[] outputECGData = new float[inputECGData.length];
        int indexOfPreinputECGData = preinputECGData.length - 1;
        int indexOfPreoutputECGData = preoutputECGData.length - 1;
        outputECGData[0] = (BCoeffInSmoothing[0] * inputECGData[0]
                + BCoeffInSmoothing[1]
                * preinputECGData[indexOfPreinputECGData]
                + BCoeffInSmoothing[2]
                * preinputECGData[indexOfPreinputECGData - 1]
                + BCoeffInSmoothing[3]
                * preinputECGData[indexOfPreinputECGData - 2]
                + BCoeffInSmoothing[4]
                * preinputECGData[indexOfPreinputECGData - 3]
                - ACoeffInSmoothing[1]
                * preoutputECGData[indexOfPreoutputECGData]
                - ACoeffInSmoothing[2]
                * preoutputECGData[indexOfPreoutputECGData - 1]
                - ACoeffInSmoothing[3]
                * preoutputECGData[indexOfPreoutputECGData - 2] - ACoeffInSmoothing[4]
                * preoutputECGData[indexOfPreoutputECGData - 3])
                / ACoeffInSmoothing[0];
        outputECGData[1] = (BCoeffInSmoothing[0] * inputECGData[1]
                + BCoeffInSmoothing[1] * inputECGData[0] + BCoeffInSmoothing[2]
                * preinputECGData[indexOfPreinputECGData]
                + BCoeffInSmoothing[3]
                * preinputECGData[indexOfPreinputECGData - 1]
                + BCoeffInSmoothing[4]
                * preinputECGData[indexOfPreinputECGData - 2]
                - ACoeffInSmoothing[1] * outputECGData[0]
                - ACoeffInSmoothing[2]
                * preoutputECGData[indexOfPreoutputECGData]
                - ACoeffInSmoothing[3]
                * preoutputECGData[indexOfPreoutputECGData - 1] - ACoeffInSmoothing[4]
                * preoutputECGData[indexOfPreoutputECGData - 2])
                / ACoeffInSmoothing[0];
        outputECGData[2] = (BCoeffInSmoothing[0] * inputECGData[2]
                + BCoeffInSmoothing[1] * inputECGData[1] + BCoeffInSmoothing[2]
                * inputECGData[0] + BCoeffInSmoothing[3]
                * preinputECGData[indexOfPreinputECGData]
                + BCoeffInSmoothing[4]
                * preinputECGData[indexOfPreinputECGData - 1]
                - ACoeffInSmoothing[1] * outputECGData[1]
                - ACoeffInSmoothing[2] * outputECGData[0]
                - ACoeffInSmoothing[3]
                * preoutputECGData[indexOfPreoutputECGData] - ACoeffInSmoothing[4]
                * preoutputECGData[indexOfPreoutputECGData - 1])
                / ACoeffInSmoothing[0];
        outputECGData[3] = (BCoeffInSmoothing[0] * inputECGData[3]
                + BCoeffInSmoothing[1] * inputECGData[2] + BCoeffInSmoothing[2]
                * inputECGData[1] + BCoeffInSmoothing[3] * inputECGData[0]
                + BCoeffInSmoothing[4]
                * preinputECGData[indexOfPreinputECGData]
                - ACoeffInSmoothing[1] * outputECGData[2]
                - ACoeffInSmoothing[2] * outputECGData[1]
                - ACoeffInSmoothing[3] * outputECGData[0] - ACoeffInSmoothing[4]
                * preoutputECGData[indexOfPreoutputECGData])
                / ACoeffInSmoothing[0];
        for (int n = 4; n < inputECGData.length; n++)
        {
            outputECGData[n] = (BCoeffInSmoothing[0] * inputECGData[n]
                    + BCoeffInSmoothing[1] * inputECGData[n - 1]
                    + BCoeffInSmoothing[2] * inputECGData[n - 2]
                    + BCoeffInSmoothing[3] * inputECGData[n - 3]
                    + BCoeffInSmoothing[4] * inputECGData[n - 4]
                    - ACoeffInSmoothing[1] * outputECGData[n - 1]
                    - ACoeffInSmoothing[2] * outputECGData[n - 2]
                    - ACoeffInSmoothing[3] * outputECGData[n - 3] - ACoeffInSmoothing[4]
                    * outputECGData[n - 4])
                    / ACoeffInSmoothing[0];
        }
        for (int n = 0; n < outputECGData.length; n++)
        {
            outputECGData[n] += 105;
        }
        return outputECGData;
    }

    /*	public static final float[] BCoeffInFIRSmoothing = new float[] { 0.0001f,
                0.0002f, 0.0004f, 0.0006f, 0.0008f, 0.0010f, 0.0012f, 0.0014f,
                0.0015f, 0.0015f, 0.0014f, 0.0012f, 0.0007f, 0.0000f, -0.0009f,
                -0.0020f, -0.0032f, -0.0046f, -0.0060f, -0.0073f, -0.0084f,
                -0.0091f, -0.0094f, -0.0090f, -0.0079f, -0.0059f, -0.0030f,
                0.0008f, 0.0056f, 0.0112f, 0.0175f, 0.0245f, 0.0317f, 0.0392f,
                0.0465f, 0.0534f, 0.0596f, 0.0649f, 0.0691f, 0.0720f, 0.0735f,
                0.0735f, 0.0720f, 0.0691f, 0.0649f, 0.0596f, 0.0534f, 0.0465f,
                0.0392f, 0.0317f, 0.0245f, 0.0175f, 0.0112f, 0.0056f, 0.0008f,
                -0.0030f, -0.0059f, -0.0079f, -0.0090f, -0.0094f, -0.0091f,
                -0.0084f, -0.0073f, -0.0060f, -0.0046f, -0.0032f, -0.0020f,
                -0.0009f, 0.0000f, 0.0007f, 0.0012f, 0.0014f, 0.0015f, 0.0015f,
                0.0014f, 0.0012f, 0.0010f, 0.0008f, 0.0006f, 0.0004f, 0.0002f,
                0.0001f };*/
    public static float[] BCoeffInFIRSmoothing = new float[] { -0.0006f,
        -0.0005f, -0.0004f, -0.0003f, -0.0001f, 0.0001f, 0.0004f, 0.0008f,
        0.0013f, 0.0017f, 0.0022f, 0.0025f, 0.0027f, 0.0027f, 0.0023f,
        0.0017f, 0.0006f, -0.0008f, -0.0025f, -0.0045f, -0.0066f, -0.0086f,
        -0.0103f, -0.0116f, -0.0121f, -0.0116f, -0.0100f, -0.0070f,
        -0.0027f, 0.0029f, 0.0098f, 0.0179f, 0.0268f, 0.0362f, 0.0457f,
        0.0550f, 0.0635f, 0.0709f, 0.0768f, 0.0809f, 0.0830f, 0.0830f,
        0.0809f, 0.0768f, 0.0709f, 0.0635f, 0.0550f, 0.0457f, 0.0362f,
        0.0268f, 0.0179f, 0.0098f, 0.0029f, -0.0027f, -0.0070f, -0.0100f,
        -0.0116f, -0.0121f, -0.0116f, -0.0103f, -0.0086f, -0.0066f,
        -0.0045f, -0.0025f, -0.0008f, 0.0006f, 0.0017f, 0.0023f, 0.0027f,
        0.0027f, 0.0025f, 0.0022f, 0.0017f, 0.0013f, 0.0008f, 0.0004f,
        0.0001f, -0.0001f, -0.0003f, -0.0004f, -0.0005f, -0.0006f };
    public static int NUMBER_OF_WEIGHTING_COEFF_IN_FILTER = BCoeffInFIRSmoothing.length;

    /**
     * Realtime bandpass smoothing filter 0.05-35Hz or 0.05-40Hz, FIR 81st order. BCoeffInFIRSmoothing
     * are calculated using MATLAB. Pre input is required for continuous
     * realtime filtering. Group delay is (order-1)/2 , therefore the "order"
     * number should be odd.
     * 
     * @param inputECGData
     *            Input signal, size of SAMPLE_READ_FOR_DRAWING (90 samples
     *            usually)
     * @param preinputECGData
     *            Pre-x (input), order+1 elements
     * @return output ECG data, same size as input ECG data.
     */
    public static float[] bandpassFIRSmoothingFilter(float[] inputECGData,
            float[] preinputECGData)
    {
        float[] outputECGData = new float[inputECGData.length];
        //int ifCount = 0, elseCount = 0;
        for (int vvv = 0; vvv < outputECGData.length; vvv++)
        {
            outputECGData[vvv] = 0;
        }
        int numberToGetFromInput, numberToGetFromPreInput = 0;
        for (int i = 0; i < inputECGData.length; i++)
        {
            numberToGetFromInput = i + 1;
            numberToGetFromPreInput = NUMBER_OF_WEIGHTING_COEFF_IN_FILTER
                    - numberToGetFromInput;
            if (numberToGetFromPreInput > 0)
            {
                for (int ccc = 0; ccc < numberToGetFromInput; ccc++)
                {
                    outputECGData[i] += BCoeffInFIRSmoothing[ccc]
                            * inputECGData[i - ccc];
                }
                int preInputPosition = 0;
                for (int ccc = numberToGetFromInput; ccc < NUMBER_OF_WEIGHTING_COEFF_IN_FILTER; ccc++)
                {
                    outputECGData[i] += BCoeffInFIRSmoothing[ccc]
                            * preinputECGData[preinputECGData.length - 1
                                    - preInputPosition];
                    preInputPosition++;
                }
                //ifCount++;
            }
            else
            {
                for (int ccc = 0; ccc < NUMBER_OF_WEIGHTING_COEFF_IN_FILTER; ccc++)
                {
                    outputECGData[i] += BCoeffInFIRSmoothing[ccc]
                            * inputECGData[i - ccc];
                    //elseCount++;
                }
            }
        }
        //Log.e("FIR Filter", "ifCount=" + ifCount);
        //Log.e("FIR Filter", "elseCount=" + elseCount);
        return outputECGData;
    }
}