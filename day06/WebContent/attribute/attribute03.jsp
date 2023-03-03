<%@page import="java.util.ArrayList" %>
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
		ArrayList<String> datas = new ArrayList<String>();
	datas.add("Hello");
	datas.add("JSP");
	datas.add("너무");
	datas.add("즐거워요");
	
	session.setAttribute("arMsg",datas);
	response.sendRedirect("attribute04.jsp");
	%>
</body>
</html>