<%@page import="com.prash.blog.helper.ConnectionProvider" %>
<%@page import="com.prash.blog.entities.User" %>
<%@page import="com.prash.blog.entities.*" %>
<%@page import="com.prash.blog.dao.PostDao" %>
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
	
	<div class="col-md-6">
	<div class="card">
	<img class="card-img-top" src="blog_pics/default.jpg" alt="Card image cap" >
	<div class="card-body">
	<b><%= p.getpTitle() %></b>
	<p><%= p.getpContent()%></p>
	<pre><%= p.getpCode() %></pre>
	
	</div>
	
	</div>
	</div>
	
	
<%	
}
%>
</div>