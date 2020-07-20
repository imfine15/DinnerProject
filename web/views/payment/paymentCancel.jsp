<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.box{
		margin-top: 50px;
		
	}
	#home{
		background: #666666;
 		color: #FFFFFF;
		border: 0;
		outline: 0;
		width: 120px;
		height: 30px;
		font-size: 20px;
		
	}
</style>
</head>
<body>
		<div align="center" class="box">
		<img src="/semiproject/images/YUMEET LOGO WITH REST.png">
		<br><br><br><br><br><br>
		<h2>예약 취소가 완료되었습니다.</h2>
		<br>
		
		<br><br><br><br>
		<br>
		<button id="home" onclick="home();">홈으로</button>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<%@ include file="/views/common/footer.jsp" %>
	<script>
	function home(){
		location.href="/semiproject/views/main/main.jsp";
	}
	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
		history.go(1);
		alert("만료된 페이지입니다.");
	}
	</script>
</body>
</html>