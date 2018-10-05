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
				<div id="area" class="col-sm-6 form-group">
					<select class="form-control">
						<option value="n">지역 선택</option>
						<option value="sido">시, 도</option>
						<option value="gugun">구, 군</option>
						<option value="dong">읍, 면, 동</option>
					</select>
				</div>
				<div id="department" class="col-sm-6 form-group">
					<select class="form-control">
						<option value="n">진료 과목</option>
						<option value="01">내과</option>
						<option value="49">치과</option>
						<option value="14">피부과</option>
						<option value="12">안과</option>
						<option value="05">정형외과</option>
						<option value="08">성형외과</option>
						<option value="80">한의원</option>
						<option value="10">산부인과</option>
						<option value="11">소아청소년과</option>
						<option value="13">이비인후과</option>
						<option value="05">정형외과</option>
						<option value="04">외과</option>
						<option value="02">신경과</option>
						<option value="09">마취통증의학과</option>
						<option value="21">재활의학과</option>
						<option value="23">가정의학과</option>
						<option value="16">영상/검진의학과</option>
						<option value="15">비뇨기과</option>
						<option value="">종합병원</option>
					</select>
				</div>
			</div>
		</div>
	</section>
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