/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities;

import org.apache.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.UUID;

/**
 *
 *
 */
public class Utils {

    private static final Logger logger = Logger.getLogger(Utils.class);

    private static int OH_length = 9;
    private static int EHOS_length = 8;

    public static String VinSystemDetectByPid(String pid) {
        if (pid.length() == 8) {
            return "eHOS";
        }
        return "OH";
    }

    public static String GetFullPID(String pid) {
        if (pid.length() == EHOS_length) {
            return "eHOS : " + pid;
        }

        if (pid.length() == OH_length) {
            return "OH : " + pid;
        }

        return pid;
    }

    public static String GetPathUserImage(String fileName, String fullPath) {


        if (FileHelper.FileExist(fullPath)) {
            return ImageToStringBase64(fullPath);
        } else {
            return ImageToStringBase64(fullPath);
        }
    }

    public static String ImageToStringBase64(String path) {
        byte[] dtByte = FileHelper.ReadFile(path);
        String extension = FileHelper.GetExtension(path);
        return String.format("data:image/%s;base64,%s", extension, Encrypt.BytesToBase64String(dtByte));
    }

    public static byte[] Base64StringToBytes(String strData) {
        byte[] baseData = Base64.getDecoder().decode(strData);
        return baseData;
    }

    public static String BytesToBase64String(byte[] data) {
        String strData = Base64.getEncoder().encodeToString(data);
        return strData;
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

    public static void WriteFile(String fileName, String data) {
        try {
            byte[] bytes = Base64StringToBytes(data);
            Path path = Paths.get(fileName);
            Files.write(path, bytes); //creates, overwrites
        } catch (IOException ex) {
            logger.debug("Exception: " + ex);
        }
    }

    public static byte[] ReadFile(String fileName) {
        try {
            Path path = Paths.get(fileName);
            return Files.readAllBytes(path);
        } catch (IOException ex) {
            logger.debug("Exception: " + ex);
        }

        return null;
    }

    public static String getUUID() {
        UUID sessionID = UUID.randomUUID();
        return sessionID.toString();
    }
}
