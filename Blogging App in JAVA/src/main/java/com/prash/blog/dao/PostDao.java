package com.prash.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
}
