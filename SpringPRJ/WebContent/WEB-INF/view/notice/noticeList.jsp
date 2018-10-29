<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
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
</style>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
	<input type="hidden" value="<%=userName %>" />
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
					<div class="form-group pull-right">
						<input type="text" class="search form-control" placeholder="search...">
					</div>
					<span class="counter pull-right"></span>
					<table class="table table-hover table-bordered results">
						<thead>
							<tr>
								<th style="width: 10%">No</th>
								<th style="width: 50%">제목</th>
								<th style="width: 20%">작성자</th>
								<th style="width: 20%">작성일</th>
							</tr>
							<tr class="warning no-result">
								<td colspan="4">
									<i class="fa fa-warning"></i>
									<i> No result</i>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>naver</td>
								<td>Software Developer</td>
								<td>대전</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>naver</td>
								<td>Software Developer</td>
								<td>대전</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>daum</td>
								<td>Purchasing</td>
								<td>대구</td>
							</tr>
							<tr>
								<th scope="row">4</th>
								<td>google</td>
								<td>Sales</td>
								<td>부산</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>		
		</div>
	</section>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script>
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
	</script>
</body>
</html>