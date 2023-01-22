<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
	<nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <a href="../main/main.do" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary">Go Out Display</h2>
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
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="../board/review_list.do" class="dropdown-item">후기게시판</a>
                        <a href="#" class="dropdown-item">이벤트게시판</a>
                        <a href="#" class="dropdown-item">공지사항</a>
                    </div>
                </div>
                <a href="../service/main.do" class="nav-item nav-link">고객센터</a>
            </div>
            <a href="../user/login.do" class="btn btn-primary py-4 px-lg-4 d-none d-lg-block b1">로그인<i class="fa fa-arrow-right ms-3"></i></a>
        </div>
    </nav>
    <!-- slider start(test) -->
   
    <!-- search bar start -->
    
    <!-- search bar end -->
   
 
    <!-- slider end(test) -->
    
</body>
</html>