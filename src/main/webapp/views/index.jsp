<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login.page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<style>
	.footer{
	margin-top : 2.5rem;
	font-size : 14px;
}
</style>
</head>
<body style="width : 100%; background-image : url('https://i2.wp.com/storage.googleapis.com/gweb-uniblog-publish-prod/images/Background.2e16d0ba.fill-1422x800.jpg')">
<div style="width : 100%; margin-top : 10%;">
	<div class = "shadow mx-auto mt-5 p-3 pb-0 bg-white rounded" style="width : 35%; border : 1px solid #d3d3d3; box-shadow : ">
	<%
	HttpSession httpsession = request.getSession();
	if(httpsession.getAttribute("loginfailed") != null){
		if((boolean)httpsession.getAttribute("loginfailed")){
			out.println("<div class = 'alert alert-danger' role = 'alert'>");
			out.println("Username or Password is wrong. Please try again!!");
			out.println("</div>");
		}
	}
	
	if(httpsession.getAttribute("notfound") != null){
		if((boolean)httpsession.getAttribute("notfound")){
			out.println("<div class = 'alert alert-warning' role = 'alert'>");
			out.println("Your record doesn't exsist. Please try registering first by clicking signup below!!");
			out.println("</div>");
		}
	}
%>
	<h3 class="text-center">Login Form</h3>
		<form method = "post" action = "loginCheck" commandName = "loginBean" class="mt-2 w-40">
		    <div class="form-group">
		        <label for="name">Email</label><br>
		        <input class="form-control" type="text" name = "email" id="name" placeholder="Enter your email">
		    </div>
		    <div class="form-group">
		        <label for="password">Password</label><br>
		        <input class="form-control mb-2" type="password" name = "upass" id="password" placeholder="Enter Password">
		    </div>
		    <input class="btn w-100 mb-2" style="background-color : #3d3d3d; color : #c9d1d9;" type="submit" value = "login"/><br>
		    New User? <a style="color : #161b22;" href = "/views/register.jsp">signup here</a>
		</form>
		<br>
	</div> 
</div>
	<div class = "footer w-100 text-center text-muted"">
		<h5>By YashwanthC</h5>
	</div>
</body>
</html>