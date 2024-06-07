<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Login page</title>
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
						<h4>Login</h4>
						
						
				
    
    
					</div>
					<div class="card-body">
					
					
				

 
 
 
 

						<form action="loginServlet" method="post">
						
						 
							
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									name="uname1"
									aria-describedby="emailHelp" placeholder="Enter email">
								
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1" name="upass1"
									placeholder="Password">
							</div>
														<button type="submit" class="btn btn-primary">Submit</button>
						</form>


					</div>
				</div>

			</div>
		</div>
	</div>

	


</body>
</html>