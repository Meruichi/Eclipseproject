<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		Connection conn = null;
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "wjsp";
		String password = "wjsp";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
	 	System.out.println("jdbc driver 로딩성공!");
	 	
	 	conn = DriverManager.getConnection(url, user, password);
	 	System.out.println("오라클 연결 성공!!");
	 	
	 	// insert, delete, update
	 	String sql = "INSERT INTO car(carnum, BRAND, COLOR, PRICE) values('4','K9','White',70000000)";
	 	
	 	int check = 0;
	 	PreparedStatement pstm = conn.prepareStatement(sql);
	 	check = pstm.executeUpdate();
	 	
	 	System.out.println("check : " + check);
	
	
	%>	

</body>
</html>

















