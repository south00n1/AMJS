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
	//날짜 선택 효과
	$('.days').hover(function(){
		$(this).css({"cursor":"pointer","background-color":"powderblue","border-radius":"25px"})
	},function(){
		$(this).css({"cursor":"none","background-color":"white"})
	})
	$('.days').click(function(){
		$(this).css({"background-color":"powderblue","border-radius":"25px"})
		
		//선택된 데이터 입력
		let year=$(this).attr("data-year")
		let month=$(this).attr("data-month")
		let day=$(this).text()
		$('#r_day').text(year+"년 "+month+"월 "+day+"일")
		
		//시간 선택 옵션 출력
		$.ajax({
			type:'post',
			url:'../reserve/reserve_time.do',
			success:function(response){
				$('#select_time').html(response)
			}
		})
	})
})
</script>
</head>
<body>
	<h5>${year }년 ${month }월</h5>
	
	<c:set var="week" value="${week }"/>
	<table class="table text-center">
	  <tr>
  		<c:forEach var="w" items="${strWeek }">
	  		<th height=35>${w }</th>
	  	</c:forEach>
	  </tr>
	  <tr>
	    <c:forEach var="i" begin="1" end="${lastday }">
	  	  <c:if test="${i==1 }">
	  	  	<c:forEach var="j" begin="1" end="${week }">
		  	  	<td height=30></td>
	  	  	</c:forEach>
	  	  </c:if>
	  	  <td class="days" height=30 data-year="${year }" data-month="${month }"><b>${i }</b></td>
	  	  <c:set var="week" value="${week+1 }"/>
	  	  <c:if test="${week>6 }">
		  	  <c:set var="week" value="0"/>
	  </tr>
	  	  </c:if>
	    </c:forEach>
	</table>
</body>
</html>