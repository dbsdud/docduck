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
<title>공지사항</title>
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css">
<style>
.results tr[visible='false'],
.no-result{
	display:none;
}
.results tr[visible='true']{
	display:table-row;
}
.counter{
	padding:8px;
	color:#ccc;
}
div.fw-container div.fw-body div.content {
	margin-top: 5em;
}
div.fw-body h1 {
	display: none;
}
div.fw-container {
	z-index: 1;
}
</style>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
<script>
$(document).ready( function () {
    $('#noticeTable').DataTable();
} );
</script>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
	<input type="hidden" value="<%=userNo %>" />
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
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<table id="noticeTable" class="display table table-hover table-bordered results text-center">
						<thead>
							<tr>
								<th style="width: 10%">No</th>
								<th style="width: 50%">제목</th>
								<th style="width: 15%">작성자</th>
								<th style="width: 15%">작성일</th>
								<th style="width: 10%">조회수</th>
							</tr>
							<%-- <% if(nList.size()==0){ %>
							<tr class="warning">
								<td colspan="5">
									<i class="fa fa-warning"></i>
									<i> 등록된 공지사항이 없습니다.</i>
								</td>
							</tr>
							<% } else { %>
							<tr class="warning no-result">
								<td colspan="5">
									<i class="fa fa-warning"></i>
									<i> 검색 결과가 없습니다.</i>
								</td>
							</tr>
							<% } %> --%>
						</thead>
						<tbody>
						<% if(nList!=null) { %>
							<% for(int i=0; i<nList.size(); i++) { %>
							<tr>
								<th scope="row"><%=nList.get(i).getNoticeNo() %></th>
								<td><%=nList.get(i).getNoticeTitle() %></td>
								<td><%=nList.get(i).getNoticeWriter() %></td>
								<td><%=nList.get(i).getRegDate() %></td>
								<td><%=nList.get(i).getRegDate() %></td>
							</tr>
							<% } %>
						<% } %>
						</tbody>
					</table>
					<% if(regNo.equals("1")) { %>
					<div class="col-sm-12">
						<div class="form-group pull-right">
							<a href="/notice/noticeReg.do">
								<button class="btn btn-primary btn-block" id="writeNotice">
									작성
								</button>
							</a>
						</div>
					</div>
					<% } %>
					<div class="content">
						<div class="demo">
							<div id="demo4"></div>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</section>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="/Resources/user/vendor/jquery/jquery.dataTables.min.js"></script>
	<!-- <script>
	$(document).ready(function(){
		$(".search").keyup(function(){
			var searchTerm = $(".search").val();
			var listItem = $('.results tbody').children('tr');
			var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
			
			$.extend($.expr[':'], {'containsi': function(elem, i, match, array){
				return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
			}
			});
			$(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
				$(this).attr('visible','false');
	  		});
			$(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
				$(this).attr('visible','true');
			});
			var jobCount = $('.results tbody tr[visible="true"]').length;
			$('.counter').text(jobCount + ' item');
			if(jobCount == '0'){
				$('.no-result').show();
			} else {
				$('.no-result').hide();
			}
		});
	});
	</script> -->
</body>
</html>