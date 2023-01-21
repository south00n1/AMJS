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
                            <li class="breadcrumb-item text-white active" aria-current="page">자주 묻는 질문</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->
    
	<div class="container" style="width:800px">
	  <div style="height: 5px"></div>
	  	<table class="table">
	  	  <tr>
	  	  	<td>
	  	  		<a href="../service/faq_list?type=1" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">회원</a>
	  	  		<a href="../service/faq_list?type=2" class="btn btn-light py-md-3 px-md-5 animated slideInRight">예매</a>
	  	  		<a href="../service/faq_list?type=3" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">결제</a>
	  	  		<a href="../service/faq_list?type=4" class="btn btn-light py-md-3 px-md-5 animated slideInRight">티켓</a>
	  	  		<a href="../service/faq_list?type=5" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">기타</a>
	  	  	</td>
	  	  </tr>
	  	</table>
	  	<table class="table">
	  	  <tr>
	  	  	<th width=15% class="text-center">번호</th>
	  	  	<th width=15% class="text-center">문의유형</th>
	  	  	<th width=55% class="text-center">제목</th>
	  	  	<th width=15% class="text-center">조회수</th>
	  	  </tr>
	  	  <c:forEach var="vo" items="${list }" varStatus="s">
		  	  <tr>
		  	  	<td width=15% class="text-center">${count-s.index }</td>
		  	  	<td width=15% class="text-center">${vo.type }</td>
		  	  	<td width=55%>
		  	  	<a href="../service/faq_detail.do?no=${vo.gfno }" style="color: black">${vo.subject }</a>
		  	 <!-- ### 링크 주니까 글자색 자동으로 하늘색으로 바뀜.. 구려.. ### -->
		  	  	</td>
		  	  	<td width=15% class="text-center">${vo.hit }</td>
		  	  </tr>
	  	  </c:forEach>
	  	</table>
	</div>
</body>
</html>