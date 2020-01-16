/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities;

import com.vinatek.utils.constant.UploadTypeConst;
import com.vinatek.utils.utilities.EcgFilter.AdvancedFilter_Work;
import com.vinatek.utils.utilities.EcgFilter.BaseProcessEcg;
import com.vinatek.utils.utilities.EcgFilter.Frequency_Filter;
import java.util.*;
import org.springframework.util.Base64Utils;

public class DataEcgFile {

    public static byte[] ReadFile(String ecgDataName, String apiURL, String token) {

        String result = FileHelper.getBase64Tranfer(apiURL, ecgDataName, UploadTypeConst.ECG_DATA, token);
        return Encrypt.Base64StringToBytes(result);
    }

    public static String getDataFromFile(String path, String apiURL, String token) {
        String kq = "";
        ResourceBundle rb = ResourceBundle.getBundle("config");
        String parent = rb.getString("ParentLocal");
        String ecgPath = rb.getString("EcgDataPath");
        String fullPath = parent + ecgPath + path;
        byte[] data = ReadFile(fullPath, apiURL, token);
        if (data != null) {
            kq = Base64Utils.encodeToString(data);
        }
        return kq;
    }

    public static String GetDataFilted(String file, int type, String apiURL, String token) {
        String result = "";
        try {
            switch (type) {
                case 0: {
                    float[] baseData = BaseProcessEcg.GetBaseData(file, apiURL, token);
                    result = ObjHelper.StringFromFloatArray(baseData);
                    break;
                }
                case 2: {
                    float[] baseData = Frequency_Filter.GetFrequencyFilterData(file, apiURL, token);
                    result = ArrayHelper.FloatArrayToBase64String(baseData);
                    //result = ObjHelper.StringFromFloatArray(baseData);
                    break;
                }
                case 1: {
                    float[] baseData = AdvancedFilter_Work.GetAdvFilterData(file, apiURL, token);
                    result = ObjHelper.StringFromFloatArray(baseData);
                    break;
                }
                default:
                    break;
            }
        } catch (Exception e) {
        }
        return result;
    }
}
