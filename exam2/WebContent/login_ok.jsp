<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="study.jsp.session.model.Member"%>
<%
	// 사용자 입력값
	// 문제 5.
	String userId = request.getParameter("user_id");
	// 문제 6.
	String userPw = request.getParameter("user_pw");
	// 문제 7.
//	String rememberId = ?;
	
	/** 가입된 회원정보를 가정 */
	Member member = new Member();
	// member객체에 userId, userPw 값 할당
	// 문8. 
	member.setUserId(userId);
	member.setUserPw(userPw);
	
	// username, useremail은 임의의 값
	member.setUserName("JSP학생");
	member.setEmail("jspuser@jsp.co.kr");
	
	/** 로그인 처리 -> 세션 생성 */
	// 문9. 
	session.setAttribute("session_id", member);
	
%>
	<!-- login.jsp로 돌아가기 -->
	<script type="text/javascript"> location.href="login.jsp"; </script>
