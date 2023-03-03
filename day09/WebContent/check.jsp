<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    //내 db 접속에 사용할 conn 변수
    Connection conn = null;
    //오라클 드라이버 경로 설정
    String driver = "oracle.jdbc.driver.OracleDriver";
    //내 db의 계정 경로 설정, db의 sid에 맞게 xe부분을 바꿔준다
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    //접속 성공,실패 여부 사용시 쓰는 변수
    Boolean connect = false;
    
    try {
        //오라클 드라이버 접속
        Class.forName(driver);
        //내 db 접속 scott에 아이디, tiger에 비밀번호
        conn = DriverManager.getConnection(url, "scott", "tiger");
        //접속성공시 true 설정
        connect = true;
        //접속 끊기, 끊는 이유 : 항상 db가 연결되어 있으면 접속 오류 및 데이터 충돌이 일어나기 때문 
        conn.close();
    } catch (Exception e) {
        //접속 실패시 false 잡고 예외처리해줌
        connect = false;
        e.printStackTrace();
    }
%>
<%
if(connect==true){%>
    연결되었습니다.
<%}else{ %>
    연결에 실패하였습니다.
<%}%>
</body>
</html>