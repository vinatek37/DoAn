/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities.EcgFilter;

public class InitDetectorFactory {
    public static QrsCalculate createQRSDetector3(int sampleRate)
    {
        QRSDetectorParamsSettings qrsDetectorParameters = new QRSDetectorParamsSettings(
                sampleRate);

        QrsCalculate qrsDetector3 = new QrsCalculate(qrsDetectorParameters);
        QRSFilterMachine qrsFilterer = new QRSFilterMachine(qrsDetectorParameters);

        qrsDetector3.setObjects(qrsFilterer);
        return qrsDetector3;
    }
}