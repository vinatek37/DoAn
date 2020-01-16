/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities;

import com.vinatek.utils.utilities.https.OneVinmecHttpsClient;
import com.vinatek.utils.utilities.https.UploadFileRequest;
import org.springframework.web.client.HttpClientErrorException;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;


public class FileHelper {

    public static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(FileHelper.class);

    public static byte[] ReadFile(String path) {
        FileInputStream fis = null;
        byte[] data = null;
        try {
            byte[] result = null;
            File file = new File(path);
            fis = new FileInputStream(file);
            data = new byte[(int) file.length()];
            fis.read(data);
            fis.close();
        } catch (Exception ex) {

        } finally {
            try {
                fis.close();
            } catch (IOException ex) {
            }
        }

        return data;
    }

    public static String ReadFileToString(String path) {
        byte[] data = ReadFile(path);
        if (data != null) {
            return new String(data);
        }

        return null;
    }

    public static String ReadFileToBase64String(String path) {
        byte[] data = ReadFile(path);
        if (data != null) {
            return Encrypt.BytesToBase64String(data);
        }

        return null;
    }

    public static boolean WriteImageFile(String data, String path, String fileName) throws IOException {
        byte[] dataByte = Encrypt.Base64StringToBytes(data);
//        WriteFile(dataByte, path, fileName);
        InputStream in = new ByteArrayInputStream(dataByte);
        BufferedImage img = ImageIO.read(in);
        ImageIO.write(img, "png", new File(path + fileName));
        return true;
    }

    public static boolean WriteImageFileNameOnly(String data, String path, String fileName) throws IOException {
        byte[] dataByte = Encrypt.Base64StringToBytes(data);
//        WriteFile(dataByte, path, fileName);
        InputStream in = new ByteArrayInputStream(dataByte);
        BufferedImage img = ImageIO.read(in);
        ImageIO.write(img, "jpg", new File(path, fileName));
        return true;
    }

    public static boolean WriteFile(String data, String path, String fileName) throws IOException {
        byte[] bytes = data.getBytes();
        return WriteFile(bytes, path, fileName);
    }

    public static boolean WriteFile(byte[] data, String path, String fileName) throws IOException {
        File uploadedFile = new File(path, fileName);
        FileOutputStream fileOutputStream = null;
        uploadedFile.createNewFile();
        fileOutputStream = new FileOutputStream(uploadedFile);
        fileOutputStream.write(data);
        fileOutputStream.close();

        return true;
    }

    public static boolean FileExist(String path) {
        File f = new File(path);
        if (f.exists() && !f.isDirectory()) {
            return true;
        }

        return false;
    }

    public static String GetExtension(String path) {
        String extension = "";

        int i = path.lastIndexOf('.');
        if (i > 0) {
            extension = path.substring(i + 1);
        }

        return extension;
    }

    public static String GetFileName(String extension) {
        return Utils.getUUID() + extension;
    }

    public static String uploadFileTranfer(UploadFileRequest requestBody, String url, String token) {
        String result = null;
        try {
            String jsonStr = JsonUtils.getInstance().toJSONString(requestBody);
            OneVinmecHttpsClient client = new OneVinmecHttpsClient();
            if (client.connectPOST(url, token, jsonStr)) {
                int responseCode = client.getResponseCode();
                if (responseCode == 200) {
                    byte[] responseBody = client.getResponseBody();
                    BaseResponse response = (BaseResponse) JsonUtils.getInstance().
                            parseFromJSONByte(responseBody, BaseResponse.class);
                    String objResponse = (String) response.obj;
                    if (!objResponse.isEmpty() && !objResponse.equalsIgnoreCase("null")) {
                        result = objResponse;
                    }
                    return result;
                } else {
                    log.error("getBase64Tranfer: responseCode != 200");
                    System.out.println("responseCode != 200");
                }
            } else {
                System.out.println("cannot connect to API");
            }
        } catch (HttpClientErrorException ex) {
            log.error(ex.getMessage());
        } catch (IOException ex) {
            log.error(ex.getMessage());
        }
        return result;
    }

    public static String getBase64Tranfer(String url, String fileName, Integer type, String token) {
        String result = null;
        if (!StringHelper.IsEmpty(fileName)) {
            try {
                url = url + "?fileName=" + fileName + "&type=" + type;
                log.debug(url);
                OneVinmecHttpsClient client = new OneVinmecHttpsClient();
                if (client.connect(url, token)) {
                    int responseCode = client.getResponseCode();
                    if (responseCode == 200) {
                        byte[] responseBody = client.getResponseBody();
                        BaseResponse response = (BaseResponse) JsonUtils.getInstance().
                                parseFromJSONByte(responseBody, BaseResponse.class);
                        if (response.obj != null) {
                            result = (String) response.obj;
                        }
                        return result;
                    } else {
                        log.error("getBase64Tranfer: responseCode != 200");
                        System.out.println("getBase64Tranfer: responseCode != 200");
                    }
                } else {
                    log.error("getBase64Tranfer: cannot connect to API");
                    System.out.println("getBase64Tranfer: cannot connect to API");
                }
            } catch (HttpClientErrorException ex) {
                log.error(ex.getMessage());
            } catch (IOException ex) {
                log.error(ex.getMessage());
            }
        }

        return result;
    }
}
