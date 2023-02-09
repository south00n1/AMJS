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
	
	$('.admin_member_page').click(function(){
		let page = $(this).attr('data-page')
		$.ajax({
			type:'post',
			url:'../adminpage/member_list.do',
			data:{'page':page},
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('.admin_member_page').click(function(){
		let page = $(this).attr('data-page')
		$.ajax({
			type:'post',
			url:'../adminpage/member_list.do',
			data:{'page':page},
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	
	$('.admin_member_page').click(function(){
		let page = $(this).attr('data-page')
		$.ajax({
			type:'post',
			url:'../adminpage/member_list.do',
			data:{'page':page},
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	$('.adminpage_member_delBtn').hover(function(){
		$(this).css('cursor', 'pointer')
	})
	$('.adminpage_member_delBtn').click(function(){
		let result = confirm("회원탈퇴 시키시겠습니까?");
        
        if(result)
        {
			let id = $(this).attr('data-id')
			$.ajax({
				type:'post',
				url:'../adminpage/member_delete_list.do',
				data:{'id':id},
				success:function(response) {
					$('.mypage_home_div').html(response)
				}
			})
        }
        else
        {
            alert("취소됐습니다.")
        }
	})
})
/*
let result = confirm("회원탈퇴 시키시겠습니까?");
 
 if(result) {

 } else {
 	alert("취소됐습니다.")
 }
 */
</script>
<style type="text/css">
* {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
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
</style>
</head>
<body>
		<div class="col-11 mypage_home_title">
			<h4 class="mypage_home_subtitle">회원목록</h4>
		</div>
		<div class="col-11 mypage_home_content">
			<table class="table" style="table-layout: fixed;">
				<tr>
					<th width="15%" class="text-center">아이디</th>
					<th width="15%" class="text-center">이름</th>
					<th width="10%" class="text-center">성별</th>
					<th width="20%" class="text-center">생년월일</th>
					<th width="30%" class="text-center">이메일</th>
					<th width="10%" class="text-center">관리</th>
				</tr>
				<c:forEach var="vo" items="${list }">
				<tr style="vertical-align: middle;">
					<td width="10%" class="text-center origin">${vo.id }</td>
					<td width="15%" class="text-center origin">${vo.name }</td>
					<td width="30%" class="text-center origin">${vo.sex }</td>
					<td width="10%" class="text-center origin">${vo.birthday }</td>
					<td width="15%" class="text-center origin">${vo.email }</td>
					<td width="10%" class="text-center origin">
					<span class="adminpage_member_delBtn" data-id="${vo.id }"><img src="../img/delete.png" style="width:25px; height: 25px"></span>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
			<ul id="page_ul" style="padding-left: 0px; padding-right: 90px">
		    	<c:if test="${startPage>1 }">
		          <li class="page_li"><span class="admin_member_page_pre page_a" data-page="${startPage-1 }" style="font-size: 10px; width: 20px">◀</span></li>
		        </c:if>
		        <c:forEach var="i" begin="${startPage }" end="${endPage }">
		          <li class="page_li" ${i==curpage?"class=active":"" }><span class="admin_member_page page_a${i==curpage?" li_active":"" }" data-page="${i }">${i }</span></li>          
		        </c:forEach>    
		        <c:if test="${endPage<totalpage }">
		          <li class="page_li"><span class="admin_member_page_next page_a" data-page="${endPage+1 }" style="font-size: 10px; width: 20px">▶</span></li>
		        </c:if>
		    </ul>
</body>
</html>