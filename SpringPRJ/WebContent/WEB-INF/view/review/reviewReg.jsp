<%@page import="poly.dto.ReviewDTO"%>
<%@page import="poly.dto.ApiDTO"%>
<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDTO uDTO = (UserDTO)request.getAttribute("uDTO");
	ApiDTO aDTO = (ApiDTO)request.getAttribute("aDTO");
	ReviewDTO rDTO = (ReviewDTO)request.getAttribute("rDTO");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 작성</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
<!-- bar-rating -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"> 
<link rel="stylesheet" href="/Resources/jquery-bar-rating-master/dist/themes/fontawesome-stars.css"> 
<script type="text/javascript" src="/Resources/jquery-bar-rating-master/dist/jquery.barrating.min.js"></script>
<script>
	$(function(){
		$('#treat').barrating({
			theme:'fontawesome-stars'
		});
	});
	$(function(){
		$('#service').barrating({
			theme:'fontawesome-stars'
		});
	});
	$(function(){
		$('#facil').barrating({
			theme:'fontawesome-stars'
		});
	});
</script>
<script>
function reviewRegCancel(){
	location.href="/review/reviewListHosp.do?hosp_no="+hospNo;
}
</script>
<style>
.shared-pad{
	height:10px;
	background:#f0f4fc;
}
</style>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h1 class="text-uppercase">
						<strong>리뷰작성</strong>
					</h1>
				</div>
			</div>
		</div>
	</header>
	<section>
		<div class="container">
			<div class="row">
				<div class="form-group col-sm-12 text-center">
					<h4 class="section-heading">
						만족도 평가
					</h4>
					<hr class="my-4">
				</div>
				<div class="col-sm-4 text-center">진료 만족도</div>
				<div class="col-sm-4 text-center">친절 만족도</div>
				<div class="col-sm-4 text-center">시설 만족도</div>
				<div class="col-sm-4 text-center">
					<select name="rating" id="treat" title="진료 만족도" onchange="document.getElementById('treatVal').value=this.options[this.selectedIndex].value">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</div>
				<div class="col-sm-4 text-center">
					<select name="rating" id="service" title="친절 만족도" onchange="document.getElementById('serviceVal').value=this.options[this.selectedIndex].value">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</div>
				<div class="col-sm-4 text-center">
					<select name="rating" id="facil" title="시설 만족도" onchange="document.getElementById('facilVal').value=this.options[this.selectedIndex].value">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</div>
				<div class="col-sm-12 shared-pad" style="padding-top:8px;"></div>
				<div class="col-lg-12 text-center" style="padding-top:8px;">
					<form id="reviewForm" class="form-horizontal" action="/review/reviewRegProc.do?hosp_no=<%=rDTO.getHospNo() %>" method="post">
						<div class="form-group">
							<h4 class="section-heading">
								후기
							</h4>
							<hr class="my-4">
							<input type="hidden" id="id" name="id" value="<%= id %>">
							<input type="hidden" id="regNo" name="regNo" value="<%= regNo %>">
							<input type="hidden" id="treatVal" name="treatVal" value=""> 
							<input type="hidden" id="serviceVal" name="serviceVal" value=""> 
							<input type="hidden" id="facilVal" name="facilVal" value="">
							<div class="col-sm-12">
								<div class="input-group">
									<textarea class="form-control" rows="4" id="reviewContent" name="reviewContent" style="resize: none;" placeholder="내용을 입력하세요."></textarea>
								</div>
							</div>
						</div>
						<br>
						<div class="col-sm-12">
							<button class="btn btn-primary" id="reviewRegSub" type="submit" style="width:30%;" onclick="if(!reviewSubmit(this.form)){return false;}">
								등록
							</button>
						</div>
					</form>
					<div class="col-sm-12 text-center">
						<button class="btn btn-danger" onclick="reviewRegCancel()" style="width:30%;">
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
	function reviewSubmit(check){
		if(ckeck.treatVal.value==""){
			alert("치료 만족도를 입력하지 않았습니다.")
			return false;
		} else if(check.serviceVal.value==""){
			alert("친절 만족도를 입력하지 않았습니다.")
			return false;
		} else if(check.facilVal.value==""){
			alert("시설 만족도를 입력하지 않았습니다.")
			return false;
		} else if(check.reviewContent.value==""){
			alert("리뷰 내용을 입력하지 않았습니다.")
			check.reviewContent.focus();
			return false;
		} else {
			var reviewSubmitConfirm = confirm("리뷰를 등록하시겠습니까?");
			if(reviewSubmitConfirm == true){
				return true;
			}
		}
	}
	</script>
</body>
</html>