<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
	
	Class.forName(driver);
 	System.out.println("jdbc driver 로딩성공!");
 	
 	conn = DriverManager.getConnection(url, user, password);
 	System.out.println("오라클 연결 성공!!");
	
 /* 	String sql = "select sysdate from dual";
 	PreparedStatement pstm = conn.prepareStatement(sql);
 	
 	ResultSet rs = pstm.executeQuery();
 	
 	if( rs.next()){
 		out.print(rs.getDate(1)); 	} */
 	// next() -> sql문의 다음 행이 있는지 확인하는 함수
 	// 그러므로 다음이있으면 true반환, 없으면 false반환.  처음 행이 있다면 처음에 true 반환
 	String sql = "select * from car";
 	PreparedStatement pstm = conn.prepareStatement(sql);
 	
 	ResultSet rs = pstm.executeQuery();
 	
 	while(rs.next()){
 		out.print("차 번호 : " + rs.getString(1) + "<br>");
 		out.print("브랜드 : " + rs.getString("BRAND") + "<br>");
 		out.print("색상 : " + rs.getString(3) + "<br>");
 		out.print("가격 : " + rs.getString("PRICE") + "<br>");
 	}  // getSring으로 행의 순서 혹은 이름을 직접 입력하여 데이터 가져옴
 	
 	out.print("<br><hr>");
 	
 	String carnum = "3";
 	//sql = "SELECT * FROM car WHERE carnum = '" + carnum + "'";
 	sql = "SELECT color FROM car WHERE carnum = ?";
 	
 	pstm = conn.prepareStatement(sql);
 	pstm.setString(1, carnum); // setString(a, b) -> a번째 물음표의 값을 b로 지정 
 	rs =pstm.executeQuery();
 	
 	if( rs.next()){
 		out.print("색상 : " + rs.getString(1));
 	}
 	
 	
 	
 	
 	// close는 반납의 개념(다시 connection 닫기)
 	rs.close();
 	pstm.close();
 	conn.close();
	%>
</body>
</html>