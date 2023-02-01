<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GO OUT DISPLAY</title>
<style type="text/css">
 /*######## 페이지네이션 #########*/

ul {
	list-style: none;
	display: block;
	text-align: center;
	margin-top: 35px;
}
ul > li {
  	display: inline-block;
}

li a {
    transition: all 100ms ease-in-out 0s;
    background-color: #F7F7F8;
    border-radius: 5px 5px 5px 5px;
    color: #69696E;
    display: block;
    font: 12px/30px Arial, sans-serif;
    height: 30px;
    margin: 0px;
    overflow: hidden;
    text-align: center;
    text-decoration: none;
    width: 30px;
}

li a:hover {
    background-color: #27375C;
    color: #FFFFFF;
}
li.active a {
    background-color: #27375C;
    color: #FFFFFF;
}
li.active a:hover {
    color: #FFFFFF;
}

::marker {
	content: "";
}
</style>
<!-- 목록 start -->
  <div class="container">
			<div class="text-center">
				<h2 class="sectiontitle">전체 전시</h2>
				<h6 class="sectiontitle-1">총 <span class="sectionnumber"><fmt:formatNumber value="${count }" type="number"/></span>개의 전시가 있습니다</h6>
			</div>
			<div class="row g-4 justify-content-center">
			<c:forEach var="vo" items="${list }" begin="1" end="12" step="1">
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="course-item bg-white">
							<div class="position-relative overflow-hidden">
							  <a href="../exhibition/exhibition_detail.do?geno=${vo.geno }"><img class="img-fluid" src="${vo.poster }" title="${vo.title }" style="height: 380px"></a>
							</div>
							<div class="text-center py-3 px-2">
								<h6 class="mb-0">${vo.title }</h6>
								  <div class="mt-2">
									<small>${vo.period }</small><br> 
									<h6 class="mt-0" style="font-size: 0.6rem; height: auto">${vo.loc }</h6>
								  </div>
							</div>
						</div>
					</div>
			</c:forEach>
		    </div>
	</div>



      
      <!--  
      <div class="container">
   <div class="row g-4 justify-content-center"> 
	<section>
     <h2 class="sectiontitle">전체 전시</h2>
     <h6 class="sectiontitle-1">총 <span class="sectionnumber"><fmt:formatNumber value="${count }" type="number"/></span>개의 전시가 있습니다</h6>
      <div class="nospace clear">
       <c:forEach var="vo" items="${list }" varStatus="s">
        <div class="one_quarter ${s.index%4==0?'first':''}">
          <div class="course-item bg-white">
							<div>
								<img class="img-fluid" src="${vo.poster }" alt=""
									style="height: 380px">
							</div>
							<div class="text-center py-3 px-2" style="width: 270px">
								<h6 class="mb-0">${vo.title }</h6>
								<div class="mt-2">
									<small>${vo.period }</small><br> <span class="mt-0" style="font-size: 0.6rem;">${vo.loc }</span>
								</div>
							</div>
						</div>
        </div>
       </c:forEach>      
      </div>
      
     
      
     </section>
    </div>
    -->
</div>
<div class="bottom">

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
    <footer>
    	
    </footer>
    <ul>
    	<c:if test="${startPage>1 }">
          <li><a href="../exhibition/exhibition_all.do?page=${startPage-1 }">&lt;</a></li>
        </c:if>
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
          <li ${i==curpage?"class=active":"" }><a href="../exhibition/exhibition_all.do?page=${i }">${i }</a></li>          
        </c:forEach>    
        <c:if test="${endPage<totalpage }">
          <li><a href="../exhibition/exhibition_all.do?page=${endPage+1 }">&gt;</a></li>
        </c:if>
    </ul>
</body>
</html>