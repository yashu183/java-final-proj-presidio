<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.entity.Items"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>shopcart.page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style>
.container{
	background-color : #fff;
}

	tr:hover{
		background-color : #dfdfdf;
	}
	strong{
		margin-right : 2rem;
	}
	
.table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}
.nomargin{
	margin-top : 2rem;
	margin-left : 6rem;
}
@media screen and (max-width: 600px) {
    table#cart tbody td .form-control{
		width:20%;
		display: inline !important;
	}
	.actions .btn{
		width:36%;
		margin:1.5em 0;
	}
	
	.actions .btn-info{
		float:left;
	}
	.actions .btn-danger{
		float:right;
	}
	
	table#cart thead { display: none; }
	table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
	table#cart tbody tr td:first-child { background: #333; color: #fff; }
	table#cart tbody td:before {
		content: attr(data-th); font-weight: bold;
		display: inline-block; width: 8rem;
	}
	
	table#cart tfoot td{display:block; }
	table#cart tfoot td .btn{display:block;}
	
}
</style>
</head>
<body style="background-image : url('https://i2.wp.com/storage.googleapis.com/gweb-uniblog-publish-prod/images/Background.2e16d0ba.fill-1422x800.jpg'); width:100%; height: 100vh; background-position:center; background-size : cover; background-attachment: fixed;">

<nav style="position : sticky; top : 0; z-index:1;" class="navbar  navbar-expand-md navbar-dark bg-dark">
    <div class="container-fluid">
    <a class="navbar-brand" style = "font-family: 'Dancing Script', cursive; font-weight : 600; font-size : 22px;" href="/views/welcome.jsp">Cartistic</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
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
        	<a class="nav-link active" href="#"><i style="font-size : 26px;" class="fa fa-shopping-cart"></i></a>
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

<div class="container mt-4 rounded shadow">
<table id="cart" class="table table-hover table-condensed">
	<thead>
		<tr>
			<th style="width:50%">Product</th>
			<th style="width:10%">Price</th>
			<th style="width:8%">Quantity</th>
			<th style="width:22%" class="text-center">Subtotal</th>
			<th style="width:10%"></th>
		</tr> 
	</thead>
	<tbody>
<%
	if(httpsession.getAttribute("selecteditemslist") != null){
	LinkedHashSet<Items> itemlis = (LinkedHashSet<Items>)httpsession.getAttribute("selecteditemslist");
	int ttlpr = 0;	
	if(itemlis != null){
			for(Items item : itemlis){
				ttlpr += item.getPrice();
				out.println("<tr>");
				out.println("<td data-th='Product'>");
				out.println("<div class='row'>");
				out.println("<div class = 'col-sm-2 hidden-xs'><img src='"+item.getImg()+"' width = '100' height = '100' class = 'img-responsive'/></div>");
				out.println("<div class = 'col-sm-10'>");
				out.println("<h4 class = 'nomargin'>"+item.getName()+"</h4>");
				/* out.println("<p>"+itemlis.get(i).getDes()+"</p>"); */
				out.println("</div>");
				out.println("</div>");
				out.println("</td>");
				out.println("<td class = 'itmprice' data-th = 'Price'>"+item.getPrice()+"/-</td>");
				out.println("<td data-th = 'Quantity'>");
				out.println("<input onclick = 'fun()' type = 'number' class = 'form-control text-center' min='1' value = '1'>");
				out.println("</td>");
				out.println("<td data-th = 'Subtotal' class = 'text-center subttl'>"+item.getPrice()+"/-</td>");
				out.println("<td class = 'actions' data-th = ''>");
				out.println("<a href = '/rmvItems?itemid="+item.getId()+"' class = 'btn btn-danger btn-sm'><i class = 'fa fa-trash'></i></a>");
				out.println("</td>");
				out.println("</tr>");
			}
			out.println("</tbody>");
			out.println("<tfoot>");
			out.println("<tr>");
			out.println("<td><a href='#' class = 'btn btn-warning'><i class = 'fa fa-angle-left'></i> Continue Shopping</a></td>");
			out.println("<td colspan = '2' class = 'hidden-xs'></td>");
			//out.println("<td class = 'hidden-xs text-center'><strong>Total")
			out.println("<td class = 'hidden-xs text-center'><strong id = 'ttl'>Total : "+ttlpr+"/-</strong></td>");
			out.println("<td><a href = '#' class = 'btn btn-block btn-success'> Checkout <i class = 'fa fa-angle-right'></i></a></td>");
			out.println("</tr>");
			out.println("</tfoot>");
			out.println("</table>");
		}
		else{
			response.sendRedirect("needLogin");
		}
	}
	else{
		out.println("your cart is empty");
	}
%>
<%-- 	</tbody>
		<tfoot>
		<tr>
			<td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
			<td colspan="2" class="hidden-xs"></td>
			<%= out.println("<td class = 'hidden-xs text-center'><strong>Total"+ttlpr+"/-</strong></td>") %>
			<td class="hidden-xs text-center"><strong>Total</strong></td>
			<td><a href="#" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
		</tr>
	</tfoot>
	</table> --%>
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
function fun(){
	console.log("inside fun");
	const ip = document.getElementsByTagName("input");
	const st = document.getElementsByClassName("subttl");
	const pr = document.getElementsByClassName("itmprice");
	//console.log(ip);
	//ip.forEach(x => console.log(x.value));
	console.log(ip,st,pr);
	for(var i = 0; i < ip.length-1; i++){
		console.log(ip[i].value);
		console.log(st[i].innerHTML.slice(0,st[i].innerHTML.length-2));
		console.log(pr[i].innerHTML.slice(0,st[i].innerHTML.length-2));
		var ipidx = ip[i].value;
		var stidx = parseInt(st[i].innerHTML.slice(0,st[i].innerHTML.length-2));
		var pridx = parseInt(pr[i].innerHTML.slice(0,st[i].innerHTML.length-2));
		st[i].innerHTML = ipidx*pridx+"/-";
	}
	//6 - length-2
	var ttl = document.getElementById("ttl");
	//console.log(ttl.innerHTML);
	//console.log(ttl.innerHTML.slice(6, ttl.innerHTML.length-2));
	var ttlval = parseInt(ttl.innerHTML.slice(6, ttl.innerHTML.length-2));
	//console.log(ttlval);
	var temp = 0;
	for(var i = 0; i < st.length; i++){
		temp += parseInt(st[i].innerHTML.slice(0,st[i].innerHTML.length-2));
	}
	ttl.innerHTML = "Total "+temp+"/-";
}
</script>

</html>