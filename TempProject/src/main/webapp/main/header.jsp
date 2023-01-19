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
        <a href="main.jsp" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary">Go Out Display</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
        
            <div class="navbar-nav ms-auto p-4 p-lg-0">
             <!-- search bar start -->
       		<div class="box">
 			<div class="container-2">
      		<span class="icon"><i class="fa fa-search"></i></span>
      		<input type="search" id="search" placeholder="Search..." />
  			</div>
			</div>
			</div>
        <!-- search bar end -->
                <a href="../main/main.do" class="nav-item nav-link active">홈</a>
                <a href="about.jsp" class="nav-item nav-link">전시회 목록</a>
                <a href="courses.jsp" class="nav-item nav-link">2D 전시회</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="team.jsp" class="dropdown-item">후기게시판</a>
                        <a href="testimonial.jsp" class="dropdown-item">이벤트게시판</a>
                        <a href="404.jsp" class="dropdown-item">공지사항</a>
                    </div>
                </div>
                <a href="contact.jsp" class="nav-item nav-link">고객센터</a>
            </div>
            <a href="../user/login.jsp" class="btn btn-primary py-4 px-lg-4 d-none d-lg-block b1">로그인<i class="fa fa-arrow-right ms-3"></i></a>
        </div>
    </nav>
    <!-- slider start(test) -->
    
 
    <!-- slider end(test) -->
    
          <div class="owl-carousel header-carousel position-relative">
            <div class="owl-carousel-item position-relative">
                <img class="img-fluid" src="../img/main_image.png" alt="" style="height: 550px;width: 100%;">
                <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
                    <div class="container">
                        <div class="row justify-content-start">
                            <div class="col-sm-10 col-lg-8">
                                <h5 class="text-white text-uppercase mb-3 animated slideInDown">Best Online Courses</h5>
                                <h1 class="display-3 text-white animated slideInDown">The Best Online Learning Platform</h1>
                                <p class="fs-5 text-white mb-4 pb-2">Vero elitr justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd rebum ipsum et diam justo clita et kasd rebum sea sanctus eirmod elitr.</p>
                                <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read More</a>
                                <a href="" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Join Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="owl-carousel-item position-relative">
                <img class="img-fluid" src="../img/main_image.png" alt="" style="height: 550px">
                <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
                    <div class="container">
                        <div class="row justify-content-start">
                            <div class="col-sm-10 col-lg-8">
                                <h5 class="text-white text-uppercase mb-3 animated slideInDown">Best Online Courses</h5>
                                <h1 class="display-3 text-white animated slideInDown">Get Educated Online From Your Home</h1>
                                <p class="fs-5 text-white mb-4 pb-2">Vero elitr justo clita lorem. Ipsum dolor at sed stet sit diam no. Kasd rebum ipsum et diam justo clita et kasd rebum sea sanctus eirmod elitr.</p>
                                <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read More</a>
                                <a href="" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Join Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>