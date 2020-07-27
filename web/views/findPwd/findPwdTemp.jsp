<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String msg = (String)request.getAttribute("msg");
String password = (String)request.getAttribute("password");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>임시 비밀번호로 변경됨</title>
</head>
<body onload="alert();">
<input type="text" value="<%= password %>" id="temp">
<!--  style="opacity:0;" -->
<script>
	$(function() {
		window.alert("임시 비밀번호가 클립보드에 복사되었습니다.");
		
		window.alert("<%= msg %>");
		
		copy();
	});
		
	function copy() {
		$("#temp").select();
		
		document.execCommand("copy");
		
		location.href="<%= request.getContextPath() %>/views/signIn/signIn.jsp";
	}
</script>
</body>
</html>