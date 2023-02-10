<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.quick {
	position: absolute;
	width: 150px;
	height: 450px;
	right: 30px;
	padding: 10px;
	text-align: center;
	background-color: linen;
	border-color: #27375C;
	border-radius: 20px;
}
.pclist{
	padding: 10px;
	list-style: none;
}
.pclist li{
	padding-bottom: 10px;
}

.f-card{
	position: relative;
	margin: 0 10px;
	text-align: center;
	width: 20%;
	float: left;
	border-radius: 10px;
	-webkit-box-shadow: 0 0 5px rgba(0,0,0,0.4);
}
.f-card dl{
	margin: 0 auto;
}
.f-card dt{
	color: #FFF;
	background: #27375C;
	padding: 10px 0;
	font-size: 1em;
	text-align: center;
	border-top-right-radius: 10px;
	border-top-left-radius: 10px;
}
.f-card dd{
	padding: 10px 0;
	font-size: 0.9rem;
	text-align: left;
	margin-bottom: -1rem;
	height: 145px
}
#findcard{
	clear: both;
	padding-top: 15px;
}
.thebogy{
    font-family: 'GmarketSansMedium';
}
.writerbtn{
    font-family: 'GmarketSansMedium';
}
* {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let f=0
$(function(){
	/*
	//퀵메뉴
	var currentPosition = parseInt($(".quick").css("top"));  
	$(window).scroll(function() {  
	    var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.  
	    $(".quick").stop().animate({"top":position+currentPosition+"px"},500);  
	});
	*/
	
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
	
	//빠른찾기 클릭 이벤트
	$('.f-card li').hover(function(){
		$(this).css({"cursor":"pointer","Opacity":"0.7"})
	},function(){
		$(this).css("Opacity","1.0")
	})
	$('.f-card li').click(function(){
		let ss=$(this).text()
		$.ajax({
			type:'post',
			url:'../service/faq_card.do',
			data:{"ss":ss},
			success:function(response){
				$('#findcard').html(response)
			}
		})
	})
	
	//f10 본문 보여주기
	$('.fsub').hover(function(){
		$(this).css("cursor","pointer")
	})
	$('.fsub').click(function(){
		$('.fdetail').hide()
		let no=$(this).attr("data-no")
		if(f===0){
			$('#f'+no).show()
			f=1
		}else{
			$('#f'+no).hide()
			f=0
		}
	})
	
	//qna 호버
	$('.qsub').hover(function(){
		$(this).css("cursor","pointer")
	})
})
</script>
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
		<h5 style="color: white">ㅇㅁㅈㅅ 고객센터입니다. 무엇이든 검색해보세요.</h5>
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

<%--
<!-- 퀵메뉴 -->
	<div class=quick>
	  <b>최근 본 전시</b>
	  <ul class="pclist">
	    <c:forEach var="pc" items="${pList }" varStatus="s">
	     <c:if test="${s.index<5 }">
	  	  <li><a href="../picture/before_detail.do?gpno=${pc.gpno }"><img src="${pc.image }" style="width: 100px;height: 100px"></a></li>
	     </c:if>
	    </c:forEach>
	  </ul>
	  <a href="../reserve/reserve_main.do">전시예매</a>
	</div>
<!-- 퀵메뉴끝 -->
 --%>
	
	<div class="container" style="width: 100%;font-size: 14px">
<!-- faq 빠른 찾기  -->
	<div>
		<h4 class="text-primary px-3">FAQ 찾기</h4>
	    <p>분야별 faq 빠른 찾기를 이용해보세요</p>
		<div class=f-card>
		  <dl>
		  	<dt>예매</dt>
		  	<dd>
		  	  <ul>
				<li>예매방법</li>
				<li>예매확인</li>
				<li>예매변경</li>
				<li>예매취소</li>
		  	  </ul>
		  	</dd>
		  </dl>
		</div>
		<div class=f-card>
		  <dl>
		  	<dt>결제/영수증</dt>
		  	<dd>
		  	  <ul>
				<li>결제정보</li>
				<li>결제수단</li>
				<li>현금영수증</li>
				<li>세금계산서</li>
		  	  </ul>
		  	</dd>
		  </dl>
		</div>
		<div class=f-card>
		  <dl>
		  	<dt>회원관리</dt>
		  	<dd>
		  	  <ul>
				<li>회원가입</li>
				<li>회원탈퇴</li>
				<li>회원정보변경</li>
				<li>본인인증</li>
				<li>휴면회원</li>
		  	  </ul>
		  	</dd>
		  </dl>
		</div>
		<div class=f-card>
		  <dl>
		  	<dt>기타</dt>
		  	<dd>
		  	  <ul>
				<li>리뷰</li>
				<li>한줄평</li>
				<li>시스템장애</li>
		  	  </ul>
		  	</dd>
		  </dl>
		</div>
	</div>
	<div id="findcard">
	
	</div>
	
<!-- faq top10 -->
	<div>
	  <div style="height: 30px"></div>
		<h4 class="text-primary px-3">자주 묻는 질문 TOP10</h4>
		<table class="table">
		  <thead>
			  <tr>
			 	<th width=10% class="text-center">순위</th>
			 	<th width=10% class="text-center">문의유형</th>
			  	<th width=70% class="text-center">제목</th>
			  	<th width=10% class="text-center">
			  		<a href="../service/faq_list.do"><input type=button class="btn btn-sm btn-primary thebogy" value="더보기"></a>
			  	</th>
		 	  </tr>
	 	  </thead>
	 	  <tbody>
	 	    <c:forEach var="vo" items="${flist }" varStatus="s">
			  <tr>
			   	<td width=10% class="text-center">${s.index+1 }</td>
			  	<td width=10% class="text-center">${vo.type }</td>
			  	<td colspan=2 class=fsub data-no="${vo.gfno }">${vo.subject }</td>
			  </tr>
			  <tr id="f${vo.gfno }" class="fdetail" style="display: none">
				<td colspan=2></td>
				<td colspan=2>
					<pre style="white-space: pre-wrap;background-color: white;border: none">${vo.content }</pre>
				</td>
			  </tr>
		    </c:forEach>
	 	  </tbody>
		</table>
	</div>
	
<!-- qna -->
  <c:if test="${sessionScope.admin!='y' }">
	<div>
	  <div style="height: 30px"></div>
		<h4 class="text-primary px-3">나의 문의 내역</h4>
	  <c:if test="${sessionScope.id==null }">
	  	<p>로그인 후 이용 가능합니다</p>
	  </c:if>
	  <c:if test="${sessionScope.id!=null }">
		<table class="table">
		  <tr>
		  	<th width=10% class="text-center">번호</th>
		  	<th width=10% class="text-center">문의유형</th>
		   	<th width=60% class="text-center">제목</th>
		   	<th width=13% class="text-center">답변상태</th>
		   	<th width=7% class="text-center">
		   		<a href="../service/list.do"><input type=button class="btn btn-sm btn-primary thebogy" value="더보기"></a>
		   	</th>
		  </tr>
		  <c:forEach var="vo" items="${slist }" varStatus="s">
			  <tr>
			  	<td width=10% class="text-center">${count-s.index }</td>
			  	<td width=10% class="text-center">${vo.type }</td>
			  	<td width=60% class=qsub>
			  		<a href="../service/detail.do?no=${vo.gano }" style="color: #52565b">${vo.subject }</a>
			  	</td>
			  	<td width=13% class="text-center">
			  	  <c:if test="${vo.ans_state=='답변완료' }">
			  	  	<span style="color: blue">${vo.ans_state }</span>
			  	  </c:if>
			  	  <c:if test="${vo.ans_state!='답변완료' }">
			  	  	<span style="color: gray">${vo.ans_state }</span>
			  	  </c:if>
			  	</td>
		   		<td width=7% class="text-center"></td>
			  </tr>
		  </c:forEach>
		</table>
		<div style="height: 20px; display: inline-block;">
			<a href="../service/insert.do" style="position: absolute;left: 50%;transform: translateX(-50%);padding: 7px 7px 3px 7px;border: 1px solid gray" class="btn btn-sm writerbtn thebogy">
			  <i class="fa-solid fa-pen fa-lg"></i>&nbsp;글쓰기
			</a>
		</div>
	  </c:if>
	</div>
  </c:if>
  
	</div>
</body>
</html>