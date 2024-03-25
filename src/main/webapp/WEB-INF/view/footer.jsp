<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style type="text/css">
	footer {
		margin-top: 200px
	}
</style>
</head>
<body>
<footer class="text-center text-lg-start bg-body-tertiary text-muted">
  <!-- Section: Social media -->
  <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
    <!-- Left -->
    <div class="me-5 d-none d-lg-block">
      <span>Get connected with us on social networks:</span>
    </div>
    <!-- Left -->

    <!-- Right -->
    <div>
      <a class="me-4 text-reset" style="text-decoration: none">
        <i class="bi bi-facebook" style="font-size: large; color: gray;"></i>
      </a>
      <a href="" class="me-4 text-reset" style="text-decoration: none">
        <i class="bi bi-twitter" style="font-size: large; color: gray;"></i>
      </a>
      <a href="" class="me-4 text-reset" style="text-decoration: none">
        <i class="bi bi-google" style="font-size: large; color: gray;"></i>
      </a>
      <a href="" class="me-4 text-reset" style="text-decoration: none">
        <i class="bi bi-instagram" style="font-size: large; color: gray;"></i>
      </a>
      <a href="" class="me-4 text-reset" style="text-decoration: none">
        <i class="bi bi-linkedin" style="font-size: large; color: gray;"></i>
      </a>
      <a href="" class="me-4 text-reset" style="text-decoration: none">
        <i class="bi bi-github" style="font-size: large; color: gray;"></i>
      </a>
    </div>
    <!-- Right -->
  </section>
  <!-- Section: Social media -->

  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
          <!-- Content -->
          <h3 class="text-uppercase fw-bold mb-4">
            <a class="nav-link" href="<c:url value="/"/>">
				<span style="font-weight: bold">TEAM3</span>
				<i class="bi bi-chat-quote-fill" style="font-size: larger;"></i>
			</a>
          </h3>
          <p>
            Be not afraid of greatness:<br>
            some men are born great, some achieve greatness and some have greatness thrust upon them.
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            TEAM3
          </h6>
          <p>
            <a href="#!" class="text-reset">권기은</a>
          </p>
          <p>
            <a href="#!" class="text-reset">박성훈</a>
          </p>
          <p>
            <a href="#!" class="text-reset">이광진</a>
          </p>
          <p>
            <a href="#!" class="text-reset">이철범</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Useful links
          </h6>
          <p>
            <a href="#!" class="text-reset">Pricing</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Settings</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Orders</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Help</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
          <p><i class="bi bi-house-door-fill"></i> 서울특별시 강남구 테헤란로14길 6</p>
          <p>
            <i class="bi bi-envelope-fill"></i>
            info@example.com
          </p>
          <p><i class="bi bi-telephone-fill"></i> 1544 - 9970</p>
          <p><i class="bi bi-printer-fill"></i> + 01 234 567 89</p>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->

  <!-- Copyright -->
  <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2024 Copyright:
    <a class="text-reset fw-bold" href="">KH.TEAM3</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->
</body>
</html>