package com.vinatek.utils.utilities.EcgFilter;

import java.util.ArrayList;
import java.util.List;

public class RRIntervals {

    private List<Integer> heartBeat = new ArrayList<>();
    private int minBPM = 999, maxBPM = 0, sum = 0, size = 0;

    public int getMinBPM() {
        return minBPM;
    }

    public int getMaxBPM() {
        return maxBPM;
    }

    public int getAverageBPM() {
        if (size <= 0) {
            return 0;
        } else {
            return (int) (sum / size);
        }
    }

    public void putBPM(int bpm) {
        size++;
        sum+=bpm;
        heartBeat.add(bpm);
        setNewMaxBPM(bpm);
        setNewMinBPM(bpm);
    }

    public int getBPM(int i) {
        if (i < size) {
            return heartBeat.get(i);
        }
        
        return 0;
    }

    public int getNumberOfRRInterval() {
        return size;
    }

    private void setNewMaxBPM(int bpm) {
        if (bpm > maxBPM) {
            maxBPM = bpm;
        }
    }

    private void setNewMinBPM(int bpm) {
        if (bpm < minBPM) {
            minBPM = bpm;
        }
    }

}
