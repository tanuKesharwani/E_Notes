package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.User.AddDetails;
import com.User.UserDetails;

/**
 * Servlet implementation class AddNotesServlet
 */

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html"); 
		
		PrintWriter out = response.getWriter();  
		UserDetails use=new UserDetails();
	
			int User=Integer.parseInt(request.getParameter("uid"));
//			System.out.println(User);
			String n=request.getParameter("title");  
		    String e=request.getParameter("content");  			
			System.out.println(n+""+e);
		out.print(n+""+e+"");
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con1=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/actions","root","Tanu#110302");
		//	HttpSession session;
		//	session=request.getSession();
	
			
			
		PreparedStatement ps=con1.prepareStatement(  
	"insert into AddNote(UserId,Question,Solution) values(?,?,?)");  
	    ps.setInt(1,User);
		 ps.setString(2,n);  
		ps.setString(3,e);  
	
			int i=ps.executeUpdate(); 
		
		AddDetails ad=new AddDetails();	
			
	    
			if(i>0)  {
			   out.print("You are successfully added notes");  
			   
				
				
				
				
				
		     
			}
			else {
				request.setAttribute("status", "failed");
			}
		          
			}catch (Exception e2) {System.out.println(e2);}
			          
			out.close();  
		
	}

}
