<%@page import="com.entity.Items"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="com.entity.GroceriesShop"%>
<%@page import="com.entity.HouseHoldUtensils"%>
<%@page import="com.entity.FruitsShop"%>
<%@page import="java.util.Map"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="com.controller.vegeShop"%>
<%@page import="com.entity.vegetablesShop"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>groceries.page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
<style>
	.show{
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
	.para:hover .show{
		display:block;
	}
	.para .show:before{
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

<nav style="position : sticky; top : 0; z-index:1;" class="navbar  navbar-expand-md navbar-dark bg-dark">
    <div class="container-fluid">
    <a class="navbar-brand" href="/views/welcome.jsp">E-Commers</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/loadvege">Vegetables</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#/loadfruits">Fruits</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/loadhouseholds">HouseHolds</a> 
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#">Groceries</a>
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
  		}
       }
      %>
      </ul>
      <ul style="float : right;" class="navbar-nav">
        <li class="nav-item" style="float : right;">
        	<a class="nav-link" href="loadcart"><i style="font-size : 26px;" class="fa fa-shopping-cart"></i></a>
        </li>
      </ul>
            <ul style="float : right;" class="navbar-nav">
        <li class="nav-item" style="float : right;">
        	<a class="nav-link" href="loadprofile"><i style="font-size : 26px;" class="fas fa-user"></i></a>
        </li>
      </ul>
	  <form class="d-flex mr-3">
	      <a href = "/logout" class="btn btn-outline-light mx-3" type="submit">logout</a>
    </form>
    </div>
  </div>
</nav>

<div class="card-group pb-3">
<div style="z-index : 0" class = "container d-flex flex-wrap flex-row justify-content-between">
<%
	List<GroceriesShop> vegelist = (List)request.getAttribute("fruitlis");
	for(int i = 0; i < vegelist.size(); i++){
		String name = (String)vegelist.get(i).getGname();
		int price = (int)vegelist.get(i).getGprice();
		String img = (String)vegelist.get(i).getGimg();
		String des = (String)vegelist.get(i).getGdes();
		String id = (String)vegelist.get(i).getGid();
		out.println("<div id = 'outer"+i+"' class='card shadow p-1 bg-white rounded' style='width: 248px; margin-top:10px; border : 1px solid #d3d3d3;'>");
		out.println("<img class='card-img-top' src="+img+" alt='Card image cap'height=200;>");
		out.println(" <div class='card-body'>");
		out.println("<h6 class='card-title d-inline-block mb-2'>"+name+"</h6>");
		out.print("<p style = 'font-size : 16px; float : right;' class='card-text d-inline-block mb-0 ml-1'>"+ "<strong style='font-size : 18px;'>"+price+"/-</strong>"+"</p>");
		out.print("<div style = 'font-size : 15px; height:50px; overflow:hidden; text-align: justify;' class='text-muted para card-text mb-2'>"+"<div style = 'font-size : 15px;' class='show text-muted'>"+ "<h5 class='card-title mb-2'>"+name+"</h5>" +des+"</div>"+des + "..."+"</div>");
		out.print("<span class='dotted'>....</span>");
		//out.println("<a id = 'select"+i+"' onclick = 'myfun("+i+","+'"'+id+'"'+")' class='btn btn-dark btn-block' style = 'width : 100%'>Add to cart</a>");
		//out.println("<a id = 'remove"+i+"' onclick = 'myfun1("+i+")' class='btn btn-danger btn-block' style = 'width : 100%; display : none'>Remove from cart</a>");
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
			System.out.println("in side if.....");
			out.println("<a id = 'remove"+i+"' onclick = 'myfun1("+i+","+'"'+id+'"'+")' class='btn btn-danger btn-block' style = 'width : 100%; display : block'>Remove from cart</a>");
			out.println("<a id = 'select"+i+"' onclick = 'myfun("+i+","+'"'+id+'"'+")' class='btn btn-dark btn-block' style = 'width : 100%; display : none;'>Add to cart</a>");
		}
	//}
	else{
		System.out.println("in side else.....");
		out.println("<a id = 'select"+i+"' onclick = 'myfun("+i+","+'"'+id+'"'+")' class='btn btn-dark btn-block' style = 'width : 100%'>Add to cart</a>");
		out.println("<a id = 'remove"+i+"' onclick = 'myfun1("+i+","+'"'+id+'"'+")' class='btn btn-danger btn-block' style = 'width : 100%; display : none'>Remove from cart</a>");
	}
	}
		out.println("</div>");
		out.println("</div>");
	} 
%>
</div>
</div>
<script src="https://kit.fontawesome.com/8e81d008db.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
</body>
<script>
function myfun(i, id){
	const url = '/selectedItems?itemid='+id;
	console.log(url);
	fetch(url).then(res => res.json()).then(sam => {console.log(sam);})
	var s = "outer"+i;
	console.log(s);
	var di = document.getElementById(s);
	console.log(di);
	//di.style.border = '1px solid #0d6efd';
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