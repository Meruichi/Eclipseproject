<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%=	request.getAttribute("result") %><br>
	${result }<br>
	${names[0] }<br>
	${names[1]	}<br>
	${notice.id }<br>
	${notice.title }<br>
	<hr>
	${param.num }
	<hr>
	${param.num >= 3 }<br>
	${param.num ge 3 }<br>
	<hr>
	${empty param.num }<br>
	${not empty param.num }<br>
	<hr>
	${empty param.num ?'값이 비어 있습니다.':param.num  }<br>
</body>
</html>