<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GO OUT DISPLAY</title>

    <script type="text/javascript">
    $(function(){
    	$('.event-division span').click(function(){
    		let ca=$(this).attr("data-name")
    		$.ajax({
    			type:'post',
    			url:'../board/event_ca.do',
    			data:{"ca":ca},
    			success:function(response)
    			{
    				$('#ca').html(response)
    			}
    		})
    	})
    })
    </script>
    
    
        <style type="text/css">
    * {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@import url(https://fonts.googleapis.com/css?family=Varela+Round);


.slides {
    padding: 0;
    width: 760px;
    height: 378px;
    display: block;
    margin: 0 auto;
    position: relative;
}

.slides * {
    user-select: none;
    -ms-user-select: none;
    -moz-user-select: none;
    -khtml-user-select: none;
    -webkit-user-select: none;
    -webkit-touch-callout: none;
}

.slides input { display: none; }

.slide-container { display: block; }

.slide {
    top: 0;
    opacity: 0;
    width: 760px;
    height: 378px;
    display: block;
    position: absolute;

    transform: scale(0);

    transition: all .7s ease-in-out;
}

.slide img {
    width: 100%;
    height: 100%;
}

.nav label {
    width: 200px;
    height: 100%;
    display: none;
    position: absolute;

    opacity: 0;
    z-index: 9;
    cursor: pointer;

    transition: opacity .2s;

    color: #FFF;
    font-size: 156pt;
    text-align: center;
    line-height: 380px;
    font-family: "Varela Round", sans-serif;
    background-color: rgba(255, 255, 255, .3);
    text-shadow: 0px 0px 15px rgb(119, 119, 119);
}

.slide:hover + .nav label { opacity: 0.5; }

.nav label:hover { opacity: 1; }

.nav .next { right: 0; }

input:checked + .slide-container  .slide {
    opacity: 1;

    transform: scale(1);

    transition: opacity 1s ease-in-out;
}

input:checked + .slide-container .nav label { display: block; }

.nav-dots {
  width: 100%;
  bottom: 9px;
  height: 11px;
  display: block;
  position: absolute;
  text-align: center;
}

.nav-dots .nav-dot {
  top: 35px;
  width: 11px;
  height: 11px;
  margin: 0 4px;
  position: relative;
  border-radius: 100%;
  display: inline-block;
  background-color: rgba(0, 0, 0, 0.6);
}

.nav-dots .nav-dot:hover {
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.8);
}

input#img-1:checked ~ .nav-dots label#img-dot-1,
input#img-2:checked ~ .nav-dots label#img-dot-2,
input#img-3:checked ~ .nav-dots label#img-dot-3,
input#img-4:checked ~ .nav-dots label#img-dot-4,
input#img-5:checked ~ .nav-dots label#img-dot-5,
input#img-6:checked ~ .nav-dots label#img-dot-6 {
  background: rgba(0, 0, 0, 0.8);
}
.event-division span:hover{
	color: orange;
	cursor: pointer;
	
}
.event-division span:focus{
	color: orange;
	cursor: pointer;
	
}
.origin {
	overflow:hidden;
	text-overflow: ellipsis;
}
.origin > a {
	color: #52665B;
}
.origin > a:hover {
	color: #27375C;
	font-weight: bold;
	text-decoration: underline;
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


<!-- ### -->

    <!-- ### -->

<div style="height: 80px;"></div>

<%--  //////// --%>
<ul class="slides">
    <input type="radio" name="radio-btn" id="img-1" checked />
    <li class="slide-container">
    <div class="slide">
    <a href="../board/event_detail.do?gebno=19">
      <img src="../board/image/ad1.png" />
      </a>
        </div>
    <div class="nav">
      <label for="img-6" class="prev">&#x2039;</label>
      <label for="img-2" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide">
            <a href="../board/event_detail.do?gebno=17">
          <img src="../board/image/ad2.png" />
          </a>
        </div>
    <div class="nav">
      <label for="img-1" class="prev">&#x2039;</label>
      <label for="img-3" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide">
            <a href="../board/event_detail.do?gebno=3">
          <img src="../board/image/ad3.png" />
          </a>
        </div>
    <div class="nav">
      <label for="img-2" class="prev">&#x2039;</label>
      <label for="img-4" class="next">&#x203a;</label>
    </div>
    </li>
    
   <input type="radio" name="radio-btn" id="img-4" />
    <li class="slide-container">
        <div class="slide">
          <img src="../board/image/ad4.png" />
        </div>
    <div class="nav">
      <label for="img-3" class="prev">&#x2039;</label>
      <label for="img-5" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-5" />
    <li class="slide-container">
        <div class="slide">
          <img src="../board/image/ad5.png" />
        </div>
    <div class="nav">
      <label for="img-4" class="prev">&#x2039;</label>
      <label for="img-6" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-6" />
    <li class="slide-container">
        <div class="slide">
          <img src="../board/image/ad6.png" />
        </div>
    <div class="nav">
      <label for="img-5" class="prev">&#x2039;</label>
      <label for="img-1" class="next">&#x203a;</label>
    </div>
    </li>

    <li class="nav-dots">
      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
      <label for="img-4" class="nav-dot" id="img-dot-4"></label>
      <label for="img-5" class="nav-dot" id="img-dot-5"></label>
      <label for="img-6" class="nav-dot" id="img-dot-6"></label>
    </li>
</ul>
<%--  //////// --%>

<div style="height: 50px;"></div>
<div class="text-center" style="text-align: center; font-size: 26px;">이벤트</div>
<div style="height: 10px;"></div>
<div class="text-center event-division" style="text-align: center; margin-left: 45px;">
		    <span class="cate" style="margin-right: 40px; font-size: 16px;"><a href="../board/event_list.do" class="on">전체보기</a></span>&nbsp;&nbsp; | &nbsp;&nbsp;
		    <span class="cate" style="font-size: 16px;" data-name="진행중">진행중인 이벤트</span>&nbsp;&nbsp; | &nbsp;&nbsp;
		    <span class="cate" style="margin-left: 40px; font-size: 16px;" data-name="종료">종료된 이벤트</span>
	    </div>
<!-- 게시판 start -->
  <div style="height: auto;">

	<!-- 이벤트 리스트 start -->
	<div id="ca">
<div class="wrapper row3">
  <main class="container clear">

  <div style="height: 30px;"></div>
  
  <div class="row g-3 justify-content-center">
  	<c:forEach var="vo" items="${list }" begin="1" end="9" step="1">
  		<div class="col-lg-4 col-md-6">
  		<div class="inner">
  			<div class="course-item bg-white">
  				<div class="position-relative overflow-hidden">
  				<a href="../board/event_detail.do?gebno=${vo.gebno }"><img class="img-fluid-2" src="${vo.poster }"style="width: 100%;height: 100%"></a>
  				</div>
  				<div class="text-left py-3 px-2">
  				<span class="frame"></span>
  				<span class="tit_event origin" style="color: black;"><a href="../board/event_detail.do?gebno=${vo.gebno }" style="color: gray;">${vo.subject }</a></span>
  				<div class="box_info">
             <p class="info">
             <span class="tit_info">${vo.event_date }</span>
             </p>
             <p class="info">
             <span class="tit_info">${vo.progress_status }</span>
             </p>
             </div>
             </div>
  			</div>
  			</div>
  			
  		</div>
  	</c:forEach>
  </div>

	<!-- 이벤트 리스트 end --> 

  </div>
  
  <div style="height: 50px;"></div>
  			<ul id="page_ul" >
		    	<c:if test="${startPage>1 }">
		          <li class="page_li"><a href="../board/event_list.do?page=${startPage-1 }" class="page_a${i==curpage?" li_active":"" }""" style="font-size: 10px; width: 20px">◀</a></li>
		        </c:if>
		        <c:forEach var="i" begin="${startPage }" end="${endPage }">
		          <li class="page_li" ${i==curpage?"class=active":"" }><a href="../board/event_list.do?page=${i }" class="page_a${i==curpage?" li_active":"" }""">${i }</a></li>          
		        </c:forEach>    
		        <c:if test="${endPage<totalpage }">
		          <li class="page_li"><a href="../board/event_list.do?page=${endPage+1 }" class="page_a${i==curpage?" li_active":"" }""" style="font-size: 10px; width: 20px">▶</a></li>
		        </c:if>
		    </ul>
   <nav class="pagination">

        <!-- 검색바 start -->
        <div class="board_search">
        <div class="container">
		<div class="row">
			<form method="post" name="search" action="searchbbs.jsp" pos>
				<table class="pull-right">
					<tr>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="ss" value="${ss }" maxlength="100"></td>
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