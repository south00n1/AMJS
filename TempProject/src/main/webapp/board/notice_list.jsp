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
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

</script>
        <style type="text/css">
    * {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.mypage_home_title {
	margin: 0px;
	margin-bottom: 10px;
	padding-bottom: 15px;
	border-bottom: 2px solid #E2E2E2;
}
.mypage_home_content {
	margin: 0px;
}
.mypage_home_subtitle {
	color: #27375C;
}
.rst {
	width:70px;
	hiegh:30px;
	color: #fff;
	border-radius: 5px;
	font-size: 15px;
	padding: 5px 7px;;
}
.origin {
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}
.origin > a {
	color: #52665B;
}
.origin > a:hover {
	color: #27375C;
}
.origin:hover {
	color: #27375C;
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

.notice-table { 
  text-transform:uppercase; }
.notice-table:after {
  display:block;
  content: '';
  border-bottom: solid 3px black;  
  transform: scaleX(0);  
  transition: transform 250ms ease-in-out;
}
.notice-table:hover:after { transform: scaleX(1); }
.notice-table:after{  transform-origin:  0% 50%; }





    </style>
</head>
<body>

<!-- ### -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown" style="font-family: GmarketSansMedium">공지사항</h1>
                    
	<div>
		<h5 style="color: white;font-family: GmarketSansMedium">서비스와 관련된 모든 공지사항을 전달해드립니다.</h5>
    	<div style="height: 10px"></div>
		  <form method=post action="../board/notice_list.do" id=ss_frm>
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

<!-- 게시판 start -->

<div class="wrapper row3">
 <main class="container clear">


  
  <div style="height: 5px"></div>
  <hr>
  <div style="height: 20px"></div>
  
  <!--  
  <div>
  	<table class="pull-right">
	<tr>
	<td><select name="notice_type" id="notice_type">
			<option value="0">전체</option>
			<option value="1">서비스소식</option>
			<option value="2">서비스오픈</option>
			<option value="3">서비스종료</option>
			<option value="4">서비스점검</option>
			<option value="5">안내</option>
	</select></td>
	</tr>
	</table>
  </div>
  -->
  <div style="height: 10px;"></div>
  
  <div class="notice_find" style="height: auto;">
  <table class="table">
    <tr>
      <th width=10% class="text-center">NO.</th>
      <th width=20% class="text-center">분류</th>
      <th width=45% class="text-center">제목</th>
      <th width=15% class="text-center">등록일</th>
      <th width=10% class="text-center">조회</th>
    </tr>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td width="10%" height="50px" style="vertical-align: middle;" class="text-center notice-table">${vo.gnbno}</td><%-- vo.getNo() = {} getXxx() --%>
        <td width="20%" height="50px" style="vertical-align: middle;" class="text-center notice-table">${vo.prefix}</td>
        <td width="45%" height="50px" style="vertical-align: middle;" class="notice-table" >
         <a href="../board/notice_detail.do?gnbno=${vo.gnbno }" style="color: black;">${vo.subject}</a>&nbsp;
         <c:if test="${vo.dbday==today }">
           <sup><img src="../board/image/new.gif"></sup>
         </c:if>
        </td>
        <td width="15%" height="50px" style="vertical-align: middle;" class="text-center notice-table">${vo.dbday }</td>
        <td width="10%" height="50px" style="vertical-align: middle;" class="text-center notice-table">${vo.hit }</td>
      </tr>
    </c:forEach>
  </table>
  </div>
 
  			<ul id="page_ul" >
		    	<c:if test="${startPage>1 }">
		          <li class="page_li"><a href="../board/notice_list.do?page=${startPage-1 }" class="page_a${i==curpage?" li_active":"" }""" style="font-size: 10px; width: 20px">◀</a></li>
		        </c:if>
		        <c:forEach var="i" begin="${startPage }" end="${endPage }">
		          <li class="page_li" ${i==curpage?"class=active":"" }><a href="../board/notice_list.do?page=${i }" class="page_a${i==curpage?" li_active":"" }""">${i }</a></li>          
		        </c:forEach>    
		        <c:if test="${endPage<totalpage }">
		          <li class="page_li"><a href="../board/notice_list.do?page=${endPage+1 }" class="page_a${i==curpage?" li_active":"" }""" style="font-size: 10px; width: 20px">▶</a></li>
		        </c:if>
		    </ul>
        <!-- pagination start -->
   <nav class="pagination">

        <!-- pagination end -->
        <!-- 검색바 start -->
        <div class="board_search">
        <div class="container">
		<div class="row">
		 <form method="post" name="search" action="../board/notice_list.do" class="inline">
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