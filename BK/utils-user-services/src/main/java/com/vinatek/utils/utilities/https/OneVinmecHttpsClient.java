/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities.https;

import com.google.common.io.ByteStreams;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

/**
 *
 * @author Dzungvd <dung.vuongdinh.vn@gmail.com>
 */
public class OneVinmecHttpsClient {

    HttpsURLConnection con;
    SSLContext sslContext = null;

    public boolean connect(String url, String accesstoken) {
        TrustManager[] trustManager = new TrustManager[]{new OneVinmecTrustManager()};
        try {
            sslContext = SSLContext.getInstance("SSL");
            sslContext.init(null, trustManager, new java.security.SecureRandom());

            URL urlToconnect = new URL(url);
            con = (HttpsURLConnection) urlToconnect.openConnection();
            con.setSSLSocketFactory(sslContext.getSocketFactory());
            con.setHostnameVerifier(new OneVinmecHostnameVerifier());
            con.setConnectTimeout(10000);
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", accesstoken);

            con.connect();
        } catch (Exception e) {
            return false;
        }

        return true;
    }

    public int getResponseCode() {
        try {
            return con.getResponseCode();
        } catch (IOException ex) {
            return 404;
        }
    }

    public byte[] getResponseBody() {
        byte[] result = null;
        InputStream inputStream = null;

        try {
            inputStream = con.getInputStream();
            result = ByteStreams.toByteArray(inputStream);
        } catch (IOException ex) {
        } finally {
            try {
                inputStream.close();
            } catch (IOException ex) {
            }
        }

        return result;
    }

    public void disconnect() {
        con.disconnect();
    }

    public boolean connectPOST(String url, String accesstoken, String jsonBody) {
        TrustManager[] trustManager = new TrustManager[]{new OneVinmecTrustManager()};
        try {

            sslContext = SSLContext.getInstance("SSL");
            sslContext.init(null, trustManager, new java.security.SecureRandom());

            URL urlToconnect = new URL(url);
            con = (HttpsURLConnection) urlToconnect.openConnection();
            con.setSSLSocketFactory(sslContext.getSocketFactory());
            con.setHostnameVerifier(new OneVinmecHostnameVerifier());
            con.setConnectTimeout(5000);
            con.setRequestMethod("POST");
            con.setRequestProperty("Authorization", accesstoken);
            con.setRequestProperty("Accept", "application/json");
            con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            con.setDoOutput(true);
            OutputStream os = con.getOutputStream();
            os.write(jsonBody.getBytes("UTF-8"));
            os.close();
            con.connect();

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }

        return true;
    }
}
