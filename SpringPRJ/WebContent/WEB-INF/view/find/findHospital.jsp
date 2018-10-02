<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>병원찾기</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
<script>
/* $.ajax({
	url:'/sido/sidoSearch.do',
	type:'post',
	dataType:'json',
	success: function(msg){
		console.log(msg.response.body.items.item);
		var myItem=msg.response.body.items.item;
		
		for(var i=0; myItem.length; i++){
			var contents='';
			console.log(myItem.length);
			contents += '<h3>' + i + '</h3>';
			contents += '<h4>' + myItem[i].addr + '</h4>';
			contents += '<h4>' + myItem[i].title+ '</h4>';
			contents += '<h4>' + myItem[i].tel + '</h4>';
			document.body.innerHTML += contents;
		}
	}
}) */
</script>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h1 class="text-uppercase">
						<strong>병원 찾기</strong>
					</h1>
				</div>
			</div>
		</div>
	</header>
	<section>
		<div class="container">
			<div class="row">
				<div id="map" style="width:100%;height:350px;"></div>
				<%@ include file="findMapJs.jsp" %>
				<p><em>지도 중심좌표가 변경되면 지도 정보가 표출됩니다</em></p>
				<p id="result"></p>
			</div>
		</div>
	</section>
	<section id="findHospitalList">
		<div class="container">
			<div class="row text-center">
			<!-- for문 돌려서 병원리스트 -->
				<div class="col-sm-3">
					1번
				</div>
				<div class="col-sm-3">
					2번
				</div>
				<div class="col-sm-3">
					3번
				</div>
				<div class="col-sm-3">
					4번
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
</body>
</html>