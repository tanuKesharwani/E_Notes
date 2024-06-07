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
							<a href="" class="btn btn-danger">Delete</a> <a href=""
								class="btn btn-primary">Edit</a>
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