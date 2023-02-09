<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">

  <div style="height: 30px;"></div>
  
  <div class="row g-3 justify-content-center">
  	<c:forEach var="vo" items="${list }" begin="1" end="9" step="1">
  		<div class="col-lg-4 col-md-6">
  		<div class="inner">
  			<div class="course-item bg-white">
  				<div class="position-relative overflow-hidden">
  				<a href="../board/event_detail.do?gebno=${vo.gebno }"><img class="img-fluid-2" src="${vo.poster }"style="width: 100%;height: 100%"></a>
  				</div>
  				<div class="text-left py-3 px-2">
  				<span class="frame"></span>
  				<span class="tit_event">${vo.subject }</span>
  				<div class="box_info">
             <p class="info">
             <span class="tit_info">${vo.event_date }</span>
             </p>
             <p class="info">
             <span class="tit_info">${vo.progress_status }</span>
             </p>
             </div>
             </div>
  			</div>
  			</div>
  			
  		</div>
  	</c:forEach>
  </div>

	<!-- 이벤트 리스트 end --> 

  </div>
  
  <div style="height: 50px;"></div>
    			<ul id="page_ul" >
		    	<c:if test="${startPage>1 }">
		          <li class="page_li"><a href="../board/event_list.do?page=${startPage-1 }" class="page_a${i==curpage?" li_active":"" }""" style="font-size: 10px; width: 20px">◀</a></li>
		        </c:if>
		        <c:forEach var="i" begin="${startPage }" end="${endPage }">
		          <li class="page_li" ${i==curpage?"class=active":"" }><a href="../board/event_list.do?page=${i }" class="page_a${i==curpage?" li_active":"" }""">${i }</a></li>          
		        </c:forEach>    
		        <c:if test="${endPage<totalpage }">
		          <li class="page_li"><a href="../board/event_list.do?page=${endPage+1 }" class="page_a${i==curpage?" li_active":"" }""" style="font-size: 10px; width: 20px">▶</a></li>
		        </c:if>
		    </ul>
   <nav class="pagination">

        <!-- 검색바 start -->
        <div class="board_search">
        <div class="container">
		<div class="row">
			<form method="post" name="search" action="searchbbs.jsp" pos>
				<table class="pull-right">
					<tr>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="ss" value="${ss }" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	</div>
        <!-- 검색바 end -->
      </nav>
  </main>
</div>
</body>
</html>