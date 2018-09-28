<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = CmmUtil.nvl((String)session.getAttribute("id"));
	String userName = CmmUtil.nvl((String)session.getAttribute("userName"));
	String regNo = CmmUtil.nvl((String)session.getAttribute("regNo"));
%>
<script>
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
						<a class="nav-link" href="#"><%= userName + "님 환영합니다." %></a>
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
						<a class="nav-link js-scroll-trigger" href="#about">About</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#services">Services</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#portfolio">Portfolio</a>
					</li>
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
					</li>
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
    								<input type="password" class="form-control" style="border: none;" name="password" placeholder="비밀번호">
    							</p>
    						</div>
    					</div>
    					<div class="col-sm-12 check_article">
    						<div class="checkbox checkbox-styled">
    							<label class="form-label">
    								<input type="checkbox" name="auto_login" data-type="use" value="ok" checked="checked">
    								<span class="agree_tit">
    									로그인 상태유지
    								</span>
    							</label>
    						</div>
    					</div>
    					<p>
    						<button class="btn btn-primary btn-block" style="font-size: 14px;">
    							로그인
    						</button>
    					</p>
    				</form>
    				<div class="modal-footer" style="clear:both;">
    					<div class="col-sm-6" style="text-align: left;">
    						<a href="/user/userReg.do">회원가입</a>
    					</div>
    					<div class="col-sm-6" style="text-align: right;">
    						<a href="#">내 계정 찾기</a>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>