<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.prash.blog.helper.ConnectionProvider" %>
<%@page import="com.prash.blog.entities.User" %>
<%@page import="com.prash.blog.entities.Categories" %>
<%@page import="com.prash.blog.dao.PostDao" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%
   User user=(User)session.getAttribute("currentUser");
    if(user==null){
    	response.sendRedirect("login_page.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
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

<title>Welcome</title>
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
          <a class="nav-link" data-bs-toggle="modal" data-bs-target="#post-modal" href="#">Post Blog</a>
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
        
       <!--  <form class="form-inline my-2 my-lg-0">
            Move the search form to the right using the "ml-auto" class
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0 search-btn" type="submit">Search</button>
        </form> -->
    </div>
</nav>


<div class="container-fluid p-0 m-0" >
<div class="jumbotron primary-colour text-white banner-background" style="background-image: linear-gradient(45deg, black, transparent);">
<div class="container">
<div class="container">
<h3 class="display-3">Welcome To BlogMuse</h3>
<P>Welcome to a world of inspiration, creativity, and knowledge. This is a place where words come to life, where ideas take flight, and where stories unfold. Our blogging platform is a canvas for dreamers, thinkers, and storytellers. Here, you'll find a tapestry of thoughts woven by diverse minds from around the globe. Embrace the power of words as they transport you to different worlds, challenge your perspectives, and ignite your passions. From thought-provoking essays to heartwarming anecdotes, we invite you to explore the myriad of voices that make up this community.</P>
<p>Join us on a journey of discovery, connection, and growth. Whether you're here to share your wisdom, learn from others, or simply immerse yourself in the beauty of language, this is your sanctuary. Together, we celebrate the magic that happens when thoughts find their voice. Start reading, start writing, and start exploring the boundless horizons of human expression. Your story matters, and this is where it begins</p>
<button class="btn btn-outline-light btn-lg">Let's Start</button>
<a href="login_page.jsp" class="btn btn-outline-light btn-lg" >Login</a>
</div>
</div>
</div>
</div>
<div class="container">
<div class="row mb-2">
<div class="col-md-4">
<div class="card">
<!--   <img src="..." class="card-img-top" alt="..."> -->
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read More</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card">
<!--   <img src="..." class="card-img-top" alt="..."> -->
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read More</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card">
<!--   <img src="..." class="card-img-top" alt="..."> -->
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read More</a>
  </div>
</div>
</div>
</div>
<div class="row">
<div class="col-md-4">
<div class="card">
<!--   <img src="..." class="card-img-top" alt="..."> -->
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read More</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card">
<!--   <img src="..." class="card-img-top" alt="..."> -->
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read More</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card">
<!--   <img src="..." class="card-img-top" alt="..."> -->
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Read More</a>
  </div>
</div>
</div>
</div>

</div>

<% 

if (user != null) {
%>

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
      <h3 class="modal-title fs-5  text-center" id="exampleModalLabel">
      
    	   <%=user.getName().substring(0,1).toUpperCase() %><%=user.getName().substring(1)%>
    	  
      </h3>
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
<td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail() %>"></td>
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


<!--- post modal --->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Post Your Creativity</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
      <form id="add-post-form" action="AddPostServlet" enctype="multipart/form-data" method="post">
      <div class="form-group">
     
 <select name="cid" class="btn btn-outline-primary form-control dropdown-toggle" aria-label="Large select example">
   <option selected disabled>Select Category</option>
  <%
  PostDao pd=new PostDao(ConnectionProvider.getConnection());
  ArrayList<Categories> list=pd.getAllCategories();
  
  for(Categories c:list){ %>
  <option value="<%=c.getCid()%>"> <%= c.getName() %></option>
<%  }
%>

 </select>
</div>
      
      <div class="form-group">
      <input type="text" name="pTitle" placeholder="Enter Post Title" class="form-control">
      </div>
      <div class="form-group">
      <textarea class="form-control" name="pContent" rows="4" placeholder="Enter Post content"></textarea>
      </div>
      <div class="form-group">
      <textarea class="form-control" name="pCode" rows="4" placeholder="Enter Your Code (if any)"></textarea>
      </div>
       <div class="form-group">
       <label>Upload image for post :</label><br>
       <input name="pic" type="file">
       </div>
      
      <div >
<button type="submit" style="width: 100%;" class="btn btn-outline-primary">Post</button>
</div>
      
      </form>
      
      </div>
      <!-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
    </div>
  </div>
</div>





<%
}
%>

 <%
        // Check if the attribute is present and remove it
        if (request.getAttribute("flg") != null) {
            request.removeAttribute("flg");
        }
    %>
   
   <script>
   $(document).ready(function(){
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