package com.prash.blog.dao;

import java.sql.*;

import com.prash.blog.entities.User;
import com.prash.blog.helper.*;


public class UserDao {
     private Connection con;
     
     public UserDao(Connection con) {
    	 this.con=con;
     }
     
     public boolean saveUser(User user) {
    	 boolean flag=false;
    	 con=ConnectionProvider.getConnection();
    	 try{
    		 String query="INSERT INTO users(name,email,password,gender,about) VALUES(?,?,?,?,?)";
    		 PreparedStatement stmt=con.prepareStatement(query);
    		 stmt.setString(1,user.getName());
    		 stmt.setString(2,user.getEmail());
    		 stmt.setString(3,user.getPassword());
    		 stmt.setString(4,user.getGender());
    		 stmt.setString(5,user.getAbout());
    		 stmt.executeUpdate();
    		 flag=true;
    		 
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }
    	 return flag;
     }
     
} 
