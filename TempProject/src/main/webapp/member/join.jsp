<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<link href="../member/css/join.css?after" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	Shadowbox.init({
		players : [ 'iframe' ]
	})
	$(function() {
		// 아이디 중복체크
		$('#checkBtn').click(function() {
			Shadowbox.open({
				content : '../member/idcheck.do',
				player : 'iframe',
				width : 420,
				height : 320,
			})
		})

		// 우편번호 검색
		$('#post').click(function() {
			Shadowbox.open({
				content : '../member/postfind.do',
				player : 'iframe',
				width : 600,
				height : 400,
			})
		})

		// 이메일 확인
		$('#eBtn').click(function() {
			let email = $('#email').val();
			if (email.trim() === "") {
				$('#email').focus();
				return;
			}
			
			let emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	        if (!emailRegExp.test(email)) {
	        	$('#ePrint').html("<font color=red>이메일 형식이 올바르지 않습니다!</font>");
	            $('#email').val("");
	            $('#email').focus();
	            return
	        }

			$.ajax({
				type : 'post',
				url : '../member/email_check.do',
				data : {
					"email" : email
				},
				success : function(result) {
					let count = Number(result.trim());
					if (count == 0) {
						$('#ePrint').html("<font color=green>" + email + "는(은) 사용 가능한 이메일입니다</font>");
						$('#email').prop('readonly', true);
					} else {
						$('#ePrint').html("<font color=red>" + email + "는(은) 이미 사용중인 이메일입니다</font>");
						$('#email').val("");
						$('#email').focus();
					}
				}
			})
		})
		// 전화번호 검색	
		$('#tBtn').click(function() {
			let phone = $('#tel').val();
			if (phone.trim() === "") {
				$('#tel').focus();
				return;
			}
			let phoneRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
			if (!phoneRegExp.test(phone.trim())) {
				$('#tPrint').html("<font color=red>휴대폰 번호 형식이 올바르지 않습니다!<br>ex)010-XXXX-XXXX</font>");
	        	return
	        }

			$.ajax({
				type : 'post',
				url : '../member/tel_check.do',
				data : {
					"phone" : phone
				},
				success : function(result) {
					let count = Number(result.trim());
					if (count == 0) {
						$('#tPrint').html("<font color=green>" + phone + "는(은) 사용 가능한 번호입니다</font>");
						$('#tel').prop('readonly', true);
					} else {
						$('#tPrint').html("<font color=red>" + phone + "는(은) 이미 사용중인 번호입니다</font>");
						$('#tel').val("");
						$('#tel').focus();
					}
				}
			})
		})
		

		$('#joinBtn').click(function() {
			
			let id = $('#join_id').val();
			if (id.trim() === "") {
	            $('#id_result').html("<font color=red>아이디 중복을 확인해주세요.</font>");
				$('#join_id').focus();
				return;
			}

			let pwd = $('#join_pwd').val();
			if (pwd.trim() === "") {
				$('#id_result').html("");
				$('#pwd_result').html("<font color=red>비밀번호를 입력해주세요</font>");
				$('#join_pwd').focus();
				return;
			}
			
			let pwdRegExp = /^[a-zA-z0-9]{4,8}$/;
			
			if (!pwdRegExp.test(pwd.trim())) {
				$('#id_result').html("");
	            $('#pwd_result').html("<font color=red>비밀번호는 영문 대소문자와 숫자 4~8자리로 입력해야합니다!</font>");
	        	return
	        }

			let pwd1 = $('#join_pwd1').val();
			if (pwd.trim() !== pwd1.trim()) {
				$('#id_result').html("");
				$('#pwd_result').html("");
				$('#pwd1_result').html("<font color=red>비밀번호가 다릅니다 다시 입력해주세요</font>");
				$('#join_pwd1').val("");
				$('#join_pwd1').focus();
				return;
			}
			
			if (id.trim() == pwd.trim()) {
	            alert("아이디와 비밀번호는 같을 수 없습니다!");
	            $('#pwd_result').html("");
	            $('#pwd1_result').html("");
	            $('#join_pwd').val("");
	            $('#join_pwd1').val("");
				$('#join_pwd').focus();
	            return;
	        }

			let name = $('#name').val();
			if (name.trim() === "") {
				$('#pwd_result').html("");
				$('#pwd1_result').html("");
	        	$('#name_result').html("<font color=red>이름을 입력해주세요.</font>");
				$('#name').focus();
				return;
			}
			
			let nameRegExp = /^[가-힣]{2,4}$/;
	        if (!nameRegExp.test(name)) {
	        	$('#name_result').html("<font color=red>이름이 올바르지 않습니다.</font>");
				$('#name').val("");
				$('#name').focus();
	            return;
	        }

			let year = $('#year').val();
	        if (year.trim() == "") {
				$('#name_result').html("")
				$('#birthday_result').html("<font color=red>생년월일을 입력해주세요.</font>");
				$('#year').focus();
	            return;
	        }
			let yearRegExp = /^(19|20)[0-9]{2}$/;
	        if (!yearRegExp.test(year)) {
				$('#name_result').html("")
				$('#birthday_result').html("<font color=red>생년월일을 올바르게 입력해주세요.</font>");
				$('#year').val("");
				$('#year').focus();
	            return;
	        }
			let month = $('#month').val();
	        if (month.trim() == "") {
				$('#name_result').html("")
				$('#birthday_result').html("<font color=red>생년월일을 입력해주세요.</font>");
				$('#month').focus();
	            return;
	        }
	        
			let monthRegExp = /^(0[1-9]|1[0-2])$/;
	        if (!monthRegExp.test(month)) {
				$('#name_result').html("")
				$('#birthday_result').html("<font color=red>생년월일을 올바르게 입력해주세요.</font>");
				$('#month').val("");
				$('#month').focus();
	            return;
	        }
	        
			let day = $('#day').val();
	        if (day.trim() == "") {
				$('#name_result').html("")
				$('#birthday_result').html("<font color=red>생년월일을 입력해주세요.</font>");
				$('#day').focus();
	            return;
	        }
			let dayRegExp = /^(0[1-9]|[1-2][0-9]|3[0-1])$/;
	        if (!dayRegExp.test(day)) {
				$('#name_result').html("")
				$('#birthday_result').html("<font color=red>생년월일을 올바르게 입력해주세요.</font>");
				$('#day').val("");
				$('#day').focus();
	            return;
	        }
			
			let email = $('#email').val();
			if (email.trim() === "") {
				$('#birthday_result').html("");
				$('#ePrint').html("<font color=red>이메일을 입력해주세요.</font>");
				$('#email').focus();
				return;
			}
			
			let emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	        if (!emailRegExp.test(email)) {
	        	$('#ePrint').html("<font color=red>이메일 형식이 올바르지 않습니다!</font>");
	            $('#email').val("");
	            $('#email').focus();
	            return
	        }

			let post = $('#post').val();
			if (post.trim() === "") {
				$('#ePrint').html("")
				$('#post_result').html("<font color=red>우편번호를 입력해주세요.</font>");
				$('#post').focus();
				return;
			}

			let addr1 = $('#addr1').val();
			if (addr1.trim() === "") {
				alert("주소를 입력해주세요.")
				$('#addr1').focus();
				return;
			}

			let tel = $('#tel').val();
			if (tel.trim() === "") {
				$('#post_result').html("");
				$('#tPrint').html("<font color=red>전화번호를 입력해주세요.</font>");
				$('#tel').focus();
				return;
			}
			
			let telRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
			if (!telRegExp.test(tel.trim())) {
				$('#tPrint').html("<font color=red>휴대폰 번호 형식이 올바르지 않습니다!<br>ex)010-XXXX-XXXX</font>");
				$('#tel').val("");
				$('#tel').focus();
	        	return
	        }
			
			let answer = $('#answer').val();
			if(answer.trim() === "") {
				$('#answer_result').html("<font color=red>답변을 입력해주세요!</font>");
				$('#tPrint').html("");
				$('#answer').focus();
				return;
			}
			$('#join_frm').submit();
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
    </style>
</head>
<body>
	<div class="container">
		<div class="top">
			<h1>ㅇㅁㅈㅅ.</h1>
		</div>

		<form method="post" action="../member/join_ok.do" name="join_frm"
			id="join_frm">
			<div class="info_member">
				<div>
					<p>아이디</p>
					<div>
						<input type="text" name="id" id="join_id"
							placeholder="중복확인 버튼을 눌러주세요" readonly> <input
							type="button" id="checkBtn" value="중복확인">
					</div>
					<div style="text-align: left; padding-left: 5px">
						<span id="id_result" style="font-size: 12px;"></span>
					</div>
				</div>
				<div>
					<p>비밀번호</p>
					<input type="password" name="pwd" id="join_pwd"
						placeholder="비밀번호를 입력해주세요">
					<div style="text-align: left; padding-left: 5px">
					<span id="pwd_result" style="font-size: 12px;"></span>
					</div>
				</div>
				<div>
					<p>비밀번호 재확인</p>
					<input type="password" name="pwd1" id="join_pwd1"
						placeholder="비밀번호를 한번 더 입력해주세요">
					<div style="text-align: left; padding-left: 5px">
					<span id="pwd1_result" style="font-size: 12px;"></span>
					</div>
				</div>
				<div>
					<p>이름</p>
					<input type="text" name="name" id="name" placeholder="이름을 입력해주세요">
					<div style="text-align: left; padding-left: 5px">
					<span id="name_result" style="font-size: 12px;"></span>
					</div>
				</div>
				<div style="text-align: left">
					<p>생년월일</p>
					<div>
						<input type="text" size="4" maxlength="4" placeholder="YYYY"
							name="year" id="year"> <span>/</span> <input type="text"
							size="2" maxlength="2" placeholder="MM" name="month" id="month">
						<span>/</span> <input type="text" size="2" maxlength="2"
							placeholder="DD" name="day" id="day">
					</div>
					<span id="birthday_result" style="font-size: 12px;"></span>
				</div>
				<div>
					<p>성별</p>
					<div>
						<lable for="smallradio"> <input type="radio" name="sex"
							value="남자" class="smallradio" checked="checked">남자 </lable>
						<lable for="smallradio"> <input type="radio" name="sex"
							value="여자" class="smallradio">여자 </lable>
					</div>
				</div>
				<div>
					<p>이메일</p>
					<div style="display: flex">
						<input type="text" name="email" value="" id=email
							placeholder="예) gooutdisplay@naver.com"> <input
							type="button" id="eBtn" value="이메일확인">
					</div>
					<div style="text-align: left; padding-left: 5px">
						<span id="ePrint" style="font-size: 12px;"></span>
					</div>
					</td>
				</div>
				<div>
					<p>우편번호</p>
					<input type="text" name="post" id="post" value="" placeholder="">
					<div style="text-align: left; padding-left: 5px">
						<span id="post_result" style="font-size: 12px;"></span>
					</div>
				</div>
				<div>
					<p>주소</p>
					<input type="text" name="addr1" id="addr1" value="" placeholder="">
				</div>
				<div>
					<p>상세주소</p>
					<input type="text" name="addr2" id="addr2" value="" placeholder="">
				</div>
				<div>
					<p>휴대전화</p>
					<div>
						<input type="text" name="tel" id="tel" value=""
							placeholder="예) 010-1234-1234"> <input type="button" id="tBtn"
							value="전화확인">
					</div>
					<div style="text-align: left; padding-left: 5px">
						<span id="tPrint" style="font-size: 12px;"></span>
					</div>
					</td>
				</div>
				<div>
                <div>비밀번호 찾기 질문</div>
                <select name=question id="question">
                  <option value="기억에 남는 추억의 장소는?" >기억에 남는 추억의 장소는?</option>
                  <option value="자신의 인생 좌우명은?" >자신의 인생 좌우명은?</option>
                  <option value="자신의 보물 제1호는?" >자신의 보물 제1호는?</option>
                  <option value="가장 기억에 남는 선생님 성함은?" >가장 기억에 남는 선생님 성함은?</option>
                  <option value="타인이 모르는 자신만의 신체비밀이 있다면?" >타인이 모르는 자신만의 신체비밀이 있다면?</option>
                  <option value="추억하고 싶은 날짜가 있다면?" >추억하고 싶은 날짜가 있다면? </option>
                  <option value="받았던 선물 중 기억에 남는 독특한 선물은?" >받았던 선물 중 기억에 남는 독특한 선물은?</option>
                  <option value="유년시절 가장 생각나는 친구 이름은?" >유년시절 가장 생각나는 친구 이름은?</option>
                  <option value="인상 깊게 읽은 책 이름은?" >인상 깊게 읽은 책 이름은? </option>
                  <option value="읽은 책 중에서 좋아하는 구절이 있다면?" >읽은 책 중에서 좋아하는 구절이 있다면?</option>
                  <option value="자신이 두번째로 존경하는 인물은?" >자신이 두번째로 존경하는 인물은?</option>
                  <option value="친구들에게 공개하지 않은 어릴 적 별명이 있다면?" >친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
                  <option value="초등학교 때 기억에 남는 짝꿍 이름은?" >초등학교 때 기억에 남는 짝꿍 이름은?</option>
                  <option value="다시 태어나면 되고 싶은 것은?" >다시 태어나면 되고 싶은 것은?</option>
                  <option value="내가 좋아하는 캐릭터는?" >내가 좋아하는 캐릭터는? </option>
                </select>
              </div>
              <div>
				<p>비밀번호 확인 답변</p>
				<input type="text" name=answer id=answer placeholder="답변을 입력하세요.">
				<div style="text-align: left; padding-left: 5px">
						<span id="answer_result" style="font-size: 12px;"></span>
				</div>
			  </div>
				<div style="padding-bottom: 40px">
					<input type="button" id="joinBtn" value="가입하기">
					
				</div>
				
				<p style="font-size: 14px;" id="last">
				이용약관 | 개인정보처리방침 | 책임의 한계와 법적고지 | 회원정보 | 고객센터<br>
				<span style="font-size: 12px;">GOD Copyright <b>GOD Corp</b>. All Rights Reserved.</span>
				</p>
			</div>
		</form>
	</div>


</body>
</html>