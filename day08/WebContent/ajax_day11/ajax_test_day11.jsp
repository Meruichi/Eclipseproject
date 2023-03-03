<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Ajax 요청 보내기 테스트</h3>
	<input type="submit" value="GET 방식으로 요청 보내기" onclick="send1()">
	<input type="submit" value="POST 방식으로 요청 보내기" onclick="send2()">
	<p id="result"></p>
	
	<script>
		function send1(){
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "request_ajax_day11.jsp?userid=apple&userpw=abcd1234", true);
		xhr.send();
		xhr.onreadystatechange = function(){
			// 성공
			if( xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
				//alert(xhr.responseText);
				document.getElementById("result").innerHTML = xhr.responseText;
			}
		}
		}
		
		function send2(){
			let xhr = new XMLHttpRequest();
			xhr.open("POST", "request_ajax_day11.jsp", true);
			xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhr.send("userid=javas&userpw=abcd1234");			
			xhr.onreadystatechange = function(){
				// 성공
				if( xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
					//alert(xhr.responseText);
					document.getElementById("result").innerHTML = xhr.responseText;
				}
			}
			}
	</script>
</body>
</html>