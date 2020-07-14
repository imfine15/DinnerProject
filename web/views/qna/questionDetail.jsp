<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 ㅣ YUMEET</title>
<style>
#div-top {
	position:fixed;
	width:100%;
	height:60px;
	background-color:#D5706D;
	margin-top:0px;
	padding-top:0px;
}

body,html {
	margin-top:0px;
	margin-bottom:0px;
	margin-left:0px;
	margin-right:0px;
	resize:none;
	line-height:25px;
}
h3 {
	color:white;
	line-height:25px;
}
#div-content {
	margin:0 auto;
	width:90%;
	height:90%;
	border:0.5px solid #DDDDDD;
	background-color:F9F9F9;
}
#confirm-btn {
	width:120px;
	padding:5px;
	font-size:16px;
	background-color:#D5706D;	
	border:none;
	outline:none;
	color:white;
	height:40px;
	text-align:center;
}

#confirm-btn:hover {
	cursor:pointer;
}

#real-content{
	margin:20px;
}
label {
	color:#666666;
	font-size:14px;
}
.important-m {
	font-size:14px;
	font-weight:bold;
}
.important {
	font-size:16px;
	font-weight:bold;
}
</style>
</head>
<body>
		<div id="div-top">
			<h3>&nbsp;&nbsp;&nbsp;휴대폰번호 수집 및 이용 동의</h3>
		</div>
		<div style="height:100px"></div>
		<div id="div-content">
		<div id="real-content">
			<label style="color:red; font-weight:bolder;">(선택)</label><label class="important-m">[개인정보 수집 및 이용 동의]</label><br>
			<br>
			<label>㈜YUMEET은 다음과 같이 개인정보를 수집하고 있습니다.</label><br>
			<br>
			<label>
			수집 및 이용 목적: 답변 알림<br>
			항목: 휴대폰번호</label><br>
			<label>보유 및 이용기간:</label>
			<label class="important">수집일로부터 3년(법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관)</label><br>
			<br>
			<label>동의를 거부할 경우 답변 알림을 받을 수 없습니다.<br>
			비회원의 경우 </label><label class="important">수집일로부터 1년간 보관</label><label>됩니다.</label><br>
			<br>
			<label>※그 외의 사항 및 자동 수집 정보와 관련된 사항은 개인정보처리방침을 따릅니다.</label><br>
			</div>
		</div>
		<div id="btnarea" align="center">
		<div style="height:30px;"></div>
		<button onClick="window.close()" id="confirm-btn">확인</button>
		</div>
		<div style="height:20px"></div>
</body>
</html>