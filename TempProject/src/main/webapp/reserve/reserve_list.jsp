<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rlist th{
	text-align: right;
}
.rlist td{
	text-align: left;
}
    * {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
</head>
<body>
	<table class="table rlist">
      <tr colspan=2>
    	<td class=text-center colspan=2>
    	 	<img src="${vo.poster }" style="width: 250px;height: 350px">
        </td>
      </tr>
      <tr>
    	<th width=30%>전시명</th>
    	<td width=70%>${vo.title }</td>
      </tr>
      <tr>
    	<th width=30%>전시기간</th>
    	<td width=70%>${vo.period }</td>
      </tr>
      <tr>
    	<th width=30%>전시장소</th>
    	<td width=70%>${vo.loc }</td>
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
    	<th width=30%>예매인원</th>
    	<td width=70%><span id="r_pers"></span></td>
      </tr>
      <tr>
    	<th width=30%>금액</th>
    	<td width=70%><span id="r_price"></span></td>
      </tr>
      <tr>
    	<td colspan=2 class="text-center rBtn" style="display: none">
    	  <form method="post" action="../reserve/reserve_ok.do">
    		<input type=hidden name="reserveno" id="reserveno" value="${vo.geno }">
    		<input type=hidden name="reservedate" id="reservedate">
    		<input type=hidden name="reservetime" id="reservetime">
    		<input type=hidden name="reservepers" id="reservepers">
    		<input type=submit class="btn btn-sm btn-danger" value="예매하기">
    	  </form>
    	</td>
      </tr>
	</table>
</body>
</html>