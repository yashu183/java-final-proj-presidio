<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>need.login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
</head>
<body style = "width : 100%; height : 100vh; background : #FFE4EA">
	<div style = "color : #9F6C66" class = 'p-3 container'>
		<div style = "margin : auto; height : auto;">
			<img style = "display : block; margin : auto;" src = "https://i.imgur.com/FOeYt4E.png" width = "400" height = "400" alt = "can't proceed further">
			<div class = "text-center">
				<h3>This Page is Buried in the Sand</h3>
				<h5 class = 'mt-3'>OOPS!!! It looks like session got expired or you are trying to navigate with out logging in</h5>
				<a href="/showloginpage" class = "mt-3 btn btn-dark">Login here</a>
			</div>
		</div>
	<div>
</body>
</html>