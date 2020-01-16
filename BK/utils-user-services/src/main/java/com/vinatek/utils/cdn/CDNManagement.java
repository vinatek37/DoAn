/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.cdn;

import com.vinatek.utils.constant.UploadTypeConst;
import com.vinatek.utils.utilities.FileHelper;
import com.vinatek.utils.utilities.StringHelper;
import com.vinatek.utils.utilities.https.UploadFileRequest;
import org.apache.log4j.Logger;
import org.apache.commons.codec.binary.Base64;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Dzungvd <dung.vuongdinh.vn@gmail.com>
 */
public class CDNManagement {

    private static CDNManagement instance = new CDNManagement();

    public static final Logger logger = Logger.getLogger(CDNManagement.class);

    public static CDNManagement Instance() {
        return instance;
    }

    private CDNManagement() {

    }

    public String uploadAvatarToHost(String base64Data, String fileName, String url, String token) {
        logger.debug("uploadAvatarToHost:" + fileName);
        try {
            UploadFileRequest request = new UploadFileRequest(fileName, base64Data, UploadTypeConst.AVATAR);
            return FileHelper.uploadFileTranfer(request, url, token);
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }
        return null;
    }

    public String saveEcgThumb(String fileName, String strData, String url, String token) {
        logger.debug("Save ECG Thumb:" + fileName);
        try {
            if (StringHelper.IsEmpty(strData)) {
                return "";
            }

            UploadFileRequest request = new UploadFileRequest(fileName, strData, UploadTypeConst.ECG_IMG);
            return FileHelper.uploadFileTranfer(request, url, token);
        } catch (Exception ex) {
            logger.debug(ex.toString());
        }

        return null;
    }

    public String saveEcgData(String fileName, String strData, String url, String token) {
        logger.debug("Save ECG data:" + fileName);
        try {
            if (StringHelper.IsEmpty(strData)) {
                return "";
            }
            UploadFileRequest request = new UploadFileRequest(fileName, strData, UploadTypeConst.ECG_DATA);
            return FileHelper.uploadFileTranfer(request, url, token);
        } catch (Exception ex) {
            logger.debug(ex.toString());
        }

        return null;
    }
}
