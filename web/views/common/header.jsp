<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semi.member.model.vo.MemberVO"%>
<%
	MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	//String realbackPage = request.setAttribute("backPage", request.getAttribute("backPage"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background: white;
}
.container2 {
  box-shadow:0px 5px 10px 5px #DE6B6B;
}
</style>
</head>
<body>
	<div class="navbar navbar-inverse navbar-static-top"
		style="background: white; border-color: pink;">
		<div class="container2" style="background: white;">
			<a href="">
				<img src="/semiproject/images/YUMEET LOGO.png" style="width: 200px;">
			</a>
			<a href="/semiproject/views/signIn/signIn.jsp" style="float: right">
				<img src="/semiproject/images/myicon.png" style="width: 100px;">
			</a>
			<%if(loginUser == null){ %>
			<a href="" style="float: right">
				<img src="/semiproject/images/location.png" style="width: 100px;">
			</a>
			<%} else {%>
				console.log("123");
			<%} %>
			<input type="hidden" value="" name="url" id="url"> 
		</div>
	</div>
	<script>
		var pag = "<%= session.getAttribute("backPage")%>";
		<%
		%>
	</script>
</body>
</html>