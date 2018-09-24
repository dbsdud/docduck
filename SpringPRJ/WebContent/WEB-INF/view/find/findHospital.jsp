<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>병원찾기</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h1 class="text-uppercase">
						<strong>병원 찾기</strong>
					</h1>
				</div>
			</div>
		</div>
	</header>
	
	<section id="findHospitalMap">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					지도 들어갈부분
				</div>
			</div>
		</div>
	</section>
	
	<section id="findHospitalList">
		<div class="container">
			<div class="row text-center">
			<!-- for문 돌려서 병원리스트 -->
				<div class="col-sm-3">
					1번
				</div>
				<div class="col-sm-3">
					2번
				</div>
				<div class="col-sm-3">
					3번
				</div>
				<div class="col-sm-3">
					4번
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
</body>
</html>