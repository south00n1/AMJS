<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<div class="container" style="width:960px">
		<a href="../service/faq_list.do" class="btn btn-sm btn-primary">FAQ 목록</a>
	  <div style="height: 20px"></div>
	  <div style="height: 450px">
	  	<table class="table">
	  	  <tr>
	  	  	<th width=5% class="text-center">번호</th>
	  	  	<th width=15% class="text-center">문의유형</th>
	  	  	<th width=35% class="text-center">제목</th>
	  	  	<th width=10% class="text-center">이름</th>
	  	  	<th width=15% class="text-center">작성일</th>
	  	  	<th width=10% class="text-center">답변상태</th>
	  	  	<th width=10% class="text-center">첨부파일</th>
	  	  </tr>
	  	  <c:forEach var="vo" items="${list }" varStatus="s">
	  	    <c:if test="${vo.ans_state=='미답변' }">
	  	    <c:if test="${vo.id!='admin' }">
		  	  <tr>
		  	  	<td width=5% class="text-center">${count-s.index-((curpage-1)*10) }</td>
		  	  	<td width=15% class="text-center">${vo.type }</td>
		  	  	<td width=35%>
		  	  	  <a href="../service/detail.do?no=${vo.gano }" style="color: black">${vo.subject }</a>
		  	  	  <c:if test="${vo.dbday==today }">
		          	<img src="../service/image/new_red.png" style="width: 20px">
		          </c:if>
		  	  	</td>
		  	  	<td width=10% class="text-center">
		  	  		<c:if test="${vo.id!='admin' }">${vo.id }</c:if>
		  	  		<c:if test="${vo.id=='admin' }">관리자</c:if>
		  	  	</td>
		  	  	<td width=15% class="text-center">${vo.dbday }</td>
		  	  	<td width=10% class="text-center">
		  	  	 <c:if test="${vo.id!='admin' }">
		  	  	  <c:if test="${vo.ans_state!='답변완료' }">
		  	  	  	<span style="color: gray">${vo.ans_state }</span>
		  	  	  </c:if>
		  	  	 </c:if>
		  	  	</td>
		  	  	<td width=10% class="text-center" id=l-file>
		  	  	  <c:if test="${vo.filesize>0 }">
		  	  	   <a href="../service/download.do?fn=${vo.filename }">
		  	  	  	<img src="../service/image/folder.png" style="width: 20px;height: 20px">
		  	  	   </a>
		  	  	  </c:if>
		  	  	</td>
		  	  </tr>
		  	  </c:if>
	  	    </c:if>
	  	  </c:forEach>
	  	</table>
	  </div>
	  	<table class="table" style="border-color: white">
	  	  <tr>
	  	  	<td class="text-center">
	  	  		<a href="../service/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
	  	  		${curpage } page / ${totalpage } pages
	  	  		<a href="../service/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
	  	  	</td>
	  	  </tr>
	  	</table>
	</div>
</body>
</html>