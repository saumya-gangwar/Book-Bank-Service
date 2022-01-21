<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Payment Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js"
	crossorigin="anonymous"></script>
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
					<a class="dropdown-item" href="upload.html">Subscribe</a> <a
						class="dropdown-item" href="#">Available books</a>

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

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-4 offset-md-4">
				<div class="card ">
					<div class="card-header">
						<div class="row">
							<h3 class="text-xs-center">Payment Details</h3>
							<img class="img-fluid cc-img"
								src="http://www.prepbootstrap.com/Content/images/shared/misc/creditcardicons.png">
						</div>
					</div>
					<div class="card-block">
						<form role="form">
							<div class="row">
								<div class="col-xs-12">
									<div class="form-group">
										<label>CARD NUMBER</label>
										<div class="input-group">
											<input type="tel" class="form-control"
												placeholder="Valid Card Number"> <span
												class="input-group-addon"><span
												class="fa fa-credit-card"></span></span>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-7 col-md-7">
									<div class="form-group">
										<label><span class="hidden-xs">EXPIRATION</span><span
											class="visible-xs-inline">EXP</span> DATE</label> <input type="tel"
											class="form-control" placeholder="MM / YY">
									</div>
								</div>
								<div class="col-xs-5 col-md-5 float-xs-right">
									<div class="form-group">
										<label>CV CODE</label> <input type="tel" class="form-control"
											placeholder="CVC">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="form-group">
										<label>CARD OWNER</label> <input type="text"
											class="form-control" placeholder="Card Owner Names">
									</div>
								</div>
							</div>

						</form>
					</div>
					<div class="card-footer">
						<div class="row">
							<div class="col-xs-12">
								<button class="btn btn-primary btn-lg btn-block"
									id="processButton" data-toggle="modal"
									data-target="#successModal">Process payment</button>
							</div>
						</div>
					</div>
					<div class="modal fade" id="successModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Successfully Payment Received!</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">We have sent books to your registered email</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal" onClick = "javascript:window.location='WelcomeHomePage.jsp'">Close</button>
									<button type="button" class="btn btn-primary">Save
										changes</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<style>
.cc-img {
	margin: 0 auto;
}
</style>
	<script>
		$(document).ready(function() {
			
			selectedFile = JSON.parse(localStorage.getItem("selectedFile"));
			console.log(selectedFile);
			 $('#processButton').click(function() {
				 $.ajax({
					type : 'POST',
					dataType : 'JSON',
					url : 'SendEmailPaymentServlet',
					data : {
						selectedFile : JSON.stringify(selectedFile)
					},
					success : function(data) {

					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus);
					}
				});
			});	
		});
	</script>
	<br>
	<br>
	<br>
</body>
</html>
