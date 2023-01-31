<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container{
	margin-top: 30px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#qsub').click(function(){
		$('#qcon').append(
			'<tr>'		
			+'<td></td>'
			+'<td>'+${vo.content }+'</td>'
			+'<td colspan=3></td>'
			+'</tr>'		
		)
	})
	
})
</script>
</head>
<body>
	<div class="container">
	  	<table class="table">
	  	  <tr>
	  	  	<th width=15% class="text-center">문의유형</th>
	  	  	<th width=50% class="text-center">제목</th>
	  	  	<th width=15% class="text-center">작성일</th>
	  	  	<th width=10% class="text-center">답변상태</th>
	  	  	<th width=10% class="text-center">첨부파일</th>
	  	  </tr>
	  	  <!-- list 함수 새로 생성 group_id 동일한 애들끼리 묶기, sql에 content 추가 -->
	  	  <c:forEach var="vo" items="${list }" varStatus="s">
		  	  <tr>
		  	  	<td width=15% class="text-center">${vo.type }</td>
		  	  	<td width=50% id=qsub>
		  	  	  <c:if test="${vo.group_tab>0 }">
		  	  	  	<c:forEach var="i" begin="0" end="${vo.group_tab }">&nbsp;&nbsp;</c:forEach>
		  	  	  	<img src="../service/image/letter.png" style="width: 20px;height: 20px">
		  	  	  </c:if>
		  	  	  ${vo.subject }
		  	  	  <c:if test="${vo.dbday==today }">
		          	<img src="../service/image/new_red.png" style="width: 20px">
		          </c:if>
		  	  	</td>
		  	  	<td width=15% class="text-center">${vo.dbday }</td>
		  	  	<td width=10% class="text-center">
		  	  	  <c:if test="${vo.ans_state=='답변완료' }">
		  	  	  	<span style="color: blue">${vo.ans_state }</span>
		  	  	  </c:if>
		  	  	  <c:if test="${vo.ans_state!='답변완료' }">
		  	  	  	<span style="color: gray">${vo.ans_state }</span>
		  	  	  </c:if>
		  	  	</td>
		  	  	<td width=10% class="text-center">
		  	  	  <c:if test="${vo.filesize>0 }">
		  	  	   <a href="../service/download.do?fn=${vo.filename }">
		  	  	  	<img src="../service/image/folder.png" style="width: 20px;height: 20px">
		  	  	   </a>
		  	  	  </c:if>
		  	  	</td>
		  	  </tr>
		  	  <tbody id=qcon>
		  	  
		  	  </tbody>
	  	  </c:forEach>
	  	</table>
	</div>
</body>
</html>