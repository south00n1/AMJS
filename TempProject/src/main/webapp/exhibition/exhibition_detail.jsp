<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="p" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시회 상세보기</title>
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
	width: 100%;
	height: 100%;
}
#exhibitionView .exCon{
	height: auto;
	display: block;
	padding: 80px;
}


/* 오른쪽 정보 */
.ex_title{
	font-weight: bold;
}
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
	margin: 80px;
	
}
.content_wrap{
	position: relative;
}

#map-title2{
	margin: 30px;
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
     		<td colspan="2"><h4 class="ex_title">${vo.title } <br>
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
     	    <a href="../reserve/reserve_main.do?geno=${vo.geno }" class="btn btn-xs" style="background-color: #20C156; color: #fff; border-radius: 5px;">예매하기</a>
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
            
            
            <h4 id="map-title" style="color:#27375C">전시장 안내</h4>
            <h5 id="map-title2" style="color: #27375C">${vo.loc } 위치</h5>
           <%-- 지도 --%>
       		<div id="map" style="width:90%;height:600px; left: 50%; transform: translateX(-50%)"></div>
       		  	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9965c727d3306713c47391be682e4be9&libraries=services"></script>
       		
				<script>
				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				var infowindow = new kakao.maps.InfoWindow({zIndex:1});
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places(); 
				
				// 키워드로 장소를 검색합니다
				ps.keywordSearch('${vo.loc}', placesSearchCB); 
				
				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB (data, status, pagination) {
				    	if (status === kakao.maps.services.Status.OK) {
				
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        var bounds = new kakao.maps.LatLngBounds();
				
				        for (var i=0; i<data.length; i++) {
				            displayMarker(data[i]);    
				            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				        }       
				
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				        map.setBounds(bounds);
				    } 
				}
				
				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {
				    
					    // 마커를 생성하고 지도에 표시합니다
					    var marker = new kakao.maps.Marker({
					        map: map,
					        position: new kakao.maps.LatLng(place.y, place.x) 
					    });
					
					    // 마커에 클릭이벤트를 등록합니다
					    kakao.maps.event.addListener(marker, 'click', function() {
				        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				        infowindow.setContent('<div style="padding:5px;font-size:12px;">${vo.loc}</div>');
				        infowindow.open(map, marker);
				     	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    });
				}
				</script>
		<!-- 지도 끝 -->
		<div style="height: 80px"></div>
		  <h4>최근 본 전시</h4>
		  <hr>
	      <div class="inline" style="margin-top: 5px;">
		      <c:forEach var="cvo" items="${cList }" varStatus="s">
		      	<c:if test ="${s.index<12 }">
		      		<a href="../exhibition/exhibition_before_detail.do?geno=${cvo.geno }"><img src="${cvo.poster }" style="width:100px; height:150px"></a>
		      	</c:if>
		      </c:forEach>
	      </div>
	</div> <!-- pic_detail_container END -->
          </div>
         </div>
       </div>
     </div>
     </div>
 </section>
</div>
</body>
</html>