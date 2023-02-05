<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style type="text/css">
.mypage_container {
	width: 1440px;
	margin: 30px auto;
}
mypage_sub_container {
	margin: 0px auto;
}
.mypage_menu_div {
	height: 650px;
	background-color: white;
	border: 1px solid #E2E2E2;
	border-radius: 10px;
	padding: 30px 25px 0px 30px;
	box-shadow: 0.5px 0.5px 0.5px #E2E2E2;
}
.mypage_home_div {
	
    flex: 0 0 auto;
    width: 82%;
	height: 650px;
	background-color: white;
	border: 1px solid #E2E2E2;
	border-radius: 10px;
	padding: 30px 25px 0px 30px;
	margin-left: 10px;
	box-shadow: 0.5px 0.5px 0.5px #E2E2E2;
}

.card-3 {
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
}
</style>

</head>
<body>
<div class="mypage_container py-5" style="height: 70%">	
	  <div class="row my-5 mypage_sub_container">
	    <div class="col-sm-2 mypage_menu_div" >
	  	  <jsp:include page="../mypage/mypage_menu.jsp"></jsp:include>
	    </div>
	    <div class="px-5 pl-5 mypage_home_div" style="">
	      <jsp:include page="${mypage_jsp }"></jsp:include>
	    </div>
	  </div>
</div> 

</body>
</html>