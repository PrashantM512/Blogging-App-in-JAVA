<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page errorPage="error.jsp" %>
 <%@ page import="com.prash.blog.entities.User" %>
 <%@ page import="com.prash.blog.dao.PostDao" %>
 <%@ page import="com.prash.blog.helper.ConnectionProvider" %>
 <%@page import="java.util.ArrayList" %>
 <%@page import="com.prash.blog.entities.Categories" %>
 <%
   User user=(User)session.getAttribute("currentUser");
    if(user==null){
    	response.sendRedirect("login_page.jsp");
    }
 %>   
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
<script src="js/myjs.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<title>Profile</title>
 <style>
        .likebutton,
        .unlikebutton {
            display: inline-block;
            cursor: pointer;
            
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light primary-colour">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-blog"></i> BlogMuse</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
       
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Post Blog</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="profile.jsp">Profile</a>
        </li>
        
        
        <%
   
        if(user == null){ %>
        	 <li class="nav-item">
             <a class="nav-link" href="login_page.jsp">
             login</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="register_page.jsp">
             Register</a>
           </li>
            </ul>
      <%  }else{  %>
      
    	 </ul>
    	<ul class="navbar-nav mr-right">
    	  
    	  <li class="nav-item">
             <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-user"></i>&nbsp;
             <%=user.getName().substring(0,1).toUpperCase() %><%=user.getName().substring(1)%></a>
           </li>
    	
           <li class="nav-item">
             <a class="nav-link" href="LogoutServlet">
             LogOut</a>
           </li>
           </ul>
    	  
    <%   }
        
        %>
      
    </div>
</nav>



<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-colour text-white" style="background-image: linear-gradient(45deg, black, transparent)!important;">
        <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="fa-solid fa-blog"></i> BlogMuse</a></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      <div class="container text-center">
      <img src="pics/<%=user.getProfile() %>" class="img-fluid w-25" alt="Responsive image"></img>
      <h3 class="modal-title fs-5  text-center" id="exampleModalLabel"><%=user.getName().substring(0,1).toUpperCase() %><%=user.getName().substring(1)%></h3>
      <br>
   </div>
   <div>   
   
   <div id="profile-details">
      <table class="table">
  <tbody>
    <tr>
      <th scope="row">ID</th>
      <td><%= user.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row">Email</th>
      <td><%= user.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender</th>
      <td><%= user.getGender() %></td>
     
    </tr>
    <tr>
      <th scope="row">Status</th>
      <td><%= user.getAbout() %></td>
     
    </tr>
    <tr>
      <th scope="row">Registerd on</th>
      <td><%= user.getDateTime() %></td>
     
    </tr>
  </tbody>
</table>
</div>
<div id="profile-edit" style="display:none">
<!-- <h3 class="mt-2">Please edit carefully...</h3> -->
<form action="EditServlet" method="post" enctype="multipart/form-data">

<table class="table">
<tr>
<td>Gender: </td>
<td><%=user.getGender() %> ( Gender is uneditable )</td>
</tr>
<tr>
<td>Email: </td>
<td><%=user.getEmail() %> ( Uneditable )</td>
</tr>
<tr>
<td>Name: </td>
<td><input type="text" class="form-control" name="user_name" value="<%=user.getName() %>"></td>
</tr>
<tr>
<td>Password: </td>
<td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword() %>"></td>
</tr>
<tr>
<td>Status: </td>
<td>
<textarea rows="" cols="" class="form-control" name="user_status"><%= user.getAbout()%></textarea>
</td>
<tr>
<td>Profile Pic: </td>
<td>
<input type="file" name="user_img" class="form-control">
</td>
</tr>

</table>

<div class="container">
<button type="submit" style="width: 100%;" class="btn btn-outline-primary">Save</button>
</div>

</form>
</div>
      </div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="edit-profile-btn">Edit</button>
      </div>
    </div>
  </div>
</div>


<div class="container">
<div class="row mt-4">
<div class="col-md-4">

<div class="list-group">
  <a href="#" onclick="getPosts(0)" class="list-group-item list-group-item-action active" aria-current="true">
    All Posts
  </a>
   <%
    PostDao pd=new PostDao(ConnectionProvider.getConnection());
     ArrayList<Categories> list=pd.getAllCategories();
     
     for(Categories c:list){ %>
    	 <a href="#" onclick="getPosts(<%= c.getCid() %>)" class="list-group-item list-group-item-action"><%= c.getName() %></a>
    <%  }
    %>
 
 </div>

</div>

<div class="col-md-8" >
<div class="container text-center" id="loader">
<i class="fa fa-refresh fa-4x fa-spin"></i>
<h3 class="mt-2">Loading...</h3>
</div>
<div class="container-fluid" id="post-container">

</div>

</div>

</div>
</div>


<!-- Modal -->

<script>
$(document).ready(function(){
	 $(".unlikebutton").hide();
	let editStatus=false;
	$('#edit-profile-btn').click(function(){
           if(editStatus==false){
        	   $("#profile-details").hide();
        	   $("#profile-edit").show();
        	   editStatus=true;
        	   $(this).text("Back");
           }else{
        	   $("#profile-details").show();
        	   $("#profile-edit").hide();
        	   editStatus=false;
        	   $(this).text("Edit");
           }
	})
});
</script>	
<script>
function getPosts(catId){
	
	$.ajax({
		url: "load_posts.jsp", 
		data:{cid:catId},
		success: function(data, textStatus, jqXHR){
	    	console.log(data);
	    	$("#loader").hide();
	    	$('#post-container').html(data);
	    }
	});
}

$(document).ready(function(){
    
	getPosts(0);
});

</script>
<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>