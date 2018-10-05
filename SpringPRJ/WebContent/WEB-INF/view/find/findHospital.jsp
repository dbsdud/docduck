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
<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
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
				<div id="map" style="width:100%;height:400px;"></div>
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