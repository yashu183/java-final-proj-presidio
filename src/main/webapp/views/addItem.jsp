<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddItem.page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body  style="width : 100%; background-image : url('https://i2.wp.com/storage.googleapis.com/gweb-uniblog-publish-prod/images/Background.2e16d0ba.fill-1422x800.jpg')">

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
  	      	out.print("<li class = 'nav-item active'>");
  	      	out.print("<a class = 'nav-link active' href='/loadsetdata'>"+ "Add Items" +"</a>");
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
        	<a class="nav-link" href="#"><i style="font-size : 26px;" class="fas fa-user"></i></a>
        </li>
      </ul>
	  <form class="d-flex mr-3">
	      <a href = "/logout" class="btn btn-outline-light mx-3" type="submit">logout</a>
    </form>
    </div>
  </div>
</nav>

<div  style="width : 100%">
	<div class = "mx-auto mt-5 shadow p-3 mb-5 bg-white rounded " style="width : 35%; border : 1px solid #d3d3d3">
		<h3 class="text-center">Add Item Form</h3>
		<form method = "post" action = "additems" commandName = "addItemBean" class="mt-2 w-40">
            <div class="form-group mb-3">
		        <label for="id">Item ID</label><br>
		        <input class="form-control" type="text" id="id" name = "id" placeholder="Enter Item ID">
		    </div>
		    <div class="form-group mb-3">
		        <label for="name">Item Name</label><br>
		        <input class="form-control" type="text" id="name" name = "name" placeholder="Enter Item Name">
		    </div>
		    <div class="form-group mb-3">
		        <label for="des">Item Description</label><br>
		        <textarea row="5" class="form-control" type="text" id="des" name = "des" placeholder="Enter Item description"></textarea>
		    </div>
		    
		    <div class="form-group mb-3">
		        <label for="price">Item Price</label><br>
		        <input class="form-control" type="number" id="price" name = "price" placeholder="Enter Item Price">
		    </div>
		    
		    <div class="form-group mb-3">
		        <label for="img">Image Link</label><br>
		        <input class="form-control" type="text" id="img" name = "img" placeholder="Enter Item image link">
		    </div>
			<div class="form-group mb-3">
		        <label for="category">Category</label><br>
		        <!-- <input class="form-control" type="text" id="category" name = "category" placeholder="Enter Item category"> -->
				<select name = "category" class="form-control">
					<option>Select the category...</option>
					<option value = "vegetables">Vegetable</option>
					<option value = "fruits">Fruit</option>
					<option value = "households">Household</option>
					<option value = "groceries">Groceries</option>
					<option value = "electronics">Electronics</option>
				  </select>
		    </div>
		    <input class="btn w-100" style="background-color : #3d3d3d; color : #c9d1d9" type="submit" value = "Add Item"/>
		</form>
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
</html>