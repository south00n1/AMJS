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
	  	<h4 class="mb-5 wow fadeInUp" data-wow-delay="0.5s">${sessionScope.name } 님의 마이페이지</h4>
	    <div class="col-sm-2 wow fadeInUp" data-wow-delay="0.5s">
	  	  <jsp:include page="../mypage/mypage_menu.jsp"></jsp:include>
	    </div>
	    <div class="col-sm-10 px-5 wow fadeInUp" data-wow-delay="0.5s"">
	      <jsp:include page="${mypage_jsp }"></jsp:include>
	    </div>
	  </div>
	</div>
</div> 

</body>
</html>