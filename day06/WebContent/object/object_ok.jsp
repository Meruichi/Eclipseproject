<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	String userbirth = request.getParameter("userbirth");
	
	// DB처리
	
	
	// forward : request 객체 유지
	//pageContext.forward("object_result.jsp");
	
	// redirect 방식 : request객체 재생성
	response.sendRedirect("object_result.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>