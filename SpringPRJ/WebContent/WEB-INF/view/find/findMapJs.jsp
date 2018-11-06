<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b51662875dac592f716746c1575ee20&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/v3.js" type="text/javascript"></script>
<!-- <script>
/* 전국 병원지도 */
function geoAddr(allSido){
	var sidoGeo=[];
	var total = allSido.length;
	var counter = 0;
	var geocoder = new daum.maps.services.Geocoder();
	var callback = function(result, status){
		counter++;
		if(status === daum.maps.services.Status.OK){
			var cy = result[0].y;
			var cx = result[0].x;
			sidoGeo.push({
				title : result[0].address_name,
				latlng : new daum.maps.LatLng(cy, cx)
			})
			if(total === counter){
				allHospMap(sidoGeo, allSido);
			}
		};
		return result;
	}
	for(var i = 0; i < total; i++){
		geocoder.addressSearch(allSido[i].ctprvnNm, callback);
	}
};

// 구군 주소 좌표 변환
function geoAddrGugun(addr,allGugun,pos){
	var gugunGeo = [];
	var total = allGugun.length;
	var counter = 0;
	var geocoder = new daum.maps.services.Geocoder();
	var callback = function(result, status){
		counter++;
		if(status === daum.maps.services.Status.OK){
			var cy = result[0].y;
			var cx = result[0].x;
			gugunGeo.push({
				title : result[0].address_name,
				latlng : new daum.maps.LatLng(cy, cx)
			});
			if(total === counter){
				allHospGugunMap(allGugun, gugunGeo, pos, addr);
			}
		};
		return result;
	}
	for(var i = 0; i < total; i++){
		geocoder.addressSearch(addr+" "+allGugun[i].signguNm, callback);
	}
};

// 동 좌표 변환
function geoAddrDong(addr, addrG, allDong, pos){
	var dongGeo=[];
	var total = allDong.length;
	var counter = 0;
	var geocoder = new daum.maps.services.Geocoder();
	var callback = function(result, status){
		counter++;
		if(status === daum.maps.services.Status.OK){
			var cy = result[0].y;
			var cx = result[0].x;
			dongGeo.push({
				title : result[0].address_name,
				latlng : new daum.maps.LarLng(cy, cx)
			});
			if(total === counter){
				allHospDongMap(allDong, dongGeo, pos);
			}
		};
		return result;
	}
	for(var i=0; i<total; i++){
		geocoder.addressSearch(addr + " " + addrG + " " + allDong[i].adongNm, callback);
	}
};
</script> -->
<script>
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
/* function displayMarker(locPosition, message) {
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png",
		imageSize = new daum.maps.Size(24,35);
	var markerImage= new daum.maps.MarkerImage(imageSrc, imageSize);
	var marker = new daum.maps.Marker({
		image : markerImage,
		position: locPosition, 
		clickable : true,
	});
	var iwContent = message,
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
} */
/* Geolocation Marker Create End!!! */
	var infowindow = new daum.maps.InfoWindow({zIndex:1});
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	    mapOption = { 
	        center: new daum.maps.LatLng(37.549808, 126.842297), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    };
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	var ps = new daum.maps.services.Places(map);
	ps.categorySearch('HP8', placesSearchCB, {useMapBounds:true});
	function placesSearchCB(data, status, pagination){
		if(status === daum.maps.services.Status.OK){
			for(var i=0; i<data.length; i++){
				displayMarker(data[i]);
			}
		}
	}
	function displayMarker(place){
		var marker = new daum.maps.Marker({
			map:map,
			position:new daum.maps.LatLng(place.y, place.x)
		});
		daum.maps.event.addListener(marker,'click',function(){
			infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
		});
	}
	
	
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