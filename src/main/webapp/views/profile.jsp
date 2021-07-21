<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.entity.User"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.controller.*" %>
<%@page import="org.hibernate.SessionFactory" %>
<%@page import = "com.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile.page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
<style>
	body{
    color: #1a202c;
    text-align: left;
    background-color: #e2e8f0;    
}
.main-body {
    padding: 15px;
}
.card {
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: .25rem;
}

.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1rem;
}

.gutters-sm {
    margin-right: -8px;
    margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
    padding-right: 8px;
    padding-left: 8px;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
}

.bg-gray-300 {
    background-color: #e2e8f0;
}
.h-100 {
    height: 100%!important;
}
.shadow-none {
    box-shadow: none!important;
}
	
.container{
	background-color : #f3f3f3;
}
	.footer{
  padding-bottom : 2rem;
  padding-top : 2rem;
	font-size : 14px;
}
</style>
</head>
<body style="background-image : url('https://i2.wp.com/storage.googleapis.com/gweb-uniblog-publish-prod/images/Background.2e16d0ba.fill-1422x800.jpg'); width:100%; background-position:center; background-size : cover; background-attachment: fixed;">

	<nav style="position : sticky; top : 0; z-index:1;" class="navbar  navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
    <a class="navbar-brand" style = "font-family: 'Dancing Script', cursive; font-weight : 600; font-size : 22px;" href="/views/welcome.jsp">Cartistic</a>
    <button class="navbar-toggler" type = "button" data-bs-toggle="collapse" data-bs-target="#navbarText">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/loadvege">Vegetables</a>
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
        	<a class="nav-link active" href="#"><i style="font-size : 26px;" class="fas fa-user"></i></a>
        </li>
      </ul>
	  <form  class="d-flex mr-3">
	      <a href = "/logout" class="btn btn-outline-light mx-3" type="submit">logout</a>
    </form>
    </div>
  </div>
</nav>
	
<div class = "mt-3 container border border-round shadow">
	<div class="main-body">
         <div class="row gutters-sm">
           <div class="col-md-4 mb-3">
             <div class="card">
               <div class="card-body">
                 <div class="d-flex flex-column align-items-center text-center">
                   <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="rounded-circle" width="150">
                   <div class="mt-3">
                     <% if(httpsession.getAttribute("userDetails") != null){
	                     User usr = (User)httpsession.getAttribute("userDetails");
	                     String uname = usr.getUname();
	                     String add = usr.getAddress();
	                     String status = usr.getIsAdmin() == 1 ? "Admin" : "Not Admin";
                     	out.println("<h4>"+uname+"</h4>");
                     	out.println("<p class = 'text-muted font-size-sm'>"+add+"</p>");
                     }
                     %>
                  
                     <button class="btn btn-dark btn-block">Edit Profile</button>
                   </div>
                 </div>
               </div>
             </div>
             <div class="card mt-3">
               <ul class="list-group list-group-flush">
                 <li class="list-group-item d-flex align-items-center flex-wrap">
                   <i style= "font-size: 26px; color : #2d88ff; margin-right : 0.5rem;" class="fas fa-globe"></i><h6 class="mb-0">Website</h6>
                   <span style = "float : right; margin-left : auto;" class="text-secondary">bootdey</span>
                 </li>
                 <li class="list-group-item d-flex align-items-center flex-wrap">
                   <i style= "font-size: 26px; margin-right : 0.5rem;" class="fab fa-github-square"></i><h6 class="mb-0">Github</h6>
                   <span style = "float : right; margin-left : auto;" class="text-secondary">bootdey</span>
                 </li>
                 <li class="list-group-item d-flex align-items-center flex-wrap">
                   <i style= "font-size: 26px; color : #00aced; margin-right : 0.5rem;" class="fab fa-twitter-square"></i><h6 class="mb-0">Twitter</h6>
                   <span style = "float : right; margin-left : auto;" class="text-secondary">bootdey</span>
                 </li>
                 <li class="list-group-item d-flex align-items-center flex-wrap">
                   <i style= "font-size: 26px; color : #E1306C; margin-right : 0.5rem;" class="fab fa-instagram-square"></i><h6 class="mb-0">Instagram</h6>
                   <span style = "float : right; margin-left : auto;" class="text-secondary">bootdey</span>
                 </li>
                 <li class="list-group-item d-flex align-items-center flex-wrap">
                   <i style= "font-size: 26px; color : #2d88ff; margin-right : 0.5rem;" class="fab fa-facebook-square"></i><h6 class="mb-0">Facebook</h6>
                   <span style = "float : right; margin-left : auto;" class="text-secondary">bootdey</span>
                 </li>
               </ul>
             </div>
           </div>
           <div class="col-md-8">
             <div class="card mb-3">
               <div class="card-body">
                 <div class="row">
                   <div class="col-sm-3">
                     <h6 class="mb-0">User Name</h6>
                   </div>
