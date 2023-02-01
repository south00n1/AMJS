<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세보기 | GOD</title>
<style type="text/css">

/* 전체 */
#exhibitionView .excon{
	height: auto;
}
section{
	display: block;
}
body{
	font-size: 16px;
	font-weight: normal;
	color: #27375C;
}

.container{
	width: 100%;
	margin: 0 auto;
}
img{
	width: 30%;
	height: 60%;
}
#exhibitionView .exCon{
	height: auto;
	display: block;
	padding: 80px;
}


/* 오른쪽 정보 */
#exhibitionView .exb_info{
	margin-left: 50px;
	width: 700px;
}
.exb_img_sns, .exb_info, .plus_con_wrap{
	float: none;
	display: inline-block;
	vertical-align: top;
}
.exb_sns_wrap{
	width: auto;
	height: 90px;
	border-radius: 5px;
	margin-top: 20px;
	box-sizing: border-box;
	display: inline-block;
}

/* 왼쪽 이미지 */
#exhibitionView .exCon .exb_img_sns{
	width: 380px;
	height: 100%;
}
#exhibitionView .exCon .exb_img_wrap{
	width: 100%;
	height: 600px;
	position: static;
	float: none;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}


	

</style>
</head>
<body>
<!-- 전시정보 -->
<div id="exhibitionView">
 <section class="exCon">
  <div class="container ex_container_top">
   <div class="exb_img_sns">
    <div class="exb_img_wrap" style="background-image:url('${vo.poster}')"></div>
      <div class="exb_sns_wrap">
       <p class="tit">홈페이지 바로가기
       <a href="${vo.url }" class="icn_home" target="_blank"><i class="fa-solid fa-house" style="color:black;"></i></a></p>
      </div>
   </div>
    <div class="exb_info">
       <table class="table">
     	<tr>
     		<td colspan="2"><h4>${vo.title } <br>
     		<span style="color:gray; font-size: 17px">${vo.title2 }</span></h4></td>
     	</tr>
     	<tr>
     		<th width=20% style="color:gray">장소</th>
     		<td width=80%>${vo.loc }</td>
     	</tr>
     	<tr>
     		<th width=20% style="color:gray">상세장소</th>
     		<td width=80%>${vo.loc2 }</td>
     	</tr>
     	<tr>
     		<th width=20% style="color:gray">전시분류</th>
     		<td width=80%>${vo.kind }</td>
     	</tr>
     	<tr>
     		<th width=20% style="color:gray">전시기간</th>
     		<td width=80%>${vo.period }</td>
     	</tr>
	    <tr>
     		<th width=20% style="color:gray">산업분야</th>
     		<td width=80%>${vo.area }</td>
     	</tr>
     	<tr>
     		<th width=20% style="color:gray">전시분야</th>
     		<td width=80%>${vo.area2 }</td>
     	</tr>
     	<tr>
     		<th width=20% style="color:gray">전시품목</th>
     		<td width=80%>${vo.item }</td>
     	</tr>
     	<tr>
     		<th width=20% style="color:gray">주최</th>
     		<td width=80%>${vo.host }</td>
     	</tr>
		<tr>
     		<th width=20% style="color:gray">홈페이지</th>
     		<td width=80%>${vo.url }</td>
     	</tr>
     	<tr>
     		<th width=20% style="color:gray">가격</th>
     		<td width=80%>${vo.price }</td>
     	</tr>
     	<tr>
     		<th width=20% style="color:gray">영업시간</th>
     		<td width=80%>${vo.time }</td>
     	</tr>
     	<tr>
     		<th width=20% style="color:gray">해쉬태그</th>
     		<td width=80%>${vo.hashtag }</td>
     	</tr>
     	<tr>
     	<td colspan="2" class="text-right">
     	  <a href="#" class="btn btn-xs btn-info">좋아요</a>
     	  <a href="#" class="btn btn-xs btn-success">찜하기</a>
     	  <a href="#" class="btn btn-xs btn-warning">예약하기</a>
     	  <a href="javascript:history.back()" class="btn btn-xs btn-primary">목록</a>
     	</td>
     	</tr>
     </table>
  </div>
 </div>
 </section>
 <!-- 전시설명 및 내용 -->
 <section class="exCon_detail">
   <div class="container">
     <div class="tab_wrap">
      <ul id="tabs" class="ex_tab_n">
        <li class="active not_comment not_support" id="tab_1">
         <span class="tit">상세정보</span>
        </li>
      </ul> 
     </div>
     <div class="content_wrap">
       <div class="content show" id="tab_1_content">
         <div class="tab_con_edit1">
          <div style="text-align: center;" align="center">
            <div style="width: 700px; height: 1000px;">${vo.content }</div>
          </div>
         </div>
       </div>
     </div>
   </div>
 </section>
</div>
</body>
</html>