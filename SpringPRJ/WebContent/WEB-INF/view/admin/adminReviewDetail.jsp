<%@page import="poly.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ReviewDTO rDTO2 = (ReviewDTO)request.getAttribute("rDTO2");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>리뷰 상세 정보</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
<script>
function prev(){
	var prevConfirm = confirm("이전으로 돌아가시겠습니까?");
	if(prevConfirm == true) {
		location.href="/admin/adminHome.do";
	}
}
function reviewDel(reviewNo){
	var reviewDel = confirm("리뷰를 삭제하시겠습니까?");
	if(reviewDel == true) {
		location.href="/admin/reviewDel.do?reviewNo="+<%=rDTO2.getReviewNo()%>;
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
						<strong>리뷰 상세 정보</strong>
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
						작성자
					</h4>
					<hr class="my-4">
					<input type="text" style="width:30%; margin-left:35%" value="<%= rDTO2.getId() %>" class="text-center form-control" readonly="readonly">
					<br>
					<h4 class="section-heading">
						내용
					</h4>
					<hr class="my-4">
					<textarea class="form-control" rows="10" id="reviewContent" name="reviewContent" style="resize:none;" readonly="readonly"><%= rDTO2.getReviewContent() %></textarea>
					<br>
					<div class="col-sm-12">
						<span class="col-sm-6">
							<button class="btn btn-cancel pull-left" style="width:30%;" onclick="prev();">
								이전
							</button>
						</span>
						<span class="col-sm-6">
							<button class="btn btn-danger pull-right" style="width:30%;" onclick="reviewDel('<%=rDTO2.getReviewNo()%>');">
								삭제
							</button>
						</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
</body>
</html>