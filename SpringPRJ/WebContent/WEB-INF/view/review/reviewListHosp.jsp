<%@page import="poly.dto.UserDTO"%>
<%@page import="poly.dto.ReviewDTO"%>
<%@page import="poly.dto.ApiDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ApiDTO aDTO = (ApiDTO)request.getAttribute("aDTO");
	List<ReviewDTO> rList = (List<ReviewDTO>)request.getAttribute("rList");
	ReviewDTO rDTO = (ReviewDTO)request.getAttribute("rDTO");
	ReviewDTO rDTO2 = (ReviewDTO)request.getAttribute("rDTO2");
	UserDTO uDTO = (UserDTO)request.getAttribute("uDTO");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
<style>
.review-detail-row{
    border-top: 1px solid #e0e4ef;
    border-bottom: 1px solid #e0e4ef;
    padding: 14px;
    color: #192242;
}
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
						<strong>리뷰</strong>
					</h1>
				</div>
			</div>
		</div>
	</header>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<input type="hidden" value="<%= id %>" />
					<input type="hidden" value="<%= userNo %>" />
					<input type="hidden" value="<%= regNo %>" />
					<h5>
						병원후기
					</h5>
					<hr class="my-4">
				</div>
				<% for(int i=0; i<rList.size(); i++) { %>
				<div class="col-sm-12 text-center review-detail-row">
					<span class="col-sm-4 pull-left">진료 만족도</span>
					<span class="col-sm-4">의료진 친절도</span>
					<span class="col-sm-4 pull-right">시설 만족도</span>
					<span class="col-sm-4 pull-left"><%= rList.get(i).getReviewTreat() %></span>
					<span class="col-sm-4 pull-left"><%= rList.get(i).getReviewService() %></span>
					<span class="col-sm-4 pull-left"><%= rList.get(i).getReviewFacil() %></span>
				</div>
				<div class="col-sm-12">
					<span class="col-sm-12"><%= rList.get(i).getReviewContent() %></span>
				</div>
				<div class="col-sm-12 pull-left">
					<span class="col-sm-12"><%= rList.get(i).getId() %> | <%=rList.get(i).getRegDate() %></span>
				</div>
				<div class="col-sm-12 shared-pad"></div>
				<% } %>
				<br>
				<% if(!userNo.equals("")) { %>
				<div class="col-sm-12">
					<a href="/review/reviewReg.do?hosp_no=<%=rDTO.getHospNo() %>">
						<button class="btn btn-primary btn-block pull-right" style="width:30%;" id="writeReview">
							작성
						</button>
					</a>
				</div>
				<% } %>
			</div>			
		</div>
	</section>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
</body>
</html>