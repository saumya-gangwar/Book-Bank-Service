<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cloudproject.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/upload.css">
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
					<a class="dropdown-item" href="#">Subscribe</a> <a
						class="dropdown-item" href="ViewAvailableBooksUnSubscribed.jsp">Available
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



	<div class="container center">
		<div class="row">
			<div class="col-md-12">
				<h1 class="white">Subscribe to our community Bookstagram</h1>
				<p class="white">Add value to yourself and our community.</p>
				<p class="white">Upload atleast 1 pdf book of your choice and
					receive 1 book every month for the next one year.</p>
			</div>
		</div>

		<form name="upload" method="post" action="UploadFileServlet" id = "myForm"
			enctype="multipart/form-data" accept-charset="utf-8">
			<div class="row">
				<div class="col-md-12 col-md-offset-3 center">
					<div class="btn-container">
						<!--the three icons: default, ok file (img), error file (not an img)-->
						<h1 class="imgupload">
							<i class="fa fa-file-image-o"></i>
						</h1>
						<h1 class="imgupload ok">
							<i class="fa fa-check"></i>
						</h1>
						<h1 class="imgupload stop">
							<i class="fa fa-times"></i>
						</h1>
						<!--this field changes dinamically displaying the filename we are trying to upload-->
						<p id="namefile">Only pdfs of books allowed! (.pdf)</p>
						<!--our custom btn which which stays under the actual one-->
						<input type="file" value="" name="fileup" id="fileup" multiple>
						<button type="button" id="btnup" class="btn btn-primary btn-lg">Browse
							for your book!</button>
						<!--this is the actual file input, is set with opacity=0 beacause we wanna see our custom one-->
					</div>
				</div>
			</div>
			<!--additional fields-->
			<div class="row">
				<div class="col-md-12">
					<!--the defauld disabled btn and the actual one shown only if the three fields are valid-->
					<button type="submit"  class="btn btn-primary"
						id="submitbtn"> Submit! </button>
					<button type="button" class="btn btn-default" disabled="disabled"
						id="fakebtn">
						Submit! <i class="fa fa-minus-circle"></i>
					</button>
				</div>
			</div>
		</form>
		<div class="modal fade" id="successModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Files have
							been Successfully uploaded!</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					 <p>You are now subscribed to our community Bookstagram.</p>
					 <p>Click on following link to view list of available book!</p>
					 <p>Happy Reading :)</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							data-dismiss="modal"
							onClick="javascript:window.location='ViewAvailableBooksSubscribed.jsp'">View
								Available Books -></button>
						<button type="button" class="btn btn-secondary">Close</button>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="js/upload.js"></script>

</body>
</html>
