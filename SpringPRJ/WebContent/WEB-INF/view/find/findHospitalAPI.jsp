<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
// 시도
/* $(function(){
	var sidoCd=$('select[name=sidoCd]');
	var sgguCd=$('select[name=sgguCd]');
	var emdongNm=$('select[name=emdongNm]');
	
	sidoCdNm.change(function(){
		// 시도 값 텍스트
		var sido = sidoCd.val();
		var sidoCdNm=$('select[name=sidoCd] option:selected').text();
		sgguFind(sidoCdNm);
		$('#sidoVal').val(sidoCdNm);
	});
	sgguCdNm.change(function(){
		// 선택된 구군의 텍스트
		var sgguCd = sgguCdNm.val();
		var sgguText = $('select[name=sgguCdNm] opstion:selected').text();
		emdongFind(sgguCd);
		$('#sgguVal').val(sgguText);
	});
	emdongNm.change(function(){
		var emdongNm = emdongNm.val();
		var emdongText=$('select[name=emdongNm] option:selected').text();
		$('#emdongVal').val(emdongText);
	}
	var sidoCon="";
	var allSido=[];
	$.ajax({
		url:"/sido/sidoSearch.do",
		type:'get',
		success:function(data){
			$.each(data,function(key,value){
				sidoCon+='<option value='+value.sidoCd+'>'+value.sidoCdNm+'</option>',
				allSido.push({
					sidoCdNm:value.sidoCdNm,
					sidoCd:value.sidoCd
				})
			})
			sidoCd.html(sidoCon);
			allHospSido(allSido);
			geoAddr(allSido);
		},
		error:function(error){
			alert(error);
		}
}); */
// 구군
function sgguFind(sidoCd){
	var sgguCon="";
	$.ajax({
		url:"/sggu/sgguSearch.do",
		type:'get',
		data:{
			'sidoCd':sidoCd
		},
		success:function(data){
			$.each(data,function(key,value){
				sgguCon+='<option value='+value.sgguCd+'>'+value.sgguCdNm+'</option>'
			})
			sgguCdNm.html(sgguCon);
		},
		error:function(error){
			alert(error);
		}
	});
}
// 동
function emdongFind(sgguCd){
	var emdongCon="";
	$.ajax({
		url:"/emdong/emdongSearch.do",
		type:'get',
		data:{
			'sgguCdNm':sgguCd	
		},
		success:function(data){
			$.each(data,function(key,value){
				emdongCon+='<option value='+value.emdongNm+'>'+value.emdongNm+'</option>'
			})
			dong.html(emdongCon);
		},
		error: function(error){
			alert(error);
		}
	});
}
</script>