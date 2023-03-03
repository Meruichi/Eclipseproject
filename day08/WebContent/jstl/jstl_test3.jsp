<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	choose문 사용
	(if~else문의 경우 jstl에서는 choose문을 사용해야한다.)<br><hr>
	
	<c:set var="num" value="100"/>
	<c:choose>
		<c:when test="${num gt 50}">
			이 수는 50보다 큽니다!
		</c:when>
		<c:when test="${num gt 30}">
			이 수는 30보다 큽니다!
		</c:when>
		<c:when test="${num gt 10}">
			이 수는 10보다 큽니다!
		</c:when>
		<c:otherwise>
		이 수는 그 외의 숫자입니다.		
		</c:otherwise>
	</c:choose>
	
	
</body>
</html>