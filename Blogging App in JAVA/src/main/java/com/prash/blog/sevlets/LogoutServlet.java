package com.prash.blog.sevlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.prash.blog.entities.Message;


public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

     HttpSession s=request.getSession();
     s.removeAttribute("currentUser");
     
     Message msg=new Message("Successfully logout...","success","alert-success");
     request.setAttribute("msg", msg);
     
     response.sendRedirect("login_page.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
