<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GO OUT DISPLAY</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
</head>
<body>
<%--
				vo.setGnbno(rs.getInt(1));
				vo.setType(rs.getInt(2));
				vo.setSubject(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setDbday(rs.getString(5));
				vo.setHit(rs.getInt(6));

 --%>

<!-- 게시판 start -->
<div class="wrapper row3">
  <main class="container clear">
  <h2 class="sectiontitle">공지사항 등록</h2>
  <div style="height: 5px"></div>
  <form method="post" action="../adminpage/notice_insert_ok.do">
  <table class="table">
    <tr>
      <th width=15% class="text-right">구분</th>
      <td width=80%>
        <select name="type" class="input-sm">
          <option value="1">서비스소식</option>
          <option value="2">서비스오픈</option>
          <option value="3">서비스종료</option>
          <option value="4">서비스점검</option>
          <option value="5">안내</option>
        </select>
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">이름</th>
      <td width=80%>
        <input type=text name=name size=20 class="input-sm" readonly value="${sessionScope.id }">
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">제목</th>
      <td width=80%>
        <input type=text name=subject size=60 class="input-sm">
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">내용</th>
      <td width=80%>
        <textarea rows="15" cols="80" name="content"></textarea>
      </td>
    </tr>
    <tr>
      <td colspan="2" class="text-center">
        <input type=submit value="글쓰기" class="btn btn-sm btn-danger">
        <input type=button value="취소" class="btn btn-sm btn-danger" onclick="javascript:history.back()">
      </td>
    </tr>
  </table>
  </form>
  </main>
</div>

<!-- 게시판 end -->

    


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