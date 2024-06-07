<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
   
  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img{
background: url("img/bg.jpg");
width:100%;
height:80vh;
background-repeat: no-repeat;
background-size: cover;

}
</style>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="All_Componets/Allcss.jsp"%>
</head>
<body>
<%@include file="All_Componets/Navbar.jsp"%>
<div class="container-fluid back-img">

<div class="text-center text-white">
<h2><i class="fa fa-book" aria-hidden="true"></i>E Notes-Save Your Notes </h2>
<!-- <div >
<a href="login.jsp"class="btn btn-light"><i class="fa fa-user-circle" aria-hidden="true"></i>Login</a>
<a href="register.jsp"class="btn btn-light"><i class="fa fa-user-plus" aria-hidden="true"></i>sRegister</a>
</div> -->

</div>
</div>

<%@include file="All_Componets/footer.jsp"%>

</body>
</html>