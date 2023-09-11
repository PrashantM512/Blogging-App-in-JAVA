package com.prash.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
     Connection con;

	public LikeDao(Connection con) {
		super();
		this.con = con;
	}
     
     public boolean likePost(int pid , int uid) {
          boolean flag=false;
    	 String query="insert into likes(pid,uid) values(?,?)";
    	 try {
    		 PreparedStatement stmt=this.con.prepareStatement(query);
    		 stmt.setInt(1, pid);
    		 stmt.setInt(2, uid);
    		 stmt.executeUpdate();
    		 flag=true;
    		 
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return flag;
     }
     public int likesCount(int pid) {
    	 int count=0;
    	 String query="select count(*) from likes where pid=?";
    	 try {
    		 PreparedStatement stmt=this.con.prepareStatement(query);
    		 stmt.setInt(1,pid);
    		 ResultSet rs=stmt.executeQuery();
    		 while(rs.next()) {
    			 count=rs.getInt("count(*)");
    		 }
    		 
    	 }catch(Exception e){
    		 e.printStackTrace();
    	 }
    	 
    	 return count;
     }
     public boolean isLikedByUser(int uid,int pid) {
    	 boolean flag=false;
    	 String query="select * from likes where uid=?,pid=?";
    	 try {
    		PreparedStatement stmt=this.con.prepareStatement(query);
    		stmt.setInt(1, uid);
    		stmt.setInt(2, pid);
    		ResultSet rs=stmt.executeQuery();
    		
    		while(rs.next()) {
    			flag=true;
    		}
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 
    	 return flag;
     }
     public boolean deleteLike(int pid,int uid) {
    	 boolean flag=false;
    	 String query="delete from likes where pid=?,uid=?";
    	 try {
    		 PreparedStatement stmt=this.con.prepareStatement(query);
    		 stmt.setInt(1, pid);
    		 stmt.setInt(2, uid);
    		 stmt.executeQuery();
    		 flag=true;
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return true;
     }
}
