package com.vinatek.utils.utilities.EcgFilter;

public class SGFilter {

    private int nl;

    private int nr;
    public SGFilter(int nl, int nr) throws Exception
    {
        if (nl < 0 || nr < 0)
            throw new Exception("Bad arguments");
        this.nl = nl;
        this.nr = nr;
    }
    public static double[][] ConvertIntArrayToDouble(int[][] data)
    {
        double[][] outS = new double[data.length][];
        for (int i = 0; i < data.length; i++)
        {
            for (int j = 0; j < data[i].length; j++)
            {
                outS[i][i] = data[i][j];
            }
        }
        return outS;
    }

    private static float[] ConvertDoubleArrayToFloat(double[] dataIn)
    {
        float[] dataOut = new float[dataIn.length];
        for (int i = 0; i < dataIn.length; i++)
            dataOut[i] = (float)dataIn[i];
        return dataOut;
    }

    private static double[] convertFloatArrayToDouble(float[] dataIn)
    {
        double[] dataOut = new double[dataIn.length];
        for (int i = 0; i < dataIn.length; i++)
            dataOut[i] = dataIn[i];
        return dataOut;
    }
    public float[] smooth(float[] data, float[] leftPad, float[] rightPad,
        double[] coeffs) throws Exception
    {
        return smooth(data, leftPad, rightPad, 0, new double[][] { coeffs });
    }
    public float[] smooth(float[] data, float[] leftPad, float[] rightPad,
        int bias, double[][] coeffs) throws Exception
    {
        double[] dataAsDouble = new double[data.length];
        double[] leftPadAsDouble = new double[leftPad.length];
        double[] rightPadAsDouble = new double[rightPad.length];
        dataAsDouble = convertFloatArrayToDouble(data);
        leftPadAsDouble = convertFloatArrayToDouble(leftPad);
        rightPadAsDouble = convertFloatArrayToDouble(rightPad);
        double[] results = smooth(dataAsDouble, leftPadAsDouble,
                rightPadAsDouble, bias, coeffs);
        float[] resultsAsFloat = new float[results.length];
        resultsAsFloat = ConvertDoubleArrayToFloat(results);
        return resultsAsFloat;
    }
    public double[] smooth(double[] data, double[] leftPad, double[] rightPad,
        int bias, double[][] coeffs) throws Exception
    {
        if (bias < 0 || bias > nr || bias > nl)
            throw new Exception("bias < 0 or bias > nr or bias > nl");

        int dataLength = data.length;
        if (dataLength == 0)
            return data;
        int n = dataLength + nl + nr;
        double[] dataCopy = new double[n];
        // copy left pad reversed
        int leftPadOffset = nl - leftPad.length;
        if (leftPadOffset >= 0)
            for (int i = 0; i < leftPad.length; i++)
            {
                dataCopy[leftPadOffset + i] = leftPad[i];
            }
        else
            for (int i = 0; i < nl; i++)
            {
                dataCopy[i] = leftPad[i - leftPadOffset];
            }
        // copy actual data
        for (int i = 0; i < dataLength; i++)
        {
            dataCopy[i + nl] = data[i];
        }
        // copy right pad
        int rightPadOffset = nr - rightPad.length;
        if (rightPadOffset >= 0)
            for (int i = 0; i < rightPad.length; i++)
            {
                dataCopy[i + dataLength + nl] = rightPad[i];
            }
        else
            for (int i = 0; i < nr; i++)
            {
                dataCopy[i + dataLength + nl] = rightPad[i];
            }
        // convolution (with savitzky-golay coefficients)
        double[] sdata = new double[dataLength];
        double[] sg;
        for (int b = bias; b > 0; b--)
        {
            sg = coeffs[coeffs.length - b];
            int x = (nl + bias) - b;
            float sum = 0;
            for (int i = -nl + b; i <= nr; i++)
            {
                sum += (float)(dataCopy[x + i] * sg[nl - b + i]);
            }
            sdata[x - nl] = sum;
        }
        sg = coeffs[0];
        for (int x = nl + bias; x < n - nr - bias; x++)
        {
            float sum = 0;
            for (int i = -nl; i <= nr; i++)
            {
                sum += (float)(dataCopy[x + i] * sg[nl + i]);
            }
            sdata[x - nl] = sum;
        }
        for (int b = 1; b <= bias; b++)
        {
            sg = coeffs[b];
            int x = (n - nr - bias) + (b - 1);
            float sum = 0;
            for (int i = -nl; i <= nr - b; i++)
            {
                sum += (float)(dataCopy[x + i] * sg[nl + i]);
            }
            sdata[x - nl] = sum;
        }
        return sdata;
    }
}