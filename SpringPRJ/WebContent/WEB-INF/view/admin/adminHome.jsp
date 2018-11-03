<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.dto.NoticeDTO" %>
<%@ page import="poly.dto.UserDTO" %>
<%@ page import="java.util.List" %>
<%
	List<UserDTO> uList=(List<UserDTO>)request.getAttribute("uList");
	List<NoticeDTO> nList=(List<NoticeDTO>)request.getAttribute("nList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Doc.Duck 관리</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
<%-- <%@ include file="adminCss.jsp" %> --%>
<script>
$(document).ready(function(){
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	})
})
</script>
<script>
$(document).ready( function () {
	$('#userTable').DataTable({
		"bAutoWidth" : false,
		"lengthMenu" : [[10,25,50,100], [10,25,50,100]],
		"pageLength" : 10,
		columns:[
			{title:'No'},
			{title:"아이디"},
			{title:"이름"}
		]
	});
} );
$(document).ready( function () {
	$('#reviewTable').DataTable({
		"bAutoWidth" : false,
		"lengthMenu" : [[10,25,50,100], [10,25,50,100]],
		"pageLength" : 10,
		columns:[
			{title:'No'},
			{title:"내용"},
			{title:"등록일"}
		]
	});
} );
$(document).ready( function () {
	$('#noticeTable').DataTable({
		"bAutoWidth" : false,
		"lengthMenu" : [[10,25,50,100], [10,25,50,100]],
		"pageLength" : 10,
		columns:[
			{title:'No'},
			{title:"제목"},
			{title:"등록일"}
		]
	});
} );

</script>
<style>
ul.tabs{
  margin: 0px;
  padding: 0px;
  list-style: none;
}
ul.tabs li{
  background: none;
  color: #222;
  display: inline-block;
  padding: 10px 15px;
  cursor: pointer;
}
 
ul.tabs li.current{
  background: #ededed;
  color: #222;
}
 
.tab-content{
  display: none;
  background: #ededed;
  padding: 15px;
}
 
.tab-content.current{
  display: inherit;
}
#tab-1>table>thead>tr>th>.no{
	width:10%;
}
#tab-1>table>thead>tr>th>.w45{
	width:45%;
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
						<strong>Doc.Duck 관리</strong>
					</h1>
				</div>
			</div>
		</div>
	</header>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="tabs">
						<li class="tab-link current" data-tab="tab-1">회원관리</li>
						<li class="tab-link" data-tab="tab-2">리뷰관리</li>
						<li class="tab-link" data-tab="tab-3">공지사항관리</li>
					</ul>
				</div>
				<div class="col-lg-12">
					<div id="tab-1" class="tab-content current">
						<table id="userTable" class="text-center display table-hover table-bordered" style="width:100%;">
							<thead>
								<tr>
									<th style="width:10%;">No</th>
									<th style="width:45%;">아이디</th>
									<th style="width:45%;">이름</th>
								</tr>
							</thead>
							<tbody>
							<% if(uList!=null) { %>
								<% for(int i=0; i<uList.size(); i++) { %>
								<tr>
									<th scope="row"><%= uList.get(i).getUserNo() %></th>
									<td><a href="/admin/adminUserDetail.do?userNo=<%=uList.get(i).getUserNo() %>"><%=uList.get(i).getId() %></a></td>
									<td><%=uList.get(i).getUserName() %></td>
								</tr>
								<% } %>
							<% } %>
							</tbody>
						</table>
					</div>
					<div id="tab-2" class="tab-content">
						<table id="reviewTable" class="display table table-hover table-bordered results text-center">
							<thead>
								<tr>
									<th style="width:10%;">No</th>
									<th style="width:65%;">내용</th>
									<th style="width:25%">등록일</th>
								</tr>
							</thead>						
						</table>
					</div>
					<div id="tab-3" class="tab-content">
						<table id="noticeTable" class="text-center display table-hover table-bordered" style="width:100%;">
							<thead>
								<tr>
									<th style="width:10%;">No</th>
									<th style="width:65%;">제목</th>
									<th style="width:25%;">등록일</th>
								</tr>
							</thead>
							<tbody>
							<% if(nList!=null) { %>
								<% for(int i=0; i<nList.size(); i++) { %>
								<tr>
									<th scope="row"><%= nList.get(i).getNoticeNo() %></th>
									<td><a href="/notice/noticeDetail.do?noticeNo=<%=nList.get(i).getNoticeNo() %>"><%=nList.get(i).getNoticeTitle() %></a></td>
									<td><%=nList.get(i).getRegDate() %></td>
								</tr>
								<% } %>
							<% } %>
							</tbody>						
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="/Resources/user/vendor/jquery/jquery.dataTables.min.js"></script>
</body>
</html>