<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String msg = (String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YUMEET</title>
<link rel="shortcut icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/semiproject/images/favicon.ico" type="image/x-icon">
<style>
	.wrapper {
		width:100%;
		height:70%;
	}
	#errorArea {
		padding-top:10%;
		margin-bottom:10%;
	}
</style>
</head>
<body>

	<header>
		<%@ include file="/views/common/header.jsp"%>
	</header>
	<div class="wrapper">
		<div id="errorArea" align="center"> 
		<h3 align="center">오류 페이지입니다.</h3>
		<h1 align="center"><%=msg%></h1>
		<button>전 페이지로 돌아가기</button>
		</div>
	</div>
	<footer>
		<%@ include file="/views/common/footer.jsp"%>
	</footer>
</body>
</html>