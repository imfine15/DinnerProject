<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.MemberVO"%>
<%
	MemberVO loginUser = null;

	if(session.getAttribute("loginUser") == null){
		loginUser = null;
	} else {
		loginUser = (MemberVO) session.getAttribute("loginUser");
	}
	
	
	//String realbackPage = request.setAttribute("backPage", request.getAttribute("backPage"));
	String bac1 = (String) session.getAttribute("backPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
body {
	background: white;
	 oveflow-x:hidden;
}

.container2 {
  box-shadow:0px 5px 10px 5px #DE6B6B;
}

#login, #logout {
	width:76px;
	height:35px;
	cursor:pointer;
	border:0;
	color:white;
	margin:12px;
	background-color:#EB7673;
	border-radius:5px;
	font-size:15px;
	font-family: 'Noto Sans KR', sans-serif;
}
.navbar navbar-inverse navbar-static-top {
	width:100%;
	margin:0 0 0 0 auto;
	padding:0;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="navbar navbar-inverse navbar-static-top" 
		style="background: white; border-color: pink;">
		<div class="container2" style="background: white;">
			<a href="/semiproject/views/main/main.jsp" style="margin-left: 20px;">
				<img src="/semiproject/images/YUMEET LOGO.png" style="width: 150px;">
			</a>
			<% if(loginUser == null) { %>
			<a id="dd" style="float: right; margin-right: 30px;" href="/semiproject/views/signIn/signIn.jsp">
				<button id="login">로그인</button>
			</a>
			<% } else { %>
			<button id="logout" style="float:right;" onclick="logout();">로그아웃</button>
			<a style="float: right">
				<img src="/semiproject/images/myicon.png" onclick="goMypage();" style="width: 100px; cursor:pointer;">
			</a>
			<% } %>
			<input type="hidden" value="" name="url" id="url"> 
		</div>
	</div>
	<script>
		var pag = "<%= session.getAttribute("backPage")%>";
		$("#dd").click(function(){
			location.href = "/semiproject/views/signIn/signIn.jsp";
		});
		
		function goMypage() {
			location.href="<%=request.getContextPath()%>/views/myPage/myPage.jsp";
		}
		
		function logout(){
			window.alert("로그아웃되었습니다.");
			location.href="<%=request.getContextPath()%>/logout.me";
		}
	</script>
</body>
</html>