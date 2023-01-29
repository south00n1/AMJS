<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.faq_card{
	position: relative;
	margin: 0 10px;
	text-align: center;
	width: 20%;
	float: left;
	-webkit-box-shadow: 0 0 5px rgba(0,0,0,0.4);
}
.faq_card dl{
	margin: 0 auto;
}
.faq_card dt{
	color: #FFF;
	background: #27375C;
	padding: 10px 0;
	font-size: 1em;
	text-align: center;
}
.faq_card dd{
	padding: 10px 0;
	font-size: 0.9rem;
	text-align: left;
}
.faq_card a{
	color: black;
}
.faq_top10{
	clear: both;
}
</style>
</head>
<body>
	<!-- ### -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">고객센터</h1>
<!-- faq 검색바 -->
    <div style="height: 20px"></div>
	<div>
		<h6 style="color: white">GOD 고객센터입니다. 무엇이든 검색해보세요.</h6>
		<form action="">
			<input type="search" id="search" size=30 placeholder=" 검색어 입력" style="border-radius: 20px;border: none"/>
			<button type="submit" style="border: none;background: none;color: white;"><i class="fa fa-search"></i></button>
		</form>
    </div>
    <div style="height: 10px"></div>
	<div>
		<div style="color: #27375C;font-size: 12px">
		  <span style="color: white;font-size: 13px">인기검색어</span>&nbsp;
			<span><a href="#">결제방법</a></span>&nbsp;|&nbsp;
			<span><a href="#">회원정보 확인/변경</a></span>&nbsp;|&nbsp;
			<span><a href="#">2D 전시회</a></span>&nbsp;|&nbsp;
			<span><a href="#">티켓예매 수수료</a></span>
		</div>
	</div>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->

	<div class="container" style="width: 100%">
	
<!-- faq 빠른 찾기  -->
	<div>
		<h4 class="text-primary px-3">FAQ 찾기</h4>
	    <p>분야별 faq 빠른 찾기를 이용해보세요</p>
		<div class=faq_card>
		  <dl>
		  	<dt>예매</dt>
		  	<dd>
		  	  <ul>
				<li><a href="#">예매/예매확인</a></li>
				<li><a href="#">예매변경</a></li>
				<li><a href="#">예매취소</a></li>
		  	  </ul>
		  	</dd>
		  </dl>
		</div>
		<div class=faq_card>
		  <dl>
		  	<dt>결제/영수증</dt>
		  	<dd>
		  	  <ul>
				<li><a href="#">결제정보</a></li>
				<li><a href="#">결제수단</a></li>
				<li><a href="#">영수증/세금계산서</a></li>
		  	  </ul>
		  	</dd>
		  </dl>
		</div>
		<div class=faq_card>
		  <dl>
		  	<dt>회원관리</dt>
		  	<dd>
		  	  <ul>
				<li><a href="#">회원가입/탈퇴</a></li>
				<li><a href="#">회원정보 확인/변경</a></li>
				<li><a href="#">인증문의(성인/본인)</a></li>
				<li><a href="#">휴면회원</a></li>
		  	  </ul>
		  	</dd>
		  </dl>
		</div>
		<div class=faq_card>
		  <dl>
		  	<dt>기타</dt>
		  	<dd>
		  	  <ul>
				<li><a href="#">리뷰/한줄평</a></li>
				<li><a href="#">홈페이지/시스템장애</a></li>
				<li><a href="#">기타</a></li>
		  	  </ul>
		  	</dd>
		  </dl>
		</div>
	</div>
	
<!-- faq top10 -->
	<div class="faq_top10" >
	  <div style="height: 30px"></div>
		<h4 class="text-primary px-3">자주 묻는 질문 TOP10</h4>
		<table class="table">
		  <tr>
		 	<th width=10% class="text-center">순위</th>
		 	<th width=10% class="text-center">문의유형</th>
		  	<th width=70% class="text-center">제목</th>
		  	<th width=10% class="text-center">
		  		<a href="../service/faq_list.do"><input type=button class="btn btn-sm btn-primary" value="더보기"></a>
		  	</th>
	 	  </tr>
	 	  <c:forEach var="vo" items="${flist }" varStatus="s">
			  <tr>
			   	<td width=10% class="text-center">${s.index+1 }</td>
			  	<td width=10% class="text-center">${vo.type }</td>
			  	<td width=70%>
			  	  <a href="../service/faq_detail.do?no=${vo.gfno }" style="color: black">${vo.subject }</a>
			  	  <!-- detail로 링크 연결하지 말고 화면에서 바로 아래에 출력되도록 하기 -->
			  	</td>
			  	<td width=10% class="text-center"></td>
			  </tr>
		  </c:forEach>
		</table>
	</div>
	
<!-- qna -->
	<div>
	  <div style="height: 30px"></div>
		<h4 class="text-primary px-3">나의 문의 내역</h4>
		<table class="table">
		  <tr>
		  	<th width=15% class="text-center">문의유형</th>
		   	<th width=60% class="text-center">제목</th>
		   	<th width=15% class="text-center">답변상태</th>
		   	<th width=10% class="text-center">
		   		<a href="../service/list.do"><input type=button class="btn btn-sm btn-primary" value="더보기"></a>
		   	</th>
		  </tr>
		  <c:forEach var="vo" items="${slist }">
			<c:if test="${vo.group_tab==0 }">
			  <tr>
			  	<td width=15% class="text-center">${vo.type }</td>
			  	<td width=35%>
			  	  <c:if test="${vo.group_tab>0 }">
			  	  	<c:forEach var="i" begin="0" end="${vo.group_tab }">&nbsp;&nbsp;</c:forEach>
			  	  </c:if>
			  	  <img src="">
			  	  <a href="../service/detail.do?no=${vo.gano }" style="color: black">${vo.subject }</a>
			  	</td>
			  	<td width=10% class="text-center">
			  	  <c:if test="${vo.ans_state=='답변완료' }">
			  	  	<span style="color: blue">${vo.ans_state }</span>
			  	  </c:if>
			  	  <c:if test="${vo.ans_state!='답변완료' }">
			  	  	<span style="color: gray">${vo.ans_state }</span>
			  	  </c:if>
			  	</td>
			   	<td width=10% class="text-center">${vo.depth }</td>
			  </tr>
			</c:if>
		  </c:forEach>
		  <tr>
			<td colspan=4 class="text-center" style="border-color: white">
	  			<a href="../service/insert.do"><input type=button class="btn btn-sm btn-danger" value="문의 작성"></a>
			</td>
		  </tr>
		</table>
	</div>
  
<!-- 공지사항 list 일부 추가, 더보기 누르면 공지사항 페이지 연결 -->
	
	</div>
</body>
</html>