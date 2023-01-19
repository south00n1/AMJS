<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	/* border: 1px solid black; */
	box-sizing: border-box;
}

div.mypageForm {
	width: 100%;
	height: 800px;
	display: flex;
	flex-direction: row;
	align-items: center;
}
div.mypageList {
	border: 1px solid black;
	width: 25%;
	height: 600px;
}
div.mypageContents {
	border: 1px solid black;
	width: 75%;
	height: 600px;
	
}
</style>
</head>
<body>
	<div class="mypageForm">
	  <div class="mypageList">
	  	<div>
	  	  <h2>마이페이지</h2>
	  	</div>
	  	<div class="exhibitionInfo">
	  	  <h3>내 전시회 정보</h3>
	  	</div>
	  	<div class="communityInfo">
	  	  <h3>내 활동</h3>
	  	</div>
	  	<div class="userInfo">
	  	  <h3>회원정보수정</h3>
	  	</div>
	  </div>
	  
	  <div class="mypageContents">
	  </div>
	</div>
</body>
</html>