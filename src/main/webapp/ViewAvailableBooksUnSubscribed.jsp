 <%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cloudproject.beans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Available Books</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/viewbook.css">
</head>
<body>
	 <nav class="navbar navbar-expand-sm bg-light navbar-#22316C">
        <!-- Brand -->
        <a class="navbar-brand" href="#">
            <img class="rounded-circle" src="images/logo.jpg" width="30" height="30" alt="logo">
        </a>

        <!-- Links -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="WelcomeHomePage.jsp">Home
            </a>
          </li>


          <!-- Dropdown -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
              Service
            </a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href = "UploadBookForm.jsp">Subscribe</a>
              <a class="dropdown-item" href="ViewAvailableBooksUnSubscribed.jsp">Available books</a>
              
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
              Profile
            </a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">Contact_info</a>
              <a class="dropdown-item" href="UserLogin.jsp">Logout</a>

            </div>
          </li>
        </ul>
      </nav>
      <br>
      
 	<div class="row" >
 		<div class = "col-md-3"></div>
    	<div class = "col-md-6">
    		<center>
    		<h5>You are not subscribed to our community! </h5>
    		<h5><a href = "UploadBookForm.jsp">Subscribe now</a> to avail up to 12 free books every month.</h5>
    		<h7>You can still purchase book of your interest</h7>
    		</center>
    	</div>
    	<div class = "col-md-3"></div>
   	</div>
 	<br>
	<div class = "book_container">
		<table id = "book_list" class = "table table-bordered">
			<thead class="thead-dark">
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">Name of Book</th>
			      <th scope = "col"> Price </th>
			    </tr>
		  	</thead>
		</table>
		<div class = "row">
			<div class = "col-md-12" style = "margin-left:40%">
				<button type="submit" id = "purchaseButton" class="btn btn-primary">Purchase Now -></button>
			</div>	 	
	    </div>
	</div>
	<br>
 	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  	<script>
	$(document).ready(function(){
		
	        $.ajax({
	            type:'GET',
	            dataType:'json',
	            url : 'ListFileServlet',
	            success : function(data){
	                console.log("data - " + data);
	                $.each(data.bookList,function(i,obj)
	                {
	                var tr_data = "<tr> <th scope = 'row'><input type = 'checkbox' class = 'book-checkbox' name ="+ obj.value+ "> <img src='images/book.png' " +
	                		"alt='logo' height='20px' width='20px'><td>" +obj.value + "<td><i>4.99$</i><img src='images/buy.jpeg' " +
	                		"alt='logo' height='20px' width='20px'></tr>";
	                 $(tr_data).appendTo('#book_list'); 
	                });  
	            },
	            complete: function (data) {
	            }
	        });
	        
	        $('#purchaseButton').click(function(){
	        	var selectedFile = [];
	    		$('div input[type=checkbox]').each(function() {
	    		   if ($(this).is(":checked")) {
	    			   selectedFile.push($(this).attr('name'));
	    		   }
	    		});
	    	 	localStorage.setItem("selectedFile", JSON.stringify(selectedFile));
	    		window.location.href = "PaymentGateway.jsp"
	        });   
	     
	});
	</script>
</body>
</html>
 
 
 
 