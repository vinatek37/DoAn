/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vinatek.utils.constant;

/**
 *
 * @author Dzungvd <dung.vuongdinh.vn@gmail.com>
 */
public class TicketConst {   
    //Type of ticket
    public static final int TICKET_ECG = 1;
    public static final int TICKET_BOOKING = 2;    

    //State of Ticket ECG
    public static final int TICKET_ECG_PREPARE = 1;
    public static final int TICKET_ECG_ASSIGNED = 2;
    public static final int TICKET_ECG_DONE = 3;
    
    //State of Ticket Booking
    public static final int TICKET_BOOKING_PREPARE = 1;    
    public static final int TICKET_BOOKING_REJECT = 2;  
    public static final int TICKET_BOOKING_ACCEPT = 3;    
    
    public static final int HIGH_PRIORITY = 1;
    public static final int NORMAL_PRIORITY = 2;
    public static final int LOW_PRIORITY = 3;

    public static final int ECG_DEVICE_SOURCE = 1;
}