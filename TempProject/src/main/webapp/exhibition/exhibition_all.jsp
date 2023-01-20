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

<!-- 목록 start -->
  <div class="container">
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->

    
    <!-- ################################################################################################ --> 
  
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row3">
    <h2 class="sectiontitle">전체 전시</h2>
     <div style="width: 500px; overflow: hidden;">
     <ul class="inline-block">
      <c:forEach var="vo" items="${list }" varStatus="s">
        <li class="one_quarter ${s.index%4==0?'first':'' }"><a href="#"><img class="img-list" src="${vo.poster }" width=100% height=100%></a>
      </c:forEach>       
     </ul>
<!-- 

          <div class="row g-4 justify-content-center">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="course-item bg-white">
                        <div class="overflow-hidden" style="width: 50%">
                        <ul class="nospace clear">
                            <c:forEach var="vo" items="${list }" varStatus="s">
             				  <li class="one_quarter ${s.index%4==0?'first':'' }"><a href="#"><img class="img-list" src="${vo.poster }"></a></li>
           					</c:forEach>
           				</ul>
                      	</div>
                       
                    </div>
                </div>
 -->

      </div>
      <!-- class="current" -->
      <!-- 
      <nav class="pagination">
         
        <ul>
         <c:if test="${startPage>1 }">
          <li><a href="../list/list_all.do?page=${startPage-1 }">&laquo; Previous</a></li>
         </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li ${i==curpage?"class=current":"" }><a href="../list/list_all.do?page=${i }">${i }</a></li>
          </c:forEach>
         <c:if test="${endPage<totalpage }">
          <li><a href="../list/list_all.do?page=${endPage+1 }">Next &raquo;</a></li>
         </c:if>
        </ul>

      </nav>
      -->
    </div>
    <div class="clear"></div>
    </div>
</div>



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