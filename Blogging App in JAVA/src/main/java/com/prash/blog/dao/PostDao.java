package com.prash.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.prash.blog.entities.Categories;
import com.prash.blog.entities.Post;

public class PostDao {
   private Connection con;

public PostDao(Connection con) {
	super();
	this.con = con;
}
   
   public ArrayList<Categories> getAllCategories(){
	   ArrayList<Categories> list=new ArrayList<>();
	   
	   try {
		   String query="SELECT * FROM categories";
		   PreparedStatement stmt=this.con.prepareStatement(query);
		   ResultSet rs=stmt.executeQuery();
		   
		   while(rs.next()) {
			  int cid=rs.getInt("cid");
			  String name=rs.getString("name");
			  String description=rs.getString("description");
			  Categories c=new Categories(cid,name,description);
			  list.add(c);
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return list;
   }
   
   public boolean savePost(Post post) {
	   boolean flag=false;
	   try {
		    
		   String query="insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
		   PreparedStatement stmt=con.prepareStatement(query);
		   stmt.setString(1,post.getpTitle());
		   stmt.setString(2, post.getpContent());
		   stmt.setString(3, post.getpCode());
		   stmt.setString(4, post.getpPic());
		   stmt.setInt(5,post.getCatId());
		   stmt.setInt(6, post.getUserId());
		   
		   stmt.executeUpdate();
		   flag=true;
		   
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
       return flag;
   }
   public List<Post> getAllPost() throws SQLException{
	   List<Post> list=new ArrayList<>();
	   
	   try {
		   
		   String query="SELECT * FROM posts";
		   PreparedStatement stmt=con.prepareStatement(query);
		   ResultSet rs=stmt.executeQuery();
		   while(rs.next()) {
			   int pid=rs.getInt("pid");
			   String pTitle=rs.getString("pTitle");
			   String pContent=rs.getString("pContent");
			   String pCode=rs.getString("pCode");
			   String pPic=rs.getString("pPic");
			   Timestamp pDate=rs.getTimestamp("pDate");
			   int catId=rs.getInt("catId");
			   int userId=rs.getInt("userId");
			   
			   Post post=new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
			   list.add(post);
		    
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	   
	   return list;
   }
   public List<Post> getPostById(int catId){
	   List<Post> list=new ArrayList<>();
	   
        try {
		   
		   String query="SELECT * FROM posts WHERE catId=?";
		   PreparedStatement stmt=con.prepareStatement(query);
		   stmt.setInt(1, catId);
		   ResultSet rs=stmt.executeQuery();
		   while(rs.next()) {
			   int pid=rs.getInt("pid");
			   String pTitle=rs.getString("pTitle");
			   String pContent=rs.getString("pContent");
			   String pCode=rs.getString("pCode");
			   String pPic=rs.getString("pPic");
			   Timestamp pDate=rs.getTimestamp("pDate");
			   int ctId=rs.getInt("catId");
			   int userId=rs.getInt("userId");
			   
			   Post post=new Post(pid,pTitle,pContent,pCode,pPic,pDate,ctId,userId);
			   list.add(post);
		    
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	   return list;
   }
   public Post getPostBypid(int postId) {
	   
	   Post post=null;
	   String query="select * from posts where pid=?";
	   try {
		   PreparedStatement stmt=this.con.prepareStatement(query);
		   stmt.setInt(1, postId);
		   ResultSet rs=stmt.executeQuery();
		   while(rs.next()) {
			  
			   int pid=rs.getInt("pid");
			   String pTitle=rs.getString("pTitle");
			   String pContent=rs.getString("pContent");
			   String pCode=rs.getString("pCode");
			   String pPic=rs.getString("pPic");
			   Timestamp pDate=rs.getTimestamp("pDate");
			   int catId=rs.getInt("catId");
			   int userId=rs.getInt("userId");
			   
			   post=new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
			 
			 
		   }
		   
		   
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   return post;
   }
}
