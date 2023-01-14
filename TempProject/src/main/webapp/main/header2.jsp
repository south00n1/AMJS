<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    
	<nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <a href="../main/main.jsp" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary">Go Out Display</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="../main/main.jsp" class="nav-item nav-link active">홈</a>
                <a href="../main/about.jsp" class="nav-item nav-link">전시회 목록</a>
                <a href="../main/courses.jsp" class="nav-item nav-link">2D 전시회</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="../main/team.jsp" class="dropdown-item">후기게시판</a>
                        <a href="../main/testimonial.jsp" class="dropdown-item">이벤트게시판</a>
                        <a href="../main/404.jsp" class="dropdown-item">공지사항</a>
                    </div>
                </div>
                <a href="../main/contact.jsp" class="nav-item nav-link">고객센터</a>
            </div>
            <a href="../user/login.jsp" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">로그인<i class="fa fa-arrow-right ms-3"></i></a>
        </div>
    </nav>
    
    <div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">Template</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                            <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                            <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Template</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</body>
</html>