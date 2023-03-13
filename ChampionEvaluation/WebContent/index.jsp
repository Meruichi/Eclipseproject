<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="evaluation.EvaluationDTO" %>
<%@ page import="evaluation.EvaluationDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title> 롤 챔피언 평가 웹사이트 </title>
	<!-- css -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String championDivide = "전체";
	String searchType= "최신순";
	String search = "";
	int pageNumber = 0;
	if(request.getParameter("championDivide") != null){
		championDivide = request.getParameter("championDivide");
	}
	if(request.getParameter("searchType") != null){
		searchType = request.getParameter("searchType");
	}
	if(request.getParameter("search") != null){
		search = request.getParameter("search");
	}
	if(request.getParameter("pageNumber") != null){
		try{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}catch(Exception e){
			System.out.println("검색 페이지 번호 오류");
		}
		
	}
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	if(emailChecked == false){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'emailSendConfirm.jsp';");
		script.println("</script>");
		script.close();
		return;	
	}
%>
	<nav class="navbar navbar-expand-lg navbar-ilght bg-light">
		<a class="navbar-brand" href="index.jsp">롤 챔피언 평가 웹사이트</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp">메인</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
						회원 관리
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
<%
if(userID == null){
%>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
						<a class="dropdown-item" href="userJoin.jsp">회원 가입</a>
<%
	}else{
%>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
<%
	}
%>
					</div>
				</li>
			</ul>
			<form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
				<input type="text" name="search" class="form-control mr-s-sm-2" type="search" placeholder="내용 입력" aria-label="search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색 </button>
			</form>
		</div>
	</nav>
	<section class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="championDivide" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="탑" <% if(championDivide.equals("탑")) out.println("selected"); %>>탑</option>
				<option value="정글러" <% if(championDivide.equals("정글러")) out.println("selected"); %>>정글러</option>
				<option value="미드" <% if(championDivide.equals("미드")) out.println("selected"); %>>미드</option>
				<option value="원거리 딜러" <% if(championDivide.equals("원거리 딜러")) out.println("selected"); %>>원거리 딜러</option>
				<option value="서포터" <% if(championDivide.equals("서포터")) out.println("selected"); %>>서포터</option>
			</select>
			<select name="searchType" class="form-control mx-1 mt-2">
				<option value="최신순">최신순</option>
				<option value="추천순" <% if(searchType.equals("추천순")) out.println("selected");%>>추천순</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용 입력">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">신고</a>
		</form>
<%
	ArrayList<EvaluationDTO> evaluationList = new ArrayList<EvaluationDTO>();
	evaluationList = new EvaluationDAO().getList(championDivide, searchType, search, pageNumber);
	if(evaluationList != null)
		for(int i = 0; i < evaluationList.size(); i++){
			if(i == 5) break;
			EvaluationDTO evaluation = evaluationList.get(i);
%>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left"><%= evaluation.getChampionName() %><small>(<%= evaluation.getChampionSeason() %>, <%= evaluation.getChampionDivide() %>)</small>&nbsp;</div> 
					<div class="col-4 text-right"> 
						종합<span style="color: red;"><%= evaluation.getTotalScore() %></span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<h5 class="card-title">
					<%= evaluation.getEvaluationTitle() %>&nbsp;
				</h5>
				<p class="card-text"><%= evaluation.getEvaluationContent() %></p>
				<div class="row">
					<div class="col-9 text-left">
						라인전<span style="color: red;"><%= evaluation.getLaneScore() %></span>
						팀파이트<span style="color: red;"><%= evaluation.getTeamFightScore() %></span>
						<span style="color: blue;">(추천 : <%= evaluation.getRecommendCount() %>)</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하시겠습니까?')" href="./recommendAction.jsp?evaluationID=<%= evaluation.getEvaluationID() %>">추천</a>
						<a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=<%= evaluation.getEvaluationID() %>">삭제</a>
					</div>
				</div>
			</div>
		</div>
<%
		}
%>
	</section>
	<ul class="pagination justify-content-center mt-3">
		<li class="page-item">
<%
	if(pageNumber <= 0 ){
%>
	<a class="page-link disabled">이전</a>
<%
	} else {
%>
	<a class="page-link" href="./index.jsp?championDivide=<%= URLEncoder.encode(championDivide, "UTF-8") %>&searchType=
	<%= URLEncoder.encode(searchType, "UTF-8") %>&search=<%= URLEncoder.encode(search, "UTF-8") %>&pageNumber=
	<%= pageNumber - 1 %>">이전</a>
<%
	}
%>
		</li>
		<li>
<%
	if(evaluationList.size() < 6 ){
%>
	<a class="page-link disabled">다음</a>
<%
	} else {
%>
	<a class="page-link" href="./index.jsp?championDivide=<%= URLEncoder.encode(championDivide, "UTF-8") %>&searchType=
	<%= URLEncoder.encode(searchType, "UTF-8") %>&search=<%= URLEncoder.encode(search, "UTF-8") %>&pageNumber=
	<%= pageNumber + 1 %>">다음</a>
<%
	}
%>
		</li>
	</ul>
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">평가 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./evaluationRegisterAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>챔피언 명</label>
								<input type="text" name="championName" class="form-control" maxlength="20">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>사용 시즌</label>
								<select name="championSeason" class="form-control">
									<option value="시즌 1">시즌 1</option>
									<option value="시즌 2">시즌 2</option>
									<option value="시즌 3">시즌 3</option>
									<option value="시즌 4">시즌 4</option>
									<option value="시즌 5">시즌 5</option>
									<option value="시즌 6">시즌 6</option>
									<option value="시즌 7">시즌 7</option>
									<option value="시즌 8">시즌 8</option>
									<option value="시즌 9">시즌 9</option>
									<option value="시즌 10">시즌 10</option>
									<option value="시즌 11">시즌 11</option>
									<option value="시즌 12">시즌 12</option>
									<option value="시즌 13">시즌 13</option>
									<option value="시즌 14">시즌 14</option>
									<option value="시즌 15">시즌 15</option>
								</select>
							</div>
							<div class="form-group col-sm-6">
								<label>라인 구분</label>
								<select name="championDivide" class="form-control">
									<option value="탑">탑</option>
									<option value="정글러">정글러</option>
									<option value="미드">미드</option>
									<option value="원거리 딜러">원거리 딜러</option>
									<option value="서포터">서포터</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="evaluationTitle" class="form-control" maxlength="20">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="evaluationContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>라인전</label>
								<select name="laneScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>							
							</div>
							<div class="form-group col-sm-4">
								<label>팀파이트</label>
								<select name="teamFightScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>							
							</div>
							<div class="form-group col-sm-4">
								<label>종합 평가</label>
								<select name="totalScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
								</select>							
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"	data-dismiss="modal" style="margin-right: 10px;">취소</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">신고하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./reportAction.jsp" method="post">
						<div class="form-group">
							<label>신고 제목</label>
							<input type="text" name="reportTitle" class="form-control" maxlength="20">
						</div>
						<div class="form-group">
							<label>신고 내용</label>
							<textarea name="reportContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"	data-dismiss="modal" style="margin-right: 10px;">취소</button>
							<button type="submit" class="btn btn-danger">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 2023 이상훈 All Rights Reserved.
	</footer>
	<!-- jquery -->
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>















