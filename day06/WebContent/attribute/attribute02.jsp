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
	// attribute01.jsp에서 Object로 넘어오기 떄문에 String으로 타입을 맞춰야한다.
/* 	String userid = (String)request.getAttribute("userid");
	String userpw = (String)request.getAttribute("userpw");
	String username = (String)request.getAttribute("username"); */
	
	// session
	String userid = (String)session.getAttribute("userid");
	String userpw = (String)session.getAttribute("userpw");
	String username = (String)session.getAttribute("username");
	
	
	%>
	
	아이디	: <%=userid %><br>
	비밀번호	: <%=userpw %><br>
	이름		: <%=username %><br>
</body>
</html>

















