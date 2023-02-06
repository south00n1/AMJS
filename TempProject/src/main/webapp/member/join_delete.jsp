<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../member/css/login.css?after" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#join_delBtn2').click(function(){
		let pwd = $('#del-pwd').val();
		if(pwd.trim() === "") {
			$('#del-pwd').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../mypage/join_delete_ok.do',
			data:{"pwd": pwd},
			success:function(response){
				let res = response.trim();
				if(res === "no") {
					$('#result').text("비밀번호가 일치하지 않습니다")
					$('#del-pwd').val("");
					$('#del-pwd').focus();
				} else {
					alert("회원 탈퇴되었습니다!")
		            location.href="../main/main.do";
				}
			}
		})
	})
	
	$('#cancleBtn').click(function(){
		$.ajax({
			type:'post',
			success:function(result) {
	            location.href="../mypage/mypage_main.do";
			}
		})
	})
})
</script>
</head>
<body>
	<div class="main-form">
		<h1>회원 탈퇴</h1>
		<div style="height: 15px"></div>
		<input type="password" placeholder="비밀번호를 입력해주세요" id="del-pwd">
		<div style="height: 10px"></div>
		<span style="color: red" id="result"></span>
		<div style="height: 20px"></div>
		<input type="button" value="탈퇴하기" id="join_delBtn2" style="width:49%; display: inline-block;">
		<input type="button" value="취소" id="cancleBtn" style="width:49%; display: inline-block;">

		<div style="height: 30px"></div>

	</div>
</body>
</html>