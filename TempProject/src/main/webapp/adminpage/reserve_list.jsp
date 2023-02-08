<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.reserve_okBtn').hover(function(){
		$(this).css('cursor', 'pointer')
	})
	
	$('.reserve_okBtn').click(function(){
		let gerno = $(this).attr('data-gerno')
		let page = $()
		$.ajax({
			type:'post',
			url:'../adminpage/admin_reserve_list_ok.do',
			data:{"gerno": gerno},
			success:function(response){
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	// 페이징 ajax
	$('.admin_reserve_page').click(function(){
		let page = $(this).attr('data-page')
		$.ajax({
			type:'post',
			url:'../adminpage/admin_reserve_list.do',
			data:{'page':page},
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('.admin_reserve_page_pre').click(function(){
		let page = $(this).attr('data-page')
		$.ajax({
			type:'post',
			url:'../adminpage/admin_reserve_list.do',
			data:{'page':page},
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	
	$('.admin_reserve_page_next').click(function(){
		let page = $(this).attr('data-page')
		$.ajax({
			type:'post',
			url:'../adminpage/admin_reserve_list.do',
			data:{'page':page},
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
})
</script>
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
.rst {
	width:70px;
	hiegh:30px;
	color: #fff;
	border-radius: 5px;
	font-size: 15px;
	padding: 5px 7px;;
}
* {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.origin {
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}
.origin > a {
	color: #52665B;
}
.origin > a:hover {
	color: #27375C;
}
.origin:hover {
	color: #27375C;
}

#page_ul {
	list-style: none;
	display: block;
	text-align: center;
	margin-top: 35px;
}
.page_li {
  	display: inline-block;
}

.page_a {
    transition: all 100ms ease-in-out 0s;
    background-color: #dcdce0;
    border-radius: 5px 5px 5px 5px;
    color: #69696E;
    display: block;
    font: 12px/30px Arial, sans-serif;
    height: 30px;
    margin: 0px;
    overflow: hidden;
    text-align: center;
    text-decoration: none;
    width: 30px;
}

.page_a:hover {
    background-color: #27375C;
    color: #FFFFFF;
}
.page_li.active page_a {
    background-color: #27375C;
    color: #FFFFFF;
}
.page_li.active page_a:hover {
    color: #FFFFFF;
}
</style>
</head>
<body>
		<div class="col-11 mypage_home_title">
			<h4 class="mypage_home_subtitle">예매 관리</h4>
		</div>
		<div class="col-11 mypage_home_content">
			<table class="table" style="table-layout: fixed;">
				<tr>
					<th width="40%" class="text-center">전시회명</th>
					<th width="10%" class="text-center">포스터</th>
					<th width="10%" class="text-center">장소</th>
					<th width="10%" class="text-center">날짜</th>
					<th width="10%" class="text-center">시간</th>
					<th width="5%" class="text-center">인원</th>
					<th width="15%" class="text-center">승인여부</th>
				</tr>
				<c:forEach var="vo" items="${list }">
				<tr style="vertical-align: middle;">
					<td width="40%" class="text-center origin" >${vo.evo.title }</td>
					<td width="10%" class="text-center origin"><img src="${vo.evo.poster }" style="width:50px; height:50px"></td>
					<td width="10%" class="text-center origin">${vo.evo.loc }</td>
					<td width="10%" class="text-center origin">${vo.rdate }</td>
					<td width="10%" class="text-center origin">${vo.rtime }</td>
					<td width="5%" class="text-center origin">${vo.inwon }</td>
					<td width="15%" class="text-center">
						<c:if test="${vo.ok == 'y'}">
						<span class="rst reserve_state" style="background-color: gray;">완료</span>
						</c:if>
						<c:if test="${vo.ok == 'n'}">
						<span data-gerno="${vo.gerno }" class="rst reserve_state reserve_okBtn" style="background-color: green;">대기</span>
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
			<ul id="page_ul" style="padding-left: 0px; padding-right: 90px">
		    	<c:if test="${startPage>1 }">
		          <li class="page_li"><span class="admin_reserve_page_pre page_a" data-page="${startPage-1 }" style="font-size: 10px; width: 20px">◀</span></li>
		        </c:if>
		        <c:forEach var="i" begin="${startPage }" end="${endPage }">
		          <li class="page_li" ${i==curpage?"class=active":"" }><span class="admin_reserve_page page_a" data-page="${i }">${i }</span></li>          
		        </c:forEach>    
		        <c:if test="${endPage<totalpage }">
		          <li class="page_li"><span class="admin_reserve_page_next page_a" data-page="${endPage+1 }" style="font-size: 10px; width: 20px">▶</span></li>
		        </c:if>
		    </ul>
</body>
</html>