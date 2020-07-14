<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style>
a {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
}

a:focus {
	text-decoration: none;
}

a:hover, a:active {
	text-decoration: none;
}

.wrapper {
	width: 100%;
	height: auto;
	vertical-align: middle;
	margin-top: 10%;
	margin-bottom: 10%;
}

#box {
	width: 450px;
	height: 380px;
	background: #F3F4F6;
}

#yumeet-logo {
	width: 350px;
	height: auto;
	margin-top: 5%;
}

.login {
	height: 40px;
	width: 300px;
	background-color: transparent;
	font-size: 18px;
	font-family: Noto Sans KR;
	border: 1.2px solid #606060;
	border-top: none;
	border-right: none;
	border-left: none;
	outline: none;
}

input::placeholder {
	color: #C9C9C9;
}

#ad-pwd {
	margin-top: 15px;
}

#saveId {
	margin-right: 40px;
	margin-top: 20px;
	display: inline-block;
	margin-top: 20px;
}

#findInfo {
	display: inline-block;
}

#btn-login {
	background: url("/semiproject/images/adminLoginBtn.png" );
	width: 300px; 
	height : 40px;
	cursor: pointer;
	border: none;
}
#btnArea {
	vertical-align:middle;

}
</style>
</head>
<body>
	<div class="wrapper" align="center">
		<div id="box">
			<img src="/semiproject/images/YUMEET LOGO.png" id="yumeet-logo" alt="yumeet-logo">
			<div id="login-div">
				<form id="login-form">
					<input type="text" class="login" id="adminId" name="adminId" placeholder="관리자 아이디"><br>
					<input type="password" class="login" id="ad-pwd" name="ad-pwd" placeholder="비밀번호">
				</form>
			</div>
			<div id="saveId">
				<input type="checkbox" id="saveIdBox" value="saveId"><label>아이디 저장</label>
			</div>
			<div id="findInfo">
				<p><a href="">아이디/비밀번호 찾기</a></p>
			</div>
			<div id="btnArea">
				<button type="submit" id="btn-login"></button>
			</div>
		</div>
	</div>
</body>
</html>