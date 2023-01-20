<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.gallery { 
    -webkit-column-count: 3;
    -moz-column-count: 3;
    column-count: 3;
    -webkit-column-gap: 10px;
    -moz-column-gap: 10px;
    column-gap: 10px;
    margin-top: 10px;
    overflow: hidden;
}
.gallery img { 
    width: 100%; 
    height: auto;
    transition: 500ms;
    margin-bottom: 10px;
    opacity: 0.8;
    page-break-inside: avoid; /* For Firefox. */
    -webkit-column-break-inside: avoid; /* For Chrome & friends. */
    break-inside: avoid; /* For standard browsers like IE. :-) */
}


.gallery img:hover {
    opacity: 1;
}

/* .modal {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: center;
} */

.modal-img,.model-vid{
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  display: table
}
.modal-body{
  padding: 0px;
}

.modal-dialog {
  height: 100%;
      position: relative;
    margin: auto;
    display: flex;
    align-items: center;
    justify-content: center;
}

.modal-content {
  border: none;
}

@media screen and (max-width: 767px) {
	.gallery { 
        -webkit-column-count: 2;
        -moz-column-count: 2;
        column-count: 2;
    }
	.gallery div { margin: 0; 
        width: 200px;
    }
  .modal-dialog {
        margin: 0 8vw;
    }
}

@media screen and (max-width: 479px) {
    .gallery { 
        -webkit-column-count: 1;
        -moz-column-count: 1;
        column-count: 1;
    }
    .gallery div { 
        margin: 0; 
        width: 200px;
    }
}
h2 {
	margin-top: 45px;
}

p {
	font-size: 12px;
	color: gray;
	padding-left: 10px;
}
b {
	font-size: 16px;
	color: gray;
}
div.pic {
	border: 0.5px solid lightgray;
	margin-bottom: 8px;
}

/* 페이지네이션 */

ul {
	list-style: none;
	display: block;
	text-align: center;
	margin-top: 35px;
}
ul > li {
  	display: inline-block;
}

li a {
    transition: all 100ms ease-in-out 0s;
    background-color: #F7F7F8;
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

li a:hover {
    background-color: #27375C;
    color: #FFFFFF;
}
li.active a {
    background-color: #27375C;
    color: #FFFFFF;
}
li.active a:hover {
    color: #FFFFFF;
}

::marker {
	content: "";
}

</style>
</head>
<body>
	
		  
			
		  
<div class="container">
 <h2 >미술관</h2>
 <hr>
	<div class="gallery">
	  <c:forEach var="vo" items="${list }">
	   <div class="pic">
		<img src="${vo.image }" alt="" width="50%" height="auto" class="gallery-img" />
		<p><b>${vo.title }</b>&nbsp;&nbsp;&nbsp;${vo.name }</p>
	   </div>
	  </c:forEach>
	</div> 
</div>

    <ul>
    	<c:if test="${startPage>1 }">
          <li><a href="../picture/list.do?page=${startPage-1 }">&lt;</a></li>
        </c:if>
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
          <li ${i==curpage?"class=active":"" }><a href="../picture/list.do?page=${i }">${i }</a></li>          
        </c:forEach>    
        <c:if test="${endPage<totalpage }">
          <li><a href="../picture/list.do?page=${endPage+1 }">&gt;</a></li>
        </c:if>
    </ul>

</body>

</html>