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
	<jsp:include page="../service/service_header.jsp"></jsp:include>
    
	<div class="container" style="width:700px">
	<div style="height: 5px"></div>
	<div class="row">
	  <form method=post action="../service/faq_update_ok.do">
		<table class="table">
		  <tr>
		  	<th width=15% class="text-right">문의유형</th>
		  	<td width=85%>
		  		<input type=text name=type size=20 class="input-sm" required value="${vo.type }">
		  	</td>
		  </tr>
		  <tr>
		  	<th width=15% class="text-right">제목</th>
		  	<td width=85%>
		  		<input type=text name=subject size=45 class="input-sm" required value="${vo.subject }">
		  		<input type=hidden name=no size=45 value="${vo.gfno }">
		  	</td>
		  </tr>
		  <tr>
		  	<th width=15% class="text-right">내용</th>
		  	<td width=85%>
		  		<textarea rows=10 cols=50 name=content required>${vo.content }</textarea>
		  	</td>
		  </tr>
		  <tr>
		  	<td colspan=2 class="text-center" style="border-color: white">
		  		<input type=submit value="수정하기" class="btn btn-sm btn-primary">
		  		<input type=button value="취소" class="btn btn-sm btn-primary" onclick="javascript:history.back()">
		  	</td>
		  </tr>
		</table>
	  </form>
	</div>
	</div>
</body>
</html>