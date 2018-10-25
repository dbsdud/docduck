<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDTO uDTO = (UserDTO)request.getAttribute("uDTO");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>아이디 찾기</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h1 class="text-uppercase">
						<strong>ID 찾기</strong>
					</h1>
					<hr>
				</div>
			</div>
		</div>
	</header>
	<section id="findAccountId">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h4><%=CmmUtil.nvl(uDTO.getUserName()) %> 회원님의 ID는</h4>
					<h3><%=CmmUtil.nvl(uDTO.getId()) %></h3>
					<h4>입니다.</h4>
				</div>
			</div>
		</div>
	</section>
</body>
</html>