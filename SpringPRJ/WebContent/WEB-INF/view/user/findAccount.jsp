<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>계정 찾기</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
		<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h1 class="text-uppercase">
						<strong>계정 찾기</strong>
					</h1>
					<hr>
				</div>
			</div>
		</div>
	</header>
	<section id="findAccount">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<form class="form-horizontal" action="/user/findAccountIdProc.do" method="post">
						<div class="form-group">
							<h4 class="section-heading">
								ID 찾기
							</h4>
							<hr class="my-4">
							<div class="col-sm-12">
								<div class="input-group">
									<input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력하세요.">
								</div>
							</div>
							<br>
							<div class="col-sm-12">
								<div class="input-group">
									<input type="text" class="form-control col-sm-12" id="userTel" name="userTel" placeholder="전화번호를 입력하세요.">
								</div>
							</div>
							<br>
							<div class="col-sm-12 text-center">
								<p>
									<button class="btn btn-primary btn-block">
										ID 찾기
									</button>
								</p>
							</div>
						</div>
					</form>
					<form class="form-horizontal" action="/user/findAccountPw.do" method="post">
						<div class="form-group">
							<h4 class="section-heading">
								비밀번호 찾기
							</h4>
							<hr class="my-4">
							<div class="col-sm-12">
								<div class="input-group">
									<input type="text" class="form-control" id="findPwId" name="findPwId" placeholder="아이디를 입력하세요.">
								</div>
							</div>
							<br>
							<div class="col-sm-12">
								<div class="input-group">
									<input type="text" class="form-control" id="findPwName" name="findPwName" placeholder="이름을 입력하세요.">
								</div>
							</div>
							<br>
							<div class="col-sm-12">
								<div class="input-group">
									<input type="text" class="form-control" id="findPwTel" name="findPwTel" placeholder="전화번호를 입력하세요.">
								</div>
							</div>
							<br>
							<div class="col-sm-12 text-center">
								<p>
									<button class="btn btn-primary btn-block">
										비밀번호 찾기
									</button>
								</p>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>