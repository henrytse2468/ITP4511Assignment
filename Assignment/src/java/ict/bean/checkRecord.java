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
public class checkRecord {
    private String checkInOutRecordId, bookingRequestId, memberId, checkInOutType, checkInOutTime, checkInOutRemark;
    public checkRecord(){};
    public void setCheckInOutRecord(String a){this.checkInOutRecordId = a;}
    public String getCheckInOutRecord(){return this.checkInOutRecordId;}
    public void setBookingRequestId(String a){this.bookingRequestId = a;}
    public String getBookingRequestId(){return this.bookingRequestId;}
    public void setMemberId(String a){this.memberId = a;}
    public String getMemberId(){return this.memberId;}
    public void setCheckInOutType(String a){this.checkInOutType = a;}
    public String getCheckInOutType(){return this.checkInOutType;}
    public void setCheckInOutTime(String a){this.checkInOutTime = a;}
    public String getCheckInOutTime(){return this.checkInOutTime;}
    public void setCheckInOutRemark(String a){this.checkInOutRemark = a;}
    public String getCheckInOutRemark(){return this.checkInOutRemark;}
    
}
