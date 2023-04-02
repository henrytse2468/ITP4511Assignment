/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.io.Serializable;

/**
 *
 * @author henry
 */
public class GuestListBean implements Serializable{
    private String guestListId;
    private String memberId;
    public GuestListBean(){};
    public void setGuestListId(String id){this.guestListId = id;}
    public String getGuestListId(){return this.guestListId;}
    public void setMemberId(String id){this.memberId = id;}
    public String getMemberId(){return this.memberId;}
}
