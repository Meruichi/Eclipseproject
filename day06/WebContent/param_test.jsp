<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>param 액션태그</h3>
	<jsp:forward page="param_result.jsp">
		<jsp:param name="userid" value="lsh" />
		<jsp:param name="userpw" value="1q2w3e4r" />
	</jsp:forward>
</body>
</html>