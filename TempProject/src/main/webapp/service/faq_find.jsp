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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let f=0
$(function(){
	$('#sBtn').click(function(){
		let ss=$('#search').val()
		if(ss.trim()==""){
			$('#search').focus()
			return
		}
		$.ajax({
			type:'post',
			url:'../service/faq_find_result.do',
			data:{"ss":ss},
			success:function(result){
				$('.f-find tbody').html(result)
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
		$('#ss_frm').submit()
	})
	
///////////////////////////////////////post 또는 include할 때
	$('.fsub').hover(function(){
		$(this).css("cursor","pointer")
	})
	$('.fsub').click(function(){
		let no=$(this).attr("data-no")
		if(f===0){
			$('#f'+no).show()
			f=1
		}else{
			$('#f'+no).hide()
			f=0
		}
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
                    <h1 class="display-3 text-white animated slideInDown">고객센터</h1>
<!-- faq 검색바, 인기검색어 -->
    <div style="height: 20px"></div>
	<div>
		<h6 style="color: white">GOD 고객센터입니다. 무엇이든 검색해보세요.</h6>
		  <form method=post action="../service/faq_find.do" id=ss_frm>
			<input type=text id=search name=ss size=30 placeholder="검색어를 입력하세요" style="border-radius: 20px;border: none"/>
			<button type=submit id=sBtn style="border: none;background: none;color: white;"><i class="fa fa-search"></i></button>
		  </form>
    </div>
    <div style="height: 10px"></div>
	<div id=s-pop style="color: white;font-size: 13px">
		<span style="font-size: 14px">인기검색어</span>&nbsp;
		<span>결제방법</span>&nbsp;|&nbsp;
		<span>회원정보</span>&nbsp;|&nbsp;
		<span>2D전시회</span>&nbsp;|&nbsp;
		<span>예매수수료</span>
	</div>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->
    
	<div class="container" style="width:800px">
	    <table>
		  <tr>
		  	<td style="border-color: white">
	  		  <c:if test="${sessionScope.admin=='n' }">
		  		<a href="../service/insert.do" class="btn btn-sm btn-danger">문의 작성</a>
	  		  </c:if>
		  		<a href="../service/faq_list.do" class="btn btn-sm btn-primary">FAQ 목록</a>
		  	</td>
		  </tr>
		</table>
	  <div style="height: 20px"></div>
	  	<table class="table f-find">
	  	 <thead>
	  	  <tr>
	  	  	<th width=10% class="text-center">번호</th>
	  	  	<th width=15% class="text-center">문의유형</th>
	  	  	<th width=65% class="text-center">제목</th>
	  	  	<th width=10% class="text-center">조회수</th>
	  	  </tr>
	  	 </thead>
	  	 <tbody>
	  	   <c:if test="${count==0 }">
	  	   	  <tr>
	  	   		<td colspan=4>검색 결과가 없습니다</td>
	  	   	  </tr>
	  	   </c:if>
			<c:forEach var="vo" items="${flist }" varStatus="s">
		  	  <tr>
		  	  	<td width=10% class="text-center">${count-s.index }</td>
		  	  	<td width=15% class="text-center">${vo.type }</td>
		  	  	<td width=65% class=fsub data-no="${vo.gfno }">${vo.subject }</td>
		  	  	<td width=10% class="text-center">${vo.hit }</td>
		  	  </tr>
		  	  <tr id="f${vo.gfno }" class="fdetail" style="display: none">
				<td colspan=2></td>
				<td>
					<pre style="white-space: pre-wrap;background-color: white;border: none">${vo.content }</pre>
				</td>
			  </tr>
	  	  	</c:forEach>
	  	 </tbody>
	  	</table>
	  	<c:if test="${type==0 }">
		  	<table class="table" style="border-color: white">
		  	  <tr>
		  	  	<td class="text-center">
		  	  		<a href="../service/faq_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
		  	  		${curpage } page / ${totalpage } pages
		  	  		<a href="../service/faq_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
		  	  	</td>
		  	  </tr>
		  	</table>
	  	</c:if>
	</div>
</body>
</html>