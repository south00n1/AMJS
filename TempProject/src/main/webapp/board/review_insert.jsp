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


<!-- 게시판 글 작성 start -->
<div class="wrapper row3">
  <main class="container clear">
  
  <div style="height: 100px;">
  </div>
  <div>
  <h2>Review</h2>
  <h6>글쓰기</h6>
  </div>
  <div style="height: 20px;"></div>
  <hr>
  <div style="height: 10px;"></div>
    <div style="height: auto;">
  <form method="post" action="../board/review_insert_ok.do">
  <table class="table">
    <tr>
      <th width=15% class="text-right">작성자</th>
      <td width=20%>
      	${sessionScope.id }
        <%--<input type=text name=name size=40 placeholder="이름 입력" class="input-sm"> --%>
        <input type=hidden name=name size=45 value="${sessionScope.id }" required>
      </td>

    </tr>
    <tr>
      <th width=15% class="text-left">전시명</th>
      <td width=50%>
      <input type=text name=display_name size=40 placeholder="전시명 입력" class="input-sm">
      </td>
    </tr>
    <tr>
      <th width=10% class="text-right">제목</th>
      <td width=90%>
        <input type=text name=subject size=40 placeholder="제목을 입력해주세요." class="input-sm">
      </td>
      <th width=15% class="text-left"></th>
      <td width=50%>
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">내용</th>
      <td width=80% colspan="3">
        <textarea rows="20" cols="90" name="content" placeholder="내용을 입력하세요."></textarea>
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">비밀번호</th>
      <td width=80% colspan="3">
        <input type=password name=pwd size=40 placeholder="비밀번호를 입력하세요." class="input-sm">
      </td>
    </tr>
    <tr>
      <td colspan="4" class="text-center">
        <input type=submit value="글쓰기" class="btn btn-sm btn-danger">
        <input type=button value="취소" class="btn btn-sm btn-danger" onclick="javascript:history.back()">
      </td>
    </tr>
  </table>
  </form>
  </div>
  </main>
</div>

<!-- 게시판 글 작성 end -->

    


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