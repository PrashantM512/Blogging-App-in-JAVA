package com.prash.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.prash.blog.entities.Categories;

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
}
