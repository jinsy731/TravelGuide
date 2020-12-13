<%@ page pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Travel Guide Reservation - Main Page</title>

  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
  <jsp:include page="source.jsp"/>

  <style>
    .main-intro-img {
      width: 100%;
      height: 300px;
      object-fit: cover;
      overflow: auto;
    }

    .main-img {
      width: 100%;
      height: 600px;
      object-fit: cover;
    }
  </style>

</head>
<body id="page-top">

  <!-- navbar include -->
  <jsp:include page="/navbar.jsp" />
<!-- section content start.. changing part -->

<section id="content">
  <!-- Masthead-->
  <header class="masthead bg-white text-white text-center">
<%--    <div class="container d-flex align-items-center flex-column">--%>
<%--      <!-- Masthead Avatar Image-->--%>
<%--      <img class="masthead-avatar mb-5" src="assets/img/avataaars.svg" alt="" />--%>
<%--      <!-- Masthead Heading-->--%>
<%--      <h1 class="masthead-heading text-uppercase mb-0">Web Project</h1>--%>
<%--      <!-- Icon Divider-->--%>
<%--      <div class="divider-custom divider-light">--%>
<%--        <div class="divider-custom-line"></div>--%>
<%--        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>--%>
<%--        <div class="divider-custom-line"></div>--%>
<%--      </div>--%>
<%--      <!-- Masthead Subheading-->--%>
<%--      <p class="masthead-subheading font-weight-light mb-0">Travel - Guide - Reservation</p>--%>
<%--    </div>--%>
        <div id="carouselExampleIndicators7" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="7"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="8"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="9"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="10"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="11"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="12"></li>


          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="img-fluid main-img" src="assets/img/성산일출봉2.jpg" data-src="" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="img-fluid main-img" src="assets/img/창경궁2.jpeg" data-src="" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="img-fluid main-img" src="assets/img/성산일출봉4.jpg" data-src="" alt="Third slide">
            </div>
            <div class="carousel-item">
              <img class="img-fluid main-img" src="assets/img/수원화성.jpeg" data-src="" alt="Third slide">
            </div>
            <div class="carousel-item">
              <img class="img-fluid main-img" src="assets/img/창덕궁1.jpg" data-src="" alt="Third slide">
            </div>
            <div class="carousel-item">
              <img class="img-fluid main-img" src="assets/img/창덕궁2.jpg" data-src="" alt="Third slide">
            </div>
            <div class="carousel-item">
              <img class="img-fluid main-img" src="assets/img/창경궁4.jpeg" data-src="" alt="Third slide">
            </div>
            <div class="carousel-item">
              <img class="img-fluid main-img" src="assets/img/북촌한옥마을2.jpeg" data-src="" alt="Third slide">
            </div>
            <div class="carousel-item">
              <img class="img-fluid main-img" src="assets/img/북촌한옥마을3.jpeg" data-src="" alt="Third slide">
            </div>
            <div class="carousel-item">
              <img class="img-fluid main-img" src="assets/img/창경궁1.jpg" data-src="" alt="Third slide">
            </div>
            <div class="carousel-item">
              <img class="img-fluid main-img" src="assets/img/북촌한옥마을4.jpg" data-src="" alt="Third slide">
            </div>
            <div class="carousel-item">
              <img class="img-fluid main-img" src="assets/img/경복궁1.webp" data-src="" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators7" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators7" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
  </header>
  <!-- Portfolio Section-->
  <section class="page-section portfolio" id="portfolio">
    <div class="container">
      <!-- Portfolio Section Heading-->
      <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Recommended</h2>
      <!-- Icon Divider-->
      <div class="divider-custom">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
        <div class="divider-custom-line"></div>
      </div>
      <!-- Portfolio Grid Items-->
      <div class="row justify-content-center">
        <!-- Portfolio Item 1-->
        <div class="col-md-6 col-lg-4 mb-5">
          <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
              <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid main-intro-img" src="assets/img/travel2.jpeg" alt="" />
          </div>
        </div>
        <!-- Portfolio Item 2-->
        <div class="col-md-6 col-lg-4 mb-5">
          <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal2">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
              <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid main-intro-img" src="assets/img/북촌.jpeg" alt="" />
          </div>
        </div>
        <!-- Portfolio Item 3-->
        <div class="col-md-6 col-lg-4 mb-5">
          <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal3">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
              <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid main-intro-img" src="assets/img/성산1.jpeg" alt="" />
          </div>
        </div>
        <!-- Portfolio Item 4-->
        <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
          <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
              <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid main-intro-img" src="assets/img/창덕궁2.jpg" alt="" />
          </div>
        </div>
        <!-- Portfolio Item 5-->
        <div class="col-md-6 col-lg-4 mb-5 mb-md-0">
          <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal5">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
              <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid main-intro-img" src="assets/img/수원화성.jpeg" alt="" />
          </div>
        </div>
        <!-- Portfolio Item 6-->
        <div class="col-md-6 col-lg-4">
          <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal6">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
              <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
            </div>
            <img class="img-fluid main-intro-img" src="assets/img/남이섬3.jpg" alt="" />
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- About Section-->
  <section class="page-section bg-primary text-white mb-0" id="about">
    <div class="container">
      <!-- About Section Heading-->
      <h2 class="page-section-heading text-center text-uppercase text-white">About</h2>
      <!-- Icon Divider-->
      <div class="divider-custom divider-light">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
        <div class="divider-custom-line"></div>
      </div>
      <!-- About Section Content-->
      <div class="row">
        <div class="col-lg-4 ml-auto"><p class="lead">Freelancer is a free bootstrap theme created by Start Bootstrap. The download includes the complete source files including HTML, CSS, and JavaScript as well as optional SASS stylesheets for easy customization.</p></div>
        <div class="col-lg-4 mr-auto"><p class="lead">You can create your own custom avatar for the masthead, change the icon in the dividers, and add your email address to the contact form to make it fully functional!</p></div>
      </div>
      <!-- About Section Button-->
      <div class="text-center mt-4">
        <a class="btn btn-xl btn-outline-light" href="https://startbootstrap.com/theme/freelancer/">
          <i class="fas fa-download mr-2"></i>
          Free Download!
        </a>
      </div>
    </div>
  </section>
  <!-- Contact Section-->
  <section class="page-section" id="contact">
    <div class="container">
      <!-- Contact Section Heading-->
      <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Contact Me</h2>
      <!-- Icon Divider-->
      <div class="divider-custom">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
        <div class="divider-custom-line"></div>
      </div>
      <!-- Contact Section Form-->
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19.-->
          <form id="contactForm" name="sentMessage" novalidate="novalidate">
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Name</label>
                <input class="form-control" id="name" type="text" placeholder="Name" required="required" data-validation-required-message="Please enter your name." />
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Email Address</label>
                <input class="form-control" id="email" type="email" placeholder="Email Address" required="required" data-validation-required-message="Please enter your email address." />
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Phone Number</label>
                <input class="form-control" id="phone" type="tel" placeholder="Phone Number" required="required" data-validation-required-message="Please enter your phone number." />
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Message</label>
                <textarea class="form-control" id="message" rows="5" placeholder="Message" required="required" data-validation-required-message="Please enter a message."></textarea>
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <br />
            <div id="success"></div>
            <div class="form-group"><button class="btn btn-primary btn-xl" id="sendMessageButton" type="submit">Send</button></div>
          </form>
        </div>
      </div>
    </div>
  </section>
</section>   <!-- section content end --->

  <!-- portfolio-modal include -->
  <jsp:include page="/portfolio_modal.jsp"/>

  <!-- footer include -->
  <jsp:include page="/footer.jsp" />




<%--<!-- Bootstrap core JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>--%>
<!-- Contact form JS-->
<script src="assets/mail/jqBootstrapValidation.js"></script>
<script src="assets/mail/contact_me.js"></script>
<!-- Core theme JS-->
<%--<script src="js/scripts.js"></script>--%>

</body>
</html>