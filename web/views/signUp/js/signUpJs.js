var id = $("#id");
var pwd1= $("#pwd1");
var pwd2 = $("#pwd2");
var name = $("#name");
var nickName = $("#nickName");
var email = $("#email");
var gender = $("#gender option:selected");
var phone = $("#phone");
var admit = $("#admit").prop("checked");

var idCheck = /[a-zA-Z0-9]{4,20}/;
var passwordCheck = /[a-zA-Z0-9]{8,16}/;
var nameCheck = /[가-힣]{2,5}/;
var nickNameCheck = /[가-힣]{1,10}/;
var phoneCheck = /\d{10,12}/;

function check() {
	if(id.val() === null || id.val() === "") {
		$("#idResult").html("아이디는 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#id").focus();
		return false;
	} else if(!idCheck.test(id.val())) {
		$("#idResult").html("아이디를 4 ~ 20자 영어 대소문자와 숫자로 입력하세요.").css({"backgroundColor" : "red", "color" : "white"});
		$("#id").focus();
		return false;
	}
	
	if(pwd1.val() !== pwd2.val()) {
		$("#pwdResult").html("비밀번호가 서로 다르거나 비밀번호 확인란이 비어있습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#pwd2").focus();
		return false;
	} else if(pwd1.val() === null || pwd1.val() === "") {
		$("#pwdResult").html("비밀번호는 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#pwd1").focus();
		return false;
	} else if(!passwordCheck.test(pwd1.val()) || !passwordCheck.test(pwd2.val())) {
		$("#pwdResult").html("비밀번호를 8 ~ 16자리 숫자와 영어 대소문자로 입력하세요.").css({"backgroundColor" : "red", "color" : "white"});
		$("#pwd1").focus();
		return false;
	}
	
	if(name.val() === null || name.val() === "") {
		$("#nameResult").html("이름은 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#name").focus();
		return false;
	} else if(!nameCheck.test(name.val())) {
		$("#nameResult").html("이름을 한글 2 ~ 5글자로만 입력하세요.").css({"backgroundColor" : "red", "color" : "white"});
		$("#name").focus();
		return false;
	}
	
	if(nickName.val() === null || nickName.val() === "") {
		$("#nickNameResult").html("별명은 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#nickName").focus();
		return false;
	} else if(!nickNameCheck.test(nickName.val())) {
		$("#nickNameResult").html("별명을 한글 1 ~ 10글자로만 입력하세요.").css({"backgroundColor" : "red", "color" : "white"});
		$("#nickName").focus();
		return false;
	}
	
	if(email.val() === null || email.val() === "") {
		$("#emailResult").html("이메일은 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#email").focus();
		return false;
	}
	
	if(gender.val() === null || gender.val() === "") {
		$("#genderResult").html("성별을 선택해주세요.").css({"backgroundColor" : "red", "color" : "white"});
		$("#gender").focus();
		return false;
	}
	
	if(phone.val() === null || phone.val() === "") {
		$("#phoneResult").html("휴대전화 번호는 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#phone").focus();
		return false;
	} else if(!phoneCheck.test(phone.val())) {
		$("#phoneResult").html("휴대전화 번호를 10 ~ 12자리의 숫자로만 입력하세요.").css({"backgroundColor" : "red", "color" : "white"});
		$("#phone").focus();
		return false;
	}
	
	if(admit === false) {
		$("#admitResult").html("약관에 동의해야 회원가입을 진행하실 수 있습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#admit").focus();
		return false;
	}
	
	return true;
}

$(function() {
	$("#id").bind('input', function() {
		if(id.val() !== "" || id.val() !== null) {
			$("#idResult").html("").css({"backgroundColor" : "white"});
		}
	});
	
	$("#pwd2").bind("input", function() {
		if(pwd1.val() === pwd2.val()) {
			$("#pwdResult").html("").css({"backgroundColor" : "white"});
		}
	});

	$("#name").bind("input", function() {
		if($("#name").val() !== "" || $("#name").val() !== null) {
			$("#nameResult").html("").css({"backgroundColor" : "white"});
		}
	});

	$("#nickName").bind("input", function() {
		if(nickName.val() !== "" || nickName.val() !== null) {
			$("#nickNameResult").html("").css({"backgroundColor" : "white"});
		}
	});

	$("#email").bind("input", function() {
		if(email.val() !== "" || email.val() !== null) {
			$("#emailResult").html("").css({"backgroundColor" : "white"});
		}
	});

	$("#gender").change(function() {
		if(gender.val() !== "" || gender.val() !== null) {
			$("#genderResult").html("").css({"backgroundColor" : "white"});
		}
	});
	
	$("input:text[name='phone']").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});

	$("#phone").bind("input", function() {
		if(phoneCheck.test(phone.val()) && phone.val() !== null && phone.val() !== "") {
			$("#phoneResult").html("").css({"backgroundColor" : "white"});
		}
	});

	$("#admit").change(function() {
		if(admit === true) {
			$("#admitResult").html("").css({"backgroundColor" : "white"});
		}
	});
});