<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../member/css/login.css?after" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// 로그인 버튼 
	$('#logBtn').click(function(){
		// id,pwd => Model로 전송 
		let id=$('#log_id').val();
		if(id.trim()==="")
		{
			$('#log_id').focus();
			return
		}
		let pwd=$('#log_pwd').val();
		if(pwd.trim()==="")
		{
			$('#log_pwd').focus();
			return
		}
		
		$.ajax({
			type:'post',
			url:'../member/login_ok.do',
			data:{"id":id,"pwd":pwd},
			success:function(result)
			{
				// NOID , NOPWD , OK
				let res=result.trim();
				if(res==='NOID')
				{
					alert("아이디가 존재하지 않습니다!!")
					$('#log_id').val("");
					$('#log_pwd').val("");
					$('#log_id').focus()
				}
				else if(res==='NOPWD')
				{
					alert("비밀번호가 틀립니다!!")
					$('#log_pwd').val("")
					$('#log_pwd').focus()
				}
				else
				{
					location.href="../main/main.do";
				}
			}
		})
		
	})
	
})
</script>
</head>

<body>

	<div class="main-form">
		<h1>GOD</h1>
		<input type="text" placeholder="Username" id="log_id"> <input
			type="password" placeholder="Password" id="log_pwd"> <input
			class="inp-cbx" id="cbx" type="checkbox" style="display: none" /> <label
			class="cbx" for="cbx"><span> <svg width="12px"
					height="10px" viewbox="0 0 12 10">
	        <polyline points="1.5 6 4.5 9 10.5 1"></polyline>
	      </svg></span><span>로그인 상태 유지</span></label> <input type="button" value="로그인"
			id="logBtn">

		<div>
			<div>
				<a href="#" title="">아이디 찾기</a> <a href="#" title="">비밀번호 찾기</a>
			</div>
		</div>

		<a href="../member/join.do" title="">아직 회원이 아니신가요?</a>

	</div>

</body>

</html>