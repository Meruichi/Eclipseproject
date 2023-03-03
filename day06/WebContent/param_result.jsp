<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : <%= request.getParameter("userid") %> 님 어서오세요<br>
	패스워드 : <%= request.getParameter("userpw") %> 입니다.
</body>
</html>