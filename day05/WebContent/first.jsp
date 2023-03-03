<!-- 
	디렉티브 태그 ( %@ %
		-> 사용할 프로그래밍 언어, 생성할 문서의 콘텐츠 유형, 문자의 인코딩 설정, ...
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
// 	response.setCharacterEncoding("UTF-8");
//  response.setContentType("text/html; charset=UTF-8");
	String cntStr = request.getParameter("cnt");
	
	int cnt = 100;
	if( cntStr!= null && !cntStr.equals("")){
		cnt = Integer.parseInt(cntStr);
	}
	
	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		for(int i = 0; i<cnt; i++){		
	%>
		안녕 servlet!!!<br>
	<%
		}
	%>
	
</body>
</html>