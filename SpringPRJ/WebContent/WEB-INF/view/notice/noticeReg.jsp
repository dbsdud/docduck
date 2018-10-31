<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.dto.NoticeDTO" %>
<%@ page import="java.util.List" %>
<%
	List<NoticeDTO> nList=(List<NoticeDTO>)request.getAttribute("nList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 등록</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h1 class="text-uppercase">
						<strong>공지사항 등록</strong>
					</h1>
				</div>
			</div>
		</div>
	</header>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<form class="form-horizontal" method="post" action="/notice/noticeRegProc.do">
						<div class="form-group">
							<h4 class="section-heading">
								제목
							</h4>
							<hr class="my-4">
							<div class="col-sm-12">
								<div class="input-group">
									<input class="form-control" id="noticeTitle" name="noticeTitle" type="text" placeholder="제목을 입력하세요.">
								</div>
							</div>
							<br>
							<h4 class="section-heading">
								비밀번호
							</h4>
							<hr class="my-4">
							<div class="col-sm-12">
								<div>
								
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>