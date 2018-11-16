<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.dto.NoticeDTO" %>
<%
	NoticeDTO nDTO2 = (NoticeDTO)request.getAttribute("nDTO2");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>공지사항</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
<script>
function noticeDelete(noticeNo){
	var noticeDeleteConfirm = confirm("공지사항을 삭제하시겠습니까?");
	if(noticeDeleteConfirm == true){
		location.href="/notice/noticeDelete.do?noticeNo="+noticeNo;	
	}
}
function noticeUpdate(noticeNo){
	location.href="/notice/noticeUpdate.do?noticeNo="+noticeNo;
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
						<strong>공지사항</strong>
					</h1>
				</div>
			</div>
		</div>
	</header>
	<section>
	<!-- 공지사항 디테일 작성 -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h4 class="section-heading">
						<%= nDTO2.getNoticeTitle() %>
					</h4>
					<hr class="my-4">
					<p>
						<%= nDTO2.getNoticeContent() %>
					</p>
					<input type="hidden" id="userNo" value="<%= userNo %>" />
					<br>
					<% if(userNo.equals("1")) { %>
					<div class="col-sm-12">
						<button class="btn btn-primary" style="width:30%" onclick="noticeUpdate('<%= nDTO2.getNoticeNo() %>');">
							수정
						</button>
					</div>
					<br>
					<div class="col-sm-12">
						<button class="btn btn-danger" style="width:30%" onclick="noticeDelete('<%= nDTO2.getNoticeNo() %>');">
							삭제
						</button>
					</div>
					<% } %>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
</body>
</html>