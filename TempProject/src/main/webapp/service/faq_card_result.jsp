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
let fc=0
$(function(){
	//검색결과 본문 보여주기
	$('.findsub').hover(function(){
		$(this).css("cursor","pointer")
	})
	$('.findsub').click(function(){
		$('.find_detail').hide()
		let no=$(this).attr("data-no")
		if(fc===0){
			$('#find'+no).show()
			fc=1
		}else{
			$('#find'+no).hide()
			fc=0
		}
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
	<table class="table" style="width: 85%">
	  <thead>
		  <tr style="border-color: white">
		  	<th colspan=2><h6 class="text-primary px-3 block">&lt;&nbsp;${ss }&nbsp;&gt; 관련 ${count }개의 FAQ가 검색되었습니다.</h6></th>
		  </tr>
		  <tr>
		 	<th width=10% class="text-center">문의유형</th>
		  	<th width=75% class="text-center">제목</th>
		  </tr>
	  </thead>
	  <tbody>
		  <c:forEach var="vo" items="${list }" varStatus="s">
			<tr>
			 	<td width=10% class="text-center">${vo.type }</td>
				<td width=75% class="findsub" data-no="${vo.gfno }">${vo.subject }</td>
			</tr>
			<tr id="find${vo.gfno }" class="find_detail" style="display: none">
				<td width=10%></td>
				<td width=75%>
					<pre style="white-space: pre-wrap;background-color: white;border: none">${vo.content }</pre>
				</td>
		    </tr>
		  </c:forEach>
	  </tbody>
	</table>
</body>
</html>