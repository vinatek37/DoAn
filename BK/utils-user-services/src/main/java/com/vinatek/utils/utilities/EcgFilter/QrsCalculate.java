/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities.EcgFilter;

import com.vinatek.utils.utilities.ArrayHelper;


public class QrsCalculate {
    private QRSDetectorParamsSettings qrsDetParas;
    private PreBlankParameters preBlankParas;
    private QRSFilterMachine qrsFilterMachine;

    private static final int NUMBER_OF_BUFFER_FOR_QRS_PEAK = 5;
    private int detectionThreshold;
    private int peakCountForQRS = 0;
    private int[] bufferQRS = new int[NUMBER_OF_BUFFER_FOR_QRS_PEAK];
    private int[] noise = new int[NUMBER_OF_BUFFER_FOR_QRS_PEAK];
    private int[] rrbuf = new int[NUMBER_OF_BUFFER_FOR_QRS_PEAK];
    private int[] rsetBuff = new int[NUMBER_OF_BUFFER_FOR_QRS_PEAK];
    private int rsetCount = 0;
    private int nmean;
    private int qmean;
    private int distanceMeanRR;
    private int counter = 0;
    private int sbpeak = 0;
    private int sbloc;
    private int searchBackCount;
    private int maxder = 0;
    private int initBlankCounter = 0;
    private int initMax = 0;
    private int preCountForBlankData = 0;
    private int temporaryDetectedPeak;

    private int[] DDBuffer;
    private int DDPtr = 0;
    private double TH = 0.3125;
    private int COPY_ARRAY_LENGTH = NUMBER_OF_BUFFER_FOR_QRS_PEAK - 1;//7;3;1

    private int MIN_PEAK_AMP = 25;//7;28;-------5

    private static final int WEIGHTING_FACTOR_FOR_QRS_DETECTION = 18;//2;9;12//%%%% 29 %%%% seems to be more corrected------3
                                                                        //set the weighting factor here as the device does not provide correct amplitude
                                                                        //private static final boolean IS_APPLY_WEIGHTING_FACTOR = true;

    private int Peak_max = 0;
    private int Peak_timeSinceMax = 0;
    private int Peak_lastDatum;


    public QrsCalculate(QRSDetectorParamsSettings qrsDetectorParamsSettings)
    {
        qrsDetParas = qrsDetectorParamsSettings;
        preBlankParas = new PreBlankParameters(qrsDetectorParamsSettings, qrsDetectorParamsSettings.MSEC195);
        searchBackCount = qrsDetectorParamsSettings.MSEC1500;
        DDBuffer = new int[preBlankParas.DER_DELAY];
        for (int i = 0; i < NUMBER_OF_BUFFER_FOR_QRS_PEAK; ++i)
        {
            rrbuf[i] = qrsDetectorParamsSettings.MSEC1000;/* Initialize R-to-R interval buffer. */
        }
    }


    public void setObjects(QRSFilterMachine qrsFilterMachine)
    {
        this.qrsFilterMachine = qrsFilterMachine;
    }

