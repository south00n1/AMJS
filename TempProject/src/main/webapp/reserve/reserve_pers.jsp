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
let dinwon=0
let ginwon=0
let dpr=0
let gpr=0
$(function(){
	//금액 계산
	$('#dpers').change(function(){
		dinwon=$(this).val()
		dpr=Number($('#dp').val())
		$('#dprice').text(dpr+"원 * "+dinwon+"명")
		
		//선택된 데이터 입력
		let inwon=Number(dinwon)+Number(ginwon)
		let totalprice=Number(dinwon)*Number(dpr)+Number(ginwon)*Number(gpr)
		$('#tp').html("<h5>"+"합계: "+totalprice+"원"+"</h5>")	
		$('#r_pers').text(inwon+"명")
		$('#r_price').text(totalprice+"원")
		$('#reservepers').val(inwon)
		$('.rBtn').show()
	})
	$('#pers').change(function(){
		ginwon=$(this).val()
		gpr=$('#gp').val()
		$('#gprice').text(gpr+"원 * "+ginwon+"명")
		
		//선택된 데이터 입력
		let inwon=Number(dinwon)+Number(ginwon)
		let totalprice=Number(dinwon)*Number(dpr)+Number(ginwon)*Number(gpr)
		$('#tp').html("<h5>"+"합계: "+totalprice+"원"+"</h5>")	
		$('#r_pers').text(inwon+"명")
		$('#r_price').text(totalprice+"원")
		$('#reservepers').val(inwon)
		$('.rBtn').show()
	})
})
</script>
</head>
<body>
    <div style="height:10px"></div>
	<div>
		<label for=dpers><b>할인</b></label>&nbsp;&nbsp;
		<select name=dpers id=dpers>
			<option>―― 선택 ――</option>
			<c:forEach var="i" begin="1" end="10">
				<option value="${i }">${i }명</option>
			</c:forEach>
		</select>
		<input type=hidden value="${pr*0.8 }" id=dp>
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
		<input type=hidden value="${pr }" id=gp>
 	</div>
    <div style="height: 30px"></div>
    <div style="height: 20px;float: right" id=dprice></div><br>
    <div style="height: 20px;float: right" id=gprice></div><br>
    <div style="height: 30px"></div>
    <div style="height: 20px;float: right" id=tp></div>
</body>
</html>