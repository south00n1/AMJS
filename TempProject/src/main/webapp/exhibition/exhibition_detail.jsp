<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="p" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세보기 | GOD</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
function like_func(){
	  var frm_read = $('#frm_read');
	  var exhibitionno = $('#exhibitionno', frm_read).val();
	  //var mno = $('#mno', frm_read).val();
	  //console.log("boardno, mno : " + boardno +","+ mno);
	  
	  $.ajax({
	    url: "../like/like_insert.do",
	    type: "GET",
	    cache: false,
	    dataType: "json",
	    data: 'exhibitionno=' +exhibitionno,
	    success: function(data) {
	      var msg = '';
	      var like_img = '';
	      msg += data.msg;
	 
	    }
	  });
	}
</script>
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

/* 상세 section _ 상세정보 css */
#exhibitionView .exCon_detail .container {
    width: 100%;
    padding: 0px;
    box-sizing: border-box;
    padding-bottom: 24px;
}
#exhibitionView .exCon_detail .tab_wrap {
    display: block;
    margin: 0 auto;
}
#exhibitionView .exCon_detail #tabs {
    display: block;
    border-bottom: 4px solid #dcdcdc;
    height: auto;
    font-size: 0;
}
#tabs{
	margin: 0;
	padding: 0;
	color: #393e4d;
}
#exhibitionView .exCon_detail #tabs li.active {
    border-bottom: 4px solid #27375C;
}
#exhibitionView .exCon_detail #tabs li {
    padding: 0 25px;
}
#exhibitionView .exCon_detail #tabs li {
    display: inline-block;
    width: 20%;
    box-sizing: border-box;
    text-align: center;
    cursor: pointer;
    margin-bottom: -4px;
}
active not_comment not_support{
	font-size: 14px;
}
#exhibitionView .exCon_detail #tabs li.active .tit {
    color: #27475C;
}
#exhibitionView .exCon_detail #tabs li .tit {
    font-size: 18px;
    line-height: 59px;
    color: #27375C;
    position: relative;
    cursor: pointer;
    text-align: center;
}

/* 전시보러가기 버튼 css */
.no_outline_btn{
	width: 420px;
	height: 50px;
	background-color: #004fff;
	color: white;
	box-shadow: 0 4px 16px;
	border-radius: 50px;
	border: none;
	position: relative;
	margin: 50px;
	
}
.content_wrap{
	position: relative;
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
     		<th width=20% style="color:gray">관람시간</th>
     		<td width=80%>${vo.time }</td>
     	</tr>
     	<tr>
     		<th width=20% style="color:gray">해쉬태그</th>
     		<td width=80%>${vo.hashtag }</td>
     	</tr>
     	<tr>
     	<td colspan="2" class="text-right">
     	 <c:if test="${sessionScope.id!=null }">
     	   <c:if test="${like_count==0 }">
     	    <a href="../like/like_insert.do?geno=${vo.geno }" class="btn btn-xs" style="background-color: #F55066; color: #fff; border-radius: 5px;">좋아요(${like_total })</a>
     	 </c:if>
     	 <c:if test="${like_count!=0 }">
     	    <span href="../like/like_insert.do?geno=${vo.geno }" class="btn btn-xs" style="background-color: gray; color: #fff; border-radius: 5px;">좋아요(${like_total })</span>
     	 </c:if>
     	    <a href="../reserve/reserve_main.do" class="btn btn-xs" style="background-color: #20C156; color: #fff; border-radius: 5px;">예매하기</a>
     	 </c:if>
     	    <a href="javascript:history.back()" class="btn btn-xs btn-primary" style="border-radius: 5px;">목록</a>
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
         <span class="tit" style="text-align: center">상세정보 및 전시장안내</span>
        </li>
      </ul> 
     </div>
     <div class="content_wrap">
       <div class="content show" id="tab_1_content">
         <div class="tab_con_edit1">
          <div style="text-align: center;" align="center">
            <a href="${vo.url }"><button class="no_outline_btn">전시 자세히 보러가기</button></a>
          </div>
         </div>
       </div>
     </div>
     </div>
 </section>
</div>
</body>
</html>