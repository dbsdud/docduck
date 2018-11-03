<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
<script>
function myPageCancel(){
	location.href="/home.do";
}
</script>
</head>
<body id="pagetop">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h1 class="text-uppercase">
						<strong>마이페이지</strong>
					</h1>
				</div>
			</div>
		</div>
	</header>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<input type="hidden" id="userNo" value="<%= userNo %>" />
					<input type="hidden" id="password" value="<%= password %>" />
					<div class="form-group">
						<h4 class="section-heading">
							본인확인을 위해 비밀번호를 입력해주세요
						</h4>
						<hr class="my-4">
						<input type="password" class="form-control" style="width:30%; margin-left:35%;" id="myPagePass" name="myPagePass" placeholder="비밀번호">
						<br>
						<button class="btn btn-primary" id="myPageSub" onclick="myPageSubmit()" style="width:30%;">
							확인
						</button>
						<br>
						<br>
						<button class="btn btn-cancel" onclick="myPageCancel()" style="width:30%;">
							이전
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
	<script>
		function myPageSubmit(){
			if(myPagePass.value==""){
				alert("비밀번호를 입력해주세요.")
				myPagePass.focus()
				return false;
			} else if(myPagePass.value==password.value){
				location.href="/user/myPageDetail.do?userNo="+userNo;
				return true;
			}
		}
	</script>
</body>
</html>