<!--                     <div class="col-sm-9 text-secondary">
                      Kenneth Valdez
                    </div> -->
                  <%if(httpsession.getAttribute("userDetails") != null){
                  	User usr1 = (User)httpsession.getAttribute("userDetails");
                  	String uname1 = usr1.getUname();
                  	out.println("<div class='col-sm-9 text-secondary'>"+uname1+"</div>"); 
                  }
                  %>
                 </div>
                 <hr>
                 <div class="row">
                   <div class="col-sm-3">
                     <h6 class="mb-0">Email</h6>
                   </div>
<!--                     <div class="col-sm-9 text-secondary">
                      fip@jukmuh.al
                    </div> -->
                  <%if(httpsession.getAttribute("userDetails") != null){
                  	User usr2 = (User)httpsession.getAttribute("userDetails");
                  	String email = usr2.getEmail();
                  	out.println("<div class='col-sm-9 text-secondary'>"+email+"</div>");
                  }
                  %>
                    <%-- <%= out.println("<div class='col-sm-9 text-secondary>"+email+"</div>") %> --%>
                 </div>
                 <hr>
                 <div class="row">
                   <div class="col-sm-3">
                     <h6 class="mb-0">Phone</h6>
                   </div>
<!--                     <div class="col-sm-9 text-secondary">
                      (239) 816-9029
                    </div> -->
                  <%if(httpsession.getAttribute("userDetails") != null){
                  	User usr3 = (User)httpsession.getAttribute("userDetails");
                  	String ph = usr3.getPhone();
                  	out.println("<div class='col-sm-9 text-secondary'>"+ph+"</div>");
                  }
                  %>
                   <%--  <%= out.println("<div class='col-sm-9 text-secondary>"+ph+"</div>") %> --%>
                 </div>
                 <hr>
                 <div class="row">
                   <div class="col-sm-3">
                     <h6 class="mb-0">Address</h6>
                   </div>
<!--                    <div class="col-sm-9 text-secondary">
                     Address Here
                   </div> -->
                  <%if(httpsession.getAttribute("userDetails") != null){
                  	User usr4 = (User)httpsession.getAttribute("userDetails");
                  	String address = usr4.getAddress();
                  	out.println("<div class='col-sm-9 text-secondary'>"+address+"</div>");
                  }
                  %>
                 </div>
                 <hr>
                 <div class="row">
                   <div class="col-sm-3">
                     <h6 class="mb-0">Admin Status</h6>
                   </div>
<!--                    <div class="col-sm-9 text-secondary">
                     Address Here
                   </div> -->
                  <%if(httpsession.getAttribute("userDetails") != null){
                  	User usr5 = (User)httpsession.getAttribute("userDetails");
                  	 String status = usr5.getIsAdmin() == 1 ? "Admin" : "Not Admin";
                  	out.println("<div class='col-sm-9 text-secondary'>"+status+"</div>");
                  }
                  %>
                 </div>
               </div>
             </div>
             <div class="row gutters-sm">
               <div class="col-sm-12 mb-3">
                 <div class="card h-100">
                   <div class="card-body">
                     <h6 class="d-flex align-items-center mb-3">Shopping History</h6>
                     <small>Web Design</small>
                     <div class="progress mb-3" style="height: 5px">
                       <div class="progress-bar bg-dark" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                     </div>
                     <small>Website Markup</small>
                     <div class="progress mb-3" style="height: 5px">
                       <div class="progress-bar bg-dark" role="progressbar" style="width: 72%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                     </div>
                     <small>One Page</small>
                     <div class="progress mb-3" style="height: 5px">
                       <div class="progress-bar bg-dark" role="progressbar" style="width: 89%" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
                     </div>
                     <small>Mobile Template</small>
                     <div class="progress mb-3" style="height: 5px">
                       <div class="progress-bar bg-dark" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                     </div>
                     <small>Backend API</small>
                     <div class="progress mb-3" style="height: 5px">
                       <div class="progress-bar bg-dark " role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                     </div>
                   </div>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>
</div>
</body>
	<div class = "footer w-100 text-center text-muted"">
		<h5>By YashwanthC</h5>
	</div>
<script src="https://kit.fontawesome.com/8e81d008db.js" crossorigin="anonymous"></script>
</html>