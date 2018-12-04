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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>공지사항 등록</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
<script>
function noticeRegCancel(){
	location.href="/notice/noticeList.do";
}
</script>
<!-- 에디터 -->
<script src="/Resources/smarteditor2-master/workspace/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- include summernote-ko-KR -->
<script src="/Resources/summernote/dist/lang/summernote-ko-KR.js"></script>
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
					<form class="form-horizontal" method="post" action="/notice/noticeRegProc.do" id="noticeForm" onsubmit="return postForm()">
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
									<textarea id="noticeContent" name="noticeContent"></textarea>
								</div>
								<input type="hidden" id="noticeWriter" name="noticeWriter" value="<%= userName %>" />
								<input type="hidden" id="regNo" name="regNo" value="<%= regNo %>" />
							</div>
							<script>
								$(document).ready(function() {
									$('#noticeContent').summernote({
										height : 300,
										width : 1180,
										minHeight : null,
										maxHeight : null,
										focus : true,
										lang : 'ko-KR'
									});
								});
								var postForm = function(){
									var noticeContent = $('textarea[name="noticeContent"]').html($('#noticeContent').code());
								}
							</script>
							<br>
							<div class="col-sm-12">
								<button class="btn btn-primary" id="noticeRegSub" type="submit" style="width:30%;" onclick="if(!noticeSubmit(this.form)){return false;}"> <!--  -->
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
			if(check.noticeTitle.value==""){
				alert("제목을 입력하지 않았습니다.")
				check.noticeTitle.focus()
				return false;
			} else if(check.noticeContent.value==""){
				alert("내용을 입력하지 않았습니다.")
				check.noticeContent.focus()
				return false;
			} else {
				var noticeSubmitConfirm = confirm("공지사항을 등록하시겠습니까?");
				if(noticeSubmitConfirm == true){
					return true;
				}	
			}
		}
	</script>
</body>
<!-- 네이버 스마트 에디터 -->
<!-- <script>
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "noticeContent",
	sSkinURI: "/Resources/smarteditor2-master/workspace/SmartEditor2Skin.html",
	fCreator: "createSEditor2",
	htParams : {
		bUseToolbar : true,
		bUseVerticalResizer : true,
		bUseModeChanger : true,
		fOnBeforeUnload : function(){
			
		}
	},
	fOnAppLoad : function(){
		
	}
});
</script>
<script>
window.onload = function(){
	// 버튼 누를때 실행
	var btn = document.getElementById("noticeRegSub");
	btn.onclick = function() {
		submitContents(btn);
	}
}
function submitContents(){
	var elClickedObj = $("#form");
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	var noticeContent = $("#ir1").val();
	if(noticeContent == ""  || noticeContent == null || noticeContent == '&nbsp;' || noticeContent == '<p>&nbsp;</p>'){
		alert("내용을 입력하세요.");
		oEditors.getById["ir1"].exec("FOCUS");
		return;
	}
	try {
		elClickedObj.submit();
	} catch(e){
		
	}
}

</script> -->
</html>