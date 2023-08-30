package com.prash.blog.sevlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.prash.blog.dao.UserDao;
import com.prash.blog.entities.Message;
import com.prash.blog.entities.User;
import com.prash.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            PrintWriter out=response.getWriter();
            String userEmail=request.getParameter("email");
            String userPassword=request.getParameter("password");
            
            UserDao dao=new UserDao(ConnectionProvider.con);
            User user=dao.getUserByEmailAndPassword(userEmail, userPassword);
            if(user==null) {
            	out.println("invalid details");
            	Message msg=new Message("Invalid Email & Password...Try again!!!","alert","alert-danger");
            	HttpSession session=request.getSession();
            	session.setAttribute("msg", msg);
            	response.sendRedirect("login_page.jsp");
            }else {
            	HttpSession session=request.getSession();
            	session.setAttribute("currentUser", user);
            	response.sendRedirect("profile.jsp");
            }
	}

}
