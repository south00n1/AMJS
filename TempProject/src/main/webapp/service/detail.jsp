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
                            <li class="breadcrumb-item text-white active" aria-current="page">나의 문의 보기</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->
    
	<div class="container" style="width:600px">
	  <div style="height: 5px"></div>
	  	<table class="table">
	  	  <tr>
	  	  	<th width=10% class="text-center">번호</th>
	  	  	<td width=5% class="text-center">${vo.gano }</td>
	  	  	<th width=15% class="text-center">문의 종류</th>
	  	  	<td width=10% class="text-center">${vo.type }</td>
	  	  	<th width=13% class="text-center">작성일</th>
	  	  	<td width=17% class="text-center">${vo.dbday }</td>
	  	  	<th width=15% class="text-center">조회수</th>
	  	  	<td width=5% class="text-center">${vo.hit }</td>
	  	  </tr>
	  	  <tr>
	  	  	<th colspan=3 class="text-center">제목</th>
	  	  	<td colspan=5>${vo.subject }</td>
	  	  </tr>
	  	  <tr>
	  	  	<td class="text-left" valign=top colspan=8 height=200>${vo.content }</td>
	  	  </tr>
	  	  <tr>
	  	  	<td class="text-center" colspan=8 style="border-color: white">
	  	  		<a href="../service/update.do" class="btn btn-sm btn-warning">수정</a>
	  	  		<a href="../service/delete.do" class="btn btn-sm btn-danger">삭제</a>
	  	  		<a href="../service/list.do" class="btn btn-sm btn-primary">목록</a>
	  	  	</td>
	  	  </tr>
	  	</table>
	</div>
</body>
</html>