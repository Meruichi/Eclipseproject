function sendit(){
	// 회원가입 폼 validationcheck
	let frm = document.joinForm;
	let userid = frm.userid;
	let userpw = frm.userpw;
	let userpw_re = frm.userpw_re;
	let username = frm.username;
	let userphone = frm.userphone;
	// 아이디 "" 처리
	if(userid.value == ""){
		alert("아이디를 입력하세요!");
		userid.focus();
		return false;
	}
	// 아이디 5자리 이상, 16자리미만
	if(userid.value.length <= 4 || userid.value.length >= 16){
		alert("아이디는 5자 이상, 16자 미만으로 입력하세요!");
		userid.focus();
		return false;
	}	
	
	// 비밀번호 "" 처리
	if( userpw.value == ""){
		alert("비밀번호를 입력하세요!");
		userpw.focus();
		return false;
	} else{	// 비밀번호 8자리이상
	if(userpw.value.length < 8){
		alert("비밀번호는 8자리 이상으로 입력하세요!");
		userpw.focus();
		return false;
		}		
		
	} 
	
	// 비밀번호, 비밀번호 확인이 같은지
	if(userpw.value != userpw_re.value){
		alert("비밀번호 확인을 체크해주세요!");
		userpw_re.focus();
		return false;
	}	 
	// 이름이"" 처리
	if(username.value == ""){
		alert("이름을 작성하세요!");
		username.focus();
		return false;
	}
	// 휴대폰 번호 "" 처리
	if(userphone.value == ""){
		alert("휴대폰번호를 입력하세요!");
		userphone.focus();
		return false;
	}
	frm.submit();
}

function checkId(userid){
	if( userid == ""){
		alert("아이디를 입력해주세요");
		return false;
	}else{ // ajax 통신
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "idcheck_day12.jsp?userid=" + userid, true);
		xhr.send();
		xhr.onreadystatechange = function(){
			if( xhr.readyState == XMLHttpRequest.DONE 
					&& xhr.status == 200 ){
				if(xhr.responseText.trim() == "ok"){
					// 사용할수 있는 아이디입니다.
					document.getElementById("text").innerHTML = "사용할 수 있는 아이디입니다.";
				}else{
					// 중복된 아이디입니다.
					document.getElementById("text").innerHTML = "중복된 아이디입니다.";
				}
			}			
		}

	}
}