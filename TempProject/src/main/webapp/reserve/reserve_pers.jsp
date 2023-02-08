<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	//선택된 데이터 입력
	$('#pers').change(function(){
		let inwon=$(this).val()
		$('#r_pers').text(inwon+"명")
		$('#reservepers').val(inwon)
		$('.rBtn').show()
	})
})
</script>
    <style type="text/css">
    * {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
    </style>
</head>
<body>
    <div style="height:10px"></div>
	<div>
		<label for=kpers><b>할인</b></label>&nbsp;&nbsp;
		<select name=kpers id=kpers>
			<option>―― 선택 ――</option>
			<c:forEach var="i" begin="1" end="10">
				<option value="${i }">${i }명</option>
			</c:forEach>
		</select>
 	</div>
    <div style="height:10px"></div>
 	<div>
		<label for=pers><b>일반</b></label>&nbsp;&nbsp;
		<select name=pers id=pers>
			<option>―― 선택 ――</option>
			<c:forEach var="i" begin="1" end="10">
				<option value="${i }">${i }명</option>
			</c:forEach>
		</select>
 	</div>
</body>
</html>