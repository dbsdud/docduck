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
<script>
//아이디 중복체크
var idCheck=0;
$(function(){
	// idCheck 버튼을 클릭했을 때
	$("#idCheck").click(function(){
		var id = $("#id").val();
		console.log(id);
		$.ajax({
			type : 'POST',
			data : {'id':id},
			url : "/user/idCheck.do",
			dataType : "json",
			success : function(data){
				console.log(data);
				if(data.cnt > 0){
					alert("이미 사용중인 아이디입니다.");
					$('#conf').val("0");
					$("#id").focus();
				} else if($("#id").val()=="") {
					alert("아이디를 입력해주세요.");
					$('#conf').val("0");
					$("#id").focus();
				} else {
					alert("사용 가능한 아이디입니다.");
					$("#conf").val("1");
					$("#pwd").focus();
					idCheck=1;
				}
			},
			error : function(error){
				alert("error : " + error);
			}
		});
	});
});
</script>
<script>
function userRegCancel(){
	location.href="/home.do";
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
					<form class="form-horizontal" action="/user/userRegProc.do" method="post">
						<div class="form-gourp">
							<h4 class="section-heading">
								아이디
							</h4>
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
							<h4 class="section-heading">
								비밀번호
							</h4>
							<hr class="my-4">
							<div class="col-sm-12">
								<div class="input-group">
									<input type="password" class="form-control" id="pwd" name="password" placeholder="비밀번호" maxlength="20" value="">
								</div>
							</div>
							<br>
							<div class="col-sm-12">
								<div class="input-group">
									<input type="password" class="form-control" id="pwdCheck"  name="passwordCheck" placeholder="비밀번호 확인" maxlength="20" value="">
								</div>
							</div>
							<br>
							<h4 class="section-heading">
								이름
							</h4>
							<hr class="my-4">
							<div class="col-sm-12">
								<div class="input-group">
									<input type="text" class="form-control" id="userName" name="userName" placeholder="이름">
								</div>
							</div>
							<br>
							<h4 class="section-heading">
								전화번호
							</h4>
							<hr class="my-4">
							<div class="col-sm-12">
								<div class="input-group">
									<input type="text" class="form-control" id="userTel" name="userTel" placeholder="전화번호">
								</div>
							</div>
							<br>
							<div class="col-sm-12 text-center">
								<button class="btn btn-primary" id="regSub" onclick="if(!userSubmit(this.form)){return false;}" style="width:30%">
									회원가입
								</button>
							</div>							
						</div>
					</form>
					<div class="col-sm-12 text-center">
						<button class="btn btn-danger" onclick="userRegCancel()" style="width:30%">
							취소하기
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
	<!-- 유효성검사  -->
	<%@ include file="userScript.jsp" %>
</body>
</html>