    public int QRSAdvancedDetector(int datum)
    {
        //--------------*************----------------------
        //added here the correction
        //if(IS_APPLY_WEIGHTING_FACTOR)
        datum *= WEIGHTING_FACTOR_FOR_QRS_DETECTION;
        //--------------*************----------------------
        int filteredDatum, QrsDelay = 0;
        int i, newFoundPeak, calculatedPeak;

        filteredDatum = qrsFilterMachine.quantumQRSFilter(datum);   /* Filter data. */

        /* Wait until normal detector is ready before calling early detections. */

        calculatedPeak = calculateNewPeakHeight(filteredDatum);//calculatedPeak = calculateNewPeakHeight(filteredDatum);
        if (calculatedPeak < MIN_PEAK_AMP)
            calculatedPeak = 0;

        // Hold any peak that is detected for 200 ms
        // in case a bigger one comes along.  There
        // can only be one QRS complex in any 200 ms window. (200ms ~ 299 PBM)

        newFoundPeak = 0;
        if (calculatedPeak != 0 && preCountForBlankData == 0)        // If there has been no peak for 200 ms
        {                                        // save this one and start counting.
            temporaryDetectedPeak = calculatedPeak;
            preCountForBlankData = preBlankParas.PRE_INIT_BLANK_COUNT;            // MSEC200
        }
        else if (calculatedPeak == 0 && preCountForBlankData != 0)    // If we have held onto a peak for
        {                                        // 200 ms pass it on for evaluation.
            if (--preCountForBlankData == 0)
                newFoundPeak = temporaryDetectedPeak;
        }
        else if (calculatedPeak != 0)                            // If we were holding a peak, but
        {                                        // this ones bigger, save it and
            if (calculatedPeak > temporaryDetectedPeak)                // start counting to 200 ms again.
            {
                temporaryDetectedPeak = calculatedPeak;
                preCountForBlankData = preBlankParas.PRE_INIT_BLANK_COUNT; // MSEC200
            }
            else if (--preCountForBlankData == 0)
                newFoundPeak = temporaryDetectedPeak;
        }

        /* Save derivative of raw signal for T-wave and baseline
           shift discrimination. */

        DDBuffer[DDPtr] = qrsFilterMachine.derivativeFilter1(datum);
        if (++DDPtr == preBlankParas.DER_DELAY)
            DDPtr = 0;

        /* Initialize the qrs peak buffer with the first eight (one) 	*/
        /* local maximum peaks detected.						*/

        if (peakCountForQRS < NUMBER_OF_BUFFER_FOR_QRS_PEAK)//1;8
        {
            ++counter;
            if (newFoundPeak > 0) counter = qrsDetParas.MOV_WINDOW_INTEGRATiON_WIDTH;
            if (++initBlankCounter == qrsDetParas.MSEC1000)
            {
                initBlankCounter = 0;
                bufferQRS[peakCountForQRS] = initMax;
                initMax = 0;
                ++peakCountForQRS;
                if (peakCountForQRS == NUMBER_OF_BUFFER_FOR_QRS_PEAK)//1;8
                {
                    qmean = calculateMean(bufferQRS, NUMBER_OF_BUFFER_FOR_QRS_PEAK);
                    nmean = 0;
                    distanceMeanRR = qrsDetParas.MSEC1000;
                    searchBackCount = qrsDetParas.MSEC1500 + qrsDetParas.MSEC150;
                    detectionThreshold = calculateNewThreshold(qmean, nmean);
                }
            }
            if (newFoundPeak > initMax)
                initMax = newFoundPeak;
        }
        else    /* Else test for a qrs. */
        {
            ++counter;
            if (newFoundPeak > 0)
            {
                /* Check for maximum derivative and matching minima and maxima
                   for T-wave and baseline shift rejection.  Only consider this
                   peak if it doesn't seem to be a base line shift. */
                int[] maxderArray = new int[] { maxder };
                boolean result = BaselineShiftDetection(DDBuffer, DDPtr, maxderArray);
                maxder = maxderArray[0];
                if (!result)
                {

                    // Classify the beat as a QRS complex
                    // if the peak is larger than the detection threshold.

                    if (newFoundPeak > detectionThreshold)
                    {
                        ArrayHelper.Copy(bufferQRS, 0, bufferQRS, 1, COPY_ARRAY_LENGTH);
                        bufferQRS[0] = newFoundPeak;
                        qmean = calculateMean(bufferQRS, NUMBER_OF_BUFFER_FOR_QRS_PEAK);
                        detectionThreshold = calculateNewThreshold(qmean, nmean);
                        ArrayHelper.Copy(rrbuf, 0, rrbuf, 1, COPY_ARRAY_LENGTH);
                        rrbuf[0] = counter - qrsDetParas.MOV_WINDOW_INTEGRATiON_WIDTH;
                        distanceMeanRR = calculateMean(rrbuf, NUMBER_OF_BUFFER_FOR_QRS_PEAK);
                        searchBackCount = distanceMeanRR + (distanceMeanRR >> 1) + qrsDetParas.MOV_WINDOW_INTEGRATiON_WIDTH;
                        counter = qrsDetParas.MOV_WINDOW_INTEGRATiON_WIDTH;

                        sbpeak = 0;
                        maxder = 0;
                        QrsDelay = qrsDetParas.MOV_WINDOW_INTEGRATiON_WIDTH + preBlankParas.FILTER_DELAY;
                        initBlankCounter = initMax = rsetCount = 0;
                    }

                    // If a peak isn't a QRS update noise buffer and estimate.
                    // Store the peak for possible search back.

                    else
                    {
                        ArrayHelper.Copy(noise, 0, noise, 1, COPY_ARRAY_LENGTH);
                        noise[0] = newFoundPeak;
                        nmean = calculateMean(noise, NUMBER_OF_BUFFER_FOR_QRS_PEAK);
                        detectionThreshold = calculateNewThreshold(qmean, nmean);

                        // Don't include early peaks (which might be T-waves)
                        // in the search back process.  A T-wave can mask
                        // a small following QRS.

                        if ((newFoundPeak > sbpeak) && ((counter - qrsDetParas.MOV_WINDOW_INTEGRATiON_WIDTH) >= qrsDetParas.MSEC360))
                        {
                            sbpeak = newFoundPeak;
                            sbloc = counter - qrsDetParas.MOV_WINDOW_INTEGRATiON_WIDTH;
                        }
                    }
                }
            }

            /* Test for search back condition.  If a QRS is found in  */
            /* search back update the QRS buffer and detectionThreshold.      */

            if ((counter > searchBackCount) && (sbpeak > (detectionThreshold >> 1)))
            {
                ArrayHelper.Copy(bufferQRS, 0, bufferQRS, 1, COPY_ARRAY_LENGTH);
                bufferQRS[0] = sbpeak;
                qmean = calculateMean(bufferQRS, NUMBER_OF_BUFFER_FOR_QRS_PEAK);
                detectionThreshold = calculateNewThreshold(qmean, nmean);
                ArrayHelper.Copy(rrbuf, 0, rrbuf, 1, COPY_ARRAY_LENGTH);
                rrbuf[0] = sbloc;
                distanceMeanRR = calculateMean(rrbuf, NUMBER_OF_BUFFER_FOR_QRS_PEAK);
                //search back for missed QRS peaks
                searchBackCount = distanceMeanRR + (distanceMeanRR >> 1) + qrsDetParas.MOV_WINDOW_INTEGRATiON_WIDTH;
                QrsDelay = counter = counter - sbloc;
                QrsDelay += preBlankParas.FILTER_DELAY;
                sbpeak = 0;
                maxder = 0;
                initBlankCounter = initMax = rsetCount = 0;
            }
        }

        // In the background estimate threshold to replace adaptive threshold
        // if eight seconds elapses without a QRS detection.

        if (peakCountForQRS == NUMBER_OF_BUFFER_FOR_QRS_PEAK)
        {
            if (++initBlankCounter == qrsDetParas.MSEC1000)
            {
                initBlankCounter = 0;
                rsetBuff[rsetCount] = initMax;
                initMax = 0;
                ++rsetCount;

                // Reset threshold if it has been 8 seconds without
                // a detection.

                if (rsetCount == NUMBER_OF_BUFFER_FOR_QRS_PEAK)
                {
                    for (i = 0; i < NUMBER_OF_BUFFER_FOR_QRS_PEAK; ++i)
                    {
                        bufferQRS[i] = rsetBuff[i];
                        noise[i] = 0;
                    }
                    qmean = calculateMean(rsetBuff, NUMBER_OF_BUFFER_FOR_QRS_PEAK);
                    nmean = 0;
                    distanceMeanRR = qrsDetParas.MSEC1000;
                    searchBackCount = qrsDetParas.MSEC1500 + qrsDetParas.MSEC150;
                    detectionThreshold = calculateNewThreshold(qmean, nmean);
                    initBlankCounter = initMax = rsetCount = 0;
                }
            }
            if (newFoundPeak > initMax)
                initMax = newFoundPeak;
        }

        return (QrsDelay);
    }

