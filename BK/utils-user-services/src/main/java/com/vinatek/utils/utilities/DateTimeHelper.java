/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.utilities;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 *
 * @author Dzungvd <dung.vuongdinh.vn@gmail.com>
 */
public class DateTimeHelper {

    public static String getStringTime(String format) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern(format);
        LocalDateTime now = LocalDateTime.now();
        return dtf.format(now);
    }

    //"yyyy-MM-dd"
    public static Timestamp StringToTimestamp(String format, String data) {

        try {
            SimpleDateFormat formatter = new SimpleDateFormat(format);
            Date date = formatter.parse(data);

            return new Timestamp(date.getTime());
        } catch (ParseException ex) {
            return null;
        }
    }

    public static String TimestampToString(String format, Timestamp time) {
        String strTime = "";
        if (time == null) {
            return null;
        }
        SimpleDateFormat sf = new SimpleDateFormat(format);
        Date date = new Date(time.getTime());
        strTime = sf.format(date);
        return strTime;
    }

    public static Timestamp getCurrentTimestamp() {
        return new Timestamp(System.currentTimeMillis());
    }

    public static Timestamp getTimestamp(long timestamp) {
        return new Timestamp(timestamp);
    }

    public static Timestamp getTimestampBefore(long period) {
        return new Timestamp(System.currentTimeMillis() - period);
    }

    public static Timestamp getTimestampAfter(Timestamp current, long period) {
        return new Timestamp(current.getTime() + period);
    }

    public static Timestamp getTimestampAfter(long period) {
        return new Timestamp(System.currentTimeMillis() + period);
    }

    public static long StringToLong(String format, String data) {

        try {
            SimpleDateFormat formatter = new SimpleDateFormat(format);
            Date date = formatter.parse(data);

            return date.getTime();
        } catch (ParseException ex) {
            return 0;
        }
    }

    public static long getCurrentTime() {
        return System.currentTimeMillis();
    }

    private static Long dayToMiliseconds(int days) {
        Long d = new Long(days);
        Long result = d * 24 * 60 * 60 * 1000;
        return result;
    }

    public static Timestamp addDays(int days, Timestamp t1) {
        if (days < 0) {
            return t1;
        }
        Long miliseconds = dayToMiliseconds(days);
        return new Timestamp(t1.getTime() + miliseconds);
    }
}
