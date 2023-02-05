<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table{
	border-color: white;
}
.re_section{
	text-align: center;
	border-radius: 5px;
	-webkit-box-shadow: 0 0 1px rgba(0,0,0);
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	//날짜 선택 달력 출력
	$.ajax({
		type:'post',
		url:'../reserve/reserve_date.do',
		success:function(response){
			$('#select_date').html(response)
		}
	})
	
	//예약 정보_전시회 데이터
	let geno=$('#r_no').val()
	$.ajax({
		type:'post',
		url:'../reserve/reserve_list.do',
		data:{"geno":geno},
		success:function(response){
			$('#select_list').html(response)
		}
	})
})
</script>
</head>
<body>
<div class="container">
  <div style="height: 30px"></div>
	<h3 class="text-primary px-3">GOD 전시 예매</h3>
    <table class=table style="width: 100%">
    	<tr>
    	  <td width="30%">
    	  	<table class="table re_section">
    	  		<caption align="top"><h5>날짜 선택</h5></caption>
    	  		<tr>
    	  		  <td>
    	  		    <div id="select_date">
    	  		    
    	  		    </div>
    	  		  </td>
    	  		</tr>
    	  	</table>
    	  </td>
    	  <td width="20%">
    	  	<table class="table re_section">
    	  		<caption align="top"><h5>회차 선택</h5></caption>
    	  		<tr>
    	  		  <td>
    	  		  	<div id="select_time">
    	  		  	
    	  		  	</div>
    	  		  </td>
    	  		</tr>
    	  	</table>
    	  </td>
    	  <td width="20%">
    	  	<table class="table re_section">
    	  		<caption align="top"><h5>인원 선택</h5></caption>
    	  		<tr>
    	  		  <td>
    	  		  	<div id="select_pers">
    	  		  	
    	  		  	</div>
    	  		  </td>
    	  		</tr>
    	  	</table>
    	  </td>
    	  <td width="30%" rowspan=2>
    	  	<table class="table re_section">
    	  		<caption align="top"><h5>예약 정보</h5></caption>
    	  		<tr>
    	  		  <td>
    	  		  	<input type=hidden value="${geno }" id="r_no">
    	  		  	<div id="select_list">
    	  		  	
    	  		  	</div>
    	  		  </td>
    	  		</tr>
    	  	</table>
    	  </td>
    	</tr>
    	<tr>
    	  <td colspan=3>
    	  	<table class="table re_section">
    	  		<caption align="top"><h5>잔여석</h5></caption>
    	  		<tr>
    	  		  <td>
    	  		  	<div id="select_seat">
    	  		  	
    	  		  	</div>
    	  		  </td>
    	  		</tr>
    	  	</table>
    	  </td>
    	</tr>
    </table>
</div>
</body>
</html>