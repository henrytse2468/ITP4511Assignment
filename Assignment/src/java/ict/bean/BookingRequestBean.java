/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

/**
 *
 * @author henry
 */
public class BookingRequestBean {
    private String bookingRequestId;
    private String bookDate;
    private String bookVenueId;
    private String bookMemberId;
    private String bookStartTime;
    private String bookEndTime;
    private String bookStatus;
    private String bookPaymentReceipt;
    private String bookGuestListId;
    private String bookRequestTime;
    
    public BookingRequestBean(){}
    public void setBookingRequestId(String a){this.bookingRequestId = a;}
    public String getBookingRequestId(){return this.bookingRequestId;}
    public void setBookDate(String a){this.bookDate = a;}
    public String getBookDate(){return this.bookDate;}
    public void setBookVenueId(String a){this.bookVenueId = a;}
    public String getBookVenueId(){return this.bookVenueId;}
    public void setBookMemberId(String a){this.bookMemberId = a;}
    public String getBookMemberId(){return this.bookMemberId;}
    public void setBookStartTime(String a){this.bookStartTime = a;}
    public String getBookStartTime(){return this.bookStartTime;}
    public void setBookEndTime(String a){this.bookEndTime = a;}
    public String getBookEndTime(){return this.bookEndTime;}
    public void setBookStatus(String a){this.bookStatus = a;}
    public String getBookStatus(){return this.bookStatus;}
    public void setBookRequestTime(String a){this.bookRequestTime = a;}
    public String getBookRequestTime(){return this.bookRequestTime;}
    public void setBookPaymentReceipt(String a){this.bookPaymentReceipt = a;}
    public String getBookPaymentReceipt(){return this.bookPaymentReceipt;}
    public void setBookGuestListId(String a){this.bookGuestListId = a;}
    public String getBookGuestListId(){return this.bookGuestListId;}
    
}
