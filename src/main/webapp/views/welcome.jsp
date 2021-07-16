<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.entity.Items"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>welcome.page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
<style>
	body{
		width : 100%;
		height : 100vh;
		margin : 0px;
		padding : 0px;
	}

.container{
	width : 90%;
	margin : auto;
}

.txt{
	margin-top : 8rem;
}

.footer{
	margin-top : 5rem;
}
</style>
</head>
<body>
<div class = "container">
	<div class = "row">
		<div class = "col-5 d-flex align-items-center">
			<div class = "text-center txt">
				<h3>One stop solution for all your needs...</h3>
				<p style = "my-3 font-size : 14px;">Welcome to Cartistic. Find all the required veges, fruits, groceries, households, kitchen utensils and electronics</p>
				<a href = '/loadvege' class = "btn btn-dark">visit vege page <span>></span></a>
			</div>
		</div>
		<div class = "col-7">
			<img src = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.dribbble.com%2Fusers%2F2749602%2Fscreenshots%2F7966253%2Fshot-cropped-1572865330028.png&f=1&nofb=1" >
		</div>
	</div>
</div>
	<div class = "footer w-100 text-center text-muted"">
		<h5>By YashwanthC</h5>
		contact me @ cyashu2000@gmail.com
	</div>
	<%-- <div class="container">
		<a href="/loadvege">click here to go to vege page</a>
	</div> --%>
</body>
</html>