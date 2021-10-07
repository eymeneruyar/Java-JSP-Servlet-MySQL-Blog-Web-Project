<%@ page import="Properties.Images" %>
<%@ page import="Properties.Author" %>
<%@ page import="Properties.Article" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<jsp:useBean id="util" class ="Utils.Util"></jsp:useBean>
<jsp:useBean id="dbUtil" class="Utils.DBUtil"></jsp:useBean>
<% Images img = new Images(); %>
<% Author author = new Author();%>
<% Article article = new Article(); %>

<html>
<head>
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

<% int aid = author.getAid(); %>

<style>
    .navbar .dropdown ul a:hover, .navbar .dropdown ul .active:hover, .navbar .dropdown ul li:hover > a {
        color: gray;
    }
    .navbar a:hover, .navbar .active, .navbar .active:focus, .navbar li:hover > a {
        color: gray;
    }
</style>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-center ">
    <div class="container d-flex align-items-center justify-content-between ">

        <div class="logo">
            <h1><a href="index.jsp">My Blog</a></h1>
        </div>

        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link scrollto active" href="#hero">Ana Sayfa</a></li>
                <li><a class="nav-link scrollto" href="#about">Hakkımızda</a></li>
                <li><a class="nav-link scrollto " href="#portfolio">Blog</a></li>
                <li><a class="nav-link scrollto" href="#team">Takım</a></li>
                <li><a class="nav-link scrollto" href="#contact">İletişim</a></li>
                <!-- Check the enter admin of blog -->
                <c:if test="${aid == null}">
                    <li><a class="nav-link scrollto" href="login-servlet" >Giriş Yap</a></li>
                </c:if>

                <c:if test="${aid != null}">
                    <li class="dropdown"><a href="#"><span>Profil</span> <i class="bi bi-chevron-down"></i></a>
                        <ul>
                            <li><a href="editScreen.jsp">Ekle/Düzenle</a></li>
                            <li><a href="messageBoxScreen.jsp">Gelen Kutusu</a></li>
                            <li><a href="change-password-servlet">Şifre Değiştir</a></li>
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

        <!-- ======= Hero Section ======= -->
        <section id="hero">
            <div class="hero-container">
                <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

                    <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

                    <div class="carousel-inner" role="listbox">

                        <!-- Slide 1 -->
                        <div class="carousel-item active" style="background-image: url(homePage/assets/img/slide/slide-space.jpg);">
                            <div class="carousel-container">
                                <div class="carousel-content">
                                    <h2 class="animate__animated animate__fadeInDown"><span>My Blog</span>'a Hoşgeldiniz</h2>
                                    <h3 style="color: white"> Bir Blog'dan daha fazlası...</h3><p class="animate__animated animate__fadeInUp"> </p>
                                    <a href="#about" class="btn-get-started scrollto animate__animated animate__fadeInUp" style="border: 2px solid white; background-color: Transparent" >Devamını Oku</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!-- End Hero -->

<!-- Bölümlerdeki Başlık Görünümleri İçin -->
<style>
    .section-title h2::after {
        content: '';
        position: absolute;
        display: block;
        width: 200px;
        height: 1px;
        background: #000000;
        bottom: 0;
        left: calc(50% - 100px);
    }
</style>
<!-- Bölümlerdeki Başlık Görünümleri İçin -->

