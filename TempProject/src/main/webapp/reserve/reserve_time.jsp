<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	//시간 선택 효과
	$('.times td').hover(function(){
		$(this).css({"cursor":"pointer","background-color":"powderblue","border-radius":"25px"})
	},function(){
		$(this).css({"cursor":"none","background-color":"white"})
	})
	$('.times tr').click(function(){
		let time=$(this).text()
		$('#r_time').text(time)
	})
})
</script>
</head>
<body>
	<table class="table times">
	  <tr>
	  	<th>1회</th>
	    <td>10:00 ~ 12:00</td>
	  </tr>
	  <tr>
	  	<th>2회</th>
	    <td>12:00 ~ 14:00</td>
	  </tr>
	  <tr>
	  	<th>3회</th>
	    <td>12:00 ~ 16:00</td>
	  </tr>
	  <tr>
	  	<th>4회</th>
	    <td>16:00 ~ 18:00</td>
	  </tr>
	</table>
</body>
</html>