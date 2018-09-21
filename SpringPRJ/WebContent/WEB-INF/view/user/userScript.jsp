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
// 비밀번호 재입력 일치 여부
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
			$('font[id=length]').html("적합");
		}
	});
	$('#pwdCheck').keyup(function(){
		if($('#pwd').val()!=$('#pwdCheck').val()){
			$('font[id=check]').css('color','red');
			$('font[id=check]').html("암호틀림");
		} else {
			$('font[id=check]').css('color','green');
			$('font[id=check]').html("암호맞음");
		}
	});
});
</script>