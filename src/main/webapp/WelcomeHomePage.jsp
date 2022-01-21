<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Welcome Home Page</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/home.css">
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
            <a class="nav-link" href="#">Home
            </a>
          </li>


          <!-- Dropdown -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
              Service
            </a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="UploadBookForm.jsp">Subscribe</a>
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

      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100 " src=images/img1.jpg alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/img2.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/img3.jpeg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="content">
  <h1 style="font-style:italic">About Us</h1>

  <p class="para">This is a community by the book lovers for book lovers.
    Join us and dive into the world of books.We beleive that every
    book lover should have easy access to the books they love and should
    have the chance to explore different genres of books.Be a part of our community
    by donating just one book to get free access  to 12 books of your choice from our collection throughout the year.Also
    You can go through the plethora of books available in our community to purchase any book of your choice.
  </p>
</div>
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
      </body>
      </html>
