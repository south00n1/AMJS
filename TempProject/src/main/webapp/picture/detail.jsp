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
let u=0;
$(function(){
	$('.ups').click(function(){
		$('.rupdate').hide();
		let rno=$(this).attr("data-no");
		if(u==0)
		{
			$(this).text("취소");
			$('#u'+rno).show();
			u=1;
		}
		else
		{
			$(this).text("수정");
			$('#u'+rno).hide();
			u=0;
		}
	})
	
	/*
	$('.pic_jjim').click(function(){
		let gpno = $(this).attr("data-gpno")
		$.ajax({
			type:'post',
			url:'../jjim/jjim_insert.do',
			data:{"gpno":gpno},
			success:function(response){
				
			}
		})
	})*/
})
</script>
<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
}
div.pic_detail_container {
	width: 1300px;
	height: 100%;
	margin: 50px auto;
}
.pic_detail_cont_form {
	width: 100%;
	height: 600px;
	display: flex;
	flex-direction: row;
}
div.pic_detail_cont1 {
    width: 600px;
    height: 600px;
    margin-bottom: 10px;
}
div.pic_detail_cont2 {
    width: 630px;
    height: 600px;
    margin-left: 50px;
    padding-right: 20px;
    overflow: auto  
}
div.pic_detail_cont2::-webkit-scrollbar {
    width: 8px;  /* 스크롤바의 너비 */
}

div.pic_detail_cont2::-webkit-scrollbar-thumb {
    height: 90%; /* 스크롤바의 길이 */
    background: #27375C; /* 스크롤바의 색상 */
    border-radius: 10px;
}

div.pic_detail_cont2::-webkit-scrollbar-track {
    background: rgba(33, 122, 244, .1);  /*스크롤바 뒷 배경 색상*/
}
div.pic_detail_small_menu {
	width: 100%;
	height: 110px;
	display: flex;
	flex-direction: row;
}
div.pic_detail_small {
	width: 600px;
	height: 100px;
	padding-top: 10px;
}
div.pic_detail_menu {
    width: 630px;
    height: 100px;
    text-align: right;
    padding-top: 20px;
    margin-left: 50px;
    padding-right: 20px;
}
div.pic_detail_reply {
    width: 100%;
    padding-top: 15px;
}
input[type=button] {
	width: 70px;
	height: 40px;
	color: #27375C;
	background-color: white;
	border-radius: 5px;
	font-weight: bold;
	transition: 0.3s;
	border:none;
	border: 1px solid #27375C;
}

