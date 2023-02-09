<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GO OUT DISPLAY</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#updateBtn').on('click',function(){
		let name=$('#name').val();
		if(name.trim()==="")
		{
			$('#name').focus()
			return
		}
		let subject=$('#subject').val();
		if(subject.trim()==="")
		{
			$('#subject').focus()
			return
		}
		let display_name=$('#display_name').val();
		if(display_name.trim()==="")
		{
			$('#display_name').focus()
			return
		}
		let content=$('#content').val();
		if(content.trim()==="")
		{
			$('#content').focus()
			return
		}
		let pwd=$('#pwd').val();
		if(pwd.trim()==="")
		{
			$('#pwd').focus()
			return
		}
		let no=$('#no').val();
		let queryString=$('#update_frm').serialize();//form태그에 입력된 모든 데이터를 한번에 읽어서 전송 
		//alert(queryString)
		$.ajax({
			type:'post',
			url:'../board/review_update_ok.do',
			data:queryString,
			success:function(result)
			{
				let res=result.trim();
				if(res==='no')
				{
					// 비밀번호가 틀릴 경우
					alert("비밀번호가 틀립니다!!\n다시 입력하세요")
					$('#pwd').val("")
					$('#pwd').focus()
				}
				else
				{
					// 비밀번호가 맞는 경우
					location.href="../board/review_detail.do?no="+no
				}
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
textarea {
	resize: none;
}
    </style>
</head>
<body>


<!-- 게시판 글 작성 start -->
<div class="wrapper row3">
  <main class="container clear">
  <h2 class="sectiontitle" style="float: left;">글 수정하기</h2>
  <div style="height: 5px"></div>
  <form id="update_frm">
  <table class="table">
  <tr>
        <td colspan="2" class="text-center">
        <input type=submit value="등록" class="btn btn-sm" id="updateBtn" style="background-color: #27375C; color: #fff; border-radius: 5px;opacity:0.6;float: right;">
      </td>
  </tr>
    <tr>
      <th width=15% class="text-right">이름</th>
      <td width=80%>
        <input type=text name=name size=20 class="input-sm" value="${vo.name }" id="name">
        <input type=hidden name=no value="${vo.no }" id="no">
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">글제목</th>
      <td width=80%>
        <input type=text name=subject size=60 class="input-sm" id="subject" value="${vo.subject }">
      </td>
    </tr>
        <tr>
      <th width=15% class="text-right">관람전시</th>
      <td width=80%>
        <input type=text name=display_name size=60 class="input-sm" id="display_name" value="${vo.display_name }">
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">내용</th>
      <td width=80%>
        <textarea rows="20" cols="90" name="content" id="content">${vo.content }</textarea>
      </td>
    </tr>
    <tr>
      <th width=15% class="text-right">비밀번호</th>
      <td width=80%>
        <input type=password name=pwd size=15 class="input-sm" id="pwd">
      </td>
    </tr>
    <tr>
      <td colspan="2" class="text-center">
        <input type=submit value="등록" class="btn btn-sm" id="updateBtn" style="background-color: #27375C; color: #fff; border-radius: 5px;opacity:0.6;">
        <input type=button value="취소" class="btn btn-sm" style="background-color: #dc143c; color: #fff; border-radius: 5px;opacity:0.6;" onclick="javascript:history.back()">
      </td>
    </tr>
  </table>
  </form>
  </main>
</div>

<!-- 게시판 글 작성 end -->

    


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