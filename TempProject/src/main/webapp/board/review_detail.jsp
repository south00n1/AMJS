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


<!-- 게시판 글 상세 start -->

<div class="wrapper row3">
  <main class="container clear">
  <h2 class="sectiontitle">글쓰기</h2>
  <div style="height: 5px"></div>
  <table class="table">
   <tr>
     <th width=20% class="text-center">번호</th>
     <td width=30% class="text-center">${vo.grbno }</td>
     <th width=20% class="text-center">작성일</th>
     <td width=30% class="text-center">${vo.dbday }</td>
   </tr>
   <tr>
     <th width=20% class="text-center">이름</th>
     <td width=30% class="text-center">${vo.name }</td>
     <th width=20% class="text-center">조회수</th>
     <td width=30% class="text-center">${vo.hit }</td>
   </tr>
   <tr>
     <th width=20% class="text-center">제목</th>
     <td colspan="3">${vo.subject }</td>
   </tr>
      <tr>
     <th width=20% class="text-center">관람전시</th>
     <td colspan="3">${vo.display_name }</td>
   </tr>
   <tr>
     <td class="text-left" valign="top" colspan="4" height="200"><pre style="white-space: pre-wrap;background-color: white;border: none">${vo.content }</pre></td>
   </tr>
   <tr>
     <td class="text-right" colspan="4">
       <a href="#" class="btn btn-xs btn-success">수정</a>
       <a href="#" class="btn btn-xs btn-warning">삭제</a>
       <a href="../board/review_list.do" class="btn btn-xs btn-info">목록</a>
     </td>
   </tr>
  </table>
  </main>
</div>

<!-- 게시판 글 상세 end -->

    


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