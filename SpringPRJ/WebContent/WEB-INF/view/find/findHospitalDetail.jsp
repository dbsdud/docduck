<%@page import="poly.dto.ApiDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ApiDTO aDTO = (ApiDTO)request.getAttribute("aDTO");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
</head>
<body id="page-top">
	<%@ include file="/WEB-INF/view/homeNav.jsp" %>
	<header class="masthead text-center text-white d-flex">
		<div class="container my-auto">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<h1 class="text-uppercase">
						<strong>리뷰</strong>
					</h1>
				</div>
			</div>
		</div>
	</header>
	<section>
		<div class="container">
			<div class="row">
				<%-- <input type="text" id="YPos" value="<%=aDTO.getYPos() %>" />
				<input type="text" id="XPos" value="<%=aDTO.getXPos() %>" /> --%>
				<div id="map" style="width: 100%; height:400px;">
				
				</div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b51662875dac592f716746c1575ee20&libraries=services,clusterer,drawing"></script>
				<script src="http://dmaps.daum.net/map_js_init/v3.js" type="text/javascript"></script>
				<%-- <script>
					var mapContainer = document.getElementById('map')
					var mapOption = {
						center : new daum.maps.LatLng(<%= aDTO.getYPos() %>,<%= aDTO.getXPos() %>),
						level:3
					};
					var map = new daum.maps.Map(mapContainer, mapOption);
				</script> --%>
			</div>			
		</div>
	</section>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
</body>
</html>