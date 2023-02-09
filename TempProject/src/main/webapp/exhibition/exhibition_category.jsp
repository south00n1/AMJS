<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GO OUT DISPLAY</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
		$('.data_status').on("click",function(){
		    title = "";
		    var date = new Date();                // 오늘날짜
		    let yyyy = date.getFullYear();        // 년
		    let mm = date.getMonth() + 1;        // 월 0부터시작 +1해줌
		    let dd = date.getDate();            // 일
		})
	// 카테고리별 목록 출력
	   $('.exhibs').on("click",function(){
		let ec=$(this).text()
		$.ajax({
			type:'post',
			url:'../exhibition/exhibition_all.do',
			data:{"ec":ec},
			success:function(response){
				location.reload()
			}
		})
			})
		
})
</script>
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

/* 새로 수정 css */
.title{
	text-align:left;
	margin-top: 5%;
}

.head_sch_wrap {
    max-width: 300px;
}

.head_sch_wrap {
    width: 100%;
    max-width: 480px;
}

.head_sch_wrap {
    position: absolute;
    bottom: 75px;
    left: 50%;
    transform: translateX(-50%);
}
.head_sch_wrap {
    width: 300px;
    height: 50px;
    border: 3px solid #27375C;
    border-radius: 100px;
    position: relative;
    float: right;
    margin-top: 8px;
}
fieldset, legend, form, button{
	font-size: 16px;
	margin: 0;
	padding:0;
	font-weight: normal;
	color: gray;
}
fieldset{ 
    display: block;
    margin-inline-start: 2px;
    margin-inline-end: 2px;
    padding-block-start: 0.35em;
    padding-inline-start: 0.75em;
    padding-inline-end: 0.75em;
    padding-block-end: 0.625em;
    min-inline-size: min-content;
}
form{
	border:0;
	display: block;
}
.head_sch_wrap input{
	width:100%;
	padding: 0 36px 0 10px;
	box-sizing: border-box;
	border: 0;
	line-height: 34px;
	border-radius: 100px;
}
input[type='text']{
	color: #393e4d;
}
input{
	outline: none;
	font-size: 14px;
	vertical-align: middle;
}
dd{
	font-size: 16px;
	margin:0;
	padding:0;
	font-weight: normal;
	display: block;
	margin-inline-start: 40px;
}
.head_src_wrap .sch_submit{
	width: 23px;
	height: 22px;
	padding: 0;
	background-size: contain;
	background-repeat: no-repeat;
}
.sch_submit_button{
	position: absolute;
	border:0;
	box-sizing: border-box;
	cursor: pointer;
	border-radius: 3px;
	text-indent: -9999px;
	margin-left: -4px;
}

/* 진행중 버튼 css */
.date_status{
    background: #e94727;
}
.date_status {
    right: 0;
    font-size: 12px;
    line-height: 17px;
}
.date_status {
    top: 2;
    right: 16px;
    background: #e33355;
    color: #fff;
    font-size: 10px;
    border-radius: 15px;
    min-width: 38px;
    text-align: center;
    max-width: 54px;
    line-height: 19px;
    padding: 0 9px;
}
.ex_tit {
    width: 100%;
    position: relative;
    padding-right: 55px;
    box-sizing: border-box;
}

