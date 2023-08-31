package com.prash.blog.dao;

import java.sql.*;
import java.util.Set;

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
     
     public User getUserByEmailAndPassword(String email, String password) {
    	 User user=null;
    	 con=ConnectionProvider.getConnection();
    	 try {
    		 String query="SELECT * FROM users WHERE email=? and password=?";
    		 PreparedStatement stmt=con.prepareStatement(query);
    		 stmt.setString(1, email);
    		 stmt.setString(2, password);
    		 ResultSet rs=stmt.executeQuery();
    		 
    		 while(rs.next()) {
    			 int id=rs.getInt("id");
    			 String name =rs.getString("name");
    			 String email2=rs.getString("email");
    			 String password2=rs.getString("password");
    			 String gender=rs.getString("gender");
    			 String about=rs.getString("about");
    			 Timestamp ts=rs.getTimestamp("rdate");
    			 String profile=rs.getString("profile");
    			 
    			 user=new User(id,name,email,password,gender,about,ts,profile);
    		
					/*
					 * user.setId(id); user.setName(name); user.setEmail(email);
					 * user.setPassword(password); user.setGender(gender); user.setAbout(about);
					 * user.setDateTime(ts); user.setProfile(profile);
					 */ 
    		 }
    		 
    		 
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }
    	 
    	 return user;
     } 
     
     public boolean editUser(User user) throws SQLException {
    	 boolean flag=false;
    	 String query="UPDATE users SET name=?,password=?,about=?,profile=? WHERE id=?";
    	
    	PreparedStatement stmt=con.prepareStatement(query);
    	stmt.setString(1,user.getName());
    	stmt.setString(2,user.getPassword());
    	stmt.setString(3,user.getAbout());
    	stmt.setString(4,user.getProfile());
    	stmt.setInt(5,user.getId());
    	
    	stmt.executeUpdate();
    	
    	if(stmt.executeUpdate()>0) {
    		flag=true;
    	}
    	 return flag;
     }
     
} 
