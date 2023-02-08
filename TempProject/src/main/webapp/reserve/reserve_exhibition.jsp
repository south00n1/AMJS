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
	//전시 선택 효과
	$('.trs').hover(function(){
		$(this).css("cursor","pointer")
	},function(){
		$(this).css('cursor',"none")
	})
	$('.trs').click(function(){
		$('.trs').css("background-color","white")
		$(this).css("background-color","lightblue")
		
		//선택된 데이터 전송
		let geno=$(this).attr("data-no")
		$.ajax({
			type:'post',
			url:'../reserve/reserve_main.do',
			data:{"geno":geno},
			success:function(result){
				$.ajax({
					type:'post',
					url:'../reserve/reserve_date.do',
					data:{"geno":geno},
					success:function(response){
						$('#select_date').html(response)
					}
				})
				$.ajax({
					type:'post',
					url:'../reserve/reserve_list.do',
					data:{"geno":geno},
					success:function(response){
						$('#select_list').html(response)
					}
				})
				$('#select_time').html("")
				$('#select_pers').html("")
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
    </style>
</head>
<body>
  <table class="table">
   <tr>
     <th class="text-center"></th>
     <th class="text-center">전시명</th>
     <th class="text-center">전시기간</th>
   </tr>
   <c:forEach var="vo" items="${list }">
     <tr class="trs" data-no="${vo.geno }">
      <td class="text-center">
        <img src="${vo.poster }" style="width: 30px;height: 30px">
      </td>
      <td>${vo.title }</td>
      <td>${vo.period }</td>
     </tr>
   </c:forEach>
  </table>
</body>
</html>