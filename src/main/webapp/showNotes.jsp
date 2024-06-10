<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.User.AddDetails"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter" %>  
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%> 


<%@page import="java.util.*"%>
<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%

com.User.UserDetails user3 = (com.User.UserDetails) session.getAttribute("userD");

if (user3 == null) {

	response.sendRedirect("login.jsp");
	session.setAttribute("login-Error", "Please login..");
%>
<%
}
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShowNotes</title>
<%@include file="All_Componets/Allcss.jsp"%>
</head>

<body>
	<div class="container-fluid ">
		<%@include file="All_Componets/Navbar.jsp"%>
		
		<%String s1=(String)session.getAttribute("msg");
		if(s1!=null){
			
			%>
			
			<div class="alert alert-danger" role="alert"><%=s1%></div>
			
			<% 
			session.removeAttribute("msg");
		}
		
			String s2=(String)session.getAttribute("wmsg");
			
		
		if(s2!=null){
			%>
			<div class="alert alert-danger" role="alert"><%=s2%></div>
			
			<% 
			session.removeAttribute("wmsg");
		}
		%>
		
		
		<%-- 
		
		<%String s5=(String)session.getAttribute("msg7");
		if(s1!=null){
			
			%>
			
			<div class="alert alert-success" role="alert"><%=s1%></div>
			
			<% 
			session.removeAttribute("msg7");
		}
		
			String s6=(String)session.getAttribute("msg8");
			
		
		if(s2!=null){
			%>
			<div class="alert alert-danger" role="alert"><%=s2%></div>
			
			<% 
			session.removeAttribute("msg8");
		}
		%>
		
		 --%>
		
		
		

		<div class="row">
			<div class="col-md-12">
				<%
				if (user3 != null) {
					UserDao ob = new UserDao(DBConnect.getConn());
					List<AddDetails> post = ob.getUser(user3.getUserId());
					for (AddDetails po : post) {
						
          %>

<div class="card mt-3">
					<img alt="" src="img/hm.jpg" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px">
<div class="card-body p-4">





						<h5 class="card-title"><%=po.getTitle()%></h5>
						<p><%=po.getContent()%></p>
						<p>
							<b class="text-success">Published By:</b><%=user3.getUname() %><br> <b
								class="text-primary"></b>
						</p>

						<p>
							<b class="text-success">Published Date:</b><%
									  SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
						    Date date = new Date();  
						  
							
							%><%= formatter.format(date)  %><br> <b
								class="text-primary"></b>
						</p>
						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%= po.getId()%>" class="btn btn-danger">Delete</a> 
							<a href="edit.jsp?note_id=<%= po.getId() %>" class="btn btn-primary">Edit</a>
						</div>




					</div>
				</div>

<%


					}

				}
				%>
				
					
			</div>

		</div>
	</div>
</body>
</html>