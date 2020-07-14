var id = $("#id"); // 아이디
var pwd1= $("#pwd1"); // 비밀번호 입력
var pwd2 = $("#pwd2"); // 비밀번호 확인 입력
var name = $("#name"); // 사업자명
var juminNo = $("#juminNo"); // 주민등록번호
var enterpriseName = $("#enterpriseName"); // 매장이름
var bank = $("#bank option:selected"); // 은행
var bankAccount = $("#bankAccount"); // 계좌번호
var enterpriseNumber = $("#enterpriseNumber"); // 사업자등록번호
var address = $("#address"); // 기본 주소
var addressDetail = $("#addressDetail"); // 상세 주소
var enterpriseType = $("#enterpriseType"); // 업종
var email = $("#email"); // 이메일
var phone = $("#phone"); // 매장전화번호
var enterpriseLicensee = $("#enterpriseLicensee option:selected"); // 사업자 구분 (개인사업자 : individual / 법인사업자 : corporate)
var admit = $("#admit").prop("checked"); // 약관동의여부

var idCheck = /[a-zA-Z0-9]{4,20}/;
var passwordCheck = /[a-zA-Z0-9]{8,16}/;
var nameCheck = /[가-힣]{2,5}/;
var juminNoCheck = /\d{6} \- [1-4]\d{6}/;
var enterpriseNameCheck = /[a-zA-Z가-힣]{1,15}/;
var bankAccountCheck = /\d{12,14}/;
var enterpriseNumberCheck = /\d{10}/;
var phoneCheck = /\d{9,12}/;

