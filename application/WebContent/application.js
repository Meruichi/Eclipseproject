function application_sendit(){
	// validationcheck
	let frm = document.applicationForm;
//페이지를 통해 get?			let animal_number = frm.animal_number; 
//페이지를 통해 get?			let supporter_id = frm.supporter_id;
	let application_title = frm.application_title;
	let application_content = frm.application_content;
	// 신청서 제목 처리
	if(application_title.value == ""){
		alert("제목을 입력해주세요.");
		application_title.focus();
		return false;
	}
	frm.submit();
}