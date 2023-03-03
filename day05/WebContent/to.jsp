<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("UTF-8");
 	// 파라미터를 받아오기
	String ans = request.getParameter("ans");
 	
 	// 화면에 출력할 결과 문자열
 	String result = null;
 	
	if( ans == null || ans.equals("")){
		result = "응답 내용이 없습니다.";
	}else{
		int user_select = Integer.parseInt(ans);
		
		if(user_select == 300){
			result = "정답입니다.";
	}else{
		result = "정답이 아닙니다.";
	}
	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<div><h1>응답결과</h1></div>
		<div><p><%=result %></p></div>
</body>
</html>