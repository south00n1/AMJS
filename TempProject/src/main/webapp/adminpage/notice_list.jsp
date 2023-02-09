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
	
	$('.notice_insert').hover(function(){
		$(this).css('cursor', 'pointer')
	})
	$('.notice_insert').click(function(){
		$.ajax({
			type:'post',
			url:'../adminpage/notice_insert.do',
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('.notice_insert').hover(function(){
		$(this).css('cursor', 'pointer')
	})
	$('.notice_update').click(function(){
		let gnbno = $(this).attr('data-gnbno')
		$.ajax({
			type:'post',
			url:'../adminpage/notice_update.do',
			data:{'gnbno':gnbno},
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('.notice_delete').click(function(){
		let gnbno = $(this).attr('data-gnbno')
		$.ajax({
			type:'post',
			url:'../adminpage/notice_delete.do',
			data:{'gnbno':gnbno},
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('.admin_notice_page').click(function(){
		let page = $(this).attr('data-page')
		$.ajax({
			type:'post',
			url:'../adminpage/notice_list.do',
			data:{'page':page},
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('.admin_notice_page_pre').click(function(){
		let page = $(this).attr('data-page')
		$.ajax({
			type:'post',
			url:'../adminpage/notice_list.do',
			data:{'page':page},
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('.admin_notice_page_next').click(function(){
		let page = $(this).attr('data-page')
		$.ajax({
			type:'post',
			url:'../adminpage/notice_list.do',
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
.li_active {
	background-color: #27375C;
	color: #FFFFFF;
	border-radius: 5px 5px 5px 5px;
	z-index: 2;
}

    * {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>

</head>
<body>
		<div class="col-11 mypage_home_title" style="display: flex; justify-content: space-between;">
			<h4 class="mypage_home_subtitle">공지사항 목록</h4>
			<div class="rst notice_insert" style="text-align:center; background-color: #27375C; width:100px; height: 30px; margin-right:35px;">
			<i class="fa-solid fa-pen fa-sm"></i>&nbsp;공지등록
			</div>
		</div>
		<div class="col-11 mypage_home_content">
			<table class="table" style="table-layout: fixed;">
				<tr>
					<th width="15%" class="text-center">분류</th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
					<th width="15%" class="text-center">수정/삭제</th>
				</tr>
				<c:forEach var="vo" items="${list }">
				<tr style="vertical-align: middle;">
					<td width="10%" class="text-center origin">${vo.prefix }</td>
					<td width="45%" class="text-center origin">${vo.subject }</td>
					<td width="15%" class="text-center origin">${today }</td>
					<td width="10%" class="text-center origin">${vo.hit }</td>
					<td width="15%" class="text-center origin">
					<span class="rst notice_update" data-gnbno="${vo.gnbno }" style="background-color: green;">수정</span>
					<span class="rst notice_delete" data-gnbno="${vo.gnbno }" style="background-color: red;">삭제</span>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
			<ul id="page_ul" style="padding-left: 0px; padding-right: 90px">
		    	<c:if test="${startPage>1 }">
		          <li class="page_li"><span class="admin_notice_page_pre page_a" data-page="${startPage-1 }" style="font-size: 10px; width: 20px">◀</span></li>
		        </c:if>
		        <c:forEach var="i" begin="${startPage }" end="${endPage }">
		          <li class="page_li" ><span class="admin_notice_page page_a${i==curpage?" li_active":"" }" data-page="${i }">${i }</span></li>          
		        </c:forEach>    
		        <c:if test="${endPage<totalpage }">
		          <li class="page_li"><span class="admin_notice_page_next page_a" data-page="${endPage+1 }" style="font-size: 10px; width: 20px">▶</span></li>
		        </c:if>
		    </ul>
</body>
</html>