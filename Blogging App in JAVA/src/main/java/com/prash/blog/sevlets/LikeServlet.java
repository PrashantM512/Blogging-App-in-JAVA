package com.prash.blog.sevlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.prash.blog.dao.LikeDao;
import com.prash.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LikeServlet
 */
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       PrintWriter out=response.getWriter();
		
		String operation=request.getParameter("operation");
		
		int pid=Integer.parseInt(request.getParameter("pid"));
        int uid=Integer.parseInt(request.getParameter("uid"));
        
        
        LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
        
        if(operation.equals("like")) {
        	boolean f=ld.likePost(pid, uid);
        	 out.println(f);
        }
        
       
       
        

		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
