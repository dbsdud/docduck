<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 자체회원 */
	String id = CmmUtil.nvl((String)session.getAttribute("id"));
	String password = CmmUtil.nvl((String)session.getAttribute("password"));
	String userName = CmmUtil.nvl((String)session.getAttribute("userName"));
	String userNo = CmmUtil.nvl((String)session.getAttribute("userNo"));
	String regNo = CmmUtil.nvl((String)session.getAttribute("regNo"));
%>
<%
	/* 카카오 */
	String kId = CmmUtil.nvl((String)session.getAttribute("kId"));
	String kName = CmmUtil.nvl((String)session.getAttribute("kName"));
%>
<%
	/* 네이버 */
	String email = CmmUtil.nvl((String)session.getAttribute("email"));
	String uniqId = CmmUtil.nvl((String)session.getAttribute("uniqId"));
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
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      	<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="/home.do">Doc.Duck</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse text-center" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<% if("".equals(id) && "".equals(kId) && "".equals(uniqId)) {%>
					<li class="nav-item">
						<a class="nav-link" data-toggle="modal" data-target="#login" href="#">Login</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/user/userReg.do">Join</a>
					</li>
					<%} else {%>
					<% if(!"".equals(id)) { %>
					<li class="nav-item">
						<!-- 마이페이지 연동 -->
						<a class="nav-link" href="/user/myPage.do"><%= userName + "님 환영합니다." %></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" onclick="logout();">Logout</a>
					</li>
					<% } else if(!"".equals(kId)) { %>
					<li class="nav-item">
						<a class="nav-link" href="#"><%= kName + "님 환영합니다." %></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" onclick="logout();">Logout</a>
					</li>
					<% } else { %>
					<li class="nav-item">
						<a class="nav-link" href="#"><%= email + "님 환영합니다." %></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" onclick="logout();">Logout</a>
					</li>
					<% } %>
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
	   					<a id="kakao-login-btn"></a>
   						<a href="http://developers.kakako.com/logout"></a>
   					</div>
   					<br>
					<script type='text/javascript'>
						//<![CDATA[
						// 사용할 앱의 JavaScript 키를 설정해 주세요.
						Kakao.init('dfe82cc3269d1711faf54135539438a7');
						var kId = '';
						var kName = '';
						// 카카오 로그인 버튼을 생성합니다.
						Kakao.Auth.createLoginButton({
							container : '#kakao-login-btn',
							success : function(authObj) {
								// 로그인 성공시, API를 호출합니다.
								Kakao.API.request({
									url: '/v2/user/me',
									success: function(res){
										alert(JSON.stringify(res));
										kId = JSON.stringify(res.id);
										kName = JSON.stringify(res.properties.nickname);
										console.log(" res.id : " +JSON.stringify(res.id));
										console.log(" res.properties.nickname : " + JSON.stringify(res.properties.nickname));
										console.log(" kId : " + JSON.stringify(res.id));
										console.log(" kName : " + JSON.stringify(res.properties.nickname));
										location.href='/kakaoCallback.do?kId='+kId+'&kName='+kName;
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
					<div id="naverIdLogin" class="col-sm-12 text-center"></div>
					<br>
					<div class="col-sm-12 text-center">
					<!-- <div id="fb-root" class="text-center">
						<div class="fb-login-button text-center" data-max-rows="1" data-size="large" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false">
						</div>	
					</div> -->
					</div>
					<script type="text/javascript">
						var naverLogin = new naver.LoginWithNaverId({
							clientId: "iUPkesYtJUc1VboWmHtr",
							callbackUrl: "http://localhost:8080/naverCallback.do",
							isPopup: false, /* 팝업을 통한 연동처리 여부 */
							callbackHandle:false,
							loginButton: {color: "green", type: 3, height: 49} /* 로그인 버튼의 타입을 지정 */
						});
						/* 설정정보를 초기화하고 연동을 준비 */
						naverLogin.init();
						naverLogin.getLoginStatus(function (status) {
							if (status) {
								var email = naverLogin.user.getEmail();
								var name = naverLogin.user.getNickName();
								var uniqId = naverLogin.user.getId();
								console.log(email);
								console.log(uniqId);
								console.log(name);
								console.log(status);
								/* location.href='/naverLogin.do?email='+email+'&uniqId='+uniqId; */
							} else {
								console.log("AccessToken이 올바르지 않습니다.");
							}
						});
					</script>
					<!-- <script>
						(function(d,s,id){
							var js, fjs = d.getElementsByTagName(s)[0];
							if(d.getElementById(id)) return;
							js = d.createElement(s); js.id = id;
							js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.2&appId=2253461041644555&autoLogAppEvents=1';
							fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));
						window.fbAsyncInit = function() {
							FB.init({
								appId      : '2253461041644555',
								cookie     : true,
								xfbml      : true,
								version    : 'v3.2'
							});
							FB.AppEvents.logPageView();
							FB.getLoginStatus(function(response) {
								if(response.status == 'connected'){
									
								} else {
									FB.login(function(response){
										
									},{scope:'public_profile, email'});
								}
							});
						};
						(function(d, s, id){
							var js, fjs = d.getElementsByTagName(s)[0];
							if (d.getElementById(id)) {return;}
							js = d.createElement(s); js.id = id;
							js.src = "https://connect.facebook.net/en_US/sdk.js";
							fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));
						function checkLoginState(){
							FB.getLoginStatus(function(response){
								statusChangeCallback(response);
							});
						}
						function statusChangeCallback(response){
							if(response.status === 'connected'){
								var fId = reponse.id;
								console.log(fId);
								var fName = reponse.name;
								console.log(fName);
								var fEmail = reponse.email;
								console.log(fEmail);
							} else {
								document.getElementById('status').innerHTML = 'Please log into this app.';
							}
						}
					</script> -->
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