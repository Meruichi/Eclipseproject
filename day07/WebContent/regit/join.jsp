<%@ page import="model.application.UserDao" %>
<%@ page import="com.koreait.beans.UserBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	String username = request.getParameter("username");
	String userphone = request.getParameter("userphone");
	
	UserDao udao = new UserDao();
	UserBean bean = new UserBean();
	bean.setUserid(userid);
	bean.setUserpw(userpw);
	bean.setUsername(username);
	bean.setUserphone(userphone);
	
	boolean check = udao.join(bean);
	if( check ){ // true
		//가입성송
	}else{
		//가입 실패
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>