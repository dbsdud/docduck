<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b51662875dac592f716746c1575ee20&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/v3.js" type="text/javascript"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
/* Geolocation Marker Create Start!!! */
// HTML5의 geolocation으로 사용할 수 있는지 확인
if (navigator.geolocation) {
	// GeoLocation을 이용해서 접속 위치 얻어옴
	navigator.geolocation.getCurrentPosition(function(position){
		var lat = position.coords.latitude, // 위도
		lon = position.coords.longitude; // 경도
	var locPosition = new daum.maps.LatLng(lat, lon), // 얻어온 좌표에 마커 생성
		message = '<div style="padding:5px;">여기에 계신가요?</div>';
		displayMarker(locPosition, message);
	}); 
} else {
	var locPosition = new daum.maps.LatLng(33.450701, 126.570667),
		message = '위치정보를 가져올 수 없습니다.'
	displayMarker(locPosition, message);
}
function displayMarker(locPosition, message) {
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png",
		imageSize = new daum.maps.Size(24,35);
	var markerImage= new daum.maps.MarkerImage(imageSrc, imageSize);
	var marker = new daum.maps.Marker({
		image : markerImage,
		clickable : true
	});
	var iwContent = '<div style="padding : 5px;">Hello World!</div><br>',
		iwRemoveable = true;
	var infowindow = new daum.maps.InfoWindow({
		content : iwContent,
		removable : iwRemoveable
	});
	marker.setMap(map);
	daum.maps.event.addListener(map,'click',function(mouseEvent){
		var latlng = mouseEvent.latLng;
		marker.setPosition(latlng);
	});
	daum.maps.event.addListener(marker,'click',function() {
		infowindow.open(map, marker);
	});
	infowindow.open(map, marker);
	map.setCenter(locPosition);
}
/* Geolocation Marker Create End!!! */
// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'center_changed', function() {
    // 지도의  레벨을 얻어옵니다
    var level = map.getLevel();
    // 지도의 중심좌표를 얻어옵니다 
    var latlng = map.getCenter(); 
    var message = '<p>지도 레벨은 ' + level + ' 이고</p>';
    message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '입니다</p>';
    var resultDiv = document.getElementById('result');
    resultDiv.innerHTML = message;
});
</script>