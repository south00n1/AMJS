<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../member/css/login.css?after" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
    players:['iframe'],
    overlayOpacity: 0.5
})

	$(function(){
		let key = getCookie("key");
	    $("#log_id").val(key); 
	     
	    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	    if($("#log_id").val() != ""){ 
	        $("#cbx").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#cbx").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#cbx").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#log_id").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#log_id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#cbx").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#log_id").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	   
	function setCookie(cookieName, value, exdays) {
		let exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		let cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	// 쿠키 삭제
	function deleteCookie(cookieName) {
		let expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}
	 
	// 쿠키 가져오기
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		let cookieData = document.cookie;
		let start = cookieData.indexOf(cookieName);
		let cookieValue = '';
		if (start != -1) { // 쿠키가 존재하면
			start += cookieName.length;
			let end = cookieData.indexOf(';', start);
			if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
				end = cookieData.length;
	            console.log("end위치  : " + end);
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
   

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
	
    
	// 아이디찾기
	$('#idfind').css('cursor','pointer');
	$('#idfind').click(function(){
		 Shadowbox.open({
	            content:'../member/idfind.do',
	            player:'iframe',
	            width:350,
	            height:300
	        })
	})
	
	// 비밀번호찾기
	$('#pwdfind').css('cursor','pointer');
	$('#pwdfind').click(function(){
		 Shadowbox.open({
	            content:'../member/pwdfind.do',
	            player:'iframe',
	            width:350,
	            height:330 
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
	      </svg></span><span>아이디 저장</span></label> <input type="button" value="로그인"
			id="logBtn">

		<div>
			<div>
				<a id="idfind">아이디 찾기</a> <a id="pwdfind">비밀번호 찾기</a>
			</div>
		</div>

		<a href="../member/join.do" title="">아직 회원이 아니신가요?</a>

	</div>

</body>

</html>