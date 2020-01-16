package com.vinatek.utils.utilities.EcgFilter;

public class Advanced_Filter {
    private static final int SMOOTH_PEAK_PADDING = 50, MVING_AVRG_SPAN = 8;
    
    private static int CheckPeakIndex(int peakIndex, float[] enhancedFilteredSignal)
    {
        int searchSpan = 56;
        float max = enhancedFilteredSignal[peakIndex];
        int localPeak = peakIndex;
        if (peakIndex - searchSpan >= 0)
        {
            for (int i = peakIndex - searchSpan / 2; i < enhancedFilteredSignal.length
                    && i < peakIndex + searchSpan / 2; i++)
            {
                if (enhancedFilteredSignal[i] > max)
                {
                    max = enhancedFilteredSignal[i];
                    localPeak = i;
                }
            }
        }
        else
        {
            for (int i = 0; i < enhancedFilteredSignal.length
                    && i < peakIndex + searchSpan / 2; i++)
            {
                if (enhancedFilteredSignal[i] > max)
                {
                    max = enhancedFilteredSignal[i];
                    localPeak = i;
                }
            }
        }
        return localPeak;
    }
    private static int findLowestLeftPointIndex(int realPeakIndex, float[] enhancedFilteredSignal)
    {
        float min = enhancedFilteredSignal[realPeakIndex];
        boolean stopFlag = false;
        int leftLowPeak = realPeakIndex;
        for (int i = realPeakIndex - 1; (i >= 0) && (stopFlag == false); i--)
        {
            if (min > enhancedFilteredSignal[i])
            {
                min = enhancedFilteredSignal[i];
                leftLowPeak = i;
            }
            else
            {
                stopFlag = true;
            }
        }
        return leftLowPeak;
    }
    private static int findLowestRightPointIndex(int realPeakIndex, float[] enhancedFilteredSignal)
    {
        float min = enhancedFilteredSignal[realPeakIndex];
        boolean stopFlag = false;
        int rightLowPeak = realPeakIndex;
        for (int i = realPeakIndex + 1; (i < enhancedFilteredSignal.length) && (stopFlag == false); i++)
        {
            if (min > enhancedFilteredSignal[i])
            {
                min = enhancedFilteredSignal[i];
                rightLowPeak = i;
            }
            else
            {
                stopFlag = true;
            }
        }
        return rightLowPeak;
    }
    public static float[] ImprovingPeak(int peakFound, float[] smoothedScaledSignal, float[] enhancedFilteredSignal, float[] enhancedFilteredSignalForPeaks)
    {
        //var dataOut = enhancedFilteredSignal;
        //Array.Copy(enhancedFilteredSignal, 0, dataOut, 0, enhancedFilteredSignal.Length);
        int enhancedSignalPeakIndex = CheckPeakIndex(peakFound - 20, enhancedFilteredSignal);
        int left = findLowestLeftPointIndex(enhancedSignalPeakIndex, enhancedFilteredSignal) - 77;
        if (left < 0)
            left = 0;
        int right = findLowestRightPointIndex(enhancedSignalPeakIndex, enhancedFilteredSignal) + 77;
        if (right >= enhancedFilteredSignal.length)
            right = enhancedFilteredSignal.length - 1;
        for (int i = left; i < right; i++)
        {
            enhancedFilteredSignal[i] = smoothedScaledSignal[i];
        }
        //------------------
        int iiii = left - SMOOTH_PEAK_PADDING;
        if (iiii < 0)
            return null ;
        for (; iiii < (enhancedFilteredSignal.length) && (iiii <= left + SMOOTH_PEAK_PADDING); iiii++)
        {
            enhancedFilteredSignal[iiii] = enhancedFilteredSignalForPeaks[iiii];
        }
        //------------------
        int kkkk = right - SMOOTH_PEAK_PADDING;
        if (kkkk < 0)
            return null;
        for (; (kkkk < enhancedFilteredSignal.length) && (kkkk <= right + SMOOTH_PEAK_PADDING); kkkk++)
        {
            enhancedFilteredSignal[kkkk] = enhancedFilteredSignalForPeaks[kkkk];
        }
        //------------------

        //------------------
        if (left - SMOOTH_PEAK_PADDING - 2 * MVING_AVRG_SPAN < 0 || left - SMOOTH_PEAK_PADDING + 2 * MVING_AVRG_SPAN > enhancedFilteredSignal.length)
            return null;
        for (int mmm = left - SMOOTH_PEAK_PADDING - MVING_AVRG_SPAN; mmm < left - SMOOTH_PEAK_PADDING + MVING_AVRG_SPAN; mmm++)
        {
            float average = 0;
            for (int i = mmm - MVING_AVRG_SPAN; i <= mmm + MVING_AVRG_SPAN; i++)
            {
                average += enhancedFilteredSignal[i];
            }
            enhancedFilteredSignal[mmm] = average / (2 * MVING_AVRG_SPAN + 1);
        }
        //------------------
        if (left + SMOOTH_PEAK_PADDING - 2 * MVING_AVRG_SPAN < 0 || left + SMOOTH_PEAK_PADDING + 2 * MVING_AVRG_SPAN > enhancedFilteredSignal.length)
            return null;
        for (int mmm = left + SMOOTH_PEAK_PADDING - MVING_AVRG_SPAN; mmm < left + SMOOTH_PEAK_PADDING + MVING_AVRG_SPAN; mmm++)
        {
            float average = 0;
            for (int i = mmm - MVING_AVRG_SPAN; i <= mmm + MVING_AVRG_SPAN; i++)
            {
                average += enhancedFilteredSignal[i];
            }
            enhancedFilteredSignal[mmm] = average / (2 * MVING_AVRG_SPAN + 1);
        }
        //------------------
        if (right - SMOOTH_PEAK_PADDING - 2 * MVING_AVRG_SPAN < 0 || right - SMOOTH_PEAK_PADDING + 2 * MVING_AVRG_SPAN > enhancedFilteredSignal.length)
            return null;
        for (int mmm = right - SMOOTH_PEAK_PADDING - MVING_AVRG_SPAN; mmm < right - SMOOTH_PEAK_PADDING + MVING_AVRG_SPAN; mmm++)
        {
            float average = 0;
            for (int i = mmm - MVING_AVRG_SPAN; i <= mmm + MVING_AVRG_SPAN; i++)
            {
                average += enhancedFilteredSignal[i];
            }
            enhancedFilteredSignal[mmm] = average / (2 * MVING_AVRG_SPAN + 1);
        }
        //------------------
        if (right + SMOOTH_PEAK_PADDING - 2 * MVING_AVRG_SPAN < 0 || right + SMOOTH_PEAK_PADDING + 2 * MVING_AVRG_SPAN > enhancedFilteredSignal.length)
            return null;
        for (int mmm = right + SMOOTH_PEAK_PADDING - MVING_AVRG_SPAN; mmm < right + SMOOTH_PEAK_PADDING + MVING_AVRG_SPAN; mmm++)
        {
            float average = 0;
            for (int i = mmm - MVING_AVRG_SPAN; i <= mmm + MVING_AVRG_SPAN; i++)
            {
                average += enhancedFilteredSignal[i];
            }
            enhancedFilteredSignal[mmm] = average / (2 * MVING_AVRG_SPAN + 1);
        }
        //------------------
        return enhancedFilteredSignal;
    }
}
