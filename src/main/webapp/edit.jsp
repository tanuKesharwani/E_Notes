<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.User.AddDetails"%>
<% %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
     <%
 com.User.UserDetails user1=(com.User.UserDetails)session.getAttribute("userD");
 
 if(user1==null){
	 response.sendRedirect("login.jsp");
	 session.setAttribute("login-Error", "Please login..");
	 
 }

 
 
 
 
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="All_Componets/Allcss.jsp"%>
</head>
<body>


<% Integer noteid=Integer.parseInt(request.getParameter("note_id"));
	UserDao us=new UserDao(DBConnect.getConn());
	AddDetails ad=us.getDatabyID(noteid);





%>
<div class="container-fluid ">
<%@include file="All_Componets/Navbar.jsp"%>

<h1 class="text-center mt-2">Edit Your Notes Here</h1>



<div class="container">
<div class="row">
<div class="col-md-12">


<form action="EditNotesServlet" method="post">
 
 <input type="hidden" name="note_id" value="<%=noteid%>">
 
 <div class="form-group">
 <%
 if(user!=null){
	 %>
	   <input type="hidden" value="<%=user1.getUserId()%>" name="uid">
	 
	 
	 <%
 }
 
 
 
 %>
   <div class="form-group">
    <label for="exampleInputEmail1">Enter Title</label><br>
    <input type="text" name="tittle" class="form-control" value="<%=ad.getTitle()%>">
    
  </div>
  </div>
  <div class="form-group">
 
   <div class="form-group">
    <label for="exampleInputEmail1">Enter Content</label>
    
  </div>
    <textarea rows="9" cols="" class="form-control" id="cont"  name="content" ><%=ad.getContent()%></textarea>
    
  </div>
 
 <div class="container text-center">
   <button type="submit" class="btn btn-primary">Add Notes</button>
 </div>

</form>
</div>
</div></div>
</div>
</body>
</html>