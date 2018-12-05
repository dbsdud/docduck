<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%
	UserDTO uDTO2 = (UserDTO)request.getAttribute("uDTO2");
	String myPageUserNo = CmmUtil.nvl((String)session.getAttribute("myPageUserNo"));
	String myPagePassword = CmmUtil.nvl((String)session.getAttribute("myPagePassword"));
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세정보</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
</head>
<script>
function updCancel(){
	var updCancelConfirm = confirm("개인정보 수정을 취소하시겠습니까?");
	if(updCancelConfirm == true){
		location.href="/home.do";
	}
}
</script>
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
					<h4 class="section-heading">
						아이디
					</h4>
					<hr class="my-4">
					<input class="form-control text-center" style="width:30%; margin-left:35%;" value="<%= uDTO2.getId() %>" readonly="readonly" />
					<br>
					<h4 class="section-heading">
						이름
					</h4>
					<hr class="my-4">
					<input class="form-control text-center" style="width:30%; margin-left:35%;" value="<%= uDTO2.getUserName() %>" readonly="readonly" />
					<br> 
					<h4 class="section-heading">
						전화번호
					</h4>
					<hr class="my-4">
					<input class="form-control text-center" type="text" style="width:30%; margin-left:35%;" value="<%= uDTO2.getUserTel() %>" readonly="readonly" />
					<br>
					<form class="form-horizonal" action="/user/updInfoProc.do" method="post">
						<input type="hidden" id="userNo" name="userNo" value="<%= uDTO2.getUserNo() %>" />
						<h4 class="section-heading">
							비밀번호 변경
						</h4>
						<hr class="my-4">
						<input class="form-control" type="password" id="updPassword" name="updPassword" style="width:30%; margin-left:35%;" placeholder="비밀번호" />
						<br>
						<input class="form-control" type="password" id="updPasswordCheck" name="updPasswordCheck" style="width: 30%; margin-left: 35%;" placeholder="비밀번호 확인" />
						<br>
						<div class="col-sm-12">
							<button class="btn btn-primary" onclick="if(!updSubmit(this.form)){return false;}" style="width:30%;">
								수정
							</button>
						</div>
					</form>
					<div class="col-sm-12 text-center">
						<button class="btn btn-cancel" onclick="updCancel()" style="width: 30%;">
							취소
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
	<script>
		function updSubmit(check){
			if(check.updPassword.value==""){
				alert("비밀번호를 입력하지 않았습니다.")
				check.updPasword.focus()
				return false;
			}
			var pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
			if(!pwCheck.test(check.updPassword.value)){
				alert("비밀번호는 영어, 숫자, 특수문자 조합의 8자 이상으로 해주세요.")
				check.updPassword.focus();
				return false;
			}
			if(check.updPassword.value!=check.updPasswordCheck.value){
				alert("비밀번호가 일치하지 않습니다.")
				check.updPassword.value=""
				check.updPasswordCheck.value=""
				check.updPassword.focus()
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>