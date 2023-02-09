<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	//검색바
	$('#search').click(function(){
		$(this).val("")
	})
	$('#sBtn').click(function(){
		let ss=$('#search').val()
		if(ss.trim()==""){
			$('#search').focus()
			return
		}
		$('#ss_frm').submit()
	})
	
	//인기검색어 클릭 이벤트
	$('#s-pop span:nth-child(n+2)').hover(function(){
		$(this).css("cursor","pointer")
	})
	$('#s-pop span:nth-child(n+2)').click(function(){
		let ss=$(this).text()
		$('#search').val(ss)
		$('#ss_frm').submit()
	})
}
</script>
<style type="text/css">
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
.thebogy{
    font-family: 'GmarketSansMedium';
}
* {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
</head>
<body>
	<!-- ### -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white">고객센터</h1>
<!-- faq 검색바, 인기검색어 -->
    <div style="height: 20px"></div>
	<div>
		<h5 style="color: white">GOD 고객센터입니다. 무엇이든 검색해보세요.</h5>
    	<div style="height: 10px"></div>
		  <form method=post action="../service/faq_list.do" id=ss_frm>
			<input type=text id="search" name=ss value="${ss }" size=30 placeholder="검색어를 입력하세요" style="border-radius: 20px;border: none"/>
			<button type=button id="sBtn" style="border: none;background: none;color: white;"><i class="fa fa-search"></i></button>
		  </form>
    </div>
    <div style="height: 10px"></div>
	<div id=s-pop style="color: white;font-size: 13px">
		<span style="font-size: 14px">인기검색어</span>&nbsp;
		<span>결제수단</span>&nbsp;|&nbsp;
		<span>회원정보</span>&nbsp;|&nbsp;
		<span>리뷰</span>&nbsp;|&nbsp;
		<span>예매수수료</span>
	</div>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->
    
	<div class="container" style="width:960px;font-size: 14px">
		<a href="../service/faq_list.do" class="btn btn-sm btn-primary thebogy">FAQ 목록</a>
	  	<c:if test="${sessionScope.id!=null }">
	  		<span style="float: right">
			    <a href="../service/insert.do" style="padding: 7px 7px 3px 7px;border: 1px solid gray;font-family: GmarketSansMedium" class="btn btn-sm writerbtn thebogy">
				  	<i class="fa-solid fa-pen fa-lg"></i>&nbsp;글쓰기
				</a>
			</span>
	  	</c:if>
	  <div style="height: 20px"></div>
	  <div style="height: 450px">
	  	<table class="table">
	  	  <tr>
	  	  	<th width=5% class="text-center">번호</th>
	  	  	<th width=15% class="text-center">문의유형</th>
	  	  	<th width=35% class="text-center">제목</th>
	  	  	<th width=10% class="text-center">이름</th>
	  	  	<th width=15% class="text-center">작성일</th>
	  	  	<th width=10% class="text-center">답변상태</th>
	  	  	<th width=10% class="text-center">첨부파일</th>
	  	  </tr>
	  	  <c:forEach var="vo" items="${list }" varStatus="s">
	  	    <c:if test="${vo.id==sessionScope.id || vo.id=='admin' }">
		  	  <tr>
		  	  	<td width=5% class="text-center">${count-s.index }</td>
		  	  	<td width=15% class="text-center">${vo.type }</td>
		  	  	<td width=35%>
		  	  	  <c:if test="${vo.group_tab>0 }">
		  	  	  	<c:forEach var="i" begin="0" end="${vo.group_tab }">&nbsp;&nbsp;</c:forEach>
		  	  	  	<img src="../service/image/letter.png" style="width: 20px;height: 20px">
		  	  	  </c:if>
		  	  	  <a href="../service/detail.do?no=${vo.gano }" style="color: #52565b">${vo.subject }</a>
		  	  	  <c:if test="${vo.dbday==today }">
		          	<img src="../service/image/new_red.png" style="width: 20px">
		          </c:if>
		  	  	</td>
		  	  	<td width=10% class="text-center">
		  	  		<c:if test="${vo.id!='admin' }">${sessionScope.name }</c:if>
		  	  		<c:if test="${vo.id=='admin' }">관리자</c:if>
		  	  	</td>
		  	  	<td width=15% class="text-center">${vo.dbday }</td>
		  	  	<td width=10% class="text-center">
		  	  	 <c:if test="${vo.id!='admin' }">
		  	  	  <c:if test="${vo.ans_state=='답변완료' }">
		  	  	  	<span style="color: blue">${vo.ans_state }</span>
		  	  	  </c:if>
		  	  	  <c:if test="${vo.ans_state!='답변완료' }">
		  	  	  	<span style="color: gray">${vo.ans_state }</span>
		  	  	  </c:if>
		  	  	 </c:if>
		  	  	</td>
		  	  	<td width=10% class="text-center" id=l-file>
		  	  	  <c:if test="${vo.filesize>0 }">
		  	  	   <a href="../service/download.do?fn=${vo.filename }">
		  	  	  	<img src="../service/image/folder.png" style="width: 20px;height: 20px">
		  	  	   </a>
		  	  	  </c:if>
		  	  	</td>
		  	  </tr>
	  	    </c:if>
	  	  </c:forEach>
	  	</table>
	  </div>
	  	  <ul id="page_ul" style="padding-left: 0px; padding-right: 90px">
		      <c:forEach var="i" begin="${startpage }" end="${endpage }">
		          <li class="page_li"><a href="../service/list.do?page=${i }" class="page_a${i==curpage?" li_active":"" }"" data-page="${i }">${i }</a></li>          
		      </c:forEach>    
		  </ul>
	</div>
</body>
</html>