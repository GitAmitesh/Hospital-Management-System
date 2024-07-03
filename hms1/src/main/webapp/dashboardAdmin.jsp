<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
  <!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- 
    - primary meta tags
  -->
  <title>Admin Dashboard</title>
  <meta name="title" content="Doclab - home">
  <!-- 
    - favicon
  -->
  <!-- <link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml"> -->
	
	<!-- Bootstrap link -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
  <!-- 
    - google font link
  -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500;700&family=Rubik:wght@400;500;700&display=swap"
    rel="stylesheet">

  <!-- 
    - custom css link
  -->
  <link rel="stylesheet" href="./assets/css/style.css">

  <!-- 
    - preload images
  -->
  <link rel="preload" as="image" href="./assets/images/hero-banner.png">
  <link rel="preload" as="image" href="./assets/images/hero-bg.png">
  <style>
   /* Add the following styles to your CSS stylesheet or in a <style> tag in your HTML */

  .dropdown-menu {
    /* Increase the width of the dropdown menu */
    width: 200px; /* Adjust the width as needed */
    /* Center align the dropdown menu */
    text-align: center;
  }

  .dropdown-item {
    /* Increase the font size of the dropdown items */
    font-size: 16px; /* Adjust the font size as needed */
    /* Center align the text within the dropdown items */
    text-align: center;
  }
  </style>

</head>

<body id="top">

  <!-- 
    - #PRELOADER
  -->

  <div class="preloader" data-preloader>
    <div class="circle"></div>
  </div>





  <!-- 
    - #HEADER
  -->

  <header id="home" class="header" data-header>
    <div class="container">

      <a href="index.html" class="logo">
        <h2 style="color: white; font-weight: bold;">AIIMS</h2>
      </a>

      <nav class="navbar" data-navbar>

        <ul class="navbar-list">
        
        	<li class="nav-item dropdown">
          <a style="font-size:1.8rem; color:white; font-weight:bold;" class="nav-link" href="index.html" id="navbarDropdownMenuLink">
            Home
          </a></li>

          <li class="nav-item dropdown">
          <a style="font-size:1.8rem; color:white; font-weight:bold;" class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Doctor
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="viewDoctor.jsp" target="_blank">View doctors</a></li>
            <li><a class="dropdown-item" href="registerDoctor.jsp" target="_blank">Add doctor</a></li>
          </ul>
        </li>
          <li class="nav-item dropdown">
          <a style="font-size:1.8rem; color:white; font-weight:bold;" class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Patient
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="viewPatient.jsp" target="_blank">View patients</a></li>
            <li><a class="dropdown-item" href="registerPatient.jsp" target="_blank">Add patient</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a style="font-size:1.8rem; color:white; font-weight:bold;" class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Receptionists
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="viewReceptionist.jsp" target="_blank">View receptionists</a></li>
            <li><a class="dropdown-item" href="registerReceptionist.jsp" target="_blank">Add receptionist</a></li>
          </ul>
        </li>
        <!-- <li class="nav-item dropdown">
          <a style="font-size:1.8rem; color:white; font-weight:bold;" class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Appointments
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="#">View appointments</a></li>
            <li><a class="dropdown-item" href="#">Add appointment</a></li>
          </ul>
        </li>-->
        
        <li class="nav-item dropdown">
          <a style="font-size:1.8rem; color:white; font-weight:bold;" class="nav-link" href="changePassword.jsp" id="navbarDropdownMenuLink" target="_blank">
            Change Password
          </a></li>
		
        </ul>

      </nav>

      <div class="overlay" data-nav-toggler data-overlay></div>

    </div>
  </header>





  <main>
    <article>

      <!-- 
        - #HERO
      -->

      <section class="section hero"  aria-label="home">
        <div class="container">

          <div class="hero-content">

            <p class="hero-subtitle has-before" data-reveal="left" style="font-size: 30px;">Welcome To AIIMS</p>

            <h1 class="headline-lg hero-title" data-reveal="left">
              Admin Panel
            </h1>


          </div>

          <figure class="hero-banner" data-reveal="right">
            <img src="./assets/images/hero-banner.png" width="590" height="517" loading="eager" alt="hero banner"
              class="w-100">
          </figure>

        </div>
      </section>
	</article>
	
	
  <!-- 
    - custom js link
  -->
  <script src="./assets/js/script.js"></script>

  <!-- 
    - ionicon link
  -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	
</main>
</body>
</html>

