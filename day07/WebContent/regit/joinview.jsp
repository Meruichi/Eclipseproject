<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원가입</h3>
	<form action="join.jsp" id="joinForm" method="post">
		아이디	<input type="text" name="userid" id="userid"><br>
		비밀번호	<input type="password" name="userpw" id="userpw"><br>
		이름		<input type="text" name="username" id="username"><br>
		핸드폰번호	<input type="text" name="userphone" id="userphone"><br>
		<br>
<!-- 		<input type="submit">  -->
		<input type="button" value="회원가입" onclick="sendit()">
	</form>
	<script>
		function sendit(){
			// validation check
			let frm = document.getElementById("joinForm");
			let idTag = document.getElementById("userid");
			let pwTag = document.getElementById("userpw");
			
			let nameTag = document.getElementById("username");
			let phoneTag = document.getElementById("userphone");
			// 아이디""체크
			if( idTag.value == ""){
				alert("아이디를 입력해주세요."); idTag.focus(); return false;
			}

			// 비밀번호""체크
			if( pwTag.value == ""){
				alert("비밀번호를 입력해주세요."); pwTag.focus(); return false;
			}

			// 비밀번호 8자리이상체크
			if( pwTag.value.length < 8){
				alert("비밀번호는 8자리 이상이어야 합니다."); pwTag.focus(); return false;
			}

			// 이름""체크
			if( nameTag.value == ""){
				alert("이름을 입력해주세요."); nameTag.focus(); return false;
			}

			// 휴대폰""체크
			if( phoneTag.value == ""){
				alert("휴대폰번호를 입력해주세요."); phoneTag.focus(); return false;
			}

			// form submit()
			frm.submit();

		}
	</script>
</body>
</html>