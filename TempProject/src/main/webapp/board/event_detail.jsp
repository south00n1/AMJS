<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GO OUT DISPLAY</title>
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

<!-- 게시판 글 상세2 start -->
<div class="wrapper row3">
  <main class="container clear">
  

  <div style="height: 120px;"></div>
      <div>
  <h2>Event</h2>
  <h6>이벤트</h6>
    <div style="height: 5px"></div>
  
  </div>
  <div style="height: 20px"></div>
    			<div style="width: 100%;height: 30px;display: flex;flex-direction: row;justify-content: space-between;">
	  	  		<div style="height: 20px">
		  	  		<span>
				    	<a href="../board/event_detail.do?gebno=${vo.gebno-1 }" style="padding: 7px 7px 3px 7px;border: 1px solid gray;font-family: GmarketSansMedium" class="btn btn-sm writerbtn thebogy">이전글</a>
					</span>
	  	  		</div>
	  	  		<div style="height: 20px">
		  	  		<span>
				    	<a href="../board/event_detail.do?gebno=${vo.gebno+1 }" style="padding: 7px 7px 3px 7px;border: 1px solid gray;font-family: GmarketSansMedium" class="btn btn-sm writerbtn thebogy">다음글</a>
					</span>
	  	  		</div>
		  	</div>
<hr>
  <div style="height: auto">
  <table class="table">
    <tr>
      <th width=10% class="text-center">${vo.gebno }</th>
      <th width=75% class="text-center" style="	font-size:20px;font-weight: 400;" colspan="2">${vo.subject }</th>
      <th width=15% class="text-center">기간 : ${vo.event_date }</th>
    </tr>
       <tr>
      <td class="text-center" valign="top" colspan="4" height="auto">
		<div style="height: 30px;"></div>
      <img src="${vo.content_poster }">
      <div style="height: 20px;"></div>
      <pre style="white-space: pre-wrap;background-color: white;border: none;font-size: 15px;padding-top: 30px;padding-bottom: 30px;;">${vo.content }
      </pre>
      </td>      
      </tr>
  </table>
  <div style="height: 30px;"></div>
  	<div class="btn_customer">
	<span class="btn btn-lg btn_list"><a href="../board/event_list.do" class="btlcu">목록</a></span>
	<span class="btn btn-lg btn_list" style="background-color: orange;color: white;"><a href="../board/review_list.do" class="btlcu" style="">응모하기</a></span>
	</div>


  </div>
  </main>
  </div>

<!-- 게시판 글 상세2 end -->
    


     <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../lib/wow/wow.min.js"></script>
    <script src="../lib/easing/easing.min.js"></script>
    <script src="../lib/waypoints/waypoints.min.js"></script>
    <script src="../lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../js/main.js"></script>
</body>
</html>