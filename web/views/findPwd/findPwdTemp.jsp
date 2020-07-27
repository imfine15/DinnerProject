<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String msg = (String)request.getAttribute("msg");
String password = (String)request.getAttribute("password");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	.wrapper {
		width:100%;
		height:70%;
	}
	
	#errorArea {
		padding-top:10%;
		margin-bottom:10%;
	}
	
	#goMain {
		height:30px;
		width:180px;
		border:0;
		background-color:#EB7673;
		color:white;
	}
	
	#goMain:hover {
		cursor:pointer;
	}
</style>
</head>
<body>
<input type="text" value="<%= password %>" id="temp" style="opacity:0;">
	<header>
		<%@ include file="/views/common/header.jsp"%>
	</header>
	<div class="wrapper">
		<div id="errorArea" align="center">
		<h3 align="center">임시 비밀번호는 <%= password %> 입니다.</h3>
		<h1 align="center">임시 비밀번호 발급 후 즉시 비밀번호 변경을 권장합니다.</h1>
		<h3 align="center">복사하기 버튼을 클릭하면 임시 비밀번호를 자동으로 복사하고,</h3>
		<h3 align="center">자동으로 로그인 페이지로 이동합니다.</h3>
		<button id="goMain" onclick="copy();">임시 비밀번호 복사하기</button>
		</div>
	</div>
	<script>
		function copy() {
			$("#temp").select();
			document.execCommand("Copy");
			location.href="<%= request.getContextPath() %>/views/signIn/signIn.jsp";
		}
	</script>
	<footer>
		<%@ include file="/views/common/footer.jsp"%>
	</footer>
</body>
</html>