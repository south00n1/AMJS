<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GO OUT DISPLAY</title>    
    <script src="https://kit.fontawesome.com/2fd2b83183.js" crossorigin="anonymous"></script>
        <style type="text/css">
    * {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
		}
.underline {
  line-height: 1.2;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol";
  font-size: 3em;
  font-weight: 700;
  background-image: linear-gradient(transparent calc(100% - 3px), #000 3px);
  background-repeat: no-repeat;
  background-size: 0% 100%;
  transition: background-size 0.8s;
  color: #000;
  cursor: pointer;
}
@media (min-width: 1000px) {
  .underline {
    font-size: 5em;
  }
}
.underline.yellow {
  background-image: linear-gradient(transparent 60%, #F8CD07 40%);
}
.underline:hover {
  background-size: 100% 100%;
}
#page_ul {
	list-style: none;
	display: block;
	text-align: center;
	margin-top: 35px;
}
.page_li {
  	display: inline-block;
}

.page_a {
    transition: all 100ms ease-in-out 0s;
    background-color: #dcdce0;
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

.page_a:hover {
    background-color: #27375C;
    color: #FFFFFF;
}
.page_li.active page_a {
    background-color: #27375C;
    color: #FFFFFF;
}
.page_li.active page_a:hover {
    color: #FFFFFF;
}
.li_active {
	background-color: #27375C;
	color: #FFFFFF;
	border-radius: 5px 5px 5px 5px;
	z-index: 2;
}
    </style>
</head>
<body>


<!-- 게시판 start -->

<!-- ### -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown"style="font-family: GmarketSansMedium">고객 관람후기</h1>
                    
	<div>
		<h5 style="color: white;font-family: GmarketSansMedium">실제 고객의 관람 후기를 만나보세요.</h5>
    	<div style="height: 10px"></div>
		  <form method=post action="../board/review_list.do" id=ss_frm>
			<input type=text id="search" name=ss value="${ss }" size=30 placeholder="검색어를 입력하세요" style="border-radius: 20px;border: none"/>
			<button type=submit id="sBtn" style="border: none;background: none;color: white;"><i class="fa fa-search"></i></button>
		  </form>
    </div>
    <div style="height: 10px"></div>
    <div style="height: 30px"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->

<div class="wrapper row3">
  <main class="container clear">
  



  <div style="height: 10px;"></div>
   <h6><span style="color:#2737C;font-size: 16px"><fmt:formatNumber value="${count }" type="number"/></span>개의 글</h6>
              <c:if test="${sessionScope.id!=null }">
          <span style="float: right;border: 1px solid #ccc;background:#fff; margin-right: 20px;"><a href="../board/review_insert.do" class="btn btn-sm writerbtn"><i class="fa-solid fa-pen fa-lg"></i>&nbsp;글쓰기</a></span>
  		   </c:if>
  <div style="height: 30px"></div>
  <hr>
  <div style="height: auto;">

  <table class="table">
    <tr>
      <th width=10% class="text-center">NO.</th>
      <th width=45% class="text-center">제목</th>
      <th width=15% class="text-center">전시명</th>
      <th width=10% class="text-center">작성자</th>
      <th width=10% class="text-center">작성일</th>
      <th width=10% class="text-center">조회</th>
    </tr>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td width="10%" height="50px" style="vertical-align: middle;font-size: 11px;" class="text-center">${vo.no}</td><%-- vo.getNo() = {} getXxx() --%>
        <td class="underline" width="45%" height="50px" style="vertical-align: middle;font-size: 13px;" >
         <a href="../board/review_detail.do?no=${vo.no }" style="color: black;">${vo.subject} ${rcount }</a> &nbsp;
         <c:if test="${vo.dbday==today }">
           <sup><img src="../board/image/new.gif"></sup>
         </c:if>
        </td>
        <td width="15%" height="50px" style="vertical-align: middle;font-size: 13px;"  class="text-center">${vo.display_name }</td>        
        <td width="10%" height="50px" style="vertical-align: middle;font-size: 13px;"  class="text-center">${vo.name }</td>
        <td width="10%" height="50px" style="vertical-align: middle;font-size: 13px;"  class="text-center">${vo.dbday }</td>
        <td width="10%" height="50px" style="vertical-align: middle;font-size: 13px;"  class="text-center">${vo.hit }</td>
      </tr>
    </c:forEach>
  </table>

  </div>
           <c:if test="${sessionScope.id!=null }">
          <span style="float: right;border: 1px solid #ccc;background: background: #fff; margin-right: 20px;"><a href="../board/review_insert.do" class="btn btn-sm writerbtn"><i class="fa-solid fa-pen fa-lg"></i>&nbsp;글쓰기</a></span>
  		   </c:if>
  		   
  		   		<div style="margin-left: 10px;">
  		     			<ul id="page_ul" >
		    	<c:if test="${startPage>1 }">
		          <li class="page_li"><a href="../board/review_list.do?page=${startPage-1 }" class="page_a${i==curpage?" li_active":"" }""" style="font-size: 10px; width: 20px">◀</a></li>
		        </c:if>
		        <c:forEach var="i" begin="${startPage }" end="${endPage }">
		          <li class="page_li" ${i==curpage?"class=active":"" }><a href="../board/review_list.do?page=${i }" class="page_a${i==curpage?" li_active":"" }""">${i }</a></li>          
		        </c:forEach>    
		        <c:if test="${endPage<totalpage }">
		          <li class="page_li"><a href="../board/review_list.do?page=${endPage+1 }" class="page_a${i==curpage?" li_active":"" }""" style="font-size: 10px; width: 20px">▶</a></li>
		        </c:if>
		    </ul>
		    </div>
		    
    <nav class="pagination">
 
        <!-- 검색바 start -->
        <div class="board_search">
        <div class="container">
      <div class="row">
         <form method="post" name="search" action="../board/review_list.do" class="inline">
            <table class="pull-right">
               <tr>
                  <td><input type="text" class="form-control"
                     placeholder="검색어 입력" name="ss" value="${ss }" maxlength="100"></td>
                  <td><button type="submit" class="btn btn-success" style="background-color: #27375c;border-radius: 10px;">검색</button></td>
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