<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>내장 객체 예제</h3>
	<form action="object_ok.jsp" name="joinForm">
		<fieldset>
			<legend>개인정보</legend>
			<input type="text" name="username">
			<input type="text" name="userbirth">
			<input type="button" value="확인" onclick="sendit()">
		</fieldset>
	</form>
<script>
	function sendit(){
		// 이름이 ""(빈 문자열)일 경우 -> "이름을 입력해 주세요"
		// 생일정보가 ""(빈 문자열)일 경우 -> "생일정보를 입력해 주세요"
			let joinForm = document.joinForm;
			let nameTag = joinForm.username;
			let birthTag = joinForm.userbirth;
			
			if( nameTag.value == ""){
				alert("이름을 입력해 주세요")
				nameTag.focus(); return false;
			}
			if( birthTag.value == ""){
				alert("생일정보를 입력해 주세요")
				birthTag.focus(); return false;
			}
			
			joinForm.submit();
	}
</script>
</body>
</html>