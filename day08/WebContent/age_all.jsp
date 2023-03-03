<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.application.DBConnection"%>
<%@page import="model.application.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.koreait.beans.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="mdao" class="model.application.MemberDAO" />
	<%
		// DB Coneection
		// ....
/* 			Connection conn = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "wjsp";
	String password = "wjsp";
	
	Class.forName(driver);
 	System.out.println("jdbc driver 로딩성공!");
 	
 	conn = DriverManager.getConnection(url, user, password);
 	System.out.println("오라클 연결 성공!!"); */
	
 	ArrayList<MemberBean> result = mdao.selectAll();
 
	%>

	<table border="1">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
		<%
	 		for(MemberBean member : result){
	 	 %>
	 		<tr>
	 			<td><%=member.getName() %></td>
				<td><%=member.getAge() %></td>
			</tr>
	 		 
	  	<%	} 	%>	
	</table>
	<input type="button" value="다시 검색하기" onclick="location.href='age_search.jsp'">
</body>
</html>