<main id = "main">
    <!-- ======= About Section ======= -->
    <section id="about" class="about">
        <div class="container">

            <div class="section-title">
                <h2>Hakkımızda</h2>
                <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <img src="homePage/assets/img/about-img.jpg" class="img-fluid" alt="">
                </div>
                <div class="col-lg-6 pt-4 pt-lg-0 content">
                    <h3>Voluptatem dignissimos provident quasi corporis voluptates sit assumenda.</h3>
                    <p class="fst-italic">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
                        magna aliqua.
                    </p>
                    <ul>
                        <li><i class="bi bi-check-circle" style="color: black"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
                        <li><i class="bi bi-check-circle" style="color: black"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
                        <li><i class="bi bi-check-circle" style="color: black"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.</li>
                    </ul>
                    <p>
                        Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                        velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
                        culpa qui officia deserunt mollit anim id est laborum
                    </p>
                </div>
            </div>

        </div>
    </section><!-- End About Section -->

    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
        <div class="container">

            <div class="section-title">
                <h2>Blog</h2>
                <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
            </div>

            <!-- Filter All-App-Card-Web -->
            <div class="row">
                <div class="col-lg-12 d-flex justify-content-center">
                    <ul id="portfolio-flters" style="background-color: #000000">
                        <li data-filter="*" class="filter-active">Tümü</li>
                        <li data-filter=".filter-app">Teknoloji</li>
                        <li data-filter=".filter-card">Tasarım-Sanat</li>
                        <li data-filter=".filter-web">Uzay</li>
                    </ul>
                </div>
            </div>

            <div class="row portfolio-container">

                <%
                    String catTech = "Teknoloji";
                %>

               <c:if test="${dbUtil.allArticles().size() > 0}">
                   <c:forEach items="${dbUtil.allArticles()}" var="item">

                       <div class="col-lg-4 col-md-6 portfolio-item filter-app">
                           <img src='<c:out value="${dbUtil.imageSelect(item.category).image_dir}"></c:out>' class="img-fluid" alt="">
                           <div class="portfolio-info">
                               <h4 ><c:out value="${item.title}"></c:out></h4>
                               <p><c:out value="${item.category}"></c:out></p>
                               <a href="<c:out value="${dbUtil.imageSelect(item.category).image_dir}"></c:out>" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="<c:out value="${item.category}"></c:out>"><i class="bx bx-plus"></i></a>
                               <a href="details-news-servlet?articleID=${item.articleID}" class="details-link" title="Daha Fazlası"><i class="bx bx-link"></i></a>
                          </div>
                       </div>

                   </c:forEach>
               </c:if>
            </div>
        </div>
    </section><!-- End Portfolio Section -->

    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
        <div class="container">

            <div class="section-title">
                <h2>Takım</h2>
                <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
            </div>

            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-lg-3 col-md-6 d-flex align-items-stretch" >
                    <div class="member">
                        <div class="member-img" >
                            <img src="homePage/assets/img/team/team-1.jpg" class="img-fluid" alt="">
                            <div class="social" >
                                <a href="" style="background-color: #000000"><i class="bi bi-twitter" style="background-color: #000000"></i></a>
                                <a href="" style="background-color: #000000"><i class="bi bi-facebook" style="background-color: #000000"></i></a>
                                <a href="" style="background-color: #000000"><i class="bi bi-instagram" style="background-color: #000000"></i></a>
                                <a href="" style="background-color: #000000"><i class="bi bi-linkedin" style="background-color: #000000"></i></a>
                            </div>
                        </div>
                        <div class="member-info">
                            <h4>Walter White</h4>
                            <span>Chief Executive Officer</span>
                        </div>
                    </div>
                </div>



            </div>

        </div>
    </section><!-- End Team Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact section-bg">
        <div class="container">

            <div class="section-title">
                <h2>İletişim</h2>
                <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="info-box mb-4">
                        <i class="bx bx-map" style="color: black"></i>
                        <h3>Adres</h3>
                        <p>Noramin İş Merkezi Kat:5 Büyükdere Caddesi No:237 Maslak – Sarıyer / İSTANBUL​</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="info-box  mb-4">
                        <i class="bx bx-envelope" style="color: black"></i>
                        <h3>E-Posta </h3>
                        <p>info@example.com</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="info-box  mb-4">
                        <i class="bx bx-phone-call" style="color: black"></i>
                        <h3>Bizi Arayın</h3>
                        <p>+90 555 000 0000 </p>
                    </div>
                </div>

            </div>

            <div class="row">

                <div class="col-lg-6 ">
                    <iframe class="mb-4 mb-lg-0" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" style="border:0; width: 100%; height: 384px;" allowfullscreen></iframe>
                </div>

                <%
                    Object readerMessageInsertErrorObj = request.getAttribute("messageInsertError");
                    if( readerMessageInsertErrorObj != null){
                        String readerInsertErrorMessage = "" + readerMessageInsertErrorObj;
                %>

                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Hata!</strong> <%=readerInsertErrorMessage %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <% } %>

                <!-- Bu kısma özel database ve servlet kısmı yazılacak. -->
                <div class="col-lg-6">
                    <form action="reader-servlet" method="post"  style="box-shadow: 0 0 30px rgba(214, 215, 216, 0.6);
  padding: 30px;
  background: #fff;
  border-radius: 4px;">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <input type="text" name="name" class="form-control" id="name" placeholder="İsim" required>
                            </div>
                            <div class="col-md-6 form-group mt-3 mt-md-0">
                                <input type="email" class="form-control" name="email" id="email" placeholder="E-Mail" required>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <input type="text" class="form-control" name="subject" id="subject" placeholder="Konu" required>
                        </div>
                        <div class="form-group mt-3">
                            <textarea class="form-control" name="message" rows="5" placeholder="Mesaj" required></textarea>
                        </div>

                        <div class="my-3"></div>

                        <div class="text-center"><button  type="submit" style="background: #000000;
                        border: 0;
                        padding: 10px 24px;
                        color: #fff;
                        transition: 0.4s;
                        border-radius: 4px;"> Mesaj Gönder</button></div>
                    </form>
                </div>

            </div>

        </div>
    </section><!-- End Contact Section -->

</main>

    <a href="#" style="background-color: #000000" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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




</body>
</html>