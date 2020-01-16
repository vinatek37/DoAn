/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities;

import org.apache.log4j.Logger;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;

/**
 *
 * @author ADMIN
 */
public class ImageHelper {
    private static final Logger logger = Logger.getLogger(ImageHelper.class);
    
    public static boolean SaveFile(String rootFolder, String strData, String filePngName) {
        try
        {
            byte[] data = Encrypt.Base64StringToBytes(strData);
            InputStream in = new ByteArrayInputStream(data);
            BufferedImage img = ImageIO.read(in);
            ImageIO.write(img, "png", new File(rootFolder + filePngName));
            return true;
        }
        catch (Exception ex)
        {
            logger.debug("Exception: " + ex);
            return false;
        }
    }        
}
