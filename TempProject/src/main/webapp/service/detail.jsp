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
                            <li class="breadcrumb-item text-white active" aria-current="page">나의 문의 보기</li>
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
	  	  	<th width=10% class="text-center">번호</th>
	  	  	<td width=10% class="text-center">${vo.gano }</td>
	  	  	<th width=15% class="text-center">문의유형</th>
	  	  	<td width=10% class="text-center">${vo.type }</td>
	  	  	<th width=15% class="text-center">작성일</th>
	  	  	<td width=20% class="text-center">${vo.dbday }</td>
	  	  	<th width=10% class="text-center">조회수</th>
	  	  	<td width=10% class="text-center">${vo.hit }</td>
	  	  </tr>
	  	  <tr>
	  	  	<th colspan=2 class="text-center">제목</th>
	  	  	<td colspan=6>${vo.subject }</td>
	  	  </tr>
	  	  <c:if test="${vo.filesize>0 }">
	  	    <tr>
	  	    	<th colspan=2 class="text-center">첨부파일</th>
	  	    	<td colspan=6>
	  	    	  <img src="../service/image/folder.png" style="width: 20px;height: 20px">
	  	    	  <a href="../service/download.do?fn=${vo.filename }">${vo.filename }</a>(${vo.filesize }Bytes)
	  	    	</td>
	  	    </tr>
	  	  </c:if>
	  	  <tr>
	  	  	<td class="text-left" valign=top colspan=8 height=200>${vo.content }</td>
	  	  </tr>
	  	  <tr>
	  	  	<td class="text-center" colspan=8 style="border-color: white">
	  	  		<a href="../service/update.do?no=${vo.gano }" class="btn btn-sm btn-warning">수정</a>
	  	  		<a href="../service/delete.do?no=${vo.gano }" class="btn btn-sm btn-danger">삭제</a>
	  	  		<a href="../service/list.do" class="btn btn-sm btn-primary">목록</a>
	  	  		<c:if test="${vo.id=='master' }">
	  	  			<a href="../service/reply.do?no=${vo.gano }" class="btn btn-sm btn-danger">답변</a>
	  	  		</c:if>
	  	  	</td>
	  	  </tr>
	  	</table>
	</div>
</body>
</html>