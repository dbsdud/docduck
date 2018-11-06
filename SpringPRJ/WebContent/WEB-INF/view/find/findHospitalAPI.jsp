<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
	var sidoCd=$('select[name=sidoCd]');
	var sgguCd=$('select[name=sgguCd]');
	var emdongNm=$('select[name=emdongNm]');
	
	sidoCd.change(function(){
		var sidoCdNm = sidoCd.val();
		var sidoText=$('select[name=sidoCd] option:selected').text();
		sgguFind(sidoCdNm);
		$('#')
	})
})
</script>