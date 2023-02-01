<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let f=0
$(function(){
	$('.ftype span').click(function(){
		let type=$(this).attr("data-no")
	})
	
	$('.fsub').hover(function(){
		$(this).css("cursor","pointer")
	})
	$('.fsub').click(function(){
		let no=$(this).attr("data-no")
		if(f===0){
			$('#f'+no).show()
			f=1
		}else{
			$('#f'+no).hide()
			f=0
		}
	})
})
</script>
</head>
<body>
	<jsp:include page="../service/service_header.jsp"></jsp:include>
	
	<div class="container" style="width:800px">
	  <div style="height: 5px"></div>
	  	<table class="table text-center">
	  	  <tr>
	  	  	<td class=ftype>
	  	  	  <form method=get action="../service/faq_list.do?type=">
	  	  		<span data-no="1" class="btn btn-primary py-md-3 px-md-5 slideInLeft">회원</span>
	  	  		<span data-no="2" class="btn btn-primary py-md-3 px-md-5 slideInLeft">예매</span>
	  	  		<span data-no="3" class="btn btn-primary py-md-3 px-md-5 slideInLeft">결제</span>
	  	  		<span data-no="4" class="btn btn-primary py-md-3 px-md-5 slideInLeft">티켓</span>
	  	  		<span data-no="5" class="btn btn-primary py-md-3 px-md-5 slideInLeft">기타</span>
	  	  	  </form>
	  	  	</td>
	  	  </tr>
	  	</table>
	  	<table class="table">
	  	  <tr>
	  	  	<th width=10% class="text-center">번호</th>
	  	  	<th width=15% class="text-center">문의유형</th>
	  	  	<th width=65% class="text-center">제목</th>
	  	  	<th width=10% class="text-center">조회수</th>
	  	  </tr>
	  	  <c:forEach var="vo" items="${list }" varStatus="s">
		  	  <tr>
		  	  	<td width=10% class="text-center">${count-s.index-((curpage-1)*10) }</td>
		  	  	<td width=15% class="text-center">${vo.type }</td>
		  	  	<td width=65% class=fsub data-no="${vo.gfno }">${vo.subject }</td>
		  	  	<td width=10% class="text-center">${vo.hit }</td>
		  	  </tr>
		  	  <tr id="f${vo.gfno }" class="fdetail" style="display: none">
				<td colspan=2></td>
				<td>
					<pre style="white-space: pre-wrap;background-color: white;border: none">${vo.content }</pre>
				</td>
				<td>
					<c:if test="${sessionScope.admin=='y' }">
	  	  				<a href="../service/faq_update.do?no=${vo.gfno }" class="btn btn-sm btn-warning">수정</a>
	  	  			</c:if>
				</td>
			  </tr>
	  	  </c:forEach>
	  	</table>
	  	<c:if test="${sessionScope.admin=='n' }">
		  	<table>
		  	  <tr>
		  	  	<td class="text-right" colspan=8 style="border-color: white">
		  	  			<a href="../service/insert.do" class="btn btn-sm btn-warning">문의 작성</a>
		  	  	</td>
		  	  </tr>
		  	</table>
	  	</c:if>
	  	<c:if test="${type==0 }">
		  	<table class="table" style="border-color: white">
		  	  <tr>
		  	  	<td class="text-center">
		  	  		<a href="../service/faq_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
		  	  		${curpage } page / ${totalpage } pages
		  	  		<a href="../service/faq_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
		  	  	</td>
		  	  </tr>
		  	</table>
	  	</c:if>
	</div>
</body>
</html>