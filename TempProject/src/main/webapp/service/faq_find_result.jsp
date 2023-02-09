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
	//faq 본문 보여주기
	$('.fsub').hover(function(){
		$(this).css("cursor","pointer")
	},function(){
		$(this).css("cursor","none")
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
	
	//페이지 이동
	$('.faq_list_page').click(function(){
		let page=$(this).attr("data-no")
		let ss=$('#search').val()
		$.ajax({
			type:'post',
			url:'../service/faq_list.do',
			success:function(result){
				$.ajax({
					type:'post',
					url:'../service/faq_find.do',
					data:{"ss":ss,"page":page},
					success:function(response){
						$('#f-find').html(response)
					}
				})
			}
		})
	})
})
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
* {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
    </style>
</head>
<body>
	<c:if test="${count==0 }">
	  <table class=table style="border-color: white">
	   	  <tr>
	   		<td colspan=4>검색 결과가 없습니다</td>
	   	  </tr>
	  </table>
	</c:if>
	<c:if test="${count>0 }">
	 <div>
	  <table class=table>
		  <c:forEach var="vo" items="${list }" varStatus="s">
		  	  <tr>
		  	  	<td width=10% class="text-center">${count-s.index-(curpage-1)*10 }</td>
		  	  	<td width=17% class="text-center">${vo.type }</td>
		  	  	<td width=63% class=fsub data-no="${vo.gfno }">${vo.subject }</td>
		  	  	<td width=10% class="text-center"></td>
		  	  </tr>
		  	  <tr id="f${vo.gfno }" class="fdetail" style="display: none">
				<td colspan=2></td>
				<td>
					<pre style="white-space: pre-wrap;background-color: white;border: none;height: 200px;overflow-y: auto">${vo.content }</pre>
				</td>
				<td>
					<c:if test="${sessionScope.admin=='y' }">
	  	  				<a href="../service/faq_update.do?no=${vo.gfno }" class="btn btn-sm btn-warning">수정</a>
	  	  			</c:if>
				</td>
			  </tr>
	  	  </c:forEach>
	  </table>
	 </div>
	  		  <ul id="page_ul" style="padding-left: 0px; padding-right: 90px">
		        <c:forEach var="i" begin="${startpage }" end="${endpage }">
		          <li class="page_li"><span class="faq_list_page page_a${i==curpage?" li_active":"" }"" data-page="${i }">${i }</span></li>          
		        </c:forEach>    
		      </ul>
	</c:if>
</body>
</html>