<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let f=0
$(function(){
	//검색 결과
	$('#sBtn').click(function(){
		let ss=$('#search').val()
		if(ss.trim()==""){
			$('#search').focus()
			return
		}
		location.href="../service/search.do"
	})
	
	//인기검색어 클릭 이벤트
	$('#s-pop span:nth-child(n+2)').hover(function(){
		$(this).css("cursor","pointer")
	})
	let key=$('#s-pop span').text()
//고장고장 고쳐야대
	$('#s-pop span:nth-child(n+2)').click(function(){
		location.href="../service/faq_list.do?key="+key
	})
}
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
			<input type=text id=search size=30 placeholder="검색어를 입력하세요" style="border-radius: 20px;border: none"/>
			<button type=submit id=sBtn style="border: none;background: none;color: white;"><i class="fa fa-search"></i></button>
    </div>
    <div style="height: 10px"></div>
	<div id=s-pop style="color: white;font-size: 13px">
		<span style="font-size: 14px">인기검색어</span>&nbsp;
		<span>결제방법</span>&nbsp;|&nbsp;
		<span>회원정보변경</span>&nbsp;|&nbsp;
		<span>2D전시회</span>&nbsp;|&nbsp;
		<span>예매수수료</span>
	</div>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->
</body>
</html>