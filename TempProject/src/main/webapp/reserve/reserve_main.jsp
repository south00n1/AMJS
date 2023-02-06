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
	let geno=$('#r_no').val()
	
	//날짜 선택 달력 출력
	$.ajax({
		type:'post',
		url:'../reserve/reserve_date.do',
		data:{"geno":geno},
		success:function(response){
			$('#select_date').html(response)
		}
	})
	
	//예약 정보_전시회 데이터
	$.ajax({
		type:'post',
		url:'../reserve/reserve_list.do',
		data:{"geno":geno},
		success:function(response){
			$('#select_list').html(response)
		}
	})

	//전시 재선택
	$.ajax({
		type:'post',
		url:'../reserve/reserve_exhib.do',
		data:{"ed":'육아'},
		success:function(response){
			$('#select_exhib').html(response)
		}
	})
	$('.exhibs').click(function(){
		let ed=$(this).text()
		$.ajax({
			type:'post',
			url:'../reserve/reserve_exhib.do',
			data:{"ed":ed},
			success:function(response){
				$('#select_exhib').html(response)
			}
		})
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
    	  		    <div id="select_date" style="height: 330px">
    	  		    
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
    	  		  	<div id="select_time" style="height: 330px">
    	  		  	
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
    	  		  	<div id="select_pers" style="height: 330px">
    	  		  	
    	  		  	</div>
    	  		  </td>
    	  		</tr>
    	  	</table>
    	  </td>
    	  <td width="30%" rowspan=2>
    	  	<table class="table re_section">
    	  		<caption align="top"><h5>예매 정보</h5></caption>
    	  		<tr>
    	  		  <td>
    	  		  	<input type=hidden value="${geno }" id="r_no">
    	  		  	<div id="select_list" style="height: 800px">
    	  		  	
    	  		  	</div>
    	  		  </td>
    	  		</tr>
    	  	</table>
    	  </td>
    	</tr>
    	<tr>
    	  <td width="70%" colspan=3>
    	  	<table class="table re_section">
    	  		<caption align="top">
    	  			<h5>
    	  				예매할 전시 변경&nbsp;&nbsp;
	    	  		  	<span class="btn btn-sm btn-primary exhibs">육아</span>
	    	  		  	<span class="btn btn-sm btn-primary exhibs">스포츠</span>
	    	  		  	<span class="btn btn-sm btn-primary exhibs">인테리어</span>
	    	  		  	<span class="btn btn-sm btn-primary exhibs">예술</span>
	    	  		  	<span class="btn btn-sm btn-primary exhibs">전기</span>
	    	  		  	<span class="btn btn-sm btn-primary exhibs">기계</span>
	    	  		  	<span class="btn btn-sm btn-primary exhibs">농축산</span>
    	  			</h5>
    	  		</caption>
    	  		<tr>
    	  		  <td>
    	  		  	<div id="select_exhib" style="height: 360px;overflow-y: auto">
    	  		  	
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