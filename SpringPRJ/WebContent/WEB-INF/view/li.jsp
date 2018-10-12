<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="mainCss.jsp" %>
</head>
<body id="page-top">
<%@ include file="homeNav.jsp" %>
<section class="bg-primary">
<script>
function callAjax(){
	$.ajax({
		url : 'http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?pageNo=1&numOfRows=10&_type=json&ServiceKey=ZNn3FaZRn8RzHpElf%2BdJ9uFHlHmA9fzoYsyghDb5UZGYAxeF4tRc%2B4Ch%2BRHKo11qtYgzu6Dn%2FZz%2F9W5OpNWzfQ%3D%3D',
		data : {
			
		},
		success : function(result) {
			$("temp").html("<strong>" + result + "</strong>");
		}
	});
}
</script>
<button onclick = "callAjax()">불러오기</button>
</section>
<%@ include file="mainJs.jsp" %>
</body>
</html>