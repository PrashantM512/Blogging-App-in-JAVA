<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<title>Register</title>
<style>
.jumbotron{
color:black;
}
</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="jumbotron primary-colour text-white banner-background" style="background-image: linear-gradient(45deg, black, transparent);     padding-top: 2%;">
<main>
<div class="container" style=" color: black;">
<div class="col-md-4 offset-md-4">
<div class="card" style="width: 120%;">
<div class="card-header h4  text-white primary-colour" style="background-image: linear-gradient(45deg, black, transparent)!important;"><i class="fa-solid fa-circle-user fa-sm" style="color: #f5f9ff;"></i>&nbsp;Register</div>
<div class="card-body" style="line-height: 1!important;">
<form action="RegisterServlet" method="POST">
  <div class="mb-3">
  <label for="user_name class="form-label">Username</label>
    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  
  <div class="mb-3">
    <label for="gender" class="for-gender">Gender</label><br>
    <input type="radio" id="gender" name="gender" value="male">&nbsp;Male&nbsp;&nbsp;
    <input type="radio" id="gender" name="gender" value="female">&nbsp;Female
  
    </div>
  
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
  </div>
  
  <div class="mb-3">
    <label for="about" class="form-label">About</label>
  <textarea name="about" class="form-control" placeholder="Enter something about yourself..." rows="3" cols=""></textarea>
  </div>
  
  
  <div class="mb-3 form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</div>
</div>
</div>
</main>
</div>

<%
    ServletContext cntxt = getServletContext();
    String flg = (String) cntxt.getAttribute("flg");
    out.print(flg);
    
    if (flg != null) {
%>
    <script>
        $(document).ready(function() {
            <% if (flg.equals("yes")) { %>
                swal("Registration Unsuccessful", "Don't leave fields empty or email address already exits...", "error")
                .then(function() {
                   
                    <% 
                        cntxt.removeAttribute("flg");
                    %>
                });
            <% } else if (flg.equals("no")) { %>
                swal("Registration Unsuccessful", "Please accept the terms and conditions...", "warning")
                .then(function() {
                  
                    <% 
                        cntxt.removeAttribute("flg");
                    %>
                });
            <% } %>
        });
    </script>
<%
    }
%>

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