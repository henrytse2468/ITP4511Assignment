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
public class VenueBean implements Serializable{
    private String venueId;
    private String imageListId;
    private String venueName;
    private String venueType;
    private String venueCapacity;
    private String venueLocation;
    private String venueDesc;
    private String venuePIC;
    private int venueHourlyFee;
    private String venueStatus;
    
    public VenueBean(){};
    public void setVenueId(String v){this.venueId = v;}    
    public String getVenueId(){return this.venueId;}
    public void setImageListId(String i){this.imageListId = i;}    
    public String getImageListId(){return this.imageListId;}
    public void setVenueName(String n){this.venueName = n;}    
    public String getVenueName(){return this.venueName;}
    public void setVenueType(String t){this.venueType = t;}    
    public String getVenueType(){return this.venueType;}
    public void setVenueCapacity(String c){this.venueCapacity = c;}    
    public String getVenueCapacity(){return this.venueCapacity;}
    public void setVenueLocation(String l){this.venueLocation = l;}    
    public String getVenueLocation(){return this.venueLocation;}
    public void setVenueDesc(String d){this.venueDesc = d;}    
    public String getVenueDesc(){return this.venueDesc;}
    public void setVenuePIC(String p){this.venuePIC = p;}    
    public String getVenuePIC(){return this.venuePIC;}
    public void setVenueHourlyFee(int f){this.venueHourlyFee = f;}    
    public int getVenueHourlyFee(){return this.venueHourlyFee;}
    public void setVenueStatus(String s){this.venueStatus = s;}    
    public String getVenueStatus(){return this.venueStatus;}
}
