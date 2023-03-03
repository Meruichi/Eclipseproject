<%@page import="vo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		User[] arUser = {
		new User("userid1","김자바", 10),
		new User("userid2","김디비",20),
		new User("userid3","홍길동",30) };
	
		request.setAttribute("users", arUser);
		pageContext.forward("attribute09.jsp");
	%>
</body>
</html>