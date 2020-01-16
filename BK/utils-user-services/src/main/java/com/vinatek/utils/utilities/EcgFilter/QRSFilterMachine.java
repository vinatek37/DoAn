package com.vinatek.utils.utilities.EcgFilter;

public class QRSFilterMachine {
    private QRSDetectorParamsSettings qrsDetectorParameters;

    private long lowpassfilt_y1 = 0;
    private long lowpassfilt_y2 = 0;
    private int[] lowpassfilter_data;
    private int lpfilt_ptr = 0;

    private long hpfilt_y = 0;
    private int[] highpassfilter_data;
    private int hpfilt_ptr = 0;

    private int[] derivative1_derBuff;
    private int deriv1_derI = 0;

    private int[] derivative2_derBuff;
    private int deriv2_derI = 0;

    private long mvwint_sum = 0;
    private int[] mvwint_data;
    private int mvwint_ptr = 0;

    public QRSFilterMachine(QRSDetectorParamsSettings qrsDetectorParameters)
    {
        this.qrsDetectorParameters = qrsDetectorParameters;
        lowpassfilter_data = new int[qrsDetectorParameters.LOWPASSBFFER_LGTH];
        highpassfilter_data = new int[qrsDetectorParameters.HPBUFFER_LGTH];
        derivative1_derBuff = new int[qrsDetectorParameters.DERIV_LENGTH];
        derivative2_derBuff = new int[qrsDetectorParameters.DERIV_LENGTH];
        mvwint_data = new int[qrsDetectorParameters.MOV_WINDOW_INTEGRATiON_WIDTH];
    }


    public int quantumQRSFilter(int datum)
    {
        int filteredDatum;
        filteredDatum = lowpassFilter(datum);  // Low pass filter data.

        filteredDatum = highpassFilter(filteredDatum); // High pass filter data.
        filteredDatum = derivativeFilter2(filteredDatum); // Take the derivative.
        filteredDatum = Math.abs(filteredDatum);    // Take the absolute value.
        filteredDatum = calculateNewAveragerOfMovingWindow(filteredDatum); // Average over an 80 ms window .
        return (filteredDatum);
    }


    private int lowpassFilter(int datum)
    {
        long y0;
        int filteredLowPassDatum;
        int halfPtr;

        halfPtr = lpfilt_ptr - (qrsDetectorParameters.LOWPASSBFFER_LGTH / 2); // Use halfPtr to index
        if (halfPtr < 0) // to x[n-6].
            halfPtr += qrsDetectorParameters.LOWPASSBFFER_LGTH;
        y0 = (lowpassfilt_y1 << 1) - lowpassfilt_y2 + datum - (lowpassfilter_data[halfPtr] << 1) + lowpassfilter_data[lpfilt_ptr];
        lowpassfilt_y2 = lowpassfilt_y1;
        lowpassfilt_y1 = y0;
        filteredLowPassDatum = (int)y0 / ((qrsDetectorParameters.LOWPASSBFFER_LGTH * qrsDetectorParameters.LOWPASSBFFER_LGTH) / 4);
        lowpassfilter_data[lpfilt_ptr] = datum; // Stick most recent sample into
        if (++lpfilt_ptr == qrsDetectorParameters.LOWPASSBFFER_LGTH) // the circular buffer and update
            lpfilt_ptr = 0; // the buffer pointer.
        return (filteredLowPassDatum);
    }

    private int highpassFilter(int datum)
    {
        int filteredDatum;
        int halfPtr;

        hpfilt_y += datum - highpassfilter_data[hpfilt_ptr];
        halfPtr = hpfilt_ptr - (qrsDetectorParameters.HPBUFFER_LGTH / 2);
        if (halfPtr < 0)
            halfPtr += qrsDetectorParameters.HPBUFFER_LGTH;
        filteredDatum = (int)(highpassfilter_data[halfPtr] - (hpfilt_y / qrsDetectorParameters.HPBUFFER_LGTH));
        highpassfilter_data[hpfilt_ptr] = datum;
        if (++hpfilt_ptr == qrsDetectorParameters.HPBUFFER_LGTH)
            hpfilt_ptr = 0;
        return (filteredDatum);
    }

    public int derivativeFilter1(int x)
    {
        int y;
        y = x - derivative1_derBuff[deriv1_derI];
        derivative1_derBuff[deriv1_derI] = x;
        if (++deriv1_derI == qrsDetectorParameters.DERIV_LENGTH)
            deriv1_derI = 0;
        return (y);
    }


    private int derivativeFilter2(int x)
    {
        int y;
        y = x - derivative2_derBuff[deriv2_derI];
        derivative2_derBuff[deriv2_derI] = x;
        if (++deriv2_derI == qrsDetectorParameters.DERIV_LENGTH)
            deriv2_derI = 0;
        return (y);
    }


    private int calculateNewAveragerOfMovingWindow(int datum)
    {
        int calculatedNewIntegrator;
        mvwint_sum += datum;
        mvwint_sum -= mvwint_data[mvwint_ptr];
        mvwint_data[mvwint_ptr] = datum;
        if (++mvwint_ptr == qrsDetectorParameters.MOV_WINDOW_INTEGRATiON_WIDTH)
            mvwint_ptr = 0;
        if ((mvwint_sum / qrsDetectorParameters.MOV_WINDOW_INTEGRATiON_WIDTH) > 32000)
            calculatedNewIntegrator = 32000;
        else
            calculatedNewIntegrator = (int)(mvwint_sum / qrsDetectorParameters.MOV_WINDOW_INTEGRATiON_WIDTH);
        return (calculatedNewIntegrator);
    }
}
