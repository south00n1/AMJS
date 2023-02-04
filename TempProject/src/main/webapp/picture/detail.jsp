<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
}
div.pic_detail_container {
	width: 1300px;
	margin: 50px auto;
}
div.pic_detail_cont1 {
	float: left;
    width: 600px;
    height: 600px;
    margin-bottom: 10px;
}
div.pic_detail_cont2 {
	float: left;
    width: 600px;
    height: 600px;
    margin-left: 60px;
    padding-right: 30px;
    overflow: auto  
}
div.pic_detail_cont2::-webkit-scrollbar {
    width: 8px;  /* 스크롤바의 너비 */
}

div.pic_detail_cont2::-webkit-scrollbar-thumb {
    height: 90%; /* 스크롤바의 길이 */
    background: #27375C; /* 스크롤바의 색상 */
    border-radius: 10px;
}

div.pic_detail_cont2::-webkit-scrollbar-track {
    background: rgba(33, 122, 244, .1);  /*스크롤바 뒷 배경 색상*/
}
div.pic_detail_small {
	width: 600px;
	height: 100px;
	padding-top: 10px;
}
div.pic_detail_menu {
    width: 600px;
    height: 100px;
    float: right;
    text-align: right;
    padding-top: 10px;
    padding-right: 40px;
}
div.pic_detail_reply {
    width: 100%;
    height: 200px;
    clear: both;
    padding-top: 15px;
    text-align: right;
}
input[type=button] {
	width: 70px;
	height: 40px;
	color: #27375C;
	background-color: white;
	border-radius: 5px;
	font-weight: bold;
	transition: 0.3s;
	border:none;
	border: 1px solid #27375C;
}
input[type=button]:first-child {
}

input[type=button]:hover {
	color: white;
	background-color: #27375C;
}
.jjim {
	width: 70px;
	height: 40px;
	color: #27375C;
	background-color: white;
	border-radius: 5px;
	font-weight: bold;
	transition: 0.3s;
	border: 1px solid #27375C;
}
.jjim:hover {
	color: white;
	background-color: #27375C;
}
</style>
</head>
<body>
	<div class="pic_detail_container">
		
		<div class="pic_detail_cont1">
			<img src="${vo.image }" style="width: 600px; height: 600px;">
		</div>
		<div class="pic_detail_cont2">
			<table class="table">
				<tr>
					<th colspan="2"><h2>${vo.title }</h2></th>
				</tr>
				<tr>
					<th width=20%>작가</th>
					<td width=80%>${vo.name }</td>
				</tr>
				<tr>
					<th width=20%>작품정보</th>
					<td width=80%>${vo.info }</td>
				</tr>
				<tr>
					<th width=20%>작품코드</th>
					<td width=80%>${vo.code }</td>
				</tr>
				<tr>
					<th width=20%>추천이유</th>
					<td width=80%>${vo.content2  }</td>
				</tr>
				<tr>
					<th width=20%>큐레이터 노트</th>
					<td width=80%>${vo.content }</td>
				</tr>
			</table>
		</div>
		<div class="pic_detail_small">
			<c:forTokens items="${vo.image2 }" delims="^" var="image" begin="1" end="5">
				<img src="${image }" style="display: inline-block; width: 100px; height: 100px;">
			</c:forTokens>
		</div>
		<div class="pic_detail_menu">
			<c:if test="${sessionScope.id!=null }">
				<c:if test="${jjim_count == 0 }">
					<a href="../jjim/jjim_insert.do?gpno=${vo.gpno }" class="btn btn-xs" style="background-color: #27375C; color: #fff; border-radius: 5px;">찜하기</a>
				</c:if>
				<c:if test="${jjim_count != 0 }">
					<span href="../jjim/jjim_insert.do?gpno=${vo.gpno }" class="btn btn-xs" style="background-color: gray; color: #fff; border-radius: 5px;">찜하기</span>
				</c:if>
			</c:if>
				<a href="../picture/list.do" class="btn btn-xs" style="background-color: #27375C; color: #fff; border-radius: 5px;">목록</a>
		</div>
		<table class="table">
		   <tr>
		      <td class="text-center">댓글이 없습니다</td>
		   </tr>
		</table>
		<div class="pic_detail_reply">
		</div>
		
		
	</div>

</body>
</html>