    private int calculateNewPeakHeight(int datum)
    {
        int pk = 0;

        if (Peak_timeSinceMax > 0)
            ++Peak_timeSinceMax;

        if ((datum > Peak_lastDatum) && (datum > Peak_max))
        {
            Peak_max = datum;
            if (Peak_max > 2)
                Peak_timeSinceMax = 1;
        }
        else if (datum < (Peak_max >> 1))
        {
            pk = Peak_max;
            Peak_max = 0;
            Peak_timeSinceMax = 0;
        }
        else if (Peak_timeSinceMax > qrsDetParas.MSEC95)
        {
            pk = Peak_max;
            Peak_max = 0;
            Peak_timeSinceMax = 0;
        }
        Peak_lastDatum = datum;
        return (pk);
    }


    private int calculateMean(int[] array, int datum)
    {
        long sum;
        int i;

        for (i = 0, sum = 0; i < datum; ++i)
            sum += array[i];
        sum /= datum;
        return (int)(sum);
    }


    private int calculateNewThreshold(int qrsMean, int noiseMean)
    {
        int newThreshold, detectionMedian;
        double temp;
        detectionMedian = qrsMean - noiseMean;
        temp = detectionMedian;
        temp *= TH;
        detectionMedian = (int)temp;
        newThreshold = noiseMean + detectionMedian; /* detectionMedian * THRESHOLD */
        return (newThreshold);
    }

    private boolean BaselineShiftDetection(int[] dBuf, int dbPtr, int[] maxder)
    {
        int max, min, maxt = 0, mint = 0, t, x;
        max = min = 0;

        for (t = 0; t < qrsDetParas.MSEC220; ++t)
        {
            x = dBuf[dbPtr];
            if (x > max)
            {
                maxt = t;
                max = x;
            }
            else if (x < min)
            {
                mint = t;
                min = x;
            }
            if (++dbPtr == preBlankParas.DER_DELAY)
                dbPtr = 0;
        }

        maxder[0] = max;
        min = -min;

        /* Possible beat if a maximum and minimum pair are found
            where the interval between them is less than 150 ms. */

        if ((max > (min >> 3)) && (min > (max >> 3)) &&
                (Math.abs(maxt - mint) < qrsDetParas.MSEC150))
            return (false);

        else
            return (true);
    }
}