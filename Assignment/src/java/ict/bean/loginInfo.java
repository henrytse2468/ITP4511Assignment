/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.io.Serializable;

/**
 *
 * @author user
 */
public class loginInfo implements Serializable{
    private String username;
    private String password;
    private String id;
    
    public loginInfo(){
    };

    public void setId(String id){
        this.id = id;
    }
    public String getId(){
        return this.id;
    }
    public void setUsername(String u){
        this.username = u;
    };
    public void setPassword(String p){
        this.password = p;
    };
    public String getUsername(){
        return username;
    };
    public String getPassword(){
        return password;
    };
    
}
