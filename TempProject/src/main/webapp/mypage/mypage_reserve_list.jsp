<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mypage_home_title {
	margin: 0px;
	margin-bottom: 10px;
	padding-bottom: 15px;
	border-bottom: 2px solid #E2E2E2;
}
.mypage_home_content {
	margin: 0px;
}
.mypage_home_subtitle {
	color: #27375C;
}
.reserve_state {
	width:70px;
	hiegh:30px;
	color: #fff;
	border-radius: 5px;
	font-size: 15px;
	padding: 5px 7px;;
}
</style>
</head>
<body>
		<div class="col-11 mypage_home_title">
			<h4 class="mypage_home_subtitle">예매 목록</h4>
		</div>
		<div class="col-11 mypage_home_content">
			<table class="table">
				<tr>
					<th width="40%" class="text-center">전시회명</th>
					<th width="10%" class="text-center">포스터</th>
					<th width="10%" class="text-center">장소</th>
					<th width="10%" class="text-center">날짜</th>
					<th width="10%" class="text-center">시간</th>
					<th width="5%" class="text-center">인원</th>
					<th width="15%" class="text-center">예매상태</th>
				</tr>
				<c:forEach var="vo" items="${list }">
				<tr style="vertical-align: middle;">
					<td width="40%" class="text-center" >${vo.evo.title }</td>
					<td width="10%" class="text-center"><img src="${vo.evo.poster }" style="width:50px; height:50px"></td>
					<td width="10%" class="text-center">${vo.evo.loc }</td>
					<td width="10%" class="text-center">${vo.rdate }</td>
					<td width="10%" class="text-center">${vo.rtime }</td>
					<td width="5%" class="text-center">${vo.inwon }</td>
					<td width="15%" class="text-center">
						<span data-no="" class="reserve_state" style="background-color: green;">대기</span>
						<span data-no="" class="reserve_state" style="background-color: red;">취소</span>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
</body>
</html>