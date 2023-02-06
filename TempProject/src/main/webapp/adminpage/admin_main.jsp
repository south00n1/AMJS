<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul {
	list-style: none;
}
li:hover {
	color: #27375C;
	cursor: pointer;
}
</style>
</head>
<body>
	
<div class="container-xxl py-5" style="height: 70%">	
	<div class="container ">
	  <div class="row my-5">
	  	<h4 class="mb-5 wow fadeInUp" data-wow-delay="0.5s">관리자페이지</h4>
      <jsp:include page="../adminpage/admin_menu.jsp"></jsp:include>

	  </div>
	</div>
</div>
</body>
</html>