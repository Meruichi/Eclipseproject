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
	<c:set var="num" value="100"/>
	<c:if test="${nnum gt 50 }">
		<script>
			alert("이 수는 50보다 큽니다.")
		</script>
	</c:if>
	<c:if test="${nnum gt 30 }">
		<script>
			alert("이 수는 30보다 큽니다.")
		</script>
	
	
	</c:if>
</body>
</html>