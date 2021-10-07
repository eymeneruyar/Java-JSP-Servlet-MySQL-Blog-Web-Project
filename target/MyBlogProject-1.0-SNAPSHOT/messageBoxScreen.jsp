<%@ page import="Properties.Author" %>
<%@ page import="Properties.Article" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="util" class ="Utils.Util"></jsp:useBean>
<jsp:useBean id="dbUtil" class="Utils.DBUtil"></jsp:useBean>
<% Author author = util.isLogin(request,response);%>
<% Article article = new Article(); %>

<html>
<head>

  <title>Edit Blog</title>

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Portfolio Details - Alstar Bootstrap Template</title>
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

  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>


<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-center header-inner-page">
  <div class="container d-flex align-items-center justify-content-between ">

    <div class="logo">
      <h1><a href="index.jsp">My Blog</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
    </div>

    <style>
      .navbar .dropdown ul a:hover, .navbar .dropdown ul .active:hover, .navbar .dropdown ul li:hover > a {
        color: gray;
      }
      .navbar a:hover, .navbar .active, .navbar .active:focus, .navbar li:hover > a {
        color: gray;
      }
    </style>

    <% int aid = author.getAid(); %>

    <nav id="navbar" class="navbar">
      <ul>
        <li><a class="nav-link scrollto " href="index.jsp#hero">Ana Sayfa</a></li>
        <li><a class="nav-link scrollto" href="index.jsp#about">Hakkımızda</a></li>
        <li><a class="nav-link scrollto " href="index.jsp#portfolio">Blog</a></li>
        <li><a class="nav-link scrollto" href="index.jsp#team">Takım</a></li>
        <li><a class="nav-link scrollto" href="index.jsp#contact">İletişim</a></li>
        <li class="dropdown "><a href="#"><span>Profil</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
            <li><a class="active" href="editScreen.jsp">Ekle/Düzenle</a></li>
            <li><a class="active" href="messageBoxScreen.jsp">Gelen Kutusu</a></li>
            <li><a href="change-password-servlet">Şifre Değiştir</a></li>
            <li><a href="logout-servlet">Çıkış Yap</a></li>
          </ul>
        </li>

        <li class="nav-link scrollto ">
          <a class="nav-link" tabindex="-1" aria-disabled="true"><%=author.getName() + " " + author.getSurname()%></a>
        </li>

      </ul>
      <i class="bi bi-list mobile-nav-toggle"></i>
    </nav><!-- .navbar -->

  </div>
</header><!-- End Header -->

<main id="main">

  <!-- ======= Breadcrumbs Section ======= -->
  <section class="breadcrumbs">
    <div class="container">

      <div class="d-flex justify-content-between align-items-center">
        <h3>Gelen Kutusu</h3>
      </div>

    </div>
  </section><!-- Breadcrumbs Section -->

  <!-- Text Area -->
  <style>
    textarea {
      width: 100%;
      height: 150px;
      padding: 12px 20px;
      box-sizing: border-box;
      border: 2px solid ;
      border-radius: 4px;
      background-color: #ffffff;
      font-size: 16px;
      resize: none;
    }
  </style>
  <!-- Text Area -->

  <!-- Slider bar color -->
  <style>
    .portfolio-details .portfolio-details-slider .swiper-pagination .swiper-pagination-bullet {
      width: 12px;
      height: 12px;
      background-color: #fff;
      opacity: 1;
      border: 1px solid #000000;
    }
    .portfolio-details .portfolio-details-slider .swiper-pagination .swiper-pagination-bullet-active {
      background-color: #000000;
    }
  </style>
  <!-- Slider bar color -->

  <!-- ======= Portfolio Details Section ======= -->
  <section id="portfolio-details" class="portfolio-details">
    <div class="container">

      <div class="row gy-4">

        <div class="col-lg-12">
          <div class="portfolio-details-slider swiper-container">
            <div class="swiper-wrapper align-items-center">

              <div class="swiper-slide">
                <img src="homePage/assets/img/portfolio/slider_image/software-tech.jpg" alt="">
              </div>

              <div class="swiper-slide">
                <img src="homePage/assets/img/portfolio/slider_image/home-design.jpg" alt="">
              </div>

              <div class="swiper-slide">
                <img src="homePage/assets/img/portfolio/slider_image/space-x.jpg" alt="">
              </div>

            </div>
            <div class="swiper-pagination"></div>

          </div>
        </div>

        <!-- Boşluk -->
        <h2></h2>
        <!-- Boşluk -->

        <c:if test="${ dbUtil.allMessages().size() > 0 }">
          <c:forEach items="${dbUtil.allMessages()}" var="item">
              <div class="col-sm-4 portfolio-info">

                <h3>Kullanıcı Bilgisi</h3>
                <ul>
                  <li><strong> İsim </strong>: <c:out value="${item.name}"></c:out> </li>
                  <li><strong> E-Mail </strong>: <c:out value="${item.email}"></c:out> </li>
                  <li><strong> Konu </strong>: <c:out value="${item.subject}"></c:out> </li>
                  <li><strong> Tarih </strong>: <c:out value="${item.date}"></c:out> </li>
                </ul>
              </div>

              <div class="col-sm-8 portfolio-info" >
                <h3>Mesaj
                  <a href="reader-servlet?readerID=${item.readerID}" class="btn btn-danger btn-sm" onclick=" return show_alert()">Sil</a>
                </h3>
                <ul >
                  <li ><c:out value="${item.message}"></c:out></li>
                </ul>
              </div>
          </c:forEach>
        </c:if>


      </div>
    </div>
    </div>
  </section><!-- End Portfolio Details Section -->

</main><!-- End #main -->


<script>
  function show_alert() {
    return confirm("Silmek istediğinizden emin misiniz?")
  }
</script>


<a href="#" style="background-color: #000000" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="homePage/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="homePage/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="homePage/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="homePage/assets/vendor/php-email-form/validate.js"></script>
<script src="homePage/assets/vendor/swiper/swiper-bundle.min.js"></script>

<!-- Template Main JS File -->
<script src="homePage/assets/js/main.js"></script>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


</body>
</html>
