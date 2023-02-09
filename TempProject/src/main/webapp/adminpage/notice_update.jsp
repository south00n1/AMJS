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
</head>
<body>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.update_Btn').click(function(){
		let params = $("#update_form").serialize();
		$.ajax({
			type:'post',
			url:'../adminpage/notice_update_ok.do',
			data:params,
			success:function(response) {
				$('.mypage_home_div').html(response)
			}
		})
	})
	
	$('.update_cancle').click(function(){
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

<!-- 게시판 start -->
<div class="wrapper row3">
  <main class="container clear">
  <h2 class="sectiontitle" style="margin-top: 10px; margin-bottom: 15px">공지사항 수정</h2>
  <div style="height: 5px"></div>
  <form id="update_form"action="">
  <table class="table">
    <tr>
      <th width=15% class="text-right">구분</th>
      <td width=80%>
        <select name="type" class="input-sm">
          <option value="1" ${vo.type==1?"selected":"" }>서비스소식</option>
          <option value="2" ${vo.type==2?"selected":"" }>서비스오픈</option>
          <option value="3" ${vo.type==3?"selected":"" }>서비스종료</option>
          <option value="4" ${vo.type==4?"selected":"" }>서비스점검</option>
          <option value="5" ${vo.type==5?"selected":"" }>안내</option>
        </select>
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">이름</th>
      <td width=80%>
        <input type=text name=name size=20 class="input-sm" readonly value="${vo.name } ">
        <input type=hidden name=no value="${vo.gnbno }">
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">제목</th>
      <td width=80%>
        <input type=text name=subject size=60 class="input-sm" value="${vo.subject }">
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">내용</th>
      <td width=80%>
        <textarea rows="15" cols="80" name="content">${vo.content }</textarea>
      </td>
    </tr>
    <tr>
      <td colspan="2" class="text-center">
        <span class="btn btn-sm btn update_Btn" style="background-color: green; color:white;">수정</span>
        <span class="btn btn-sm btn-danger update_cancle">취소</span>
      </td>
    </tr>
  </table>
  </form>
  </main>
</div>

</body>
</html>