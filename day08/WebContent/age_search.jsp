<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="age_db.jsp">
		<label>
			이름 : <input type="text" name="name"><br>
			<input type="submit">
		</label>
	 </form>
	 <input type="button" value="전체확인하기" onclick="selectAll();">
	 <!-- 제출버튼을 누르면 age_db로 전송, 전체확인하기를 누르면 age_all로 이동. -->
	 <script>
	 	function selectAll(){
	 		location.href = "age_all.jsp";
	 	}
	 
	 </script>
</body>
</html>