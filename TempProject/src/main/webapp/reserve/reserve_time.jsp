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
	//시간 선택 효과
	$('.times').hover(function(){
		$(this).css({"cursor":"pointer","color":"lightgray"})
	},function(){
		$(this).css({"cursor":"none","color":"#52565b"})
	})
	$('.times').click(function(){
		$('.times').css("background-color","white")
		$(this).css("background-color","lightblue")
		
		//선택된 데이터 입력
		let time=$(this).text()
		$('#r_time').text(time)
		$('#reservetime').val(time)
		
		//인원 선택 옵션 출력
		$.ajax({
			type:'post',
			url:'../reserve/reserve_pers.do',
			success:function(response){
				$('#select_pers').html(response)
			}
		})
	})
})
</script>
</head>
<body>
  <table class="table">
	<c:forEach var="t" items="${rtimes }" varStatus="s">
	  <tr>
	  	<th width=35%>${s.index+1 }회</th>
	    <td width=65% class="times">${t }</td>
	  </tr>
	</c:forEach>
  </table>
</body>
</html>