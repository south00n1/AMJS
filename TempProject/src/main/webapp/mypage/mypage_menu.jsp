<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
font-family: font-family: 'Noto Sans KR', sans-serif;
}
.mypage_title {
	color: #27375C;
	font-size: 30px;
	padding-bottom: 40px;
}

.mypage_ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
}

li.mypage_menu {
	font-size: 22px;
	font-weight: bold;
	color: #27375C!important;
	padding-bottom: 5px;
}
li.mypage_menu:hover {
	cursor: pointer;
}
li.mypage_menu::before {
	content: <i class="fa-solid fa-star"></i>;
}

.mypage_menu_child {
	color: #666;
	font-size: 15px;
	font-weight: bold;
}
.mypage_menu_child:hover {
	color: #27375C!important;
	cursor: pointer;
}
.mypage_menu_child a {
	color: #666;
}
.mypage_menu_child a:hover {
	color: #27375C!important;
	cursor: pointer;
}
.mypage_li_div {
	margin-bottom: 30px;
	padding-bottom: 10px;
	border-bottom: 1px solid #E2E2E2;
}
.mypage_li_div:last-child {
	margin-bottom: 30px;
	padding-bottom: 10px;
	border-bottom: none;
}
</style>
</head>
<body>
	<ul class="mypage_ul">
		<h2 class="mypage_title">MyPage</h2>
		<div class="mypage_li_div">
	  	    <li class="mypage_menu">내 활동</li>
	  	    <li class="mypage_menu_child">내가 쓴 게시글</li>
	  	    <li class="mypage_menu_child">내가 쓴 댓글</li>
  	    </div>
  	    <div class="mypage_li_div">
  	    	<li class="mypage_menu">예매 목록</li>
  	    </div>
  	    <div class="mypage_li_div">
  	    	<a href="../mypage/jjim_list.do" id="jjim_list"><li class="mypage_menu">찜하기 목록</li></a>
  	    </div>
  	    <div class="mypage_li_div">
	  	    <li class="mypage_menu">내 정보</li>
	  	    <li class="mypage_menu_child"><a href="../member/join_update.do">정보 수정</a></li>
	  	    <li class="mypage_menu_child"><a href="../member/join_delete.do">회원 탈퇴</a></li>
		</div>
	</ul>
</body>
</html>