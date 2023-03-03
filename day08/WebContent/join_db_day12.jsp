<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.koreait.daoday12.DBConnection"%>
<%@page import="com.koreait.daoday12.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="member" class="com.koreait.beansday12.MemberBean"/>
	<!-- 각각 전달되는 파라미터 값을 따로 처리해줘야 하지만, * 로 해주면 하번에 해결 가능하다. 
		member.setUserId(request.getParameter("userid")); 이렇게 몇개는 원래 해야함.
	-->
<%--	<jsp:setProperty property="userid" name="member"/>
	<jsp:setProperty property="userpw" name="member"/>  --%>
	<jsp:setProperty property="*" name="member"/>
	<!-- 외부에서 전달된 name속성과 필드의 이름이 같으면 value가 자동으로 세팅된다. -->
	
	<%
		MemberDAO mdao = new MemberDAO();
		if(mdao.join(member)){ // 회원가입 성공
	%>
		<script>
			alert("회원가입 성공!");
			location.href="login_view_day12.jsp"
		</script>	
	<%	} else{ // 회원가입 실패 %>
		<script>
			alert("회원가입 실패!");
			location.href="join_view_day12.jsp";
		</script>
	<% } %>
	
</body>
</html>