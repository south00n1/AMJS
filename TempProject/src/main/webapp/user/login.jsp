<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GO OUT DISPLAY</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../img/favicon.ico" rel="icon">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
    <link href="../user/css/login.css" rel="stylesheet">
</head>

<body>
    
    <!-- Header Start -->
    <jsp:include page="../main/header2.jsp"></jsp:include>

	<div class="main-form">
	  <h1>GOD</h1>
	  <input type="text" placeholder="Username" value="">
	  <input type="password" placeholder="Password" value="">
	  <input class="inp-cbx" id="cbx" type="checkbox" style="display: none"/>
	  <label class="cbx" for="cbx"><span>
	      <svg width="12px" height="10px" viewbox="0 0 12 10">
	        <polyline points="1.5 6 4.5 9 10.5 1"></polyline>
	      </svg></span><span>로그인 상태 유지</span></label>
	  <input type="submit" value="로그인">
	  
	  <div>
	    <div>
	      <a href="#" title="" >아이디 찾기</a>
	      <a href="#" title="">비밀번호 찾기</a>
	    </div>
	  </div>
	  
	  <a href="#" title="">아직 회원이 아니신가요?</a>
	  
	</div>
	
	<!-- Footer Start -->
    <jsp:include page="../main/footer.jsp"></jsp:include>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../lib/wow/wow.min.js"></script>
    <script src="../lib/easing/easing.min.js"></script>
    <script src="../lib/waypoints/waypoints.min.js"></script>
    <script src="../lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../js/main.js"></script>
</body>

</html>