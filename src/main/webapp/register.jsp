<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Register page</title>
<%@include file="All_Componets/Allcss.jsp"%>
</head>
<body>
	<%@include file="All_Componets/Navbar.jsp"%>
	<div class="container-fluid">
	
	<div class="row">
	<div class="col-md-6 offset-md-3">
	<div class="card">
		<div class="card-header text-white text-center bg-custom mt-4">
		<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
		<h4>Registration</h4>
		
	
		</div>
		
		
		
		
			
		<%
		String s2=(String)session.getAttribute("reg-success");
		if(s2!=null){
			%>
			
			<div class="alert alert-success" role="alert"><%=s2 %>
 
</div>
			
			<% 
		session.removeAttribute("reg-success");
		}
		
		%>
		
		
		<%
		String s1=(String)session.getAttribute("reg-failed");
		if(s1!=null){
			%>
			
			<div class="alert alert-danger" role="alert"><%=s1 %>
	
</div>
			
			<% 
			session.removeAttribute("reg-failed");
		}
		
		%>
		
		
		
		
		
		
		
		
			<div class="card-body">
				<form action="UserServlet" method="post">
				<div class="form-group">
						<label for="exampleInputEmail1">Enter Your name</label> <input
							type="text" class="form-control" id="name1" name="uname"
							aria-describedby="emailHelp" placeholder="Enter Name">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							type="email" class="form-control" name="uemail"
							aria-describedby="emailHelp" placeholder="Enter email"> 
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control"  name="upass"id="exampleInputPassword1"
							placeholder="Password">
					</div>
					
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>

			
		</div>
	</div>
	
	</div>
	</div></div>




</body>
</html>