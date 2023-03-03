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
		// request.getParameter()...
		// : 요청을 보낸 페이지에서 <input> 으로
		// 보낸 데이터를 받을 때 사용
		String userid = "lsh";
		String userpw = "1q2w3e4r";
		String username = "이상훈";
		
		// request
	//	request.setAttribute("userid", userid);
	//	request.setAttribute("userpw", userpw);
	//	request.setAttribute("username", username);
	//	pageContext.forward("attribute02.jsp");
	
		// session
		session.setAttribute("userid",userid);
		session.setAttribute("userpw",userpw);
		session.setAttribute("username",username);
//		pageContext.forward("attribute02.jsp");
		response.sendRedirect("attribute02.jsp");
		// session 객체는 브라우저를 종료하지 않는다면
		// 초기화되지 않으므로 redirect방식으로 전송해도 데이터가 유지된다.
	%>
</body>
</html>
















