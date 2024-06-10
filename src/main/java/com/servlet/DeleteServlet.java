package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBConnect;

public class DeleteServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer ID=Integer.parseInt(request.getParameter("note_id"));
		System.out.println(ID);
		UserDao u=new UserDao(DBConnect.getConn());
		boolean f=u.Deletenotes(ID);
		HttpSession session=null;
		if(f==true) {
			
			 session=request.getSession(); session.setAttribute("msg",
			 "Delete successfully"); response.sendRedirect("showNotes.jsp");
			 
			
			//System.out.println("deleted");
			
		}
		else {
			
			  session=request.getSession(); session.setAttribute("wmsg",
			  "something went wrong"); response.sendRedirect("showNotes.jsp");
			
			//System.out.println("not deleted");
			
		}
	}

	
}
