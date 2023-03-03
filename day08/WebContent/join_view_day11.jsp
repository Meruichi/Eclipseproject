<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="joinForm" method="post" action="join_db_day11.jsp">
		<p id="text">사용할 수 있는 아이디입니다.</p>
		<p>
			<label> 아이디 : <input type="text" name="userid"></label>
			<input type="button" value="중복확인">
		</p>
		<p>
			<label> 비밀번호 : <input type="password" name="userpw" ></label>
		</p>
		<p>
			<label> 비밀번호 확인 : <input type="password" name="userpw_re"></label>
		</p>
		<p>
			<label> 이름 : <input type="text" name="username"></label>
		</p>
		<p>
			성별<br>
			<label>남자<input type="radio" name="usergender" value="M" checked></label>
			<label>여자<input type="radio" name="usergender" value="W"></label>
		</p>
		<p>
			<label>휴대폰번호 : <input type="text" name="userphone"></label>
		</p>		
		<p>
			<input type="button" value="가입완료" onclick='sendit()'>
		</p>		
	</form>
	<script src="user_day11.js">
	
	</script>
</body>
</html>