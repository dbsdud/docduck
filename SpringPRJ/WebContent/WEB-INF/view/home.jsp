<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Creative - Start Bootstrap Theme</title>
<%@ include file="mainCss.jsp" %>
</head>
<body id="page-top">
	<%@ include file="homeNav.jsp" %>
	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h1 class="text-uppercase">
						<strong>가까운 병원을 찾아보세요!</strong>
					</h1>
					<hr>
				</div>
				<div class="col-lg-8 mx-auto">
					<p class="text-faded mb-5">위급할 때, 시간 없을 때, 야간진료, 각종 이벤트 여기서 찾으세요!</p>
					<a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">병원 찾기</a>
				</div>
			</div>
    	  </div>
    </header>

	<section class="bg-primary" id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					<h2 class="section-heading text-white">Doc.Duck에 가입하세요!</h2>
					<hr class="light my-4">
					<p class="text-faded mb-4">Doc.Duck에 가입하고 다양한 혜택을 받으세요!</p>
					<a class="btn btn-light btn-xl js-scroll-trigger" href="/user/userReg.do">JOIN!</a>
				</div>
			</div>
		</div>
	</section>

	<section id="services">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">다른 서비스</h2>
					<hr class="my-4">
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box mt-5 mx-auto">
						<i class="fa fa-4x fa-diamond text-primary mb-3 sr-icons"></i>
						<h3 class="mb-3">약국찾기</h3>
						<p class="text-muted mb-0">주변에 약국을 찾아보세요!</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box mt-5 mx-auto">
						<i class="fa fa-4x fa-paper-plane text-primary mb-3 sr-icons"></i>
						<h3 class="mb-3">상황별 병원찾기</h3>
						<p class="text-muted mb-0">증상 및 상황에 맞는 병원을 찾아보세요!</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box mt-5 mx-auto">
						<i class="fa fa-4x fa-newspaper-o text-primary mb-3 sr-icons"></i>
						<h3 class="mb-3">이벤트 모아보기</h3>
						<p class="text-muted mb-0">진행중인 이벤트를 한눈에 보세요!</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box mt-5 mx-auto">
						<i class="fa fa-4x fa-heart text-primary mb-3 sr-icons"></i>
						<h3 class="mb-3">건강정보</h3>
						<p class="text-muted mb-0">건강상식에 대해 알아보세요!</p>
					</div>
				</div>
        	</div>
		</div>
	</section>
	
	<section class="p-0" id="portfolio">
		<div class="container-fluid p-0">
			<div class="row no-gutters popup-gallery">
				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box" href="/Resources/img/portfolio/fullsize/1.jpg">
						<img class="img-fluid" src="/Resources/img/portfolio/thumbnails/1.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">
									Category
								</div>
								<div class="project-name">
									Project Name
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box" href="/Resources/img/portfolio/fullsize/2.jpg">
						<img class="img-fluid" src="/Resources/img/portfolio/thumbnails/2.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">
									Category
								</div>
								<div class="project-name">
									Project Name
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box" href="/Resources/img/portfolio/fullsize/3.jpg">
						<img class="img-fluid" src="/Resources/img/portfolio/thumbnails/3.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">
									Category
								</div>
								<div class="project-name">
									Project Name
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box" href="/Resources/img/portfolio/fullsize/4.jpg">
						<img class="img-fluid" src="/Resources/img/portfolio/thumbnails/4.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">
									Category
								</div>
								<div class="project-name">
									Project Name
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box" href="/Resources/img/portfolio/fullsize/5.jpg">
						<img class="img-fluid" src="/Resources/img/portfolio/thumbnails/5.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">
									Category
								</div>
								<div class="project-name">
									Project Name
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a class="portfolio-box" href="/Resources/img/portfolio/fullsize/6.jpg">
						<img class="img-fluid" src="/Resources/img/portfolio/thumbnails/6.jpg" alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">
									Category
								</div>
								<div class="project-name">
									Project Name
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>

	<section class="bg-dark text-white">
		<div class="container text-center">
			<h2 class="mb-4">Free Download at Start Bootstrap!</h2>
			<a class="btn btn-light btn-xl sr-button" href="http://startbootstrap.com/template-overviews/creative/">Download Now!</a>
		</div>
	</section>

	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					<h2 class="section-heading">Let's Get In Touch!</h2>
					<hr class="my-4">
					<p class="mb-5">Ready to start your next project with us? That's great! Give us a call or send us an email and we will get back to you as soon as possible!</p>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 ml-auto text-center">
					<i class="fa fa-phone fa-3x mb-3 sr-contact"></i>
					<p>123-456-6789</p>
				</div>
				<div class="col-lg-4 mr-auto text-center">
					<i class="fa fa-envelope-o fa-3x mb-3 sr-contact"></i>
					<p>
						<a href="mailto:your-email@your-domain.com">feedback@startbootstrap.com</a>
					</p>
				</div>
			</div>
		</div>
	</section>
    <%@ include file="mainJs.jsp" %>
  </body>
</html>