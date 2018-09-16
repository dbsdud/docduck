<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>회원가입</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h1 class="text-uppercase">
						<strong>회원가입</strong>
					</h1>
					<hr>
				</div>
			</div>
		</div>
	</header>
	
	<section id="userRegForm">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<form class="form-horizontal" action="/user/userProc.do" method="post">
						<div class="form-gourp">
							<h3 class="section-heading">
								아이디
							</h3>
							<hr class="my-4">
							<div class="col-sm-12">
								<div class="input-group">
									<input type="text" class="form-control" id="id" name="id" placeholder="아이디">
									<span class="input-group-btn">
										<input type="button" class="btn btn-primary" value="중복체크" id="idCheck">
										<input type="hidden" id="conf" value="0">
									</span>
								</div>
							</div>
							<br>
							<h3 class="section-heading">
								비밀번호
							</h3>
							<hr class="my-4">
							<div class="col-sm-12">
								<div class="input-group">
									<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" maxlength="20" value="">
								</div>
								<p><font id="length" size="2" color="red">8자리 이상 20자리 이하의 [영문 + 숫자] 조합</font></p>
							</div>
							<div class="col-sm-12">
								<div class="input-group">
									<p><input type="password" class="form-control" id="passwordCheck"  name="passwordCheck" placeholder="비밀번호 확인" maxlength="20" value=""></p>
									<font id="check" size="2" color="red"></font>
								</div>
							</div>
							<h3 class="section--heading">
								이름
							</h3>
							<hr class="my-4">
							<div class="col-sm-12">
								<div class="input-group">
									<input type="text" class="form-control" id="userName" name="userName" placeholder="이름">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
</body>
</html>