/* 검색바 css */
form{
	font-size: 10px;
	margin:0 ; padding: 0
}
.head_sch_warp input {
    width: 100%;
    padding: 0 36px 0 10px;
    box-sizing: border-box;
    border: 0;
    line-height: 34px;
    border-radius: 100px;
}
.head_sch_warp {
    width: 300px;
    height: 34px;
    border: 3px solid #27375C;
    border-radius: 100px;
    position: relative;
    float: left;
    margin-top: 8px;
}
fieldset{
	font-size: 16px;
	margon:0; padding:0;
	display:block;
	margin-inline-end: 2px;
	padding-block-start: 0.35em;
	padding-inline-start: 0.75em;
	padding-inline-end: 0.75em;
	padding-block-end: 0.625em;
	min-inline-size: min-content;
}
legend{
	font-size: 16px;
	margin:0; padding:0;
	position: absolute;
	line-height:0;
	text-indent: -9999em;
	overflow: hidden;
	padding-inline-start: 2px;
	padding-inline-end: 2px;
	border-width: initial;
	border-style: none;
	border-color: initial;
	border-image: initial;
}
form{
	display: block;
}
dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    list-style:none;
}
dd {
	margin:0; padding:0;
    display: block;
    margin-inline-start: 10px;
}
input {
    outline: none;
    margin:0;
    font-size: 14px
}

</style>
</head>
<body>
<!-- 목록 start -->
  <div class="container">
	<div class="text-center">
	  <div>
		<h2 class="title">전체 전시</h2>
		<div class="search-bar" style="margin: 0 auto; width: auto; height: 50px;position: relative;text-align: left; margin-top: 30px;">
	<form method=post action="../exhibition/exhibition_all.do" class="inline">
             <input type=text name="tt" size=25 class="input-sm" value="${tt }">
             <input type=submit value="검색">
    </form>
    			<caption align="top">
    	  			<h5>
	    	  		  	<span class="btn btn-sm btn-primary exhibs">육아</span>
	    	  		  	<span class="btn btn-sm btn-primary exhibs">스포츠</span>
	    	  		  	<span class="btn btn-sm btn-primary exhibs">인테리어</span>
	    	  		  	<span class="btn btn-sm btn-primary exhibs">예술</span>
	    	  		  	<span class="btn btn-sm btn-primary exhibs">전기</span>
	    	  		  	<span class="btn btn-sm btn-primary exhibs">기계</span>
	    	  		  	<span class="btn btn-sm btn-primary exhibs">농축산</span>
    	  			</h5>
    	  		</caption>
    </div>
	  </div>
	  <div>	
	  <!-- 검색바 
	   <form method=post action="../exhibition/exhibition_all.do" class="inline">
             <input type=text name="tt" size=25 class="input-sm" value="${tt }">
             <input type=submit value="검색">
       </form>
       <div class="search-bar" style="margin: 0 auto; width: auto; height: 50px;position: relative;text-align: center;margin: 20px;">
	<form method=post action="../exhibition/exhibition_all.do" class="inline">
             <input type=text name="tt" size=25 class="input-sm" value="${tt }">
             <input type=submit value="검색">
    </form>
    </div>
        -->
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
							  <div class="ex_tit">
								<div class="mb-0" style="text-align: left; font-weight: bold; font-size: 1rem">${vo.title }</div>
							  </div>
								  <div class="mt-2">
								    <div class="mt-0" style="font-size: 0.8rem; height: auto; text-align: left;">${vo.loc }</div>
									<div class="mt-1" style="text-align: left; font-size: 0.8rem">${vo.period }</div>
									<!-- <span>${today1 }:${vo.startday }:${vo.endday }</span> -->
									<div class="date_status">
									<c:choose>
									 <c:when test="${(today1>=vo.startday && today1<=vo.endday) || today1<=vo.startday }">
									  진행중
									 </c:when>
									 <c:otherwise>
									  종료
									 </c:otherwise>
									 </c:choose>
									</div>
									
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
          <li><a href="../exhibition/exhibition_category.do?page=${startPage-1 }&eno=${eee}">&lt;</a></li>
        </c:if>
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
          <li ${i==curpage?"class=active":"" }><a href="../exhibition/exhibition_category.do?page=${i }&eno=${eee}">${i }</a></li>          
        </c:forEach>    
        <c:if test="${endPage<totalpage }">
          <li><a href="../exhibition/exhibition_category.do?page=${endPage+1 }&eno=${eee}">&gt;</a></li>
        </c:if>
    </ul>
</body>
</html>