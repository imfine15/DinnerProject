var id = $("#id");
var password= $("#password");

function check() {
	if(id.val() === null || id.val() === "") {
		window.alert("아이디를 입력해 주세요.");
		$("#id").focus();
		return false;
	}

	if(password.val() === null || password.val() === "") {
		window.alert("비밀번호를 입력해 주세요.");
		$("#password").focus();
		return false;
	}
	
	return true;
}

$(function() {
		$('#pwdShowHide').on('click', function(){
		$('input').toggleClass('active');
			        
		if($('input').hasClass('active')) {
			$("#password").attr('type',"text");
			$("#pwdLabel").html("비밀번호 숨기기");
		} else {
			$("#password").attr('type',"password");
			$("#pwdLabel").html("비밀번호 보이기");
		}
	});
});
