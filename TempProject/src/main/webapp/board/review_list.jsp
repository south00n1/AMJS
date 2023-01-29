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


<!-- 게시판 start -->

<div class="wrapper row3">
  <main class="container clear">
  
  <div style="height: 100px;">
  
  
  </div>
  <div>
  <h2>Review</h2>
  <h6>후기 게시판</h6>
  <p>Go Out Display를 통해 예약하고 직접 방문하여 관람한 전시에 대하여 관람객들의 솔직한 후기를 남기는 게시판입니다.</p>
  </div>
   <h6><span style="color:#2737C;font-size: 25px"><fmt:formatNumber value="${count }" type="number"/></span>개의 글</h6>
   <hr style="float:left;width: 55%">
  <div style="height: 5px"></div>
  <div style="height: 550px">
  <table class="table">
    <tr>
      <td>
        <a href="../board/review_insert.do" class="btn btn-sm btn-danger">글 작성</a>
      </td>
    </tr>
  </table>
  <table class="table">
    <tr>
      <th width=10% class="text-center">no</th>
      <th width=45% class="text-center">제목</th>
      <th width=15% class="text-center">전시명</th>
      <th width=10% class="text-center">작성자</th>
      <th width=10% class="text-center">작성일</th>
      <th width=10% class="text-center">조회</th>
    </tr>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td width="10%" class="text-center">${vo.grbno}</td><%-- vo.getNo() = {} getXxx() --%>
        <td width="45%">
         <a href="../board/review_detail.do?grbno=${vo.grbno }">${vo.subject}</a>&nbsp;
         <c:if test="${vo.dbday==today }">
           <sup><img src="../board/image/new.gif"></sup>
         </c:if>
        </td>
        <td width="15%" class="text-center">${vo.display_name }</td>        
        <td width="10%" class="text-center">${vo.name }</td>
        <td width="10%" class="text-center">${vo.dbday }</td>
        <td width="10%" class="text-center">${vo.hit }</td>
      </tr>
    </c:forEach>
  </table>
  </div>
   <nav class="pagination">
        <ul>
         <c:if test="${startPage>1 }">
          <li><a href="../board/review_list.do?page=${startPage-1 }">&laquo; Previous</a></li>
         </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li ${i==curpage?"class=current":"" }><a href="../board/review_list.do?page=${i }">${i }</a></li>
          </c:forEach>
         <c:if test="${endPage<totalpage }">
          <li><a href="../board/review_list.do?page=${endPage+1 }">Next &raquo;</a></li>
         </c:if>
        </ul>
        <!-- 검색바 start -->
        <div class="board_search">
        <div class="container">
		<div class="row">
			<form method="post" name="search" action="searchbbs.jsp" pos>
				<table class="pull-right">
					<tr>
						<td><select class="form-control" name="searchField">
								<option value="0">선택</option>
								<option value="bbsTitle">제목</option>
								<option value="userID">작성자</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	</div>
        <!-- 검색바 end -->
      </nav>
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