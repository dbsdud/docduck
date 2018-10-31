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
<script>
function noticeRegCancel(){
	location.href="/notice/noticeList.do";
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
								내용
							</h4>
							<hr class="my-4">
							<div class="col-sm-12">
								<div class="input-group">
									<textarea class="form-control" rows="10" id="noticeContent" name="noticeContent" style="resize:none;" placeholder="내용을 입력하세요."></textarea>
								</div>
								<input type="hidden" id="noticeWriter" name="noticeWriter" value="<%= userName %>" />
								<input type="hidden" id="regNo" name="regNo" value="<%= regNo %>" />
							</div>
							<br>
							<div class="col-sm-12">
								<button class="btn btn-primary" id="noticeRegSub" type="submit" style="width:30%;" onclick="if(!noticeSubmit(this.form)){return false;}">
									등록
								</button>
							</div>
						</div>
					</form>
					<div class="col-sm-12 text-center">
						<button class="btn btn-danger" onclick="noticeRegCancel()" style="width:30%;">
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
		function noticeSubmit(check){
			// 제목 입력여부
			if(check.noticeTitle.value==""){
				alert("제목을 입력하지 않았습니다.")
				check.noticeTitle.focus()
				return false;
			}
			if(check.noticeContent.value==""){
				alert("내용을 입력하지 않았습니다.")
				check.noticeContent.focus()
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>