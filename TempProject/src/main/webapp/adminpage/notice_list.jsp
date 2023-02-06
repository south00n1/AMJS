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
  <div style="height: 300px">
  <table class="table">
    <tr>
      <td>
    <span style="float: right;border: 1px solid #ccc;background: background: #fff; margin-right: 20px;"><a href="../adminpage/notice_insert.do" class="btn btn-sm writerbtn"><i class="fa-solid fa-pen fa-lg"></i>&nbsp;공지등록</a></span>
        </td>
    </tr>
  </table>
  <table class="table">
    <tr>
      <th width=10% class="text-center">분류</th>
      <th width=40% class="text-center">제목</th>
      <th width=10% class="text-center">이름</th>
      <th width=15% class="text-center">작성일</th>
      <th width=10% class="text-center">조회수</th>
      <th width=15% class="text-center"></th>
    </tr>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td width="10%" class="text-center">${vo.prefix}</td><%-- vo.getNo() = {} getXxx() --%>
        <td width="40%">
         <a href="../board/notice_detail.do?gnbno=${vo.gnbno }">${vo.subject}</a>&nbsp;
         <c:if test="${vo.dbday==today }">
           <sup><img src="../board/image/new.gif"></sup>
         </c:if>
        </td>
        <td width="10%" class="text-center">${vo.name }</td>
        <td width="15%" class="text-center">${vo.dbday }</td>
        <td width="10%" class="text-center">${vo.hit }</td>
        <td width="15%" class="text-center">
          <a href="../adminpage/notice_update.do?gnbno=${vo.gnbno }" class="btn btn-xs btn-success">수정</a>
          <a href="../adminpage/notice_delete.do?gnbno=${vo.gnbno }" class="btn btn-xs btn-info">삭제</a>
        </td>
      </tr>
    </c:forEach>
  </table>
   <nav class="pagination">
        <ul>
         <c:if test="${startPage>1 }">
          <li><a href="../adminpage/notice_list.do?page=${startPage-1 }">&laquo; Previous</a></li>
         </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li ${i==curpage?"class=current":"" }><a href="../adminpage/notice_list.do?page=${i }">${i }</a></li>
          </c:forEach>
         <c:if test="${endPage<totalpage }">
          <li><a href="../adminpage/notice_list.do?page=${endPage+1 }">Next &raquo;</a></li>
         </c:if>
        </ul>
        <!-- pagination end -->
        <!-- 검색바 start -->
        <div class="board_search">
        <div class="container">
		<div class="row">
		 <form method="post" name="search" action="../adminpage/notice_list.do" class="inline">
			<table class="pull-right">
			 <tr>
			  <td><input type="text" id="search" value="${ss }"
					placeholder="검색어 입력" name="ss" maxlength="100"></td>
			  <td><button type="submit" class="btn btn-success">검색</button></td>
			 </tr>
			</table>
		 </form>
		</div>
	</div>
	</div>
        <!-- 검색바 end -->
        
      </nav>
  
  </div>
  
  			
  

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