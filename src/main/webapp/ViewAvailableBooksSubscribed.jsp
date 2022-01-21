
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cloudproject.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Available Books</title>
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
			<li class="nav-item"><a class="nav-link"
				href="WelcomeHomePage.jsp">Home </a></li>


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
						class="dropdown-item" href="UserLogin.jsp">Logout</a>

				</div></li>
		</ul>
	</nav>
	<br>

	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="margin-left: 130px;">
			<h5>
				Thank you so much for subscribing to our community Bookstagram
				</h1>
				<h7>You can select up to 12 books and receive 1 book every
				month for the next one year.
				</h3>
		</div>
		<div class="col-md-2"></div>
	</div>
	<br>
	<div class="book_container">
		<table id="book_list" class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Name of Book</th>
					<th scope="col">Price</th>
				</tr>
			</thead>
		</table>
		<div class="row">
			<div class="col-md-12" style="margin-left: 40%">
				<button type="submit" id="confirmButton" class="btn btn-primary"
					data-toggle="modal" data-target="#successModal">Confirm -></button>
			</div>
		</div>
	</div>
	<div class="modal fade" id="successModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Successfully
						Registered Books To Your Account!</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">We have sent one book to your
					registered email. You will receive each book per month for a year.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal"
						onClick="javascript:window.location='WelcomeHomePage.jsp'">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<br>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="js/viewBookList.js"></script>
</body>
</html>



