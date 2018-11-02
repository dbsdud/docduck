<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.dto.UserDTO" %>
<html>
<%
	UserDTO uDTO2 = (UserDTO)request.getAttribute("uDTO2");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세회원정보</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
<script>
function prev(){
	var prevConfirm = confirm("이전으로 돌아가시겠습니까?");
	if(prevConfirm == true) {
		location.href="/admin/adminHome.do";
	}
}
function userKick(userNo){
	var userKick = confirm("회원을 탈퇴시키겠습니까?");
	if(userKick == true) {
		location.href="/admin/userKick.do?userNo="+userNo;
	}
}
</script>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h1 class="text-uppercase">
						<strong>상세회원정보</strong>
					</h1>
				</div>
			</div>
		</div>
	</header>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<input type="hidden" id="userNo" name="userNo" value="<%= uDTO2.getUserNo() %>">
					<h4 class="section-heading">
						아이디
					</h4>
					<hr class="my-4">
					<input type="text" style="width:30%; margin-left:35%;" value="<%= uDTO2.getId() %>" class="text-center form-control" readonly="readonly" />
					<br>
					<h4 class="section-heading">
						이름
					</h4>
					<hr class="my-4">
					<input type="text" style="width:30%; margin-left:35%;" value="<%= uDTO2.getUserName() %>" class="text-center form-control" readonly="readonly" />
					<br>
					<h4 class="section-heading">
						전화번호
					</h4>
					<hr class="my-4">
					<input type="text" style="width:30%; margin-left:35%;" value="<%= uDTO2.getUserTel() %>" class="text-center form-control" readonly="readonly" />
					<br>
					<h4 class="section-heading">
						가입일
					</h4>
					<hr class="my-4">
					<input type="text" style="width:30%; margin-left:35%;" value="<%= uDTO2.getRegDate() %>" class="text-center form-control" readonly="readonly" />
					<br>
					<div class="col-sm-12">
						<button class="btn btn-danger" style="width:30%" onclick="userKick('<%= uDTO2.getUserNo() %>');">
							회원탈퇴
						</button>
					</div>
					<br>
					<div class="col-sm-12">
						<button class="btn btn-cancel" style="width:30%" onclick="prev();">
							이전
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>