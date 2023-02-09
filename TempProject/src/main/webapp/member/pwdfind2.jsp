<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<style type="text/css">
body{
  font-family: 'Open Sans', sans-serif;
  background:white;
  margin: 0 auto 0 auto;
  width:100%; 
  text-align:center;
  margin: 40px 0px 0px 0px;
  font-size:14px;
}

p{
  font-size:12px;
  text-decoration: none;
  color:#ffffff;
}

h1{
  font-size:1.5em;
  color:#525252;
}

.box{
  background:white;
  width:300px;
  border-radius:6px;
  margin: 0 auto 0 auto;
  padding:0px ;
  border: none; 
}

.email{
  background:#ecf0f1;
  border: #ccc 1px solid;
  border-bottom: #ccc 2px solid;
  padding: 8px;
  width:250px;
  color:#AAAAAA;
  margin-top:10px;
  font-size:1em;
  border-radius:4px;
}

.password{
  border-radius:4px;
  background:#ecf0f1;
  border: #ccc 1px solid;
  padding: 8px;
  width:250px;
  font-size:1em;
}

.btn{
  background:#27375C;
  width:250px;
  padding-top:5px;
  padding-bottom:5px;
  color:white;
  border-radius:4px;
  border: #27375C 1px solid;
  
  margin-top:15px;
  margin-bottom:20px;
  margin-left: 25px;
  float:left;
  font-weight:800;
  font-size:0.8em;
}

.btn:hover{
  background:#27375C;
  opacity: 0.8;
}
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
	$('#submit').click(function(){
		let id = $('#id').val();
		let pwd = $('#pwd').val();
		let answer = $('#answer').val();
		if(answer.trim() == "") {
			$('#answer').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../member/pwfind2_result.do',
			data:{"id":id, "answer":answer},
			success: function(result) {
				let res = result.trim();
				if (res == "") {
					$('#pwd-find-result').html('<font color=red>질문과 정답이 일치하지 않습니다.</font>');
					$('#ok-btn').show()
				} else {
					$('#pwd-find-result').html('<font color=blue>비밀번호는 ' + res + '입니다</font>');
					$('#ok-btn').show()
				}
			}
		})
	})
})

</script>
</head>
<body>

<div class="box">
<h1>질문 답변</h1>
<input type=hidden id="id" value="${id }">
<input type=hidden id="pwd" value="${pwd }">
<input type="text" id="name" class="email" value="${question }"/>
<input type="text" id="answer" placeholder="정답 입력해주세요" class="email" />
 
<br>
<a href="#" id=submit><div class="btn">제출</div></a> <!-- End Btn -->
<span id="pwd-find-result"></span>

</div>
  
</body>
</html>