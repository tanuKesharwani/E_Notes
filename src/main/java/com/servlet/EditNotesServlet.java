package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.UserDao;
import com.db.DBConnect;

/**
 * Servlet implementation class EditNotesServlet
 */

@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		 int id=Integer.parseInt(request.getParameter("note_id"));
		 String title=request.getParameter("tittle");
		 String content=request.getParameter("content");
		//out.println(id+" "+" "+title+""+content);
		UserDao us=new UserDao(DBConnect.getConn());
		boolean f=us.updateuser(id,title,content);
		
		HttpSession session=null;
		if(f) {
//			System.err.println("update successfully");
			 session=request.getSession(); session.setAttribute("msg7",
					 "Update  successfully"); response.sendRedirect("showNotes.jsp");
		}
		else {
			//System.out.println("not update succssfully");
			 session=request.getSession(); session.setAttribute("msg8",
					 "Server error found"); response.sendRedirect("showNotes.jsp");
		}
		
		
		
		
	}

}
