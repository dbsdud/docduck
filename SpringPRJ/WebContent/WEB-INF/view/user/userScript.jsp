<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
// 아이디 중복체크
$(function(){
	$("#idCheck").click(function(){
		var idck = 0;
		var id = $("#id").val();
		$.ajax({
			type : 'POST',
			data : {'id':id},
			url : "/user/userChecked.do",
			success : function(data){
				console.log(data);
				if(data > 0){
					alert("사용할 수 없는 아이디입니다.");
					$("#conf").val("0");
					$("#id").focus();
				} else {
					alert("사용 가능한 아이디입니다.");
					$("#conf").val("1");
					$("#id").focus();
					idck=1;
				}
			},
			error : function(error){
				alert("error : " + error);
			}
		});
	});
});
// 비밀번호 조합
function checkUnion(str){
	var reg1=/^[a-zA-Z0-9]{8,20}$/;//대문자 소만자 8 -20 자리 허용
	var reg2=/[a-zA-Z]/g;
	var reg3=/[0-9]/g;
	return(reg1.test(str) && reg2.test(str) &&reg3.test(str))
}
// 비밀번호 입력  / 재입력 일치 여부
$(function(){
	var pwdvld = /^[a-zA-Z0-9]{8,20}$/;//패스워드  영문 숫자 합쳐서 8자이상
	var emavld = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
	var regname = /^[가-힝][A-Z][a-z]{2,}$/;
	var pwd=$("#pwd");
	var pwdCheck=$("#pwdCheck");
	var pwdval=pwd.val();
	
	$('#pwd').keyup(function(){
		$('font[id=check]').text('');
		if(!checkUnion(pwd.val())){
			$('font[id=length]').text('');
			$('font[id=length]').css('color','red');
			$('font[id=length]').html("8자리 이상 20자리 이하의 [영문 + 숫자] 조합");
		}else{
			$('font[id=length]').css('color','green');
			$('font[id=length]').html("사용가능한 비밀번호입니다.");
		}
	});
	$('#pwdCheck').keyup(function(){
		if($('pwdCheck').val()==''){
			$('font[id=check]').text('');
			$('font[id=check]').css('color','red');
			$('font[id=check]').html("비밀번호를 한번 더 입력해주세요.");
		}else if($('#pwd').val()!=$('#pwdCheck').val()){
			$('font[id=check]').text('');
			$('font[id=check]').css('color','red');
			$('font[id=check]').html("비밀번호를 동일하게 입력해주세요.");
		} else {
			$('font[id=check]').css('color','green');
			$('font[id=check]').html("비밀번호가 일치합니다.");
		}
	});
});

$(function(){
	var pwdvld = /^[a-zA-Z0-9]{8,20}$/;//패스워드  영문 숫자 합쳐서 8자이상 함수 방식으로 다시함
	var idvld = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
	var regname = /^[가-힝][A-Z][a-z]{2,}$/;
	
	var id=$("#id");
	var pwd=$("#pwd");
	var pwdCheck=$("#pwdCheck");
	var userName=$("#userName");
	var userTel=$("#userTel");
	var pwdval=pwd.val();
	var conf=$("#conf");
	
	$("regSub").click(function(){
		if(id.val()==''){
			alert("아이디를 입력해주세요.");
			id.focus();
			return false;
		}else if(!idvld.test(id.val())){
			alert("아이디 형식이 맞지 않습니다.");
			id.focus();
			return false;
		}else if(pwd.val()==''){
			alert("비밀번호를 입력하세요.");
			pwd.focus();
			return false;
		}else if(pwd.val()!=pwdCheck.val()){
			alert("입력하신 비밀번호가 동일하지 않습니다.");
			pwdCheck.focus();
			return false;
		}else if(!checkUnion(ped.val())){
			alert("비밀번호가 형식에 맞지 않습니다.");
			return false;
		}else if(userName.val()==''){
			alert("이름을 입력하세요.");
			userName.focus();
			return false;
		}else if(userTel.val()==''){
			alert("전화번호를 입력하세요");
			telvld();
			userTel.focus();
			return false;
		}else{
			if(conf.val()==0){
				alert("아이디 중복 확인을 해주세요.");
				id.focus();
				return false;
			}else{
				alert("회원가입에 성공하였습니다.");
			}
		}
	});
});
/* <!--전화번호 숫자입력함수 --> */
$(function telvld(){
	$('#userTel').keydown(function(e){
		if((e.keyCode<48 || e.keyCode>57)&&e.keyCode!=8&&(e.keyCode<96||e.keyCode>105)){
			alert("전화번호는 숫자만 입력해주세요.");
			userTel.focus();
			return false;
		}
	});
});
/* $(function(){
	var telvld=
	var userTel=$('#userTel');
	$('#userTel').keyup(function(e){
		$('font[id=telcheck]').text('');
		if(!)
	})
}) */
</script>