<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
body{
  font-family: 'Open Sans', sans-serif;
  background:white;
  margin: 0 auto 0 auto;
  width:100%; 
  text-align:center;
  margin: 70px 0px 0px 0px;
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
  width:450px;
  border-radius:6px;
  margin: 0 auto 0 auto;
  padding:0px 0px 50px 0px;
  border: none;
  text-align: center;
}

.post{
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
  
  margin-top:10px;
  margin-bottom:20px;
  font-weight:800;
  font-size:0.8em;
}

.btn:hover{
  color: white;
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
   $('#postfindBtn').click(function(){
      let dong = $('#dong').val();
      if(dong.trim() === "") {
         $('#dong').focus()
         return
      }
      
      $.ajax({
         type: 'post',
         url: '../member/postfind_result.do', 
         data: {"dong": dong}, 
         success: function(result){ 
            $('#print').html(result) 
         }
      })
   })
})
</script>
</head>
<body>
	<div class="box">
		<h1><b>우편번호 검색</b></h1>
		<div style="height: 14.07px"></div>
		<input type="text" name="dong" id="dong" placeholder="지역을 입력해주세요" class="post"/>
		<br>
		<a href="#" id=postfindBtn><div class="btn">검색</div></a> <!-- End Btn -->
		<div style="margin-top:5px;">
		<span id="print"></span>
		</div>
	</div>
</body>
</html>