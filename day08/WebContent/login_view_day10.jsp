<%@page import="com.koreait.daoday10.MemberDAO"%>
<%@page import="com.koreait.beansday10.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login_db_day10.jsp" method="post" name="frm">
		<p>
			<label>아이디 : <input type="text" name="userid"> </label>
		</p>
		<p>
			<label>비밀번호: <input type="password" name="userpw"> </label>
		</p>
		<input type="button" value="로그인" onclick="sendit();">
	</form>
	<script>
		function sendit(){
			let frm = document.frm;
			let userid = frm.userid;
			let userpw = frm.userpw;
			
			// 아이디"" 처리
			if( userid.value == ""){
				alert("아이디를 입력하세요!");
				userid.focus();
				return false;
				
			}
			// 비밀번호"" 처리
			if(userpw.value == ""){
				alert("비밀번호를 입력하세요!");
				userpw.focus();
				return false;
			}
			frm.submit();

			
		}
	</script>
</body>
</html>