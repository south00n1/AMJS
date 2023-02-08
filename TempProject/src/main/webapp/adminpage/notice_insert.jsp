<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
* {
	font-family: 'GmarketSansMedium';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.insert_Btn').click(function(){
		let params = $("#insert_form").serialize();
		$.ajax({
			type:'post',
			url:'../adminpage/notice_insert_ok.do',
			data:params,
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('.insert_cancle').click(function(){
		$.ajax({
			type:'post',
			url:'../adminpage/notice_list.do',
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
})
</script>
</head>
<body>

<!-- 게시판 start -->
<div class="wrapper row3">
  <main class="container clear">
  <h2 class="sectiontitle" style="margin-top: 10px; margin-bottom: 15px">공지사항 등록</h2>
  <div style="height: 5px"></div>
  <form id="insert_form">
  <table class="table">
    <tr>
      <th width=15% class="text-right">구분</th>
      <td width=80%>
        <select name="type" class="input-sm">
          <option value="1">서비스소식</option>
          <option value="2">서비스오픈</option>
          <option value="3">서비스종료</option>
          <option value="4">서비스점검</option>
          <option value="5">안내</option>
        </select>
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">이름</th>
      <td width=80%>
        <input type=text name=name size=20 class="input-sm" readonly value="${sessionScope.id }">
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">제목</th>
      <td width=80%>
        <input type=text name=subject size=60 class="input-sm">
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">내용</th>
      <td width=80%>
        <textarea rows="15" cols="80" name="content"></textarea>
      </td>
    </tr>
    <tr>
      <td colspan="2" class="text-center">
        <span class="btn btn-sm btn insert_Btn" style="background-color: green; color:white;">글쓰기</span>
        <span class="btn btn-sm btn-danger insert_cancle">취소</span>
      </td>
    </tr>
  </table>
  </form>
  </main>
</div>

<!-- 게시판 end -->
</body>
</html>