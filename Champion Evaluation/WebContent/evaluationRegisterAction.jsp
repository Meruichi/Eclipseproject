<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="evaluation.EvaluationDTO"%>"
<%@ page import="evaluation.EvaluationDAO"%>"
<%@ page import="util.SHA256"%>"
<%@ page import="java.io.PrintWriter"%>"
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해 주세요.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	String championName = null;
	String championSeason = null;
	String championDivide = null;
	String evaluationTitle = null;
	String evaluationContent = null;
	String totalScore = null;
	String laneScore = null;
	String teamFightScore = null;

	if(request.getParameter("championName") != null){
		championName = request.getParameter("championName");}
	if(request.getParameter("championSeason") != null){
		championSeason = request.getParameter("championSeason");}
	if(request.getParameter("championDivide") != null){
		championDivide = request.getParameter("championDivide");}
	if(request.getParameter("evaluationTitle") != null){
		evaluationTitle = request.getParameter("evaluationTitle");}
	if(request.getParameter("evaluationContent") != null){
		evaluationContent = request.getParameter("evaluationContent");}
	if(request.getParameter("totalScore") != null){
		totalScore = request.getParameter("totalScore");}
	if(request.getParameter("laneScore") != null){
		laneScore = request.getParameter("laneScore");}
	if(request.getParameter("teamFightScore") != null){
		teamFightScore = request.getParameter("teamFightScore");}
	/*
	 int형이 있을 경우 try catch문을 써야함. 예를들어 챔피언년도(championYear)가 있을시
	 if(request.getParameter("championYear" != null)){
		 try{ championYear = Integer.parseInt(request.getParameter("championYear"));
		 }catch(Exception e){System.out.println("챔피언년도 오류");}
	 }
	*/
	if(championName == null || championSeason == null || championDivide == null || evaluationTitle == null ||
	  evaluationContent == null || totalScore == null || laneScore == null || teamFightScore == null
	  || evaluationTitle.equals("") || evaluationContent.equals("") ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	EvaluationDAO evaluationDAO = new EvaluationDAO();
	int result = evaluationDAO.write(new EvaluationDTO(0, userID, championName, championSeason, championDivide, evaluationTitle
			, evaluationContent, totalScore, laneScore, teamFightScore, 0));
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('챔피언 평가 등록에 실패했습니다..');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}else{
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
%>