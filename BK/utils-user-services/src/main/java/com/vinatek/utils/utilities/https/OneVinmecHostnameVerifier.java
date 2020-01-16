/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities.https;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSession;

/**
 *
 * @author Dzungvd <dung.vuongdinh.vn@gmail.com>
 */
public class OneVinmecHostnameVerifier implements HostnameVerifier {

    public boolean verify(String string, SSLSession sslSession) {
        return true;
    }
}