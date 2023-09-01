package com.prash.blog.sevlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.prash.blog.dao.PostDao;
import com.prash.blog.dao.UserDao;
import com.prash.blog.entities.Post;
import com.prash.blog.entities.User;
import com.prash.blog.helper.ConnectionProvider;
import com.prash.blog.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		int cid=Integer.parseInt(request.getParameter("cid"));
		String pTitle=request.getParameter("pTitle");
		String pContent=request.getParameter("pContent");
		String pCode=request.getParameter("pCode");
		Part part=request.getPart("pic");
		String pic=part.getSubmittedFileName();
		
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("currentUser");
		
		int userId=user.getId();
		
		Post post=new Post(pTitle,pContent,pCode,pic,cid,userId);
		
		PostDao pd=new PostDao(ConnectionProvider.getConnection());
		if(pd.savePost(post)) {
			out.println("Post submitted");
			String path=getServletContext().getRealPath("/")+"blog_pics"+File.separator+pic;
		    Helper.saveFile(part.getInputStream(), path);
		    out.println("image file stored");
		}else{
			out.println("Post not submitted");
		}
	}

}
