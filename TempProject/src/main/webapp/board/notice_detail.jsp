<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>

<!-- 게시판 글 상세2 start -->
<div class="wrapper row3">
  <main class="container clear">
  <div style="height: 120px;"></div>
<div>
  <h2><a href="../board/notice_list.do" style="color:#27375C">Notice</a></h2>
  <h6><a href="../board/notice_list.do" style="color:#27375C">공지사항</a></h6>
  </div>
  <div style="height: 20px"></div>
  
<hr>
  <div style="height: auto">
  <table class="table">
    <tr>
      <th width=10% class="text-center">${vo.gnbno }</th>
      <th width=75% class="text-center" colspan="2" style="	font-size:20px;font-weight: 400;">${vo.subject }</th>
      <th width=15% class="text-center">${vo.dbday }</th>
    </tr>
      <tr>
<td class="text-left" valign="top" colspan="4" height="300"><pre style="white-space: pre-wrap;background-color: white;border: none;font-size: 15px;">${vo.content }</pre></td>
      </tr>


  </table>
  	<div class="btn_customer">
	<span class="btn btn-lg btn_list"><a href="../board/notice_list.do" class="btlcu">목록</a></span>
	</div>
  </div>
  </main>
  </div>

<!-- 게시판 글 상세2 end -->
    


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