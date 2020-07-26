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
<title>임시 비밀번호로 변경됨</title>
</head>
<body>
<script>
	function copy(val) {
		var dummy = document.createElement("textarea");
		document.body.appendChild(dummy);
		dummy.value = val;
		dummy.select();
		document.execCommand("copy");
		document.body.removeChild(dummy);
	}

	window.onload = function() {
		window.alert("<%= msg %>");
		
		copy("<%= password %>");
		
		window.alert("임시 비밀번호가 클립보드에 복사되었습니다.");
		
		location.href="<%= request.getContextPath() %>/views/signIn/signIn.jsp";
	}
</script>
</body>
</html>