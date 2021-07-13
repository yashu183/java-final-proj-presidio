<%@page import="org.springframework.util.SystemPropertyUtils"%>
<%@page import="com.entity.Items"%>
<%@page import="java.util.*"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="com.controller.vegeShop"%>
<%@page import="com.entity.vegetablesShop"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>vege.page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
<style>
	.show1{
		position : absolute;
		bottom : 90px;
		left : -16px;
		width: 280px;
		height : auto;
		background-color: #fff;
		color : #fff;
		border-radius : 3%;
		padding: 20px;
		display : none;
		z-index:1;
		border : 1px solid #3d3d3d;
	}
	.para:hover .show1{
		display:block;
	}
	.para .show1:before{
		content:'';
		position:absolute;
		width : 20px;
		height : 20px;
		background-color : #fff;
		bottom : -10px;
		left : 222px;		
		border-right:1px solid #3d3d3d;
		border-bottom : 1px solid #3d3d3d;
		transform : rotate(45deg);
	}
	.dotted{
		position : absolute;
		bottom : 71px;
		left : 211px;
		background-color: #fff;
		font-size : 18px;
	}
/* 	.card-img-top:hover{
		width : 120%;
		overflow : hidden;
	} */
</style> 
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
          <a class="nav-link active" aria-current="page" href="#">Vegetables</a>
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
	      <a href = "/logout" class="btn btn-outline-light mx-3" type="submit">logout</a>
    </form>
    </div>
  </div>
</nav>

<div class="card-group pb-3">
<div style="z-index : 0" class = "container d-flex flex-wrap flex-row justify-content-between">
<%
	List<vegetablesShop> vegelist = (List)request.getAttribute("vegelis");
	for(int i = 0; i < vegelist.size(); i++){
		String name = (String)vegelist.get(i).getVname();
		int price = (int)vegelist.get(i).getVprice();
		String img = (String)vegelist.get(i).getVimg();
		String des = (String)vegelist.get(i).getVdes();
		String id = (String)vegelist.get(i).getVid();
		out.println("<div id = 'outer"+i+"' class='card shadow p-1 bg-white rounded' style='width: 248px; margin-top:10px; border : 1px solid #d3d3d3;'>");
		out.println("<img class='card-img-top' src="+img+" alt='Card image cap'height=200;>");
		out.println(" <div class='card-body'>");
		out.println("<h6 style='width:55%;' class='card-title d-inline-block mb-2'>"+name+"</h6>");
		out.print("<p style = 'font-size : 16px; width:45%; float : right;' class='card-text d-inline-block mb-0 ml-1'>"+ "<strong style='font-size : 18px;'>"+price+"/-</strong>"+"per kg" +"</p>");
		out.print("<div style = 'font-size : 15px; height:50px; overflow:hidden; text-align: justify;' class='text-muted para card-text mb-2'>"+"<div style = 'font-size : 15px;' class='show1 text-muted'>"+ "<h5 class='card-title mb-2'>"+name+"</h5>" +des+"</div>"+des + "..."+"</div>");
		out.print("<span class='dotted'>....</span>");
		//out.println("<a href = '/selectedItems?itemid="+id+"' id = 'select"+i+"' onclick = 'myfun("+i+")' class='btn btn-dark btn-block' style = 'width : 100%'>Add to cart</a>");
		//if(httpsession.getAttribute("selecteditemslist") != null){
			//System.out.println("in side if 1/.....");
/* 			if(httpsession.getAttribute("selecteditemslist") == null){
	    	    response.sendRedirect("/needLogin"); 
			} */
			/* else{ */
			LinkedHashSet<Items> itemlis = (LinkedHashSet<Items>)httpsession.getAttribute("selecteditemslist");
			int k = 0;
			if(itemlis != null){
			for(Items item : itemlis){
				if(item.getId().equals(id)){
					k = 1;
					break;
				}
			}
			if(k == 1){
				//System.out.println("in side if.....");
				out.println("<a id = 'remove"+i+"' onclick = 'myfun1("+i+","+'"'+id+'"'+")' class='btn btn-danger btn-block' style = 'width : 100%; display : block'>Remove from cart</a>");
				out.println("<a id = 'select"+i+"' onclick = 'myfun("+i+","+'"'+id+'"'+")' class='btn btn-dark btn-block' style = 'width : 100%; display : none;'>Add to cart</a>");
			}
		//}
		else{
			//System.out.println("in side else.....");
			out.println("<a id = 'select"+i+"' onclick = 'myfun("+i+","+'"'+id+'"'+")' class='btn btn-dark btn-block' style = 'width : 100%'>Add to cart</a>");
			out.println("<a id = 'remove"+i+"' onclick = 'myfun1("+i+","+'"'+id+'"'+")' class='btn btn-danger btn-block' style = 'width : 100%; display : none'>Remove from cart</a>");
		}
		}
		//out.println("<a id = 'remove"+i+"' onclick = 'myfun1("+i+")' class='btn btn-danger btn-block' style = 'width : 100%; display : none'>Remove from cart</a>");
		out.println("</div>");
		out.println("</div>");
	} 
%>
</div>
</div>
<script src="https://kit.fontawesome.com/8e81d008db.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
<script>
function myfun(i, id){
	//console.log("inside fun...");
//<%-- <%= System.out.println("Its working")%> --%>
	//request.setAttribute("id", id);
//<%-- 	'<%Session["itemid"] = /"' + id + '/";%>';
	// '<%Session["itemid"] = ' + id + ''   --%>
	// <%-- '<%Session["UserName"] = "' + userName + '"; %>'; --%>
	//console.log(id);
	const url = '/selectedItems?itemid='+id;
	console.log(url);
	fetch(url).then(res => res.json()).then(sam => {console.log(sam);})
	var s = "outer"+i;
	console.log(s);
	var di = document.getElementById(s);
	console.log(di);
	//di.style.border = '1px solid #000';
	var s1 = "select"+i;
	var sel = document.getElementById(s1);
	var s2 = "remove"+i;
	var del = document.getElementById(s2);
	sel.style.display = 'none';
	del.style.display = 'block';
}

function myfun1(i, id){
	const url = '/toRemoveItems?itemid='+id;
	console.log(url);
	fetch(url).then(res => res.json()).then(sam => {console.log(sam);})
	var s = "outer"+i;
	console.log(s);
	var di = document.getElementById(s);
	console.log(di);
	//di.style.border = '1px solid #d3d3d3';
	var s1 = "select"+i;
	var sel = document.getElementById(s1);
	var s2 = "remove"+i;
	var del = document.getElementById(s2);
	sel.style.display = 'block';
	del.style.display = 'none';
}
</script>
</html>