package com.vinatek.utils.utilities.EcgFilter;

public class ContinuousPadder
{

    private boolean paddingLeft = true;

    private boolean paddingRight = true;

    /**
     * Default constructor. Both left and right padding are turned on
     */
    public ContinuousPadder()
    {

    }

    /**
     * 
     * @param paddingLeft
     *            enables or disables left padding
     * @param paddingRight
     *            enables or disables right padding
     */
    public ContinuousPadder(boolean paddingLeft, boolean paddingRight)
    {
        this.paddingLeft = paddingLeft;
        this.paddingRight = paddingRight;
    }

    public void apply(double[] data)
    {
        int n = data.length;
        if (paddingLeft)
        {
            int l = 0;
            // seek first non-zero cell
            for (int i = 0; i < n; i++)
            {
                if (data[i] != 0)
                {
                    l = i;
                    break;
                }
            }
            double y0 = data[l];
            for (int i = 0; i < l; i++)
            {
                data[i] = y0;
            }
        }
        if (paddingRight)
        {
            int r = 0;
            // seek last non-zero cell
            for (int i = n - 1; i >= 0; i--)
            {
                if (data[i] != 0)
                {
                    r = i;
                    break;
                }
            }
            double ynr = data[r];
            for (int i = r + 1; i < n; i++)
            {
                data[i] = ynr;
            }
        }
    }

    /**
     * 
     * @return {@code paddingLeft}
     */
    public boolean isPaddingLeft()
    {
        return paddingLeft;
    }

    /**
     * 
     * @return {@code paddingRight}
     */
    public boolean isPaddingRight()
    {
        return paddingRight;
    }

    /**
     * 
     * @param paddingLeft
     *            enables or disables left padding
     */
    public void setPaddingLeft(boolean paddingLeft)
    {
        this.paddingLeft = paddingLeft;
    }

    /**
     * 
     * @param paddingRight
     *            enables or disables right padding
     */
    public void setPaddingRight(boolean paddingRight)
    {
        this.paddingRight = paddingRight;
    }

}