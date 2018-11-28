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
<script>
$(function(){
	// 아이디 찾기
	$("#findAccountId").click(function(){
		var userName = $("#userName").val();
		var userTel = $("#userTel").val();
		
		if(userName=='') {
			alert("이름을 입력해주세요.")
			$("#userName").focus();
			return false;
		} else if (userTel==''){
			alert("전화번호를 입력해주세요.")
			$("#userTel").focus();
			return false;
		} else {
			$.ajax({
				url : "/user/findAccountId.do",
				type : 'POST',
				data : {
					'userName' : userName,
					'userTel' : userTel
				},
				success : function(data){
					console.log(data);
					var contents="";
					$.each(data, function(key,value){
						contents+="<div class='col-lg-12 text-center' style='background-color : #f8f9fa'>";
						contents+="<h4>"+userName+" 회원님의 ID는</h4>";
						contents+="<h3>"+value.id+"</h3>";
						contents+="<h4>입니다.</h4>"
					});
					$('#findAccountIdValue').html(contents);
				},
				error : function(error){
					alert("입력하신 정보와 일치하는 회원이 없습니다.");
				}
			})
		}
	})
});
</script>
<script>
$(function(){
	// 비밀번호 찾기
	$("#findAccountPw").click(function(){
		var id = $("#findPwId").val();
		var userName = $("#findPwName").val();
		var userTel = $("#findPwTel").val();
		
		if(id==''){
			alert("아이디를 입력해주세요.")
			$("#findPwId").focus();
			return false;
		} else if(userName=='') {
			alert("이름을 입력해주세요.")
			$("#findPwName").focus();
			return false;
		} else if (userTel==''){
			alert("전화번호를 입력해주세요.")
			$("#userTel").focus();
			return false;
		} else {
			$.ajax({
				url : "/user/findAccountPw.do",
				type : 'POST',
				data : {
					'id' : id,
					'userName' : userName,
					'userTel' : userTel
				},
				success : function(data){
					console.log(data);
					var contents="";
					$.each(data, function(key,value){
						contents+="<form class='form-hotizonal' action='/user/updInfoProc.do' method='post'>";
						contents+="<input type='hidden' id='id' name='id' value='"+id+"' />";
						
						contents+="</form>";
						contents+="<div class='col-lg-12 text-center' style='background-color : #f8f9fa'>";
						contents+="<h4>"+id+" 회원님의 비밀번호는</h4>";
						contents+="<h3>"+value.password+"</h3>";
						contents+="<h4>입니다.</h4>"
					});
					$('#findAccountPwValue').html(contents);
				},
				error : function(error){
					alert("입력하신 정보와 일치하는 회원이 없습니다.");
				}
			})
		}
	})
})
</script>
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
								<button class="btn btn-primary btn-block" id="findAccountId">
									ID 찾기
								</button>
							</p>
						</div>
						<div class="col-sm-12" id="findAccountIdValue">
							
						</div>
					</div>
					<form action="/user/findAccountPw.do" method="post" accept-charset="UTF-8">
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
								<!-- <p>
									<button class="btn btn-primary btn-block" id="findAccountPw">
										임시비밀번호 발급
									</button>
								</p> -->
								<p>
									<button class="btn btn-primary btn-block">
										임시비밀번호 발급
									</button>
								</p>
							</div>
						</div>
					</form>
					<div class="col-sm-12" id="findAccountPwValue">
						
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>