<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="study.jsp.session.model.Member"%>
<%	
	// 문제 1.
	// Memeber 객체에  세션값 가져와 할당하기
	Member loginInfo = (Member)session.getAttribute("session_id");

			

%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>My JSP Page</title>
	<!-- Twitter Bootstrap3 & jQuery -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h1 class="page-header">로그인/로그아웃 테스트</h1>
<%
	//문제 2.
	if (loginInfo != null) {
		// 세션에서 획득한 객체가 없는 경우는 로그인 상태 아님
		// --> 아이디, 비밀번호 입력폼을 표시
%>
		<form class="form-inline" method="post" action="login_ok.jsp">
			<div class="form-group">
				<input type="text" name="user_id" class="form-control"
					placeholder="아이디"  />
			</div>
			<div class="form-group">
				<input type="password" name="user_pw" class="form-control" 
					placeholder="비밀번호" />
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>

<%
	} else {
		// 그렇지 않은 경우(세션정보가 존재할 경우)는 로그인 중.
		// --> 세션에서 획득한 Member 객체로 원하는 정보 표시
%>
		<!-- 문제 3. --> 
		<h2>안녕하세요  <%=loginInfo.getUserName()%> 님</h2>
		<!-- 문제 4. -->
		<h3>  <%=loginInfo.getEmail()%>  </h3>
		<a href="logout.jsp" class="btn btn-warning">로그아웃</a>
<%
	}
%>
	</div>
</body>
</html>
