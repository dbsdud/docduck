<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.dto.NoticeDTO" %>
<%
	NoticeDTO nDTO = (NoticeDTO)request.getAttribute("nDTO");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h1 class="text-uppercase">
						<strong>공지사항</strong>
					</h1>
				</div>
			</div>
		</div>
	</header>
	<section>
	<!-- 공지사항 디테일 작성 -->
	</section>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
</body>
</html>