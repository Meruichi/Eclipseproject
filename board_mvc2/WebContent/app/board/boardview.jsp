<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		margin: 0 auto;
		width: 900px;
	}
</style>
</head>
<body>
	<c:set var="board" value="${requestScope.board }"/>
	<c:set var="replylist" value="${requestScope.replylist }"/>
	<div>
		<table style="width: 900px;border: 0px;">
			<tr align="center" valign="middle">
				<td><h3>MVC 게시판</h3></td>
			</tr>
		</table>
		
		<table border="1" style="border-collapse: collapse;">
			<tr height="30px">
				<th align="center" width="150px;">제목</th>
				<td>
					<!-- 제목 data -->
					${board.boardtitle }
					<span style="font-weight: bold; color:#6a1b9a;float: right;">
						<!-- 조회수 data -->
						조회수 : ${board.boardreadcount }
					</span>
				</td>
			</tr>
			<tr height="30px">
				<th align="center" width="150px;">글쓴이</th>
				<td>
					<!-- 글쓴이 data -->
					${board.username }
				</td>
			</tr>
			<tr height="300px">
				<th align="center" width="150px;">내용</th>
				<td valign="top" style="padding: 10px;"> 
					<!-- 내용 data -->
					${board.boardcontent }
				</td>
			</tr>
		</table>
		
		<table style="border: 0px;">
			<tr align="right" valign="middle">
				<td>
					<!-- 목록 : boardlist.jsp -->
					<a href="${pageContext.request.contextPath}/board/Boardlist.bo">[목록]</a>
				</td>
			</tr>
		</table>
		
		<!-- 댓글 -->
		<form action="${pageContext.request.contextPath}/board/AddReply.bo" name="replyForm" method="post">
			<input type="hidden" name="boardnum" value="${board.boardnum }">
			<table>
				<tr>
					<td align="center" width="200px">
						댓글<br><hr>
						이름 &nbsp;&nbsp;&nbsp;<input name="username" maxlength="10" size="10"><br>
						비밀번호<input name="password" type="password" size="10">
					</td>
					<td style="padding-left: 10px;">
						<textarea style="width: 680px;height: 85px;resize: none;" name="replycontents"></textarea><br>
						<a href="javascript:document.replyForm.submit()">[등록]</a>
					</td>
				</tr>
			</table>
			
			<!-- 댓글 리스트 -->
			<hr>
			<table border="1">
				<c:choose>
					<c:when test="${replylist != null and fn:length(replylist) > 0 }">
						<c:forEach var="reply" items="${replylist }">
							<tr>
								<td align="center" width="200px;">${reply.username }</td>
								<td valign="top" style="padding-left: 10px;">
									<textarea id="reply${reply.replynum }" name="reply${reply.replynum }" style="text-align: left; border: 0px;width: 680px;height: 85px;resize: none;" readonly>${reply.replycontents }</textarea><br>
									<a href="javascript:updateReply(${reply.password },${reply.replynum } )">[수정]</a>
									&nbsp;&nbsp;&nbsp;
									<a href="javascript:updateReadonlyReply(${reply.replynum });">[수정하기]</a>
									&nbsp;&nbsp;&nbsp;
									<a href="javascript:deleteReply(${reply.password },${reply.replynum })">[삭제]</a>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td align="center">댓글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>			
		</form>
	</div>
</body>
<script>
	function deleteReply(password, replynum){
		let pw = prompt("댓글 비밀번호를 입력하세요.");
		if(pw == password){
			document.replyForm.action = "${pageContext.request.contextPath}/board/DeleteReply.bo?replynum="+replynum;
			document.replyForm.submit();
		}
		
	}
	
	function updateReply(password, replynum){
		let pw = prompt("댓글 비밀번호를 입력해주세요!");
		if( pw == password ){
			document.replyForm.action = "${pageContext.request.contextPath}/board/UpdateReply.bo?replynum="+replynum;
			document.replyForm.submit();			
		}
	}

	function updateReadonlyReply( replynum ){
		document.getElementById('reply' + replynum).readOnly = false;
	}
	
</script>


</html>

















