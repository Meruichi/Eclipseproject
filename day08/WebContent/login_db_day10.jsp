<%@page import="com.koreait.daoday10.MemberDAO"%>
<%@page import="com.koreait.beansday10.MemberBean"%>
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
			MemberDAO mdao = new MemberDAO();
			String userid = request.getParameter("userid");
			String userpw = request.getParameter("userpw");
			// MemberDAO에 login 메서드 만들어서 결과값을 boolean return
			
			MemberBean member = mdao.login(userid, userpw);	
					
			if( member != null ) {
				session.setAttribute("session_id", member);
			
		%>
		
		<script>
			location.href = "main_view_day10.jsp";
		</script>
	<% } else { %>
		<script>
			alert("로그인 실패");
			location.href = "login_view_day10.jsp";
		</script>
	<% } %>
</body>
</html>