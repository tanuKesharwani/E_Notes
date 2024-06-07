package com.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.User.UserDetails;


@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html"); 
		//PrintWriter out = response.getWriter();  
		String username=request.getParameter("uname1");
		String password=request.getParameter("upass1");

	RequestDispatcher dispatcher=null;

		try{  
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
				"jdbc:mysql://localhost:3306/actions","root","Tanu#110302");  
		      
		PreparedStatement ps=con.prepareStatement(  
		"select * from registration where Emaill=? and Password=?");  
		ps.setString(1,username);  
		ps.setString(2,password);  
		      
		ResultSet rs=ps.executeQuery();  
		UserDetails user=new UserDetails();
		
		HttpSession session;
		
		if(rs.next()) {
			user.setUserId(rs.getInt("UserId"));
			 user.setUname(rs.getString("Name"));
			 user.setUemail(rs.getString("Emaill"));
			 user.setUpass(rs.getString("Password"));
		     session=request.getSession();
			
		      session.setAttribute("userD", user);
//		      System.out.println(user);
//		      System.out.println(user.getUname());
//		      System.out.println(user.getUemail());
//		      System.out.println(user.getUpass());
		     // System.out.println(user.getUserId());
			  dispatcher = request.getRequestDispatcher("home.jsp");
			  dispatcher.include(request, response);
			  
			  
		}
		else {
		//	out.print("not found");
			 dispatcher = request.getRequestDispatcher("login.jsp");
             dispatcher.include(request, response); 
		}
		}catch(Exception e){System.out.println(e);}  
	
	}

}
