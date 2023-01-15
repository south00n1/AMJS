<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../user/css/join.css" rel="stylesheet">
</head>
<body>
    <div class="container">
	  <div class="top">
	    <h1>회원정보 입력</h1>
	  </div>
	  
	  <div class="info_member">  
	  <div>
	    <p>아이디</p>
	    <div>
	    <input type="text" name="" value="" placeholder="예)gooutdisply12" required>
	    <button type="submit" name="button">중복확인</button>
	  	</div>
	  </div>
	  <div>
	    <p>비밀번호</p>
	    <input type="password" name="" value="" placeholder="비밀번호를 입력해주세요" required>
	  </div>
	  <div>
	    <p>비밀번호 재확인</p>
	    <input type="password" name="" value="" placeholder="비밀번호를 한번 더 입력해주세요" required>
	  </div>
	  <div>
	    <p>이름</p>
	    <input type="text" name="" value="" placeholder="이름을 입력해주세요" required>
	  </div>
	  <div>
	    <p>생년월일</p>
	    <div>
	    <input type="text" size="4" maxlength="4" placeholder="YYYY" required>
        <span>/</span>
        <input type="text" size="2" maxlength="2"  placeholder="MM" required>
        <span>/</span>
        <input type="text" size="2" maxlength="2"  placeholder="DD" required>
        </div>
	  </div>
	  <div>
	    <p>성별</p>
	    <div>
	    <lable for="smallradio">
	    <input type="radio" name="sex" value="남자" class="smallradio" checked="checked">남자
	    </lable>
	    <lable for="smallradio">
	    <input type="radio" name="sex" value="여자" class="smallradio">여자
	    </lable>
	    </div>
	  </div>
	  <div>
	    <p>이메일</p>
	    <input type="text" name="email" value="" placeholder="예)gooutdisplay@naver.com">
	  </div>
	  <div>
	    <p>우편번호</p>
	    <input type="text" name="post" value="" placeholder="" required>
	  </div>
	  <div>
	    <p>주소</p>
	    <input type="text" name="addr1" value="" placeholder="" required>
	  </div>
	  <div>
	    <p>상세주소</p>
	    <input type="text" name="addr2" value="" placeholder="">
	  </div>
	  <div>
	    <p>휴대전화</p>
	    <div>
	    <input type="text" name="addr2" value="" placeholder="숫자만 입력해주세요" required>
	    <button type="submit" name="button">인증번호 받기</button>
	  	</div>
	  </div>
	  <div>
	  <button type="submit" name="button">가입하기</button>
	  </div>
    </div>
   </div>
  
  
</body>
</html>