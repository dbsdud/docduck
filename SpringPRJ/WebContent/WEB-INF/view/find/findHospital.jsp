<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.dto.ApiDTO" %>
<%
	List<ApiDTO> aList = (List<ApiDTO>)request.getAttribute("aList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>병원찾기</title>
<%@ include file="/WEB-INF/view/mainCss.jsp" %>
<script>
$(function(){
	// 병원찾기
	$('#findHosp').click(function(){
		var sido = $("#sido").val();
		var gugun = $("#gugun").val();
		var dong = $("#dong").val();
		var sidoVal = $('#sidoVal').val();
		var gugunVal = $('#gugunVal').val();
		var dongVal = $('#dongVal').val();
		if(sidoVal==''||gugunVal==''||dongVal==''){
			alert("유효하지 않은 검색조건입니다.")
			$("#sido").focus();
			return false;
		} else {
			$.ajax({
				url : "/find/findHospSearch.do",
				type : 'POST',
				data : {
					'sido' : sido,
					'gugun' : gugun,
					'dong' : dong
				},
				success : function(data){
					var contents="";
					$.each(data, function(key,value){
						contents+="<tr style='height:40px;'>";
						contents+="<td style='overflow:hidden; text-overflow:ellipsis;'><a href='/find/findHospitalDetail.do?hosp_no="+value.hosp_no+"&telno="+value.telno+"'>"+value.yadmNm+"</a></td>";
						contents+="<td style='overflow:hidden; text-overflow:ellipsis;'>"+value.addr+"</td>";
						contents+="<td class='text-center'>"+value.telno+"</td>";
						contents+="</tr>";
					});
					$('#showFindTable').html(contents);
				}
			})
		}
	});
})

</script>
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
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
<%@ include file="findHospitalAPI.jsp" %>
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
			<div class="row text-center">
				<div class="col-sm-3 form-group">
					<select name="sido" id="sido" title="시/도 선택" class="form-control">
						<option>시/도 선택</option>
						<option value="110000">서울</option>
						<option value="210000">부산</option>
						<option value="220000">인천</option>
						<option value="230000">대구</option>
						<option value="240000">광주</option>
						<option value="250000">대전</option>
						<option value="260000">울산</option>
						<option value="310000">경기</option>
						<option value="320000">강원</option>
						<option value="330000">충북</option>
						<option value="340000">충남</option>
						<option value="350000">전북</option>
						<option value="360000">전남</option>
						<option value="370000">경북</option>
						<option value="380000">경남</option>
						<option value="390000">제주</option>
						<option value="410000">세종</option>
					</select>
				</div>
				<div class="col-sm-3 form-group">
					<select name="gugun" id="gugun" title="시/군/구 선택" class="form-control">
						<option>시/군/구 선택</option>
					</select>
				</div>					
				<div class="col-sm-3 form-group">
					<select name="dong" id="dong" title="읍/면/동/로 선택" class="form-control">
						<option>읍/면/동 선택</option>
					</select>
				</div>
				<div class="col-sm-3 form-group text-center">
					<button class="btn btn-primary" id="findHosp" style="width:100%;">
						검색
					</button>
				</div>
				<input type="hidden" id="sidoVal" value="" />
				<input type="hidden" id="gugunVal" value="" />
				<input type="hidden" id="dongVal" value="" />
			</div>
		</div>
		<div class="container">
			<div class="row">
				<table class="col-lg-12 table-hover table-bordered">
					<thead class="text-center">
						<tr>
							<th style="width:20%; height:40px;">병원명</th>
							<th style="width:55%;">주소</th>
							<th style="width:25%;">전화번호</th>
						</tr>
					</thead>
					<tbody id="showFindTable">
						<tr class="text-center">
							<th colspan="3">조회된 검색결과가 없습니다.</th>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<div class="row">
				<div id="map" style="width: 100%; height:400px;">
				
				</div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dfe82cc3269d1711faf54135539438a7&libraries=services,clusterer,drawing"></script>
				<script src="http://dmaps.daum.net/map_js_init/v3.js" type="text/javascript"></script>
				<script>
					var infowindow = new daum.maps.InfoWindow({zIndex:1});
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new daum.maps.LatLng(37.549795, 126.842306), // 지도의 중심좌표
				        level: 5 // 지도의 확대 레벨
				    };
			
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new daum.maps.Map(mapContainer, mapOption);
					// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
					currentPosition="";
					if (navigator.geolocation) {
					    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
					    navigator.geolocation.getCurrentPosition(function(position) {
					        var lat = position.coords.latitude, // 위도
					        	lon = position.coords.longitude; // 경도
					        	currentPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					            message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
					        // 마커와 인포윈도우를 표시합니다
					        displayMarker(currentPosition, message);
					      });
					} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
					    var currentPosition = new daum.maps.LatLng(37.549795, 126.842306),    
					        message = '현재 위치를 가져올 수 없습니다.';
							alert(message);
					    displayMarker(currentPosition, message);
					}
					// 지도에 마커와 인포윈도우를 표시하는 함수입니다
					function displayMarker(currentPosition, message) {
					    // 마커를 생성합니다
					    var marker = new daum.maps.Marker({  
					        map: map, 
					        position: currentPosition
					    }); 
						daum.maps.event.addListener(marker,'click',function(){
							infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
					        infowindow.open(map, marker);
						}); 
					    var iwContent = message, // 인포윈도우에 표시할 내용
					        iwRemoveable = true;
					    // 인포윈도우를 생성합니다
					    var infowindow = new daum.maps.InfoWindow({
					        content : iwContent,
					        removable : iwRemoveable
					    });
					    // 인포윈도우를 마커위에 표시합니다 
					    infowindow.open(map, marker);
					    // 지도 중심좌표를 접속위치로 변경합니다
					    map.setCenter(currentPosition);
					}
					
					// 장소 검색 객체를 생성합니다
					var ps = new daum.maps.services.Places(map); 
					// 카테고리로 병원을 검색합니다
					ps.categorySearch('HP8', placesSearchCB, {useMapBounds:true}); 
					// 키워드 검색 완료 시 호출되는 콜백함수 입니다
					function placesSearchCB (data, status, pagination) {
					    if (status === daum.maps.services.Status.OK) {
					        for (var i=0; i<data.length; i++) {
					            displayMarker(data[i]);    
					        }       
					    }
					}
					function displayMarker(place){
						var marker = new daum.maps.Marker({
							map:map,
							position: new daum.maps.LatLng(place.y, place.x)
						});
						daum.maps.event.addListener(marker,'click',function(){
							infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
					        infowindow.open(map, marker);
						});
					}
				</script>
			</div>
		</div>
	</section>
	<%@ include file="findMapJs.jsp"%>
	<%@ include file="/WEB-INF/view/homeFooter.jsp" %>
	<%@ include file="/WEB-INF/view/mainJs.jsp" %>
</body>
</html>