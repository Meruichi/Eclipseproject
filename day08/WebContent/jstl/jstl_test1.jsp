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
	<!-- 변수선언, scope : 어느 범위까지 사용하는지, page : pageContext -->
	<!-- jstl로 만들어진 값은 setAttribute로 값을 넣기 때문에 el로 값을 가지고 올 수 있다. -->
	<c:set var="userid" value="apple" scope="page"/>
	회원아이디 <c:out value="${userid }" /><br>
	회원아이디 : ${userid }
	<hr>
<%--	<!--  <c:set>이 사이에 들어가는 값이 value<c:set> --> --%>
	<c:set var="userpw" scope="session">lsh1234</c:set>
	<c:set var="username" scope="session">김자바</c:set>
	회원아이디 : ${userid }<br>
	회원이름 : ${username }<br>
	회원아이디 : ${sessionScope.userid }<br>
	회원이름 : ${sessionScope.username }<br>
</body>
</html>