function check() {
	if(id.val() === null || id.val() === "") {
		$("#idResult").html("아이디는 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#id").focus();
		return false;
	} else if(!idCheck.test(id.val())) {
		$("#idResult").html("아이디를 특수문자가 없는 4 ~ 20자 영어 대소문자와 숫자로 입력하세요.").css({"backgroundColor" : "red", "color" : "white"});
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
	
	if(juminNo.val() === null || juminNo.val() === "") {
		$("#juminNoResult").html("주민등록번호는 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#juminNo").focus();
		return false;
	} else if(!juminNoCheck.test(juminNo.val())) {
		$("#juminNoResult").html("주민등록번호를 숫자 13글자로만 입력하세요.").css({"backgroundColor" : "red", "color" : "white"});
		$("#juminNo").focus();
		return false;
	}
	
	if(enterpriseName.val() === null || enterpriseName.val() === "") {
		$("#enterpriseNameResult").html("매장이름은 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#enterpriseName").focus();
		return false;
	} else if(!enterpriseNameCheck.test(enterpriseName.val())) {
		$("#enterpriseNameResult").html("매장이름을 1 ~ 15글자 영어 대소문자와 한글로만 입력하세요.").css({"backgroundColor" : "red", "color" : "white"});
		$("#enterpriseName").focus();
		return false;
	}
	
	if(bank.val() === null || bank.val() === "") {
		$("#bankResult").html("은행을 선택해주세요.").css({"backgroundColor" : "red", "color" : "white"});
		$("#bank").focus();
		return false;
	}
	
	if(bankAccount.val() === null || bankAccount.val() === "") {
		$("#bankAccountResult").html("계좌번호는 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#bankAccount").focus();
		return false;
	} else if(!bankAccountCheck.test(bankAccount.val())) {
		$("#bankAccountResult").html("계좌번호를 12 ~ 14글자 숫자로만 입력하세요.").css({"backgroundColor" : "red", "color" : "white"});
		$("#bankAccount").focus();
		return false;
	}
	
	if(enterpriseNumber.val() === null || enterpriseNumber.val() === "") {
		$("#enterpriseNumberResult").html("사업자등록번호는 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#enterpriseNumber").focus();
		return false;
	} else if(!enterpriseNumberCheck.test(enterpriseNumber.val())) {
		$("#enterpriseNumberResult").html("사업자등록번호를 10글자 숫자로만 입력하세요.").css({"backgroundColor" : "red", "color" : "white"});
		$("#enterpriseNumber").focus();
		return false;
	}
	
	if(address.val() === null || address.val() === "" || addressDetail.val() === null || addressDetail.val() === "") {
		$("#addressResult").html("주소는 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#address").focus();
		return false;
	}
	
	if(enterpriseType.val() === null || enterpriseType.val() === "") {
		$("#enterpriseTypeResult").html("업종은 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#enterpriseType").focus();
		return false;
	}
	
	if(enterpriseLicensee.val() === null || enterpriseLicensee.val() === "") {
		$("#enterpriseLicenseeResult").html("사업자 구분을 선택해주세요.").css({"backgroundColor" : "red", "color" : "white"});
		$("#enterpriseLicensee").focus();
		return false;
	}
	
	if(email.val() === null || email.val() === "") {
		$("#emailResult").html("이메일은 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#email").focus();
		return false;
	}
	
	if(phone.val() === null || phone.val() === "") {
		$("#phoneResult").html("휴대전화 번호는 비어있을 수 없습니다.").css({"backgroundColor" : "red", "color" : "white"});
		$("#phone").focus();
		return false;
	} else if(!phoneCheck.test(phone.val())) {
		$("#phoneResult").html("휴대전화 번호를 9 ~ 12자리의 숫자로만 입력하세요.").css({"backgroundColor" : "red", "color" : "white"});
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

	$("#juminNo").bind("input", function() {
		if(juminNo.val() !== "" || juminNo.val() !== null) {
			$("#juminNoResult").html("").css({"backgroundColor" : "white"});
		}
	});
	
	$("#enterpriseName").bind("input", function() {
		if(enterpriseName.val() !== "" || enterpriseName.val() !== null) {
			$("#enterpriseNameResult").html("").css({"backgroundColor" : "white"});
		}
	});
	
	$("#bank").change(function() {
		if(bank.val() !== "" || bank.val() !== null) {
			$("#bankResult").html("").css({"backgroundColor" : "white"});
		}
	});
	
	$("input:text[name='bankAccount']").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	$("#bankAccount").bind("input", function() {
		if(bankAccount.val() !== "" || bankAccount.val() !== null) {
			$("#bankAccountResult").html("").css({"backgroundColor" : "white"});
		}
	});
	
	$("input:text[name='enterpriseNumber']").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	$("#enterpriseNumber").bind("input", function() {
		if(enterpriseNumber.val() !== "" || enterpriseNumber.val() !== null) {
			$("#enterpriseNumberResult").html("").css({"backgroundColor" : "white"});
		}
	});
	
	$("#address").bind("input", function() {
		if(address.val() !== "" || address.val() !== null) {
			$("#addressResult").html("").css({"backgroundColor" : "white"});
		}
	});
	
	$("#addressDetail").bind("input", function() {
		if(addressDetail.val() !== "" || addressDetail.val() !== null) {
			$("#addressDetailResult").html("").css({"backgroundColor" : "white"});
		}
	});
	
	$("#enterpriseType").bind("input", function() {
		if(enterpriseType.val() !== "" || enterpriseType.val() !== null) {
			$("#enterpriseTypeResult").html("").css({"backgroundColor" : "white"});
		}
	});
	
	$("#email").bind("input", function() {
		if(email.val() !== "" || email.val() !== null) {
			$("#emailResult").html("").css({"backgroundColor" : "white"});
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
	
	$("#enterpriseLicensee").change(function() {
		if(enterpriseLicensee.val() !== "" || enterpriseLicensee.val() !== null) {
			$("#enterpriseLicenseeResult").html("").css({"backgroundColor" : "white"});
		}
	});

	$("#admit").change(function() {
		if(admit === true) {
			$("#admitResult").html("").css({"backgroundColor" : "white"});
		}
	});
});