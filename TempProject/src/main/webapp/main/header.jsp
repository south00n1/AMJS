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

// 로그아웃 버튼
$(function(){
	$('#logoutBtn').click(function(){
		$.ajax({
			type:'post',
			url:'../member/logout.do',
			success:function(result) {
				location.href="../main/main.do"
			}
		})
	})
})
</script>
<style type="text/css">
* {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
</head>
<body>
    
	<nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <a href="../main/main.do" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
        <img src="../main/image/main-logo.jpg">
            <!--  <h2 class="m-0 text-primary">Go Out Display</h2>-->
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
        
            <div class="navbar-nav ms-auto p-4 p-lg-0">
             
                <a href="../main/main.do" class="nav-item nav-link active">홈</a>
                <a href="../exhibition/exhibition_all.do" class="nav-item nav-link">전시회 목록</a>
                <div class="nav-item dropdown">
                	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">미술관</a>
                	<div class="dropdown-menu fade-down m-0">
                        <a href="../picture/list.do" class="dropdown-item">미술품</a>
                        <a href="../picture/gallery.do" class="dropdown-item">2D 전시회</a>
                        <a href="../reserve/reserve_main.do" class="dropdown-item">전시예약</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="../board/review_list.do" class="dropdown-item">후기게시판</a>
                        <a href="../board/event_list.do" class="dropdown-item">이벤트게시판</a>
                        <a href="../board/notice_list.do" class="dropdown-item">공지사항</a>
                    </div>
                </div>
                <a href="../service/main.do" class="nav-item nav-link">고객센터</a>
                <c:if test="${sessionScope.id != null }">
					<c:if test="${sessionScope.admin == 'n' }">
		                <a href="../mypage/mypage_main.do" class="nav-item nav-link">마이페이지</a>
					</c:if>
					<c:if test="${sessionScope.admin == 'y' }">
		                <a href="../adminpage/adminpage_main.do" class="nav-item nav-link">관리자페이지</a>
					</c:if>
				</c:if>
            </div>
            <c:if test="${sessionScope.id==null }">
           	<a href="../member/login.do" class="btn btn-primary py-4 px-lg-4 d-none d-lg-block b1">로그인<i class="fa fa-arrow-right ms-3"></i></a>
        	</c:if>
        	<c:if test="${sessionScope.id!=null }">
           	<a href="../member/logout.do" class="btn btn-primary py-4 px-lg-4 d-none d-lg-block b1" id="logoutBtn">로그아웃<i class="fa fa-arrow-right ms-3"></i></a>
        	</c:if>
        </div>
    </nav>
    <!-- slider start(test) -->
   
    <!-- search bar start -->
    
    <!-- search bar end -->
   
 
    <!-- slider end(test) -->
    
</body>
</html>