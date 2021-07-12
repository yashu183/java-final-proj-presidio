<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>users.page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
</head>

<body style="background-image : url('https://i2.wp.com/storage.googleapis.com/gweb-uniblog-publish-prod/images/Background.2e16d0ba.fill-1422x800.jpg'); width:100%; height: 100vh; background-position:center; background-size : cover; background-attachment: fixed;">

    <nav style="position : sticky; top : 0; z-index:1;" class="navbar  navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
        <a class="navbar-brand" href="/views/welcome.jsp">E-Commers</a>
        <button class="navbar-toggler" type = "button" data-bs-toggle="collapse" data-bs-target="#navbarText">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="/loadvege">Vegetables</a>
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
                out.print("<a class = 'nav-link active' href='#'>"+ "Users" +"</a>");
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
                <a class="nav-link" href="loadprofile"><i style="font-size : 26px;" class="fas fa-user"></i></a>
            </li>
          </ul>
          <form  class="d-flex mr-3">
              <a href = "/logout" class="btn btn-outline-light mx-3" type="submit">logout</a>
        </form>
        </div>
      </div>
    </nav>

    <!-- users here -->

    <% 
        HttpSession httpsession = request.getSession();
        List<User> userslist = (List<User>)httpsession.getAttribute("userslist");
            for(int i = 0; i < userslist.length; i++){
                
            }
    %>

</body>
<script src="https://kit.fontawesome.com/8e81d008db.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>
    