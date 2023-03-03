<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.application.DBConnection"%>
<%@page import="model.application.MemberDAO"%>
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
/* 		String name = request.getParameter("name");
	
		// DB Connection
		// ...
		// ...
			Connection conn = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "wjsp";
	String password = "wjsp";
	
	Class.forName(driver);
 	System.out.println("jdbc driver 로딩성공!");
 	
 	conn = DriverManager.getConnection(url, user, password);
 	System.out.println("오라클 연결 성공!!"); */
 	
 	
 	
/*  	Connection conn = DBConnection.getConnection();
 	String sql = "SELECT age FROM MEMBER WHERE name = ?";
 	PreparedStatement pstm = conn.prepareStatement(sql);
 	
 	pstm.setString(1, name);
	ResultSet rs = pstm.executeQuery(); */
	
	String name = request.getParameter("name");
	
	MemberDAO mda = new MemberDAO();
	int age = mda.getAge(name);
 	%>
 	
 	<%
 		if( age != 0){
 	%>
 		이름 : <%=name %><br>
 		나이 : <%=age %><br>
  	<%
 		} else{
 	%>	
 		찾는 이름이 없습니다.<br>
  	<%
 		}
 	%>	

 	<input type="button" value="다시 검색하기" onclick="location.href='age_search.jsp'">
</body>
</html>