<%@page import="com.User.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#">@RSK-BSL</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
		
	<%-- 	  <%
 com.User.UserDetails user1=(com.User.UserDetails)session.getAttribute("userD");
 
 if(user1!=null){
	 
	 
	 %>

		<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
				class="fa fa-home" aria-hidden="true"></i>Home <span
				class="sr-only">(current)</span></a></li>
	 
	 
	 
	 <%
 }
 else{
	 %>
	
	 <li class="nav-item active"><a class="nav-link" href="index.jsp"><i
		class="fa fa-home" aria-hidden="true"></i>Home <span
		class="sr-only">(current)</span></a></li>

  <%
 }
 %>
 
 --%>
 
 <%
			com.User.UserDetails user = (com.User.UserDetails) session.getAttribute("userD");
			if (user != null) {
				%>
				
				
		<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
				class="fa fa-home" aria-hidden="true"></i>Home <span
				class="sr-only">(current)</span></a></li>
				<%
			}
			else{
				%>
				 <li class="nav-item active"><a class="nav-link" href="index.jsp"><i
		class="fa fa-home" aria-hidden="true"></i>Home <span
		class="sr-only">(current)</span></a></li>
				<%
				
			}
			%>
			
 
 
			
			<li class="nav-item"><a class="nav-link" href="AddNotes.jsp"><i
					class="fa fa-plus-circle" aria-hidden="true"></i>Add Note</a></li>

			<li class="nav-item"><a class="nav-link" href="showNotes.jsp"><i
					class="fa fa-sticky-note" aria-hidden="true"></i>Show Note</a></li>
		</ul>

		<div>


			<!-- 	 <a href="login.jsp" class="btn btn-light"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</a>
    <a href="register.jsp" class="btn btn-light"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a>
 -->
			<%
			/* com.User.UserDetails user = (com.User.UserDetails) session.getAttribute("userD"); */
			if (user != null) {
			%>
			<a href="" class="btn btn-light" data-toggle="modal"
				data-target="#exampleModal"><i class="fa fa-user-circle"
				aria-hidden="true"></i><%=user.getUname()%></a> <a href="logoutServlet"
				class="btn btn-light"><i class="fa fa-sign-out"
				aria-hidden="true"></i>Logout</a>




			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">User Details</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							UserID:<%=user.getUserId()%>
							<br> name:<%=user.getUname()%>
							<br> Email-Id:<%=user.getUemail()%><br>




						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>





			<%
			} else {
			// If not logged in, show login button and registration button
			%>
			<a href="login.jsp" class="btn btn-light"><i
				class="fa fa-sign-in" aria-hidden="true"></i>Login</a> <a
				href="register.jsp" class="btn btn-light"><i
				class="fa fa-user-plus" aria-hidden="true"></i>Register</a>
			<%
			}
			%>



		</div>



		<!-- Button trigger modal -->


		<!-- Modal -->

	</div>
</nav>