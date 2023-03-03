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
	<!-- http://localhost:9090/jstl/jstl_test4.jsp?userid=test&testpw=test1234 -->
	<!-- userid = admin -> 관리자, userid = apple -> 김사과, 비회원
		userid가 empty 상태는 form태그 보여줄것
	 -->
	 <c:choose>
	 	<%-- para.userid가 empty일때 --%>
		 <c:when test="${empty param.userid }">
			<form>
				아이디<input type="text" name="userid"><br>
				비밀번호<input type="password" name="userpw"><br>
				<input type="submit">
			</form>
		</c:when>
		<%-- param.userid가 empty가 아닌 경우 --%>
		<c:otherwise>
			<c:set var="userid" value="${param.userid }"/>
			<c:set var="userpw" value="${param.userpw }"/>
		
			<!-- 관리자, 김사과, 비회원 -->
			<c:choose>
				<c:when test="${userid == 'admin' }" />
				<c:when test="${userid == 'apple' }" />
				<c:otherwise>비회원</c:otherwise>
			</c:choose>
		</c:otherwise>
		
	</c:choose>	
</body>
</html>