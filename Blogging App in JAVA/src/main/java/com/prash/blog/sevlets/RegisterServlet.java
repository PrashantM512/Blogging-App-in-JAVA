package com.prash.blog.sevlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.prash.blog.entities.User;
import com.prash.blog.helper.ConnectionProvider;
import com.prash.blog.dao.*;
/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
	        try (PrintWriter out = response.getWriter()) {
	            out.println("<!DOCTYPE html>"); // Corrected closing angle bracket
	            out.println("<html>");
	            out.println("<head>");
	            out.println("<title>RegisterServlet</title>");
	            out.println("</head>");
	            out.println("<body>");

	            String check = request.getParameter("check");
	            UserDao userdao=new UserDao(ConnectionProvider.con);
	            if(check==null) {
	            	
	            	 String flg="no";
	            	   ServletContext cntxt=getServletContext();
	            	   cntxt.setAttribute("flg",flg);
	            	   response.sendRedirect("register_page.jsp");
	            }else {
	            	
	            	String name=request.getParameter("user_name");
	            	String email=request.getParameter("user_email");
	            	String password=request.getParameter("user_password");
	            	String gender=request.getParameter("gender");
	            	String about=request.getParameter("about");
	            	
	            	User user=new User(name,email,password,gender,about);
	            	
	               if(userdao.saveUser(user)) {
	            	   
	            	   String flg="yes";
	            	   ServletContext cntxt=getServletContext();
	            	   cntxt.setAttribute("flg",flg);
	            	   response.sendRedirect("login_page.jsp");
	            	   
	            	   
	               }else {
	            	  
	            	   String flg="yes";
	            	   ServletContext cntxt=getServletContext();
	            	   cntxt.setAttribute("flg",flg);
	            	   response.sendRedirect("register_page.jsp");
	               }
	            }
	            

	            out.println("</body>");
	            out.println("</html>");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
