/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;
import org.apache.log4j.Logger;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;

public class SecurityUtils {

    private static byte[] key = {'V', 'T', 'G', 'O', 'A', 'P', 'P', 'T', 'O',
        'A', 'N', 'N', 'V', 'K', 'E', 'Y'};

    private static final Logger logger = Logger.getLogger(SecurityUtils.class);

    public static String createToken(String str, Date date) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest((str + String.valueOf(date.getTime())).getBytes("UTF-8"));
            return Hex.encodeHexString(hash);
        } catch (Exception e) {
            logger.error(e, e);
            return null;
        }
    }

    /**
     * Hàm mã hóa mật khẩu sử dụng SHA-256 và salt
     *
     * @param password
     * @param salt
     * @return
     */
    public static String hashPassword(String password, String salt) {
        String passwordAndSalt = password + salt;
        try {
            return encrypt(passwordAndSalt);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            logger.error(e.getMessage(), e);
            return "";
        }
    }

    /**
     * Hàm mã hóa mật khẩu sử dụng SHA-256
     *
     * @param plaintext
     * @return
     * @throws NoSuchAlgorithmException
     * @throws UnsupportedEncodingException
     * @throws Exception
     */
    public static String encrypt(String plaintext)
            throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest md = MessageDigest.getInstance("SHA-256"); // step 2
        md.update(plaintext.getBytes("UTF-8")); // step 3
        byte raw[] = md.digest(); // step 4
        String hash = Base64.encodeBase64String(raw); // step 5
        return hash; // step 6

        // Hoac
        // MessageDigest digest = MessageDigest.getInstance("SHA-256");
        // byte[] hash = digest.digest((plaintext).getBytes("UTF-8"));
        // return Hex.encodeHexString(hash);
        // Hoac
        // byte[] hash = digest.digest(plaintext.getBytes());
        // return Base64.encodeBase64String(hash);
    }

    public static String genRandomPassword() {

        // A - Z: 65 -> 90
        // a-z: 97 - > 122
        // 0 - 9: 48 - 57
        // ki tu dac biet: 33-47
        // ki tu dac biet: 33,64,35,36,37,94,38,42 (!@#$%^&*)
        // @: 64
        try {
            SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
            String result = "";
            ArrayList<Integer> cards = new ArrayList<>();
            Integer[] pass = new Integer[8];
            for (int i = 0; i < 8; i++) {
                if (i < 3) { // Random 3 ki tu so
                    pass[i] = random.nextInt(10) + 48;
                } else if (i < 6) { // Random 3 ki tu chu cai thuong
                    pass[i] = random.nextInt(26) + 97;
                } else if (i == 6) { // Random chu hoa
                    pass[i] = random.nextInt(26) + 65;
                } else { // Random ki tu dac biet
                    int[] arrSc = new int[]{33, 64, 35, 36, 37, 94, 38, 42};
                    int arrScLength = arrSc.length;
                    int sc = random.nextInt(arrScLength);
                    pass[i] = arrSc[sc];
                }
            }
            cards.addAll(Arrays.asList(pass));
            Collections.shuffle(cards);
            for (Integer i : cards) {
                result = result + (char) (i.intValue());
            }

            return result;
        } catch (NullPointerException | NoSuchAlgorithmException e) {
            logger.error(e.getMessage(), e);
            return "123456aA@";
        }
    }

    public static String createSalt() {
        char[] chars = "abcdefghijklmnopqrstuvwxyz".toCharArray();
        StringBuilder sb = new StringBuilder();
        SecureRandom random = null;
        try {
            random = SecureRandom.getInstance("SHA1PRNG");
        } catch (NoSuchAlgorithmException e) {
            logger.error(e.getMessage(), e);
        }
        if (random != null) {
            for (int i = 0; i < 10; i++) {
                char c = chars[random.nextInt(chars.length)];
                sb.append(c);
            }
            String output = sb.toString();
            return output;
        } else {
            return "vtgosalt";
        }
    }

    public static String genRandomOTP(int length) {
        // 0 - 9: 48 - 57
        try {
            SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
            String result = "";
            ArrayList<Integer> cards = new ArrayList<>();
            Integer[] pass = new Integer[length];
            for (int i = 0; i < length; i++) {
                pass[i] = random.nextInt(10) + 48;
            }
            cards.addAll(Arrays.asList(pass));
            Collections.shuffle(cards);
            for (Integer i : cards) {
                result = result + (char) (i.intValue());
            }
            return result;
        } catch (NullPointerException | NoSuchAlgorithmException e) {
            logger.error(e.getMessage(), e);
            return "111111";
        }
    }

    public static String genRandomCode() {
        try {
            SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
            String result = "";
            ArrayList<Integer> cards = new ArrayList<>();
            Integer[] pass = new Integer[8];
            for (int i = 0; i < 8; i++) {
                if (i < 3) { // Random 3 ki tu so
                    pass[i] = random.nextInt(10) + 48;
                } else if (i < 6) { // Random 3 ki tu chu cai thuong
                    pass[i] = random.nextInt(26) + 97;
                } else { // Random chu hoa
                    pass[i] = random.nextInt(26) + 65;
                }
            }
            cards.addAll(Arrays.asList(pass));
            Collections.shuffle(cards);
            for (Integer i : cards) {
                result = result + (char) (i.intValue());
            }

            return result;
        } catch (NullPointerException | NoSuchAlgorithmException e) {
            logger.error(e.getMessage(), e);
            return "";
        }
    }

    public static String sha1HashWithHex(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            md.update(input.getBytes("UTF-8"), 0, input.length());
            byte[] sha1hash = md.digest();
            return convertToHex(sha1hash);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return "";
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return "";
        }
    }

    public static String convertToHex(byte[] data) {
        StringBuffer buf = new StringBuffer();
        for (int i = 0; i < data.length; i++) {
            int halfbyte = (data[i] >>> 4) & 0x0F;
            int two_halfs = 0;
            do {
                if ((0 <= halfbyte) && (halfbyte <= 9)) {
                    buf.append((char) ('0' + halfbyte));
                } else {
                    buf.append((char) ('a' + (halfbyte - 10)));
                }
                halfbyte = data[i] & 0x0F;
            } while (two_halfs++ < 1);
        }
        return buf.toString();
    }
}
