<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rlist td{
	text-align: left;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
})
</script>
</head>
<body>
	<table class="table rlist">
	  <tr>
    	<th width=30%>선택한 전시</th>
    	<td class=text-center colspan=2>
    	 	<img src="${vo.poster }" style="width: 150px;height: 200px"><br>
    	 	<span style="color: black">${vo.title }</span>
    	</td>
      </tr>
      <tr>
    	<th width=30%>예매날짜</th>
    	<td width=70%><span id="r_day"></span></td>
      </tr>
      <tr>
    	<th width=30%>예매시간</th>
    	<td width=70%><span id="r_time"></span></td>
      </tr>
      <tr>
    	<th width=30%>수량</th>
    	<td width=70%><span id="r_pers"></span></td>
      </tr>
      <tr>
    	<th width=30%>금액</th>
    	<td width=70%><span id="r_price"></span></td>
      </tr>
      <tr>
    	<td colspan=2 class=text-center><input type=button class="btn btn-sm btn-danger" id="rBtn" value="예매하기"></td>
      </tr>
	</table>
</body>
</html>