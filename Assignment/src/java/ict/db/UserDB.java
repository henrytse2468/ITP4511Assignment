/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.loginInfo;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author user
 */
public class UserDB {
    private String dburl = "";
    private String id = "";
    private String dbusername = "";
    private String dbpassword = "";
    public UserDB(String dburl, String dbusername, String dbpassword){
        this.dburl = dburl;
        this.dbusername = dbusername;
        this.dbpassword = dbpassword;
    }
    
    public Connection getConnection() throws SQLException, IOException{
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(ClassNotFoundException ex){
            ex.printStackTrace();
            
        }
        return DriverManager.getConnection(dburl, dbusername, dbpassword);
    }
    public String getMemberId(String user, String pwd){
        String li = "";
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        
        try{
            cnnct = getConnection();
            String preQueryStatement = "SELECT memberId FROM Member WHERE memberEmail =? and password=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, user);
            pStmnt.setString(2, pwd);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();

        if (rs.next()) {
             li = rs.getString(1);
        }
        }catch(SQLException ex){
            while (ex != null){
            ex.printStackTrace();
            ex = ex.getNextException();
        }
        }catch(IOException ex){
            ex.printStackTrace();
        }
        return li;
        
        
    }
    
    public boolean isValidMember(String user, String pwd){
        boolean isValid = false;
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        
        try{
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM Member WHERE memberEmail =? and password=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, user);
            pStmnt.setString(2, pwd);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();

        if (rs.next()) {
            isValid = true;
        }
        }catch(SQLException ex){
            while (ex != null){
            ex.printStackTrace();
            ex = ex.getNextException();
        }
        }catch(IOException ex){
            ex.printStackTrace();
        }
        return isValid;
        
        
    }
    public boolean isValidStaff(String user, String pwd){
        boolean isValid = false;
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        
        try{
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM Staff WHERE staffId =? and password=? and roleId = 'R01'";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, user);
            pStmnt.setString(2, pwd);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();

        if (rs.next()) {
            isValid = true;
        }
        }catch(SQLException ex){
            while (ex != null){
            ex.printStackTrace();
            ex = ex.getNextException();
        }
        }catch(IOException ex){
            ex.printStackTrace();
        }
        return isValid;
        
        
    }
    public boolean isValidAdmin(String user, String pwd){
        boolean isValid = false;
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        
        try{
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM Staff WHERE staffId =? and password=? and roleId = 'R02'";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, user);
            pStmnt.setString(2, pwd);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();

        if (rs.next()) {
            isValid = true;
        }
        }catch(SQLException ex){
            while (ex != null){
            ex.printStackTrace();
            ex = ex.getNextException();
        }
        }catch(IOException ex){
            ex.printStackTrace();
        }
        return isValid;
        
        
    }
   
    public boolean addUserInfo(String Id, String username, String password){
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try{
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO userinfo VALUES(?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, Id);
            pStmnt.setString(2, username);
            pStmnt.setString(3, password);
            int rowCount = pStmnt.executeUpdate();
            if(rowCount>=1){
                isSuccess = true;
            }            
        }catch(SQLException ex){
            while (ex != null){
            ex.printStackTrace();
            ex = ex.getNextException();
        }
        }catch(IOException ex){
            ex.printStackTrace();
        }
        return isSuccess;
    }
    public int addDateAuto(){
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        int isSuccess = 0;
        try{
            ArrayList list = new ArrayList();
            LocalDate date = LocalDate.now();
            cnnct = getConnection();
              
            String preQueryStatement = "SELECT * FROM datetable";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            
            while(rs.next()){
                list.add(rs.getString(1));
            }
            
            for (int a = 0 ; a < 30; a++){
               String preQueryStatement2 = "INSERT INTO datetable VALUES('" + date + "')";
               pStmnt = cnnct.prepareStatement(preQueryStatement2);
               pStmnt.executeUpdate();
               date = date.plusDays(1);
               isSuccess = isSuccess + 1;
            }
            
        }catch(SQLException ex){
            while (ex != null){
            ex.printStackTrace();
            ex = ex.getNextException();
        }
        }catch(IOException ex){
            ex.printStackTrace();
        }
        
        return isSuccess;
    }
}


