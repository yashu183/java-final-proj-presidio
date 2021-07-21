<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"%>
    <%@page import="com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>users.page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">

<style>
.container{
  background-color : #f3f3f3;
  margin-top : 3rem;
}

.custom{
  width : 100%;
}

.people-nearby .google-maps{
  background: #f8f8f8;
  border-radius: 4px;
  border: 1px solid #f1f2f2;
  padding : 1.5rem;
  marggin-top : 2rem;
}

button{
  margin-top : 1.5rem;
  margin-left : 1rem;
  float : right;
}

.people-nearby .google-maps .map{
  height: 300px;
  width: 100%;
  border: none;
}

.people-nearby .nearby-user{
  border-top: 1px solid #f1f2f2;
}

img.profile-photo-lg{
  height: 90px;
  width: 80px;
  border-radius: 50%;
}

.nearby-user{
  padding : 1rem 0;
  width : 80%;
  margin : auto;
  border-bottom : 1px solid #d3d3d3;  
}

.status{
  margin-top : 2rem;
}

.middle{
  margin-top : 1rem;
}

.heading{
  width : 80%;
  border-bottom : 1px solid black;
  margin-right : auto;
  margin-left : auto;
  margin-top : 1rem;
  padding-bottom : 0.8rem;
}
.footer{
	padding-bottom : 2rem;
  padding-top : 2rem;
	font-size : 14px;
}
</style>

</head>

<body style="background-image : url('https://i2.wp.com/storage.googleapis.com/gweb-uniblog-publish-prod/images/Background.2e16d0ba.fill-1422x800.jpg'); width:100%; height: 100vh; background-position:center; background-size : cover; background-attachment: fixed;">

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
<div class="container border border-round shadow">
  <div class="row">
      <h4 class = "text-center heading">Users List</h4>
      <div class="col-md-8 custom">
          <div class="people-nearby">
    <% 
        HttpSession httpsession1 = request.getSession();

        if(httpsession.getAttribute("uid") != null){
          int uid = (int)httpsession.getAttribute("uid");
          List<User> userslist = (List<User>)httpsession1.getAttribute("userslist");
            for(int i = 0; i < userslist.size(); i++){
                int id = userslist.get(i).getUid();
                String name = userslist.get(i).getUname();
                int isAdmin = userslist.get(i).getIsAdmin();
                String email = userslist.get(i).getEmail();

                out.println("<div class = 'nearby-user'>");
                out.println("<div class = 'row'>");
                out.println("<div class = 'col-md-2 col-sm-2'>");
                out.println("<img src = 'https://bootdey.com/img/Content/avatar/avatar"+id+".png' class = 'profile-photo-lg'>");
                out.println("</div>");
                out.println("<div class = 'col-md-4 col-sm-4 middle'>");
                out.println("<h5>"+name+"</h5>");
                out.println("<p>"+email+"</p>");
                out.println("</div>");
                out.println("<div class = 'col-md-3 col-sm-3 status'>");
                if(isAdmin == 1){
                out.println("<h5>Admin</h5>");
                }
                else{
                  out.println("<h5>Not Admin</h5>");
                }
                out.println("</div>");
                out.println("<div class = 'col-md-3 col-sm-3'>");
                if(isAdmin == 0){
                out.println("<button onclick = 'makeAdmin("+id+")' class = 'btn btn-dark pull-right'>Make as Admin</button>");
                }
                else{
                  if(uid == i+1){
                    out.println("<button onclick = 'same("+id+")' class = 'btn btn-danger pull-right'>Remove as Admin</button>");
                  }
                  else{
                  out.println("<button onclick = 'rmvAdmin("+id+")' class = 'btn btn-danger pull-right'>Remove as Admin</button>");
                  }
                }
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
              }
        }
        
    %>
                </div>
          </div>
    </div>
  </div>
</div>
	<div class = "footer w-100 text-center text-muted"">
		<h5>By YashwanthC</h5>
	</div>
<script src="https://kit.fontawesome.com/8e81d008db.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

<script>
  function makeAdmin(id) {      
    const url = '/previliges?uid='+id;
    fetch(url).then(response => response.json()).then(res => {console.log(res);})
    alert("Updated successfully. Reload to see the updates");
  }

  function rmvAdmin(id) {
    const url = '/previliges?uid='+id;
    fetch(url).then(response => {console.log(response.json()+"rmvAdmin");})
    alert("Updated successfully. Reload to see the updates");
  }
  function same(id){
    alert("You cant remove yourself as Admin");
  }
</script>
</html>
    