input[type=button]:hover {
	color: white;
	background-color: #27375C;
}
.jjim {
	width: 70px;
	height: 40px;
	color: #27375C;
	background-color: white;
	border-radius: 5px;
	font-weight: bold;
	transition: 0.3s;
	border: 1px solid #27375C;
}
.jjim:hover {
	color: white;
	background-color: #27375C;
}
</style>
</head>
<body>
	<div class="pic_detail_container">
		
		<div class="pic_detail_cont_form">
		<div class="pic_detail_cont1">
			<img src="${vo.image }" style="width: 600px; height: 600px;">
		</div>
		<div class="pic_detail_cont2">
			<table class="table">
				<tr>
					<th colspan="2"><h2>${vo.title }</h2></th>
				</tr>
				<tr>
					<th width=20%>작가</th>
					<td width=80%>${vo.name }</td>
				</tr>
				<tr>
					<th width=20%>작품정보</th>
					<td width=80%>${vo.info }</td>
				</tr>
				<tr>
					<th width=20%>작품코드</th>
					<td width=80%>${vo.code }</td>
				</tr>
				<tr>
					<th width=20%>추천이유</th>
					<td width=80%>${vo.content2  }</td>
				</tr>
				<tr>
					<th width=20%>큐레이터 노트</th>
					<td width=80%>${vo.content }</td>
				</tr>
			</table>
		</div>
		</div>
		<div class="pic_detail_small_menu">
		<div class="pic_detail_small">
			<c:forTokens items="${vo.image2 }" delims="^" var="image" begin="1" end="5">
				<img src="${image }" style="display: inline-block; width: 100px; height: 100px;">
			</c:forTokens>
		</div>
		<div class="pic_detail_menu">
			<c:if test="${sessionScope.id!=null }">
				<c:if test="${jjim_count == 0 }">
					<a href="../jjim/jjim_insert.do?gpno=${vo.gpno }" class="btn btn-xs" style="background-color: #27375C; color: #fff; border-radius: 5px;">찜하기</a>
				</c:if>
				<c:if test="${jjim_count != 0 }">
					<span href="../jjim/jjim_insert.do?gpno=${vo.gpno }" class="btn btn-xs" style="background-color: gray; color: #fff; border-radius: 5px;">찜하기</span>
				</c:if>
			</c:if>
				<a href="../picture/list.do" class="btn btn-xs" style="background-color: #27375C; color: #fff; border-radius: 5px;">목록</a>
		</div>
		</div>
		
		<div class="pic_detail_reply" style="padding-top: 30px; display: block;">
			<c:if test="${count==0 }">
				<table class="table">
				   <tr>
				      <td class="text-center">댓글이 없습니다</td>
				   </tr>
				</table>
			</c:if>
			<c:if test="${count>=0 }">
				<table class="table">
			    	<tr>
			    		<td>
			    		<c:forEach var="rvo" items="${rList }">
			    			
							<div style="display: flex; flex-direction:row; justify-content: space-between; border-bottom: 0.5px solid lightgray; align-items:center; padding-bottom: 5px;">
								<div>
									<span style="color:orange">${rvo.name }</span>&nbsp;(${rvo.dbday })
			   					</div>
			   					<c:if test="${sessionScope.id!=null }">
			                 		<c:if test="${sessionScope.id==rvo.id }">
			                 			<div>
			                   				<span class="btn btn-sm btn-danger ups" data-no="${rvo.rno }" style="border-radius: 5px">수정</span>
			                   				<a href="../all_reply/all_reply_delete.do?rno=${rvo.rno }&no=${vo.gpno}&cate_no=1" class="btn btn-sm btn-primary" style="border-radius: 5px">삭제</a>
			                 			</div>
			                 		</c:if>
			               		</c:if>
			               	</div>
			           		<table class="table">
			           			<tr>
			             			<td colspan="2"><pre style="white-space:pre-wrap;background-color: white;border:none ">${rvo.msg }</pre></td>
			           			</tr>
			           			<tr id="u${rvo.rno }" class="rupdate" style="display:none">
			               			<form method="post" action="../all_reply/all_reply_update.do">
			             			<td width="92%">
						         		<input type=hidden name="no" value="${vo.gpno }">
						         		<input type=hidden name="rno" value="${rvo.rno }">
						         		<input type=hidden name="cate_no" value="1">
						         		<textarea rows="3" name="msg" style="width:100%">${rvo.msg}</textarea>&nbsp;
			             			</td>
			             			<td width="8%">
						         		<input type=submit value="수정" class="btn btn-sm btn-danger" style="width: 100%; height:78px">
			             			</td>
					        		</form>
			            		</tr>
			         		</table>
			       		</c:forEach>
			      		</td>
			     	</tr>
				</table>
			</c:if>
			<table class="table">
		    	<c:if test="${sessionScope.id!=null }">
				<table class="table">
					<tr>
						<form method="post" action="../all_reply/all_reply_insert.do">
						<td width= 92%>
							<input type=hidden name="no" value="${vo.gpno }">
							<input type=hidden name="cate_no" value="1">
							<textarea rows="3" name="msg" style="width: 100%" ></textarea>&nbsp;
			       		</td>
			       		<td width=8%>
							<input type=submit value="댓글쓰기" class="btn btn-sm btn-danger" style="width: 100%; height:78px">
			       		</td>
						</form>
			    	</tr>
			    </table>
				</c:if>
			</table>
		</div>
		<div style="height: 80px"></div>
		  <h4>최근 본 그림</h4>
	      <div class="inline" style="margin-top: 5px;">
		      <c:forEach var="cvo" items="${cList }" varStatus="s">
		      	<c:if test ="${s.index<9 }">
		      		<a href="../picture/before_detail.do?gpno=${cvo.gpno }"><img src="${cvo.image }" style="width:100px; height:100px"></a>
		      	</c:if>
		      </c:forEach>
	      </div>
	</div> <!-- pic_detail_container END -->

</body>
</html>