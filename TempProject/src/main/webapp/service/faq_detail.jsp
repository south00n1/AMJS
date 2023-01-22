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
                            <li class="breadcrumb-item"><a class="text-white" href="../service/main.do">Home</a></li>
                            <li class="breadcrumb-item"><a class="text-white" href="../service/faq_list.do">고객센터</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">자주 묻는 질문</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->
    
	<div class="container" style="width:700px">
	  <div style="height: 5px"></div>
	  	<table class="table">
	  	  <tr>
	  	  	<th width=15% class="text-center">문의유형</th>
	  	  	<td width=10% class="text-center">${vo.type }</td>
	  	  	<th width=13% class="text-center">조회수</th>
	  	  	<td width=8% class="text-center">${vo.hit }</td>
	  	  	<th width=9% class="text-center">제목</th>
	  	  	<td width=45% class="text-center">${vo.subject }</td>
	  	  </tr>
	  	  <tr>
	  	  	<td class="text-left" valign=top colspan=6 height=200>${vo.content }</td>
	  	  </tr>
		<!-- 관련 faq list 추가 -->
	  	  <tr>
	  	  	<td class="text-center" colspan=8 style="border-color: white">
	  	  		<c:if test="${id=='master' }">
	  	  			<a href="../service/faq_update.do" class="btn btn-sm btn-warning">수정</a>
	  	  		</c:if>
	  	  		<c:if test="${id!='master' }">
	  	  			<a href="../service/insert.do" class="btn btn-sm btn-warning">문의 작성</a>
	  	  		</c:if>
	  	  		<a href="../service/faq_list.do" class="btn btn-sm btn-primary">목록</a>
	  	  	</td>
	  	  </tr>
	  	</table>
	</div>
</body>
</html>