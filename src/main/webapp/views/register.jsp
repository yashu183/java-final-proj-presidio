<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register.page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body  style="width : 100%; background-image : url('https://i2.wp.com/storage.googleapis.com/gweb-uniblog-publish-prod/images/Background.2e16d0ba.fill-1422x800.jpg')">
<div  style="width : 100%">
	<div class = "mx-auto mt-5 shadow p-3 mb-5 bg-white rounded " style="width : 35%; border : 1px solid #d3d3d3">
		<h3 class="text-center">Registration Form</h3>
		<form method = "post" action = "/registerAction" commandName = "registerBean" class="mt-2 w-40">
		    <div class="form-group">
		        <label for="name">Username</label><br>
		        <input class="form-control" type="text" id="name" name = "uname" placeholder="Enter name">
		    </div>
			<br>
		    <div class="form-group">
		        <label for="email">Email</label><br>
		        <input class="form-control" type="email" id="email" name = "email" placeholder="Enter your email">
		    </div>
		    <br>
		    
		    <div class="form-group">
		        <label for="password">Password</label><br>
		        <input class="form-control" type="password" id="password" name = "upass" placeholder="Enter Password">
		    </div>
		    <br>
		    
		    <div class="form-group">
		        <label for="phone">Phone Number</label><br>
		        <input class="form-control" type="text" id="phone" name = "phnum" placeholder="Enter your phone number with country code">
		    </div>
		    <br>
		    <input class="btn w-100" style="background-color : #3d3d3d; color : #c9d1d9" type="submit" value = "Register"/>
		</form>
	</div> 
</div>
</body>
</html>