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
public class GuestBean implements Serializable{
    private String guestId;
    private String guestName;
    private String guestEmail;
    private String guestListId;
    public GuestBean(){};
    public void setGuestId(String g){this.guestId = g;}
    public String getGuestId(){return this.guestId;}
    public void setGuestName(String g){this.guestName = g;}
    public String getGuestName(){return this.guestName;}
    public void setGuestEmail(String g){this.guestEmail = g;}
    public String getGuestEmail(){return this.guestEmail;}
    public void setGuestListId(String g){this.guestListId = g;}
    public String getGuestListId(){return this.guestListId;}
    
}
