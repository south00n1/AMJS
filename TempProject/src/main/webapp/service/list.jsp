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
</head>
<body>
	<!-- ### -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">고객센터</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                            <li class="breadcrumb-item"><a class="text-white" href="../main/main.do">Home</a></li>
                            <li class="breadcrumb-item"><a class="text-white" href="../service/list.do">고객센터</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">문의 내역</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->
    
	<div class="container" style="width:960px">
	  <div style="height: 5px"></div>
	  	<table class="table">
	  	  <tr>
	  	  	<td>
	  	  		<a href="../service/insert.do" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">문의작성</a>
	  	  	</td>
	  	  </tr>
	  	</table>
	  	<table class="table">
	  	  <tr>
	  	  	<th width=5% class="text-center">번호</th>
	  	  	<th width=15% class="text-center">문의유형</th>
	  	  	<th width=35% class="text-center">제목</th>
	  	  	<th width=10% class="text-center">ID</th>
	  	  	<th width=15% class="text-center">작성일</th>
	  	  	<th width=10% class="text-center">답변상태</th>
	  	  	<th width=10% class="text-center">조회수</th>
	  	  </tr>
	  	  <c:forEach var="vo" items="${list }" varStatus="s">
		  	  <tr>
		  	  	<td width=5% class="text-center">${count-s.index }</td>
		  	  	<td width=15% class="text-center">${vo.type }</td>
		  	  	<td width=35%>
		  	  	  <c:if test="${vo.group_tab>0 }">
		  	  	  	<c:forEach var="i" begin="0" end="${vo.group_tab }">&nbsp;&nbsp;</c:forEach>
		  	  	  </c:if>
		  	  	<a href="../service/detail.do?no=${vo.gano }" style="color: black">${vo.subject }</a>
		  	 <!-- ### 링크 주니까 글자색 자동으로 하늘색으로 바뀜.. 구려.. ### -->
		  	  	</td>
		  	  	<td width=10% class="text-center">${vo.id }</td>
		  	  	<td width=15% class="text-center">${vo.dbday }</td>
		  	  	<td width=10% class="text-center">
		  	  	  <c:if test="${vo.ans_state=='답변완료' }">
		  	  	  	<span style="color: blue">${vo.ans_state }</span>
		  	  	  </c:if>
		  	  	  <c:if test="${vo.ans_state!='답변완료' }">
		  	  	  	<span style="color: gray">${vo.ans_state }</span>
		  	  	  </c:if>
		  	  <!-- ### id=master의 글은 답변 상태 나타내지 말까? 이중 for문으로? ### -->
		  	  	</td>
		  	  	<td width=10% class="text-center">${vo.hit }</td>
		  	  </tr>
	  	  </c:forEach>
	  	</table>
	  	<table class="table" style="border-color: white">
	  	  <tr>
	  	  	<td class="text-center">
	  	  		<a href="../service/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
	  	  		${curpage } page / ${totalpage } pages
	  	  		<!-- ### curpage 디폴트 적용 왜 안돼.. 그냥 1로 줄까? ### -->
	  	  		<a href="../service/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
	  	  	</td>
	  	  </tr>
	  	</table>
	</div>
</body>
</html>