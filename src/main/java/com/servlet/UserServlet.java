package com.servlet;

import java.io.IOException;


import com.User.UserDetails;
import com.dao.UserDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
		
		String n=request.getParameter("uname");  
		String e=request.getParameter("uemail");  
		String p=request.getParameter("upass");
		UserDetails us=new UserDetails();
		us.setUname(n);
		us.setUemail(e);
		us.setUpass(p);
		
		UserDao dao=new UserDao(DBConnect.getConn());
		boolean f=dao.addUser(us);
		HttpSession session;
		
		if(f) {
		
			session=request.getSession();
			session.setAttribute("reg-success", "registration Successfully done");
			response.sendRedirect("register.jsp");

		}
		
		else {
			session=request.getSession();
			session.setAttribute("reg-failed", "Internal Server error");
			response.sendRedirect("register.jsp");
			
		}
		
	}

}
