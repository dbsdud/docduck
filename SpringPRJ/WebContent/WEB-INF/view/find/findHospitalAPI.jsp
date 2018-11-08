<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
	var sido=$('select[name=sido]');
	var gugun=$('select[name=gugun]');
	var dong=$('select[name=dong]');
	sido.change(function(){
		var sidoCode = sido.val();
		var sidoText=$('select[name=sido] option:selected').text();
		gugunFind(sidoCode);
		$('#sidoVal').val(sidoText);
	})
	gugun.change(function(){
		var gugunCode = gugun.val();
		var gugunText=$('select[name=gugun] option:selected').text();
		dongFind(gugunCode);
		$('#gugunVal').val(gugunText);
	});
	dong.change(function(){
		var dongCode = dong.val();
		var dongText=$('select[name=dong] option:selected').text();
		$('#dongVal').val(dongText);
	});
});
function gugunFind(sidoCode){
	$.ajax({
		url:"/gugun/gugunSearch.do",
		type:'get',
		data:{
			'sido':sidoCode
		},
		success:function(data){
			var gugunCon="";
			gugunCon+='<option>시/군/구 선택</option>'
			$.each(data,function(key,value){
				
				gugunCon+='<option value='+value.sgguCd+'>'+value.sgguCdNm+'</option>'
			})
			console.log(gugunCon);
			$('#gugun').html(gugunCon);
		},
		error:function(error){
			alert(error);
		}
	});
}
function dongFind(gugunCode){
	var dong=$('select[name=dong]');
	
	$.ajax({
		url:"/dong/dongSearch.do",
		type:'get',
		data:{
			'gugun':gugunCode
		},
		success:function(data){
			var dongCon="";
			dongCon+='<option>읍/면/동 선택</option>'
			$.each(data,function(key,value){
				dongCon+='<option value='+value.emdongNm+'>'+value.emdongNm+'</option>'
			})
			$('#dong').html(dongCon);
		},
		error:function(error){
			alert(error);
		}
	});
}
</script>