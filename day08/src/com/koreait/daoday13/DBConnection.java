package com.koreait.daoday13;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection getConnection() {
	
	Connection conn = null;
	
	try {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "wjsp";
	String password = "wjsp";
	
	Class.forName(driver);
 	System.out.println("jdbc driver 로딩성공!");

 	conn = DriverManager.getConnection(url, user, password);
 	System.out.println("오라클 연결 성공!!");} catch(ClassNotFoundException e) {
 		System.out.println("드라이버 로딩 실패");
 	}
	catch(SQLException e) {System.out.println("DB 접속 오류");}
	catch(Exception e) {System.out.println("알수 없는 오류");}
 	
 	return conn;
	}
}
