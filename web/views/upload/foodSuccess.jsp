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
		<h2>새로운 식당을 등록해주셔서 감사합니다!</h2>
		<br>
		<h3>새로운 식당 인증은 3~5일 정도 소요됩니다.</h3>
		<br><br><br><br>
		<br>
		<button id="home">홈으로</button>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>