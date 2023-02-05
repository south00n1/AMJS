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
let f=0
$(function(){
	//첫화면
	let ss=$('#search').val()
	$.ajax({
		type:'post',
		url:'../service/faq_find.do',
		data:{"ss":ss},
		success:function(response){
			$('#f-find').html(response)
		}
	})

	//검색 ajax
	$('#search').click(function(){
		$(this).val("")
	})
	$('#sBtn').click(function(){
		let ss=$('#search').val()
		if(ss.trim()==""){
			$('#search').focus()
			return
		}
		$.ajax({
			type:'post',
			url:'../service/faq_find.do',
			data:{"ss":ss},
			success:function(response){
				$('#f-find').html(response)
			}
		})
	})
	
	//인기검색어 클릭 이벤트
	$('#s-pop span:nth-child(n+2)').hover(function(){
		$(this).css("cursor","pointer")
	})
	$('#s-pop span:nth-child(n+2)').click(function(){
		let ss=$(this).text()
		$('#search').val(ss)
		$.ajax({
			type:'post',
			url:'../service/faq_find.do',
			data:{"ss":ss},
			success:function(response){
				$('#f-find').html(response)
			}
		})
	})
	
	//FAQ 타입 선택 이벤트
	$('#ftype').change(function(){
		$('#search').val("")
		let type=$(this).val()
		$.ajax({
			type:'post',
			url:'../service/faq_type.do',
			data:{"type":type},
			success:function(response){
				$('#f-find').html(response)
			}
		})
	})
	
	//전체보기
	$('#falist').click(function(){
		$('#search').val("")
		$.ajax({
			type:'post',
			url:'../service/faq_find.do',
			success:function(response){
				$('#f-find').html(response)
			}
		})
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
		<h5 style="color: white">GOD 고객센터입니다. 무엇이든 검색해보세요.</h5>
    	<div style="height: 10px"></div>
		  <form id=ss_frm>
			<input type=text id="search" name=ss value="${ss }" size=30 placeholder="검색어를 입력하세요" style="border-radius: 20px;border: none"/>
			<button type="button" id="sBtn" style="border: none;background: none;color: white;"><i class="fa fa-search"></i></button>
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
	
	<div class="container" style="width:960px">
		<span id=falist class="btn btn-sm btn-primary">전체보기</span>
	  	<c:if test="${sessionScope.admin!='y' }">
	  	  <c:if test="${sessionScope.id==null }">
		      <span style="float: right;border: 1px solid #ccc;background: #fff;margin-right: 20px;">
				  <a href="../member/login.do" class="btn btn-sm writerbtn">
				    <i class="fa-solid fa-pen fa-lg"></i>&nbsp;글쓰기
				  </a>
			  </span>
	  	  </c:if>
	  	  <c:if test="${sessionScope.id!=null }">
		      <span style="float: right;border: 1px solid #ccc;background: #fff;margin-right: 20px;">
				  <a href="../service/insert.do" class="btn btn-sm writerbtn">
				    <i class="fa-solid fa-pen fa-lg"></i>&nbsp;글쓰기
				  </a>
			  </span>
	  	  </c:if>
	  	</c:if>
	  <div style="height: 20px"></div>
	  	<table class="table" style="margin-bottom: 0rem">
	  	  <tr>
	  	  	<th width=10% class="text-center">번호</th>
	  	  	<th width=15% class="text-center">
	  	  		<div>
			  	  <label for=ftype>문의유형</label>
					<select name=ftype id=ftype>
						<option value="0">선택</option>
						<option value="1">회원</option>
						<option value="2">예매</option>
						<option value="3">결제</option>
						<option value="4">티켓</option>
						<option value="5">기타</option>
					</select>
			  	</div>
	  	  	</th>
	  	  	<th width=65% class="text-center">제목</th>
	  	  	<th width=10% class="text-center">조회수</th>
	  	  </tr>
	  	</table>
	  	<div id="f-find">
	  	
	  	</div>
	</div>
</body>
</html>