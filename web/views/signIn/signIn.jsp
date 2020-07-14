<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/semiproject/views/signIn/css/signInStyle.css"/>
<title>YUMEET 로그인</title>
</head>
<body>
	<img alt="여밋 로고" src="/semiproject/images/YUMEET LOGO WITH REST.png" id="logo">
	<p id="login">로그인</p>
	<hr class="hr">
	<form action="<%= request.getContextPath() %>/signIn.me" method="post" onsubmit="return check();">
		<input type="text" name="id" id="id">
		<br>
		<input type="password" name="password" id="password">
		<br>
		<input type="checkbox" id="pwdShowHide">
		<label id="pwdLabel" for="pwdShowHide">비밀번호 보이기</label>
		<br>
		<input type="submit" value="로그인" id="submitBtn">
		<div id="idRemember">
			<input type="checkbox" name="rememberBtn" id="rememberBtn">&nbsp;&nbsp;
			<label for="rememberBtn">아이디 저장</label>
		</div>
	</form>
	<hr class="hr">
	<div id="find">
		<a id="findId" href="http://www.naver.com">아이디 찾기</a> | 
		<a id="findPassword">비밀번호 찾기</a> | 
		<a id="signUp">회원 가입</a>
	</div>
	<br><br>
	<script type="text/javascript" src="/semiproject/views/signIn/js/signInJs.js"></script>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>