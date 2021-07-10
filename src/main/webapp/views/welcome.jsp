<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.entity.Items"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<a href="/loadvege">click here to go to vege page</a>
<%-- <%
	List<Items> vegelist = (List)request.getAttribute("itemlis");
	for(int i = 0; i < vegelist.size(); i++){
		String name = (String)vegelist.get(i).getName();
		int price = (int)vegelist.get(i).getPrice();
		String img = (String)vegelist.get(i).getImg();
		out.println("<div id = 'outer"+i+"' class='card m-4 shadow p-3 mb-5 bg-white rounded' style='width: 30%; border : 1px solid #d3d3d3;'>");
		out.println("<img class='card-img-top' src="+img+" alt='Card image cap'height=200;>");
		out.println(" <div class='card-body'>");
		out.println("<h5 class='card-title'>"+name+"</h5>");
		out.print("<p style = 'font-size : 20px;' class='card-text'>"+"Price per unit : "+ "<strong>"+price+"</strong>" +"</p>");
		out.println("<a href='#' id = 'select"+i+"' onclick = 'myfun("+i+")' class='btn btn-primary btn-block' style = 'width : 100%'>Add to cart</a>");
		out.println("<a href='#' id = 'remove"+i+"' onclick = 'myfun1("+i+")' class='btn btn-danger btn-block' style = 'width : 100%; display : none'>Remove from cart</a>");
		out.println("</div>");
		out.println("</div>");
	} 
%> --%>
</div>
</body>
<script>
function myfun(i){
	var s = "outer"+i;
	console.log(s);
	var di = document.getElementById(s);
	console.log(di);
	di.style.border = '1px solid #0d6efd';
	var s1 = "select"+i;
	var sel = document.getElementById(s1);
	var s2 = "remove"+i;
	var del = document.getElementById(s2);
	sel.style.display = 'none';
	del.style.display = 'block';
}

function myfun1(i){
	var s = "outer"+i;
	console.log(s);
	var di = document.getElementById(s);
	console.log(di);
	di.style.border = '1px solid #d3d3d3';
	var s1 = "select"+i;
	var sel = document.getElementById(s1);
	var s2 = "remove"+i;
	var del = document.getElementById(s2);
	sel.style.display = 'block';
	del.style.display = 'none';
}
</script>
</html>