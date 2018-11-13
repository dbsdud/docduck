<%@page import="poly.dto.ApiDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ApiDTO aDTO = (ApiDTO)request.getAttribute("aDTO");
	ApiDTO aDTO2 = (ApiDTO)request.getAttribute("aDTO2");
	ApiDTO aDTO3 = (ApiDTO)request.getAttribute("aDTO3");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>병원상세정보 - <%=aDTO2.getYadmNm() %></title>
<style>
.customoverlay {
	position: relative;
	bottom: 85px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	background: #d95050;
	background: #d95050
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
	margin-right: 35px;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: bold;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}
</style>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h1 class="text-uppercase">
						<strong>병원상세정보</strong>
					</h1>
				</div>
			</div>
		</div>
	</header>
	<section>
		<div class="container">
			<div class="row">
				<input type="hidden" id="hosp_no" value="<%=aDTO2.getHosp_no() %>" />
				<input type="hidden" id="yadmNm" value="<%=aDTO2.getYadmNm() %>" />
				<input type="hidden" id="postNo" value="<%=aDTO2.getPostNo() %>" />
				<input type="hidden" id="telno" name="telno" value="<%=aDTO2.getTelno() %>" />
				<input type="hidden" id="hospUrl" value="<%=aDTO2.getHospUrl() %>" />
				<input type="hidden" id="YPos" value="<%=aDTO2.getYPos() %>" />
				<input type="hidden" id="XPos" value="<%=aDTO2.getXPos() %>" />
				<div class="col-lg-12 text-center">
					<h4 class="section-heading">
						<%= aDTO2.getYadmNm() %>
					</h4>
					<hr class="my-4">
					
				</div>
				<div id="map" style="width: 100%; height:400px;">
				
				</div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b51662875dac592f716746c1575ee20&libraries=services,clusterer,drawing"></script>
				<script src="http://dmaps.daum.net/map_js_init/v3.js" type="text/javascript"></script>
				<script>
					var title = '<%= aDTO2.getYadmNm() %>';
					var hosp_no = '<%= aDTO2.getHosp_no() %>';
					var mapContainer = document.getElementById('map')
					var mapOption = {
						center : new daum.maps.LatLng(<%= aDTO2.getYPos() %>,<%= aDTO2.getXPos() %>),
						level:3
					};
					var map = new daum.maps.Map(mapContainer, mapOption);
					var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // 마커이미지의 주소입니다    
				    	imageSize = new daum.maps.Size(24, 35); // 마커이미지의 크기입니다
					var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize),
						markerPosition = new daum.maps.LatLng(<%= aDTO2.getYPos() %>,<%= aDTO2.getXPos() %>);
					var marker = new daum.maps.Marker({
						position:markerPosition,
						image : markerImage
					});
					marker.setMap(map);
					var content = '<div class="customoverlay">' +
								'<a href="/review/reviewDetail.do?hosp_no='+hosp_no+'">' + 
								'<span class="title">'+title+'</span>' +
								'</a>' + 
								'</div>';
					var position = new daum.maps.LatLng(<%= aDTO2.getYPos() %>,<%= aDTO2.getXPos() %>);
					var customOverlay = new daum.maps.CustomOverlay({
						map:map,
						position:position,
						content:content,
						yAnchor:0
					})
				</script>
				<div class="col-lg-12 text-center" style="padding-top:5%;">
					<h5>진료만족도 | test</h5>
					<hr class="my-4">
				</div>
				<div class="col-sm-12">
					<h5 class="section-heading title">진료시간</h5>
					<span class="col-sm-6 pull-left title">평일</span>
					<span class="col-sm-6 pull-left title">토</span>
					<span class="col-sm-6 pull-left"><%= aDTO3.getDutyTime1s() %> ~ <%= aDTO3.getDutyTime1c() %></span>
					<% if(aDTO3.getDutyTime6s().equals("")) { %>
					<span class="col-sm-6 pull-left">휴진</span>
					<% } else { %>
					<span class="col-sm-6 pull-left"><%= aDTO3.getDutyTime6s() %> ~ <%= aDTO3.getDutyTime6c() %></span>
					<% }  %>
					
					<span class="col-sm-6 pull-left title" style="padding-top:3%;">일,공휴일</span>
					<span class="col-sm-6 pull-left title" style="padding-top:3%;">점심시간</span>
					<% if(aDTO3.getDutyTime7s().equals("")) { %>
					<span class="col-sm-6 pull-left">휴진</span>
					<% } else { %>
					<span class="col-sm-6 pull-left"><%= aDTO3.getDutyTime7s() %> ~ <%= aDTO3.getDutyTime7c() %></span>
					<% } %>
					<span class="col-sm-6 pull-left">1300 ~ 1400</span>
				</div>
				<div class="col-sm-12" style="padding-top:5%;">
					<h5 class="section-heading title">전화번호</h5>
					<span class="col-sm-12 pull-left"><%= aDTO2.getTelno() %></span>
				</div>
				<div class="col-sm-12" style="padding-top:5%;">
					<h5 class="section-heading title">진료 특이사항</h5>
					<% if(aDTO3.getDutyInf().equals("")) { %>
					<span class="col-sm-12">정보가 없습니다.</span>
					<% } else { %>
					<span class="col-sm-12"><%= aDTO3.getDutyInf() %></span>
					<% } %>
				</div>
				<div class="col-sm-12" style="padding-top:5%;">
					<h5 class="section-heading title">상세주소</h5>
					<span class="col-sm-12 pull-left"><%= aDTO2.getAddr() %></span>
				</div>
			</div>			
		</div>
	</section>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
</body>
</html>