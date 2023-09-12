<%@page import="com.prash.blog.helper.ConnectionProvider" %>
<%@page import="com.prash.blog.entities.User" %>
<%@page import="com.prash.blog.entities.*" %>
<%@page import="com.prash.blog.dao.PostDao" %>
<%@page import="com.prash.blog.dao.LikeDao" %>
 <%@page import="java.util.*" %>

<div class="row">
<% 
PostDao pd=new PostDao(ConnectionProvider.getConnection());

int cid=Integer.parseInt(request.getParameter("cid"));

List<Post> list=null;
if(cid==0){
	 list=pd.getAllPost();
}else{
	list=pd.getPostById(cid);
}
if(list.size()==0){ 
	out.println("<h3>No Posts in this category<h3>");
}

for(Post p:list){ %>
	
	<div class="col-md-6" style="padding-bottom: 10px;">
	<div class="card" >
	<img class="card-img-top" src="blog_pics/default.jpg" alt="Card image cap" >
	<div class="card-body">
	<b><%= p.getpTitle() %></b>
	<p><%= p.getpContent()%></p>
<%-- 	<pre><%= p.getpCode() %></pre> --%>
	</div>
	<div class="card-footer text-center bg-light">
	<%
	 User user=(User)session.getAttribute("currentUser");
	 LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
	 int likesCount=ld.likesCount(p.getPid());
	 
	%>
	<a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn likebutton btn-outline-primary btn-sm"><i class="fa fa-thumbs-up"></i><span class="like-counter-<%=p.getPid() %>"><%=likesCount %></span></a>
	
<a href="#!" onclick="UnLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn unlikebutton btn-outline-primary btn-sm"><i class="fa fa-thumbs-up"></i><span class="like-counter-<%=p.getPid() %>"><%=likesCount %></span></a>
	
	<a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-sm">Read More</a>
	
	<a href="" class="btn btn-outline-primary btn-sm"><i class="fa fa-comment"></i><span>10</span></a>
	</div>
	
	</div>
	</div>
	
	
<%	
}
%>
</div>
<script>
$(document).ready(function(){
	 $(".unlikebutton").hide();
}
</script>