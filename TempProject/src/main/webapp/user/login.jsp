<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="../user/css/login.css" rel="stylesheet">
</head>

<body>
   
	<div class="main-form">
	  <h1>GOD</h1>
	  <input type="text" placeholder="Username" value="">
	  <input type="password" placeholder="Password" value="">
	  <input class="inp-cbx" id="cbx" type="checkbox" style="display: none"/>
	  <label class="cbx" for="cbx"><span>
	      <svg width="12px" height="10px" viewbox="0 0 12 10">
	        <polyline points="1.5 6 4.5 9 10.5 1"></polyline>
	      </svg></span><span>로그인 상태 유지</span></label>
	  <input type="submit" value="로그인">
	  
	  <div>
	    <div>
	      <a href="#" title="" >아이디 찾기</a>
	      <a href="#" title="">비밀번호 찾기</a>
	    </div>
	  </div>
	  
	  <a href="../user/join.do" title="">아직 회원이 아니신가요?</a>
	  
	</div>

</body>

</html>