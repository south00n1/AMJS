<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<link href="../member/css/join.css" rel="stylesheet">
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
				height : 180,
				title : '아이디 중복체크'
			})
		})

		// 우편번호 검색
		$('#post').click(function() {
			Shadowbox.open({
				content : '../member/postfind.do',
				player : 'iframe',
				width : 580,
				height : 450,
				title : '우편번호 검색'
			})
		})

		// 이메일 확인
		$('#eBtn').click(function() {
			let email = $('#email').val();
			if (email.trim() === "") {
				$('#email').focus();
				return;
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
						$('#ePrint').text(email + "는(은) 사용 가능한 이메일입니다");
						$('#email').prop('readonly', true);
					} else {
						$('#ePrint').text(email + "는(은) 이미 사용중인 이메일입니다");
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

			$.ajax({
				type : 'post',
				url : '../member/tel_check.do',
				data : {
					"phone" : phone
				},
				success : function(result) {
					let count = Number(result.trim());
					if (count == 0) {
						$('#tPrint').text(phone + "는(은) 사용 가능한 번호입니다");
						$('#tel').prop('readonly', true);
					} else {
						$('#tPrint').text(phone + "는(은) 이미 사용중인 번호입니다");
						$('#tel').val("");
						$('#tel').focus();
					}
				}
			})
		})

		$('#joinBtn').click(function() {
			let id = $('#join_id').val();
			if (id.trim() === "") {
				alert("아이디 중복을 확인해주세요.")
				$('#join_id').focus();
				return;
			}

			let pwd = $('#join_pwd').val();
			if (pwd.trim() === "") {
				alert("비밀번호를 입력해주세요.")
				$('#join_pwd').focus();
				return;
			}

			let pwd1 = $('#join_pwd1').val();
			if (pwd.trim() !== pwd1.trim()) {
				alert("비밀번호가 다릅니다\n다시 입력해주세요")
				$('#join_pwd1').val("");
				$('#join_pwd1').focus();
				return;
			}

			let name = $('#name').val();
			if (name.trim() === "") {
				alert("이름을 입력해주세요.")
				$('#name').focus();
				return;
			}

			let year = $('#year').val();
			if (year.trim() === "") {
				alert("생년월일을 입력해주세요.")
				$('#year').focus();
				return;
			}

			let month = $('#month').val();
			if (month.trim() === "") {
				alert("생년월일을 입력해주세요.")
				$('#month').focus();
				return;
			}

			let day = $('#day').val();
			if (day.trim() === "") {
				alert("생년월일을 입력해주세요.")
				$('#day').focus();
				return;
			}

			let email = $('#email').val();
			if (email.trim() === "") {
				alert("이메일을 입력해주세요.")
				$('#email').focus();
				return;
			}

			let post = $('#post').val();
			if (post.trim() === "") {
				alert("우편번호를 입력해주세요.")
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
				alert("전화번호를 입력해주세요.")
				$('#tel').focus();
				return;
			}

			$('#join_frm').submit();
		})
	})
</script>
</head>
<body>
	<div class="container">
		<div class="top">
			<h1>회원정보 입력</h1>
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
				</div>
				<div>
					<p>비밀번호</p>
					<input type="password" name="pwd" id="join_pwd"
						placeholder="비밀번호를 입력해주세요">
				</div>
				<div>
					<p>비밀번호 재확인</p>
					<input type="password" name="pwd1" id="join_pwd1"
						placeholder="비밀번호를 한번 더 입력해주세요">
				</div>
				<div>
					<p>이름</p>
					<input type="text" name="name" id="name" placeholder="이름을 입력해주세요">
				</div>
				<div>
					<p>생년월일</p>
					<div>
						<input type="text" size="4" maxlength="4" placeholder="YYYY"
							name="year" id="year"> <span>/</span> <input type="text"
							size="2" maxlength="2" placeholder="MM" name="month" id="month">
						<span>/</span> <input type="text" size="2" maxlength="2"
							placeholder="DD" name="day" id="day">
					</div>
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
							placeholder="예)gooutdisplay@naver.com"> <input
							type="button" id="eBtn" value="이메일확인">
					</div>
					<div style="text-align: left; padding-left: 5px">
						<span style="color: green;" id="ePrint"></span>
					</div>
					</td>
				</div>
				<div>
					<p>우편번호</p>
					<input type="text" name="post" id="post" value="" placeholder="">
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
							placeholder="숫자만 입력해주세요"> <input type="button" id="tBtn"
							value="전화확인">
					</div>
					<div style="text-align: left; padding-left: 5px">
						<span style="color: green" id="tPrint"></span>
					</div>
					</td>
				</div>
				<div>
					<input type="button" id="joinBtn" value="가입하기">
				</div>
			</div>
		</form>
	</div>


</body>
</html>