<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = CmmUtil.nvl((String)session.getAttribute("id"));
	String password = CmmUtil.nvl((String)session.getAttribute("password"));
	String userName = CmmUtil.nvl((String)session.getAttribute("userName"));
	String userNo = CmmUtil.nvl((String)session.getAttribute("userNo"));
	String regNo = CmmUtil.nvl((String)session.getAttribute("regNo"));
%>
<%
	String clientId = "iUPkesYtJUc1VboWmHtr"; //애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("naverCallback", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
%>
<script>
	function loginSubmit(check){
		if(check.id.value==""){
			alert("아이디를 입력하지 않았습니다.")
			check.id.focus()
			return false;
		} else {
			return true;
		}
	}
	function logout(){
		alert("로그아웃 하였습니다.")
		location.href="/user/logout.do"
	}
</script>

<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      	<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="/home.do">Doc.Duck</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse text-center" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<% if("".equals(id)) {%>
					<li class="nav-item">
						<a class="nav-link" data-toggle="modal" data-target="#login" href="#">Login</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/user/userReg.do">Join</a>
					</li>
					<%} else {%>
					<li class="nav-item">
						<!-- 마이페이지 연동 -->
						<a class="nav-link" href="/user/myPage.do"><%= userName + "님 환영합니다." %></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" onclick="logout();">Logout</a>
					</li>
					<% } %>
					<% if("admin".equals(id)) { %>
					<li class="nav-item">
						<a class="nav-link" href="/admin/adminHome.do">관리</a>
					</li>
					<% } %>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="/find/findHospital.do">병원찾기</a>
					</li>
					<!-- <li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="/find/findDrugstore.do">약국찾기</a>
					</li> -->
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="/notice/noticeList.do">공지사항</a>
					</li>
					<!-- <li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
					</li> -->
				</ul>
			</div>
		</div>
	</nav>
     <!-- 로그인 모달 -->
    <div class="modal fade" id="login">
    	<div class="modal-dialog">
    		<div class="modal-content">
    			<div class="modal-header">
					<h4 class="modal-title">
						Login to Doc.Duck
					</h4>
					<button type="button" class="close" data-dismiss="modal"><h4 class="modal-title">X</h4></button>
    			</div>
    			<div class="modal-body">
    				<form action="/user/loginProc.do" method="post" accept-charset="UTF-8">
					<div class="form-control" style="margin: auto;">
						<div class="col-sm-12 text-center">
							<p>
								<input type="text" class="form-control" style="border: none;" name="id" placeholder="아이디">
							</p>
						</div>
						<div class="col-sm-12 text-center">
							<p>
								<input type="password" class="form-control"	style="border: none;" name="password" placeholder="비밀번호">
							</p>
						</div>
					</div>
   					<div class="col-sm-12 text-center" style="padding-top : 12px;">
    					<p>
   							<button class="btn btn-primary btn-block" onclick="if(!loginSubmit(this.form)){return false;}" style="font-size: 14px;">
   								로그인
   							</button>
   						</p>
   					</div>
   					<div class="col-sm-12 text-center">
	   					<a id="kakao-login-btn">
   						<a href="http://developers.kakako.com/logout"></a>
   					</div>
   					<br>
					<script type='text/javascript'>
						//<![CDATA[
						// 사용할 앱의 JavaScript 키를 설정해 주세요.
						Kakao.init('3b51662875dac592f716746c1575ee20');
						// 카카오 로그인 버튼을 생성합니다.
						Kakao.Auth.createLoginButton({
							container : '#kakao-login-btn',
							success : function(authObj) {
								// 로그인 성공시, API를 호출합니다.
								Kakao.API.request({
									url: '/v2/user/me',
									success: function(res){
										alert(JSON.stringify(res));
									},
									fail: function(error){
										alert(JSON.stringify(error));
									}
								});
								alert(JSON.stringify(authObj));
							},
							fail : function(err) {
								alert(JSON.stringify(err));
							}
						});
						//]]>
					</script>
					<div class="col-sm-12 text-center">
						<a href="<%= apiURL %>"><img src="/Resources/image/naverLogin.PNG" style="height:49px;"></a>
					</div>
   				</form>
   				<div class="modal-footer" style="clear:both;">
   					<div class="col-sm-6" style="text-align: left;">
   						<a href="/user/userReg.do">회원가입</a>
   					</div>
   					<div class="col-sm-6" style="text-align: right;">
   						<a href="/user/findAccount.do">내 계정 찾기</a>
   					</div>
				</div>
   			</div>
   		</div>
   	</div>
</div>