<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/viewbook.css">
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-light navbar-#22316C">
		<!-- Brand -->
		<a class="navbar-brand" href="#"> <img class="rounded-circle"
			src="images/logo.jpg" width="30" height="30" alt="logo">
		</a>

		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#">Home </a></li>


			<!-- Dropdown -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> Service </a>
				<div class="dropdown-menu">
					<i><a class="dropdown-item" id="disabled">Subscribed</a></i> <a
						class="dropdown-item" href="ViewAvailableBooksSubscribed.jsp">Available
						books</a>

				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> Profile </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">Contact_info</a> <a
						class="dropdown-item" href="#">Logout</a>

				</div></li>
		</ul>
	</nav>
	<br>
	<center>
		<h1>Success! Files have been Successfully uploaded!</h1>
		<h4>You are now subscribed to our community Bookstagram</h4>
		<h4>Click on following link to view list of avaiable book!</h4>
		<h5>Happy Reading :)</h5>
		<button type="submit" id="bookListButton" class="btn btn-primary">View
			Available Books -></button>
	</center>
	<script type="text/javascript">
		document.getElementById("bookListButton").onclick = function() {
			location.href = "ViewAvailableBooksSubscribed.jsp";
		};
	</script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>