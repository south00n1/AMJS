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
                            <li class="breadcrumb-item"><a class="text-white" href="../service/main.do">고객센터</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">고객 Home</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->

	<div class="container" style="width: 100%">

<!-- faq 검색바 -->
	<div class="box">
		<span class="icon"><i class="fa fa-search"></i></span>&nbsp;&nbsp;
		<input type="search" id="search" size=30 placeholder="검색어 입력"/>
	</div>
	
<!-- faq 빠른 찾기  -->
	<div>
		<h4 class="text-primary px-3">FAQ 찾기</h4>
	    <p>분야별 faq 빠른 찾기를 이용해보세요</p>
	</div>
	<table class="table" style="border-color: white">
	  <tr>
	  	<td>
	  		<a href="../service/faq_list.do?type=1" class="btn btn-primary py-md-3 px-md-5 slideInLeft">회원</a>
			<a href="../service/faq_list.do?type=2" class="btn btn-primary py-md-3 px-md-5 slideInRight">예매</a>
	  		<a href="../service/faq_list.do?type=3" class="btn btn-primary py-md-3 px-md-5 slideInLeft">결제</a>
	  		<a href="../service/faq_list.do?type=4" class="btn btn-primary py-md-3 px-md-5 slideInRight">티켓</a>
	  		<a href="../service/faq_list.do?type=5" class="btn btn-primary py-md-3 px-md-5 slideInLeft">기타</a>
	  	</td>
	  </tr>
	</table>
	
<!-- faq top10 -->
	<div style="height: 30px"></div>
	<h4 class="text-primary px-3">자주 묻는 질문 TOP10</h4>
	<table class="table">
	  <tr>
	 	<th width=10% class="text-center">순위</th>
	 	<th width=10% class="text-center">문의유형</th>
	  	<th width=70% class="text-center">제목</th>
	  	<th width=10% class="text-center">
	  		<a href="../service/faq_list.do"><input type=button class="btn btn-sm btn-primary" value="더보기"></a>
	  	</th>
 	  </tr>
 	  <c:forEach var="vo" items="${flist }" varStatus="s">
		  <tr>
		   	<td width=10% class="text-center">${s.index+1 }</td>
		  	<td width=10% class="text-center">${vo.type }</td>
		  	<td width=70%>
		  	  <a href="../service/faq_detail.do?no=${vo.gfno }" style="color: black">${vo.subject }</a>
		  	</td>
		  	<td width=10% class="text-center"></td>
		  </tr>
	  </c:forEach>
	</table>
	
<!-- qna -->
	<div style="height: 30px"></div>
	<h4 class="text-primary px-3">나의 문의 내역</h4>
	<table class="table">
	  <tr>
	  	<th width=15% class="text-center">문의유형</th>
	   	<th width=60% class="text-center">제목</th>
	   	<th width=15% class="text-center">답변상태</th>
	   	<th width=10% class="text-center">
	   		<a href="../service/list.do"><input type=button class="btn btn-sm btn-primary" value="더보기"></a>
	   	</th>
	  </tr>
	  <c:forEach var="vo" items="${slist }">
		<c:if test="${vo.group_tab==0 }">
		  <tr>
		  	<td width=15% class="text-center">${vo.type }</td>
		  	<td width=35%>
		  	  <c:if test="${vo.group_tab>0 }">
		  	  	<c:forEach var="i" begin="0" end="${vo.group_tab }">&nbsp;&nbsp;</c:forEach>
		  	  </c:if>
		  	  <img src="">
		  	  <a href="../service/detail.do?no=${vo.gano }" style="color: black">${vo.subject }</a>
		  	</td>
		  	<td width=10% class="text-center">
		  	  <c:if test="${vo.ans_state=='답변완료' }">
		  	  	<span style="color: blue">${vo.ans_state }</span>
		  	  </c:if>
		  	  <c:if test="${vo.ans_state!='답변완료' }">
		  	  	<span style="color: gray">${vo.ans_state }</span>
		  	  </c:if>
		  	</td>
		   	<td width=10% class="text-center">${vo.depth }</td>
		  </tr>
		</c:if>
	  </c:forEach>
	  <tr>
		<td colspan=4 class="text-center" style="border-color: white">
  			<a href="../service/insert.do"><input type=button class="btn btn-sm btn-danger" value="문의 작성"></a>
		</td>
	  </tr>
	</table>
  
<!-- 공지사항 list 일부 추가, 더보기 누르면 공지사항 페이지 연결 -->
	
	</div>
</body>
</html>