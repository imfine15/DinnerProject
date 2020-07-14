<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
p {
	font-family: 나눔스퀘어_AC;
}

#explain {
	font-weight: normal;
	font-size: 25px;
	color: #000000;
}

#sub_click {
	background: url( "/semiproject/images/pinkbutton.png" ) no-repeat;
	width: 130px;
	height: 35px;
	cursor: pointer;
	border: none;
	font-weight: normal;
	font-size: 24px;
	color: #FFFFFF;
}
.wrapper {
	margin-top:50px;
}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<div class="wrapper" align="center">
		<img src="/semiproject/images/YUMEET LOGO WITH REST.png" id="logo"
			alt="yumeet logo">
		<div style="height: 50px;"></div>
		<p id="explain">광고를 위한 상담 신청이 완료되었습니다!</p>
		<div style="height: 50px;"></div>
		<button id="sub_click" type="submit" style="color: white;">홈으로</button>
	</div>
	<div style="height:300px;"></div>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>