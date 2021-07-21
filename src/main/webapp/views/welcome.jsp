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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
<mvc:resources location="/resources/" mapping="/resource/**"/>
<style>
	body{
		width : 100%;
		height : 100vh;
		margin : 0px;
		padding : 0px;
		background-color : #CDF0EA; 
	}

.container{
	width : 90%;
	margin : auto;
}

.footer{
	margin-top : 2.5rem;
	font-size : 14px;
}
.footer h5{
	font-size : 18px;
}
</style>
</head>
<body>

<nav style="position : sticky; top : 0; z-index:1;" class="navbar  navbar-expand-lg navbar-light">
    <div class="container-fluid">
    <a class="navbar-brand" style = "font-family: 'Dancing Script', cursive; font-weight : 600; font-size : 24px;" href="/views/welcome.jsp">Cartistic</a>
    <button class="navbar-toggler" type = "button" data-bs-toggle="collapse" data-bs-target="#navbarText">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="loadvege">Vegetables</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/loadfruits">Fruits</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/loadhouseholds">HouseHolds</a> 
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/loadgroceries">Groceries</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/loadelectronics">Electronics</a>
        </li>
       <%
        HttpSession httpsession = request.getSession();
       if(httpsession.getAttribute("admin") == null){
    	   System.out.println("inside null condition");
/*      	   ModelAndView mandv = new ModelAndView();
    	   mandv.setViewName("needLogin"); */ 
    	    response.sendRedirect("/needLogin"); 
       }
       else{
    	   System.out.println("outside null condition");
       	boolean isAdmin = (boolean)httpsession.getAttribute("admin");
        	//boolean isAdmin = (boolean)request.getAttribute("isAdmin");
        	System.out.println(isAdmin);
  		if(isAdmin){
  	      	out.print("<li class = 'nav-item'>");
  	      	out.print("<a class = 'nav-link' href='/loadsetdata'>"+ "Add Items" +"</a>");
  	      	out.print("</li>");
			out.print("<li class = 'nav-item'>");
			out.print("<a class = 'nav-link' href='/userslist'>"+ "Users" +"</a>");
			out.print("</li>");
  		}
       }
      %>
      </ul>
      <ul style="float : right;" class="navbar-nav">
        <li class="nav-item" style="float : right;">
        	<a href="/loadcart" class="nav-link"><i style="font-size : 26px;" class="fa fa-shopping-cart"></i></a>
        </li>
      </ul>
      <ul style="float : right;" class="navbar-nav">
        <li class="nav-item" style="float : right;">
        	<a class="nav-link" href="/loadprofile"><i style="font-size : 26px;" class="fas fa-user"></i></a>
        </li>
      </ul>
	  <form  class="d-flex mr-3">
	      <a href = "/logout" class="btn btn-secondary mx-3" type="submit">logout</a>
    </form>
    </div>
  </div>
</nav>

<div class = "container">
	<div class = "row">
		<div class = "col-5 d-flex align-items-center">
			<div class = "text-center txt">
				<h1 style = "font-family: 'Dancing Script', cursive; font-weight : 600; font-size : 78px;">Cartistic</h1>
				<h3>One stop solution for all your needs...</h3>
				<p style = "my-3 font-size : 14px;">Welcome to Cartistic. Find all the required veges, fruits, groceries, households, kitchen utensils and electronics</p>
				<a style = "font-size : 18px; position : relative; padding-right : 3rem;" href = '/loadvege' class = "btn btn-dark">visit vege page <span><i style = "position : absolute; top : 25%; margin-left : 0.7rem; font-size : 20px;" class="fas fa-arrow-right"></i></span></a>
			</div>
		</div>
		<div class = "col-7">
			<img src = "/img/output-onlinepngtools.png">
		</div>
	</div>
</div>
	<div class = "footer w-100 text-center text-muted"">
		<h5>By YashwanthC</h5>
		contact me at : cyashu2000@gmail.com
	</div>
	<%-- <div class="container">
		<a href="/loadvege">click here to go to vege page</a>
	</div> --%>
<script src="https://kit.fontawesome.com/8e81d008db.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>