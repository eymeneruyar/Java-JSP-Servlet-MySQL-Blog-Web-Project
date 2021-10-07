<%@ page import="Properties.Author" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="util" class ="Utils.Util"></jsp:useBean>
<% Author author = util.isLogin(request,response);%>


<!DOCTYPE html>
<head>
  <title>Şifre Değiştir</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <!--===============================================================================================-->
  <link rel="icon" type="image/png" href="loginScreen/images/icons/favicon.ico"/>
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="loginScreen/vendor/bootstrap/css/bootstrap.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="loginScreen/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="loginScreen/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="loginScreen/vendor/animate/animate.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="loginScreen/vendor/css-hamburgers/hamburgers.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="loginScreen/vendor/animsition/css/animsition.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="loginScreen/vendor/select2/select2.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="loginScreen/vendor/daterangepicker/daterangepicker.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="loginScreen/css/util.css">
  <link rel="stylesheet" type="text/css" href="loginScreen/css/main.css">
  <!--===============================================================================================-->

  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MyBlog - Home Page</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="homePage/assets/img/favicon.png" rel="icon">
  <link href="homePage/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="homePage/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="homePage/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="homePage/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="homePage/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="homePage/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="homePage/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="homePage/assets/css/style.css" rel="stylesheet">


</head>
<body>

<style>
  .navbar .dropdown ul a:hover, .navbar .dropdown ul .active:hover, .navbar .dropdown ul li:hover > a {
    color: gray;
  }
  .navbar a:hover, .navbar .active, .navbar .active:focus, .navbar li:hover > a {
    color: gray;
  }
</style>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-center header-inner-page">
  <div class="container d-flex align-items-center justify-content-between ">

    <div class="logo">
      <h1><a href="index.jsp">My Blog</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
    </div>

    <nav id="navbar" class="navbar">
      <ul>
        <li><a class="nav-link scrollto" href="index.jsp#hero">Ana Sayfa</a></li>
        <li><a class="nav-link scrollto" href="index.jsp#about">Hakkımızda</a></li>
        <li><a class="nav-link scrollto " href="index.jsp#portfolio">Blog</a></li>
        <li><a class="nav-link scrollto" href="index.jsp#team">Takım</a></li>
        <li><a class="nav-link scrollto" href="index.jsp#contact">İletişim</a></li>

        <!-- Check the enter admin of blog -->
        <c:if test="${aid == null}">
          <li><a class="nav-link scrollto" href="login-servlet" >Giriş Yap</a></li>
        </c:if>

        <c:if test="${aid != null}">
          <li class="dropdown"><a href="#"><span>Profil</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="editScreen.jsp">Ekle/Düzenle</a></li>
              <li><a href="messageBoxScreen.jsp">Gelen Kutusu</a></li>
              <li><a class="active" href="#">Şifre Değiştir</a></li>
              <li><a href="logout-servlet">Çıkış Yap</a></li>
              <% Author a = util.isLogin(request,response);%>
            </ul>
          </li>
          <li class="nav-link scrollto ">
            <a class="nav-link" tabindex="-1" aria-disabled="true"><%=a.getName() + " " + a.getSurname()%></a>
          </li>
        </c:if>
        <!-- Check the enter admin of blog -->

      </ul>
      <i class="bi bi-list mobile-nav-toggle"></i>
    </nav><!-- .navbar -->

  </div>
</header><!-- End Header -->

<div class="limiter">
  <div class="container-login100" style="background-image: url('loginScreen/images/bg-01.jpg');">
    <div class="wrap-login100 p-t-30 p-b-50">
      <span class="login100-form-title p-b-41">Şifre Değiştir</span>

      <%
        Object changeObj = request.getAttribute("changePasswordError");
        if(changeObj != null){
          String passwordError = "" + changeObj;
      %>

      <div class = "alert alert-danger alert-dismissible fade show" role ="alert">
        <strong>Hata! </strong> <%=passwordError%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>

      <% } %>

      <form action="change-password-servlet" method="post" class="login100-form validate-form p-b-33 p-t-5">

        <div class="wrap-input100 validate-input" data-validate="Enter password">
          <input class="input100" type="password" name="oldPassword" placeholder="Eski Şifre" required>
          <span class="focus-input100" data-placeholder="&#xe80f;"></span>
        </div>

        <div class="wrap-input100 validate-input" data-validate="Enter password">
          <input class="input100" type="password" name="newPassword" placeholder="Yeni Şifre" required>
          <span class="focus-input100" data-placeholder="&#xe80f;"></span>
        </div>

        <div class="wrap-input100 validate-input" data-validate="Enter password">
          <input class="input100" type="password" name="reNewPassword" placeholder="Yeni Şifre (Tekrar)" required>
          <span class="focus-input100" data-placeholder="&#xe80f;"></span>
        </div>



        <div class="container-login100-form-btn m-t-32">
          <button class="login100-form-btn">Kaydet</button>
        </div>

      </form>
    </div>
  </div>
</div>


<div id="dropDownSelect1"></div>

<!-- Vendor JS Files -->
<script src="homePage/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="homePage/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="homePage/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="homePage/assets/vendor/php-email-form/validate.js"></script>
<script src="homePage/assets/vendor/swiper/swiper-bundle.min.js"></script>

<!-- Template Main JS File -->
<script src="homePage/assets/js/main.js"></script>

<script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<!--===============================================================================================-->
<script src="loginScreen/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="loginScreen/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="loginScreen/vendor/bootstrap/js/popper.js"></script>
<script src="loginScreen/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="loginScreen/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="loginScreen/vendor/daterangepicker/moment.min.js"></script>
<script src="loginScreen/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="loginScreen/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="loginScreen/js/main.js"></script>

<script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


</body>
</html>