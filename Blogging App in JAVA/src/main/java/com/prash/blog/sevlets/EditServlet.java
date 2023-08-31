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
import java.sql.SQLException;

import com.prash.blog.dao.UserDao;
import com.prash.blog.entities.User;
import com.prash.blog.helper.ConnectionProvider;
import com.prash.blog.helper.Helper;


@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
       	UserDao dao=new UserDao(ConnectionProvider.getConnection());
		
		String name=request.getParameter("user_name");
		String password=request.getParameter("user_password");
		String status=request.getParameter("user_status");
		Part part=request.getPart("user_img");
		String profile=part.getSubmittedFileName();
	
		
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentUser");
		user.setName(name);
		user.setPassword(password);
		user.setAbout(status);
		user.setProfile(profile);
		
		try {
			if(dao.editUser(user)) {
				String path=getServletContext().getRealPath("/")+"pics"+File.separator+user.getProfile();
			
				
				if(Helper.deleteFile(path)) {
					out.print("deleted");
				}else {
					out.print("not deleted");
				}
				
				if(Helper.saveFile(part.getInputStream(), path)) {
					
					out.print("updated");
				}else {
					out.print("not saved");
				}
					
			
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
